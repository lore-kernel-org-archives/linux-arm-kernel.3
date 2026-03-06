Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3C6F01808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvsbkapSH1ZeXX8TYyMwoJWoLzro86VTxqRZYx/ykEo=; b=BPlpX2G/4eYLzBKQEfvlYfUWfs
	0F4igUd0mwVb5smz3dkBif5S1pnU7+aNKULdQ2LNeWVjCgLp8laRTtgUrUBggNTicNNhqL0a2mlmX
	W2WQrG5ruIEJIRFMAcVbaAOuX/94JMCRL1yBAbCi3RzbzJffn5ZnEt7C+tD2zxyROrBYOWs61Lblz
	3BAGZOZvyXeQTLaqJzIOiRykA0TFeAw7psb6g6hR/DpFF8EtYQAd/06kRkkQKDnPMboRlLESkzl05
	V14W18J69BnC/lUDsw1oEGSLUOIG9X17sZAASXDAKTa3S6hPDaPd5oySUWSM8AJs1RYkfewjyeFEl
	wzUmqSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1y-00000003BhW-0OtA;
	Fri, 06 Mar 2026 07:55:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1s-00000003Baf-26bw;
	Fri, 06 Mar 2026 07:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kvsbkapSH1ZeXX8TYyMwoJWoLzro86VTxqRZYx/ykEo=; b=fik8gRhSdLJKxxtuQ6e9uiRAvC
	0Fl8d3D5Mps0urnBUGLiUSfvQXK/UHnkYhZNpmoJibEBUTF4fPfY8YzMukDeaAO4hpYsVSxJYyxUb
	C14VuAkhU1P/zQ/DDLFwgqpDs8k+Hv7xCMzBoW1pO701GnBKuUZ3ACeUI//I0FPJdZ7QmcgF++lL/
	gR8GUQRr4bo4Np3XRtX7cSD7uGx9boo3/m3MlexIuGyVYHRwHQ0fMoHixqnbbi0QpscnpydDQTLgy
	2G//N6QKtRQzEJnP+TGR7vllf5Il460LMXnrnZFALHcPkUj8iVidodPGE8B9gPfC/ospL61/mZ1yy
	tWMfkL/w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008ELJ-2prZ;
	Fri, 06 Mar 2026 07:55:22 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qkheF2977159, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783566; bh=kvsbkapSH1ZeXX8TYyMwoJWoLzro86VTxqRZYx/ykEo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=eSTa0Wxx/mLvAFgYErtdMBsdUcc4CixH3kzWu2jOr5TzVqF+1/hetmEECucLgQYnc
	 URjfc+/HOByyiqGJWlHQ9C+lgI4utnD4XSm5yfbJKJ6BbbAh1uAu1FfE7edSM+sH0a
	 DCPVQbpzyH1PvZj83rjjRgB+V4EYCyxUVasJCkwt81lqN6RJbjIZWqWpH0FZegGxCV
	 4G4Yr7pAxd28/LjFWCjm8k04vKl0VINFLBv/RKVSeWQdvFoyguwnolBKF6Odn/2nXD
	 fC/wFRTUEPuKoRZslEvv50M0l3YGlckmuMKHMbHJtmUtnm7/I7y5ee26y7GYf8FsIs
	 k3EmSyiR1OLeA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qkheF2977159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:46 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:46 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 06/14] pinctrl: realtek: Support system suspend and resume
Date: Fri, 6 Mar 2026 15:52:36 +0800
Message-ID: <20260306075244.1170399-7-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_561561_05F25DC0 
X-CRM114-Status: GOOD (  15.12  )
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

From: Tzuyi Chang <tychang@realtek.com>

Add system suspend and resume capabilities to the common Realtek pinctrl
library. This enables saving and restoring pin configurations during the
noirq phase for SoCs that define register ranges.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Remove stray newlines.
- Simplify rtd_pinctrl_init_pm() error handling: return -ENOMEM directly instead
of using dev_err_probe().

 drivers/pinctrl/realtek/pinctrl-rtd.c | 98 +++++++++++++++++++++++++++
 drivers/pinctrl/realtek/pinctrl-rtd.h | 13 ++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 5888a36babba..60dfb39bc986 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -30,6 +30,7 @@ struct rtd_pinctrl {
 	struct pinctrl_desc desc;
 	const struct rtd_pinctrl_desc *info;
 	struct regmap *regmap_pinctrl;
+	u32 **saved_regs;
 };
 
 /* custom pinconf parameters */
@@ -540,6 +541,30 @@ static const struct regmap_config rtd_pinctrl_regmap_config = {
 	.use_relaxed_mmio = true,
 };
 
+static int rtd_pinctrl_init_pm(struct rtd_pinctrl *data)
+{
+	const struct rtd_pin_range *pin_range = data->info->pin_range;
+	struct device *dev = data->pcdev->dev;
+	const struct rtd_reg_range *range;
+	size_t num_entries;
+	int i;
+
+	data->saved_regs = devm_kcalloc(dev, pin_range->num_ranges, sizeof(u32 *), GFP_KERNEL);
+	if (!data->saved_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < pin_range->num_ranges; i++) {
+		range = &pin_range->ranges[i];
+		num_entries = range->len / 4;
+
+		data->saved_regs[i] = devm_kzalloc(dev, num_entries * sizeof(u32), GFP_KERNEL);
+		if (!data->saved_regs[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
 int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_desc *desc)
 {
 	struct rtd_pinctrl *data;
@@ -579,9 +604,82 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 
 	dev_dbg(&pdev->dev, "probed\n");
 
+	if (data->info->pin_range) {
+		if (rtd_pinctrl_init_pm(data))
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(rtd_pinctrl_probe);
 
+static int realtek_pinctrl_suspend(struct device *dev)
+{
+	struct rtd_pinctrl *data = dev_get_drvdata(dev);
+	const struct rtd_pin_range *pin_range = data->info->pin_range;
+	const struct rtd_reg_range *range;
+	u32 *range_regs;
+	int count;
+	int i, j;
+	int ret;
+
+	if (!data->saved_regs)
+		return 0;
+
+	for (i = 0; i < pin_range->num_ranges; i++) {
+		range = &pin_range->ranges[i];
+		range_regs = data->saved_regs[i];
+		count = range->len / 4;
+
+		for (j = 0; j < count; j++) {
+			ret = regmap_read(data->regmap_pinctrl, range->offset + (j * 4),
+					  &range_regs[j]);
+			if (ret) {
+				dev_err(dev, "failed to store register 0x%x: %d\n",
+					range->offset + (j * 4), ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int realtek_pinctrl_resume(struct device *dev)
+{
+	struct rtd_pinctrl *data = dev_get_drvdata(dev);
+	const struct rtd_pin_range *pin_range = data->info->pin_range;
+	const struct rtd_reg_range *range;
+	u32 *range_regs;
+	int count;
+	int i, j;
+	int ret;
+
+	if (!data->saved_regs)
+		return 0;
+
+	for (i = 0; i < pin_range->num_ranges; i++) {
+		range = &pin_range->ranges[i];
+		range_regs = data->saved_regs[i];
+		count = range->len / 4;
+
+		for (j = 0; j < count; j++) {
+			ret = regmap_write(data->regmap_pinctrl, range->offset + (j * 4),
+					   range_regs[j]);
+			if (ret) {
+				dev_err(dev, "failed to restore register 0x%x: %d\n",
+					range->offset + (j * 4), ret);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+const struct dev_pm_ops realtek_pinctrl_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(realtek_pinctrl_suspend, realtek_pinctrl_resume)
+};
+EXPORT_SYMBOL_GPL(realtek_pinctrl_pm_ops);
+
 MODULE_DESCRIPTION("Realtek DHC SoC pinctrl driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.h b/drivers/pinctrl/realtek/pinctrl-rtd.h
index e15130896abc..7fb0955ce749 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.h
@@ -47,6 +47,16 @@ struct rtd_pin_sconfig_desc {
 	unsigned int pdrive_maskbits;
 };
 
+struct rtd_reg_range {
+	unsigned int offset;
+	size_t len;
+};
+
+struct rtd_pin_range {
+	const struct rtd_reg_range *ranges;
+	const int num_ranges;
+};
+
 struct rtd_pin_desc {
 	const char *name;
 	unsigned int mux_offset;
@@ -119,6 +129,9 @@ struct rtd_pinctrl_desc {
 	unsigned int num_sconfigs;
 	struct rtd_pin_reg_list *lists;
 	unsigned int num_regs;
+	const struct rtd_pin_range *pin_range;
 };
 
 int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_desc *desc);
+
+extern const struct dev_pm_ops realtek_pinctrl_pm_ops;
-- 
2.34.1


