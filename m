Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2541FCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1QMqygqRQ9n7nxguaFkSaq4zfMn80dRWo2hURIjvwjc=; b=nXf/SvvKGOO6ijn2iWGWfYFQ7k
	v25LogtDIk+0Uqh3KeHKnzeMe2tPMp5se8ju6IVqBV2d75XqLe75TzNYtLD8e2b/757Mgypm9KzrW
	qNwWRCQz01b/0NucNBr5ehC9mfV8ni0zs6mMIRThg3+yirf4poCMtY8t8tzwbaKPI+iIPR6M9bA4j
	+sZKMxVQh94TLrP3Hax2I0FFFZtV1zqU5oq9nXeMRtO77CC+Co0kAevgRlxhTGlW/b9VjX3Je8Mdc
	jtUP/qTCmA4ehGStEg4xHDIHJIyy+LUxVkXlO0+cOQKYh1MonCBIFAq4rGLyByBNENMvHSOvJGn1y
	2vV7tRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIndf-00000007Xpj-0Pdr;
	Mon, 19 Oct 2026 13:42:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIndc-00000007XoN-2LyZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:42:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 124581682;
	Mon, 19 Oct 2026 06:42:47 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDBEE3F871;
	Mon, 19 Oct 2026 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792417370; bh=K7YhWkCWarL7Gtffm3d1sHgP/poIqSZiFk+2A5AwUbQ=;
	h=From:To:Cc:Subject:Date:From;
	b=l9Td4K/B09epB/osjDeXgkmUW5XdbwLQ195LGE6R8zPxfmOA++2rUDoX9Pu4O1Khz
	 1K6DeK40ZN4tYIxGSX9lBeYGqCLOSsfpevl1DHy73IYUK4mtSdmN2ywjRlBnyrODMa
	 8fM0kzLH9Pb5lkXiw+SeH5tYdYWc/QlR9ldnmqWY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: [PATCH v2 0/2] KVM: arm64: Reject mismatched GICv3 ITS/VGIC models
Date: Mon, 19 Oct 2026 14:42:40 +0100
Message-Id: <20261019134242.1289002-1-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_064252_639337_2D8F7021 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On a GICv5 host with legacy GICv3 support, KVM exposes both VGIC
models to userspace. A VM can create a GICv3 ITS alongside a GICv5
VGIC, because neither creation path checks the model of the other
device. The ITS sets has_its, but a GICv5 VM cannot use a GICv3 ITS
for MSI translation. Creating the ITS before the VGIC also lets
userspace select an incompatible VGIC model later.

Record the VGIC model required by a GICv3 ITS and reject incompatible
device creation in either order. Drop has_its in favour of using the
newly added its_model instead. The second patch tests both orderings,
skipping the test if the host does not offer a GICv3 ITS.

This series is based on kvmarm/next-7.4+fixes-7.3-2.

Changes since V1:

* Worked in Marc's suggestion to drop has_its.
* Check for its_model being non-zero in vgic_has_its(), allowing us to
  drop has_its.
* Added a comment to explain what we are actually doing. Again, Marc's
  suggestion.
* Changed the type of vgic_model from u32 to enum kvm_device_type.

Thanks,
Sascha

Sascha Bischoff (2):
  KVM: arm64: vgic: Require matching VGIC model for GICv3 ITS
  KVM: selftests: Reject GICv3 ITS with a GICv5 VGIC

 arch/arm64/kvm/vgic/vgic-init.c             | 17 +++++++++++
 arch/arm64/kvm/vgic/vgic-its.c              | 15 +++++++++-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c          |  5 +---
 include/kvm/arm_vgic.h                      |  5 ++--
 tools/testing/selftests/kvm/arm64/vgic_v5.c | 32 +++++++++++++++++++++
 5 files changed, 67 insertions(+), 7 deletions(-)

-- 
2.34.1


