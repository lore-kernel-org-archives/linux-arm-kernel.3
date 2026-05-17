Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C80CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ut6KPB2FyqD1rZnIlJ5HNRtjMje9EjyeuxhMW4TgzG4=; b=E3irPYA0ECk+BY7E/F557AU2KT
	ggBbeShSA8J3fTbaahMeJ6JxZA/3PVMRqsQko3CCVEKnGWRq7dseqMlooyYW6YEBkrVxNxX4uzJgu
	nYrwJW63XW6UJW4Jc14lz7KGm2/Ps5ldytzZyDXliXhcU4Fqa0S+KpPInQvkHQDt5LYAzWjKO9onP
	s6FWxxj678/llebD0KTpLKGqNmIFIhOgJrW1c6/LA/u4H5AvIMDHy+7x7leWJXn11bSMGdg8i42mX
	s8c3kNY31+6Q4XneZ89xpR62tKS7/ZhW02jxF0z4J6hxFQm08EWG5NrX9nFASFpx82HBQe7EZ9nQ9
	tLVurMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgmi-0000000DI27-0LZi;
	Sun, 17 May 2026 19:04:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOgmh-0000000DI1w-1RXO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 19:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 897A160103;
	Sun, 17 May 2026 19:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B1AC2BCB8;
	Sun, 17 May 2026 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779044658;
	bh=NB/CNEIUtc4ERpE+q/zZYxQAMn7kc0YFmUFa9eiJFWI=;
	h=From:Subject:Date:To:From;
	b=R3ST2v2Ff6oxWZ/02/DbxJSe4waGUpXE+GdCEU/t5e6wvaPggGl38AuSAfcAdfh7p
	 IxPq9Tva3H38fJZ+XncBaQPb8rT+P5ZkLdArsCH2WQhl/Tb+s5uTNv5KmvG3S/esEp
	 5qASULYUY10uEr+ACtz9bKKHkOXWh1fXy0SLvIaKtxciIZprcnTO6h2mUbRrIH6r3d
	 pavqZj678+n32kc50eCUjKrqY/0QxrKGLBbZtubeY75T96VHOzPsgGcGTqnmye7XDc
	 AgHXBudAD0aDYzfR2YtwiK/Ib5gnH69IoLfc0hurOPRBLJpsvEABT+Beaaq8YaSx0C
	 z9XWMUXpUMvvw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/4] firmware: arm_scmi: Fix protocol parsing and
 validation
Date: Sun, 17 May 2026 20:02:39 +0100
Message-Id: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMQCmoC/yXM2wpAQBAG4FfRXNuyI5RXkcSaZZRDO0hp393i8
 us/3CDkmATK6AZHJwuvS4COIzBjuwykuA8GTDBPMl0oMTM3li8ShVpneWoNWosQBpujLwj9qv4
 tRzeR2d8H8P4Bud8JR24AAAA=
X-Change-ID: 20260517-scmi_fixes-211563fc2ff2
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
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

Hi,

This series fixes a few SCMI protocol parsing and validation issues found
while checking the driver message layouts against the SCMI specification.

The first patch fixes a clear response width mismatch in SENSOR_CONFIG_GET,
where the driver requested a 4-byte response but read it as a 64-bit value.

The next two patches harden notification parsing for variable-sized payloads.
BASE_ERROR_EVENT and SENSOR_UPDATE both carry counted trailing arrays, so the
received payload size must be validated before copying or parsing those
entries.

The final patch fixes Powercap protocol v2 helpers to validate the domain id
before accessing cached per-domain state.

No functional change is intended for well-formed SCMI responses.

Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Regards,
Sudeep

---
Sudeep Holla (4):
      firmware: arm_scmi: Read sensor config as 32-bit value
      firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
      firmware: arm_scmi: Validate SENSOR_UPDATE payload size
      firmware: arm_scmi: Validate Powercap domains before state access

 drivers/firmware/arm_scmi/base.c     | 15 +++++++++++++--
 drivers/firmware/arm_scmi/powercap.c | 25 ++++++++++++++++++-------
 drivers/firmware/arm_scmi/sensors.c  | 12 ++++++++++--
 3 files changed, 41 insertions(+), 11 deletions(-)
---
base-commit: d0deb8265c8551343c5c155aaded6b56639e3820
change-id: 20260517-scmi_fixes-211563fc2ff2


-- 
Regards,
Sudeep


