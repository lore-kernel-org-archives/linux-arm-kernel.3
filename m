Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64B6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a1mbvCMn3XwC0PBtIyIiFWpjjAurXmIwAPDT7wRHCMU=; b=c/6ZZG9UDjBSnLlyWiShuYfSGN
	RyzNhQG+WHtXV+UwirGMkt2pO+fZ9pJDfo2YneePQ3iZODSc1+kiz+4iuzlO3rnDjHnEoTdWS1R6X
	Y09T7RAcHmuc7sRrTj3ObT2JHSGYjaP0nLciNMY1PwRi+x2iDF5tKo/KCIKxUeJrLGqbmFab1Vv33
	f0xuogIQ80VKdfY/DecXP9Rvg6UUtAym1Orxk5/R4ytTttLqT240o2Oq9X/hHxNHiWcDQ/3BFkIUo
	CFaEcajOtv5lBSW6vWtPJBYesKj8SWxyW8ythuRtRlY7LZiFrvoac8MOZb7NRZiXT4BAHn+Uuo+G8
	t46/1w4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvaR-00000005pm1-2F16;
	Wed, 02 Apr 2025 10:44:47 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvYg-00000005pXO-2Jp9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:42:59 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30bd21f887aso46866351fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 03:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743590576; x=1744195376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a1mbvCMn3XwC0PBtIyIiFWpjjAurXmIwAPDT7wRHCMU=;
        b=jMOAD+3Fmx4e70d1ScHEI1lux3VM687WN6huefeR+cT6txtFBPk40NjeuWd1LJc+4B
         2h67/OADJbT3mOf7RvUyyhT+uVZYe8Gy2sv8OKB1xLtdoFHqpqT2EM1SprgGc+zLDcoU
         dKtAP/HWwkxFuATJr+v4vvEKi89+0Y/ZiepcMwQ+Req1WqlFxq4j+wlWZtusQ2CZyfLt
         2ctaS3K3mZaboL8zJCWg0KlA5/23BvorNPKt1XYCPt0DK0Z768rY9i7uAdsInFJ4GhDI
         gjXixBLXZsaDfsjMRqJP8SuWdqem+syuq4h5q4yljBLUu2931l0cAM9CyFgnCJiYsrQS
         5YGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743590576; x=1744195376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1mbvCMn3XwC0PBtIyIiFWpjjAurXmIwAPDT7wRHCMU=;
        b=Y5OXMsPrjkplEPqEjXq29e65g1WIUxyctHDbSbix/OzFo3AqG4PjOUe5zwxW9nGVCY
         qK2F5lZPkrEn6u4ywYbd9FDMMoWfOYx/LtwevqQPGm3EqHtU7a/HytvFGNcdEImKTSo0
         P5dvFeo5nk7ESHx9eo6HRutCfKV12gwi1hdlQ0ApYi06YgT3tBYtZMUc2sb7W3XGoj+3
         qdBgEkKs1FFIyZ5wyQa3hKr6mzi7jePCGmEUSYH5FJhVJ3w0EpZuQM4PGzGhTGtbI/BZ
         q3ijD0p3Q8aANDdN5ELZnPi7rocja4xCj6QtJOP78HZ9L/QYF3KlpzrCL070ClB17K+t
         C9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUctCUwjxaUtYQhh6JJgyU37LJy1YAQztznxCzYCdKfYP5kRhOziRiN8Q+1X1r5Loq+WA+TsHY5cGzObxKMkSkT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9KQDNZFGXkq8zix1Mlo5JBT5r8KeUwux8IKs2eZLDYvaubrlQ
	pPlInYL1FygwFC2oDudJUr3A9PiW1caXXa6SFZ9b2Boi53K2i7Fm
X-Gm-Gg: ASbGncv0PnrFVEQvkonPXChbYnN+J5zcHDhh3fmnExD2njMq/hbsI6gB/N8FdRdXrZu
	GdMnLjiacI7Uefm8USg/ooSV4CfpsXob4tmSk5EmwyN1aKr4wkLkyF+loBJtq+/noxDyCXCMCZi
	14Tx+DnZW+iXMONYYTJs1CbFwQGdPiL0gnznbLxXQa7cTGYZbVr662XF76HFLYuOnI7CdapeOyY
	WbHgiaIKmBQwWelGwOcdXOAGZrMgqBDGTUYddTn/Vk9OnrD+Kcy/v76WJEdDvYMJ/LtArcXQiNz
	fNXWOt4TPaw6b1ou+UGhxAdMiq7fS4jtBqzCBdB6XN9F0L2++nHJQ4mY
X-Google-Smtp-Source: AGHT+IHUnkrYXSw/2I9Wcm8+rw+8y4bSPSdJ8VkZy3rq67co93W4W8kouj6dzFPAvTT6KftaxQ23kw==
X-Received: by 2002:a2e:bd84:0:b0:30b:d562:c154 with SMTP id 38308e7fff4ca-30de0278501mr68735231fa.19.1743590575982;
        Wed, 02 Apr 2025 03:42:55 -0700 (PDT)
Received: from NB-5360.corp.yadro.com ([89.250.166.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2ab84afsm21033121fa.35.2025.04.02.03.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:42:55 -0700 (PDT)
From: Matthew Bystrin <dev.mbstr@gmail.com>
To: arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] firmware: arm_scmi: add timeout in do_xfer_with_response()
Date: Wed,  2 Apr 2025 13:42:54 +0300
Message-ID: <20250402104254.149998-1-dev.mbstr@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_034258_590761_E64E38A9 
X-CRM114-Status: GOOD (  17.06  )
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

Add timeout argument to do_xfer_with_response() with subsequent changes
in corresponding drivers. To maintain backward compatibility use
previous hardcoded timeout value.

According to SCMI specification [1] there is no defined timeout for
delayed messages in the interface. While hardcoded 2 seconds timeout
might be good enough for existing protocol drivers, moving it to the
function argument may be useful for vendor-specific protocols with
different timing needs.

Link: https://developer.arm.com/Architectures/System%20Control%20and%20Management%20Interface
Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
---
 drivers/firmware/arm_scmi/clock.c     | 2 +-
 drivers/firmware/arm_scmi/common.h    | 1 -
 drivers/firmware/arm_scmi/driver.c    | 6 ++++--
 drivers/firmware/arm_scmi/powercap.c  | 2 +-
 drivers/firmware/arm_scmi/protocols.h | 3 ++-
 drivers/firmware/arm_scmi/reset.c     | 2 +-
 drivers/firmware/arm_scmi/sensors.c   | 4 ++--
 drivers/firmware/arm_scmi/voltage.c   | 2 +-
 include/linux/scmi_protocol.h         | 1 +
 9 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 2ed2279388f0..4b5cd73384c3 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -596,7 +596,7 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
 	cfg->value_high = cpu_to_le32(rate >> 32);
 
 	if (flags & CLOCK_SET_ASYNC) {
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_msg_resp_set_rate_complete *resp;
 
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 10ea7962323e..34527366c909 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -29,7 +29,6 @@
 
 #define SCMI_MAX_CHANNELS		256
 
-#define SCMI_MAX_RESPONSE_TIMEOUT	(2 * MSEC_PER_SEC)
 
 #define SCMI_SHMEM_MAX_PAYLOAD_SIZE	104
 
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1c75a4c9c371..51c6634d5505 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1490,6 +1490,7 @@ static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
  *
  * @ph: Pointer to SCMI protocol handle
  * @xfer: Transfer to initiate and wait for response
+ * @timeout_ms: Delayed response wait timeout, if unsure use SCMI_DEFAULT_TIMEOUT
  *
  * Using asynchronous commands in atomic/polling mode should be avoided since
  * it could cause long busy-waiting here, so ignore polling for the delayed
@@ -1509,9 +1510,10 @@ static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
  *	return corresponding error, else if all goes well, return 0.
  */
 static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
-				 struct scmi_xfer *xfer)
+				 struct scmi_xfer *xfer, unsigned long timeout_ms)
 {
-	int ret, timeout = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
+	int ret;
+	unsigned long timeout = msecs_to_jiffies(timeout_ms);
 	DECLARE_COMPLETION_ONSTACK(async_response);
 
 	xfer->async_done = &async_response;
diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1fa79bba492e..82565dacd301 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -386,7 +386,7 @@ static int scmi_powercap_xfer_cap_set(const struct scmi_protocol_handle *ph,
 	if (!pc->async_powercap_cap_set || ignore_dresp) {
 		ret = ph->xops->do_xfer(ph, t);
 	} else {
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_msg_resp_powercap_cap_set_complete *resp;
 
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index aaee57cdcd55..b1e3cf3601fe 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -307,7 +307,8 @@ struct scmi_xfer_ops {
 	int (*do_xfer)(const struct scmi_protocol_handle *ph,
 		       struct scmi_xfer *xfer);
 	int (*do_xfer_with_response)(const struct scmi_protocol_handle *ph,
-				     struct scmi_xfer *xfer);
+				     struct scmi_xfer *xfer,
+				     unsigned long timeout_ms);
 	void (*xfer_put)(const struct scmi_protocol_handle *ph,
 			 struct scmi_xfer *xfer);
 };
diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..a458b1c16c51 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -198,7 +198,7 @@ static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
 	dom->reset_state = cpu_to_le32(state);
 
 	if (flags & ASYNCHRONOUS_RESET)
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 	else
 		ret = ph->xops->do_xfer(ph, t);
 
diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/arm_scmi/sensors.c
index 791efd0f82d7..9a07399237f5 100644
--- a/drivers/firmware/arm_scmi/sensors.c
+++ b/drivers/firmware/arm_scmi/sensors.c
@@ -871,7 +871,7 @@ static int scmi_sensor_reading_get(const struct scmi_protocol_handle *ph,
 	s = si->sensors + sensor_id;
 	if (s->async) {
 		sensor->flags = cpu_to_le32(SENSOR_READ_ASYNC);
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_resp_sensor_reading_complete *resp;
 
@@ -943,7 +943,7 @@ scmi_sensor_reading_get_timestamped(const struct scmi_protocol_handle *ph,
 	sensor->id = cpu_to_le32(sensor_id);
 	if (s->async) {
 		sensor->flags = cpu_to_le32(SENSOR_READ_ASYNC);
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			int i;
 			struct scmi_resp_sensor_reading_complete_v3 *resp;
diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/arm_scmi/voltage.c
index fda6a1573609..26b1f034256b 100644
--- a/drivers/firmware/arm_scmi/voltage.c
+++ b/drivers/firmware/arm_scmi/voltage.c
@@ -348,7 +348,7 @@ static int scmi_voltage_level_set(const struct scmi_protocol_handle *ph,
 		ret = ph->xops->do_xfer(ph, t);
 	} else {
 		cmd->flags = cpu_to_le32(0x1);
-		ret = ph->xops->do_xfer_with_response(ph, t);
+		ret = ph->xops->do_xfer_with_response(ph, t, SCMI_DEFAULT_TIMEOUT);
 		if (!ret) {
 			struct scmi_resp_voltage_level_set_complete *resp;
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..2426daae8a87 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -16,6 +16,7 @@
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
 #define SCMI_MAX_NUM_RATES		16
+#define SCMI_DEFAULT_TIMEOUT		(2 * MSEC_PER_SEC)
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.47.2


