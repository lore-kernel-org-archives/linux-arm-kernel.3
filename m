Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748F3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUeWX502fVlwh9BghioNAXpKdwwOuu383+oRNsrNM+s=; b=KoB3NSbhE88LXog1yEoBNG8+kc
	61My22jq8MxOPbGa3cml974qUmKShoWoqmknMet/zkd+W+mOOBi8QNwt90kgszODgTdZxsh8WHnAG
	ie5k6MxvEbLx1MwbkWKBJlQsPEJTji+As+O7nBYG5QliSHG6kjYGkrvlWI3ie+XQnM0WkU6D8Oha/
	+axP4fZPhJmUkufyVRYKEmSs5v+eeA6+/xBqMosIQpypzhcKFMu75Vf6Rh30mcRE+j6Mmpq58Q932
	Ueft/o3iaP6uAJD8UcFLzUTyd8hDraUsreUt/ePu9u19A1wexjZ+m6U8fTqirTeCuNlBk+GovVXYq
	qWbgGpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShUP-0000000GS5j-3sbl;
	Fri, 20 Jun 2025 19:33:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uShQ0-0000000GRNl-0q29
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 19:28:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA9C16F2;
	Fri, 20 Jun 2025 12:28:35 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 255623F673;
	Fri, 20 Jun 2025 12:28:53 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 1/7] firmware: arm_scmi: Define a common SCMI_MAX_PROTOCOLS value
Date: Fri, 20 Jun 2025 20:28:07 +0100
Message-ID: <20250620192813.2463367-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250620192813.2463367-1-cristian.marussi@arm.com>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_122856_281490_7C042D90 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
SCMI stack.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/notify.c | 4 +---
 include/linux/scmi_protocol.h      | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index e160ecb22948..27a53a6729dd 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -94,8 +94,6 @@
 #include "common.h"
 #include "notify.h"
 
-#define SCMI_MAX_PROTO		256
-
 #define PROTO_ID_MASK		GENMASK(31, 24)
 #define EVT_ID_MASK		GENMASK(23, 16)
 #define SRC_ID_MASK		GENMASK(15, 0)
@@ -1652,7 +1650,7 @@ int scmi_notification_init(struct scmi_handle *handle)
 	ni->gid = gid;
 	ni->handle = handle;
 
-	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
+	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTOCOLS,
 						sizeof(char *), GFP_KERNEL);
 	if (!ni->registered_protocols)
 		goto err;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..6f8d36e1f8fc 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -926,8 +926,11 @@ enum scmi_std_protocol {
 	SCMI_PROTOCOL_VOLTAGE = 0x17,
 	SCMI_PROTOCOL_POWERCAP = 0x18,
 	SCMI_PROTOCOL_PINCTRL = 0x19,
+	SCMI_PROTOCOL_LAST = 0xff,
 };
 
+#define SCMI_MAX_PROTOCOLS	(SCMI_PROTOCOL_LAST + 1)
+
 enum scmi_system_events {
 	SCMI_SYSTEM_SHUTDOWN,
 	SCMI_SYSTEM_COLDRESET,
-- 
2.47.0


