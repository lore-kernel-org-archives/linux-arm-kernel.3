Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3560EE92714
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yiTG43HnY9jj36MXr7HEBdU0J1aHvV29hI1JPX2Fh6w=; b=WT23GJQZjDGgwbnQik12IlsWzv
	8FbBCBj0lGcJORwIBg0Uyx1+lxn1CzxQM8LJj9pnAArERBuF5MIU4WibWvFdQAWu1W9N05TQODx7t
	Fe2Uq0OIwZWgEjIgiPXiWoHp1AaCsn+qNGTNphQcWFLzMIQfULW3ADKNBpOxJ5Mrg/VV9jNb9pEOm
	vzvt6KaJHXUTIhcDAVq6p4ICZbiWAqOx6DH0lJFVwxeShF0FKJY7zLfpG3oIVHT0HneX1nkUhZrAT
	P7fepKtTLojzdDu2MZbc5qQeEeOnAq5d78x09CvwYxNXeF99m/3+kPSE28rx0KsjuCl0R0X/4ygTM
	7RYDE0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZXMo-000000025fT-3tpe;
	Sat, 27 Dec 2025 16:42:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZXMm-000000025er-0k30
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 16:42:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE69339;
	Sat, 27 Dec 2025 08:41:57 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01FA73F694;
	Sat, 27 Dec 2025 08:42:01 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	peng.fan@oss.nxp.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/2] Rework protocol version negotiation core logic
Date: Sat, 27 Dec 2025 16:41:30 +0000
Message-ID: <20251227164132.1311988-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_084208_329117_70C42269 
X-CRM114-Status: GOOD (  10.05  )
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

this small series rectifies the protocol negotiation logic employed by the
core SCMI stack when trying to cope with newer unknown protocol versions
advertised by the platform under any circumstances.

The existing protocol negotiation logic per-se was fine, but unfortunately
the whole negotiation process was started at the end of the per-protocol
initialization phase since it relies on the version querying performed by
each protocol initialization logic.

Unfortunately, this means that if the protocol initialization failed
upfront as a whole, maybe exactly due to version incompatibilities, the
negotiation itself will never be started, effectively failing to negotiate
a better version in the exact scenario where negotiation would be mostly
needed.

This series simply moves the version_get query process out of the single
protocol units and delegates to the core SCMI stack the whole procedure:
this way, the supported protocol version querying and any further needed
negotiation exchanges are performed by the core SCMI stack right before
the start of the protocol initialization phase: as a consequence the
protocol initialization phase will now be performed using the appropriate
protocol version as negotiated in advance, when needed.

As a consequence per-protocol versioning code is considerably simplified.

Based on v6.19-rc2.

Any feedback, as usual, it is very much welcome.

Thanks,

Cristian


Cristian Marussi (2):
  firmware: arm_scmi: Rework protocol version negotiation logic
  firmware: arm_scmi: Remove legacy protocol versioning logic

 drivers/firmware/arm_scmi/base.c              | 11 +--
 drivers/firmware/arm_scmi/clock.c             | 24 ++---
 drivers/firmware/arm_scmi/driver.c            | 98 +++++++++++++++----
 drivers/firmware/arm_scmi/perf.c              | 57 ++++-------
 drivers/firmware/arm_scmi/pinctrl.c           | 12 +--
 drivers/firmware/arm_scmi/power.c             | 18 +---
 drivers/firmware/arm_scmi/powercap.c          | 21 ++--
 drivers/firmware/arm_scmi/protocols.h         |  9 +-
 drivers/firmware/arm_scmi/reset.c             | 18 +---
 drivers/firmware/arm_scmi/sensors.c           | 22 ++---
 drivers/firmware/arm_scmi/system.c            | 14 +--
 .../arm_scmi/vendors/imx/imx-sm-bbm.c         | 10 +-
 .../arm_scmi/vendors/imx/imx-sm-cpu.c         |  9 +-
 .../arm_scmi/vendors/imx/imx-sm-lmm.c         |  9 +-
 .../arm_scmi/vendors/imx/imx-sm-misc.c        | 10 +-
 drivers/firmware/arm_scmi/voltage.c           | 13 +--
 16 files changed, 153 insertions(+), 202 deletions(-)

-- 
2.52.0


