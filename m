Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5383C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTVJrb1KMiSX6/k89A5u7fMLI0c+Iks7685yQqc01NE=; b=ET3DKzTJcFUyMnAhJ3zN5SyE47
	6UzZpffVLCUi/tp/qHkP0KQuJ8vGAT1jXkAAchmCvxBOGuSW9E/8UuZcFvcE/7EkWmKa1A7c1nJqw
	ogxijMCl1IhKaqK3o69P8GRqbQRt8p9u1n9PWx1YuSTa76xSkgNwKN6ieefYeSWKyEfdWS0gb4lUf
	7ebTTFFLBJ0Aruoz/6Az2cLstUkBau3oonfzne3Frw0g1G3zfZ+dxfuMhnSZy5eX383fpmzVzAMUN
	BLuI/a8ZDu1T3CWHh2P16Hkms9zyACje9qg/FbhP5QFwvb9AIzbfA+OKdzHcCltNOrbp2R5H1loFM
	suayNvTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAfw-0000000DeOZ-2NXS;
	Wed, 13 Aug 2025 12:33:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9wk-0000000DYSm-2L7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:47:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A976212FC;
	Wed, 13 Aug 2025 04:47:01 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACA283F738;
	Wed, 13 Aug 2025 04:47:06 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
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
Subject: [PATCH 6/8] firmware: arm_scmi: Add SCMIV4.0 Powercap notifications support
Date: Wed, 13 Aug 2025 12:46:07 +0100
Message-ID: <20250813114609.1305571-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250813114609.1305571-1-cristian.marussi@arm.com>
References: <20250813114609.1305571-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_044710_639727_4A5BBD61 
X-CRM114-Status: GOOD (  12.95  )
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

Extend notification support to the new SCMIv4.0 Powercap format that carry
also a CPL identifier where specified.

Since this addition completes SCMIv4.0 Powercap support bump also the
protocol version define.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/powercap.c | 13 +++++++++----
 include/linux/scmi_protocol.h        |  3 ++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
index 1c4b79249c40..350dd1f135ca 100644
--- a/drivers/firmware/arm_scmi/powercap.c
+++ b/drivers/firmware/arm_scmi/powercap.c
@@ -18,7 +18,7 @@
 #include "notify.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
-#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x20000
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
 
 #define CPL0	0
 
@@ -156,7 +156,8 @@ struct scmi_powercap_cap_changed_notify_payld {
 	__le32 agent_id;
 	__le32 domain_id;
 	__le32 power_cap;
-	__le32 pai;
+	__le32 avg_ivl;
+	__le32 cpli;
 };
 
 struct scmi_powercap_meas_changed_notify_payld {
@@ -1308,14 +1309,18 @@ scmi_powercap_fill_custom_report(const struct scmi_protocol_handle *ph,
 		const struct scmi_powercap_cap_changed_notify_payld *p = payld;
 		struct scmi_powercap_cap_changed_report *r = report;
 
-		if (sizeof(*p) != payld_sz)
+		if (sizeof(*p) > payld_sz)
 			break;
 
 		r->timestamp = timestamp;
 		r->agent_id = le32_to_cpu(p->agent_id);
 		r->domain_id = le32_to_cpu(p->domain_id);
 		r->power_cap = le32_to_cpu(p->power_cap);
-		r->pai = le32_to_cpu(p->pai);
+		r->avg_ivl = le32_to_cpu(p->avg_ivl);
+		if (sizeof(*p) == payld_sz)
+			r->cpli = le32_to_cpu(p->cpli);
+		else
+			r->cpli = 0;
 		*src_id = r->domain_id;
 		rep = r;
 		break;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index a98213bff60a..303d9183e1da 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1125,7 +1125,8 @@ struct scmi_powercap_cap_changed_report {
 	unsigned int	agent_id;
 	unsigned int	domain_id;
 	unsigned int	power_cap;
-	unsigned int	pai;
+	unsigned int	avg_ivl;
+	unsigned int	cpli;
 };
 
 struct scmi_powercap_meas_changed_report {
-- 
2.47.0


