Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F11FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e2RR/2s5oj/HhgX2isPbt80d/nf7FfooUrgxd57bUuo=; b=0rMf48xxpNd0UaQC5VyCTSiQgy
	i5DxYypa/icJoLrnyxAvsnk5ihENzsdZMRueZ48EtScSsCt/txpwdCqKHfq4bghoz7mKdwJuzAtu/
	O4p/w95xKVqobSfY7l1eK62pgz6jwgcnHloxh6qwPjm7KFXRwdOD3fX8/OzfPFskY0EPSRR8/S+GA
	V8Tf0Eo8mJZaAdCDG6oXVPM97Dqx+eOnXgcHm2LxECD8/TD3xLsuJWIevzmm2Q9r6Wh4MEqup+yPa
	HbRimilh5ew43kI+r2F131POfgbMaGJS3ZznIqw8eMFNAJrtU7ivyTADXWV0Yv5U0l3T0SRrVLoKi
	6ruvxKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeRr-000000011mz-0445;
	Tue, 28 Apr 2026 09:09:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeRo-000000011lo-03dM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:09:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D5115A1;
	Tue, 28 Apr 2026 02:09:30 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1D083F62B;
	Tue, 28 Apr 2026 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777367375; bh=Args02vC7ufHcOsK1lIdG/wj0Yi0DEK78CIUPWUKCkU=;
	h=From:To:Cc:Subject:Date:From;
	b=tHdznVRFGyC0NgbhxeV1+dU2xMFpstF681U36jZoy+mFn5c4yxGt2TCWYaoOgXATF
	 7FCgk+VMfTSWr/DTCNIFWXPdjsIwnVt74PHsC/J5boTetVFAG/tEZKiCtUID1RKMEZ
	 1t41k3hryF4nlu3sUFmWhcNK4asIT35a0yFODhCo=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v5 00/12] Add support for SCMIv4.0 Powercap Extensions
Date: Tue, 28 Apr 2026 10:09:09 +0100
Message-ID: <20260428090922.346069-1-philip.radford@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_020940_208633_9B49AE2C 
X-CRM114-Status: GOOD (  17.40  )
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

Hi all,

I will be taking over this series from Cristian and in doing so I have
addressed a couple of issues raised by the first version and added five
additional patches since Cristian's original series:

[6/12] exposes the measurement averaging interval (MAI) value when the
agent has registered to receive power measurement change notifications
for the power capping domain.

[9/12] adds MAI get and set support for the powercap protocol.

[10/12] introduces a synthetic root zone to act as a common parent for all
top-level domains.

[11/12] adds get_power_uw to synthetic root zone, summing the per-zone
power of immediate child zones.

[12/12] adds enable/disable functionality to synthetic root zone to
enable/disable immediate children.

The original series was based on v6.17-rc1 whereas this version has been
based on v7.1-rc1.

The rest of Cristian's series is explained below;

SCMIv4.0 [1] introduces some new features and commands into the Powercap
protocol. In a nutshell, such protocol changes add support for:

 - setting multiple powercap limit/interval constraints for each SCMI
   powercap domain which supports multiple Concurrent Power Limit
 - enabling more Powercap commands to use Fastchannels mechanism
 - adding multiple constraints support to the existing notifications

After a bit of needed updates in the SCMI core this series adds:

- support for the idea of optional multiple Concurrent Power Limit (CPLs)
- support for the new FCs
- support for extended notifications
- enable usage of such multiple constraint in the ARM SCMI Powercap driver

Note that the public SCMIv4.0 spec at [1] is currently still BETA0, so
this series could anyway need some minor rework along the way and
definitely will need to wait for a final public release before being
possibly merged.

Tested on a single and multi-instance scenario on an emulated setup
implementing the new protocol extensions.

Based on v7.1-rc1.

Thanks,
Phil
---
V4->V5
- Added enable/disable functionality to synthetic node
- Rebased on v7.1-rc1
V3->V4
- Rebased on v7.0-rc4
- Added sythentic parent node and functionality
- Moved fastchannel inits outside of loop
- Renamed arguments for consistency
V2->V3
- Added powercap MAI get/set support
V1->V2
- Rebased on sudeep/for-next/scmi/updates
- Amended Copyright to include 2026
- Added patch to extend powercap report to include MAI
- Removed creation of pi powercap_info struct due to legacy code change
- Amended references to pi->version and similar, which were based on
  legacy code
- Wrapped two variables in le32_to_cpu() to appease Sparse warnings
- Amended comparing operator value in response to feedback

Cristian Marussi (7):
  firmware: arm_scmi: Add an optional custom parameter to fastchannel
    helpers
  firmware: arm_scmi: Refactor powercap domain layout
  firmware: arm_scmi: Add SCMIv4.0 Powercap basic support
  firmware: arm_scmi: Add SCMIv4.0 Powercap FCs support
  firmware: arm_scmi: Add SCMIV4.0 Powercap notifications support
  include: trace: Add new parameter to trace_scmi_fc_call
  powercap: arm_scmi: Enable multiple constraints support

Philip Radford (5):
  firmware: arm_scmi: Extend powercap report to include MAI
  firmware: arm_scmi: add Powercap MAI get/set support
  powercap: arm_scmi: Create synthetic parent node for multi-instance
  powercap: arm_scmi: Add get_power_uw to synthetic node
  powercap: arm_scmi: Synthetic zone enable/disable

 drivers/firmware/arm_scmi/driver.c    |  12 +-
 drivers/firmware/arm_scmi/perf.c      |  16 +-
 drivers/firmware/arm_scmi/powercap.c  | 984 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/protocols.h |   2 +-
 drivers/powercap/arm_scmi_powercap.c  | 227 +++++-
 include/linux/scmi_protocol.h         |  87 ++-
 include/trace/events/scmi.h           |  12 +-
 7 files changed, 1067 insertions(+), 273 deletions(-)

--
2.47.3


