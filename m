Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE74FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aAe39mLA5/fPJxqo8iO/ISlY7rAtO3PyDDUS3k0p3cI=; b=y8eoWIytb+GIdKJDS2COOEkgBB
	3ag5KMTnyDIeC9hg9K0Fe3L7G5D4vR2hoYuUh/fsBOONE9iMKUucwk7Bnij8nTWAGF/K62DKrDKrU
	gch0SLrsksovsd/o/ubxIyFwF9J44jmmYVS8Q3urqZyQtBvrDXugQvcc2h3yaUJ3abtfxWjZRTwqc
	fA4aFW7317aa2rPC4IGgmy00Ieiq14BRdgMPIcILwrBItw3Kone/b5ELZ15gdlne2ZeNWOZlp6PxR
	Qcjl5Xm07SrfeP3ciZ/cz3rYykAAvv0X+tkNH7n7mmbKpdgic6UN/i33MlTYBjj1sRvh+rK4dTIOJ
	c7Xjjtuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKLo-0000000Fn8T-1LlS;
	Fri, 11 Jul 2025 20:28:08 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJGr-0000000Fcuk-3XAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 19:18:58 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 8495121151BB; Fri, 11 Jul 2025 12:18:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8495121151BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1752261535;
	bh=aAe39mLA5/fPJxqo8iO/ISlY7rAtO3PyDDUS3k0p3cI=;
	h=From:To:Cc:Subject:Date:From;
	b=tLAD1uEPz9Axn6TCbuWFL94QgYLEMSZssf7UtNswEAI7frs1J2XLdUbMyIL5WnsUD
	 jm94PAdBbd9Cw78unAxNu5fqd0P9b4uaQkxd1cUXRMTXZdK62neOtURdi61158EYz5
	 yqtNTTHR3FZ/Gs7IzXPy1sboX+jw6Y7m/jwcajEE=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	tglx@linutronix.de,
	bhelgaas@google.com,
	romank@linux.microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH v3 0/3] Nested virtualization fixes for root partition
Date: Fri, 11 Jul 2025 12:18:49 -0700
Message-Id: <1752261532-7225-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_121857_901110_F101E468 
X-CRM114-Status: GOOD (  10.51  )
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

Fixes for running as nested root partition on the Microsoft Hypervisor.

The first patch changes vmbus to make hypercalls to the L0 hypervisor
instead of the L1. This is needed because L0 hypervisor, not the L1, is
the one hosting the Windows root partition with the VMM that provides
vmbus.

The 2nd and 3rd patches fix interrupt unmasking on nested. In this
scenario, the L1 (nested) hypervisor does the interrupt mapping to root
partition cores. The vectors just need to be mapped with
MAP_DEVICE_INTERRUPT instead of affinitized with RETARGET_INTERRUPT.

Changes in v3:
- Remove 3 patches (#1,#3,#4 from v2) which were merged already (Wei Liu)
- Fix bug in #1 introduced in v2 (Michael Kelley)
- Improve commit message in #2 (Michael Kelley)
- Document return value of hv_map_msi_interrupt() in #2 (Michael Kelley)

Changes in v2:
- Reword commit messages for clarity (Michael Kelley, Bjorn Helgaas)
- Open-code nested hypercalls to reduce unnecessary code (Michael Kelley)
- Add patch (#3) to fix cpu_online_mask issue (Thomas Gleixner)
- Add patch (#4) to fix error return values (Michael Kelley)
- Remove several redundant error messages and checks (Michael Kelley)

Nuno Das Neves (1):
  Drivers: hv: Use nested hypercall for post message and signal event

Stanislav Kinsburskii (2):
  x86/hyperv: Expose hv_map_msi_interrupt()
  PCI: hv: Use the correct hypercall for unmasking interrupts on nested

 arch/x86/hyperv/irqdomain.c         | 40 +++++++++++++++++++++--------
 arch/x86/include/asm/mshyperv.h     | 22 ++--------------
 drivers/hv/connection.c             |  5 +++-
 drivers/hv/hv.c                     |  6 +++--
 drivers/pci/controller/pci-hyperv.c | 18 +++++++++++--
 5 files changed, 55 insertions(+), 36 deletions(-)

-- 
2.34.1


