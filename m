Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84BAD1359B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5G67oYCK/WZ+A0TRBPgT8CrbL0SkVdCc7yfABdsdDn4=; b=2UA/94kK9yBjxwa2gh75NxgJXY
	8z2Uk1BALF06nXHylrWhRQV5MCmYWu6IBSiMEXQzRoRJndrt4Mpx5bIv5YiItAyNR3PTkC/01LCTA
	wG9jCh7vsGn2CjODtM/5ONsVEP3DIGQgF/CR/OFKSInpqH11kZ/IbY29pqJ8cZmxTpq/5TEWajplQ
	3QR5VLQig/71/fUl5enuhsKb/GykrjVnJzKgHJvsRzzXMplX/nXSUWDKpCBIymcfCRNThnklUuvLD
	SzKU3iCpe7CrgyeIs0DWXdXK3cF0QvNO/ExKCdMtQZUR+XiNYWHYv+9cbVAtWi7S9Af0r0Tl7JjnZ
	W2GW4g6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OTN-0000000AfLl-13iq;
	Mon, 28 Oct 2024 12:03:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ORl-0000000Aezh-2adK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:02:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75676497;
	Mon, 28 Oct 2024 05:02:36 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E015C3F73B;
	Mon, 28 Oct 2024 05:02:04 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 0/7] Expose SCMI Transport properties
Date: Mon, 28 Oct 2024 12:01:44 +0000
Message-ID: <20241028120151.1301177-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_050209_718934_F51E6DB0 
X-CRM114-Status: GOOD (  12.87  )
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

SCMI transports are characterized by a number of properties: the values
assumed by some of them tightly depend on the choices taken at design
time and on the overall archiecture of the specific platform: things like
timeouts, maximum message size and number of in-flight messages are closely
tied to the architecture of the platform like number of SCMI agents on the
system, physical memory available to the SCMI server...so on and so forth.

Moreover, since the SCMI specification does not delve into the details
of specific transports, that are, indeed, outside the scope of the
specification itself, such characteristics are NOT even discoverable
at run-time on an SCMI platform.

Currently such properties are simple default values defined at build time,
but the increasing number and variety of platforms using SCMI with a wide
range of designs has increased the need to have a way to describe such
properties across all these platforms.

This series, at first removes a few ambiguities in how some of the current
built-in properties are interpreted, then lays out a way for the core to
propagate back to the transports any possible setting gathered at runtime
from devicetree and finally introduce a pair of new properties used to
describe such per-platform transport characteristics.

Based on v6.12-rc3.

V3 adds 2 additional patches to fix an already existing similar property
that was missing the vendor prefix.

Any feedback welcome.

Thanks,
Cristian

---
v2 --> v3
- unified SHMEM_PAYLOAD_SIZE definition
- fixed format-string
- added reviewed tags
- added missing vendor to existing max-rx-timeout-ms
v1 --> v2
- added arm, vendor prefix to new DT bindings props
- clarified arm,max-msg bindings meaning
- removed useless warning on advised minimum size on arm,max-msg-size
- fixed maintainers CC list
- removed CCed maintainers from commit log
- using new prefixed arm, props



Cristian Marussi (7):
  firmware: arm_scmi: Account for SHMEM memory overhead
  firmware: arm_scmi: Calculate virtio PDU max size dynamically
  dt-bindings: firmware: arm,scmi: Introduce more transport properties
  firmware: arm_scmi: Use max_msg and max_msg_size devicetree properties
  firmware: arm_scmi: Relocate atomic_threshold to scmi_desc
  dt-bindings: firmware: arm,scmi: Add missing vendor string
  firmware: arm_scmi: Use vendor string in max-rx-timeout-ms

 .../bindings/firmware/arm,scmi.yaml           | 17 ++++++-
 drivers/firmware/arm_scmi/common.h            | 13 +++++-
 drivers/firmware/arm_scmi/driver.c            | 46 +++++++++++--------
 drivers/firmware/arm_scmi/shmem.c             |  7 +++
 .../firmware/arm_scmi/transports/mailbox.c    |  2 +-
 drivers/firmware/arm_scmi/transports/optee.c  |  8 ++--
 drivers/firmware/arm_scmi/transports/smc.c    |  2 +-
 drivers/firmware/arm_scmi/transports/virtio.c | 15 +++---
 8 files changed, 74 insertions(+), 36 deletions(-)

-- 
2.47.0


