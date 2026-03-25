Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDF4109C028
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnolNDr2YRIPol3ehZ1OAx03F76/7Z3OdJmIDleDJ0Y=; b=bj8kzBiDYAGEoaoIDQsbLWa0ZB
	Qq36eZTZu7E+B6eTXqv3GvEH+6jxBtHrE48M1dLRBDWRqyrAxi4Upldy4m/pWMkgDP+3GVotsKiba
	lLUfdh/DHKPjvlQN4+c2hhAbVoWSIJMa+t3GMc/w3PrT3VKmrMhR0f+FaCUj5NjRTi/D0WGiOUDrT
	As7pqhU4upXxQ1EvAiiDEXKYRhG2q7sFFqK6FxE4P1LyB75Ad5gHbe1mL5J4Qs/S2tfPJS/nG+hwK
	3cFk29AhK5UCuMHyWUnxpdFnv/StJQ5d8UHY8CYbg1KJ2RlIYLA9qxscn8D2lc6yDJft3C3qddvrP
	q9FAM6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCs-00000003a0O-1WRb;
	Wed, 25 Mar 2026 14:27:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCg-00000003ZpD-3GNR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83EFE1F02;
	Wed, 25 Mar 2026 07:27:19 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92C4D3F836;
	Wed, 25 Mar 2026 07:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448845; bh=7dh5iWxzGXXAFal4SI0INIamwAPzqw6CjxK5s8PReGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JQ2cecA7bPA2QGm0dHWk0NDprv6G0Tc7MdVzOYGIDLPONGBLsRGeeLLbpHqE6qtvp
	 WUWlkczMU2BmBH0lbl51ZflakPcBV5UWjh6T5Lv+h5gdoxL2l32XmC7HfajbwSpVrg
	 DAH7ckHw6iI4jl4SiBvLnuuIu456Brd5QTEtzB2g=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:49 +0000
Subject: [PATCH v8 12/23] coresight: Use helpers to fetch first and last
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-12-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448817; l=1751;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7dh5iWxzGXXAFal4SI0INIamwAPzqw6CjxK5s8PReGg=;
 b=4P6DsJs5Sr/MaV9YZsZXlQHI/sJzZG1GrmGyiVSjdJpd5JUDwl7ThxvwmVSq9uxfD6u8U2aI6
 HOg+8m7LeWlA7NHG6T4Eenf3b6l+A89eov8+P22ynW6h/+MFeJnavzq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072726_901792_278866A8 
X-CRM114-Status: GOOD (  11.51  )
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

Replace open code with coresight_path_first_node() and
coresight_path_last_node() for fetching the nodes.

Check that the node is not NULL before accessing csdev field.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ae75c3ce117db5f194f9debd9b329695e0fb0cde..9bbc31389f16b51d399924d44b52b1614f6ffe81 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -134,11 +134,16 @@ struct coresight_device *coresight_get_percpu_source(int cpu)
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_first_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_first_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (!coresight_is_device_source(csdev))
 		return NULL;
 
@@ -661,11 +666,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_last_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_last_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
 		return NULL;

-- 
2.34.1


