Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73211C636B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 18:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KHK7FCGl4BnguL8Rj0NYb8fv6cd9/u3eM4GUsmt3U7A=; b=jm/IjFuIFznWzzI/IzV8BVZJ1T
	TchXBB3kd4b0LGcGXIfVK+N9Eo5K0BPfixhuvj+sQCbMVPab3L+wjx05hd65T5o2Lhq7KQEYA/ZWq
	c9Av5nGSUtbKWgmMcbC/dTTVFtbS+F/UIOqKJuf301Y6R/QyOMXu5cotiNW62qeOCuJNArRgToe3E
	80cZKZFVPPFhTshKoPoXsyITe8hU7fVVWFraZXZPclg7GAYDsGN9FGkV4iW66Q0K29J6YbflornZC
	sFH4cpwPO7OPkYYtvy3NGej79XEMotkESgJ64x4yJ+wG+W6nwdmOO8YlWLaFRUvGiZY7+u33vRh31
	YqvMkptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuE8I-0000000GrPx-2YSr;
	Sun, 22 Feb 2026 18:24:42 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuE8G-0000000GrPH-2yID
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 18:24:42 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3562258142fso2010174a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 10:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771784679; x=1772389479; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KHK7FCGl4BnguL8Rj0NYb8fv6cd9/u3eM4GUsmt3U7A=;
        b=GOuMQKRG9mHiVG+33ffVSMSXoi9XBFx7tlBIK/P3AXqS83o25969ieNHmqf5FOJzCj
         FPJR37EwFZGrrtNIitUoM/4Qp7ikyAscLY+Srq0wqs1pbwoodljenrmyolI4UslbRkkX
         AcSxdL/+7af3noXTpbjnVuccYPNXCBBypfefCHCqvBbHp1pqE0Ell3pL9L91vMV6S02v
         4rid7goUFQsySAWeCAr8Bo4aGBPoDM+43vWke5x08oODPtgxaYflGdizwCVg6NasbK4I
         HQBHmPf++0uzoyBG0IE/EypayGIOZ9S5am+D6hi8PRaxjSyyqCbWjpD1o/yYNLiMQeBd
         dbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771784679; x=1772389479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHK7FCGl4BnguL8Rj0NYb8fv6cd9/u3eM4GUsmt3U7A=;
        b=i78xHGSQeSudkedy8obcNzXsdiWvglC8kdmJp10DuhXLCpLT+HPT7QYv8zLSHLd8Zs
         3SyKmRB5FqNHq639AmjBjVppq7gDdclDnkD54YjVbWseHhOMeMswbcg9IvMmCcPv+sXt
         gRg0TtGxBzbn+azrPcYTW9Ue0pPPnupzCceiPKBatl1oeBDxqJgQRhNByvzOwuZ9lwjl
         SFwqeoYIqZKsC103Rm+gclKR3ISAQXrodYUwvUFtwi18T5RzhPQhEoFn+plFHSEC0Qto
         ECXIogiYrd4trcLTS9ByuLJsuewyuZi3pIhOwSm81AoWHsrUKhPT/s8aNaKzgjfTlH1P
         PN/A==
X-Forwarded-Encrypted: i=1; AJvYcCUixHtxUr3IuW8SbrNAV2u/Ox2IFxhiF77Jx5pqI0Ymx7OyVtnyCtXNv0hO4vMKu10kRHHIL57EyD6ZvtfCpRIo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyez7jB03TFhD8BC+qxe4RClTnpnfAaVuIiNaDWgWUKrB5Fqjbj
	n7VMNXaVT5ueKBZIjudwvHFzI/JMgstwH0Fm6xQmU6p+q3GEwA0oDS8i
X-Gm-Gg: AZuq6aI5ndCcmBvtNpOtyATdofH97gA57eDJUDgn8WEUa+jXrK3yGe+Vk05ts134W0Z
	cXKaVtjvgoAZ8nLwSH9Re3mNhUW/BJHPZZhd0A4ph1WJp4VpY+0aN5UDW9o8cRm/44mYOcbppE9
	XNdPs4UP2Z1NVf/L3I48TTqJdWQ8svyFDxzOessacrieWivqEfbUfJhVgHdxErWu+qV4xRtYki8
	5B+n6oL1aENEeeLuyUsDiUm25i2eq4+vLAh4F9cqlGLo6WMpyJDEPJyH4pY5j1tSmXRiPntf3ne
	c/QTq3XydxZvOgB/TAA3pFZ1WLOilpm48+6ool2QHRsMXldTpSynunmPuFFkRxlbL07XuJvwFnk
	gJqOFvA5R30gv8qkYIY06N581fP9+Y3Cl98z/L8NSs57od68qRa0qdF9KZJ+s6hFMHzANNi3qZC
	DpR+L0ovcIAGEl0Q7n3uQgkTrjTUeOBNXVag==
X-Received: by 2002:a17:90b:3ccd:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-358ae7c960cmr4676492a91.5.1771784679131;
        Sun, 22 Feb 2026 10:24:39 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:1:8bf1:8197:6d5f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d8e3edcsm8393549a91.13.2026.02.22.10.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 10:24:38 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Feb 2026 02:24:34 +0800
Subject: [PATCH] regulator: mt6363: Fix incorrect and redundant IRQ
 disposal in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-mt6363-v1-1-c99a2e8ac621@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOFJm2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3dwSM2MzY10Dg+RkEwOzREPD1GQloOKCotS0zAqwQdGxtbUAcyt
 9CFgAAAA=
X-Change-ID: 20260223-mt6363-00cc406a11ec
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771784676; l=1500;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=i93NP6QYfj+ybZpEhaphKCnCCgbg1xiHxnblnb3wK/A=;
 b=Z2IFGz9lFdw34b1ycUw1uJQ1YaF0x1uytXWzC5R46Rdq8PrLz81oxaOdnmTI1gqQ/CGZhh070
 +hS2pHn0F53CP/TCOHaGHDBRonIlYjShXyrnVxPJyTD8F5tCYAWoR8K
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_102440_821873_87A564DB 
X-CRM114-Status: GOOD (  12.92  )
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

In mt6363_regulator_probe(), devm_add_action_or_reset() is used to
automatically dispose of the IRQ mapping if the probe fails or the
device is removed.

The manual call to irq_dispose_mapping() in the error path was redundant
as the reset action already triggers mt6363_irq_remove(). Furthermore,
the manual call incorrectly passed the hardware IRQ number (info->hwirq)
instead of the virtual IRQ mapping (info->virq).

Remove the redundant and incorrect manual disposal.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index 03af5fa53600..0aebcbda0a19 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -899,10 +899,8 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 					     "Failed to map IRQ%d\n", info->hwirq);
 
 		ret = devm_add_action_or_reset(dev, mt6363_irq_remove, &info->virq);
-		if (ret) {
-			irq_dispose_mapping(info->hwirq);
+		if (ret)
 			return ret;
-		}
 
 		config.driver_data = info;
 		INIT_DELAYED_WORK(&info->oc_work, mt6363_oc_irq_enable_work);

---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-mt6363-00cc406a11ec

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


