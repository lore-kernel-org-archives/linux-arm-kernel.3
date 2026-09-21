Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB73C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUCvSD545AGqyJgwYc/GicxI6hMF/t9YAHwv4jFcQak=; b=vJyNlSgIgiRqd/OY9bywsQxbO1
	4YUTsb0JSWw51/jmerYmzl3eb+Ep0OxYwD5gkTknD8nKwaPHlWPiMoQZPoYdbuKmNU9in9ywI8C21
	tFOPFglYrKreRiBWRLJtBP10ak9ivGERblmzM/UKrgPboRx68lbdcFxAtMYTjMN7ycHmT/8hRy0af
	hRFVdNIFpjHHqZjWA7o5qmkhlSzV2SGrE5LDuhdmxmaaszFU5LN7IMRuNVq76XVdYDP6bLI5z3PYD
	nSLNcWWWS+aH6gVfUSnvt5HfoSojwgX291+Ursk4f4dERJgEHK40iTsozYk8TL3emFR3VK/dTb3vl
	cCH6ctYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XeV-00000001334-2w09;
	Mon, 21 Sep 2026 06:37:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XeU-0000000131b-44Tt;
	Mon, 21 Sep 2026 06:37:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8168F432D2;
	Mon, 21 Sep 2026 06:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D478A1F00899;
	Mon, 21 Sep 2026 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789972642;
	bh=fUCvSD545AGqyJgwYc/GicxI6hMF/t9YAHwv4jFcQak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ItCAWN/bZKXBVisaCNeR/Zme4Bhaf0Rs8NXllfTFEHHwczMFALk0glxv5UtwQ2E1M
	 A8qyeQOutrpDF0GB73be/Dhp7UyA76pr93qyXCp/SBgZlJv/us4v9DB8544n2XS0LO
	 ZmWn9ULvzsnJeFZSk1zQIKMZHULsZm5+e33H56EKAvDfqjypjXEl/2I5CUNPqTuhyp
	 HsqgaPygQtGAqNarWWmiPfWWkx7rgJDdc80k6kWbQ6xkbHO9IRuLGCTv9wtfUK4+vT
	 TzOFDt8Xlr8T/WTX3YWtL/0YYcr0Rv2B1mevPDJnI55O5NaYEPvy5tlnh6c02ULEjb
	 PLdVf4MFo0IFg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v5 2/6] dma: swiotlb: Track whether the pool size was explicitly set
Date: Mon, 21 Sep 2026 12:06:24 +0530
Message-ID: <20260921063628.362078-3-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921063628.362078-1-aneesh.kumar@kernel.org>
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

swiotlb_adjust_size() must not override a pool size supplied through the
swiotlb= command-line parameter.

Currently, it determines whether a size was supplied by comparing
default_nslabs with IO_TLB_DEFAULT_SIZE. This fails when the user
explicitly requests the compiled-in default size, allowing the request
to be overwritten by automatic pool sizing.

Record whether swiotlb= supplied a numeric size and add
swiotlb_default_size_changed() to query that state.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/swiotlb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index aa19e81ae544..8f86deb25be2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -107,6 +107,7 @@ static struct io_tlb_mem io_tlb_default_mem;
 
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 static unsigned long default_nareas;
+static bool swiotlb_size_set __initdata;
 
 /**
  * struct io_tlb_area - IO TLB memory area descriptor
@@ -269,6 +270,7 @@ setup_io_tlb_npages(char *str)
 		/* avoid tail segment of size < IO_TLB_SEGSIZE */
 		default_nslabs =
 			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
+		swiotlb_size_set = true;
 	}
 	if (*str == ',')
 		++str;
@@ -304,6 +306,11 @@ unsigned long swiotlb_size_or_default(void)
 	return default_nslabs << IO_TLB_SHIFT;
 }
 
+static bool __init swiotlb_default_size_changed(void)
+{
+	return swiotlb_size_set;
+}
+
 void __init swiotlb_adjust_size(unsigned long size)
 {
 	/*
@@ -311,7 +318,7 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	if (default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT)
+	if (swiotlb_default_size_changed())
 		return;
 
 	default_nslabs = swiotlb_aligned_nslabs(size);
-- 
2.43.0


