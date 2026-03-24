Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F33F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+Jw00CvTMU1v2XHS+Iv9vE7g3+9u1r52N76fFD2Nsw=; b=PHf1j8rojmsROmEAayMcnoHv8x
	oM2whUyxDfQaSJmO+Je9/kyRJDi0UL/VMhjKfiIp+eN4qDq0//Vw7LH9pbeX0NkY71nAgUQwof5lm
	6tc6GCWH1xmMd2vvT1PWpSaUJF8x5cz7GIic7CCejvuFdGHN6QJDr7MhVEudTSPOXyH8ApiTfGcfW
	2DIzzNmd2ysEVql+/QOuDhWP8VNwqp2HSxWK9HkTqoqWrAYb5mQOxkIkhJ/Vb8hRyv/9R6Ns4nJCu
	XWd01d9UmW19SOa9CsMmKqrwGcrpCkDXi+TlwkSlacOaEQ1MF1eWfuyvhcuodA+eyyLagfO1N+7aL
	0E1+T6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w556v-00000001x7H-1K9J;
	Tue, 24 Mar 2026 17:00:09 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w556s-00000001x5v-2YMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371606; x=1805907606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9hvV8PDAdyGkHU10me7VyjfjKt6p0yD22QH58KrfakU=;
  b=fmCHeR7yWJTVVFGnPbxAtLAb9qGhqfoqudIOxa0ZBE000Iui4qNUjNPC
   2bni0kU9oKgrEdGcYSNu8ZqYkAuFojH8+6ThVauiY+IdIM4cncdDZ2NZe
   C609AjRW+z2M6N8nM74fBWDQZR6WsKcGblOGp+fGVAPdWBSeYhxNW2ag/
   4JKNJete4F+Bc+Q4vACRbdN4o19ymZcQAFtfc8Zky2QScyMJnTDVkUYzo
   mZ37FpBTdxXWzPDqhrnVorzSjW2xQGC29WpBoemq4BTzPNzqX4pX8SboC
   pIbmdOHljUG3fEZxb79kh+6MF0z5aSq4SM0BnrfNsVN6jQNgfNjABKvkI
   Q==;
X-CSE-ConnectionGUID: PPOi/HI+SZe+4+sie1hZvA==
X-CSE-MsgGUID: d36hzcM6Qwi3Wg4yOXh6AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75281387"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75281387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:06 -0700
X-CSE-ConnectionGUID: ZabKv/GtRfqHh4rMbY+IrQ==
X-CSE-MsgGUID: KjVhSRgDSkWdd+eayrpYDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219540084"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:57 -0700
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
Subject: [PATCH 06/10] MIPS: PCI: Remove unnecessary second application of align
Date: Tue, 24 Mar 2026 18:56:29 +0200
Message-Id: <20260324165633.4583-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100006_693496_6A4E7743 
X-CRM114-Status: GOOD (  10.45  )
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

Aligning res->start by align inside pcibios_align_resource() is
unnecessary because caller of pcibios_align_resource() is
__find_resource_space() that aligns res->start with align before
calling pcibios_align_resource().

Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
result in changing start either because 0x300 bits would have not
survived the earlier alignment if align was large enough to have an
impact.

Thus, remove the duplicated aligning from pcibios_align_resource().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/mips/pci/pci-generic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/pci/pci-generic.c b/arch/mips/pci/pci-generic.c
index f4957c26efc7..aaa1d6de8bef 100644
--- a/arch/mips/pci/pci-generic.c
+++ b/arch/mips/pci/pci-generic.c
@@ -32,8 +32,6 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 	if (res->flags & IORESOURCE_IO && start & 0x300)
 		start = (start + 0x3ff) & ~0x3ff;
 
-	start = (start + align - 1) & ~(align - 1);
-
 	host_bridge = pci_find_host_bridge(dev->bus);
 
 	if (host_bridge->align_resource)
-- 
2.39.5


