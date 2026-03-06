Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFC6F01808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgh76Icjq5aZcxp8xesBqY6XMC0lsZ0EPMYpuiDqgnU=; b=Aql5MKEG1itLpDbdkQGAllguZQ
	zs6F2Wy9XBE6ZGOe5TgSpB9siUNeWLjAQY2vrK/NFjRlf44AzdY+sCh9lmarUmWL/wKDGNCM4Dx/I
	rCzO/3yGaZm6rUd4UwiKEny9P+qJSjXOH9vxy1Z0ODfciHoCzZRl335YWdbWflwcnwMCeeXYc2Qsm
	H1wUnqbC+8DkBu9/h7A9/VR9keAkFbqXYUFmiIxoAHm28/tcha7HC0dv8gKfE0Jlo3LvWHXdLwuUu
	XRjNxmGv0ZPLVKkcz0p89xCqYOyfqSmEbiL1IAhD+KitMyX3zKJbLzc73HHpx2Dy5R06bqTexmVfn
	taO9cUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ2C-00000003C0a-3fm2;
	Fri, 06 Mar 2026 07:55:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ22-00000003BmR-1VmT;
	Fri, 06 Mar 2026 07:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=hgh76Icjq5aZcxp8xesBqY6XMC0lsZ0EPMYpuiDqgnU=; b=VymAoxtSJyxEu+w/F+Cuecokrm
	uC6l1dNRxA8/RHO/qfKFs6rSlGc8zIN1cBSdE32FjIhK4eLJA6DhLzaeaVbwdoxc+6T2x39Gjqkkb
	zHIm82z4AqiZlbfOF64JCS7Yk1Hm6p4/C2K1bUZCzbEzean2OpG7HdsvTMSKMNcVmHegGC60yooyo
	egAa/4qeeFtBKVFrFSPMDPiwa3nwE+A3eW7ggxUwnqAmmZjUiC9emR26pEx0IU21gypbaTbYc6TKy
	iyvYH/ek4p86nYDGSJ7/BMpxKk7ars94/xCkPagxDGoCmpdej9TEkPLqT+lHXk9okoQYE6go09CdG
	0WVNQDaA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1y-0000000GMJ9-2VAk;
	Fri, 06 Mar 2026 07:55:32 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qoYrB2977173, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783570; bh=hgh76Icjq5aZcxp8xesBqY6XMC0lsZ0EPMYpuiDqgnU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qUokxQYA7yCqoHpx7zkUrFj3qEDl7dULVzFnFm1NIqEIIvavZCGkC5FFZPKi2gYuj
	 H9TkxVnyZ6BVyxJd1G81sC17HTYKyhuLLTo13lutUnNcu3qnoilMcPOn26Moh3N4K2
	 mIP3dyfUXcTHXt66tPwX8lCKZAq/9rWAlF8sFo8FfgghLJB0TzI5K0RwO/hNh6l8rU
	 fGNWNyHMDerhWKUOxwTpOwZwgz6GY2bTmsFi8kbScYJbmgbqDjblOVaX0fVz1TeG1q
	 FGF8qM6CrPcKArybEOHiu8dNiYEKmOMgAcq1M0jBdryoDzR0qTN/kE7KfAtTs+p9Dv
	 lMzsOnFzq51sQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qoYrB2977173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:50 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:50 +0800
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
Subject: [PATCH v2 12/14] pinctrl: realtek: Add support for slew rate, input voltage and high VIL
Date: Fri, 6 Mar 2026 15:52:42 +0800
Message-ID: <20260306075244.1170399-13-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075531_172438_F94115C1 
X-CRM114-Status: GOOD (  13.95  )
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

Add support for configuring slew rate, input voltage level and high VIL
mode. This involves updating the pin configuration parsing logic to handle
PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_VOLTAGE_UV and the new custom property
"realtek,high-vil".

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Adapt code to match the new binding properties
 - Switch to handling values instead of booleans for VIL.
 - Move property parsing logic to the appropriate location.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 48 ++++++++++++++++++++++++++-
 drivers/pinctrl/realtek/pinctrl-rtd.h |  3 ++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index d9456f3d908b..51fbf02710e6 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -37,11 +37,13 @@ struct rtd_pinctrl {
 #define RTD_DRIVE_STRENGH_P (PIN_CONFIG_END + 1)
 #define RTD_DRIVE_STRENGH_N (PIN_CONFIG_END + 2)
 #define RTD_PULSE_WIDTH_ADJUST (PIN_CONFIG_END + 3)
+#define RTD_HIGH_VIL (PIN_CONFIG_END + 4)
 
 static const struct pinconf_generic_params rtd_custom_bindings[] = {
 	{"realtek,drive-strength-p", RTD_DRIVE_STRENGH_P, 0},
 	{"realtek,drive-strength-n", RTD_DRIVE_STRENGH_N, 0},
 	{"realtek,pulse-width-adjust", RTD_PULSE_WIDTH_ADJUST, 0},
+	{"realtek,high-vil-microvolt", RTD_HIGH_VIL, 1},
 };
 
 static int rtd_pinctrl_get_groups_count(struct pinctrl_dev *pcdev)
@@ -288,7 +290,8 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 	u16 strength;
 	u32 val;
 	u32 mask;
-	u32 pulsel_off, pulen_off, smt_off, curr_off, pow_off, reg_off, p_off, n_off;
+	u32 pulsel_off, pulen_off, smt_off, curr_off, pow_off, reg_off, p_off, n_off,
+	    input_volt_off, sr_off, hvil_off;
 	const char *name = data->info->pins[pinnr].name;
 	int ret = 0;
 
@@ -409,6 +412,49 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		val = set_val ? mask : 0;
 		break;
 
+	case PIN_CONFIG_SLEW_RATE:
+		if (config_desc->slew_rate_offset == NA) {
+			dev_err(data->dev, "Slew rate setting unsupported for pin: %s\n", name);
+			return -ENOTSUPP;
+		}
+		sr_off = config_desc->base_bit + config_desc->slew_rate_offset;
+		reg_off = config_desc->reg_offset;
+		mask = 0x3 << sr_off;
+		val = arg << sr_off;
+		break;
+
+	case PIN_CONFIG_INPUT_VOLTAGE_UV:
+		if (config_desc->input_volt_offset == NA) {
+			dev_err(data->dev, "Input voltage level setting unsupported for pin:%s\n",
+				name);
+			return -ENOTSUPP;
+		}
+
+		if (arg == 3300000)
+			set_val = 1;
+		else if (arg == 1800000)
+			set_val = 0;
+		else
+			return -EINVAL;
+
+		input_volt_off = config_desc->base_bit + config_desc->input_volt_offset;
+		reg_off = config_desc->reg_offset;
+
+		mask = BIT(input_volt_off);
+		val = set_val ? BIT(input_volt_off) : 0;
+		break;
+
+	case RTD_HIGH_VIL:
+		if (config_desc->hvil_offset == NA) {
+			dev_err(data->dev, "High vil setting unsupported for pin:%s\n", name);
+			return -ENOTSUPP;
+		}
+		hvil_off = config_desc->base_bit + config_desc->hvil_offset;
+		reg_off = config_desc->reg_offset;
+		mask = BIT(hvil_off);
+		val = 1;
+		break;
+
 	case RTD_DRIVE_STRENGH_P:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.h b/drivers/pinctrl/realtek/pinctrl-rtd.h
index 7fb0955ce749..02e2d8d269b5 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.h
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.h
@@ -34,6 +34,9 @@ struct rtd_pin_config_desc {
 	unsigned int smt_offset;
 	unsigned int power_offset;
 	unsigned int curr_type;
+	unsigned int input_volt_offset;
+	unsigned int slew_rate_offset;
+	unsigned int hvil_offset;
 };
 
 struct rtd_pin_sconfig_desc {
-- 
2.34.1


