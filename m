Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAB3F5A8C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=m0icWMvR/i/AMtiYwdWn5fKlyY
	xx/g8XUd3+HxLTizI5//GD4J5IuKFA744hXK5qweeGyR5f2HRw2t5y1qjJBKSrjcQgYhtT9vpXa6m
	HefWkiMDDFGzIV30Hlm53PRq2mTKULxQBh2H7urhKHXGY5Vj2kp7CDvfJPfGdtQUqOyp67PwPaJuu
	why550J1PS1j/+UbWH28IC9zQyDK6EHf5qA10FFoCnAO2uO9ud8pTindIcwlhGlqLLD5CTc38Wt/O
	UFwmYyv+G448ecp9lP4XCbKd0V3MBheZImpETsjQ0Wes2J9IoGD35TMawr5QspYkSJn8LBFvBceMI
	LNKpZYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwKe-00000007kPK-1o1X;
	Mon, 20 Apr 2026 21:39:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwKc-00000007kNr-0cBz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=bDcm2vC2z0+Aey9NxaUtweBUKZ
	MdR+FywaOlK0TgY8yQoTcLIVlXCblf4ZcFG6Qw7W1G8YJaCaz9rujo778Pv9m1lQE1tmV3V2G2696
	Na7qHc/srlUYq30QgmKJumsXU/aLq41TcK+73E8YF3ne3ppJLAe/8I+kKUWcgNDrW7bO22qwoureT
	UonmHCSTEBqU/xOjUD4glus9Eamtr6Gozz4baSG8GFL02dZ9fXdmlpon/1jrMQqXIiFmDYexJnGHz
	VnSHPdx0lguZ2ME5n9h1Fmyagaj+/DH/+W/X7WDDc+d++P+K2dhnbiA6Hbo/IRoaxB0ex8WgoY4N4
	/OxKxAfw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEwKM-00000008rig-19Pn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:39:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so2379242f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776721124; x=1777325924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=ZDJ1F92dydHpDVNtO0OEr13F/gxMWlzNWGx54KjqWqDZ+mYyJ8VRszjaARaetiwB1w
         3MzufJkrE9y7ljYT51m3KlgTaH4+NOWNmSGBcdn2gz9fkclwyCoEP1WDQqe1YfOzdK+E
         zb76SAUQFxlKL+aGAdJLw5RwQCKCLMIyUDnUhDIjmfT8xqybHTCJFFlyi3Oi60m52ZJt
         Lq6eo9UKjmq+gkXJmTUQmJXys+N/vOcB0sJZ08zT7drbyWIVje7ChCdA50CznoGdCroX
         smy4u0Dgi9LMhB7ssCE0JMNTiMFcE+g3/iygWRiOKpGbZbTHUyA4pD36UZRyP57Rxuoa
         S8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776721124; x=1777325924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=q2Ic1PLll5bZLOQwDFOuI0zdaz2+kQMMwDitCbtzrVoJGnkh/bGJ4dS8XqNXCwKeQy
         BnGCtLkBSR4WO3M+HUTzwDTiBec1TwndtvQGMAbpIZpobafJbbPBr9g/o5Zr0iPn5RKK
         Gbu/W40ytsjzyVBbGD9xGAYBiyj0DZDBHWuldRzEkj8Alz2Bq4R/q+jw/xNi0P4gK/Sm
         qxfZ9cSUx7a8eVlLMDnz5iPqKJE4m42BAsEW6rHxZS9BUxUP+VNUms77IKUXlfWc9ACi
         PyB77Q9WWJded2JL2xv5gDhI3WJoJr0e4tpXUDFDl27d9PAQUQZk442v0qbXjkPgPRyx
         Tw4w==
X-Forwarded-Encrypted: i=1; AFNElJ+CQfFT/1FqhJuUtAvCC16q9vWQxyJ/yxvtCDslnLMyU4yD2RJ6m3vD2sC52og/NteIXHBf98O+av/BSHLCtxAN@lists.infradead.org
X-Gm-Message-State: AOJu0YwactTl1btBqf3p2Dp9nQWP9d1IDvuvlxweV6QoaRps7YnCyz1q
	1udfV77zPGeq0yZiIWktZatvMeCAwwrukOq2nFF2sU3OI5TG1nfnPk8l
X-Gm-Gg: AeBDievYWd/cFYNa03rdtDPBHTQi31MHHTUCblkEMSlu6tx+HxrG/z6vvSgPE2MvUR1
	Q3Jil29b3gOOmm3PJFtf12L06AB6HeEm/oHJkeH09RuedbsovpG3mRZMatah7u2cho2eIKMmrcE
	VT5ZZ3FciBNqsjWxW9Um+7MWaT84Bz/F3FtJCwMQF7G1kKYYQycIsG6S0q22bLuMvdPnRLcRXoE
	5ZOfa8RYkvojXmpaPwPVkPZcNNj2PmuLiJp1ry2o97yemQmQCHkP5X4q0NpJW7y0kYWkq830Bn+
	wmNfGm/FpZLxN3Hs3uO57+8OtqJ7COZOVqWSN4YQiF5toQS5SQDkoz+aIdjLbZJi0FpTnF0htWB
	KSSU5fn4c1w8hOE2cZLUU+h1sXUGTB+ZmJLPryRkAH6oBc39N8DsI3/7lHgPVn5BzGTCWLE1Kxn
	qWTjl2poIPT7kwbD6fKPpbVYfM3CK6XQ==
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48a53ea14d3mr22358675e9.25.1776721124372;
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm289500355e9.12.2026.04.20.14.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 14:38:44 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Mon, 20 Apr 2026 22:30:05 +0100
Message-ID: <20260420213529.1645560-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420213529.1645560-1-l.scorcia@gmail.com>
References: <20260420213529.1645560-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_223852_925248_CF2C65CE 
X-CRM114-Status: GOOD (  13.17  )
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


