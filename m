Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1610C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zY+gmVQiaUnNp4jEFsxwLdll+E7uRUbUBQTVKPUvak0=; b=D9kJtzb0YKgrJkzejuYykzodf2
	jhv8xPObDhin89+EvUUMXPlUi6e5bTVniDSjjf/X2dbyIcUQG65E+sDPrbYgV4683LB/kdOdC6T45
	xjRdreKo9aTdLLTG6TGLmu5VlDzXbby2mJ3J2S/xXCGMC+XaDc4FvLlGhhb5sX1dP3296uugbHCBh
	+BKR3hWSAahRqRtppPBPU5FoFm99DWdAcQMs4p0VBLc3IjOXhGUP5V5NEKa59enrjAhzSbWrZJCNE
	/EnPFw5KZKIoe8Hw8/37TP2VC1ZyDUSqmrE3GZbE2La/NlBOlRX8WlLuB0GiHSk6J/yNpErAFFKEs
	MoC70qVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXL49-0000000Bh98-26ZK;
	Thu, 03 Jul 2025 14:37:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJbE-0000000BQZF-119i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:03:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so643523f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751547815; x=1752152615; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zY+gmVQiaUnNp4jEFsxwLdll+E7uRUbUBQTVKPUvak0=;
        b=fEiy3R80js4uRQjEPXuMAmVNQ67X/C0B/hULGNybLyYDdAOtVhnzNATpFN0IiCAs1N
         inDpFCWHHLLH6ol56+xlA7ZVxhtW134FEH+EcRbr0xOUuiVJMY/XNq/hBnCqaoxmsfBG
         40b/uc4rEcAvHlkYWXUwDMFY8QqoVQO7y1zhePYiXOT7blyNmu7ixQSGd9v1d/zPD30/
         +BXG+L8gpkOhTldHnFKJg/gSwY98OJiRBQR+JenG4ICFywUW3J99LKWjNnLPS4ShdUE9
         WkacvJ8UyLjfoBeCgt5KLEaoLv99R+OP6aB7YbPVYjwompJUZ+/wMW1ljNfCqHIyaYUo
         qmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547815; x=1752152615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zY+gmVQiaUnNp4jEFsxwLdll+E7uRUbUBQTVKPUvak0=;
        b=X2EpqoCNO82IEoqkDUhXpKCkX+NmtP2PXO+dbr8aUjXY//Gz7JoPzbwk52Ie1ly+YI
         vmTtJocklVfvv1iv20tZ+8DBI3iU98XAn85ZcWLmB/2KA+dEIFOmI/YZU5OBIsegqA5O
         cEvW6jI8P9BaifzFOmym/aMP1EXvMYnoAO31ita9kdxUGrFk0pF+zM43wAct6rShAyYI
         y58EDS4rH+T2iM4iils+wfBj4uRUBTEmIA2pZVhTTr5aVUywIJy+y7cF4WO5rasIAi1y
         WnPFzxS87nanCbQCdWMDHW9NCh1BRXcZXJhVlciCokKkks03Y4wUQkQfd3wU+ZcoNtns
         ErJw==
X-Forwarded-Encrypted: i=1; AJvYcCVMZQ50eM/XXe1fuxwAYEGbuzUrx0mMr6I8CbadScwGm3YnNp0fT1OF5a6a8wQalz/eNFKMrxA9D/HGXVdxOuwy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx61ikNEIo2ucIpYrIeVW7cdRFNFWAdXr/ZFjUNecGIVwKRf7N8
	crDoB8oj2Du7C7h6vtwd2tWy7175+n60zL6VpFPu2BbyJK4+btFJ/KT67uBjdbIqLoQ=
X-Gm-Gg: ASbGncuhqDOm6c4XTmRk8FEMshKj8ESr+7hC3Hi1HfTl+4g10LcehXmOMgVCqMib2IX
	oEs0dS1OrR/+/i3420w4KFVFAM++5NwWocEGijw+nGsaEE/rNQCALDR9RCnne0SmECITcN1+1yl
	R4ViTssCidfz4+TQsRwxhLmEWavaKZOkPAVEzqFCdBE3Dmr6IWv0gGJahNv6Z//iS2EhbFMcENi
	KZoNmJ4/bXvr6ozyvQ+LHkuJ1Rc6xyD7p1i8anwxtSzIkvfpRveICalKLxnp6BUtFxvTlFvbL99
	LWo6PQmi5BZY1hiSJELseLiSVfN2Cltp/kEtmLimk9PsTXyckB3v6f7UyxSLmnQ/b+Aw+y1JIeB
	s/qord94PnyMvaUeU
X-Google-Smtp-Source: AGHT+IFAmqbG8QwOKcAIIyFO7TCvSI5jKlQABIcoROoKfcTrDyTYY+J9CssjlH6HomYb2Z62O9WhbQ==
X-Received: by 2002:a5d:584d:0:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3b342a0e01cmr2543169f8f.8.1751547813693;
        Thu, 03 Jul 2025 06:03:33 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99693fesm26170005e9.7.2025.07.03.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:03:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 03 Jul 2025 14:03:23 +0100
Subject: [PATCH v2 2/2] phy: samsung: gs101-ufs: Add .notify_pmstate() and
 hibern8 enter/exit values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-phy-notify-pmstate-v2-2-fc1690439117@linaro.org>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
In-Reply-To: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5752;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SGXL8vHpnOze8hCmwSTRKJn6StGn2XGnu+E5YVyfKLw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZn+hg2HMRi/dl+2ECaqD6oA575YwGvtgGtYNE
 a8rLPZfkrOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGZ/oQAKCRDO6LjWAjRy
 uqLSD/95i0gIkM1wypk88hIX1bhKXhzKowe/VoMuslxo6MVrSw7Y4l4xm1z0vQWIUrRufoDx/98
 x2absM0xSUf+pWjyhyC8CzlV234TtH6nqszQ1ao4MothcZV2EhAvqCnHWkW0TWxwXrNIrnIy6hC
 oufEwLX+vNTKhI10Eu+8wcT7WCzeHYUKV4IsyqMmTulFArdz9elklPa/YJI4huDwz8sBbodHZBQ
 q1Mxc84zYAoNOZJC9BJvKW2rePssI8wec0zY0M5ly1T7sSSj1f8s3x+MgVkTUB/MnC0+/QJhlB7
 xR1+ZmH0jhhBn9pER6SRYfxy7z6+ixqtMqJZw0Xu3WPhqL0PfxS7iuhViZ+J1A4QeNejQbqHqNQ
 VoD4JMuDJi0EGzicc4Sqbe6rPfIptGjqXXX6wITSFlA7V1lDkLnpwkB1d7Ze01ywqnXpcBuQDMp
 PsxwoCbNQaEdw5ABh7dFiI10yAy/It6C68CU6UP0Wv1rx8BAhLm7gUStywVCdLTDXOvehDyyN5n
 qqnBR1/OpABHfCdzEPBm27g1NHE+Ku7ds+BjZOfvL2YeOuVf+OUzVbdFOz6n0by2nKLKuvfjLfB
 eejF8B4dpDU3uJvHna7IJJzIxt59I8YZD39gz0jQGfUdVuPEspFL0+E20ZBwxc9x84X4G+9pRb+
 +yzfMnPAdbiiIoA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_060336_292855_4E32D1DA 
X-CRM114-Status: GOOD (  16.81  )
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

Implement the .notify_pmstate() callback and provide the gs101 specific phy
values that need to be programmed when entering and exiting the hibern8 state.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 38 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 +++++++
 3 files changed, 73 insertions(+)

diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index 17b798da5b5761f8e367599517d2d97bf0bb6b74..a15e1f453f7f3cecd6d3aa75217633ac4b6085d0 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -108,12 +108,39 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_post_pwr_hs_config[] = {
 	END_UFS_PHY_CFG,
 };
 
+static const struct samsung_ufs_phy_cfg tensor_gs101_post_h8_enter[] = {
+	PHY_TRSV_REG_CFG_GS101(0x262, 0x08, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x265, 0x0A, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x1, 0x8,  PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x0, 0x86,  PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x8, 0x60,  PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x222, 0x08, PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x246, 0x01, PWR_MODE_HS_ANY),
+	END_UFS_PHY_CFG,
+};
+
+static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
+	PHY_COMN_REG_CFG(0x0, 0xC6,  PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x1, 0x0C,  PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x262, 0x00, PWR_MODE_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x265, 0x00, PWR_MODE_ANY),
+	PHY_COMN_REG_CFG(0x8, 0xE0,  PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_HS_ANY),
+	PHY_TRSV_REG_CFG_GS101(0x222, 0x18, PWR_MODE_HS_ANY),
+	END_UFS_PHY_CFG,
+};
+
 static const struct samsung_ufs_phy_cfg *tensor_gs101_ufs_phy_cfgs[CFG_TAG_MAX] = {
 	[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
 	[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
 	[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
 };
 
+static const struct samsung_ufs_phy_cfg *tensor_gs101_hibern8_cfgs[] = {
+	[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
+	[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
+};
+
 static const char * const tensor_gs101_ufs_phy_clks[] = {
 	"ref_clk",
 };
@@ -170,6 +197,7 @@ static int gs101_phy_wait_for_cdr_lock(struct phy *phy, u8 lane)
 
 const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy = {
 	.cfgs = tensor_gs101_ufs_phy_cfgs,
+	.cfgs_hibern8 = tensor_gs101_hibern8_cfgs,
 	.isol = {
 		.offset = TENSOR_GS101_PHY_CTRL,
 		.mask = TENSOR_GS101_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index f3cbe6b17b235bb181b3fae628d75822f0c9183a..b0dc40c19d2ed85dbdb74aff768a24f03b4b3f49 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -217,6 +217,42 @@ static int samsung_ufs_phy_set_mode(struct phy *generic_phy,
 	return 0;
 }
 
+static int samsung_ufs_phy_notify_pmstate(struct phy *phy,
+					  enum phy_linkstate pmstate)
+{
+	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
+	const struct samsung_ufs_phy_cfg *cfg;
+	int i, err;
+
+	if (!ufs_phy->cfgs_hibern8)
+		return 0;
+
+	if (pmstate == PHY_UFS_HIBERN8_ENTER)
+		cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
+	else if (pmstate == PHY_UFS_HIBERN8_EXIT)
+		cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
+
+	for_each_phy_cfg(cfg) {
+		for_each_phy_lane(ufs_phy, i) {
+			samsung_ufs_phy_config(ufs_phy, cfg, i);
+		}
+	}
+
+	if (pmstate == PHY_UFS_HIBERN8_EXIT) {
+		for_each_phy_lane(ufs_phy, i) {
+			if (ufs_phy->drvdata->wait_for_cdr) {
+				err = ufs_phy->drvdata->wait_for_cdr(phy, i);
+				if (err)
+					goto err_out;
+			}
+		}
+	}
+
+	return 0;
+err_out:
+	return err;
+}
+
 static int samsung_ufs_phy_exit(struct phy *phy)
 {
 	struct samsung_ufs_phy *ss_phy = get_samsung_ufs_phy(phy);
@@ -233,6 +269,7 @@ static const struct phy_ops samsung_ufs_phy_ops = {
 	.power_off	= samsung_ufs_phy_power_off,
 	.calibrate	= samsung_ufs_phy_calibrate,
 	.set_mode	= samsung_ufs_phy_set_mode,
+	.notify_pmstate = samsung_ufs_phy_notify_pmstate,
 	.owner          = THIS_MODULE,
 };
 
@@ -287,6 +324,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	phy->dev = dev;
 	phy->drvdata = drvdata;
 	phy->cfgs = drvdata->cfgs;
+	phy->cfgs_hibern8 = drvdata->cfgs_hibern8;
 	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
 
 	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index a28f148081d168344b47f2798b00cb098f0a8574..f2c2e744e5bae87c9cfcaa17f4a09456f134966a 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -92,6 +92,11 @@ enum {
 	CFG_TAG_MAX,
 };
 
+enum {
+	CFG_POST_HIBERN8_ENTER,
+	CFG_PRE_HIBERN8_EXIT,
+};
+
 struct samsung_ufs_phy_cfg {
 	u32 off_0;
 	u32 off_1;
@@ -108,6 +113,7 @@ struct samsung_ufs_phy_pmu_isol {
 
 struct samsung_ufs_phy_drvdata {
 	const struct samsung_ufs_phy_cfg **cfgs;
+	const struct samsung_ufs_phy_cfg **cfgs_hibern8;
 	struct samsung_ufs_phy_pmu_isol isol;
 	const char * const *clk_list;
 	int num_clks;
@@ -124,6 +130,7 @@ struct samsung_ufs_phy {
 	struct clk_bulk_data *clks;
 	const struct samsung_ufs_phy_drvdata *drvdata;
 	const struct samsung_ufs_phy_cfg * const *cfgs;
+	const struct samsung_ufs_phy_cfg * const *cfgs_hibern8;
 	struct samsung_ufs_phy_pmu_isol isol;
 	u8 lane_cnt;
 	int ufs_phy_state;

-- 
2.50.0.727.gbf7dc18ff4-goog


