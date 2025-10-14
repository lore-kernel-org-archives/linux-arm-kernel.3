Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49007CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VZIuv6rs55qXkXGwF1ZAX9Y6SQcpdg3nCRclLuasCE=; b=zw7mNEqiTskLQTLq0vOPROKpte
	nkrccCm0/qy37Hty+I5WZ36pDkJgW6/x7Yr6tYE67dZb45LSsFvt/xg5KVhVtCI7Aa7/zt7IGu06P
	f/rzE5HxzJRe7jnZy2fPcJqSrEV2O5UaNjwP0CP8AZ/Dp+3KnvJ6jROXdo/2IXHRpGV+lJu/mivSN
	Kj4jqhfq5CW8ZijbFnMMjB6HHxcZwfYEqMU9xBGwkuE3dnsSLAGxYc1Iv1CHHB8Sa9LGFSacyTOsi
	N5PLsNfAxYZMyhLstHNDVLnR7wAAxC6PK6306J4NQiEEEXFU/jS29WD1oaCtIQy0euQ04Ud2Q8L/U
	GxAI2C0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dcw-0000000GAfC-1dzY;
	Tue, 14 Oct 2025 11:55:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dcr-0000000GAb3-151K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:55:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 413CB2008;
	Tue, 14 Oct 2025 04:55:23 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E9603F6A8;
	Tue, 14 Oct 2025 04:55:29 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 3/3] firmware: arm_scmi: Skip RAW initialization on failure
Date: Tue, 14 Oct 2025 12:53:46 +0100
Message-ID: <20251014115346.2391418-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014115346.2391418-1-cristian.marussi@arm.com>
References: <20251014115346.2391418-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_045533_353892_3B1CA80F 
X-CRM114-Status: GOOD (  10.91  )
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

Avoid attempt to initialize RAW when the debug subsystem itself failed to
initialiaze as a whole since it is useless and emits misleading error
messages.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1cd15412024c..eb46694cb14b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3028,9 +3028,6 @@ static int scmi_debugfs_raw_mode_setup(struct scmi_info *info)
 	u8 channels[SCMI_MAX_CHANNELS] = {};
 	DECLARE_BITMAP(protos, SCMI_MAX_CHANNELS) = {};
 
-	if (!info->dbg)
-		return -EINVAL;
-
 	/* Enumerate all channels to collect their ids */
 	idr_for_each_entry(&info->tx_idr, cinfo, id) {
 		/*
@@ -3202,7 +3199,7 @@ static int scmi_probe(struct platform_device *pdev)
 		if (!info->dbg)
 			dev_warn(dev, "Failed to setup SCMI debugfs.\n");
 
-		if (IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT)) {
+		if (info->dbg && IS_ENABLED(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT)) {
 			ret = scmi_debugfs_raw_mode_setup(info);
 			if (!coex) {
 				if (ret)
-- 
2.51.0


