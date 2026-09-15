Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E8C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dyN5gFqrUdAuk9JlgoLxg97k8gWRxVnEm9nRcIqzsz0=; b=bOT3JnYTvwlAedf6LhOjThnYft
	i7UFQZtVp3HqQI+Mwn0radTXIHyxERpDXshl38DiWTJPJ5QmRCPx8+PpEPalTgzt9+1w907HVu3cW
	NcMsOCtxrECN/81UgDEhW/+M1ZT5DQTYxZM2+ZFY0WDxgDt5YE8BAg2Pns/eiu37HayebwTLBcbAr
	vet4UyEHdAotwuQKB5L3KlYfuKcyexe/tYQ4gUwhtUb4UFEvCjUbB6itKteXNmJ+w8NGgRY/x9NnJ
	RGXtH41yvVPyfMSjXE16l3ALtG9Y4SVtVZEg473V14uuE5Jd8V743dLgcWdCN0uHnu8E6Wo/cbdp2
	iA5g6R5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ol2-00000005fLl-0h0j;
	Tue, 15 Sep 2026 08:43:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Okf-00000005f2d-3gVb;
	Tue, 15 Sep 2026 08:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789461774; x=1820997774;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yr+40TrBkOYI+OGlZk1IPLFD1X+xgHQnRX8pS4vHJhw=;
  b=QFZkYl4pPK+n/DvMIJqJOcn2CiGdj7BFJNohXs+PN3gyYC8EQq+ELSDm
   wWs4oC6gySB88/pGMrd8HlTpZjy+QuPm+suMW3uigPNUx5b8aek5iB0rz
   aEYx0nq+r6Y0o8TK2z0dBQ5Ys1DaBJE94t2BRNeQGj0K+JzMDxu6+zktT
   gUI5se339ikpNmkPJNsChIzIdL/upICi9hxRo1v2XiQ8ot5xkZzrjNHtm
   f1mWzBgwNuaayjvmdwpS2er1Xo0R7OhuWzq0gF6CEGMPS8jp6Be6Yij0Q
   DA4VGessbVPH7S36DWeaYkZWRlL0/14CiSHGe9CSFixt12I+NMszxZ6jS
   A==;
X-CSE-ConnectionGUID: xk4ihytcSBCiQ3wD6juu7g==
X-CSE-MsgGUID: 8bMKMbaVReO/3nLC38Tl+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77379499"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77379499"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:42:53 -0700
X-CSE-ConnectionGUID: 6UvzAamHSXuYckmVewVLWg==
X-CSE-MsgGUID: EAE2XpSQS6yBwcA0JFS2+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271469413"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2026 01:42:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B3CBF99; Tue, 15 Sep 2026 10:42:49 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v1 1/1] CREDITS: Fix the ordering and other issues.
Date: Tue, 15 Sep 2026 10:42:45 +0200
Message-ID: <20260915084248.3460260-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_014253_971527_70663C45 
X-CRM114-Status: GOOD (  15.51  )
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

I assume that the ordering should be done in default (C) locale
as other gives more lines shuffled. Fix the ordering accordingly.
With that being said, clearly make at the top header how it should
be sorted.

Note, I took some empirical assumptions that people usually put
their names in accordance with the First name(s) Last Name(s) split
based on the records around (before and after the move). I hope
I made no or little amount of mistakes. In any case it's just a dozen
of names to update.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 CREDITS | 181 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 91 insertions(+), 90 deletions(-)

diff --git a/CREDITS b/CREDITS
index 8bdfde15e2ac..91494c88d262 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1,6 +1,7 @@
 	This is at least a partial credits-file of people that have
-	contributed to the Linux project.  It is sorted by name and
-	formatted to allow easy grepping and beautification by
+	contributed to the Linux project.  It is sorted by family name,
+	assuming the used locale is default, e.g. by setting LC_ALL=C,
+	and formatted to allow easy grepping and beautification by
 	scripts.  The fields are: name (N), email (E), web-address
 	(W), PGP key ID and fingerprint (P), description (D), and
 	snail-mail address (S).
@@ -344,6 +345,14 @@ D: Hardware spinlock (hwspinlock) subsystem
 D: OMAP hwspinlock driver
 D: OMAP remoteproc driver
 
+N: Muli Ben-Yehuda
+E: mulix@mulix.org
+E: muli@il.ibm.com
+W: http://www.mulix.org
+D: trident OSS sound driver, x86-64 dma-ops and Calgary IOMMU,
+D: KVM and Xen bits and other misc. hackery.
+S: Haifa, Israel
+
 N: Krzysztof Benedyczak
 E: golbi@mat.uni.torun.pl
 W: http://www.mat.uni.torun.pl/~golbi
@@ -362,14 +371,6 @@ S: 2322 37th Ave SW
 S: Seattle, Washington 98126-2010
 S: USA
 
-N: Muli Ben-Yehuda
-E: mulix@mulix.org
-E: muli@il.ibm.com
-W: http://www.mulix.org
-D: trident OSS sound driver, x86-64 dma-ops and Calgary IOMMU,
-D: KVM and Xen bits and other misc. hackery.
-S: Haifa, Israel
-
 N: Johannes Berg
 E: johannes@sipsolutions.net
 W: https://johannes.sipsolutions.net/
@@ -393,14 +394,14 @@ S: 1549 Hiironen Rd.
 S: Brimson, MN  55602
 S: USA
 
-N: Arnd Bergmann
-D: Maintainer of Cell Broadband Engine Architecture
-
 N: Hennus Bergman
 P: 1024/77D50909 76 99 FD 31 91 E1 96 1C  90 BB 22 80 62 F6 BD 63
 D: Author and maintainer of the QIC-02 tape driver
 S: The Netherlands
 
+N: Arnd Bergmann
+D: Maintainer of Cell Broadband Engine Architecture
+
 N: Tomas Berndtsson
 E: tomas@nocrew.org
 W: http://tomas.nocrew.org/
@@ -492,10 +493,6 @@ D: Various fixes (mostly networking)
 S: Montreal, Quebec
 S: Canada
 
-N: Zoltán Böszörményi
-E: zboszor@mail.externet.hu
-D: MTRR emulation with Cyrix style ARR registers, Athlon MTRR support
-
 N: John Boyd
 E: boyd@cis.ohio-state.edu
 D: Co-author of wd7000 SCSI driver
@@ -589,9 +586,6 @@ N: Zach Brown
 E: zab@zabbo.net
 D: maestro pci sound
 
-N: Zefan Li
-D: Contribution to control group stuff
-
 N: David Brownell
 D: Kernel engineer, mentor, and friend.  Maintained USB EHCI and
 D: gadget layers, SPI subsystem, GPIO subsystem, and more than a few
@@ -632,6 +626,10 @@ S: Ravenhorst 58
 S: 2317 AK Leiden
 S: The Netherlands
 
+N: Zoltán Böszörményi
+E: zboszor@mail.externet.hu
+D: MTRR emulation with Cyrix style ARR registers, Athlon MTRR support
+
 N: Michael Callahan
 E: callahan@maths.ox.ac.uk
 D: PPP for Linux
@@ -703,6 +701,10 @@ S: Tamsui town, Taipei county,
 S: Taiwan 251
 S: Republic of China
 
+N: Landen Chao
+E: Landen.Chao@mediatek.com
+D: MT7531 Ethernet switch support
+
 N: Michael Elizabeth Chastain
 E: mec@shout.net
 D: Configure, Menuconfig, xconfig
@@ -715,10 +717,6 @@ D: Media subsystem (V4L/DVB) drivers and core
 D: EDAC drivers and EDAC 3.0 core rework
 S: Brazil
 
-N: Landen Chao
-E: Landen.Chao@mediatek.com
-D: MT7531 Ethernet switch support
-
 N: Raymond Chen
 E: raymondc@microsoft.com
 D: Author of Configure script
@@ -1447,6 +1445,10 @@ D: Made support for modules, ramdisk, generic-serial, etc. optional.
 D: Transformed old user space bdflush into 1st kernel thread - kflushd.
 D: Many other patches, documentation files, mini kernels, utilities, ...
 
+N: Andy Gospodarek
+E: andy@greyhouse.net
+D: Maintenance and contributions to the network interface bonding driver.
+
 N: Masanori GOTO
 E: gotom@debian.or.jp
 D: Workbit NinjaSCSI-32Bi/UDE driver
@@ -1459,10 +1461,6 @@ S: 8124 Constitution Apt. 7
 S: Sterling Heights, Michigan 48313
 S: USA
 
-N: Andy Gospodarek
-E: andy@greyhouse.net
-D: Maintenance and contributions to the network interface bonding driver.
-
 N: Vivek Goyal
 E: vgoyal@redhat.com
 D: KDUMP, KEXEC, and VIRTIO FILE SYSTEM
@@ -1535,6 +1533,14 @@ S: 44 St. Joseph Street, Suite 506
 S: Toronto, Ontario, M4Y 2W4
 S: Canada
 
+N: Nitin Gupta
+E: ngupta@vflare.org
+D: zsmalloc memory allocator and zram block device driver
+
+N: Justin Guyett
+E: jguyett@andrew.cmu.edu
+D: via-rhine net driver hacking
+
 N: Richard Günther
 E: rguenth@tat.physik.uni-tuebingen.de
 W: http://www.tat.physik.uni-tuebingen.de/~rguenth
@@ -1543,14 +1549,6 @@ D: binfmt_misc
 S: 72074 Tübingen
 S: Germany
 
-N: Justin Guyett
-E: jguyett@andrew.cmu.edu
-D: via-rhine net driver hacking
-
-N: Nitin Gupta
-E: ngupta@vflare.org
-D: zsmalloc memory allocator and zram block device driver
-
 N: Danny ter Haar
 E: dth@cistron.nl
 D: /proc/cpuinfo, reboot on panic , kernel pre-patch tester ;)
@@ -1945,16 +1943,6 @@ E: sjenning@redhat.com
 D: Creation and maintenance of zswap
 D: Creation and maintenace of the zbud allocator
 
-N: Jeremy Kerr
-D: Maintainer of SPU File System
-
-N: Michael Kerrisk
-E: mtk.manpages@gmail.com
-W: https://man7.org/
-P: 4096R/3A35CE5E E522 595B 52ED A4E6 BFCC  CB5E 8561 9911 3A35 CE5E
-D: Maintainer of the Linux man-pages project
-D: Linux man pages online, at <https://man7.org/linux/man-pages/>
-
 N: Niels Kristian Bech Jensen
 E: nkbj1970@hotmail.com
 D: Miscellaneous kernel updates and fixes.
@@ -2099,6 +2087,16 @@ S: Keplerstr. 6
 S: 4050 Traun
 S: Austria
 
+N: Jeremy Kerr
+D: Maintainer of SPU File System
+
+N: Michael Kerrisk
+E: mtk.manpages@gmail.com
+W: https://man7.org/
+P: 4096R/3A35CE5E E522 595B 52ED A4E6 BFCC  CB5E 8561 9911 3A35 CE5E
+D: Maintainer of the Linux man-pages project
+D: Linux man pages online, at <https://man7.org/linux/man-pages/>
+
 N: Karl Keyte
 E: karl@koft.com
 D: Disk usage statistics and modifications to line printer driver
@@ -2483,6 +2481,9 @@ D: and much more. He was the maintainer of MD from 2016 to 2018. Shaohua
 D: passed away late 2018, he will be greatly missed.
 W: https://www.spinics.net/lists/raid/msg61993.html
 
+N: Zefan Li
+D: Contribution to control group stuff
+
 N: Stephan Linz
 E: linz@mazet.de
 E: Stephan.Linz@gmx.de
@@ -2542,11 +2543,6 @@ D: misc. kernel hacking and debugging
 S: Cambridge, MA 02139
 S: USA
 
-N: Martin von Löwis
-E: loewis@informatik.hu-berlin.de
-D: script binary format
-D: NTFS driver
-
 N: H.J. Lu
 E: hjl@gnu.ai.mit.edu
 D: GCC + libraries hacker
@@ -2575,6 +2571,11 @@ S: Puistokaari 1 E 18
 S: 00200 Helsinki
 S: Finland
 
+N: Martin von Löwis
+E: loewis@informatik.hu-berlin.de
+D: script binary format
+D: NTFS driver
+
 N: Daniel J. Maas
 E: dmaas@dcine.com
 W: https://www.maasdigital.com
@@ -2625,10 +2626,6 @@ S: PO BOX 220, HFX. CENTRAL
 S: Halifax, Nova Scotia
 S: Canada B3J 3C8
 
-N: Kai Mäkisara
-E: Kai.Makisara@kolumbus.fi
-D: SCSI Tape Driver
-
 N: Asit Mallick
 E: asit.k.mallick@intel.com
 D: Linux/IA-64
@@ -2912,13 +2909,6 @@ S: 12725 SW Millikan Way, Suite 400
 S: Beaverton, Oregon 97005
 S: USA
 
-N: Eberhard Mönkeberg
-E: emoenke@gwdg.de
-D: CDROM driver "sbpcd" (Matsushita/Panasonic/Soundblaster)
-S: Ruhstrathöhe 2 b.
-S: D-37085 Göttingen
-S: Germany
-
 N: Thomas Molina
 E: tmolina@cablespeed.com
 D: bug fixes, documentation, minor hackery
@@ -3005,6 +2995,17 @@ S: Dragonvagen 1 A 13
 S: FIN-00330 Helsingfors
 S: Finland
 
+N: Kai Mäkisara
+E: Kai.Makisara@kolumbus.fi
+D: SCSI Tape Driver
+
+N: Eberhard Mönkeberg
+E: emoenke@gwdg.de
+D: CDROM driver "sbpcd" (Matsushita/Panasonic/Soundblaster)
+S: Ruhstrathöhe 2 b.
+S: D-37085 Göttingen
+S: Germany
+
 N: Matija Nalis
 E: mnalis@jagor.srce.hr
 E: mnalis@voyager.hr
@@ -3200,13 +3201,6 @@ S: RR #5, 497 Pole Line Road
 S: Thunder Bay, Ontario
 S: CANADA P7C 5M9
 
-N: Inaky Perez-Gonzalez
-E: inaky.perez-gonzalez@intel.com
-E: linux-wimax@intel.com
-E: inakypg@yahoo.com
-D: WiMAX stack
-D: Intel Wireless WiMAX Connection 2400 driver
-
 N: Yuri Per
 E: yuri@pts.mipt.ru
 D: Some smbfs fixes
@@ -3214,6 +3208,13 @@ S: Demonstratsii 8-382
 S: Tula 300000
 S: Russia
 
+N: Inaky Perez-Gonzalez
+E: inaky.perez-gonzalez@intel.com
+E: linux-wimax@intel.com
+E: inakypg@yahoo.com
+D: WiMAX stack
+D: Intel Wireless WiMAX Connection 2400 driver
+
 N: Thomas Petazzoni
 E: thomas.petazzoni@bootlin.com
 D: Driver for the Marvell Armada 370/XP network unit.
@@ -3328,14 +3329,14 @@ N: Frederic Potter
 E: fpotter@cirpack.com
 D: Some PCI kernel support
 
-N: Rui Prior
-E: rprior@inescn.pt
-D: ATM device driver for NICStAR based cards
-
 N: Roopa Prabhu
 E: roopa@nvidia.com
 D: Bridge co-maintainer, vxlan and networking contributor
 
+N: Rui Prior
+E: rprior@inescn.pt
+D: ATM device driver for NICStAR based cards
+
 N: Stefan Probst
 E: sp@caldera.de
 D: The Linux Support Team Erlangen, 1993-97
@@ -4023,12 +4024,6 @@ S: C/ Federico Garcia Lorca 1 10-A
 S: Sevilla 41005
 S: Spain
 
-N: Björn Töpel
-E: bjorn@kernel.org
-D: AF_XDP
-S: Gothenburg
-S: Sweden
-
 N: Linus Torvalds
 E: torvalds@linux-foundation.org
 D: Original kernel hacker
@@ -4082,17 +4077,6 @@ D: Linux-Workshop Köln (aka LUG Cologne, Germany), Installfests
 S: Tacitusstr. 6
 S: D-50968 Köln
 
-N: Tsu-Sheng Tsao
-E: tsusheng@scf.usc.edu
-D: IGMP (Internet Group Management Protocol) version 2
-S: 2F 14 ALY 31 LN 166 SEC 1 SHIH-PEI RD
-S: Taipei
-S: Taiwan 112
-S: Republic of China
-S: 24335 Delta Drive
-S: Diamond Bar, California 91765
-S: USA
-
 N: Theodore Ts'o
 E: tytso@mit.edu
 D: Random Linux hacker
@@ -4109,6 +4093,17 @@ S: 1 Amherst Street
 S: Cambridge, Massachusetts 02139
 S: USA
 
+N: Tsu-Sheng Tsao
+E: tsusheng@scf.usc.edu
+D: IGMP (Internet Group Management Protocol) version 2
+S: 2F 14 ALY 31 LN 166 SEC 1 SHIH-PEI RD
+S: Taipei
+S: Taiwan 112
+S: Republic of China
+S: 24335 Delta Drive
+S: Diamond Bar, California 91765
+S: USA
+
 N: Luben Tuikov
 E: Luben Tuikov <ltuikov89@gmail.com>
 D: Maintainer of the DRM GPU Scheduler
@@ -4135,6 +4130,12 @@ S: 44 Campbell Park Crescent
 S: Edinburgh EH13 0HT
 S: United Kingdom
 
+N: Björn Töpel
+E: bjorn@kernel.org
+D: AF_XDP
+S: Gothenburg
+S: Sweden
+
 N: Thomas Uhl
 E: uhl@sun1.rz.fh-heilbronn.de
 D: Application programmer
-- 
2.50.1


