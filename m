Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8E0606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=or03EpYo;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CrgR5TPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c/gZ3y/BdIUUqvbLrzV2w25k/ZnF3cfj2L2zwpVXdX4=; b=or03EpYonWANid29HSzs9mjywT
	7VINaxzt8A/KpP9lBXZd/69e3vKeF3R+QVkyuHw4oGHW925L7GoZJcEMz92cYZSTXrahNMjCEvl87
	2JnJQrQuvjHfI1IQhONn2nceZCQZMnM750TktNflPgjSscLa1YbEFKEL3wTopRAiCfMhO4GWobtRA
	DKifHF4kW+DazjCj7yCJLwDvXG3m9t4KCpxeM5M7+G/0B0z7Pelc2+2X3gEKkQYF+GQ8KtYgSIP5v
	+lfHfOoT9T7cRk7gpYsSWYpHwDsjJ3ZuOVoGQQNsfTJUqj8ATVFyB5RunGeVuD6Px8xbaDcTyTl9u
	SLehf3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNX-00000009AqP-2t8N;
	Thu, 29 Oct 2026 12:37:11 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPN5-00000009APw-2qX3;
	Thu, 29 Oct 2026 12:36:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c/gZ3y/BdIUUqvbLrzV2w25k/ZnF3cfj2L2zwpVXdX4=;
	b=CrgR5TPQuS8em94Ubz76sD/gDNo9sVO/RA/R8/VocP1amIo26+XMyjtoMYG9m73rZ2UZzxSaK
	8FZ+eJ+qd5tOGr4tb0DvsVBJsDZlGanQPwyS9YOPQx7SjZc/M22JrIQHcRzY/aFdR1dg/rGEZfG
	xsPY/ZCZEAOCv9xgPDqI/dM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHg0HqMzmVBy;
	Thu, 29 Oct 2026 20:36:31 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 17A2F40572;
	Thu, 29 Oct 2026 20:36:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:37 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 00/19] resctrl: Generalize monitor events across resources
Date: Thu, 29 Oct 2026 20:35:52 +0800
Message-ID: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053644_168938_506A2233 
X-CRM114-Status: GOOD (  11.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Resctrl only knows about monitoring at the L3 scope. MPAM monitors are
attached to a resource in an MSC, and firmware says which cache level that
resource is. The driver already finds L2 monitors, but resctrl has
nowhere to show them.

This is not MPAM specific. RISC-V can also place monitors at several
points in the system.

What this series does
=====================

The monitor event IDs lose the L3 from their names and the event
table is indexed by resource and event.

Then L2 can expose l2c_occupancy and mbm_core_bytes. The MBM state,
the overflow worker, RMID limbo and the assignable counters now work
per resource. The MBA software controller stays on the L3.

MPAM keeps its picked class per (resource, event), can pick L2 classes,
and reads L2 bandwidth from an assignable counter.

x86 never has an L2 monitor resource, so its behaviour does not change.

Testing
=======

QEMU with 2 clusters in 1 node: 2 L2 MSCs, 1 L3 MSC, 1 memory MSC.

- Now L2 has its own resctrl interfaces as below:

	cat /sys/fs/resctrl/info/L3_MON/mon_features
	# llc_occupancy mbm_total_bytes

	cat /sys/fs/resctrl/info/L2_MON/mon_features
	# l2c_occupancy mbm_core_bytes

	ls /sys/fs/resctrl/mon_data
	# mon_L2_33685504 mon_L3_33751040

	cat /sys/fs/resctrl/mon_data/mon_L3_33751040/llc_occupancy
	cat /sys/fs/resctrl/mon_data/mon_L3_33751040/mbm_total_bytes
	cat /sys/fs/resctrl/mon_data/mon_L2_33685504/l2c_occupancy
	cat /sys/fs/resctrl/mon_data/mon_L2_33685504/mbm_core_bytes

- l2c_occupancy and mbm_core_bytes has real monitoring data as below:

	L2_MON: l2c_occupancy = 256 KiB, mbm_core_bytes ~20 GB in 2 s
	L3_MON: llc_occupancy = 16 MiB, mbm_total_bytes unchanged

- CDP: the monitor count halves for every monitor resource.
- Unmount/remount and CPU hotplug were also exercised.
- Each patch built for arm64 and x86_64.

QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
Test cases: https://github.com/ruanjinjie-eng/mpam_testcase

If everyone agrees the approach is viable, we will next test it
on real hardware.

This series is also available at:
        https://github.com/ruanjinjie-eng/linux/tree/mpam-l2mon-rfc_v2_2

Changes in RFC v2
=================

- As Ben suggested, the existing event types now apply to any resource,
  instead of adding L2-only event IDs.
- As Ben suggested, L2 bandwidth uses an assignable counter that stays
  with the monitoring group, not a monitor borrowed for each read.
- The CDP change also halves the assignable counter count, for every
  monitor resource.
- Split by subsystem so resctrl, x86 and MPAM can be reviewed separately.
- Fix a CDP bug: a failed enable left the driver believing CDP was on.
- RFC v1: https://lore.kernel.org/all/20261022084821.4014873-1-ruanjinjie@huawei.com/

Jinjie Ruan (19):
  arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
  fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
  fs/resctrl: Rename monitor events to drop the L3 prefix
  x86/resctrl: Use the resource-agnostic monitor event names
  arm_mpam: resctrl: Use the resource-agnostic monitor event names
  resctrl: Remove the L3 monitor event names
  arm_mpam: resctrl: Index monitor state by resource and event
  arm_mpam: resctrl: Halve the monitor counts of every resource on CDP
  x86,fs/resctrl: Pass the resource to the monitor event helpers
  fs/resctrl: Track monitor events per resource
  fs/resctrl: Add the L2 monitor events
  fs/resctrl: Set up MBM state and workers for every monitor resource
  fs/resctrl: Check RMID limbo on every resource with occupancy
  fs/resctrl: Manage assignable counters for every monitor resource
  arm_mpam: resctrl: Look up the monitor domain id from the components
  arm_mpam: resctrl: Report counter assignment per resource
  arm_mpam: resctrl: Allow monitoring on resources other than the L3
  arm_mpam: resctrl: Expose the L2 monitor events
  Documentation: arm64: mpam: Describe the L2 monitor events

 Documentation/arch/arm64/mpam.rst       |  23 +-
 Documentation/filesystems/resctrl.rst   |   6 +
 arch/x86/kernel/cpu/resctrl/core.c      |  13 +-
 arch/x86/kernel/cpu/resctrl/intel_aet.c |   2 +-
 arch/x86/kernel/cpu/resctrl/internal.h  |   2 +-
 arch/x86/kernel/cpu/resctrl/monitor.c   |   4 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c  |   8 +-
 drivers/resctrl/mpam_resctrl.c          | 362 ++++++++++++++----------
 fs/resctrl/ctrlmondata.c                |  13 +-
 fs/resctrl/internal.h                   |  13 +-
 fs/resctrl/monitor.c                    | 300 ++++++++++++--------
 fs/resctrl/rdtgroup.c                   | 148 +++++-----
 include/linux/resctrl.h                 |  27 +-
 include/linux/resctrl_types.h           |  16 +-
 14 files changed, 541 insertions(+), 396 deletions(-)

-- 
2.34.1


