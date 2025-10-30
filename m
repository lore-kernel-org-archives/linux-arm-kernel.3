Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8C8CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJU/7pOy6k5Otq6sscIBJ2rwBspnn6iIa72yddH68yU=; b=nIubCMaga19QhzoR3Q7P6Uc8vN
	gODtyWVINHQo8mFBLAdKf/Llh7gV3rdpQP521T5SSiRUTkTTe7c+Fma6AlmnxZGi8M+RcLE/UyO9j
	bZJMQWRquDlZxeilHj8oaf1ckzweW9cgBVbsuAM2U3qFJbaazV5bZsfkQIIP/vERk3UW1dMULlxeK
	T73bHkUv3FTNXLPVDl9WDiu6YmRhSEOt7/3S/e99dVb3OrZiwV0vFYtf8pcK/NO6WyrtL6kbglwCQ
	1D9nX3MjpD1am9NKy7DPkoPxsKUKlWJmUPcN706vt6NnXFdEZIgITDuajujPoPMf+BdYmw8yUyZbC
	g63V2d9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOw7-00000003rQd-2njx;
	Thu, 30 Oct 2025 09:27:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOvy-00000003rN4-12cK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:27:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47721743fd0so4289365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761816424; x=1762421224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJU/7pOy6k5Otq6sscIBJ2rwBspnn6iIa72yddH68yU=;
        b=Is2MjhAOXFMX6WQo47Xjs4ISASoBa7SRtGehzkldP87DjlCITBo3LTmIaVf6/htvw4
         7zcSLT5RV6aaKHdXJ3qjwXjtNQIS3Na6mHmgjGzmLOekCDC4sa4dh7vNaqdjRtP3Z/g4
         h7PgSBB4CsmWO6QQNAWstaO7zMlDQiZEYmE5MjYAGKO+w3arlYWx5kgEyWuPoIZNvc/3
         G5E4HQrXK0aAV1I03U9jejc2H7xV7nSr+87eG9jPQbsIg6Fmee3iXjuj1BtYEaqWb4AX
         DOdFlMIODm0V6yUSwxOe2h7qnhC0ahg72wqDwKGRfPm4zUkbwEpEaap/zwrTb1x7hJEk
         qafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816424; x=1762421224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJU/7pOy6k5Otq6sscIBJ2rwBspnn6iIa72yddH68yU=;
        b=uBTEfNIU9OPJ48CbdJdSmjAYJC9KjEWLKOkaLOD1Zt2mFDRybwN3IGn3PfBa2G0zoo
         hgvbL6bC/xjDAHcA9GXcxjSePMUAJ0arvbY7IKOxAIthwit2e2oRl7K3BZ8VyuOjSpLu
         k0iGtGg7o0y+pLlPBmT9kpfaY3U/XMT3pZSKBvb3kAILCBpnRGrdm1tGhhPx7RiIavUO
         7yzuBVIUagQdQmTjOs/Vil4GOAmgwakHhpE2JmCertuOP5D/A3VxEuiYMFtnNiBKW8jh
         qeny1D1+PNDNC7E9NE6dRWZKhr1GUHmfjJd+PnB4nxB2Pvg/hIuxRdYPn5O8rEV15xD1
         9SGg==
X-Forwarded-Encrypted: i=1; AJvYcCXbhnB3GwLYB/99gVWAueL84xc+OdV2kJngT4BAeM7CMV9k6nlyGpjEPkG7DeeZ2+GvCjX6AiRfEJBmgLtnkP9u@lists.infradead.org
X-Gm-Message-State: AOJu0YzrfNPwErO73zbJ+W5lazWWqCXV3NjEUg5cO+y8UZ/euQYxWGPi
	kuDkYqAjbQyPkiVP9yCpOlxcXBiUmrSvcdf1b9v1Dc0QiLocqifzRhsJphA9HEcVc7g=
X-Gm-Gg: ASbGncu1Dtko9WwEzhpywug3wR9QrGUG2hUyf9MRWEPbTqqPsFw986Rby72jFNZyMEJ
	fVrKD8v5d5Rq71Bv+4vgLJEEeqvdvIZK9co5Zs15mQteGd8HrMVx0CyhzDUaqnU6+k7Th1k6YIK
	IsTuiw3znE9T9fG3yfd+G7CnOTkjTKccseMDTxOuSjyGLeFi4QBLMZEWnQ3t3yAov47HW7JDX/j
	AKkWcbEPRJ5BLnNPPzPVBp88RQCyOKWiTJuXembPvnzcuolkXT4d8o//fJM45/AvvZXXdocf5Uj
	rMi1OqXKF8lvOSz3vV7qs4KDIV1RBI97eGkrcWk3wiktIP8jlzC4ozIt0puAsFnWEt32SEu9Ros
	Hh+YJNerSXPiAuqsQo1L774AGVCL1JOI7BVBvsDK0yb+cqDiVKKtt+PPu/FI07O35090BWj68OA
	==
X-Google-Smtp-Source: AGHT+IGiKMp7FmmJWvCzcPKsR4nFMCkOPRvUXCQdoKXYcyEIZ/3Nl23pSGaG1drR1Wm1x82x0LhDRQ==
X-Received: by 2002:a05:600c:6303:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-4772675fffdmr19910835e9.4.1761816424323;
        Thu, 30 Oct 2025 02:27:04 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952b79cbsm31002262f8f.4.2025.10.30.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:27:03 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:26:10 +0100
Subject: [PATCH v9 3/3] firmware: ti_sci: Partial-IO support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b@baylibre.com>
References: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com>
In-Reply-To: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7001; i=msp@baylibre.com;
 h=from:subject:message-id; bh=26F0Bvu56G754C2jeroEex8fImMoz0+Y7BY0qxomFcU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxmfR/5LunG1oM/Zvep7WJM4vz1fIqe7/y9kefYt956N
 FNosdrcjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjI/m6Gf8Y/D854mCh9wMBS
 NOW4C+e5u6Km5uEtPfl8L5t7FsQ0BTMydMRfOZx8Pm5NlLbHIk/VQ4L6C8+vzzcOO2P5+oX7h6M
 r2QA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022706_355655_9F230FE0 
X-CRM114-Status: GOOD (  27.07  )
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
 drivers/firmware/ti_sci.c | 132 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 4db84a92a517b0aa7bb8d47e809d9848a16e2cc4..f2922fccfbe748a436cb9aa0a8c8e5f48db02ef9 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -6,6 +6,7 @@
  *	Nishanth Menon
  */
 
+#include "linux/dev_printk.h"
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
@@ -3663,6 +3664,116 @@ devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
 
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
+	dev_info(info->dev, "Entering Partial-IO because a powered wakeup-enabled device was found.\n");
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
 static int tisci_reboot_handler(struct sys_off_data *data)
 {
 	struct ti_sci_info *info = data->cb_data;
@@ -3941,6 +4052,19 @@ static int ti_sci_probe(struct platform_device *pdev)
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
@@ -3950,7 +4074,13 @@ static int ti_sci_probe(struct platform_device *pdev)
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


