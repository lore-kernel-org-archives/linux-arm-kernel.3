Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28D9CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9XPXiALrIFv+t8yA8FOCyMwqSyC0AWzcr+6NOSN1Gk=; b=wKfYMr2cYSFGSL1IipDmxqC4eB
	1PS/C/iCzp0HvVjPcTDGwN/Pab4eBh3Y5z0lL2s9m7NlGpbnl/0aP0ier1UfNprSfW+ymGO6WdpMo
	1dlsqY+BtTyO7H5NfcrIGhK09SOp/czSZfDeXjd/Ts9Tky5YySHxMYDeELOgZtK49V2RsQ7Z46rBW
	vxSk1i09lMZxXfDqwqSvH9IfHWj/3mbqTkxQzInsFhgwF3TMJOqOz1ZTzqWD+tUMcWGq4do076pQq
	z/mRLFolMQy4NBtBne9UlzkJpXwp+Iv9PY/0a8LYDFwYW7UfEPZL0WXZoKSPSXG5PicjKsUOvD5pv
	GgSx+sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zc-00000008z4x-1ZnO;
	Wed, 01 Oct 2025 21:04:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43za-00000008z0j-0caX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T9XPXiALrIFv+t8yA8FOCyMwqSyC0AWzcr+6NOSN1Gk=; b=THUjLqN/JkTGaW4/npBhSqaNqh
	cAn5934+YilTkb35tOgUHkbPBdiUb3pO0Pe0wra1+BXcHic+VeIBo8gB7WzJV8zlxbeYGkXSKK/MA
	hyanu3ukM3XoX5ZewmBelaXM4kKvnB7Pvt2c6pr4V5fVgjLBrD75gJhojTlbM7M6QvASXC+KVSf8u
	9mdHJteoogwtVFUlQ743boG46MBSLHZ5jFfNo7U2P0H0iG25r/p0XtuFhhJKzieqFkMgu/AObK0VK
	PiaozSLSWpl20uIJF3SH5l14thH4aEnNUx/I1OAYbbnNI8etAFtqAOEu4MScANZKCxYEzBBFP3Wd2
	wAvfLnbw==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zV-0000000DoPI-2wnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e44b9779eso862415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352639; x=1759957439; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T9XPXiALrIFv+t8yA8FOCyMwqSyC0AWzcr+6NOSN1Gk=;
        b=H2cCQIjOtpfY942CGffSPEW5sfAtsXBdwHnPB9aMJkU7qOvkNCdrWWrVWfjPox13Ib
         Iu2jOnm8fnICENN28QWDwVO7vArbrhke7XIH2YBYURVuUr/KvjQUExm4Azo5/ynV/mbG
         5poIv7ZElDlCBi8CRbIZHPqJ2tnlIQd9nnnU/xDQ2PYsE0o1u69Yqez9jD64TKWPOrrg
         b4NwjgEMgrT1SCZS4wVjZA49ZF1i1WJL4zGLTEtFDkmNyQzwZzYJPJCPleKmzCARdHOb
         gcqJHJ7dKzhn2I8eLfgoidEg81N49nig1y7gSUV7R/Dq8YCucje4du8+Mb6p3UhrwX79
         A6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352639; x=1759957439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9XPXiALrIFv+t8yA8FOCyMwqSyC0AWzcr+6NOSN1Gk=;
        b=cyU+IM70jjo4lpNnt00kjhcN25aWX2D19wXerOCWI8W6WlEFUXJkmJijW+et0vBskb
         wH/292esax1V4qRS+cm3oYsXJv4BvwB9o2tCJFy4H7v/ZeFtsHUc111fO3stEB/93FQZ
         5C2jhTHQPiXBCGVfdFDuTmm5eNQRkj4yGQ5Mc9DXpz1Y9vc9HJj+RmXss17ynT3xdQul
         WetjYZG5ciBs1Qhn5ETSiZbklgwZ0L4Z5ahYoZY1ZG8ocl6LpP+0GauaCMG+iBa4D4Z3
         XDQXlmxCI1pKF2JzpwlJ/x2sw1rSjZxsrocPRV5PbhULYdd2Uu+uiONI46G7rq7jSuHv
         Bd3g==
X-Gm-Message-State: AOJu0YzgI1p1Jv7DXbAMMK+UhytjPiZM9cstq/e6vlIT3HSdYPWxAbJL
	wOO3EXMAxJcbNdB+fe+3Iqjy26gcoCNhQXDFnizZKDcMmT9lef+g+xn4v0FxcVac46npH2dqxan
	lgKZgy0vq4DKL0m1NZEEq8bkcTyib93C3baByPZvayOWMTkLGr5eJfAxvSrBMD9ji+EtUdj7DkR
	qIvh1eJMurJWzGq0MlYwxa9U4tAQZa3IancuWUZroF2DCj
X-Google-Smtp-Source: AGHT+IHiZKFz0FRSgxw7esbxI8PZwcXr45UkMRXq0q8oyZAHd/2cmjG7u/BqIWintM4Gmbm+ulYQB/Ip
X-Received: from wmcu7.prod.google.com ([2002:a7b:c047:0:b0:46e:3190:9ce])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b85:b0:46e:41b0:f0cb
 with SMTP id 5b1f17b1804b1-46e612cb765mr41091005e9.25.1759352639460; Wed, 01
 Oct 2025 14:03:59 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:09 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=ardb@kernel.org;
 h=from:subject; bh=zYFiNr/eldWQX1gt5iI0fKjxqDInIe25UpxzRqLUttk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutBe85rrrjE9313UZy3CfWrLq8sGllfGsK2ovnFXc6
 m3AqyzXUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZS0MTI0Hh27bH1f5+ka1/h
 3LiIW9F7bdJDrp8Tcy4K3tTZdLVb6g3DP43ZXL/X7Ix7b1m3Nfm/Y/5h3sZDi0KXCneJHVugbyP CygsA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-29-ardb+git@google.com>
Subject: [PATCH v2 07/20] crypto/arm64: sm4-ce-ccm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_220402_023128_F18715C2 
X-CRM114-Status: GOOD (  15.68  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Kernel mode NEON sections are now preemptible on arm64, and so there is
no need to yield it when calling APIs that may sleep.

Also, move the calls to kernel_neon_end() to the same scope as
kernel_neon_begin(). This is needed for a subsequent change where a
stack buffer is allocated transparently and passed to
kernel_neon_begin().

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/sm4-ce-ccm-glue.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-ccm-glue.c b/arch/arm64/crypto/sm4-ce-ccm-glue.c
index e9cc1c1364ec..f9771ab2a05f 100644
--- a/arch/arm64/crypto/sm4-ce-ccm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-ccm-glue.c
@@ -179,11 +179,7 @@ static int ccm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 				 walk->src.virt.addr, walk->iv,
 				 walk->nbytes - tail, mac);
 
-		kernel_neon_end();
-
 		err = skcipher_walk_done(walk, tail);
-
-		kernel_neon_begin();
 	}
 
 	if (walk->nbytes) {
@@ -193,15 +189,13 @@ static int ccm_crypt(struct aead_request *req, struct skcipher_walk *walk,
 
 		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
 
-		kernel_neon_end();
-
 		err = skcipher_walk_done(walk, 0);
 	} else {
 		sm4_ce_ccm_final(rkey_enc, ctr0, mac);
-
-		kernel_neon_end();
 	}
 
+	kernel_neon_end();
+
 	return err;
 }
 
-- 
2.51.0.618.g983fd99d29-goog


