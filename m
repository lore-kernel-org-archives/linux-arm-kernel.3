Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C1EF54ADB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0mN/BEfaeUwfXAKratLMt+/jZUNWSL3bKgrTzmMNj0=; b=BngH8r1FTjAEnlHSMozwBm0AWj
	nGU+yWQCLJiu7/O7gmQb9dveBzPQhE9apyySZrfftU4jEOJMLCSyZPDoqOiVr650MWaMLkC+XIeCa
	f/3JbT3N19w9/KSvW5E4WnedDWgttl871HLWalqXOecykhXlNni5FRVCiUpHS9tIJhH1z8lXO4x8l
	MBcCWHkenv/5Nrs2+iihxMd7GnEjHI1iySFcrV6XIsaCKXPrXrt7XAW61wZ5SJ0LSJwYwC/mNhjjo
	uxGGKK8Yva83H3N5laEHs9AJxYUFyr3kDsVs7FxFU0HOds9Dl5NkIYkJZZgzjdDHtBvNnuhodjVy+
	LU5dw2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w557p-00000001xVn-28HY;
	Tue, 24 Mar 2026 17:01:05 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w557k-00000001xSk-2PtE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371661; x=1805907661;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9odwDAEObJO7qnios8NXzgvO+dTMZAcsFe/K0R+E/MA=;
  b=fdPQijolZkoXol/SJjY9hE/6J/JsbNRtcOlCVyTorpTSwk4ilWQf/TaX
   4rD2fvqdo6LKiW1t0Ty2ARTtwmKUFFD1y9oK+dgYErHx0/omftpHJ2FBa
   yeAnTfR/4k0PCTtuiQyrSyECYD1njslGbXRuD+Z1mi8o52J5MQFiGbFUt
   +oGJGI9yreoxBbMHs2sZJQX3IS4lBsPpht/SuXgnj4otysdvjWy+9wJ/y
   rOKglWHDPFh0d4OQy7klkNmLT+VjCeNuP1YBnsCGGuZo8dSKDzf7HXgR4
   yhhKnAi21Wt8b6VceHySmB9X0jsoCI91T4JqBQQS/cNuomStObv3HvCld
   Q==;
X-CSE-ConnectionGUID: AwiF8aTQTeKYDUyCsabEcg==
X-CSE-MsgGUID: Ird/9ytgQDGVzUDW7LdmNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78991841"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78991841"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:01:00 -0700
X-CSE-ConnectionGUID: hHMisBSDR/+i1mWAm9Fh8g==
X-CSE-MsgGUID: e4f6sgI4SzaAnXpv3WumJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254912161"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:51 -0700
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
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] PCI: Fix alignment calculation for resource size larger than align
Date: Tue, 24 Mar 2026 18:56:33 +0200
Message-Id: <20260324165633.4583-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100100_685056_D6E04E60 
X-CRM114-Status: GOOD (  13.57  )
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

The commit bc75c8e50711 ("PCI: Rewrite bridge window head alignment
function") did not use if (r_size <= align) check from pbus_size_mem()
for the new head alignment bookkeeping structure (aligns2[]). In some
configurations, this can result in producing a gap into the bridge
window which the resource larger than its alignment cannot fill.

The old alignment calculation algorithm was removed by the subsequent
commit 3958bf16e2fe ("PCI: Stop over-estimating bridge window size")
which renamed the aligns2[] array leaving only aligns[] array.

Add the if (r_size <= align) check back to avoid this problem.

Fixes: bc75c8e50711 ("PCI: Rewrite bridge window head alignment function")
Closes: https://lore.kernel.org/all/b05a6f14-979d-42c9-924c-d8408cb12ae7@roeck-us.net/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index edc0d682dcad..e5af8799c36f 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1333,7 +1333,14 @@ static void pbus_size_mem(struct pci_bus *bus, struct resource *b_res,
 			r_size = resource_size(r);
 			size += max(r_size, align);
 
-			aligns[order] += align;
+			/*
+			 * If resource's size is larger than its alignment,
+			 * some configurations result in an unwanted gap in
+			 * the head space that the larger resource cannot
+			 * fill.
+			 */
+			if (r_size <= align)
+				aligns[order] += align;
 			if (order > max_order)
 				max_order = order;
 		}
-- 
2.39.5


