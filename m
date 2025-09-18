Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBD7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pD1GqEfStiaojYrQnQeMsM18jIp83N4vklBUGeXEk0Y=; b=xf3ir3yEDAN5uFE8fExXQPc5S2
	pLzFY1jvH5wU9iOvn5xIouh07wfkzJ4SYjTTFi4e+hDzHo6G3Q7/sIch0a4JyEnOIlu3FP7GN8lst
	QjbaVitMUtASEwQ/mBxNcDN1pWyVk49gpS+abuvy9ZkjIoU1a6oFlVxjhKUBMZBD3FM8SNweNDwRe
	7AudjPOqCi6fKlgA+6STZHyfM0CuSoxWpbxFtBZ/xLFJMfVjSeNLUY7YBwRuLv3RDZGkKQMEM098l
	e4nFar+5VXczO0K7kvJ2eYYoowvFJ9kBUE8conp+8DRPqAsLFMsNihsat2/HsLokSORessvgzgNiz
	vudcl0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8Fc-0000000GQzc-05NQ;
	Thu, 18 Sep 2025 06:36:16 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8FW-0000000GQvk-3PO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:36:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45cb604427fso3005025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758177369; x=1758782169; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pD1GqEfStiaojYrQnQeMsM18jIp83N4vklBUGeXEk0Y=;
        b=Aefx/a60uhLPiafDcYk7Bw0rja3oh4DScSXO4dR1aHcKtJZ+nhXPSP74PQDmvgX+JB
         MHA70npeD386Fds6PVC2s3a1xWHrr0n4dQUTBZ8CGhnAUSeM7+DuCr+O/GFOL3Fo/IrA
         HVlVuvddH1C/fP9HsF9qS5eF2AMxJZ/QwEK2RpNmRNDcW3fbYr46drRpFjtVMOVYVWLF
         U9hcAjyNvufEXKPxC0NKFFIjm+iofsW0xM0C/nE4l7RcWqXYCnom1uM2HxZWU5kzqq38
         CT1vVXrSGxQIvgQbumtHOc9ypMlrx7n5cpEKhpa9vlf3g3vQ7JGBbnwrI2wgjEbDdGWw
         Dl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177369; x=1758782169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pD1GqEfStiaojYrQnQeMsM18jIp83N4vklBUGeXEk0Y=;
        b=cNsrutiP4cGXIrNFTGiP9TeMLXLX/+aKtbo3/x6O22DnJrk3Lxl8BiWzkd6a0W1Wf0
         CCt7XVJjgRe2xi+J/VW/Ei5P30IykSf+baoho2GZiXHCUvOIf/yi0Pasd9pYnfefA42u
         pzr63jTgPNIWyUGh4NKSEUrOnaUV8D0dt7bY0Dl7GPO1fCX4w8uj2+eEPz5aGXGkrj1i
         5m31Co1FRaaXSbdXSFcTdcp5wEQ9fGEKvnjc1usWCr3dFmAMs/F9a0q8Gi28kH1JUinW
         eWAg95H8lgoUcvqGPZmp5veWOoToWZgoPzi1JaHJ3JU9oetzQJBY5eRS4D+aGI1VmcUu
         DgmA==
X-Gm-Message-State: AOJu0YyHvh7Ex3Dx/AJwYkbrKiKu8WqGFwcNa3rU7WhHhwMRMW0SBM71
	XEKogiHxCmA5wpFubOHCPrvxYfD4WHz2XJvSruchmMIk3tHj0xTqStIwECh8KTOdTJLbWN0FKcy
	1uYN4v9tR+qrjye06eKu3MfMezgUcPYXtpi3JSNYJmI49gYk2Y3LcRvveM4JClCqO7niNR6dyjf
	6qHl3r1gpntcADAYZbE9rUNwOimciZlKnNKl8OMYP3KI05
X-Google-Smtp-Source: AGHT+IFBX7q+olV3TxKCMLPGDOXeRlUO54aOaLC2GWe3WCaoWqZDVDYjlTr0slmxpCXGLHTZDbGyUhSR
X-Received: from wmrn43.prod.google.com ([2002:a05:600c:502b:b0:45d:eb3b:54a0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3509:b0:45d:f817:c44c
 with SMTP id 5b1f17b1804b1-46201f8b105mr44939285e9.4.1758177368875; Wed, 17
 Sep 2025 23:36:08 -0700 (PDT)
Date: Thu, 18 Sep 2025 08:35:41 +0200
In-Reply-To: <20250918063539.2640512-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918063539.2640512-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=877; i=ardb@kernel.org;
 h=from:subject; bh=XBh8pq2KsPALfmaJFm04pRdLlOab2MUmglzVdmLzRgY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0CtusBs1FB0Ilkqf/6511vMyv3m3WTW7p2cK6mvmG7
 y7Ky/R1lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInwLWFkeLtZV0eJ14IlZdrh
 Z49bnoeq/lx+6g2z4IXFWotOFsbOT2Zk2Mr280O4kl3o6UN71aymdmzevvzOMfesD5F33m26171 7HSsA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918063539.2640512-8-ardb+git@google.com>
Subject: [PATCH 1/5] crypto/arm64: aes-ce-ccm - Avoid pointless yield of the
 NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_233610_856888_3CA8BFCD 
X-CRM114-Status: GOOD (  12.94  )
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
no need to yield it explicitly in order to prevent scheduling latency
spikes.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/aes-ce-ccm-glue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index 2d791d51891b..2eb4e76cabc3 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -114,11 +114,8 @@ static u32 ce_aes_ccm_auth_data(u8 mac[], u8 const in[], u32 abytes,
 			in += adv;
 			abytes -= adv;
 
-			if (unlikely(rem)) {
-				kernel_neon_end();
-				kernel_neon_begin();
+			if (unlikely(rem))
 				macp = 0;
-			}
 		} else {
 			u32 l = min(AES_BLOCK_SIZE - macp, abytes);
 
-- 
2.51.0.384.g4c02a37b29-goog


