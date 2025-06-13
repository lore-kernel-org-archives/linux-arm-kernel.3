Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6198C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jfDDrHGnrxzE3qTx+O8rcB4tZDTR681mZX3VQtddhy8=; b=G2Ri4miJhRqVRcUvf65q6Nucu5
	yS2UEJx9USqHal/fuqkzeEVaTlyBJxsNd75GG73bXz7RHQe8PONa6UAiACrh3fSdUa3M3K0IZXCm1
	Cn1qzokjdrEIFNjSvrL0kdeFeiT0431Ni6AmeHEiKmR2VWjwWLDuetTOiSBmj4ykBCdXJ3nV6U3Se
	bRoeC1EBMpL32IKWF8fp5gvF/Nol8a9ENSC6wUr4OtFKJZJZ6CF49QfhrznCLxx462mxOM0KXrH60
	iYDP7w1/GjTVRD7kmEgxghR3JAwp+XgwEguNzLt8bFE8irv0pQBrwxAUThL7kdLiUA4g6fVJTQVaw
	yTxBN1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ477-0000000GSE0-2Ef4;
	Fri, 13 Jun 2025 13:06:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ44q-0000000GRuE-0yLc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:04:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C17E1C0A;
	Fri, 13 Jun 2025 06:03:49 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12FA53F59E;
	Fri, 13 Jun 2025 06:04:07 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	sudeep.holla@arm.com,
	Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 0/5] cacheinfo: Set cache 'id' based on DT data
Date: Fri, 13 Jun 2025 13:03:51 +0000
Message-Id: <20250613130356.8080-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_060412_316480_4B9BA1A7 
X-CRM114-Status: GOOD (  15.74  )
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

Rob H previously preferred to generate a cache-id from the information DT
already has. (Rob: does the PCIe cache-steering use-case change this?)

This series generates a 32bit cache-id from the lowest CPU hardware id
of the CPU's associated with that cache. On arm64, CPU hardware ids may
be greater than 32bits, but can be swizzled into 32bits. An architecture
hook is provided to allow the architecture to swizzle the values into 32bits.

Finally, the MPAM driver needs to know the size of a cache, which is stored
in cacheinfo. Add a helper to retrieve that information.

This series is based on v6.16-rc1, and can be retreived from:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/cacheinfo/v1

The MPAM driver that makes use of these can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc1

What is MPAM? Set your time-machine to 2020:
https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/


Bugs welcome,
Thanks,

James Morse (4):
  cacheinfo: Add arch hook to compress CPU h/w id into 32 bits for
    cache-id
  arm64: cacheinfo: Provide helper to compress MPIDR value into u32
  cacheinfo: Expose the code to generate a cache-id from a device_node
  cacheinfo: Add helper to find the cache size from cpu+level

Rob Herring (1):
  cacheinfo: Set cache 'id' based on DT data

 arch/arm64/include/asm/cache.h | 14 +++++++++++
 arch/arm64/kernel/sleep.S      |  1 +
 drivers/base/cacheinfo.c       | 45 ++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h      | 21 ++++++++++++++++
 4 files changed, 81 insertions(+)

-- 
2.39.5


