Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26F2CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyZI6RmPGOs4Ehi71vaYOB9/BpB0if0Gr/p2irZaz2Y=; b=TW84XwSJWQ7JEOQTwt3j9/U3cU
	7Urshcwalp7WbDdmQ8rJmcC4TXZYItTTnYgMSNm1QJCBfPbBG3jMuVuPR/qCbClRcRslJZFYxiVn2
	EJMqHvEZDuU+YLATGnbGLrBRGoqAufnSDCXlQtqvgMNzpie4ByVJCP3uJu/r1KrZwopqyFAleqQ+z
	afkKOXFHb2i1PMQraNBjeVeiJ7teKjbLBcgudxVe0mzhA+24bsUFexZjR+vEcQBnDiz3SebtqPjlW
	fB/llLAPwcL5HTQefCrWhYKfKWZg9fCPG8r4SkWPIQ0H2HTLrABJwEpFl7xGVoCfaDj+LxZgprRJ3
	Y5aw/axA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2w-00000007ReX-2i6y;
	Fri, 01 May 2026 16:48:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2w-00000007Rco-1DrH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UyZI6RmPGOs4Ehi71vaYOB9/BpB0if0Gr/p2irZaz2Y=; b=P0TTx1EteSwmxtYhR+toVQuNnE
	DRL3+zPm0kgFc6x/AIm5bv3r+zBn9vbFxaKKCrzWEttQVDVwhtgBsJRBLtwsms3s3oHkjAd1RHJm6
	DhYd4Ubc13TNrm8ucQ9+8GzbUKHHmM4HW/rCUi4t8gBvTb8g4NX5GQP1xk2cisD5eTTLUMozbyapZ
	ZOFpwELN1GPwqPqXsyJTmVgrCh8vBdLs0UD2tHUSpNpo2R1zgOhb0BWmE305KhipD8FnYsOA3c538
	4AcLV2sBgpO5R1BEsgJc7v16LLPX9VueUoG3ymX9PZdmWJ6ySEt7vcPJKh6MN+pYLTmQjPaOfcf9c
	3i6Ubmcw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2s-00000009B5J-40z2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92EC2176A;
	Fri,  1 May 2026 09:48:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80F673F7B4;
	Fri,  1 May 2026 09:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654134; bh=GsPLU/i4B7R0xD2zprv2me8RstFV8EytbXp97VUhSOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PJGt32cBTBiMxynD0hetauuy0J7CYl4vXT4Z/HXOZj3RtpwplfZWrkJh5JbH209vD
	 XETMq4EVE2uPbC7g2qC299eZVYOKb2Hp1sCR+k/dC3UEPQCKWs5PWdggZb+bkUP3j7
	 jkyxX8bY4ZuYOUlccA5cIS1vIqMgjTaYYnhPblmI=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:57 +0100
Subject: [PATCH v11 16/27] coresight: Use helpers to fetch first and last
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-16-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=1946;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=GsPLU/i4B7R0xD2zprv2me8RstFV8EytbXp97VUhSOA=;
 b=24z0aU+GaVk5iSr9jUFg7ZtsZJ7TWlCGBGp7APMYBKgtYOwGNl3GI7vX7AMfXcwUp3OM8TCMt
 5xdqjwzu9QQDN4Bk+Qd68lxBi/VmQwEnxAe9Ts3xcN11rS2Wkf1KiSi
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174855_522950_8479D9C4 
X-CRM114-Status: GOOD (  11.60  )
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

Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46b6447ce527b4c30d3f0d57801257f90580cc12..7ca142b77186143aeaf5b9903475e21559b7b2fa 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -165,11 +165,16 @@ void coresight_put_percpu_source_ref(struct coresight_device *csdev)
 struct coresight_device *coresight_get_source(struct coresight_path *path)
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
 
@@ -706,11 +711,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
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


