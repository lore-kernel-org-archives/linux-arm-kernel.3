Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8AEC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gH9gg1qvejjX/sPdW+X7GvG6xfgdjVwQ/p+bz1yISpM=; b=nExn2uiBbRWVPiMvPkqhnI0+iE
	rPngqCjYLI11wASIzUHdMiPF9fdlCMcre8w9A/rPCRgCIKSZOnw/P3lLiyl6r8VIozwsUNbT2xotB
	q4Jz+6+2ZeKtBPIqmpvKJNDWR/zAw7QvoLDxaYktEFktJxemlGtZrbKABWngTj2nK6cbfKw83V1zP
	emabzaG+GlwIq5V6pXsCCW0xj4i09tehjV2MWrKaSyH1eXu7cFlhUMjQq4m4k/MG/+H5sLaMAeNsm
	Ob2jvOiRM679eix0CO5j7mgbEN8O9wm73/GotUDwb6Vy3V/r9laF4k5249/q7H0ngki91/lJSzkx6
	K8JOZkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oi5-000000086KO-1x9x;
	Tue, 08 Sep 2026 05:49:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oi3-000000086J7-1MSc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:49:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2db710396ffso5600565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846570; x=1789451370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gH9gg1qvejjX/sPdW+X7GvG6xfgdjVwQ/p+bz1yISpM=;
        b=r122c1EMil9UVtLpwn5jCbbXuItANICVGpP6wzH3c4w+F92Y6efpvbfiOksxXtKkoa
         QhHmWd1y/aGIFP/Zgs/MKvDl2bTyuutu0QBSYQSibMJ4o1l4SwM4z7r4zN74gGg6XH0w
         gxcvZ8qoFXn0MEKDkXvGbtFy3O6Lj3Ax/bBck/W8popeU8BlUQxRTVXd/xeNsB6vIn0j
         0lSn/21D02S8mLxTyRanIeWgQp9JzSwzJJ9U5cwCfzqdauBr4sWzTQcdsRafw5WqgXgO
         ljTDwrmoBZDfxPkiesItSRyX8HjBZ3CV4HlQNmMnURJEkPkCp79vo5Ymxp/6ZgkMpsce
         sphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846570; x=1789451370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gH9gg1qvejjX/sPdW+X7GvG6xfgdjVwQ/p+bz1yISpM=;
        b=g1W2tWvFT2N13N0ouY0T32kGrniUHGhzUxATCb+fuxAwFZIdedKebvmOnil+dQnR+I
         eVwiTv+/SfMybbT6riHI9HcofqZ4TqV+KgL1fTu+PwA4SeTozZhbUnQX2X4LMdMgktdu
         Yx6j03MO8oZaOcs5eFjtVJFp48s2tRBsBggxkbNiJiiKaPmejfbJYkYIdbCL3zHmEuCd
         6Hd1vRg6nElKDkk8ESZScGOoD6w7g1gzQygBgl2IA2Np1WWcVyaQMYhS/DAdDd+xbr2b
         vmkWTLr828pECuTX7GLjCVgdJRFHlqZMHzmrHueaQDJkrCjDBhdIIwSoDkbf0ZahARZB
         aarA==
X-Forwarded-Encrypted: i=1; AKwUvBybdaXCxCwWzRZoAUq0VKhapxEYgv7lXbwtQUeOaE6cA6sUTlteFWczCatjwG505NExqnZ8XUBO/wKIqcT4v4ji@lists.infradead.org
X-Gm-Message-State: AFuF++mCXrxoBMB55lC6Ek+ttnARiLl6vjYoZu/3yy5zeTw7Je2Q7fTe
	mo/MSXSsrvtmkevRVnhVodHHfeuiT/FJUh3lYBjj5MJqIeMEK4PKvq6d
X-Gm-Gg: AYBFou0d5ZZP4NDlhks4QN9MeR02XZupBat55D7cLUNk8W4sjEPzoj7Es+/U/Q6j1Ib
	5lOwQs02u01z6LozC6awXkmLNboElgGwL9yj3LkcmUPuNaHSwncVeuKRetglZ+2t+6lIUTN3A6I
	nzBLki/26sLHgygtHGvfV/6tQKwOb9AUAhIJ4f3EFU7PnTJy6cKYZkFuHovP3keCWE29bRA1nGY
	xfBY9dVn5pkBTG22eVijVQOxPV0PD2FRYmfv6ZO70Or43XxCovc3edCIbjAX3FQraXLee0Xr6Yh
	xJRVI2smPQ3oDYqIgs7PmpiJtpev2MB9LqvavYkNbCqQD+1WX4UsA3m5iqRw4/uvqvTxJwaUJQj
	qYhCQMfJvu0IqolJImPqp3AEbqMqXdguTKuDId2IMBaNpOOHvYzRvqsdMKdjfCB6kckJyAh0nVO
	xcqRsDnNTzQEEfIm6BsIRkUdMt7wMXFGc+ATCZT7JEkuVL0+5qc0qxef6LaINrZhkvcZVYKsqtI
	utsGxndS7QiyA==
X-Received: by 2002:a17:90b:28ce:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39b08799871mr33943718a91.23.1788846570489;
        Mon, 07 Sep 2026 22:49:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v4 3/7] powerpc: net: fix typo "upto" in comments
Date: Tue,  8 Sep 2026 11:18:49 +0530
Message-ID: <20260908054853.13820-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_224931_365558_C9B4721E 
X-CRM114-Status: GOOD (  11.98  )
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

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index bfdc50740da8..cf8c1b49da25 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -23,7 +23,7 @@
  *
  *		[	prev sp		] <-------------
  *		[   nv gpr save area	] 16 * 4	|
- * fp (r31) -->	[   ebpf stack space	] upto 512	|
+ * fp (r31) -->	[   ebpf stack space	] up to 512	|
  *		[     frame header	] 16		|
  * sp (r1) --->	[    stack pointer	] --------------
  */
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index fc9db691e820..8a1a00026c69 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -23,7 +23,7 @@
  * Stack layout with frame:
  * Layout when setting up our own stack frame.
  * Note: r1 at bottom, component offsets positive wrt r1.
- * Ensure the top half (upto local_tmp_var) stays consistent
+ * Ensure the top half (up to local_tmp_var) stays consistent
  * with our redzone usage.
  *
  * tail_call_info - stores tailcall count value in main program's
@@ -35,7 +35,7 @@
  *		[   nv gpr save area	] (6 * 8)	|
  *		[ addl. nv gpr save area] (12 * 8)	| <--- exception boundary/callback program
  *		[    local_tmp_var	] 24		|
- * fp (r31) -->	[   ebpf stack space	] upto 512	|
+ * fp (r31) -->	[   ebpf stack space	] up to 512	|
  *		[     frame header	] 32/112	|
  * sp (r1) --->	[    stack pointer	] --------------
  *
-- 
2.48.1


