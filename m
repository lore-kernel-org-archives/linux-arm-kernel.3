Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002AACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+/t9bteFAoRNa+cQTzNOtIizDYHm0AvKyEZOiZN2Yo=; b=eFIvVab3SDxSH+eTRPulYte+EI
	RjjmY9YFtY4ZRnnlP5Emi1bB+zRcY8N1mxqYdMMqyvGtQrMivqcgLfOOR7TMaH9bZ/Vyxlh8E6d0O
	wencqdu53yWwUX2lR9l7B/H60VzAizv/7u4vI8NKB3UHNCEVQqL4LFZIB/9rWFTYw/j6L579JE2Za
	x37UugqoPzs9rskg8t7HFkC0IX5A+kfqW9CCd+a2OjW68hDZF0J5450T6n0oNC7Wm99xrZjhc4df8
	kwjoSGMW/6ygj23BUapumFodELS6K7HUUFGrBBJs5osVysor8OBdlpklvf+fLpd0D6IHheUNa/qSb
	ge6DJX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttY-00000009qZ9-3tRU;
	Mon, 03 Nov 2025 12:42:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttV-00000009qVt-3xd5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:42:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b3e9d633b78so1043786466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173764; x=1762778564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+/t9bteFAoRNa+cQTzNOtIizDYHm0AvKyEZOiZN2Yo=;
        b=beivP2XXqbnTUrSYCE/ajvo/lSTw44q3O7o2IX2NflF4iKMZhYB64MQPAbkc9i8TQe
         +jRaz/mWPGBD8szgdRibfIk9QC3GcWys0/SE++qqwsZtdRzzNQHjWBaNkkvSAfJyxtks
         hEL1PqW0LYblTJG8ZMFf4q6CPuUm4nJyMhsezEuTtIPdwotPPYL23PGDL13LOjl/5J3U
         UqmcBT7ki5Y91YtRj+ZjzEXdYOR07Cb2DbBg04GhcyX3X/6bADZ7nYr9Z8Ba9kx2+enn
         Kw4t0kt+IY7BsIwmc3tni4Lje6pOnD1Ul4WAj8bIlCcIyvETsSMQiPg6M8lXCx9pYfu5
         G92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173764; x=1762778564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+/t9bteFAoRNa+cQTzNOtIizDYHm0AvKyEZOiZN2Yo=;
        b=kwKjTY2w1zi3+Av0ONO48x0K7SjlGd1SVZEmwJN1sNyVjtSkDeGs5d+L7h9PaEa5hv
         gzjo2TjnYzB0GwLlN3sl6AEQxdczcdypcWVmMXT7KfREAU1Ac7jlZ+twW+OrEpsIOmmH
         hbBlLXL6D/ZWT22SN2L5bhlaJv3xPxJPCoi0Y+ojdSP5aV6m6XHGTZNs39KwYSLx3XwZ
         puChkpxlnvWMCVl6F8wHjcWC3Bcvx+gW3s88iR/jjq45sE0/ANV/ullzURlqF1IvGT3z
         gBEw11541GH+j4ql+9ha+0o6srHJjncjCWDsB+cEkbAa8Lk56WvZOztnT4ALCwmNJWun
         y/9w==
X-Forwarded-Encrypted: i=1; AJvYcCV6vfBOo7Wqx1UvEutPBtiyXUTNPiJMzPBU9ZsY5QEYgVdo2IZZGrZaF8ZdwCi8pX8nxSUq8u7oIJQl4ET8yyMN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8h8OCTHOH4PV+gp6BGz3eYo9f21z8hVkp75IKW09m9UcW+Sy2
	riRAkx9IhjrYRHa9CtR0CLQY+VZv2rYvMrXwQGqRBoHW79p6xF2Xur6+IfToX81fxuE=
X-Gm-Gg: ASbGncs11jc1UMNp0m7USA9vVIfYQ5xPy5YseN5zm1mDBot+Ug71eCcaWAdzWqUYCdg
	iJXA6avEysRQC/9xUGaGYS4JdXr+4fOEPfJeVIjHCBSaDtatj7IEzY178BdO0+L9gHjKjEdKlKJ
	C2ofgfRs5M+SkFIPrxx57K9sj4WB/XVSs/u6ui5175YezJ17wdBgoOOuA3GDe0FZowHwITSJDbB
	UlAqKfBxVf8CzkaXggQMKnZ03Xz68U5QqofxQPY328LcNvw7qKIGVeekE0TaZKWoUcpucJhxi85
	PCzJQXcO7uvBX50U4ch6Y1IHn5V0ZGHybFvBOpl3dOnC+103VVUfTzMyFqscQixjz4SXTjNSIFC
	ETt3+viLqUM5m1Eu97r3pVYL+dsq9aMYSS7aJpi9tM0xpENFz/WhNklE1+xfCHN2RrT1pYo+iAx
	lgCPdBag==
X-Google-Smtp-Source: AGHT+IFIHqwLMhjGscMYSAijor0+3yh5hRoO0Raw0QVXNoSscDyDDbST6mC5uISlP4ngwkAwYv6teg==
X-Received: by 2002:a17:907:9707:b0:b3c:5f99:dac7 with SMTP id a640c23a62f3a-b706e54eabfmr1302167766b.21.1762173764075;
        Mon, 03 Nov 2025 04:42:44 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b70acf84c51sm510327066b.30.2025.11.03.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:42:43 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:42:20 +0100
Subject: [PATCH v10 2/3] firmware: ti_sci: Partial-IO support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-partialio-v6-12-b4-v10-2-0557e858d747@baylibre.com>
References: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
In-Reply-To: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7313; i=msp@baylibre.com;
 h=from:subject:message-id; bh=3nTf+/ss8Vb1phICCN/rX1fk5ehJsdJVA3tLrFZB+zQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyOxaZpaTeDLddf+spvW/3j+orOe8slzeqzCj/0xrB9m
 MKw/U9ARykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEykT4WR4axrzwFtDSZNw/xn
 1b0bIw8d474xd2f+x602rPGWWU+W5TH8D/oaNmOf/bIZp5XjTz3y9v6t/Ld7U8amrs+Gm0SyWeY
 asAEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044246_027027_C2AEAA1D 
X-CRM114-Status: GOOD (  26.81  )
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

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 109 +++++++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h |   5 +++
 2 files changed, 107 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 2585cb82d1ad8e3d79bca458a2b86cc81a3e627b..811507ded63ac784ad6c6ad77b2f827768f3f3c7 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -1673,6 +1673,9 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 				    u32 ctx_lo, u32 ctx_hi, u32 debug_flags)
 {
+	u32 msg_flags = mode == TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO ?
+			TI_SCI_FLAG_REQ_GENERIC_NORESPONSE :
+			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep *req;
 	struct ti_sci_msg_hdr *resp;
@@ -1689,7 +1692,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
-				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+				   msg_flags,
 				   sizeof(*req), sizeof(*resp));
 	if (IS_ERR(xfer)) {
 		ret = PTR_ERR(xfer);
@@ -1709,11 +1712,12 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 		goto fail;
 	}
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
-		dev_err(dev, "Failed to prepare sleep\n");
-		ret = -ENODEV;
+	if (msg_flags == TI_SCI_FLAG_REQ_ACK_ON_PROCESSED) {
+		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
+		if (!ti_sci_is_response_ack(resp)) {
+			dev_err(dev, "Failed to prepare sleep\n");
+			ret = -ENODEV;
+		}
 	}
 
 fail:
@@ -3667,6 +3671,78 @@ devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
 
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
+	const struct ti_sci_handle *handle = &info->handle;
+	bool enter_partial_io = ti_sci_partial_io_wakeup_enabled(info);
+	int ret;
+
+	if (!enter_partial_io)
+		return NOTIFY_DONE;
+
+	dev_info(info->dev, "Entering Partial-IO because a powered wakeup-enabled device was found.\n");
+
+	ret = ti_sci_cmd_prepare_sleep(handle, TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO, 0, 0, 0);
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
 static int tisci_reboot_handler(struct sys_off_data *data)
 {
 	struct ti_sci_info *info = data->cb_data;
@@ -3946,6 +4022,19 @@ static int ti_sci_probe(struct platform_device *pdev)
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
@@ -3955,7 +4044,13 @@ static int ti_sci_probe(struct platform_device *pdev)
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
index 701c416b2e78f8ef20ce6741a88ffa6fd4853b2d..09eaea54dd5cabce72dd1652c9603e3ab446b60c 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -595,6 +595,11 @@ struct ti_sci_msg_resp_get_clock_freq {
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
2.51.0


