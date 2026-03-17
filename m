Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF02FD874D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aitv+diaBDKY5MPp0jsIKdqBX3LlsT0qETl3P1pWDM=; b=e8Pn0SMFqRCERQjHRo2UxBOjPp
	jxdYebPRrQ1Odc+4lffCI4tJIgcr+h9EobXQkyNg+BTxHmb50ARu94klbhEmHs9iRbzcpPFwPxRIQ
	URz60QNo0oq7zC9vLBvakNDNJxQ8exONc7WA7Z6oZIVgukbQgggcv29s+K2PL4UKFy3H7aMb4blpW
	K4/42DQOyQ0lqPypYEPyVcgdY0nLrTkzmviwCbF+R4Il5RM4cFEWVhMGxp4+76uSzpYcs2N3zOYd7
	UQoAoSzguNT4FFHeSWhKY7nXIeW0jLrbuL1Rtjr4PpJ5dyd7EhBWG9W8URYQzsfOVl2s3pJiF4Zt8
	Vfo5y6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2l-00000006FEJ-3ygk;
	Tue, 17 Mar 2026 11:57:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2a-00000006F88-48gj;
	Tue, 17 Mar 2026 11:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2aitv+diaBDKY5MPp0jsIKdqBX3LlsT0qETl3P1pWDM=; b=j5Bdc5c3pz4f6QpUp/3/2OS5M9
	q4KCuEbypf8oriRaUgm/0Rev4iP5azIKi4V+ddcaqYd0vDu2mcpl4CLr5OfqNvqGz4XIr/IPjSf+d
	HfWksBSTLdnpPrRwp7oiLjhXsdD6imhJslsKqkhdRTymXsw94XMWODy4vYUpgUVHYbDJu1js8iNuD
	5m8EgbjZgwS5CkpwDI0l7SK1yuPEOFL3nlp+iQ46BqJR8/MBTznTl/XPiU/lAvStWwbxWjSXqQ3BB
	w4Ad/owGJqyn1ZcKvzTTV75VGKZ6j+HaWvWLjUMAlOY3H9i5oBoV+cgZCzBxpCr3UmlMXa+xBb3Bv
	ADFaVXpQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2V-00000008taP-2qoR;
	Tue, 17 Mar 2026 11:56:51 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBYp93851626, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=2aitv+diaBDKY5MPp0jsIKdqBX3LlsT0qETl3P1pWDM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=X67PPYW5xhiV90p6+gPMHWokUWmw1THu94rxslK6Q7Yr4EAfVUbrQfMlKtIF2WsN8
	 YNpWNqtMh7xTLoWNe6B30SMXNIsK53wVi2dCwYrGnDvRASU+T2wZUCSPiJVktNxHx4
	 Bbgc+p5DLC/uIZSNwj0HjVRkF0QxDdYhR+h2zLidjir7x5W13m8KUykjvWKs27oIMb
	 WT8l5HGWPX7WtsgBQAIIZ/IU1BjuzNxdxqqzjegu6FiVSSk97dnN9rSHFB4Fup8loU
	 k+pQqZaPDq+7vFyuZJr04/IliTQTZoyQMrGJSLx1GlZQzzo+Z99JMyscP3JB0c+plx
	 RfobtWC3kXwqQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBYp93851626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:11 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 3/8] pinctrl: pinconf-generic: Add properties 'input-threshold-voltage-microvolt'
Date: Tue, 17 Mar 2026 19:54:05 +0800
Message-ID: <20260317115411.2154365-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115648_278621_03596331 
X-CRM114-Status: GOOD (  12.77  )
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

Add a new generic pin configuration parameter PIN_CONFIG_INPUT_VOLTAGE_UV.
This parameter is used to specify the input voltage level of a pin in
microvolts, which corresponds to the 'input-voltage-microvolt' property
in Device Tree.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- Add Reviewed-by tag from Linus.
- Sync pinconf-generic with the property name change.
---
 drivers/pinctrl/pinconf-generic.c       | 2 ++
 include/linux/pinctrl/pinconf-generic.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 855ca973a1c8..e14371cfa57f 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -57,6 +57,7 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY, "skew delay", NULL, true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_INPUT_PS, "input skew delay", "ps", true),
 	PCONFDUMP(PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, "output skew delay", "ps", true),
+	PCONFDUMP(PIN_CONFIG_INPUT_VOLTAGE_UV, "input voltage in microvolt", "uV", true),
 };
 
 static void pinconf_generic_dump_one(struct pinctrl_dev *pctldev,
@@ -203,6 +204,7 @@ static const struct pinconf_generic_params dt_params[] = {
 	{ "skew-delay", PIN_CONFIG_SKEW_DELAY, 0 },
 	{ "skew-delay-input-ps", PIN_CONFIG_SKEW_DELAY_INPUT_PS, 0 },
 	{ "skew-delay-output-ps", PIN_CONFIG_SKEW_DELAY_OUTPUT_PS, 0 },
+	{ "input-threshold-voltage-microvolt", PIN_CONFIG_INPUT_VOLTAGE_UV, 0 },
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 531dc3e9b3f7..a5d4b2d8633a 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,8 @@ struct pinctrl_map;
  *      schmitt-trigger mode is disabled.
  * @PIN_CONFIG_INPUT_SCHMITT_UV: this will configure an input pin to run in
  *	schmitt-trigger mode. The argument is in uV.
+ * @PIN_CONFIG_INPUT_VOLTAGE_UV: this will configure the input voltage level of
+ * the pin. The argument is specified in microvolts.
  * @PIN_CONFIG_MODE_LOW_POWER: this will configure the pin for low power
  *	operation, if several modes of operation are supported these can be
  *	passed in the argument on a custom form, else just use argument 1
@@ -145,6 +147,7 @@ enum pin_config_param {
 	PIN_CONFIG_INPUT_SCHMITT,
 	PIN_CONFIG_INPUT_SCHMITT_ENABLE,
 	PIN_CONFIG_INPUT_SCHMITT_UV,
+	PIN_CONFIG_INPUT_VOLTAGE_UV,
 	PIN_CONFIG_MODE_LOW_POWER,
 	PIN_CONFIG_MODE_PWM,
 	PIN_CONFIG_LEVEL,
-- 
2.34.1


