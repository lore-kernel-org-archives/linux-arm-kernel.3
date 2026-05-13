Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCD7CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MAUm05/737IqhRNlo9FHhqv1K5HUvIKv2GcQLIvOcf0=; b=lNQ0Sbopmyto7HXZFhj/OF2/Jb
	imOFTLHjOYLQ5tyH6ysyBSP0a1xOVszfciOwa/VdmWX219teL4TBAmKgHRAY0RCPY3t2PTzgay+b+
	2X5rfBxeKKCRIC93DGVq/EPGnlQDOJgM6q3I22bYQvJDhNIixII7UsEV7M3bwpE9AXr26S/qYsZr2
	JLRveNYoHJA0iDbcQwHDyyzqCs+MCFXDgo2V5wFSHh4MpiLcWux7m8VaIK6AW3COZQac9g9WnR9yN
	YyqIaOFfqlKd+4xDWhcUkkEF6KqCHcg8qACNzoKq1kMekunLkUci3OiLue2x1IRuZZr0dEfGXTngl
	4kxwnnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3ke-00000001WmL-0CuV;
	Wed, 13 May 2026 07:11:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3kb-00000001Wll-0QnR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 07:11:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bcd3ac3307so17239855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656283; x=1779261083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAUm05/737IqhRNlo9FHhqv1K5HUvIKv2GcQLIvOcf0=;
        b=lPYepQqTVP/cYey6ZsGRt0kzzZRWYZfB5eBaiYeSk2CNvghvMyLv8HeUgMImLqg5j7
         oScZtvarRKxBtnzcma1pAeCopF1Z5If90CGvxvyOvZIa6fgdNxmmvM0fsPwStXsiQf/Q
         bovYewUnUmJAiiXedALO3lMlqh5cDP7Uo2jP5hcGGzC1nPYIPmOSOuPam7ICy/4aQCMo
         7DxT+G6jKuRNxRlEMwSmwKgodEnstMi576JfFjeaVPa+oWT+MKh9EMKqhQWfSfHGovQE
         0kQ+4Lkj40sJtO+kkOI+Q+O3gE/Om0CktEJnnOfykCJ14+UX+uzE+hUjMY0Ms5or3pvv
         qXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656283; x=1779261083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAUm05/737IqhRNlo9FHhqv1K5HUvIKv2GcQLIvOcf0=;
        b=lmFGFvDGJ8uM6wuI4RbsiVX1D452+PgO8qVQ8vfrfGY86DG/Ev8Uqxipih9YQQcfOS
         1SiFGhs4/1J2YA+O+jC3At/SaKr8erKALmI0mJIxM9e/fRRaNoVA6SRzzuUDHMifEYKI
         jxX1tL5i3Gah72Bxb7Bh/wNEYupIISeht2HbFArAWk+NEtcI19cLXWf+UvnCfg9OJbp/
         Rd2Rx9q/lmvN/Uq1DdXJmIOQhrt6TGglPMkRaFpkJ0H7/kh25P9ZKlVontQ/Y0KbpLjV
         0CUMGpPesFN6bz884GLjKmCpC6h1Am0xNbV94NvKertY9z/0akKJ3dPw4WheghD9nk47
         QDtg==
X-Forwarded-Encrypted: i=1; AFNElJ/UdQFG1POFDdq2kEVliu2DV80gNaOd1/G0Vr5CioAflevSrYtH7OX+KKgQ7WI9dpCPwt0w5P1e7oofUNIqcZ1j@lists.infradead.org
X-Gm-Message-State: AOJu0YxivgpmvDmubIa+7aW/N+8jCabYymHnl3uhFbPk1r+EtyKRZROz
	5yVBHIfmQmIKIDGFVBq2DxtvzCOYK3EUGUONHlX0zfON9l4bhredn2U=
X-Gm-Gg: Acq92OFF8ul0tfmv9SXfLFq0cg4EBPJTizfE54qIaspHKXIP3gUgQ0wKJUZzWmz6hCA
	nve+Gz8BOOENkbY2uqek4+1knGhhv9bI1l0/+IsYuuHKtshXZd52Yw+0mbDt9ZQ/yQt+ob5vb2x
	/H4cxdaZp8IQz8bENcKUfEvgLsUus+N3JxXNf2+sl5mplhWQB8sNxOGFNglUP/re3qQ+6/snUpb
	9rhruzaO7wzgh8vX1MjS5PSw/9utbgJgfFUsuX5OD5i2ntkg5DFucWPLQPcmMVpG3F0+FT9uJxZ
	5pkuTb9ys/XmgcWSqyt6DI6FLBXEo7iuuWcYN0VIwKKVL/Tc/BoftlDy7wAKx/YXQTi6bvEHCGX
	pqjK2kCTDMuFNwCVCelTUpF0yupvRYQpZT5R7/cnzBW6ZQacSBARieEY7Wnpn55wPBxUCyn6z6u
	RxWARwvDK6leYct8UUvOc4BvKC58pXviX6Rmhy//0nywPhMtUgy/udl45ZtFo1ZbGijX0P7gnO/
	X0WxtB+Vu1z1+Fdp+icA0saylIPDpUDRpnzs3Q=
X-Received: by 2002:a17:903:1448:b0:2bd:2458:50d4 with SMTP id d9443c01a7336-2bd27706be2mr20525425ad.41.1778656282606;
        Wed, 13 May 2026 00:11:22 -0700 (PDT)
Received: from localhost.localdomain ([211.198.234.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405efsm165677855ad.23.2026.05.13.00.11.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 May 2026 00:11:22 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: rc: sunxi-cir: unregister rc device on probe failure
Date: Wed, 13 May 2026 16:11:03 +0900
Message-ID: <20260424000000.558-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_001125_142255_EB999055 
X-CRM114-Status: GOOD (  13.81  )
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

From: Myeonghun Pak <mhun512@gmail.com>

After rc_register_device() succeeds, later probe failures must undo the
registration with rc_unregister_device(). The current error path jumps to
the allocation cleanup label and only calls rc_free_device(), leaving the
rc device registration and resources created by rc_register_device()
behind.

Add a registered-device unwind label for the IRQ lookup, IRQ request, and
hardware initialization failure paths. Keep rc_free_device() for failures
before rc_register_device() succeeds.

Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 92ef4e7c6f..cc64a68dfe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -344,22 +344,26 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->irq = platform_get_irq(pdev, 0);
 	if (ir->irq < 0) {
 		ret = ir->irq;
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 	}
 
 	ret = devm_request_irq(dev, ir->irq, sunxi_ir_irq, 0, SUNXI_IR_DEV, ir);
 	if (ret) {
 		dev_err(dev, "failed request irq\n");
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 	}
 
 	ret = sunxi_ir_hw_init(dev);
 	if (ret)
-		goto exit_free_dev;
+		goto exit_unregister_dev;
 
 	dev_info(dev, "initialized sunXi IR driver\n");
 	return 0;
 
+exit_unregister_dev:
+	rc_unregister_device(ir->rc);
+	return ret;
+
 exit_free_dev:
 	rc_free_device(ir->rc);
 
-- 
2.50.1

