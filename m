Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C34CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRzNWzGiF7NWCKQsvd+1Gt/+fKC0OXCS0a/+kgcV+R4=; b=SgpZYmkPn+zne4jKFJlxU1jRZG
	P51jjuf/GR3wJBF13pv8ibz800hM2RGI7PM6fLYEgLfRD6xKB2LDlFDEIN4OMsCUgr/xcBMrRayhz
	84BmwuE5g4ytbZP4NViJH/kHG7o9eb90BtITS1YZ9nbviixkGCeAfB9E4kBdLzDlJFebCdmyp9PBV
	7h3LbxBvjFswka5Pp0G6fuoR+OZGmPc5pqHfw8KzfRdhAbWbMwWFNvJTQZLJLIygKqGcZlfOV2++W
	6J67J3nEYf31ieiVXH6po8eMzjmnQnQJfe5xDurpid6y9Aw4JwsM7mU7gm5YmEZJ1naH4w4B483LK
	08QeKVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGP5q-0000000Be5v-1vuB;
	Mon, 12 Oct 2026 23:06:06 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30] helo=mx0a-00082601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGP5f-0000000Be0g-1NZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 23:05:56 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69CJOHNR668018;
	Mon, 12 Oct 2026 16:05:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=jRzNWzGiF7NWCKQsvd+1Gt/+fKC0OXCS0a/+k
	gcV+R4=; b=SdG6vyMa+fajWjgVQwkrJ5+fUHhq35SAeAKZE9WuigSZG93pay/H9
	wUTYAjLvonj6gFu28/xc2Hr09Kud7p9RjU8LRcQGdWKTRzfHLA0zAXA7o9hMJNLv
	PeOkipY/k7+BXNuBtrlNbLnDDViQE8u1qy1OSY2phvzeWwbcgKhuroJAiSBesKQ2
	zcSeZhhD9X6RexLYcjh/N03H825bAk850JkZyZuiMIse66GuPmwtL4F2SCNlDOF7
	Ox78Zn7wVM+4GV4a/BC8GAo61F5ruWxSNxL21XMkZVpK/R+//qg3PrzrW+2MBjCe
	o9Stc7FeXFBSdlgmD3bgO4XuJnoUeMsTw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4h7h19tnap-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Oct 2026 16:05:45 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::8e35) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.49; Mon, 12 Oct
 2026 23:05:33 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] coresight: syscfg: Fail to enable a configuration not loaded on the device
Date: Mon, 12 Oct 2026 16:05:20 -0700
Message-ID: <20261012230527.750567-2-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261012230527.750567-1-aaupov@fb.com>
References: <20261012230527.750567-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1b::8e35]
X-Proofpoint-GUID: 5bTyaQInof-h8AvPkt8ljd84vLF_ygi8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfX6CqRIpwDPrl6
 dCRSVHKZGA2ApmxGYeKoscxqXKYMCNyuDGgFjdt46YipsfZ4NXaV4jI/Kl1v/vbFdG24ahD0rte
 shPvcMpgkhLtBrtk8LGC7xPkgF8o9mw=
X-Proofpoint-ORIG-GUID: 5bTyaQInof-h8AvPkt8ljd84vLF_ygi8
X-Authority-Analysis: v=2.4 cv=HpvjiETS c=1 sm=1 tr=0 ts=6acd67c9 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=FOH2dFAWAAAA:8 a=HF-2DHWplcuDzBJEMXoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA5MSBTYWx0ZWRfX0p3LRXenJ7o/
 1OVyTR4DjmyVJa24SUU5BS3oZNhgfvZ1jw/gQ0Ruwh5YeGTdCKfYrx821FI/yVaWKEL4j0UPO5b
 1DoSYAFar3z6YTZO8BmeZDeyda3C3g3enHO+CO5i9m3h2WEbmqdgEevVZSLHgvfnGiE5InD7Tum
 w7ipcxXBgFfhj6DvcIBFCIsC5Hv1Pl4C3ImpbtzZbY4jsNoNqheck5RLKvtmU3+Ro376dwZfQah
 CxzUq7Gy25HYz2dcoWYsHPsQfI899MuYCC2KKWQtmksZmWlQ+hDxZ+oJx5nsowpXCqzaGBV9/Dd
 5MgeVv5jike1Og9v0u80d38tgrKsuBecVOkchtkU4NxHzufTo6CCzuG9f/+bt48V/yuM3ZoJi7X
 LH7hKoa25ReGVUGVWUh21pw21LnMGLYmWrbvqeNQHaQoxtvVR2m9FC/QvSLc7kRIG3/Yz0xqAUA
 N1RZMBacHVgzIWLJDOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_160555_487886_AE004CEF 
X-CRM114-Status: GOOD (  20.06  )
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

cscfg_csdev_enable_active_config() looks up the selected configuration in
the device's loaded configurations, and returns success when it is not
there. A configuration is only loaded on devices that match at least one
of its features, so a perf session or sysfs enable that selects it on any
other device runs without the configuration, with no error.

Return -EINVAL instead, so enabling the source fails on that device. The
function is only called with a non-zero configuration hash, so sources
enabled without a configuration are unaffected.

Fixes: f8cce2ff3c04 ("coresight: syscfg: Add API to activate and enable configurations")
Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-syscfg.c    | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49c..a816c22c87bc8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1088,36 +1088,39 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
 	raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 
 	/*
-	 * If found, attempt to enable
+	 * The configuration is active but not loaded on this device, because
+	 * none of its features match the device. Fail rather than trace
+	 * without it.
 	 */
-	if (config_csdev_active) {
+	if (!config_csdev_active)
+		return -EINVAL;
+
+	/*
+	 * Call the generic routine that will program up the internal
+	 * driver structures prior to programming up the hardware.
+	 * This routine takes the driver spinlock saved in the configs.
+	 */
+	err = cscfg_csdev_enable_config(config_csdev_active, preset);
+	if (!err) {
 		/*
-		 * Call the generic routine that will program up the internal
-		 * driver structures prior to programming up the hardware.
-		 * This routine takes the driver spinlock saved in the configs.
+		 * Successful programming. Check the active_cscfg_ctxt
+		 * pointer to ensure no pre-emption disabled it via
+		 * cscfg_csdev_disable_active_config() before
+		 * we could start.
+		 *
+		 * Set enabled if OK, err if not.
 		 */
-		err = cscfg_csdev_enable_config(config_csdev_active, preset);
-		if (!err) {
-			/*
-			 * Successful programming. Check the active_cscfg_ctxt
-			 * pointer to ensure no pre-emption disabled it via
-			 * cscfg_csdev_disable_active_config() before
-			 * we could start.
-			 *
-			 * Set enabled if OK, err if not.
-			 */
-			raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
-			if (csdev->active_cscfg_ctxt)
-				config_csdev_active->enabled = true;
-			else
-				err = -EBUSY;
-			raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
-		}
-
-		if (err)
-			cscfg_config_desc_put(config_desc);
+		raw_spin_lock_irqsave(&csdev->cscfg_csdev_lock, flags);
+		if (csdev->active_cscfg_ctxt)
+			config_csdev_active->enabled = true;
+		else
+			err = -EBUSY;
+		raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);
 	}
 
+	if (err)
+		cscfg_config_desc_put(config_desc);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);
-- 
2.52.0

