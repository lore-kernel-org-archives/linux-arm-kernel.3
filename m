Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B64CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTEMLwgDoxHsliqjBBsP3fZzgpPtM76dIGvYEY0h1oQ=; b=lXhZfdrSIbZ31rje2UOgZBApy+
	izyyGe2gJ+pZgape+uNlwiqI4BngIw9xtlKrL2V8Qkm0olSmMsKYKhImKPsX+PVdUR+KCTzSJjrBE
	sn22h1zsW94V+T7gNth14Y2FzlZOPwqqvlTaJRFR/MsE376h5Yoj3ZcQ5/NO+jDn9jIAfUK7u44P7
	9bQ8as1NdY/gGTNNbr33VzbEirdiQ1xyif+u8P/2o7mYL2M2Arj6bBewzv9nwo01wL4mu0C83ZLDM
	hlUiAWeyTxrIW/wzSICLvZZF5Z1OjfyDuC+8A3KZYuR/3g3KOjfjd9VgdWAbdnfQ02YWBSw9ggYRH
	zruQFIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lrQ-00000008AEQ-0usD;
	Fri, 17 Oct 2025 14:55:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lrM-00000008ACs-2eZi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:55:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 522A7153B;
	Fri, 17 Oct 2025 07:55:00 -0700 (PDT)
Received: from [10.57.36.104] (unknown [10.57.36.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C9463F66E;
	Fri, 17 Oct 2025 07:55:03 -0700 (PDT)
Message-ID: <461fa23f-9add-40e5-a0d0-759030e7c70b@arm.com>
Date: Fri, 17 Oct 2025 15:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v11 00/42] arm64: Support for Arm CCA in KVM
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20250820145606.180644-1-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250820145606.180644-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_075512_802390_96B2E018 
X-CRM114-Status: GOOD (  19.22  )
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

v6.18-rc1 is out, so I've rebased and refreshed the series. Branches are
below:

kernel: https://gitlab.arm.com/linux-arm/linux-cca cca-host/v11
kvmtool: https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v9

However I'm not going to spam you all with the patches because there are
some significant changes that are still to be worked out which Marc has
pointed out (thanks for the review!). Specifically:

 * We've agreed that the uAPI should be more like "normal" KVM. So
   rather than expose the underlying operations (create RECs, init
   RIPAS, populate memory, activate), the VMM should set this up 'as
   normal' (but using the guestmem_fd capabilities to mark the memory
   private) and then on first vcpu run the realm should be configured,
   RIPAS set based on the memslots/guestmem_fd and any data written in
   the guestmem_fd populated into the realm.

   The upshot of which is that a VMM will require only minimal changes
   to support CCA, and the ordering requirements (for attestation of
   setting up the realm will be handled by KVM).

   Since this is a big change in the uAPI it's going to take a while to
   prototype and figure out all the details, so please bear with me
   while I work on an updated version.

 * There are issues with the PMU handling where the host is not provided
   with as much flexibility it should. For the PMU it's not possible for
   the host to maintain a PMU counter while the realm is executing. This
   means that sensible uses like getting an overflow interrupt on the
   cycle counter break with the use of a realm. This, however, will
   require a spec update to fix as the RMM will need to in some cases
   emulate the PMU registers.

 * The GIC handling is also more restrictive then it should be. Although
   the host is responsible for emulating the GIC, it is unable to set
   trap bits, restricting the host's ability to do this. There is
   concern that this could limit the ability to implement hardware
   workarounds in the future. Again a spec update is needed to fix this.

However, changes that you can see (in the branch) include:

 * Fixing the naming of various symbols. There were previously a lot of
   instances of "rme" in functions which were not directly related to
   the hardware extension. These are now renamed to "rmi" reflecting
   that they are part of the interface to the RMM.
   (This is the only change affecting kvmtool, although it is also
   binary compatible)

 * The code now checks with the hardware feature (RME) before probing
   for RMI.

 * There is now an allowlist for CAPs rather than individually disabling
   the ones known to be an issue with realms. (This also simplified the
   code, dropping one patch).

 * Fixes for the vgic handling: make sure the VGIC v4 state is
   synchronised and only populate valid lrs.

 * A few other minor updates from reviews, and some minor changes from
   rebasing.

Thanks,
Steve


