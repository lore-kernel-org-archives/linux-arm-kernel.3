Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3C0D78763
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+7/6r52LSepwbgvWpUC2UsL2p7IX7R9MrCM4nc0XkM=; b=4WZGS0WSKCvZ8c
	fh/jkZXLYYcuNd8HdDPDtkZaLsW3uIq0YUDs+qi3oByJxpO8/CK9ws2Yrg2/mB5LFzPX1llDdvxK1
	mqGHC0F1bvKPCHKb59IAqF2TbDJ4sEgV3JyRVyuvdfB3ELOFqjya8mY8TiB5pRSDic+mzeA0aAQT5
	N7wPd8BtBAmf41k7yGWDsdpp/rM7qsIceLW5ZG6Th08DNQEh8rCweL+/a0x4kxtB7PiToE8G6W3rW
	4K8svd0ikMnGhAglQpNGVL6zvEX2f1mGIsx/5j8Bkxf8UIVB7rj1qSDQkANi4ylUqaZ2W3/tfNJ3h
	OFZqfen6Oejgb3rLXsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZTA-0000000AHQ7-2zXh;
	Fri, 19 Dec 2025 12:20:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZT8-0000000AHOj-2V3H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:20:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAE94FEC;
	Fri, 19 Dec 2025 04:20:16 -0800 (PST)
Received: from [10.57.47.58] (unknown [10.57.47.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9571F3F5CA;
	Fri, 19 Dec 2025 04:20:21 -0800 (PST)
Message-ID: <f43286ef-3dea-4637-a34e-b9b70d2741bf@arm.com>
Date: Fri, 19 Dec 2025 12:20:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: Provide dcache_by_myline_op_nosync helper
To: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com,
 m.szyprowski@samsung.com, will@kernel.org
References: <20251219053658.84978-1-21cnbao@gmail.com>
 <20251219053658.84978-2-21cnbao@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251219053658.84978-2-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_042026_685708_993D2722 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2025-12-19 5:36 am, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> dcache_by_myline_op ensures completion of the data cache operations for a
> region, while dcache_by_myline_op_nosync only issues them without waiting.
> This enables deferred synchronization so completion for multiple regions
> can be handled together later.

This is a super-low-level internal macro with only two users... Frankly I'd
just do as below.

Thanks,
Robin.

----->8-----

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index f0ca7196f6fa..26e983c331c5 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -367,18 +367,17 @@ alternative_endif
  	.endm
  
  /*
- * Macro to perform a data cache maintenance for the interval
- * [start, end) with dcache line size explicitly provided.
+ * Main loop for a data cache maintenance operation. Caller to provide the
+ * dcache line size and take care of relevant synchronisation afterwards.
   *
   * 	op:		operation passed to dc instruction
- * 	domain:		domain used in dsb instruction
   * 	start:          starting virtual address of the region
   * 	end:            end virtual address of the region
   *	linesz:		dcache line size
   * 	fixup:		optional label to branch to on user fault
   * 	Corrupts:       start, end, tmp
   */
-	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
+	.macro raw_dcache_by_line_op op, start, end, linesz, tmp, fixup
  	sub	\tmp, \linesz, #1
  	bic	\start, \start, \tmp
  .Ldcache_op\@:
@@ -402,7 +401,6 @@ alternative_endif
  	add	\start, \start, \linesz
  	cmp	\start, \end
  	b.lo	.Ldcache_op\@
-	dsb	\domain
  
  	_cond_uaccess_extable .Ldcache_op\@, \fixup
  	.endm
@@ -420,7 +418,8 @@ alternative_endif
   */
  	.macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
  	dcache_line_size \tmp1, \tmp2
-	dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
+	raw_dcache_by_line_op \op, \start, \end, \tmp1, \tmp2, \fixup
+	dsb \domain
  	.endm
  
  /*
diff --git a/arch/arm64/kernel/relocate_kernel.S b/arch/arm64/kernel/relocate_kernel.S
index 413f899e4ac6..efdb6884058e 100644
--- a/arch/arm64/kernel/relocate_kernel.S
+++ b/arch/arm64/kernel/relocate_kernel.S
@@ -64,7 +64,8 @@ SYM_CODE_START(arm64_relocate_new_kernel)
  	mov	x19, x13
  	copy_page x13, x12, x1, x2, x3, x4, x5, x6, x7, x8
  	add	x1, x19, #PAGE_SIZE
-	dcache_by_myline_op civac, sy, x19, x1, x15, x20
+	raw_dcache_by_line_op civac, x19, x1, x15, x20
+	dsb	sy
  	b	.Lnext
  .Ltest_indirection:
  	tbz	x16, IND_INDIRECTION_BIT, .Ltest_destination


