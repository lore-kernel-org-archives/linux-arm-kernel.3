Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81DECA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs1SP51KioxwpFXq0E6v21nkJ3BmZQZeWMYcveEiXdk=; b=F2AmN2QrfZN2+uh8VOmPGYl/00
	4ErWCzEmuf01Cbc7q+5goR33lhsGekVF75l5dmKsu6x86vA/hjfMGD7kWwvw9k/BVfbswCUaHPXQj
	JUNLPOr4SqWaXIriTt0v4kUV8o66Xswkl+EH2NE36pwqGhRxGm+JPSP5lkosAnhOkd6fAQnKhsFth
	4VcEg7OEMK0nG2jKB/3lwtcknziS+vzxC59jmaqxgVjp5Xn14x2n0zod+YRmcVlZcI7mcCZ2yoHzK
	voHdpD0cLgV4pxZkO0oCdFOixb1ihXUKB1Q/90H5f51cwdyF+S/ZObahAjQ3u4F/R33BzsH1kGsCX
	FiSIJ9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIz-0000000AnbT-20rX;
	Tue, 12 Aug 2025 12:40:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullB3-0000000AMPG-2IoZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:20:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso7334930a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990416; x=1755595216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bs1SP51KioxwpFXq0E6v21nkJ3BmZQZeWMYcveEiXdk=;
        b=1e6Q8nAoSK65zWhwEyJdXaQMehkFT78wRjbJIl4X4JNNGGLzZ34g6CsY1CuQuzSjRW
         a8By2Ss079u8tL+aXrgRwXvCZ3WFZ8tcx7SG158zgmW0jLK2rmG+lgSfjod5Ntmpu36y
         fUnA2CVCOT7tyj5LWXtDIJi+dWtpJYtqOUX6BDPnbbcPSfqhmWgF/td3Q/S05xIjGNy1
         cvMad/DiMs59hMTe3C36CJw/ywaM+zczVDx3QXYltr+bzRF9borOCINoDOEiOC0J1nJH
         3yng8EnhNq7dj7JYV3wwGennnlTF6XZQrjdtX8f7iSVJ11dJn6z7DvEOmA3CIx0EIoXh
         Hx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990416; x=1755595216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs1SP51KioxwpFXq0E6v21nkJ3BmZQZeWMYcveEiXdk=;
        b=TNZyb7F1d56o+82Lf4I9MfGTq8t7D3RBg1pPKQQ/azLTpRNRY1i7lx+Mg5Vg1ig9yF
         Xjdkg4Dm5QHamoR+erB58RG2pT9333/pa4psBW1D/yDl7OS8Fmwf8VUHKUAkZ6NuF8Zx
         92iUiZelt5pGmSVvp2IJ44AeuIBTEnH6Q39wa8HzO12Pzqpb8sstEtwiXMh815ZdsWEq
         N8/CRTMngFpCxIuJRQuER/jeMdoLPLwwiy4+BfskJr2kz0kUj0pC1Wna+kPFoKjTvaph
         V3aifygRuequ7ijbfgngcbKHMIooYA8TDq1iNCbBqvPFjiAw1MioFNuUViPmOOWDjM4v
         gq/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/8HxYeGrvrnKxKNh4H97DgEloosEA6VmxgmZ7ldK6K4jbR3sxBqK7ANnNxwUtdHJJK/Fte37S56QP3kPmjXp7@lists.infradead.org
X-Gm-Message-State: AOJu0YyTzzf72WJ0r9aTd9BH3qyAYeZ9EVd/AyMMQUTO0jIb+8WxSd/o
	Mq/oEc64s5lPtv2R6+yVN6Gzka92v9mLJuJGglOd39auPkbPnvFTF23mo48rFOD7tG4=
X-Gm-Gg: ASbGncurocGmqab2z34kX3xaqcAoupHjfKLJ2vva7dhUTz8Lb3wpIxA1x6+Q5kXGiAN
	HVU9cx+dqF/H5EfcXuq1lfalb6cn/hg+vtKapehwCs5kXo1B0JcqDc2AOtz0cE/6f2RgiKsRD+T
	d8i1IsgTwd7sLB/pGaD3SmAHR4UN22YlPn0edrzUjvB421LX6LaC+vE5TR+30SiaPDm8jna+++a
	B+hE+GwaSxL6vdYGkhJaYUXaCUVGp/gsZmtPBOY02BjX9oQuxUZwJL73J3hy6or9COkEu1hqOU9
	mNii7VYCCYlkOa17sd/Cd/3Y33h3FSNK17HPxmGWmjXXcHV1CW8VtPXQ4HE4K9niMJmMyYXxvjQ
	CYNZWn+Mg0MgE2Umu1g==
X-Google-Smtp-Source: AGHT+IGVGPmsAHT5sVpRUb2RNBxpNpsTSK02TiTZkCzc5O4CNPBG0bmI7BZgtMYhiG6O3Ki5lv3Liw==
X-Received: by 2002:a05:6402:430c:b0:618:4044:67a7 with SMTP id 4fb4d7f45d1cf-6184ea20e98mr2039588a12.5.1754990415955;
        Tue, 12 Aug 2025 02:20:15 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-615a8f25739sm20175496a12.21.2025.08.12.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:20:15 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:19:48 +0200
Subject: [PATCH v7 2/2] firmware: ti_sci: Partial-IO support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-partialio-v6-12-b4-v7-2-ac10865c2d87@baylibre.com>
References: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com>
In-Reply-To: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6767; i=msp@baylibre.com;
 h=from:subject:message-id; bh=CbzzAmP8/LO6r8tSC7sWQSxfvx2aA7gDFVK/fKBIvbk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZ7O6hzLcDlUulvZUcxWft/P+7y7FLej5j1fx/e8OnK
 e5q3KTbUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPJecDwP/dsfFFhzO/IUw8O
 1PzYtlaN4f0B7eAZaQ7nzR811XcaTmP4p8nzZRqvR3WkRtGGj+/iRRNnP2g5vNy92CDh0DW7fWt
 W8wIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_022017_598244_4B92EA68 
X-CRM114-Status: GOOD (  28.03  )
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

Add support for Partial-IO poweroff. In Partial-IO pins of a few
hardware units can generate system wakeups while DDR memory is not
powered resulting in a fresh boot of the system. These hardware units in
the SoC are always powered so that some logic can detect pin activity.

If the system supports Partial-IO as described in the fw capabilities, a
sys_off handler is added. This sys_off handler decides if the poweroff
is executed by entering normal poweroff or Partial-IO instead. The
decision is made by checking if wakeup is enabled on all devices that
may wake up the SoC from Partial-IO.

The possible wakeup devices are found by checking which devices
reference a "Partial-IO" system state in the list of wakeup-source
system states. Only devices that are actually enabled by the user will
be considered as an active wakeup source. If none of the wakeup sources
is enabled the system will do a normal poweroff. If at least one wakeup
source is enabled it will instead send a TI_SCI_MSG_PREPARE_SLEEP
message from the sys_off handler. Sending this message will result in an
immediate shutdown of the system. No execution is expected after this
point. The code will wait for 5s and do an emergency_restart afterwards
if Partial-IO wasn't entered at that point.

A short documentation about Partial-IO can be found in section 6.2.4.5
of the TRM at
  https://www.ti.com/lit/pdf/spruiv7

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 131 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index c187fb714b3a4c658d0593c844716d4b160e4fa9..fb6f3d7f7413917cf9534ba65f0a9786d1183c71 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3750,6 +3750,116 @@ static const struct dev_pm_ops ti_sci_pm_ops = {
 #endif
 };
 
+/*
+ * Enter Partial-IO, which disables everything including DDR with only a small
+ * logic being active for wakeup.
+ */
+static int ti_sci_enter_partial_io(struct ti_sci_info *info)
+{
+	struct ti_sci_msg_req_prepare_sleep *req;
+	struct ti_sci_xfer *xfer;
+	struct device *dev = info->dev;
+	int ret = 0;
+
+	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
+				   TI_SCI_FLAG_REQ_GENERIC_NORESPONSE,
+				   sizeof(*req), sizeof(struct ti_sci_msg_hdr));
+	if (IS_ERR(xfer)) {
+		ret = PTR_ERR(xfer);
+		dev_err(dev, "Message alloc failed(%d)\n", ret);
+		return ret;
+	}
+
+	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
+	req->mode = TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO;
+	req->ctx_lo = 0;
+	req->ctx_hi = 0;
+	req->debug_flags = 0;
+
+	dev_info(dev, "Entering Partial-IO because a powered wakeup-enabled device was found.\n");
+
+	ret = ti_sci_do_xfer(info, xfer);
+	if (ret) {
+		dev_err(dev, "Mbox send fail %d\n", ret);
+		goto fail;
+	}
+
+fail:
+	ti_sci_put_one_xfer(&info->minfo, xfer);
+
+	return ret;
+}
+
+/*
+ * Iterate all device nodes that have a wakeup-source property and check if one
+ * of the possible phandles points to a Partial-IO system state. If it
+ * does resolve the device node to an actual device and check if wakeup is
+ * enabled.
+ */
+static bool ti_sci_partial_io_wakeup_enabled(struct ti_sci_info *info)
+{
+	struct device_node *wakeup_node = NULL;
+
+	for_each_node_with_property(wakeup_node, "wakeup-source") {
+		struct of_phandle_iterator it;
+		int err;
+
+		of_for_each_phandle(&it, err, wakeup_node, "wakeup-source", NULL, 0) {
+			struct platform_device *pdev;
+			bool may_wakeup;
+
+			/*
+			 * Continue if idle-state-name is not off-wake. Return
+			 * value is the index of the string which should be 0 if
+			 * off-wake is present.
+			 */
+			if (of_property_match_string(it.node, "idle-state-name", "off-wake"))
+				continue;
+
+			pdev = of_find_device_by_node(wakeup_node);
+			if (!pdev)
+				continue;
+
+			may_wakeup = device_may_wakeup(&pdev->dev);
+			put_device(&pdev->dev);
+
+			if (may_wakeup) {
+				dev_dbg(info->dev, "%pOF identified as wakeup source for Partial-IO\n",
+					wakeup_node);
+				of_node_put(it.node);
+				of_node_put(wakeup_node);
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+static int ti_sci_sys_off_handler(struct sys_off_data *data)
+{
+	struct ti_sci_info *info = data->cb_data;
+	bool enter_partial_io = ti_sci_partial_io_wakeup_enabled(info);
+	int ret;
+
+	if (!enter_partial_io)
+		return NOTIFY_DONE;
+
+	ret = ti_sci_enter_partial_io(info);
+
+	if (ret) {
+		dev_err(info->dev,
+			"Failed to enter Partial-IO %pe, trying to do an emergency restart\n",
+			ERR_PTR(ret));
+		emergency_restart();
+	}
+
+	mdelay(5000);
+	emergency_restart();
+
+	return NOTIFY_DONE;
+}
+
 /* Description for K2G */
 static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
 	.default_host_id = 2,
@@ -3893,6 +4003,19 @@ static int ti_sci_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO) {
+		ret = devm_register_sys_off_handler(dev,
+						    SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_FIRMWARE,
+						    ti_sci_sys_off_handler,
+						    info);
+		if (ret) {
+			dev_err(dev, "Failed to register sys_off_handler %pe\n",
+				ERR_PTR(ret));
+			goto out;
+		}
+	}
+
 	dev_info(dev, "ABI: %d.%d (firmware rev 0x%04x '%s')\n",
 		 info->handle.version.abi_major, info->handle.version.abi_minor,
 		 info->handle.version.firmware_revision,
@@ -3902,7 +4025,13 @@ static int ti_sci_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &ti_sci_list);
 	mutex_unlock(&ti_sci_list_mutex);
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
+		goto out;
+	}
+	return 0;
+
 out:
 	if (!IS_ERR(info->chan_tx))
 		mbox_free_channel(info->chan_tx);
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 053387d7baa064498e6a208daa7f70040ef87281..006a3d40ba040f12d0b2dff7fce49b4eefa52517 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -592,6 +592,11 @@ struct ti_sci_msg_resp_get_clock_freq {
 struct ti_sci_msg_req_prepare_sleep {
 	struct ti_sci_msg_hdr	hdr;
 
+/*
+ * When sending prepare_sleep with MODE_PARTIAL_IO no response will be sent,
+ * no further steps are required.
+ */
+#define TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO				0x03
 #define TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED				0xfd
 	u8			mode;
 	u32			ctx_lo;

-- 
2.50.1


