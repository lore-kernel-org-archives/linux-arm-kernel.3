Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A282606D80E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KcIlX2b2;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Dm8azli5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hnRNJDC9zZzpskW7KFxOEfChNL+3CoFVY77+rrtTJUk=; b=KcIlX2b2hCU+S/
	sKR4w3DTpdxoZzie+zoSfMLlvoJwlqpi0k2u7ElqqnCaaDdN1lLuz+LPw0H3PM1tLep2J7u3Daehx
	JD/5K1u9QVzliADZDdyyubZ/GrvqehLO7eWed6TWuz1OdJEmpkrgNrsYeWogIyyLLXOjcw3XE9jEL
	HSqhrtwwg7xMjhbYw58RhQj598XW9G8qNOonlrfx/Kl0CcL3935Q/SQPwj/whUd3Y6c7Gx1vV5CPQ
	/VsMk/BcgsHF+9CJDVBaUDVj8NrxVXQRoj/GB68neokkLZGTbyQz8QGff/xn4dnuurWPE4x3Eb3tI
	Dfc2C/a2En3FaYljcoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONeh-00000003vPf-1DkA;
	Tue, 03 Nov 2026 23:11:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONed-00000003vJb-1u35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:11:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 589581595;
	Tue,  3 Nov 2026 15:10:55 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C54AD3F673;
	Tue,  3 Nov 2026 15:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747458; bh=TheZWpVaLFvYFp0EOHxjK4eXwGVqyf0Ejvl0GkdFhEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dm8azli55m6AwuvsF2cZVyMMUpBi5OYK26MKqFtJcVy6AN3Js6kog8ehGs09k/WvA
	 Ll++b88DJLxT2WzTv0oX9aERuA2aQc8uMnUVvrK6ID/CS2WJN8rL7wYvSaDWpK2Ce+
	 qoR+giYC4iQf1zav2322Sy104Ico+qqkI1N1PqNc=
From: Philip Radford <philip.radford@arm.com>
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
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v10 12/13] powercap: arm_scmi: Add get_power_uw to synthetic node
Date: Tue,  3 Nov 2026 23:10:06 +0000
Message-Id: <20261103231007.537082-13-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103231007.537082-1-philip.radford@arm.com>
References: <20261103231007.537082-1-philip.radford@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151059_566751_3D51919A 
X-CRM114-Status: GOOD (  15.75  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Exposes the current power usage from the immediate children of the
synthetic (root) powercap node. Iterates over pr->spzones and sums per-zone
power. Domains without powercap monitoring are skipped. If none of the
children can be measured, return -ENODATA.

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V9->V10
- skip immediate child zones that do not support power monitoring
- return -ENODATA if none of the synthetic root children can be measured
---
 drivers/powercap/arm_scmi_powercap.c | 46 ++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index 88003564581e..d0255fd42007 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -17,6 +17,9 @@
 #define to_scmi_powercap_zone(z)		\
 	container_of(z, struct scmi_powercap_zone, zone)
 
+#define to_scmi_powercap_root(z)		\
+	container_of(z, struct scmi_powercap_root, instance_root.zone)
+
 static const struct scmi_powercap_proto_ops *powercap_ops;
 
 struct scmi_powercap_zone {
@@ -431,9 +434,48 @@ static int instance_root_release(struct powercap_zone *pz)
 	return 0;
 }
 
-static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *v)
+static int instance_root_get_power_uw(struct powercap_zone *pz, u64 *power_uw)
 {
-	*v = 0;
+	struct scmi_powercap_root *pr = to_scmi_powercap_root(pz);
+	struct scmi_powercap_zone *child;
+
+	u64 p, acc = 0;
+	int i, ret;
+	bool measured = false;
+
+	if (!pz || !power_uw)
+		return -EINVAL;
+
+	for (i = 0; i < pr->num_zones; i++) {
+		child = &pr->spzones[i];
+
+		if (!child->registered || child->invalid)
+			continue;
+
+		if (child->info->parent_id != SCMI_POWERCAP_ROOT_ZONE_ID)
+			continue;
+
+		/*
+		 * The synthetic root reports the sum of measureable immediate children.
+		 * Control-only children do not contribute to the sum.
+		 */
+		if (!child->info->powercap_monitoring)
+			continue;
+
+		ret = scmi_powercap_get_power_uw(&child->zone, &p);
+		if (ret) {
+			dev_dbg(child->dev, "Failed to read child power: %d\n", ret);
+			return ret;
+		}
+
+		acc += p;
+		measured = true;
+	}
+
+	if (!measured)
+		return -ENODATA;
+
+	*power_uw = acc;
 	return 0;
 }
 
-- 
2.34.1


