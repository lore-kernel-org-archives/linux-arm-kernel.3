Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD0FCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nr8c18RTUn0xDwoRKfPimbmUQm6/TAVBerT8a6BHSB0=; b=10ZYRS/rynlYry2o2lNjf2y2Ft
	2X0edEcw5YKJ5G51Wp9dgV+F1W51hq//EnpWcahwne1uq3fHOAG4MB9UcYYfFoTj/uHIaOe7TJfFL
	KlMuVur/rMXVCucrNwfgDEyyFBpzSd2NLQSd7fsSvPLlC7MD8HRiYJ1YvYIMmp2w2vhg1Ol2TnC8J
	0Gdu1NMOB2/NYVpcsJuvCuHsJMF42hhwjBz5emMmp4oHsP1kY36U2M3yZRzCOqDVjE2lcYscbhUHL
	YryZJms1hecmGLmKQ3nakfqz6Qhjw4dKCgdIE+/CKPk4pTK/7STtbiGzorWfs1uNZ1es6ZFne2dj5
	Yr0xINBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjlX-00000003GWH-1oTE;
	Fri, 16 Oct 2026 15:22:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjlU-00000003GVw-3Qaq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:22:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50CE1143D;
	Fri, 16 Oct 2026 08:22:30 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04EBE3F673;
	Fri, 16 Oct 2026 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792164153; bh=P3h37LSCKhNtaAxQFwfpGwdq46uqp29wJsMeVnpY23w=;
	h=From:To:Cc:Subject:Date:From;
	b=aSPQW6kEfeilzSWSstaYmBG3/uJS/q2st++JXuLqeHge+9GTdBgEyDWsg148ZdIpW
	 c/NwtOYOz+5vnuIAzD5iM2urVymgvLIJPQRZYmCAplJYysHtVJgwV3zqbGq1M2/NS1
	 76V4ItYZ8SOmE9QR+g3Qm/Jh/Vwiu5byvtLbJspQ=
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
Subject: [PATCH 0/2] KVM: arm64: Reject mismatched GICv3 ITS/VGIC models
Date: Fri, 16 Oct 2026 16:22:22 +0100
Message-Id: <20261016152225.898761-1-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_082236_903313_594232A9 
X-CRM114-Status: UNSURE (   7.45  )
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
device creation in either order. The second patch tests both orderings,
skipping the test if the host does not offer a GICv3 ITS.

This series is based on kvmarm/next-7.4+fixes-7.3-2.

Sascha

Sascha Bischoff (2):
  KVM: arm64: vgic: Require matching VGIC model for GICv3 ITS
  KVM: selftests: Reject GICv3 ITS with a GICv5 VGIC

 arch/arm64/kvm/vgic/vgic-init.c             |  5 ++++
 arch/arm64/kvm/vgic/vgic-its.c              |  9 ++++++
 include/kvm/arm_vgic.h                      |  2 ++
 tools/testing/selftests/kvm/arm64/vgic_v5.c | 32 +++++++++++++++++++++
 4 files changed, 48 insertions(+)


base-commit: 678f16b6e4767096aa3e3e6eef60e981b3f61e12
-- 
2.34.1


