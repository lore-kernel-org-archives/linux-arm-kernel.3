Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5B2E74AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1zLrRiEN8LsmcX594lJgHZ58Ay1OuYs0O7LJs4SeCg=; b=Hxm5Xi7reiW1xfvcSNOUAfG3Xu
	JAfzoo05UsZw97Ej6eNnOIIi7byny2tCGcbGFn8ZSe4SHLAiENoZ6sz8PlriaJVjlprCcZu6Dd77V
	NmPDSwxCviBtmyG29FZM/liNOqigDe5WImH0S5v+dnA6M1/xI7NT+dWStJeVL/lIWFV0m4PA8+3ZN
	5zYQsn0q8HSGQs74aKQQ3QsdhjISkTW4WaSlbChLIU1t7I1D0mIzgIwDsL6I8SoZvgUI36XfeoRGS
	ASk0julJ5Fsu+Y6xJp6uzc166ZlZZE5q2c1uH2AFUvUk+GblxaxO7qCc22LTic/U6aKLLtLUv9N02
	dsW5kmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZ71-0000000AZd1-3qIF;
	Tue, 03 Dec 2024 20:03:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZ53-0000000AYyg-3Qu2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 20:01:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C509143D;
	Tue,  3 Dec 2024 12:01:37 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB7693F5A1;
	Tue,  3 Dec 2024 12:01:06 -0800 (PST)
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
	johan+linaro@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Support vendor protocol modules autoloading
Date: Tue,  3 Dec 2024 20:00:37 +0000
Message-ID: <20241203200038.3961090-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203200038.3961090-1-cristian.marussi@arm.com>
References: <20241203200038.3961090-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_120109_947126_53A4557C 
X-CRM114-Status: GOOD (  15.29  )
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

SCMI vendor protocols namespace is shared amongst all vendors so that there
can be multiple implementation for the same protocol ID by different
vendors, exposing completely different functionalities and used by distinct
SCMI vendor drivers.

For these reasons, at runtime, when some driver asks for a protocol, the
proper implementation to use is chosen based on the SCMI vendor/subvendor/
impl_version data as advertised by the platform SCMI server and gathered
from the SCMI core during stack initialization: this enables proper runtime
selection of vendor protocols even when many different protocols from
different vendors are built into the same image via a common defconfig.

This same selection mechanism works similarly well even when all the vendor
protocols are compiled as loadable modules, as long as all such required
protocol modules have been previously loaded by some other means.

Add support for the automatic loading of vendor protocol modules, based on
protocol/vendor IDs, when an SCMI driver attempts to use such a protocol.

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZytnRc94iKUfMYH0@hovoldconsulting.com/
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 56 ++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index eeed1689b208..60050da54bf2 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -24,6 +24,7 @@
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/kernel.h>
+#include <linux/kmod.h>
 #include <linux/ktime.h>
 #include <linux/hashtable.h>
 #include <linux/list.h>
@@ -43,6 +44,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/scmi.h>
 
+#define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
+
 static DEFINE_IDA(scmi_id);
 
 static DEFINE_XARRAY(scmi_protocols);
@@ -275,6 +278,44 @@ scmi_vendor_protocol_lookup(int protocol_id, char *vendor_id,
 	return proto;
 }
 
+static const struct scmi_protocol *
+scmi_vendor_protocol_get(int protocol_id, struct scmi_revision_info *version)
+{
+	const struct scmi_protocol *proto;
+
+	proto = scmi_vendor_protocol_lookup(protocol_id, version->vendor_id,
+					    version->sub_vendor_id,
+					    version->impl_ver);
+	if (!proto) {
+		int ret;
+
+		pr_debug("Looking for '" SCMI_VENDOR_MODULE_ALIAS_FMT "'\n",
+			 protocol_id, version->vendor_id);
+
+		/* Note that vendor_id is mandatory for vendor protocols */
+		ret = request_module(SCMI_VENDOR_MODULE_ALIAS_FMT,
+				     protocol_id, version->vendor_id);
+		if (ret) {
+			pr_warn("Problem loading module for protocol 0x%x\n",
+				protocol_id);
+			return NULL;
+		}
+
+		/* Lookup again, once modules loaded */
+		proto = scmi_vendor_protocol_lookup(protocol_id,
+						    version->vendor_id,
+						    version->sub_vendor_id,
+						    version->impl_ver);
+	}
+
+	if (proto)
+		pr_info("Loaded SCMI Vendor Protocol 0x%x - %s %s %X\n",
+			protocol_id, proto->vendor_id ?: "",
+			proto->sub_vendor_id ?: "", proto->impl_ver);
+
+	return proto;
+}
+
 static const struct scmi_protocol *
 scmi_protocol_get(int protocol_id, struct scmi_revision_info *version)
 {
@@ -283,10 +324,8 @@ scmi_protocol_get(int protocol_id, struct scmi_revision_info *version)
 	if (protocol_id < SCMI_PROTOCOL_VENDOR_BASE)
 		proto = xa_load(&scmi_protocols, protocol_id);
 	else
-		proto = scmi_vendor_protocol_lookup(protocol_id,
-						    version->vendor_id,
-						    version->sub_vendor_id,
-						    version->impl_ver);
+		proto = scmi_vendor_protocol_get(protocol_id, version);
+
 	if (!proto || !try_module_get(proto->owner)) {
 		pr_warn("SCMI Protocol 0x%x not found!\n", protocol_id);
 		return NULL;
@@ -294,11 +333,6 @@ scmi_protocol_get(int protocol_id, struct scmi_revision_info *version)
 
 	pr_debug("Found SCMI Protocol 0x%x\n", protocol_id);
 
-	if (protocol_id >= SCMI_PROTOCOL_VENDOR_BASE)
-		pr_info("Loaded SCMI Vendor Protocol 0x%x - %s %s %X\n",
-			protocol_id, proto->vendor_id ?: "",
-			proto->sub_vendor_id ?: "", proto->impl_ver);
-
 	return proto;
 }
 
@@ -366,7 +400,9 @@ int scmi_protocol_register(const struct scmi_protocol *proto)
 		return ret;
 	}
 
-	pr_debug("Registered SCMI Protocol 0x%x\n", proto->id);
+	pr_debug("Registered SCMI Protocol 0x%x - %s  %s  0x%08X\n",
+		 proto->id, proto->vendor_id, proto->sub_vendor_id,
+		 proto->impl_ver);
 
 	return 0;
 }
-- 
2.47.0


