Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5BEC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vm/cehq7ZbHazeTz6lyclFSjgW2pMvi5dQ4X+rlCVtE=; b=TcALGO4VzDMbswZqZhqAMW9vn5
	wmQnEKjwyIvwf2+lAvXz7JeUdWC520Isb34HnyXR5aOgNWXizxJKlsjC92f995t23keJaK5JuQ6zF
	ZT/ITttAa2zGPC8qgrHjy7yZTPY+J7/dKaotrO7NJKOwBXIeYhiGLCTEn4Z6j86LpFIrFO1dot2eb
	c+3oTq3kPBkun76hrHiCO4jZ9fOuwzm1Ru4txhnu37zhKtVRBnOtOfiEctDaoJFAfqRAO0QnP1CMh
	vBzpoy5Peksa26OOZy3LorpBSL/NFSZVXx6ejl6JwgJibyMkxJgH+9DMJgn84DNf/v9eqvYy/rGp/
	yFsXO3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLL-00000005t3A-1f6j;
	Mon, 07 Sep 2026 04:52:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RLJ-00000005t1w-0xIX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:52:30 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso2113428a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756748; x=1789361548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm/cehq7ZbHazeTz6lyclFSjgW2pMvi5dQ4X+rlCVtE=;
        b=BjtFTxjNzC7xTQlQMwKYMRGA733WFqgiZ3Bwx9x8Jegf+VqFA06RXNmO3QE9jQfNWw
         W+bOPrBMITZjSaLchOv/4ekfy40wrVsOnF55WSCeagWBrUmza0wtXLmhHPiCiO+IR8fR
         hMNlvXl7NQjeKYqlgkgvjG76WuYtw8SNbROHwry/5ZIsVTk+S56EOFq8ndNF138ODmTe
         7goeAjXAuesjc1tcUo2JUF1rosUZkWe4vfQ3YDg+ptanhgswnmTT38EjgcMecuE7KsSI
         kGieMdaALaHS380XHH67EYGPg6BZxfYpJ1z+HFdDaw9sreNdrUvFDUa+ANt01saxAdL4
         djqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756749; x=1789361549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vm/cehq7ZbHazeTz6lyclFSjgW2pMvi5dQ4X+rlCVtE=;
        b=NwMamPrkSY2LhycMpRQm5VqBuL4kdjlFHT9xji0C5yVLpBRuxiDIt8jRwEHcKgn59J
         gtuER5h1BkQuIbSRgvdqJkN5RnfIEcLAMfideJ+/q+BDq/3A+Htbz3RhHwwQRB9azAx0
         rBuzeVWhe92QKZFAPD7ypvauiXb9vo2xLOxNze3BKuq8IUyqpE6a/N9pLGKrMwPR/FkN
         VGbIbdAy61+p+pbuL/0mS/z3TjuFAXSMJN+9y69wdHUy9G8OXXE98Mj5/NUrUndPECI2
         EDQbD4WCnDWoPUEiFszbLcAhrAINy5PhJaK0S9t/KIemjHNyjxG24GrvoGoDNJDVdu+G
         ecAw==
X-Forwarded-Encrypted: i=1; AKwUvBxTAKqePzJZlHyc+b6uy8HJZaRLzLuz0QkEjjfJWvRlKGoLRWJVP6Zrn7FuNSS1BVuyMT+8ww+ahkkQ237o8n/4@lists.infradead.org
X-Gm-Message-State: AFuF++mZh0nvZ2U2kgGMl70goLu+BxJO+weq2N/I/aRUUXSs5hVG4z2M
	l/+7UdOhrJ9wY7Q/GkhNmwSVJfCBzgyhW/IQlM6zm0sXSrfG5PRfc4Ez
X-Gm-Gg: AYBFou3hUq79LBK57GPm3K19oEU4x4As8/xuNONlIf9RTuTFFa/0RgMUkIIgLofHPM8
	r1VlFFB+jbwaQipk876yHuR+aO1tDmRGsJAyA5eDGoSspz8lCKIfze3gm4ambwNPGpYug5aT40E
	JlKh0JBraHSkfdjzJBqlIr7zgUh/CWnHuWgEbMUBtkzGob7MW4c2i6n5rl+w2TQ2NLIK8MHj4eZ
	1aw6SLrqy1QAZiqx2F4QEPtmeoH7e2ikUOdR/lB63S3ra+ho0p7gcRPYQ/AGqVNzZVLBZlQ7Lsp
	CiXZ6ANksDPrwQcDojQu3iOUHbs7nosRXJbMVo89hmd5k6rBIG+lNDBQZK6GaS65eaQe4BDNxhE
	mEUwE3d3FWyhAb09KYgNiksnP8AzeMgu4cXqdg28UKGQL3k7fcS62bi4zgKfByZ0pKqDsKUqpb9
	pE2UFniGMlNfRwL+VFHsVURddUUFrmk7deqBYSb3tA4NToFhrlZTasCTkWwET/GUOK5deTyNAJ4
	1cNw+hUAzMQcA==
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr32153720a91.19.1788756748582;
        Sun, 06 Sep 2026 21:52:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:28 -0700 (PDT)
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
Subject: [PATCH v2 5/7] sparc: net: fix typo "evalute" in comment
Date: Mon,  7 Sep 2026 10:21:33 +0530
Message-ID: <20260907045135.13317-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215229_264854_5133DCEE 
X-CRM114-Status: GOOD (  12.95  )
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

Correct "evalute" to "evaluate", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sparc/net/bpf_jit_asm_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/net/bpf_jit_asm_32.S b/arch/sparc/net/bpf_jit_asm_32.S
index a2e28e0464a3..81430f065ac9 100644
--- a/arch/sparc/net/bpf_jit_asm_32.S
+++ b/arch/sparc/net/bpf_jit_asm_32.S
@@ -195,7 +195,7 @@ bpf_error:
 	/* Make the JIT program return zero.  The JIT epilogue
 	 * stores away the original %o7 into r_saved_O7.  The
 	 * normal leaf function return is to use "retl" which
-	 * would evalute to "jmpl %o7 + 8, %g0" but we want to
+	 * would evaluate to "jmpl %o7 + 8, %g0" but we want to
 	 * use the saved value thus the sequence you see here.
 	 */
 	jmpl	r_saved_O7 + 8, %g0

