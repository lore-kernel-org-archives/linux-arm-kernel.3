Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C99F54ADC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJDNoTaGftVFib8voNKcZV7M81zwjnGP3NBshahnzuU=; b=Ia0cUegKORgFaZlyndKFfUKm1T
	Q83o0G1jOEFBB9M0lkiSAVgqL1RTO4701XMj8OMBmxZTVIac6/llCcaUsV2JV5DVjsp5KprMNmf5l
	UjYYoNXQGTgTxn/cgkL2EjmjPSbUvlx6OjCTqnEmXM2EnE0VdVTpjHDTXp3qzh5DcU3AmU0tcrkDE
	oQag0HzLeMJKJKOOb0zG4D/bTVuza31BxOdVyz7S8rcT6X0X37LGGOXUSXjrh9WZwT2Sp73Zmtxrf
	/tJ0MBxQxX/+FiQ81F5vJ5tXF2D3QXQeqTeC4JQD6cbJnxDqyNS8mtapHnqAudKDBj1nPehC0G0Lr
	Wvw/XgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w556S-00000001wts-0mxX;
	Tue, 24 Mar 2026 16:59:40 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w556Q-00000001wt5-1KEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371579; x=1805907579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQi+TnP6KS0Xel2L1NUm1zOxuJkTQw+HXZFhNST/QpA=;
  b=ULyMssnyIxA+WgYz4/xyz832bS6VnKyxuvu5Ok0+dNNVjR2RfyGrtrtU
   ed6PE3wEPeca+UVwF7mQuddaHj2rgoKRPOAoiytSqNDW5u/ES+fA4A3fk
   ZQl9hxSFfCmptk0j2A8Emh4mVsfgURFzUBmHxahq4pi5lztUmRUxWddDD
   6iPhr4XVrpgAF82B7FSgR+0+OktAelLlig+1XpL6sWeZaUNwgUCh/YBME
   FYp4or+BoTRVWJClIjsI0b5mAtZ3S8vbtFkwdgppaVwS3nGAb6Adf8rfN
   yEfICABoO85WKD0JDO88L5dWvF2nESWlSMQlLr5dv3WfJ4jiAKYrOJ5li
   w==;
X-CSE-ConnectionGUID: CMCQY79QREWeiTxxXu68UA==
X-CSE-MsgGUID: +wbXWLOgSp6BiA0FVgmBRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79252741"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79252741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:34 -0700
X-CSE-ConnectionGUID: bklkz5swSMGrpU/gEbGm9Q==
X-CSE-MsgGUID: DjRzhFV5Q9qVW8oMHuNG1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228447839"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:22 -0700
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
Subject: [PATCH 04/10] ARM/PCI: Remove unnecessary second application of align
Date: Tue, 24 Mar 2026 18:56:27 +0200
Message-Id: <20260324165633.4583-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095938_420225_3F6CF926 
X-CRM114-Status: GOOD (  10.47  )
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
 arch/arm/kernel/bios32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index 5b9b4fcd0e54..cedb83a85dd9 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -571,8 +571,6 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 	if (res->flags & IORESOURCE_IO && start & 0x300)
 		start = (start + 0x3ff) & ~0x3ff;
 
-	start = (start + align - 1) & ~(align - 1);
-
 	host_bridge = pci_find_host_bridge(dev->bus);
 
 	if (host_bridge->align_resource)
-- 
2.39.5


