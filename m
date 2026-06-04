Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39345CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTr9hq1BbZUfbwxQS4V0l0z3LqJ94HV11h9J+XL5gnk=; b=cs31yMHJEZm3Z/uatw4i7mymdH
	s8VF6VDfLiLbfsEAFoaL1woQ/8NmHCsFyvHSOGfWdN75VZfO5wczPlUHCcJtRoKqbrU21VnEsIPzS
	zdzFeKdxUhM+oUs97ax36MYG65f4jhiPsRN9+VNEo9IA85J6QOPITmhnA9KUMyFK4wGzC4YWn6UU5
	U0UnvbLSJPX8v2qHcmixHdkVFGnShebJdTQdotszSlVQ2RhXG9X92P6j7RuuoZumqwnD0qWEcvL0D
	/KH37fZjzavOKkQKY7fdFUYGAEvUrggIzoSHhMt+pzL9H3jGn4DlSyyjBkKhbNagcWKQITPGlv/8h
	gU8brwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEad-0000000HGRX-3JrB;
	Thu, 04 Jun 2026 20:22:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaW-0000000HGKV-1fBf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:22:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E7DD01A080B;
	Thu,  4 Jun 2026 20:22:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4A095FED1;
	Thu,  4 Jun 2026 20:22:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32563106A1D38;
	Thu,  4 Jun 2026 22:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780604565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DTr9hq1BbZUfbwxQS4V0l0z3LqJ94HV11h9J+XL5gnk=;
	b=lmS+wAdJ/wDhwTxbEY48mzvs+wfgGH2aqa3uTHEsoYk4+egErzEzcHPpjH1AVPDeMz4PEz
	Db/xZC5zJYGBVAV0aWWRrcOLTCtc/aEVY57usTmqwcILSZ/aqEU53ASKhDyym4CIWnp3fq
	1jyG9sD8p66txJBpYiTxH8hQrKMerm3GDYqyhSjDEAgPA2E7zbfS1fc4KAzkgSltxokMg/
	sRJ4+DvgRTdpPca7SQHE4Y6Fdq1wp9YxrWJqzwNCEQx7fG5SJBeTfKl+1wpdQX+pHYuTSS
	W2LQNIWE80zVDuTAjqn1ibyFMKtbXwmxrxnFwSBpDBIalksKWwHjoLv/cJ3L0A==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:04 +0200
Subject: [PATCH bpf-next v2 6/8] bpf, x86: enable KASAN for JITed programs
 on x86
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-kasan-v2-6-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_132248_572699_C620FD67 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Mark x86 as supporting KASAN checks in JITed programs so that the
corresponding JIT compiler inserts checks on the translated
instructions.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..cc140108b74c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -235,6 +235,7 @@ config X86
 	select HAVE_SAMPLE_FTRACE_DIRECT	if X86_64
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if X86_64
 	select HAVE_EBPF_JIT
+	select HAVE_EBPF_JIT_KASAN		if X86_64
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_EISA			if X86_32
 	select HAVE_EXIT_THREAD

-- 
2.54.0


