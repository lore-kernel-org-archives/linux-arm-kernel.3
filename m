Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC2C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8TvCK+RG35R/4gv0hNWzadg5EF52sa9a+taDqgEb+4=; b=vRfOOv5158QD4lSqSKfW9ba5Jd
	/v2TiO/i1QX0DYuJi0vA3DspfEAsjxgLBbKxAVApUtUKzmoka/ZM24nbYhNyUAyptym3JqlDSX72v
	b4grwafw29xp6tU1OrupH1qwrxI9rDDEjTL/ycKi+JoEpXLwn2TRiDb4L3AB6/9h5fv35rM4ifxDO
	O8TYypu9aWyl5VHPNpL9zu7Dslo6otOE34d/Lgx7RF8ONkHVQdgF9EsvjKCQwClSgD82u2l2DMK0U
	5bAfF/FaOxVV5RLLSchdh16vmxNbt9Jq9oP6eocBuPeBZKTMbPXsOD7gBSrrFO8P7hrtrXH62imvt
	QssQayIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3VZ-00000005AlE-12Qu;
	Mon, 17 Feb 2025 15:58:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Dc-000000055XP-0pTE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34A01152B;
	Mon, 17 Feb 2025 07:39:55 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50C3B3F6A8;
	Mon, 17 Feb 2025 07:39:35 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:48 +0000
Subject: [PATCH v3 07/19] firmware: arm_ffa: Handle the presence of host
 partition in the partition info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-7-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=6tk8gj2eQR3xF36vKVIBCFo6uvkjtZ49zGerQFo2eXY=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1guFR2P3ZAYTDXm79bampucM4MzsML2AAF1Z
 wlfbUOBIBOJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLgAKCRAAQbq8MX7i
 mA9gEAC/s7Ip5MiS5BNwl3ycwMoksoHHeMdXCXWGldQWd4NYn/MI0Vp63/rrUiQp2ZPkfPobLD9
 aIyQP/QiPRSsl0uPiJbJxUjgKVGWxtXzIkmuC6w6nqzEDWpw6lbSHe55e3WIVuMCBBSS24VRYN2
 XsI91tS+cOQMftfLSXmBW4RJgwB4f7zVhz2nxOJTCe5zmlLl5hc4V1NFCFii5d4lRkx8wiKbK7g
 GvmeTPDyPFx+cwSfiCrVAhrQ12TW1HcoJTZ7L8Gb2OKdaLSDAJop6/HHzXL9SmuFHX2XVFfW/+K
 A20jqhQzcYikgSN5Gw5edq7eCiY9hSodIXBm7vfmpJxbzd8Ac7EkWlwcL0sB2EmKDnOhnMYe7Ka
 nKcGpQ3c9e4Jf9GojZ47uFmw8h8iOuQTTVpdd/Y8nJTetRb/VahjdnTDUouyTtNMc/nsSwSieKf
 J679LyxffXfO3gqNU1sFd9stK/Z8lU9cf99g5WzJV3y0NT5d1tjrn9MbBZZ/cQgIbpGaiA3k89L
 GckMHKc47WtYpJB1GUVoy6dLWANzF/YkvznKT0oB7olu5avlhOCBUm4lufyumg9i2zw4tfngNPD
 edeHnGh/82UGjpO5pF6o6+ahLiZzlQHrEc+QrJAi6jRTFXZcqbFY5z6DzZ9H6q4b9UHOjI7aq/4
 VRN2Luipkw1WgDA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073936_287355_D766245F 
X-CRM114-Status: GOOD (  13.93  )
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

Currently it is assumed that the firmware doesn't present the host
partition in the list of partitions presented as part of the response
to PARTITION_INFO_GET from the firmware. However, there are few
platforms that prefer to present the same in the list of partitions.
It is not manadatory but not restricted as well.

So handle the same by making sure to check the presence of the host
VM ID in the XArray partition information maintained/managed in the
driver before attempting to add it.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2994b5ee63bc7feafc15e535cf8a2d46e6003968..320ae654cb968ef573995764d9d35c027d74a33b 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1488,6 +1488,10 @@ static int ffa_setup_partitions(void)
 
 	kfree(pbuf);
 
+	/* Check if the host is already added as part of partition info */
+	if (xa_load(&drv_info->partition_info, drv_info->vm_id))
+		return 0;
+
 	/* Allocate for the host */
 	ret = ffa_xa_add_partition_info(drv_info->vm_id);
 	if (ret) {

-- 
2.34.1


