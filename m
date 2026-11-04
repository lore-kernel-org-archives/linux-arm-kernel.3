Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3AF6082BC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5+oNrzf;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r95KcpB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7yWlCk6T1JWk7Y87GbgVao/WZwSgW7q+kEJYjVA6XlM=; b=I5+oNrzfwehpdHZUfUyKIoJ2vo
	KwynpU8R3loa8aHnAjE5YLvELGiil/LHBNUxtoftphog1KhnpcQDBFmCLMoK7IZcNO6B15plktm57
	paA/m+uAfg6vSFgZGb9iC8s+iU68PpeY5irbhEKZckOrUqWVOtKthv4McwnHcXx2EekICjCzvxBvt
	krXz7N/dAxVYVJrpdVEGvf/iIJ2fc5F56jPTGnKMIELNJBP7LL22qBbu66pC5HRcAS7omqrtPyPRJ
	Z/NjRl6BwedhIs/c+O3B/fBDEayefHSaTTyVGsnA9uSawwn02foaRKdVkT4b6fovSk7YDf5rjPJRG
	V81UMyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf60-00000006GVx-3emx;
	Wed, 04 Nov 2026 17:48:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOf5y-00000006GV7-1LOv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:48:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE91F1BB2;
	Wed,  4 Nov 2026 09:48:17 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C9E13F673;
	Wed,  4 Nov 2026 09:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793814501; bh=oASbG9IPRCzTNzC8UolpOCHZzz0087A7XJVv/tKS9jE=;
	h=From:Subject:Date:To:Cc:From;
	b=r95KcpB85plr8HqeMRPuE6sErFNS9LYMVz8+ERXlqXPBe45n+1ZIXcqvI1HUifO4w
	 oxzHPbHlNTlhrr0bVfoEYS+1az3US3k6ZY8jUKFFJo1UfQx3h4NWYSejoDIPNyS/z5
	 aGA3Czu+nCliBUIIKFP7r3qosmiBcsJu85o3/NbE=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver
 issues
Date: Wed, 04 Nov 2026 17:47:54 +0000
Message-Id: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpv62oC/32NwQ6CMBBEf4Xs2Rq6Qo2e/A9DSCkLrAnUdLHRE
 P7dgnePLzNvZgGhwCRwzRYIFFnYTwnwkIEb7NST4jYxYI5G6xzV4GWue3axrDt+kyhNRBYvLZI
 tIGnPQHuQrHv1Y3k1D3LztrM1BpbZh8/+GfXW+zMftcrVuTg1Rhs0nStvNoxH50eo1nX9AgH2B
 1fAAAAA
X-Change-ID: 20261102-host_gicv5_fixes-1eeea29d2ea4
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>, stable@vger.kernel.org, 
 Sashiko AI <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_094822_454681_5EE08ADB 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes issues in the GICv5 host IRS and ITS drivers.

The ITS invalidation serialisation fix addresses Sashiko's report of a
race between event and device invalidation commands [1]. The other
patches correct IRS allocation and routing behaviour, serialise IRS
synchronisation, and fix ITS L1/L2 table selection, cache maintenance,
ACPI coherency handling, and resource cleanup.

The IRS changes:
* Reject allocation of an SPI without an IRS, preventing a null-pointer
  dereference, and warn about low-quality firmware.
* Only program IRS_PE_CR0.DPS when 1-of-N routing is supported as this field
  is RES0, otherwise.
* Serialise IRS synchronisation requests, as the IRS ignores a request while
  an earlier one is still active.

The ITS changes:
* Serialise event and device cache invalidations because both use the ITS's
  shared DIDR register, so concurrent writes are a bad idea!
* Select linear device and interrupt translation tables when one L2
  table covers the full ID space. Currently, this selects the wrong
  path, then the L1 table code rejects the attempt to create the
  table.
* Check the ACPI noncoherent flag with ACPI, rather than checking the
  DT's property.
* Correct cache-maintenance sizing after limiting the DeviceID width.
* Invalidate the device cache before freeing an ITT.
* Use firmware-node names in initialisation warnings.
* Release the reserved MMIO region if DT-based ITS initialisation fails.

I've CC'd stable for the IRS/ITS locking fixes, the ITS table alloc
issue, and the ACPI coherency fix, as these are the most important
changes to backport.

The series is based on v7.4-rc1. Thanks for taking a look!

Sascha

[1] https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
Changes in v2:
- Explained why IRS synchronisation uses a raw spinlock in the KVM
  affinity path.
- Clarified the ITS invalidation race and described the KVM forwarding
  path.
- Reworked to calculate the device-table size after capping the
  DeviceID width.
- Reordered local declarations in the ITS probe function to be in
  reverse fir tree order.
- Added Acked-by tags.
- Link to v1: https://patch.msgid.link/20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com

To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Sascha Bischoff <sascha.bischoff@arm.com>
To: Timothy Hayes <timothy.hayes@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Jonathan Cameron <jic23@kernel.org>
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Sascha Bischoff (10):
      irqchip/gic-v5: Reject SPIs not backed by an IRS
      irqchip/gic-v5: Only set IRS DPS when 1ofN routing is supported
      irqchip/gic-v5: Serialise IRS synchronisation requests
      irqchip/gic-v5: Serialise ITS invalidation commands
      irqchip/gic-v5: Use linear DT and ITT when L2 covers all IDs
      irqchip/gic-v5: Honour ACPI ITS noncoherent flag
      irqchip/gic-v5: Use firmware node name in ITS warning
      irqchip/gic-v5: Invalidate ITS device cache before freeing ITT
      irqchip/gic-v5: Clean the allocated linear device table size
      irqchip/gic-v5: Release ITS MMIO region on DT probe failure

 drivers/irqchip/irq-gic-v5-irs.c   | 22 +++++++++++++++-------
 drivers/irqchip/irq-gic-v5-its.c   | 34 ++++++++++++++++++++++++++--------
 drivers/irqchip/irq-gic-v5.c       |  9 +++++++++
 include/linux/irqchip/arm-gic-v5.h |  1 +
 4 files changed, 51 insertions(+), 15 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-host_gicv5_fixes-1eeea29d2ea4

Best regards,
--  
Sascha Bischoff <sascha.bischoff@arm.com>


