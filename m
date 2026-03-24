Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA505F54ADE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sI6V0alAInp+YEqTm9i0iP4YwBvR6bTOYbLWwt85RwA=; b=H40HMpmp9qun2efeiQBXRpt87L
	PZueQFOOleVD2OihDIFgDIsWYz2F4o5eusSXc/LjzBsHeiO3jaHodHgks5fp49qIOUpckmvkWVnbV
	88UCmtQLoog6s4fmVNGiGhauSSpS7iFJKL2JaiWvM5wSz7QTWR5/SaNn6G5EfB2iylEezUhyDE9jN
	iCWb9iyYuLuHUQjap1Xe1YJtZUENLdeiHWxyjKtWDyRqM5kZSQHcxUMDVx+1GmSPJhxOpRngFYj17
	klhc1erdOdxw9rQ78Gkw++4k7hsJuNwZlbLOHJNhtL7hC0NLvxYjPlckOk+afLkPZ72hHMmIZ8zMz
	3hNDR2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w557K-00000001xHO-42PO;
	Tue, 24 Mar 2026 17:00:34 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w557I-00000001xGB-0kLi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371632; x=1805907632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRiNPjyR6BmckrFz9yS55d2yQZU16Z4uT3UMgBowpHk=;
  b=XVu7atomGqeRQ/mCvdsKBuOQqnS1A97ZFHQ5puo3JRTcIwdzrp5Yr2Rd
   jj1ETPgCNbjE6BE79nJ3C7Zaa+z4mSwmDHFYxZRmzrp2mpbO4Cu3Qt/yD
   vJJiRCY2WGxFF2yToGAcCqMXJn0mooQi9q830Eh2W/9dyTmG97j3QNmRd
   mzE6F3SHc1fSTFh0U4wYdOQ1jinn5Iw0QBTFOWxePvgJJAl/rtzmYuJKM
   jDxSMumIEEoe+9e1PoNoEwc9Sqib5SCOCiOVH3nSToaOEA2SziPRnnnZT
   hG7orP7S4succId+dkQnlq9tlZ16Uzf2dP8dFFiFg03yoXx6YLJepcJZr
   A==;
X-CSE-ConnectionGUID: dDI18wGOQGmOcux1S44yKg==
X-CSE-MsgGUID: FxtUrRF2TU+z74POaraNZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75281469"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75281469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:31 -0700
X-CSE-ConnectionGUID: NHjFhTG1RYO9C2glveQ6yA==
X-CSE-MsgGUID: hhyUW1HYQmiP63jGpn9/jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219540299"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:22 -0700
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
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 08/10] PCI: Rename window_alignment() to pci_min_window_alignment()
Date: Tue, 24 Mar 2026 18:56:31 +0200
Message-Id: <20260324165633.4583-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100032_262652_11F309C4 
X-CRM114-Status: GOOD (  12.95  )
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

window_alignment() lacks prefix. Rename it to pci_min_window_alignment()
in order to include the prefix and also add min to indicate the returned
window alignment is the minimum PCI spec and arch allows.

Also make it available in drivers/pci/pci.h as upcoming changes will need
to call it from outside of setup-bus.c.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h       | 3 +++
 drivers/pci/setup-bus.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce..2edb03c1c6b9 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1053,6 +1053,9 @@ static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
 	return resource_alignment(res);
 }
 
+resource_size_t pci_min_window_alignment(struct pci_bus *bus,
+					 unsigned long type);
+
 void pci_acs_init(struct pci_dev *dev);
 void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 61f769aaa2f6..edc0d682dcad 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1035,7 +1035,7 @@ resource_size_t __weak pcibios_window_alignment(struct pci_bus *bus,
 #define PCI_P2P_DEFAULT_IO_ALIGN	SZ_4K
 #define PCI_P2P_DEFAULT_IO_ALIGN_1K	SZ_1K
 
-static resource_size_t window_alignment(struct pci_bus *bus, unsigned long type)
+resource_size_t pci_min_window_alignment(struct pci_bus *bus, unsigned long type)
 {
 	resource_size_t align = 1, arch_align;
 
@@ -1084,7 +1084,7 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t add_size,
 	if (resource_assigned(b_res))
 		return;
 
-	min_align = window_alignment(bus, IORESOURCE_IO);
+	min_align = pci_min_window_alignment(bus, IORESOURCE_IO);
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct resource *r;
 
@@ -1339,7 +1339,7 @@ static void pbus_size_mem(struct pci_bus *bus, struct resource *b_res,
 		}
 	}
 
-	win_align = window_alignment(bus, b_res->flags);
+	win_align = pci_min_window_alignment(bus, b_res->flags);
 	min_align = calculate_head_align(aligns, max_order);
 	min_align = max(min_align, win_align);
 	size0 = calculate_memsize(size, realloc_head ? 0 : add_size,
-- 
2.39.5


