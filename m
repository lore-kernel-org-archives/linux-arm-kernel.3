Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD3EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 02:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnUG3JskAqM/JfRrK06JJsIVlYwHJ11zw3wV0jbg0eU=; b=q6qhOIVzYT+zD8MFWFf0zz9bf8
	YM1EigqbjRBQEaf1vZsaXIdaViF2kHKSGJFqE6e4aVS7ON6v9E1UVxhb1wjk4pBYNb0QCBKdszh2E
	Yp2iU8uS7jalUiINe1AK3aeymJBZvI3lr5W6QkXFidgVG6BfZITDx5Z8wSba20BX3iHtrTi2hIe0L
	pIN0yMFSFffdxqfzp2Im7RF48iAOEtSJo0Yfp83ymyWPOy48pj1njKXiqWto+AnO7xwfWs0ctawlC
	IOC6wXVvXR1QKLDyKGtah+fH8COvHsab3BBNiQ0oiTaIAR5Jl4RRNkbuTSYoGp/MA8VC77uMr+geF
	lb7nJeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijh0-000000070Ag-2VRy;
	Sun, 12 Jul 2026 02:13:18 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgw-0000000707N-1jHf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:15 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1742442a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822393; x=1784427193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnUG3JskAqM/JfRrK06JJsIVlYwHJ11zw3wV0jbg0eU=;
        b=JKXRZGs3MpyyD7Hlkw26FiBkAHaPyv7Y2oohwmzworgA87gsCtR0jqCkBuq7QwJQcy
         Mm7VyuznaUX6K96zjb1S0iIq9xcODFGVKAE+zPVK8dn+qgPNRdaYHxHQXQpX0r5LDg+W
         h0oRIcjwow6fQYxvs0ER7iIDScgv94DbA3GXzf228UgZ1mpwaufspKu7Ng5mJLxblXpN
         8cWCUcpG2nIO/9AJuPngb5OBVWMbWeWS82c222jbdLcnKO1jxHOC9H2iX+3siIW+WepT
         UiqBaxf2SuyErYGt4qvPNziCeLP6Qenrcn532AW52B71W7nP9u+fzrwPG4S+Mx/FBzAh
         aC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822393; x=1784427193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnUG3JskAqM/JfRrK06JJsIVlYwHJ11zw3wV0jbg0eU=;
        b=FOdPCKEICJQaFmZxkngdkBj2hcqsMfqyiPaNvCYINUrNXr8Lv9CeFItoeCmPHMcc4l
         vTGtzEp2eHvDMZrLM8x+gQqlVIiiYPu7Q1ZiMaFqk3ochXaM8PaLejT6olGbKEpIrLq6
         sXtczjdJinnNSfyZSnz7BDv2LQzdxj0iRMXSMrRZli056Z6+3urbPP2PqNtELr2BHs/P
         06MGHemKt4oY7VWDH07ICJrn8XUOD6PxKUcxRvExOOeGOybRQkjJhB1SDOp1Kt7cbaaM
         k8fR6OQ8Mg+qCKSNh110b9UkQxpwyYyGqTBwpDTb08av3HDWjLkcMAjg4r6bXmMJa7A0
         Ie2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1vGu2fPOyFGABGXHiaPapmzCY31TCgd4Y7cIVtcAU3UaLEl44Vm46fBFk4TzhzQfsYaqQo9kC/5LOrcz3nWEl@lists.infradead.org
X-Gm-Message-State: AOJu0YzDyPFDzmK1bDhCO+7Ye+bDoQrZfLl411NFtXzs8IjnX9cjOnds
	JHY3NtD1YK+Y97o+Ska6Ex799DlzUDqcL1CNKdA1X+WEHOcPTsHoTryM
X-Gm-Gg: AfdE7cmAmsxnHv7U1FXQTe6GrWgluuDbN5ezxFjHM48crirK8918YlKgru8ndky+sco
	JCSx7m4Mnf2umIroScmrjpn3jg31IFbpOH2jZwvSGMsVCtN7xLBI7H8oqlRLeYQKW76rUCODsvC
	75BjSRW8g17HFTKx+CJ44U6fSGd1pR+xTvATdp2ID+uE8+EaCpji/ILyB+fTEwy4ZPZ6IQB5paL
	6G2XDOnWzSbhxjxwB12Pa5I/RlrXwEEJxODRp0k1yreESNbUo84HVlzmdSoL2ed2P9R8rmCipam
	QbtGXcOIX2EIqCPCX4tyi9jYiwgtwPv4JH428pvdDKVlrQ4+UNE5i8/RPmx0Z1z4o7neM8FCvqE
	Yoi23y7Q7rCtXB6+vebMTE3OCdqMsmf5Y/hoVrigtkEJY/f2e/I5bs7vmTN8/b4vcYQ6WxZtAqJ
	o1mVhlbQ2JHpCw/JFlffo3MfrIaELdS+eziuIubk+FqTDj27pJQ6G1MvDLyGte8MCY1hV/iCLnJ
	QI=
X-Received: by 2002:a17:90b:5545:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-38dc74c4a32mr4437207a91.8.1783822393449;
        Sat, 11 Jul 2026 19:13:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:13:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:48 -0700
Subject: [PATCH v3 07/10] mfd: wm831x: support software nodes for DCDC
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-7-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_191314_464788_5AC0CAD6 
X-CRM114-Status: GOOD (  20.88  )
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

Allow passing software nodes to wm831x DCDC regulators via PMIC platform
data. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

We add 'dcdc_swnodes' to the PMIC platform data 'struct wm831x_pdata' and
have the MFD core assign these software nodes to the buckv cells.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/wm831x-core.c        | 47 ++++++++++++++++++++++++++++++----------
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index df8e76e000cc..c4793be419ba 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/core.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/err.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] = {
 };
 EXPORT_SYMBOL_GPL(wm831x_of_match);
 
+static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
+			      const struct mfd_cell *cells, int num_cells)
+{
+	struct wm831x_pdata *pdata = &wm831x->pdata;
+	int i;
+
+	struct mfd_cell *local_cells __free(kfree) =
+		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
+	if (!local_cells)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cells; i++) {
+		struct mfd_cell *cell = &local_cells[i];
+
+		if (strcmp(cell->name, "wm831x-buckv") == 0) {
+			int id = cell->id - 1;
+
+			if (id >= 0 && id < WM831X_MAX_DCDC)
+				cell->swnode = pdata->dcdc_swnodes[id];
+		}
+	}
+
+	return mfd_add_devices(wm831x->dev, wm831x_num, local_cells, num_cells,
+			       NULL, 0, NULL);
+}
+
 /*
  * Instantiate the generic non-control parts of the device.
  */
@@ -1620,15 +1647,13 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	/* The core device is up, instantiate the subdevices. */
 	switch (parent) {
 	case WM8310:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8310_devs, ARRAY_SIZE(wm8310_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8310_devs, ARRAY_SIZE(wm8310_devs));
 		break;
 
 	case WM8311:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8311_devs, ARRAY_SIZE(wm8311_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8311_devs, ARRAY_SIZE(wm8311_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1636,9 +1661,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 		break;
 
 	case WM8312:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8312_devs, ARRAY_SIZE(wm8312_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8312_devs, ARRAY_SIZE(wm8312_devs));
 		if (!pdata->disable_touch)
 			mfd_add_devices(wm831x->dev, wm831x_num,
 					touch_devs, ARRAY_SIZE(touch_devs),
@@ -1649,9 +1673,8 @@ int wm831x_device_init(struct wm831x *wm831x, int irq)
 	case WM8321:
 	case WM8325:
 	case WM8326:
-		ret = mfd_add_devices(wm831x->dev, wm831x_num,
-				      wm8320_devs, ARRAY_SIZE(wm8320_devs),
-				      NULL, 0, NULL);
+		ret = wm831x_add_devices(wm831x, wm831x_num,
+					 wm8320_devs, ARRAY_SIZE(wm8320_devs));
 		break;
 
 	default:
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d5d9d9600756 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -132,6 +133,7 @@ struct wm831x_pdata {
 	struct wm831x_status_pdata *status[WM831X_MAX_STATUS];
 	/** DCDC1 = 0 and so on */
 	struct regulator_init_data *dcdc[WM831X_MAX_DCDC];
+	const struct software_node *dcdc_swnodes[WM831X_MAX_DCDC];
 	/** EPE1 = 0 and so on */
 	struct regulator_init_data *epe[WM831X_MAX_EPE];
 	/** LDO1 = 0 and so on */

-- 
2.55.0.795.g602f6c329a-goog


