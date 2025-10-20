Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0202CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GOddeF4CmeQdoAneSYg3qKOAfjZnCurbFZKwrmWO7Wk=; b=Q236iKg/2TiDIAgPdY80wADkvP
	t0ijX6JmvXsODjCgKOtQURCDagbzMRX4WWK+whXH9UETRuEDz2k0OE7T2WE4uQOY5BthmlrbZdSZ7
	SmlFyHiTrD6vM+XWMLZj7GieWEjdVNM6PfH1eZSshL9wXRTIjYX44skan4/y7ceArbsrMCimD/pdu
	fJA9rHeUdc4aBVMqOuFIuMHpZOthvgOmg20MYfbqu6gzYF+/PVFO+3jvdwChi4YittvChkqNbWXec
	PpXbTR4oP62NluHt8RINw7mWDGoUv8OPzcbZBJdp9z+MLawBLmiNf+nwIFKW3S2LrPW8z4uba4Q8x
	v+NmN1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjq6-0000000C7Gs-0PvB;
	Mon, 20 Oct 2025 06:57:54 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjq2-0000000C7Dr-2aMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:57:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GOddeF4CmeQdoAneSYg3qKOAfjZnCurbFZKwrmWO7Wk=;
	b=6AmWEWZDDRnn5UyfKveUzHV4h+LumJnl6lEA+NJTGFTcVzF9o37u4jLl/ljs1KNqP+VqWMnTW
	jPLmWAJ2+/99CsIABgpC+hYZSAbpcqKdI1DY1hUtwCpaZ7GHP4TU/oP5LsMtz43Ld8EC/zMW8yv
	QVYWBdteLf6HBHFiLBrWgxA=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4cqmSq0TzpzRhsG;
	Mon, 20 Oct 2025 14:57:15 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 962A5140257;
	Mon, 20 Oct 2025 14:57:38 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Oct 2025 14:57:38 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Oct 2025 14:57:37 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <wangyushan12@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	<james.morse@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>, Will Deacon
	<will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso
	<dave@stgolabs.net>, "H . Peter  Anvin" <hpa@zytor.com>, Peter Zijlstra
	<peterz@infradead.org>
Subject: [PATCH v3 0/8] Cache coherency management subsystem
Date: Mon, 20 Oct 2025 14:57:37 +0800
Message-ID: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.33.0
X-UIDL: 286386
X-Mozilla-Status: 0001
X-Mozilla-Keys: $label3                                                                         
Received: from kwepemn200008.china.huawei.com (7.202.194.131) by
  kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
  (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
  15.2.1544.11 via Mailbox Transport; Wed, 20 Aug 2025 18:29:54 +0800
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
  kwepemn200008.china.huawei.com (7.202.194.131) with Microsoft SMTP Server
  (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
  15.2.1544.11; Wed, 20 Aug 2025 18:29:54 +0800
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
  frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
  (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
  15.1.2507.39; Wed, 20 Aug 2025 12:29:51 +0200
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
  frapeml500008.china.huawei.com (7.182.85.71)
X-MS-Exchange-Transport-EndToEndLatency: 00:00:03.7121070
X-MS-Exchange-Processed-By-BccFoldering: 15.02.1544.011
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235750_996147_290ADECA 
X-CRM114-Status: GOOD (  22.49  )
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
Message-ID: <20251020065737.WdVHZeR5rdBn_30NDB0Pf9iEyft-NKrVWWpRxnQlZYU@z>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>=0D

Support system level interfaces for cache maintenance as found on some=0D
ARM64 systems. This is needed for correct functionality during various=0D
forms of memory hotplug (e.g. CXL). Typical hardware has MMIO interface=0D
found via ACPI DSDT.=0D
=0D
Includes parameter changes to cpu_cache_invalidate_memregion() but no=0D
functional changes for architectures that already support this call.=0D
=0D
v3:=0D
  - Squash the layers by moving all the management code into=0D
    lib/cache_maint.c that architectures can opt into via=0D
    GENERIC_CPU_CACHE_MAINTENANCE (Dan).  I added entries to Conor's=0D
    drivers/cache MAINTAINERS entry to include this lib/ code but if=0D
    preferred I can add a separate entry for it.=0D
  - Add a new patch 1 that drops the old IODESC_RES_ parameter as it never=
=0D
    did anything other than document intent.  With the addition of a=0D
    flushing range, we would have to check the range and resource type=0D
    matched. Simpler to just drop the parameter. (Dan)=0D
  - Minor fixes and renames as per reviews.=0D
  - Even if all else looks good, I fully expect some discussion of the=0D
    naming as I'm not particularly happy with it.=0D
  - Open question on whether is acceptable for the answer to whether=0D
    cpu_cache_invalidate_memregion() is supported to change as drivers=0D
    register (potentially after initial boot).  Could design a firmware=0D
    table solution to this, but will take a while - not sure if it is=0D
    necessary.=0D
  - Switch to a fwctl style allocation function that makes the container=0D
    nature of the allocation explicit.=0D
=0D
On current ARM64 systems (and likely other architectures) the=0D
implementation of cache flushing need for actions such as CXL memory=0D
hotplug e.g. cpu_cache_invalidate_memregion(), is performed by system=0D
components outside of the CPU, controlled via either firmware or MMIO=0D
interfaces.=0D
=0D
These control units run the necessary coherency protocol operations to=0D
cause the write backs and cache flushes to occur asynchronously. The allow=
=0D
filtering by PA range to reduce disruption to the system. Systems=0D
supporting this interface must be designed to ensure that, when complete,=0D
all cache lines in the range are in invalid state or clean state=0D
(prefetches may have raced with the invalidation). This must include=0D
memory-side caches and other non architectural caches beyond the Point=0D
of Coherence (ARM terminology) such that writes will reach memory even=0D
after OS programmable address decoders are modified (for CXL this is=0D
any HDM decoders that aren't locked). Software will guarantee that no=0D
writes to these memory ranges race with this operation. Whilst this is=0D
subtly different from write backs must reach the physical memory that=0D
difference probably doesn't matter to those reading this series.=0D
=0D
The possible distributed nature of the relevant coherency management=0D
units (e.g. due to interleaving) requires the appropriate commands to be=0D
issued to multiple (potentially heterogeneous) units. To enable this a=0D
registration framework is provided to which drivers may register a set=0D
of callbacks. Upon a request for a cache maintenance operation the=0D
framework iterates over all registered callback sets, calling first a=0D
command to write back and invalidate, and then optionally a command to wait=
=0D
for completion. Filtering on relevance is left to the individual drivers.=0D
=0D
Two drivers are included. This HiSilicon Hydra Home Agent driver which=0D
controls hardware found on some of our relevant server SoCs and,=0D
mostly to show that the approach is general, a driver based on a firmware=0D
interface that was in a public PSCI specification alpha version=0D
(now dropped - don't merge that!)=0D
=0D
QEMU emulation code at=0D
http://gitlab.com/jic23/qemu cxl-2025-03-20 =0D
=0D
Remaining opens:=0D
- Naming.  All suggestions welcome!=0D
- I don't particularly like defining 'generic' infrastructure with so few=0D
  implementations. If anyone can point me at docs for another one or two,=0D
  or confirm that they think this is fine that would be great!=0D
- I made up the ACPI spec - it's not documented, non official and honestly=
=0D
  needs work. I would however like to get feedback on whether it is=0D
  something we want to try and get through the ACPI Working group as a much=
=0D
  improved code first proposal?  The potential justification being to avoid=
=0D
  the need for lots trivial drivers where maybe a bit of DSDT interpreted=0D
  code does the job better. (Currently I'm not hearing much demand for this=
=0D
  so will probably drop in a future version).=0D
=0D
Thanks to all who engaged in the discussion so far.=0D
=0D
Jonathan=0D
=0D
Jonathan Cameron (5):=0D
  memregion: Drop unused IORES_DESC_* parameter from=0D
    cpu_cache_invalidate_memregion()=0D
  MAINTAINERS: Add Jonathan Cameron to drivers/cache=0D
  arm64: Select GENERIC_CPU_CACHE_MAINTENANCE and=0D
    ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=0D
  acpi: PoC of Cache control via ACPI0019 and _DSM=0D
  Hack: Pretend we have PSCI 1.2=0D
=0D
Yicong Yang (2):=0D
  memregion: Support fine grained invalidate by=0D
    cpu_cache_invalidate_memregion()=0D
  lib: Support ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=0D
=0D
Yushan Wang (1):=0D
  cache: Support cache maintenance for HiSilicon SoC Hydra Home Agent=0D
=0D
 MAINTAINERS                        |   3 +=0D
 arch/arm64/Kconfig                 |   2 +=0D
 arch/x86/mm/pat/set_memory.c       |   2 +-=0D
 drivers/cache/Kconfig              |  22 ++++=0D
 drivers/cache/Makefile             |   3 +=0D
 drivers/cache/acpi_cache_control.c | 153 +++++++++++++++++++++++=0D
 drivers/cache/hisi_soc_hha.c       | 187 +++++++++++++++++++++++++++++=0D
 drivers/cxl/core/region.c          |   5 +-=0D
 drivers/firmware/psci/psci.c       |   2 +=0D
 drivers/nvdimm/region.c            |   2 +-=0D
 drivers/nvdimm/region_devs.c       |   2 +-=0D
 include/linux/cache_coherency.h    |  57 +++++++++=0D
 include/linux/memregion.h          |  10 +-=0D
 lib/Kconfig                        |   3 +=0D
 lib/Makefile                       |   2 +=0D
 lib/cache_maint.c                  | 128 ++++++++++++++++++++=0D
 16 files changed, 575 insertions(+), 8 deletions(-)=0D
 create mode 100644 drivers/cache/acpi_cache_control.c=0D
 create mode 100644 drivers/cache/hisi_soc_hha.c=0D
 create mode 100644 include/linux/cache_coherency.h=0D
 create mode 100644 lib/cache_maint.c=0D
=0D
-- =0D
2.48.1=0D
=0D

