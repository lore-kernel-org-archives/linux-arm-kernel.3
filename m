Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B905BD69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ffdgg5zdxBvdt5VgDzqSsKQ2mNQZK/Xq8r/yfgm2nIk=; b=relNtXk+Y44nDZx9KqMOxRrHIu
	YnILTLzH46a5id4wZbJWXoNcFIGeoE3oDsXHqutdELTllZkpwMHjI0gPKgshddCqLKE2wXFkAJKpD
	5ql5fuMJq7rxuG7tkt+qdwer4nUaqIKFFFkR3fXV53x4rFEKg/g3hcoxDw4kuKFdLVCdZHLHpbqas
	VUit417waMtuuxsdi/aU6GPssNcHoWPBE7H3OhURLTY7bgGkJ3B611t7hqF0XstDmaLm9eASV4Nkx
	JFCaQoEQIRVdqwNQT7R+tezKgXGW/r73jIQCSIFTnrhhClANyOLhuOe4eP7dP/Jc2PAbtuzrG7RJ5
	o+mUJ4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgEz-0000000FquI-1f4S;
	Thu, 28 Nov 2024 15:15:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg9Q-0000000Fpw3-09kw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:09:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 164421474;
	Thu, 28 Nov 2024 07:10:19 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A8B03F66E;
	Thu, 28 Nov 2024 07:09:47 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	apatel@ventanamicro.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	s.abdollahi22@imperial.ac.uk
Subject: [PATCH kvmtool 0/4] arm: Payload memory layout change
Date: Thu, 28 Nov 2024 15:09:37 +0000
Message-ID: <20241128150937.10685-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_070952_117668_5E0C9480 
X-CRM114-Status: GOOD (  12.60  )
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

The first 3 patches are fixes to kvm__arch_load_kernel_image(). I've CC'ed
the riscv maintainer because it looks to me like riscv is similarly
affected.

Patch #4 ("arm64: Increase the payload memory region size to 512MB") might
be controversial. Follows a bug report I received from Abdollahi Sina in
private. Details in the commit message, but the gist of the patch is that
the memory region where kernel + initrd + DTB are copied to are changed
from 256MB to 512MB.  As a result, the DTB and initrd are moved from below
ram_start + 256MB to ram_start + 512MB to accomodate a larger initrd.  If
users rely on finding the DTB and initrd at the current addresses, then I'm
not sure the patch is justified - after all, if someone really wants to use
such a large initrd instead of a disk image with virtio, then replacing
SZ_256M with SZ_512M locally doesn't look like a big ask.

On the other hand, if there are no users that rely on the current payload
layout, increasing the memory region size to 512MB to allow for more
unusual use cases, while still maintaining compatibility with older
kernels, doesn't seem unreasonable to me.

Please comment, I don't feel strongly either way - I'll happy drop the last
patch if there are objections.

Alexandru Elisei (4):
  arm: Fix off-by-one errors when computing payload memory layout
  arm: Check return value for host_to_guest_flat()
  arm64: Use the kernel header image_size when loading into memory
  arm64: Increase the payload memory region size to 512MB

 arm/aarch32/include/kvm/kvm-arch.h |  5 +-
 arm/aarch64/include/kvm/kvm-arch.h |  7 ++-
 arm/aarch64/kvm.c                  | 88 +++++++++++++++++++++++-------
 arm/kvm.c                          | 35 +++++++++---
 4 files changed, 105 insertions(+), 30 deletions(-)

-- 
2.47.0


