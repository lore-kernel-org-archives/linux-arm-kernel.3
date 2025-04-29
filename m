Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C2CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LAQKSlBfPEsgD45q3zj3fKBJSzT8ED6H+K7kEuG9rLc=; b=0JB17nkONhN/HVLusxSwoLEtSd
	HkZwCpEQ9xKYj0JdPEF26kgxkwIXVmswLOwOY1XgXFYEi0s4/+8Q211Mh3a/8Q2jcTYz6eVVmv1ns
	chObvK5+7+lDr/1bDuK9fTrIaimMNWagjfQmnGEwVekNHiTopNmZJWI2am0t/6JRwuBOHTqyCFRdL
	Q1Os0Gjm1EKOXMdLN3kkYU/ssyEdVZQuG9/Um4vT0vXX3DA5Qj6xHwqbplYUrJMym35TlE7D5GRFS
	o1x3TnqE0lkrCvjpzcoLRn7x/cLdNJGcUstuJUDg3AIm2YnU06MuBXwgdOGXey9goPEtnMxE402EY
	Z7VI9mjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lkt-00000009voU-43Zc;
	Tue, 29 Apr 2025 14:16:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lgJ-00000009rb1-1kXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:11:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C33091515;
	Tue, 29 Apr 2025 07:11:23 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377423F66E;
	Tue, 29 Apr 2025 07:11:28 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Introduce SCMI Quirks framework
Date: Tue, 29 Apr 2025 15:11:05 +0100
Message-ID: <20250429141108.406045-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_071131_539182_3F0F4899 
X-CRM114-Status: GOOD (  17.47  )
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

  { comp, comp2, NULL } / Vendor_ID / Sub_Vendor_ID / [Min_Vers, Max_Vers]

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

Patch 1/3 in the series is really unrelated to the Quirk framework
itself: it is a slight variation on a fix posted previously by Sibi around
PERF FastChannels and it is included here for simplicity, since the example
quirk provided later in this series has to be applied exactly where 1/3
applies its modifications.

Patch 2/3 introduces support for SCMI quirks: support is default-y in
Kconfig as of this series. All the quirks found defined are stored in
an hashtable at module initialization time.
Since V1 the quirks are matched on ranges of ImplementationVersion if
provided.
Since V2 the matching condition based on compatible, it is optionally
represented by a list of possible compatibles.

Later on, when the SCMI core stack probes and it has retrieved basic info
via Base protocol, all the matching quirks are enabled, which simply means
the related underlying specific quirks static-keys are enabled.

Patch 3/3 Convert a pre-existing quirk to use the Quirk framework: it is,
though, a peculiar quirk, since it was meant to match any firmware version
or from any vendor/sub_vendor.

The macro-salad still triggers a lot of checkpatch warns.

Any feedback and testing is very much welcome.

Thanks,
Cristian

---
V2 -> V3
- fixed a few typos
- rebased on v6.15-rc4
- drop machine compatible lookup for dev_dbg()
- tags colletion
- dropped patch 4 (real quirk)

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


Cristian Marussi (2):
  firmware: arm_scmi: Add Quirks framework
  firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet

Sibi Sankar (1):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel

 drivers/firmware/arm_scmi/Kconfig     |  13 ++
 drivers/firmware/arm_scmi/Makefile    |   1 +
 drivers/firmware/arm_scmi/clock.c     |  33 +--
 drivers/firmware/arm_scmi/driver.c    |  95 +++++---
 drivers/firmware/arm_scmi/protocols.h |   2 +
 drivers/firmware/arm_scmi/quirks.c    | 318 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h    |  51 +++++
 7 files changed, 466 insertions(+), 47 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h

-- 
2.47.0


