Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8F60A4AD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BHovj2nK;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b7Day1CE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=830H2YTMFkD9IORfLXHCHq/I9Z/gK3pKXYSwz8rUqk4=; b=BHovj2nK6xWus5lhidT/EKDdxN
	p9JKnhdanqLkRF1dJSU71e4ajbXCKKUZlGWUVgzH27zhjMdM+OQEllgA7BzJVFYTFbzNgjV6TLBmS
	107I094VU7yLirhQEdx2kQKF0/rYrO34ovAGdwIR2gIIkr/fpTshqH69wi2dfrjWEhMQ4hW7xBW0p
	1oSsg5jGZ0lFjSzWyXXTh+8RDEpNT2OdvU2eGiUCbFW0+bWQluwXSnxhpKGvPBfei0q2ZuKfmGhaq
	AaC5KMXK9qun/k6gu68hmvrbBt6dj+SvNIRXuL2tnYfEp8s3vn6o/AESqiPL1P54ovWYlTiBXEEkE
	cPdhKLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCsD-0000000ACxT-0mpk;
	Tue, 20 Oct 2026 16:39:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCsA-0000000ACvW-2smm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:39:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83B11596;
	Tue, 20 Oct 2026 09:39:28 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DF2F3F7D8;
	Tue, 20 Oct 2026 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792514371; bh=5rR7Cm0/WLTiRNhzJ0pe4uv+L2juToro2br9wZ5Wk7o=;
	h=From:To:Cc:Subject:Date:From;
	b=b7Day1CEKJw+adAz90dZ+i2OF/o9tpbIQwSTwJ4ylGS+KplNNCbhZCKNN++pf9BBr
	 qFE6tFRuSCdkcl8+sYER64nWZigWMmAu2baN6JcHltYCx56t4ksOu99o1v7bLXndR4
	 bsYa/3TIyQWq7L81Ox3D77JOKo6n5XCDV1rjQhEM=
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
Subject: [PATCH v3 0/2] KVM: arm64: Reject mismatched VGIC/ITS models
Date: Tue, 20 Oct 2026 17:39:21 +0100
Message-Id: <20261020163923.1407856-1-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_093934_785860_FB8F33CE 
X-CRM114-Status: GOOD (  10.18  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a GICv5 host with legacy GICv3 support, KVM exposes both VGIC
models to userspace. A VM can create a GICv3 ITS alongside a GICv5
VGIC, because neither creation path checks the model of the other
device. The ITS sets has_its, but a GICv5 VM cannot use a GICv3 ITS
for MSI translation. Creating the ITS before the VGIC also lets
userspace select an incompatible VGIC model later.

The same issue affects GICv2 on hosts with GICv3 ITS support. KVM
previously accepted a GICv2 VGIC and a GICv3 ITS in either order, then
ignored the ITS. The new checks reject this pairing with -ENODEV.

Record the VGIC model required by a GICv3 ITS and reject incompatible
device creation in either order. Drop has_its in favour of checking
that its_model matches vgic_model, so an ITS created without an
in-kernel VGIC is not reported as available. The second patch tests
both orderings of the GICv5 mismatch, skipping the test if the host
does not offer a GICv3 ITS.

This series is based on kvmarm/next-7.4+fixes-7.3-2.

Changes since V2:

* Check vgic_model in vgic_has_its(), as pointed out by Sashiko [1]
  and Fuad [2], so an ITS without an in-kernel VGIC is not reported as
  present.
* Document the GICv2 behaviour and make the first patch subject
  independent of the GIC version.

Changes since V1:

* Worked in Marc's suggestion to drop has_its.
* Check for its_model being non-zero in vgic_has_its(), allowing us to
  drop has_its.
* Added a comment to explain what we are actually doing. Again, Marc's
  suggestion.
* Changed the type of vgic_model from u32 to enum kvm_device_type.

Thanks,
Sascha

[1] https://lore.kernel.org/all/sashiko-outbox-177254@kernel.org
[2] https://lore.kernel.org/all/CA+EHjTzqKiWr2tnV0rUiA4VVCs5a0E2XQQTdwvH0bTKZ5dxe5A@mail.gmail.com/

Sascha Bischoff (2):
  KVM: arm64: vgic: Require matching VGIC and ITS models
  KVM: selftests: Reject GICv3 ITS with a GICv5 VGIC

 arch/arm64/kvm/vgic/vgic-init.c             | 17 +++++++++++
 arch/arm64/kvm/vgic/vgic-its.c              | 15 +++++++++-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c          |  5 +---
 include/kvm/arm_vgic.h                      |  5 ++--
 tools/testing/selftests/kvm/arm64/vgic_v5.c | 32 +++++++++++++++++++++
 5 files changed, 67 insertions(+), 7 deletions(-)

-- 
2.34.1


