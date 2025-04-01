Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uXHYk1tDu7Vgc+fDZ2jXNF7n4vSNubLlovxHnt21xrs=; b=yJ+sbEAn9Iv2wkjaFJ5LbJTR28
	bn7gUV02qcraZA9d+Bi8kQ/Q2jT78LmrisoWY1eUrzcrkCGSRLj0HZoC8VGJmsTXyNYmCTi/TUN+k
	uUREjxmOvhOgQhsWgAs7bntOt5OByhtGAXQOa2BpTexbcuuj5ray2y71Qho3BOWnAFk5j1MoqCQ0S
	Hkj1W1bOXPa1U392bOeo2zju8UKiJe7HNmn1zgsV3OoSJnmL+rOMTLifvAYtwG21cEMYpT/EKhpaY
	8/gFDb5YTt4otFMUoVz1rTKA2i6BG/r59BT85MBxmwDSTmAvB48kPFL/ppukFyIU1TH92Ru+9Pf4Y
	TvkHPszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzauw-00000003KP8-18X5;
	Tue, 01 Apr 2025 12:40:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzah5-00000003B7t-0roB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:26:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83A81AC1;
	Tue,  1 Apr 2025 05:26:15 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F416A3F63F;
	Tue,  1 Apr 2025 05:26:09 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 0/3] Introduce SCMI Quirks framework
Date: Tue,  1 Apr 2025 13:25:42 +0100
Message-ID: <20250401122545.1941755-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_052615_347622_4CFDEA57 
X-CRM114-Status: GOOD (  17.85  )
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

with the increasing adoption of SCMI across arm64 ecosystems, we have to
start considering how to deal and take care of out-of-spec SCMI firmware
platforms that are actively deployed in the wild, in a consistent manner.

This small series introduces a simple framework, based on static_keys,
that allows a user to:

- define a quirk and its matching conditions; quirks can match based on:

  	compatible / Vendor_ID / Sub_Vendor_ID / ImplVersion

  from the longest matching sequence down to the shortest.

  When the SCMI core stack boots it will enable the matching quirks
  depending on the information gathered from the platform via Base
  protocol: any NULL/0 match condition is ignored during matching and is
  interpreted as ANY, so you can decide to match on a very specific
  combination of compatibles and FW versions OR simply on a compatible.

- define a quirk code-block: simply a block of code, meant to play the
  magic quirk trick, defined in the proximity of where it will be used
  and gated by an implicit quirk static-key associated with the defined
  quirk

Patch 1/3 in the series is really unrelated to the Quirk framework
itself: it is a slight variation on a fix posted previously by Sibi around
PERF FastChannels and it is included here for simplicity, since the example
quirk provided later in this series has to be applied exactly where 1/3
applies its modifications.

Patch 2/3 introduces support for SCMI quirks: support is default-n in
Kconfig as of this series. All the quirks found defined are stored in
an hashtable at module initialization time.
Later on, when the SCMI core stack probes and it has retrieved basic info
via Base protocol, all the matching quirks are enabled, which simply means
the related underlying specific quirks static-keys are enabled.

Patch 3/3 introduces an example Quirk for a known problem on a known
platform as reported by Johan, Marc and Sibi, BUT note that the matching
condition in tha patch MUST be properly completed in the patch (I was not
sure what to use...see my comments)

All of this as an RFC since:

- the provided macro-salad to enable quirks definitions is certainly
  ugly and can be done better (and checkpatch is already complaining
  a bit...)...or maybe I should just get rid of macros

- proper Documentation is missing...I wanted to have some feedback
  before babbling out too much non-sense just in case all of this has
  to go straight to the bin...

- macthing logic can be simplfied probably

Any feedback and testing is very much welcome.

Thanks,
Cristian


Cristian Marussi (2):
  firmware: arm_scmi: Add Quirks framework
  [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore FC bit in
    attributes

Sibi Sankar (1):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel

 drivers/firmware/arm_scmi/Kconfig     |  12 ++
 drivers/firmware/arm_scmi/Makefile    |   1 +
 drivers/firmware/arm_scmi/base.c      |  14 ++
 drivers/firmware/arm_scmi/driver.c    |  87 +++++++-----
 drivers/firmware/arm_scmi/protocols.h |   2 +
 drivers/firmware/arm_scmi/quirks.c    | 194 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h    |  43 ++++++
 7 files changed, 320 insertions(+), 33 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h

-- 
2.47.0


