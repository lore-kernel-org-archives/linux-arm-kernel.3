Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8486C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inEAHAT4FZx62nofTUdSreIh00cPh6gTjTfAeZvFyf4=; b=zcT8ifl3Eo13w3fnkyZy9TapCK
	RLaA4gk4uGajqdaT0aBu/2yUFArljRFfUi+KshshdlK7MFlwozJKI1Rs98SRKixitBbqM1GpTIhUS
	NOClASJhvD0TdNpjdkoO/dneZbRHesAMVbx1RnrX/fhNDsO0c/CK/E6c0QRq4zUvXpyKbS9gt7QIs
	NDBCW03mhyuRJWoBXw6nbIO1DBfl+KqrdLv4tLup3pNGmFg85iTd1A113JZSlIMhn+6+uuV/BO8aV
	J2FongyHbO9i3EtrNJEenQNK8eoZZMl8ufwTvgfizZTdNrZ2uklDDAuyyIRWiX2xRc2c71DLWpZ7e
	VqkE0Blw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRX-0000000Eud9-2iR5;
	Thu, 23 Jul 2026 18:46:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmyRV-0000000EucY-1xqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:46:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cee9b74ee1so8267105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 11:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832409; x=1785437209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inEAHAT4FZx62nofTUdSreIh00cPh6gTjTfAeZvFyf4=;
        b=Z0nX1dYdfaggQUvdnnaNEpuRFRNz+0ElP1z/+oSe1otZE/RJf4PlITb7+fAqYmRuea
         FJMEqKIpGSTio4itTE1JgLM+MIwqUBofD9yn6wotzzDcZYuETKFncevwtNt4PjwhFJkq
         shnHZqJHAiTtS5oVxCUm/6B2EugZFDqttqPIxsKaYe+R5JJuC9kmneWWI9p0UHkhH8iJ
         OfPaLaS/tS/YCrmnzA6uxHK+vIGRP/myAiSBKfk6kfJzEZWZ8W6BPxL2tN6z24YD2CPn
         E06aOf4kf55mRuK76gfQB0PgPf52B+73x7+IsqOCMBvZbj8Kl5hYUdBvY1ROmJnY+scU
         PPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832409; x=1785437209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inEAHAT4FZx62nofTUdSreIh00cPh6gTjTfAeZvFyf4=;
        b=Mc/9QrAlkkWnpt67k/h4EXjzFYkNtKEoGwyKjLj7f9itTlUjKM9072UWt4BwyTJFcx
         vpKXdVaoNZKCLujIdfk+X0PfXasGVtruf5eGTzuM6BERtGbYn5by/h53jZe3dCmt7smB
         LY9GPMBPnxp+PKa+nI1Wp87vLF0/wyuRCdronO+NqxoWREhGzXdS9QpifcTkXhgyLUC7
         baEiJVZIu/WhhKX+6Q+3i98yrXs51YiXWGhPTys7Hhi1XWhmobbA47YzurK3CbqltEQe
         lpvJvUCptPi9Akl+2RAJXX12fXFMZFye+3Mcb+jGfn+j5NRYG8XMobBaq6Q4uWe++TT+
         f6MA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1HuUsmx4lpVxjb29whp92z0fwoyYVLVBZ2bJYtda95jwDeQKewfOu/rn4K999bVGLzfTV0otsbU725dPesYpb@lists.infradead.org
X-Gm-Message-State: AOJu0YwabLDTXbPDY2Ab4VPNtJfJ02GEZ+PXh9L3ZMalgX3AMAVHMMQj
	UyKBLVshHU1O2FEztTUycyb1jAw0UonCLNzoK7QMxmDv1DqeiOVSaZj7
X-Gm-Gg: AR+sD1027I0jYT6+qopldcqwFQTgyetrKETUdH4526b+xoW17l8CSEH9apTQJtiywaH
	bqrqn/fjTVaaXSMVAlJHED76nnH9X0Uu7pi7H4ciCs/xtmq+5xgR0jLoyNNhUgOMc13wFPv9sgE
	23D48pFjvjwnPzXqaD0q+lRxZMV161EHoA+2Os66QQdO3ocK9xmQR8PwO/e7fOjaDGXx7/NL0TA
	sPKoG2xKB3fgP6AnCu2iiFoxrgO/v96XEHUVMM11E779aQ2CPAedIeJ3OiKKKZtkEuA0xBICh21
	am+hdtK3XP9J0KS81JPkhPyjErKSMh0T+5Qm/JFQfL0B2vE3JxbeC3dm3+87A5iR85WzqbNP10T
	ULrq3TOOpgP9G4GmXRkJUdSYte4tiuwVobMaPI2XP1oQlLhdyJHtxjbQkbh+o/1/xmrkZDfd4
X-Received: by 2002:a17:90b:5603:b0:38e:7eb:d07b with SMTP id 98e67ed59e1d1-38ec6622023mr4815354a91.34.1784832408660;
        Thu, 23 Jul 2026 11:46:48 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:48 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: cocci@inria.fr,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/36] dmaengine: qcom_hidma: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:21 +0900
Message-ID: <20260723184538.3888637-20-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_114649_575224_CDC7A095 
X-CRM114-Status: GOOD (  10.88  )
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

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/dma/qcom/hidma_ll.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index 53244e0e34a3..f081aa787f0c 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -677,11 +677,7 @@ int hidma_ll_setup(struct hidma_lldev *lldev)
 	/* configure interrupts */
 	hidma_ll_setup_irq(lldev, lldev->msi_support);
 
-	rc = hidma_ll_enable(lldev);
-	if (rc)
-		return rc;
-
-	return rc;
+	return hidma_ll_enable(lldev);
 }
 
 void hidma_ll_setup_irq(struct hidma_lldev *lldev, bool msi)
-- 
2.43.0


