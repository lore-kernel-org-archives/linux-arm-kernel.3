Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43923CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//uIbg50YuW84UwhRnJ8lducMYqmOge+fitLLKxnYqs=; b=q1uUT4y2t7UV2BA2B8DigzkPNg
	uLxn1+FOvX1ZkVV4B3h0C+4JRa635UlKEJUx6XKNeBOBqcExqmhegpN1w6jxvH4LQs/uDUqvmW5YR
	FWp/mv2ehqT9OKvhDdjKQxNYmQ9QNs5rX6wjLuiIIcbldXjAKFHnu/XIOa1jt3T/Nag7JVBsgFTkd
	iYesNJ+79kye2ynjxigA+yTuIWGhjrb6oNuZXHyS/P++U8iAYhPm9bAId9/+lyPXSxR5ImUvv7hG5
	TKQr+UaVl0LziidKTzi9NrALMxFq+CCMki5E1svhBU7UHLFUU3CMK6nbaO2gm1FdIrOwcGNlX+arU
	AE6jSf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvn-0000000DLbs-3T2r;
	Mon, 11 May 2026 11:36:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvc-0000000DLUg-3Lg7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=//uIbg50YuW84UwhRnJ8lducMYqmOge+fitLLKxnYqs=; b=CSmbvxedeenxBEGyhxliFxBYuc
	jMuL4/lkyddFHdhxQZjKiUnPV+MbpI5TuAw+xdwEgxDBUcL3rlkoDjcLRPxZBYE9z0xVwHiwqWlLL
	8t1O9C8fZD7pqt54iD8J4a3CroA+YwKtQa5aexSBG2kO/W46xwaLoQWdza12YfgPK2fgQ5We5KpAA
	s+m2Qyhxj6ZQRYQE13Yoa4VxyYcpuztFKMPXKSHZf5dlf55O+zuSxu6rIdHKIOmUVZfMuv3cqC0v4
	xkJLg8XjVHknxRABoP7VQYi1mhhQmzXdD1IIeora/Q28zGNCzvNkj58DOw8pkGcqpUrRPp7v4m27z
	DnJ0Jhog==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvZ-0000000BUT8-2872;
	Mon, 11 May 2026 11:36:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wMOvY-0000000Dx0R-0E3o;
	Mon, 11 May 2026 12:36:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Kees Cook <kees@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] KVM: arm64: vgic: Fix IGROUPR writability and IIDR revision control
Date: Mon, 11 May 2026 12:30:42 +0100
Message-ID: <20260511113558.3325004-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

Maintaining precise guest compatibility across host kernel upgrades — 
and even downgrades, since rollback is sometimes necessary — is not 
optional. That *shouldn't* need saying, but maybe it does:
https://lore.kernel.org/all/6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org/

This series fixes the GICv2/v3 IGROUPR writability model to be
consistently controlled by the GICD_IIDR implementation revision,
replacing the ad-hoc v2_groups_user_writable flag.
  
Before commit d53c2c29ae0d ("KVM: arm/arm64: vgic: Allow configuration
of interrupt groups"), IGROUPR was read-only on both GICv2 and GICv3.
That commit made it unconditionally guest-writable, but provided no
mechanism for userspace to restore the previous behaviour for guests
that were launched on older kernels (which which might need to be
migrated back to older kernels).

The v2_groups_user_writable flag (added by 32f8777ed92d) attempted to
gate GICv2 userspace IGROUPR writes until userspace wrote the IIDR,
but the guest write path was never gated, creating an inconsistency
where the guest could modify groups that userspace couldn't save or
restore.  QEMU never writes GICD_IIDR, so its GICv2 IGROUPR
save/restore (QEMU commit eb8b9530b0c) appears to be silently broken.
  
This series:
 - Allows userspace to set IIDR revision 1, to restore the original
   read-only IGROUPR behaviour for both GICv2 and GICv3 (patch 1)
 - Removes v2_groups_user_writable and makes both guest and userspace
   writability follow the IIDR revision directly (patch 3)
 - Adds selftests covering IIDR revision semantics and a QEMU-style
   save/restore scenario (patches 2, 4)
  
Tested on EC2 c7g.metal (GICv3 native) and under QEMU-TCG (GICv2).

David Woodhouse (4):
      KVM: arm64: vgic: Allow userspace to set IIDR revision 1
      KVM: arm64: selftests: Add vgic IIDR revision test
      KVM: arm64: vgic: Remove v2_groups_user_writable and use IIDR revision directly
      KVM: arm64: selftests: Add GICv2 IGROUPR writability test

 arch/arm64/kvm/vgic/vgic-mmio-v2.c                 |  15 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                 |   4 +
 arch/arm64/kvm/vgic/vgic-mmio.c                    |   4 +
 include/kvm/arm_vgic.h                             |   4 +-
 tools/testing/selftests/kvm/Makefile.kvm           |   2 +
 .../testing/selftests/kvm/arm64/vgic_group_iidr.c  | 118 +++++++++++
 tools/testing/selftests/kvm/arm64/vgic_group_v2.c  | 226 +++++++++++++++++++++
 7 files changed, 361 insertions(+), 12 deletions(-)


