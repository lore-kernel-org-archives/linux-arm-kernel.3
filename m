Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7303C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=udw3nCwWpaJyvfzM1R7VVhUaok0TICF/ecl4MCeiGZk=; b=FhzgJHFFq6ZMY26hY/67Xl6/oS
	CpdPLqF3HgfGWuijHaI1ceuBH5OD9C1VSeeLwsjHBCvkPsmN6+EcPZpukouGtIJxoYqKrhyc94LmH
	6vT3SUyS02KN5gOcExp/uSCCDuEIEFsb4yphSiiebKL+84XSUtqK6JoYEQs43Dh24MHLkPkBN1SrV
	lXYxaVFpL9C7yMGxihiaX4vjavdmZU2oAWBvmIf8iMi0qc2QN0isZA3koOMcRiWLhAZdJZUQCkOGi
	zttrmOrUYPBsS3Q9u5YL6CpWoJ+BRYuX6WOQZvRuuwfgKAyGKheUp+ARVuTxyz0RxToGTBD5/kxsq
	Lxu44GLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIW7-0000000FVoQ-2mLL;
	Fri, 11 Jul 2025 18:30:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaITW-0000000FVQc-3lUy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:28:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC2E016F8;
	Fri, 11 Jul 2025 11:27:45 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCCF83F694;
	Fri, 11 Jul 2025 11:27:54 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>
Subject: [PATCH v3 0/3] cacheinfo: Set cache 'id' based on DT data
Date: Fri, 11 Jul 2025 18:27:40 +0000
Message-Id: <20250711182743.30141-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_112758_980153_287BCBBA 
X-CRM114-Status: GOOD (  13.58  )
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

Changes since v2?
 * Fixed a of node ref leak in patch 1.

---

This series adds support for cache-ids to device-tree systems.
These values are exposed to user-space via
/sys/devices/system/cpu/cpuX/cache/indexY/id
and are used to identify caches and their associated CPUs by kernel interfaces
such as resctrl.

Resctrl anticipates cache-ids are unique for a given cache level, but may
be sparse. See Documentation/filesystems/resctrl.rst's "Cache IDs" section.

Another user is PCIe's cache-steering hints, where an id provided by the
hardware would be needed. Today this expects a platform specific ACPI hook
the program that value into the PCIe root port registers. If DT platforms
are ever supported, it will likely need a kernel driver to convert the
user-space cache-id to whatever hardware value is needed.

This series generates a 32bit cache-id from the lowest CPU hardware id
of the CPU's associated with that cache. On arm64, CPU hardware ids may
be greater than 32bits, but can be swizzled into 32bits. An architecture
hook is provided to allow the architecture to swizzle the values into 32bits.

This series is based on v6.16-rc4, and can be retrieved from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/cacheinfo/v3

The MPAM driver that makes use of these can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc4

What is MPAM? Set your time-machine to 2020:
https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/

[v2] lore.kernel.org/r/20250704173826.13025-1-james.morse@arm.com
[v1] lore.kernel.org/r/20250613130356.8080-1-james.morse@arm.com

Bugs welcome,
Thanks,

James Morse (2):
  cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for
    cache-id
  arm64: cacheinfo: Provide helper to compress MPIDR value into u32

Rob Herring (1):
  cacheinfo: Set cache 'id' based on DT data

 arch/arm64/include/asm/cache.h | 17 ++++++++++++
 drivers/base/cacheinfo.c       | 50 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

-- 
2.39.5


