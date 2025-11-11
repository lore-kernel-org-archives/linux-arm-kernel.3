Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB7ACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hecw6SGTcbrCqUAbSZzj/G3btrpHikJf1SssivaJbCA=; b=ihtMEuUWrSuIwZZFN4e90KBipU
	R9bmI3n6L08DJC1V+sQVcyTX09JSo6WUSGuex/mHXguM21/krDaRjUqDSXfGQYMp3CZjB3h7tCQl+
	ume5/Np1HD11ccIf35xxADzvPgps3JwGNDTTVLz/OyuTOrlpm0CwaRTCaYHWqmyqpAmnWMQueTZtL
	OYdAUQPjBnZsaz3tafFfBGlHuyv+JqQBkEHR3LRy0BTAYjx3qBdaoF/5ecOyqt1+TBeebSUFN1tWN
	YNnIh+JDJj9eipV6LnDHgM4iLKm5gGWb71DkjrrIBlG2RTLJcN8gzc86IOhv19zJuNPXxSUm05YsV
	eJc6SbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItRV-00000007dUU-4827;
	Tue, 11 Nov 2025 18:50:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItRU-00000007dTx-0cNZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:50:13 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso696f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 10:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762887010; x=1763491810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hecw6SGTcbrCqUAbSZzj/G3btrpHikJf1SssivaJbCA=;
        b=TqRGg3bDA05S4YKaFvhQr26s8bDBpZyWvHe88/vO6QZoh2yIPGcyRojxwZnyFGJL3i
         cvQueoSQjgudnMoncv88PlfPmOESqJubhSANKDddjVTjQRAWpMoAp1Dx2gWYyT3huAul
         z8sASdD6DFcDblJTJEBVBvNA03UqJ7YH1VpKylKyxBIowMG1+VembWRbRpDs0EE5G1Ar
         yzrZafhU5ZxIIqmUDy49Mn8QgIy1shvjns6E5RUIUbQZJ0pu/G88rutEb4JKJqN1/EKF
         O9wNFv25zT8EEN4+TcAPn92fRs4r8pstJ9P3xoiBALtno6gXjdxcMk+RCj9Z6/Oa6Ax9
         brLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762887010; x=1763491810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hecw6SGTcbrCqUAbSZzj/G3btrpHikJf1SssivaJbCA=;
        b=cUJpn+B9oA7dZe4EuyNHP5fPBU3tWLUxxnCRBTthBD6LGmtE6njWpD357wqX0Y1Grz
         s7/sk5b5xxCfaudm7HmOnGvGPbf/wZUGt23ep94agSMscZyy3t70h1WWy1eYnqeVLTWc
         dIiRp450bAPj54ojfwPAwwPxqstYBbCroY1SsTVNXu8x5YYsXNiPLOoZY/65SYK74Zxm
         Rg1MaikjBNbg0x2SnKbQQtb0HBejGVOVhjVsI7Xb4uoVLCPvWUOhqOSJl/HMvB9QDM5R
         NiUpuQl5hHLkFQbVMmngQRAmXJLaG0ZHNbCxmLTWqy7zJOzetn0d4tozdSWr1Lv4FWwp
         yDeg==
X-Gm-Message-State: AOJu0YzEEW/Uy3IzQEzDANQQykAS2+kKHkgE1htsLg9Vf9rQd1V4fSkl
	9KKp6QKlrMxlvdOoBhg7a7Q/d5Pw5wAB/1yuhGd7IloCD4b8uEmlNAja
X-Gm-Gg: ASbGncunDQihukwGEvttb+U17rnDrUYoEnRtjb4Hu5jRZRqRlm2RD5v16bOq7+mhP/O
	DzRNp5mxOntywD569VC1B42Kt0eZetM7iU3yhY98CduULaMS6Yv3xjiIQWoVlHl9lL9c84b/w5P
	RV5Wc/1BTI9UdZCcE5Y1IhsWvST/V2ulP31GY2rCEMCYnqEmMnqcnXHpOlpVxmqE2BM9zZeh2/+
	8qrJLTpdLPfJhwH4Jr5KpczLXYX7Q3s7Yuwgo6xHt+1Cs8g4vfKK4VPAFGK2Dxet6r++gNIeWJZ
	gjvY6z0a9WV8ayHJHjgxgS1btc+fLRmBaDq2ml3cLxVTDtWiz23aDGPI9CKh35EJ4tH8szowm33
	CoJGHci9es8LNJb1ee1STvLs5dC4OQoLLMCi39oTkeapwBnYn79B4WqNZb0rYPLJxjmSCbU231t
	sDbTcspGem1BQU
X-Google-Smtp-Source: AGHT+IFSvM2CsB+t9jolqji5xVyqJeQrmqnCERVjosfYiifdGVyx1RnjwV0p/nlqbwxmejN0WMpo8w==
X-Received: by 2002:a05:6000:26d2:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42b4bd9b823mr211802f8f.40.1762887009974;
        Tue, 11 Nov 2025 10:50:09 -0800 (PST)
Received: from osama.. ([41.236.140.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm18787142f8f.0.2025.11.11.10.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 10:50:09 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] KVM: arm64:  drop sysreg init error log
Date: Tue, 11 Nov 2025 20:50:05 +0200
Message-ID: <20251111185005.12842-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_105012_215019_F988DACC 
X-CRM114-Status: UNSURE (   9.55  )
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

The failure paths inside kvm_sys_reg_table_init() already emit
excessive error messages. The additional kvm_info() in the caller
is therefore redundant, so remove it.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kvm/arm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 870953b4a8a7..af2fe3cb3356 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2844,10 +2844,8 @@ static __init int kvm_arm_init(void)
 	}
 
 	err = kvm_sys_reg_table_init();
-	if (err) {
-		kvm_info("Error initializing system register tables");
+	if (err)
 		return err;
-	}
 
 	in_hyp_mode = is_kernel_in_hyp_mode();
 
-- 
2.43.0


