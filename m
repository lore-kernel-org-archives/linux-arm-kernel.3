Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73EEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaLAfuGVJtlpmlMprZgdHrxpI5dEoY/XsjnH/lvJzbw=; b=OIbLnalIbwOMB5jd1auEwbNkzy
	IMwW9q7CnvoFGhjxeETlqJI71ZmezORjf3kB71WjUEznYs3iEPLvbKU7VmjgNfQ4PMa2bQ1hFOrBl
	YesDfSNcdmjy5FQF8S4iJWXFLItPGiWi9KxDM5cubsndmA0mg+hsDs0KPrsxdeG6eKpBhW/d4fGUk
	LaDAu2RNYOqtZxeU+0TH+zBKKuDERxErfbkyeOH3lsi8Gebvhu5ofIlYoZwiC5BjYL1UUTWvbJdGL
	5Pokxr97zq9UYgrPUqnQ1uqYTOnkCVsYcpoNdHlboLV6jInznQ7vgLUdd80RtfjL+mckdbKTTNCBw
	QJxL5pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JXZ-0000000HMMH-3h4I;
	Fri, 25 Apr 2025 13:56:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IYN-0000000HBMp-0Or7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:53:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 007FC106F;
	Fri, 25 Apr 2025 05:53:07 -0700 (PDT)
Received: from pluto.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A8A63F59E;
	Fri, 25 Apr 2025 05:53:09 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Introduce SCMI Quirks framework
Date: Fri, 25 Apr 2025 13:52:46 +0100
Message-ID: <20250425125250.1847711-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055315_218563_CE08271F 
X-CRM114-Status: GOOD (  18.51  )
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

  	compatible / Vendor_ID / Sub_Vendor_ID / [Min_Vers, Max_Vers]

  from the longest matching sequence down to the shortest.

  When the SCMI core stack boots it will enable the matching quirks
  depending on the information gathered from the platform via Base
  protocol: any NULL match condition is ignored during matching and is
  interpreted as ANY, so you can decide to match on a very specific
  combination of compatibles and FW versions OR simply on a compatible.

- define a quirk code-block: simply a block of code, meant to play the
  magic quirk trick, defined in the proximity of where it will be used
  and gated by an implicit quirk static-key associated with the defined
  quirk

Patch 1/4 in the series is really unrelated to the Quirk framework
itself: it is a slight variation on a fix posted previously by Sibi around
PERF FastChannels and it is included here for simplicity, since the example
quirk provided later in this series has to be applied exactly where 1/3
applies its modifications.

Patch 2/4 introduces support for SCMI quirks: support is default-y in
Kconfig as of this series. All the quirks found defined are stored in
an hashtable at module initialization time.
Since V1 the quirks are matched on ranges of ImplementationVersion if
provided.
Since V2 the matching condition based on compatible, it is optionally
represented by a list of possible compatibles.

Later on, when the SCMI core stack probes and it has retrieved basic info
via Base protocol, all the matching quirks are enabled, which simply means
the related underlying specific quirks static-keys are enabled.

Patch 3/4 Convert a pre-existing quirk to use the Quirk framework: it is,
though, a peculiar quirk, since it was meant to match any firmware version
or from any vendor/sub_vendor.

Patch 4/4 introduces an example Quirk for a known problem on a known
platform as reported by Johan, Marc and Sibi, BUT note that the matching
condition in tha patch MUST be properly completed in the patch (I was not
sure what to use...see my comments)

The macro-salad still triggers a lot of checkpatch warns.

Any feedback and testing is very much welcome.

Thanks,
Cristian

---
V1 -> V2
- added support for matching against an optional list of compatibles
- compile the quirks even if Quirks framework is not enabled
- reduced CLOCK_DESCRIBE_RATES triplet Quirk size
- added more docs & examples

RFC -> V1
 - collected tags for patch 1/4
 - Added version ranges handling for Implementation Version
 - make Quirk frmwk default-y
 - add COMPILE_TEST depend
 - move quirk enabling logic out of Base protocol init to avoid possible
   deadlocks with cpu_lock (reported LOCKDEP splat from Johan)
 - fix Quirk matching conditions for quirk_perf_level_get_fc_force


Cristian Marussi (3):
  firmware: arm_scmi: Add Quirks framework
  firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
  [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore FC bit in
    attributes

Sibi Sankar (1):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel

 drivers/firmware/arm_scmi/Kconfig     |  13 ++
 drivers/firmware/arm_scmi/Makefile    |   1 +
 drivers/firmware/arm_scmi/clock.c     |  33 +--
 drivers/firmware/arm_scmi/driver.c    | 111 ++++++---
 drivers/firmware/arm_scmi/protocols.h |   2 +
 drivers/firmware/arm_scmi/quirks.c    | 321 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h    |  52 +++++
 7 files changed, 486 insertions(+), 47 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h

-- 
2.47.0


