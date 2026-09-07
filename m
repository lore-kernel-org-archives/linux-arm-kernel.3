Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F35AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZDdWvx8nd79EclYwIbserkqXBmdMeyV10TLzPxe1TU=; b=E0rjJ6kCQr5bQKs0t2P9ubs0pC
	02NygTrwpgAxpYg4GKg32oburXaQM5xQb5RYykuGs3jIxnAuBnCg4KrTkgZ2nBBvjFplLM/UuwmOx
	avKpJAPqVFIitFIr6mOYkKqnukmj4se9adNynXTK6RkJSyiQxIenafOP6koP8qSBeOfTVc7crNKCo
	EqKqDky7yUGrd9tk+mBYmLbB2YMP/qDehTlFGN4MFWah8yCK+Lk6wztlGf8+++52qanoJmnDaS63O
	uiOuGl1uVb+CLdHnddY/Piq+mT8pmtSmrLGdQUqdIK8DzUELDBrR9KFB+NsCWzI2+hDB5LqJCECuD
	5ymmNh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RKp-00000005soj-3hRT;
	Mon, 07 Sep 2026 04:51:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RKl-00000005sn9-1guU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:51:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-855d2bfae95so4475679b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756714; x=1789361514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZDdWvx8nd79EclYwIbserkqXBmdMeyV10TLzPxe1TU=;
        b=RVMgMylatwADXL8puEd26jYl/KHsPfWuP0TtyYYcOTolV8zl3DNagthZcAncSSx04L
         xLC6bkwc8rL2KkSZ4sb4Gsfuud+HOMSS9V/a0Nma5F1nNkNDZTqokyInvj0YylqcsjRp
         7CkYGi6KfMviI7v2hTdgg2Q8TD2MCl813rO+ophQAax75EvFt4+uIvkB1fGl7EDD3GKq
         FD8uN8bRaAg2tyCiDBEYxo2XvN3CF4CoFt6G1YwZAah5U0N3zJRhJpSBNx7xK8AiRlki
         837iee8YOdluLpjHRm3I2194yTwFrNADNz2bxWoUU0y10+r7HG2zTXFXFe1VGR2tXZfJ
         7+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756714; x=1789361514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZDdWvx8nd79EclYwIbserkqXBmdMeyV10TLzPxe1TU=;
        b=TgN9fLgF3TdSEBnt+Yw8fae3X94Paue8Rc/yBwFlBXhKaQ7lFjtRBRJAxU28kCCs4u
         TBUfxkxtdamPCajKaxNxae1tSC6E1UDQF00ALzb0ZMohVtdKWn6ePSOSnWZOPX4x1Du6
         +uSkETd7Cd5TkFV+4RlKDsfFNeBGnIxyUY3VtH/CX3UF88/Osw9DSZaIg2GfRs0/19EJ
         P3HtkpbQ6SaEMKSZ8jbnycIAVx8Yw1eEcK4tiTz60QU2CoRkdFvLMqwE0Rqgx9Gxrjt3
         KDy6HsqI4OTkT2f/kssOkAfJU0buYEd7ZNvu/kj9TTqZYG9DQcvNsttu0+uKdaNDPKVJ
         vS2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIHoXrI//zy/aAfzT+f2HrRd3rwFBqbHBdK871BTcXAHsMEO23S1WJAyEQNT/kpU/3cjrkoLLWgBuu5Pv9xWj8@lists.infradead.org
X-Gm-Message-State: AFuF++lkz8aVmMefsjSkU6PWd9g7tt7yfC7tIyCJErRzWjnSeA+/IQxf
	f0MfZvgVdfiWixYj5G+UKHjDIG/wNKCtkQeRzeDjcl7k0nzUbO5VInUo
X-Gm-Gg: AYBFou3lm1cZ0yKbh1Dqs9VAfkwX0g65Su18OfR1nGR2QnUIsSGOacMtxKK1gxvo1uG
	4lRS4z7z+PXvhyvlp0BcSzjGgm2KhHj5a+ARWqxhuGrM7qpvvVNDIWnQEU4NApPah184BZrkvUl
	Dc1ZzXTVNUsbqXzOt4WCst1ERH4FHeRfSTe7KAEoy5T+72agaNCDNU8kN+w8+Nh0Jcbpyx75HD5
	zPkhn28dIi+f/7+rsE3FTbYh1q+x++gfCyNPp59gZCeBaw4I4iUgkYeoubB4l2HQhi+rTOjEF9d
	XhsMUFLl6bKOmYCXhxNnNwrXLHdnWdp8GLDR+ZFk4LMD6YOtQKvyLZuHub0WO7hG9veHJUPL8sk
	ALlF7hM7zk+kYSxOFYrbvBP4g4Vzj/yUHTij1mrO5pz6nxdOMUMFS24hP9k2fbN5UmabJUKrrJV
	cX6Bt1tGCLYkqMrieQgU6nNnQoTwHGE2lSL5HNUVtsb9Jx8TwjszcupR157rM6aOAWPILMY7Iev
	PUPS0iYmD4/PQ==
X-Received: by 2002:a05:6a21:e082:b0:3d3:aed2:6f21 with SMTP id adf61e73a8af0-3da2160e09fmr24886058637.21.1788756714529;
        Sun, 06 Sep 2026 21:51:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:51:54 -0700 (PDT)
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
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 1/7] ARM: net: fix typo "arithmatic" in comment
Date: Mon,  7 Sep 2026 10:21:29 +0530
Message-ID: <20260907045135.13317-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215155_446239_EAE92070 
X-CRM114-Status: GOOD (  11.50  )
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

Correct "arithmatic" to "Arithmetic", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/net/bpf_jit_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 9ede81afbc50..b1c21c014c9c 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1346,7 +1346,7 @@ static inline void emit_ldsx_r(const s8 dst[], const s8 src,
 	arm_bpf_put_reg64(dst, rd, ctx);
 }
 
-/* Arithmatic Operation */
+/* Arithmetic Operation */
 static inline void emit_ar_r(const u8 rd, const u8 rt, const u8 rm,
 			     const u8 rn, struct jit_ctx *ctx, u8 op,
 			     bool is_jmp64) {

