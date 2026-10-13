Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB7DCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wEsd/HpGtpEd69dd8r3f8jGiGH9ykeFR46CEBScWBk0=; b=wi+eylNCCMH0Z4SfO6Pac7wk95
	vx77fIPW/bHxgRcbzdpenF1O8SO0ZwOAb5XIBkMt+21U5L2NvF3Ft9pHVSbs+xwA+CoLrVkByLPxU
	nnE9tjk4sK8af83Ywn+IbyKzmXRwVNID02xe0Z5Qj1OdwHeI695I8fUd95YC86Ogq5h24uRRSiH1S
	8NsW7mDZ8LrZDIRaYIe30BT6KmworjClH7u2+czfVBUIYocwsE8bCvkpGxL4Yll0QN677Qh6ZKKnA
	KAwMPKzRfW+/jufZx5bYiqG9j2eY5FgpwGBrIzSFFn/7aqFn1UtBrXPXmFYzLOv1FaqUbkxky8xrU
	BDJs9diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXgu-0000000CIg8-2g7R;
	Tue, 13 Oct 2026 08:16:56 +0000
Received: from out-136.mta0.migadu.com ([2001:41d0:1004:224b::88] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXgr-0000000CIfO-25bZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:16:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zV/Y7LUxdXBJHF8yHit6eZfddU4Htkr3/SC3yf26G98=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791879411; v=1; x=1792484211;
 b=pbeGOFckERur38IMxOBfFlC10yByql9ZwNRg7RpABlwa/4qWYYEKt55Ups+DAiuFk3Yu0gFS
 Eew5em1lXYR6sY69IrMPqXXMybK6Nv/PVKW++WbowHcFsNuxGvtdmGT/FwVazIyQUT0SJJ6MshR
 V+X+BDMdmFn+0Rru4UMLVmn0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c9420a0c96a5878d;
	Tue, 13 Oct 2026 08:16:51 +0000
X-Mizu-Trace-ID: c9420a0c96a5878d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: vgic-its: Fix LPI double mapping and DISCARD
Date: Tue, 13 Oct 2026 09:16:44 +0100
Message-Id: <20261013081646.933312-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_011654_221260_123A0BFB 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi folks,

Changes since v1 [1]:
  - Dropped the second mapping of an LPI at MAPTI, instead of keeping a
    doubly mapped LPI out of GICv4 forwarding. (Marc)
  - Keyed that check on whether an ITE maps the LPI, not on whether its
    vgic_irq exists.
  - Added a patch that makes DISCARD remove the pending state. (Marc)

Two fixes to the ITS emulation. The first stops a guest from mapping
one LPI from two events, which can oops a GICv4 host when the VMM then
routes an assigned device's MSI to the second event. The second makes
DISCARD remove the LPI's pending state, as the spec requires.

Tested on QEMU, which emulates a GICv4 ITS. A local reproducer with two
vCPUs DISCARDs an LPI that's pending in the other vCPU's list register.
On rc3, and with patch 2 but without its halt, the guest still takes
the LPI. With the series applied, it doesn't.

Based on Linux 7.3-rc3 (fd73f4a665989).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261012084743.2228612-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: vgic-its: Don't map an LPI from more than one event
  KVM: arm64: vgic-its: Remove the pending state of a discarded LPI

 arch/arm64/kvm/vgic/vgic-its.c | 50 +++++++++++++++++++++++++++++-----
 include/kvm/arm_vgic.h         |  1 +
 2 files changed, 44 insertions(+), 7 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


