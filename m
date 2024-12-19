Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEE8E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFRZT6aUXjKTbCGojpalElYCZdqSqNPmKq/izywmlN4=; b=Hwf/luEgXNUGC6PF0F2JsaqGBi
	0BA5o0S55mYZlKz858IRt6IXXmW0XEqVxCSddBfuXBHC36grWn3auDuXu1exUPHpnbGvrHl8FFaa9
	uSAlwou/5gz2ON+NLy1s5RTOwQU19EhI0CITTGYsvrgRnqqACCaLAGvDGvXOv8TGdYZNOMF5zKojl
	1VAIxQaRUopzyP1v4NmJbt//e+Bn451ZonqtDRAWpk8032r5XbbsLYwYzQNmsPCZu5smQcRQwHO0w
	Y1C0fGikYjNSR5gxGMFt/KVaz8IEPS7jZHHZFTZGEtw1C0is/9n7DmyhakRZ+Q/2IhiYdG7ctE4kF
	HRPksiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMtZ-00000002zVD-1z7G;
	Thu, 19 Dec 2024 20:13:17 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMkO-00000002xZb-0oaT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:03:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aabbb507998so223877366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638626; x=1735243426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFRZT6aUXjKTbCGojpalElYCZdqSqNPmKq/izywmlN4=;
        b=HgdBeE1n/P1laHk+W9uaCVMvGtJ2v6o/C0P9f0K8VyfdPAnJK+F4zXr+ltHRzuscFv
         5wwsscDLJw57sSdxQO4zd4BpKFriRUx3U0e5Tmdx2xqwCKDopjUvaCNeIa4HHqK0dTO/
         g/ld3sfKeJ/D30svWxP0OfX5mXOdBWGs6xQ5g4E/WdyOjgcYXx8Z1JoDxRN9jPbX7obZ
         atB6GQ76vHyj++KZAzjYpd5E100LrQ5t+m5YX3QwCzk4/XhJyLJz0ZrFdh2lUovWDTnE
         OITjcXZrZWoVF8eaKhrED+PH1e8lNon+a3h/Q2Q7Ofo3cgdDzQBKGxNpX4rDEQaMtmc8
         3I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638626; x=1735243426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFRZT6aUXjKTbCGojpalElYCZdqSqNPmKq/izywmlN4=;
        b=Au3vTeFy1VPA2/pe4SgTnc7frCyh0/fHjJ2Btp7wy8QlSidXuPES+xl/tfIFBeLGUU
         e719zyRNFfNKpRQh6KyCOYSMhP8gdOife1vHuDUjfV1kFkhQMH9fj/RPOu0dX6rNvEzW
         VreCBCbkUlbIl/4SzPxPhrpVMYoOJA8iwL9T8YzDRg7jGSpSRWIFAu8UZ1lwTOYqJ6jV
         YSk6lU/G07ltkdX5u+Y9A2fh6Om4Meaz87S34J7MX1GmjGiUi0SX8T84rTDL0UCV5EU4
         nU2oM/Ox6RqEFF021pBkjwysIYDj8WpSsFCWnpVyupSvd8DDtRbcdfRtOjFaCATpNa2u
         jHdw==
X-Gm-Message-State: AOJu0Yz6ldocwQdP+2oE+JImNeTJXWBubBLCOQY0SwIulDtoq3Loex+d
	QEjwR8GviQ+oUvdIhC5olvv7CP3E9GlhuokqStP6G3Gh8dmcFQrwfxxpX4Oa8Cg=
X-Gm-Gg: ASbGncuHmZR1I7utwQP7PQXZCbcjasxZLLj0CVgD0MD2NHlyp4Uyg34a7rIG8h9vxa+
	eoL+ZH6QJ0efzhU1wNRNul8uGdecnWC4H2x8bPBYRk59p6RvIZcWfwYchvaEWtnx3IGnxMo8Kia
	er+vNrSFUbxIbJJUGhuWV828oaWiHTvdVI0qYF2suCYvLX6+l3pNKuQcf34UUVRzHjGOKFlTmJ0
	3jYbPFtCEok/3o5MgO8WrsuymFCPLHo314jXxOcW8Dcd0Wy7A==
X-Google-Smtp-Source: AGHT+IEUHdNFbmAQ3AycKsc1OqVii/2jmmJDssrKygmG3svwpvJf2fJe2z0LuAZH9swXToIpEPPk/w==
X-Received: by 2002:a17:907:3d8a:b0:aab:9842:71f9 with SMTP id a640c23a62f3a-aac2ad8c58dmr5033166b.22.1734638626100;
        Thu, 19 Dec 2024 12:03:46 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm98016366b.183.2024.12.19.12.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:03:45 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 19 Dec 2024 21:02:13 +0100
Subject: [PATCH v4 2/4] firmware: ti_sci: Partial-IO support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-am62-partialio-v6-12-b4-v4-2-1cb8eabd407e@baylibre.com>
References: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
In-Reply-To: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6234; i=msp@baylibre.com;
 h=from:subject:message-id; bh=rrxkM9wENQkQ5BRvp3GV3Fgk68SnQpzcLBWyU5asn80=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTavhLGkUXvH4w9/vuA289jCQ/sJ2Szn3/On7dpYsBP
 kVvqmfLdZSyMIhxMMiKKbLc/bDwXZ3c9QUR6x45wsxhZQIZwsDFKQATOTeB4b/D7DXBOyd2G66e
 lTqxX/OJ36E96avWPr6x1P2PuMkULt3nDP+Uvuq99HbiuvmpKHCn8kOe038VGSSETe6edjm+Skx
 hzhpOAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120348_242428_EEFCB273 
X-CRM114-Status: GOOD (  26.25  )
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

The possible wakeup devices are found by checking which devices have the
"poweroff" in the list of wakeup-source power states. Only devices that
are actually enabled by the user will be considered as an active wakeup
source. If none of the wakeup sources is enabled the system will do a
normal poweroff. If at least one wakeup source is enabled it will
instead send a TI_SCI_MSG_PREPARE_SLEEP message from the sys_off
handler. Sending this message will result in an immediate shutdown of
the system. No execution is expected after this point. The code will
wait for 5s and do an emergency_restart afterwards if Partial-IO wasn't
entered at that point.

A short documentation about Partial-IO can be found in section 6.2.4.5
of the TRM at
  https://www.ti.com/lit/pdf/spruiv7

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 115 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index ec0c54935ac0d667323d98b86ac9d288b73be6aa..693ac816f8ba3941a9156bd39524099ca476d712 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3746,6 +3746,100 @@ static const struct dev_pm_ops ti_sci_pm_ops = {
 #endif
 };
 
+/*
+ * Enter Partial-IO, which disables everything including DDR with only a small
+ * logic being active for wakeup.
+ */
+static int tisci_enter_partial_io(struct ti_sci_info *info)
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
+static bool tisci_canuart_wakeup_enabled(struct ti_sci_info *info)
+{
+	struct device_node *wakeup_node = NULL;
+
+	for (wakeup_node = of_find_node_with_property(NULL, "wakeup-source");
+	     wakeup_node;
+	     wakeup_node = of_find_node_with_property(wakeup_node, "wakeup-source")) {
+		struct platform_device *pdev;
+		int index;
+
+		index = of_property_match_string(wakeup_node, "wakeup-source", "poweroff");
+		if (index < 0)
+			continue;
+
+		pdev = of_find_device_by_node(wakeup_node);
+		if (!pdev)
+			break;
+
+		if (device_may_wakeup(&pdev->dev)) {
+			dev_dbg(info->dev, "%pOF identified as wakeup source for Partial-IO\n",
+				wakeup_node);
+			put_device(&pdev->dev);
+			of_node_put(wakeup_node);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int tisci_sys_off_handler(struct sys_off_data *data)
+{
+	struct ti_sci_info *info = data->cb_data;
+	bool enter_partial_io = tisci_canuart_wakeup_enabled(info);
+	int ret;
+
+	if (!enter_partial_io)
+		return NOTIFY_DONE;
+
+	ret = tisci_enter_partial_io(info);
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
@@ -3889,6 +3983,19 @@ static int ti_sci_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO) {
+		ret = devm_register_sys_off_handler(dev,
+						    SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_FIRMWARE,
+						    tisci_sys_off_handler,
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
@@ -3898,7 +4005,13 @@ static int ti_sci_probe(struct platform_device *pdev)
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
index 053387d7baa064498e6a208daa7f70040ef87281..dec9e20cbe5da8f6d9393d56bb9a1e73cb083a42 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -592,6 +592,11 @@ struct ti_sci_msg_resp_get_clock_freq {
 struct ti_sci_msg_req_prepare_sleep {
 	struct ti_sci_msg_hdr	hdr;
 
+/*
+ * When sending perpare_sleep with MODE_PARTIAL_IO no response will be sent,
+ * no further steps are required.
+ */
+#define TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO				0x03
 #define TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED				0xfd
 	u8			mode;
 	u32			ctx_lo;

-- 
2.45.2


