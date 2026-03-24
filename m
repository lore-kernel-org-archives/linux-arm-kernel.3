Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A20F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vVIqBuyIq4R4/UVhTmLSRBTYm0AzPhhoH+Jbpk0DIV4=; b=zb2iUns275R6IXRCx6PmN89oaK
	DA2rQTvsDp4WFIOWz1ftXDFL3Nrl3BbMC7USVlqeCXIYs3jB1BVFwx+mJmb6Izi6ESIvcg6xA9yB7
	UtD+1agQ8LvjCDXNJN+8sRikOf5ytr7WPRwGRrpoNN3/6Lb8kEcgorYZP6jJdTWFhDuVSHtEkTNwc
	UBI0SAZpzh+UNJ/VlGCDyJi94Lapzq8tvoxbeihoO3dYynnO75a1HQAsoF6U2pUavPurpK3dVc/6U
	wysqHl47KSMkS71fzhQwweJukNDmff5IwwRaHJQ+CI7YYBHtOAfTvI3APE2tGWRZ+qv//Ec5Opfji
	CONKGMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w555J-00000001wVo-4Byq;
	Tue, 24 Mar 2026 16:58:30 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w555H-00000001wV0-2BNm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371508; x=1805907508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AVKqbcBAH58YtvbtTvUhV6tMedua8892v/x7yCDldr8=;
  b=PTsN99bF0lSOri0HlLtKCrSzjY3kuYeKWd0ttsXOAAhx6T23XnRli6wR
   dUzUZkraco9u4olfV7qAzGMJkPKSwEMO06q1JhW2YkHxdewbCjhgGeS8c
   ZOXmOFgSnJ9zsfDkPAzcoyF41qdYhpKKwzfO5uN6/zdrWw9kImLm7MGQO
   PcHOd6wgNgA6p0iYnCrF4tQiCWMwYyfKMaaBJsVOUAej/9bcFU2hs1q6g
   Eqff3l15n6Qmd7dKiEbn8Xm0z03KykzTFy+hqy/1NNimqsdelrVFYPYow
   cRotwo6L1pxrkjqPOgslpTS3r25r3d4HMnzpBgII5c0HHUeX/cJyM4W/t
   g==;
X-CSE-ConnectionGUID: LcMClzS+Ts2+9Rt7Df+T5g==
X-CSE-MsgGUID: G8BK2+1lTLmaMvlDsaPjtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86471504"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86471504"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:25 -0700
X-CSE-ConnectionGUID: aesm43ZmRSeKftw4Z5hIbQ==
X-CSE-MsgGUID: C08Qc1D5Q9Gv1bbEQjAQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224421853"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 00/10] PCI: Improve head free space usage
Date: Tue, 24 Mar 2026 18:56:23 +0200
Message-Id: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095827_653470_7D31571C 
X-CRM114-Status: GOOD (  16.35  )
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

This series attempts to take advantage of free head space (the free
space before the aligned start address) in order to generally produce a
tighter packing of the resources/bridge windows.

The recent changes to the resource fitting algorithm caused resource
allocation failures in some cases where a bridge window that is sized
to be gapless could no longer be assigned. The previous algorithm left
a huge gaps which allowed it to place the remainder (non-aligning part
of the size) before the start address of used for the gapless fit,
whereas the new gapless approach always had to place the remainder
after the aligning part of the resources. There is not always space
for the remainder triggering those failures (e.g., when the aligning
part must be placed at the top of the window).

This series attempts to allow placing the remainder once again before
the aligning part, but now without leaving huge gaps to retain the
benefits of the gapless bridge windows. The approach is somewhat hacky
but should work thanks to PCI resources fundamentally consisting only
power-of-two atoms.

There maybe cases where architecture would not want to do such
relocation. This series adds the relocation to arch
pcibios_align_resource() functions to allow all of them taking
advantage of the better resource packing but if somebody objects doing
this relocation for a particular arch, I can remove it, please just let
me know (this relocation doesn't seem critical unless there are
regressions).

Ilpo Järvinen (10):
  resource: Add __resource_contains_unbound() for internal contains
    checks
  resource: Pass full extent of empty space to resource_alignf CB
  resource: Rename 'tmp' variable to 'full_avail'
  ARM/PCI: Remove unnecessary second application of align
  am68k/PCI: Remove unnecessary second application of align
  MIPS: PCI: Remove unnecessary second application of align
  parisc/PCI: Cleanup align handling
  PCI: Rename window_alignment() to pci_min_window_alignment()
  PCI: Align head space better
  PCI: Fix alignment calculation for resource size larger than align

 arch/alpha/kernel/pci.c          |  1 +
 arch/arm/kernel/bios32.c         |  9 ++++---
 arch/m68k/kernel/pcibios.c       |  8 +++++--
 arch/mips/pci/pci-generic.c      |  8 ++++---
 arch/mips/pci/pci-legacy.c       |  3 +++
 arch/parisc/kernel/pci.c         | 17 ++++++++------
 arch/powerpc/kernel/pci-common.c |  6 ++++-
 arch/s390/pci/pci.c              |  1 +
 arch/sh/drivers/pci/pci.c        |  6 ++++-
 arch/x86/pci/i386.c              |  5 +++-
 arch/xtensa/kernel/pci.c         |  3 +++
 drivers/pci/pci.h                |  3 +++
 drivers/pci/setup-bus.c          | 15 ++++++++----
 drivers/pci/setup-res.c          | 40 +++++++++++++++++++++++++++++++-
 drivers/pcmcia/rsrc_nonstatic.c  |  3 ++-
 include/linux/ioport.h           | 22 +++++++++++++++---
 include/linux/pci.h              | 12 +++++++---
 kernel/resource.c                | 33 +++++++++++++-------------
 18 files changed, 149 insertions(+), 46 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.39.5


