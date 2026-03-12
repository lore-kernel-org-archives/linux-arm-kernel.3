Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4AFFED2E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jYi5R2QzLdWw6J2jwS+3hBS8Ikq/4eQgucAWBQcvYj8=; b=q5tswnGcgIPzEdR8QjgrsOfF3H
	xfjuwB86sxWMyc4ZugTniKGj4cj/12uPwGxzX9ZsZx56FJV+wgBnv75PiTWrsFaym4fcPVmfeSjtR
	zRIVw5Wfxe6NLUC/4T8H+4G3tFNaHlJBxJ31rIJBPzr3Gd1LwOx9+nkAP8tYgsDz96RI5Yt48uI34
	jGmFtP+lOfXJy5kjuvqS9lczikp18cN4SRQhivZxzXFQxA7+Wy4n3j4aOJIaEcSUUr7z8FVtEKNOo
	hbOhKGSgIjcj4oRq+LYr/FinVUwH72JIBvG9j0o+r8IoeHmqgbCHjmOU4ufkroelRF8tsZMukh4AL
	XPDkxlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5H-0000000DbUV-3c93;
	Thu, 12 Mar 2026 08:07:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b5F-0000000DbTe-0Og5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:07:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F62D40453
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65394C4CEF7;
	Thu, 12 Mar 2026 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773302872;
	bh=Y/1Whbrpqe5xP9R8AZ4x/rJ+9WQsWAAbYunVt7RHi6s=;
	h=From:To:Cc:Subject:Date:From;
	b=KoEjvD2n+R057NTZ/XFXUQkwaogi3fe6wn37ZZ9o7HDbBsastJsa92LJvS/ycobIl
	 Ju9166/E7IZx3vnJ1Myou5psme4rebxr50y8ooeLWaWzISm+j/LivFKiejky7MdvZB
	 eFVmg6ZrbkdoS2M1COsWdjj8lbSQwrBWIifbSkRPz1zyOXGYO/Ija/9Q6TljnqPRwd
	 hl94e3oqRo2Fs1yabsBNacS3OXTrvuU8j4Yh0hpS9plHuJ26eBQIo5UoyhCpPQRmHZ
	 F4YQ7h94RYYLPg+p7psl7lX0MTs6oxISLrZDe0q99IjAlG0lUYS/x7Powid0Y4E8CP
	 EyAb9hKMOnd5A==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [RFC PATCH v3 00/12] coco/TSM: Implement host-side support for Arm CCA TDISP setup
Date: Thu, 12 Mar 2026 13:37:31 +0530
Message-ID: <20260312080743.3487326-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_010753_176748_58F735E3 
X-CRM114-Status: GOOD (  12.54  )
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

This patch series implements the host-side changes needed for end-to-end
Arm CCA TDISP setup. It adds the RMI/RHI plumbing required to create and
manage Realm vdev objects, service device-attestation object requests, and
complete the KVM/RMM flows needed for device run-time transitions.

The series is based on the RMM ALP17 specification [1] and the
RHI v1.0 BET1 specification [5].

At a high level, the series adds support for:
- host-side vdev communication and lifecycle management
- host handling of RHI DA object read/size requests
- host-side fetching and caching of interface reports and measurements
- KVM handling of vdev request/complete exits
- KVM handling of map/validation exits and teardown on granule destroy
- vdev transition to TDISP RUN state
- enabling DA in Realm create parameters

The series builds upon the TSM framework patches posted at [2] and depends on
the KVM CCA patchset [3]. A git repository containing all related changes is
available at [4].

Previous posting:
rfc-v1: https://lore.kernel.org/all/20250728135216.48084-1-aneesh.kumar@kernel.org
There is no rfc-v2 posting. This series is marked rfc-v3 to stay aligned
with the rest of the CCA patchsets that are being posted as v3.

Changes from v1:
- rebase to latest kernel and core TSM changes
- address review feedback

[1] https://developer.arm.com/-/cdn-downloads/permalink/Architectures/Armv9/DEN0137_1.1-alp17.zip
[2] https://lore.kernel.org/all/20260303000207.1836586-1-dan.j.williams@intel.com
[3] https://lore.kernel.org/all/461fa23f-9add-40e5-a0d0-759030e7c70b@arm.com
[4] https://gitlab.arm.com/linux-arm/linux-cca.git cca/topics/cca-tdisp-upstream-rfc-v3
[5] https://developer.arm.com/documentation/den0148/latest/ RHI

Aneesh Kumar K.V (Arm) (12):
  coco: host: arm64: Add support for virtual device communication
  coco: host: arm64: Add support for RMM vdev objects
  coco: host: arm64: Add helpers to unlock and destroy RMM vdev
  coco: host: arm64: Add support for da object read RHI handling
  coco: host: arm64: Add helper for cached object fetches
  coco: host: arm64: Fetch interface report via RMI
  coco: host: arm64: Fetch device measurements via RMI
  coco: host: KVM: arm64: Handle vdev request exits and completion
  coco: host: KVM: arm64: Handle vdev map/validation exits
  KVM: arm64: Unmap device mappings when a private granule is destroyed
  coco: host: arm64: Transition vdevs to TDISP RUN state
  KVM: arm64: CCA: enable DA in realm create parameters

 Documentation/virt/kvm/api.rst           |  22 +
 arch/arm64/include/asm/kvm_rmi.h         |   4 +
 arch/arm64/include/asm/rhi.h             |   9 +
 arch/arm64/include/asm/rmi_cmds.h        | 163 +++++++
 arch/arm64/include/asm/rmi_smc.h         |  75 +++-
 arch/arm64/include/uapi/asm/rmi-da.h     |  43 ++
 arch/arm64/kvm/rmi-exit.c                |  55 +++
 arch/arm64/kvm/rmi.c                     | 183 +++++++-
 drivers/virt/coco/arm-cca-host/arm-cca.c | 200 +++++++++
 drivers/virt/coco/arm-cca-host/rmi-da.c  | 544 ++++++++++++++++++++++-
 drivers/virt/coco/arm-cca-host/rmi-da.h  |  39 ++
 include/linux/kvm_host.h                 |   1 +
 include/uapi/linux/kvm.h                 |  10 +
 virt/kvm/kvm_main.c                      |   6 +
 14 files changed, 1337 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/include/uapi/asm/rmi-da.h

-- 
2.43.0


