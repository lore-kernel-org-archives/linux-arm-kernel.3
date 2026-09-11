Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A40AC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5+jIbHeaML6B+Ur3x9eEi4yewo/Kt/PMOlJCeipZt5M=; b=a/bJn0h4rYfzk6
	TIDvxqPFZ/a8gMLfdcYD7vd9C9OvkYLgtWvX4FvV+mirLmXC9K7Zu7rMWbvGOBrBy7MuHkBSTemwx
	D3jfa7qOd7z7f+PJhklUQ8hiPPIhfDyyICYVu/sa8EjCcwnB3X8RS4prOelywGPhKO02d2EFM/KUX
	OwegPgnpX7McQDXaeZPAKVztTMfNcjD0x8iq/f6WxruFcir3/WOYVsfmHqR+yIx5DdVNArqpb7BFR
	XrB15xZrPaybCeFE5KTSq+7WooWwTEhRj/TDatNqD+/AOtxaSsjTbSj+7tvbTWEQMAgTSpP8sZ5r4
	N+XAhstWkW8ktaOGNjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52en-0000000GyBk-2ATB;
	Fri, 11 Sep 2026 14:55:13 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52el-0000000GyAX-0Bqp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5+jIbHeaML6B+Ur3x9eEi4yewo/Kt/PMOlJCeipZt5M=; b=EUkJNdhkjGUOF8Wxlys+NSD09l
	6rqfNNEV9zkzccfrSaDL9cRXDJFKITpjW1AKNM/1HR3ZfQPQ9Oa8iRUr+XVcJRNMvhtowG4bI7HkF
	ttj2g/E7P01w3wDxooyEkUMqVqM4cMwo5vJ79iIH8LwjUPgXnEdGHgwBGnhvng6TzOrIfLkOovxiG
	y68FKTXNcqhbsUyfUXvzwBne2aF13OHWhBUF2evBdSCjjZIY/wv1ykwxMs6iy98W+yNxadNjN+r3p
	WIAgOPENJVtnO5IVVyD3b0liWjaMN+0AcIcdvX++6M0z+8r6WizH3NlI+EVtkScKVg/vxj4Lqh1vv
	xxz1URcA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x52ed-001MpD-26;
	Fri, 11 Sep 2026 14:55:03 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/2] iommu/arm-smmu-v3: SMMU hitting kdump mid-air
Date: Fri, 11 Sep 2026 07:54:43 -0700
Message-Id: <20260911-smmu_fix_aws-v1-0-75870bf9655b@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADMWpGoC/x3M3QpAQBAG0FeZvmtbVoh9FUmys8yFn3bClry7c
 h7gPFCOwgpHDyJforJvcGQzwrSM28xGPByhyIs6b601uq7nECQN462mrULZ1L5hrjwywhE5SPq
 7rn/fD9wwGH1eAAAA
X-Change-ID: 20260911-smmu_fix_aws-95f486d8ee5d
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, catalin.marinas@arm.com, 
 mark.rutland@arm.com
Cc: puranjay@kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, rmikey@meta.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244; i=leitao@debian.org;
 h=from:subject:message-id; bh=Qi7FcLryXfcYvq/4ziSNAOwppYqS9gIrKO5YGu9uROo=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqpBZCeTXEp5TBW6i/8iMmWE/II1dVApnPzaTFr
 wJxNshjb3WJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqQWQgAKCRA1o5Of/Hh3
 bZwYD/9ewf+5RSQ2EELrYKdRGz9Xhwuij1xPDIBsbP/HyDPjBOWHq8/hjRQtdOs1bne6ezyTSWw
 u/ofsEsXf2gP84GdS0KNTnuFN+IWqGSpoblZf4+2Sxl1QIBDLrjnKxndqxV3ViaeJ2tGwp44/08
 0zWn5odbabYeeth06RXOFbjwCPhbgdirtvgnVivmGQmcu7t1ErfLgO5Iy3DHOu9YYces+smrwWD
 Y0+0u5+EfGVruOxwmvVwA+vGOWDaZIyKUQJS5zpU4E9KP8SlTUMTTaSsiy8AQQsaMlwHgbnigCj
 WsuinEkrHi4Qn60Aei5KBhqnjj8xLkT4Nltsfk9MS2Fl9E6RfhQp2W6x+BmYxnUMFQInGDZ11H+
 3VDQGDcWwcfuR+fxHy9ELFz3wFL83ShvTEutVLB8bowygeeWo+ypulQtB2mA6uBjOPJ1GhtGCsD
 LJEX7yLuitnkduf3eboZx3e1nOD7ZiZxqOrVJmAzLdueyFWmFODUOqh5QV/plxIK2pDNYBqJkD8
 QiuuQNoc9zy4ANDLxdi/JDB2bfeANms4cA4GQCCutHMRerpoyY+xqaHm85/03pZzw5RH0HPbTSR
 m6c1qs8YtNkoyADziL9CppzNhUK6MvwiUbvJgpiPLUnk9vOFKgdWXEeADw/WCb/rXt0WrCLXi2e
 UzbRR1tjxaC9mWg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_075511_097684_867A6BB9 
X-CRM114-Status: GOOD (  14.80  )
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

I've found that kdump does not work on some ARM host, such as AWS
Graviton metal, and the SMMU is what seems to kills it.

The capture kernel dies about a second after it resets the SMMU, part
way through PCI enumeration, and takes the machine with it.

There is no panic and no oops: the console stops mid-line and the box
reboots, leaving no vmcore, no log and nothing on disk. Crashes on this
hardware mostly produce no dump at all.

This is my theory, from an "outsider view":

1) A crash kexec does not run .device_shutdown(), so the capture
   kernel boots on a machine whose devices are still running.

2) They keep translating through the stream table the crashed kernel
   programmed, which sits in memory the capture kernel never touches.

3) arm_smmu_device_reset() installs a fresh table with no entry for
   those StreamIDs, so their in-flight DMA raises C_BAD_STREAMID. (seen
   when I cleared CR0_EVTQEN)

4) When the platform reports hardware errors to firmware first,
   firmware answers by resetting the machine.

If my  kdump initrd has no driver for the two ENA NICs, so nothing
resets them and they keep DMAing for as long as the capture kernel runs.

Things that will not crash/interrupt kdump:

   a) Get the ENA driver NIC into the kdump. This is costly.
   b) Removing ENA driver (or PCI device) before the crash

Debugging further, I  found that faults are invisible by default,
because the capture kernel clears CR0_EVTQEN. With the event queue left
enabled, one device accounts for all of them:

  [   36.191293] arm-smmu-v3 arm-smmu-v3.0.auto: SMMU currently enabled! Resetting...
  [   36.418009] event: C_BAD_STREAMID client: (unassigned sid) sid: 0x32d00 ssid: 0x0
  [   36.706345] event: C_BAD_STREAMID client: (unassigned sid) sid: 0x32d00 ssid: 0x0
  [   37.313703] pci 0003:02:02.2: Adding

with the platform resetting mid-line. sid 0x32d00 is 0003:2d:00.0, one of
ENA NICs.

My lovely robot and I came with two patches that solved the problem,
from a practical perspective and I want to share what has been tested.

Patch 1 carries the previous kernel's L1 descriptors into the new KDUMP table, so
those streams keep translating.

Patch 2 stops the core discarding that again: iommu_dma_init() already
enables deferred attach for a capture kernel, but the core only honours
it for drivers implementing .is_attach_deferred, which until now meant
amd and intel. Without it iommu_setup_default_domain() attaches
a default domain at probe and the fault returns as F_TRANSLATION.

The x86 IOMMU drivers solve the same/similar problem the same way; see
commit 38e5f33ee3596 ("iommu/amd: Reuse device table for kdump").

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      iommu/arm-smmu-v3: inherit the previous kernel's stream table in kdump
      iommu/arm-smmu-v3: defer attach in kdump so inherited entries survive probe

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 104 ++++++++++++++++++++++++----
 1 file changed, 91 insertions(+), 13 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-smmu_fix_aws-95f486d8ee5d

Best regards,
--  
Breno Leitao <leitao@debian.org>


