Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A647DC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 13:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2ThhmNqFT6d/2eLiPpP/gK+PRLYH4r04puKywqLfY0=; b=fbNE16TIc9TGZE5L5Lvq5jqJWW
	NI6gCTm4SOQrNqd76FWUUCZ+CVNKEsm/LL/HVjvDOIatBeIW8YGbMfS9r+mAw9rdQWw+/niCFPbc6
	9My5Y0zAQKG7OUQY2dKRlci8bbzxlz7cXWdODkzL5c8VpuAuWVlFioVppcnBVyF0VY+4yFQhE+Jp3
	Om/VrfyWfy1lTZrjvVVnZelI1BCTsrclxaesOFCHMC7Tpdkw90yBzPQzS7Zd7nLJT8IJpGXOGRvRa
	Nhj8Z3YDZd3ZI8bkfcyRE1IJADE7iD5B8GLuNgyqjf4ZJJci/OSir6kmzStcQL4oDIrMlFBczYss/
	HerwwnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OGl-0000000CA5u-0zZa;
	Tue, 01 Sep 2026 13:11:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OGk-0000000CA5n-0w1q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 13:11:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F419E41843;
	Tue,  1 Sep 2026 13:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC0B1F000E9;
	Tue,  1 Sep 2026 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788268277;
	bh=F2ThhmNqFT6d/2eLiPpP/gK+PRLYH4r04puKywqLfY0=;
	h=From:To:Cc:Subject:Date;
	b=oSvKaR3xoB9LvPIV35iJwT9IhRKeKzauTXOfOloiOBgfmX+kHT/bOFdcrEiPgnE8S
	 4+M9AlG1IOrhmseabRqG59clmk3FcTabaHyVTz3P+TUadWBl0IK9dlX5okAmYSbowo
	 C9fta4mHrYXudGpGuwmzimw/HsFtxK4OiuIlV7Gbz5eKMz56M9OgAaw7VeTRxc4ayR
	 y+lWMQGcXbCh7ajSaDC1t3kmXgXEzfIufc5mCy5HCS5cP1m0O4Ih60ILJbtekqVbpJ
	 22GWR+rVX0GK9IkI+ko44S/lU1sURkPigZuAhEVyEtC8MUqCwE8//KP63eXb4drRg+
	 Fky1FynFTl6og==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Nat Gurumoorthy <natg@google.com>,
	Carol L Soto <csoto@nvidia.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: [PATCH] firmware: arm_ffa: Tear down driver during shutdown
Date: Tue,  1 Sep 2026 14:11:12 +0100
Message-ID: <20260901131112.3437516-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The platform core invokes a driver's shutdown callback, rather than its
remove callback, while preparing devices for a normal kexec. Without a
shutdown callback, the FF-A driver leaves notifications, partition devices,
and the RX/TX mapping active before the replacement kernel is booted.

Use ffa_remove() for shutdown so the existing cleanup runs before a normal
kexec and other orderly system shutdowns.

Reported-by: Nat Gurumoorthy <natg@google.com>
Closes: https://lore.kernel.org/all/20260729162731.1383875-1-natg@google.com/
Reported-by: Carol L Soto <csoto@nvidia.com>
Closes: https://lore.kernel.org/all/20260818224404.3694580-1-csoto@nvidia.com
Reported-by: Maxi Saparov <masaparov@coreweave.com>
Closes: https://lore.kernel.org/all/20260826222337.73480-1-maxi.saparov@gmail.com
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 0121bd0a7e01..7f42ffe79f22 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2271,6 +2271,7 @@ static void ffa_remove(struct platform_device *pdev)
 static struct platform_driver ffa_driver = {
 	.probe = ffa_probe,
 	.remove = ffa_remove,
+	.shutdown = ffa_remove,
 	.driver = {
 		.name = FFA_PLATFORM_NAME,
 	},
-- 
2.43.0


