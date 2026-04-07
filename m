Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C3DF46C7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PnND6iHBMV6WE1ZHJaECUBIFEEiEhNHhl942sAfaZN8=; b=iWlkzNeKqR1/BuxyeekOjFWG1b
	uhyhn/SLtdbjuQwpR1ifmNLfKm5PTYqaqOke0R4kCRxS4Igik7oE6VF3lZpgNvzORE0s37XoZ2SOM
	iX7nWJCOlutvF6o7LXCUzzHg3BnnUqBSfEZvPgs65JHm9xfAn/ycALH9YYhKgo92eiCOWrBpwTt0T
	DQZtKpkyi2Eh0xHbwWailGPkPaF2y3/UGyfOCEd5hDKAt9ERzluDijv2njN0smJiLprSV/rQB7DDJ
	Pgpo9wJ+h1ipP6mmRkoBXKZEN8aTJWMJmg8dO8J2TXP8r4ma357keJ0h8vSToXen+w2AEfKB+uGH5
	PIVpI/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADgM-00000007vcP-3cWX;
	Tue, 07 Apr 2026 21:09:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADgM-00000007vcE-0Xdz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Apr 2026 21:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PnND6iHBMV6WE1ZHJaECUBIFEEiEhNHhl942sAfaZN8=; b=EbSVYnC+aoucRZI1t/3rJLmcgk
	SNk5+GvL37isalRUjPlqIJjPz6o2HlMFTzBTXkduIEJm5ameGW+WG53vYY1Z771BNYaMQABDakZb6
	2LTG4Vktm8Xb2RlPvOlBTAp3Qvun+8KOHjDSq1FekuKcUoafrmG2YFG3uJN0t/+zcArnBUW0XDz89
	bEFz0EkIh28qL1DNxgTZvcL/JsdJhAS14t5/f6QyZQcbyAloDnVnouRXNt4y1Eaud/WGR15fp7xS+
	A1LbgqzHmow88ah2ZNLXlU616ZEyBBgrzK3otVYBdWbPp5EeSlS9hXdw7FNwCOMDwuHInAqoBN3gh
	Eh/OEGhQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADgI-00000004GbB-3Zu8;
	Tue, 07 Apr 2026 21:09:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADgI-00000008iI5-1hTK;
	Tue, 07 Apr 2026 22:09:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/3] KVM: arm64: vgic: Fix IIDR revision handling and add revision 1
Date: Tue,  7 Apr 2026 21:27:01 +0100
Message-ID: <20260407210949.2076251-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

The uaccess write handlers for GICD_IIDR extract the revision field
from the wrong variable, making it impossible for userspace to actually
change the implementation revision. Fix that.

Additionally, allow userspace to select IIDR revision 1, restoring the 
behaviour from before commit d53c2c29ae0d ("KVM: arm/arm64: vgic: Allow 
configuration of interrupt groups") behaviour where interrupt groups are 
not guest-configurable. This is needed by hypervisors that were 
reverting that commit to preserve the original guest-visible 
semantics.

When revision 1 is selected:
 - GICv2: IGROUPR reads as zero (group 0), writes ignored
 - GICv3: IGROUPR reads as all-ones (group 1), writes ignored

The IIDR revision comments in both vgic-mmio-v2.c and vgic-mmio-v3.c
are updated to document all three revisions.

David Woodhouse (3):
      KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value
      KVM: arm64: vgic: Allow userspace to set IIDR revision 1
      KVM: arm64: selftests: Add vgic IIDR revision test

 arch/arm64/kvm/vgic/vgic-mmio-v2.c                 |   7 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                 |   6 +-
 arch/arm64/kvm/vgic/vgic-mmio.c                    |  15 +++
 include/kvm/arm_vgic.h                             |   1 +
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 .../testing/selftests/kvm/arm64/vgic_group_iidr.c  | 112 +++++++++++++++++++++
 6 files changed, 140 insertions(+), 2 deletions(-)



