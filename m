Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8E7D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 06:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iCeFtQI6/jz69V2vHeaEWTq9qBETv8De4pXu1XBcyc=; b=vpKqPMebozvngTPsMWuJPPDk7h
	Ke+i0XAGBawmRpzxfQlOUJ3Oq+UW+c4dGlFAh0G8IOcxCHi8Uz8CyMxE3N0njabSVSe7INc9qD0fq
	NzxCuW6H3RLygEmPzjhbCkVQq3Rf5vQLapVtdkTon3yb2M3SQZk/GGXO4bEfHz9n1EdMnjmxg3IGz
	0jPGG//Dg+GBjlwBgorPJD6EK5GMHFh1AvbiYojSJk+KkfCDjfeclI6BpUaqif6cjULjeWDnEf5lq
	fg62YFh87IRgrJEnonypNEce99S5yWitNUpcFmW5hWU827kLcrJgjUYDlQnE8jHMpB3yACRvMa9+B
	cUhZgXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRQB-00000004vsv-0Cye;
	Wed, 21 Jan 2026 06:10:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRQ8-00000004vsb-2DpE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 06:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50665406C0;
	Wed, 21 Jan 2026 06:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D354EC116D0;
	Wed, 21 Jan 2026 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768975823;
	bh=hRU+kmY0lWlctWiCRClg6Hs8MNl31uLxyjX7+5kTLrA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nIDceXpffZioRMvWOGD+DBk84MsM/xjMwXvg4fmOl9T5bHFRJmzWQGdiesZFElCnT
	 Z4B+A7+NxlLQq/fR/ICBx9Vjj88v2ecbxdBNlymDPvamf9dhul9UtCwGikhTQjVhxK
	 7pGI5PtUUHF1EhT0Bu06y+2hu2MV8oTIjhC1QacR9m2NyJkVGUqWrEs42kp2YuSim+
	 9AROtNVvyHBvZmJC5Gx/5V3YDamI6ZqFmhLfmlesfDRGT6iFe4iMOHfYqmUZ534LyF
	 lirUpSS36dO1RyKYU48Inwco52qX0CA75TzbVjt4Ku2QvKy0B/M5aT9ps+KB799fXT
	 sANyxweSQpirQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, suzuki.poulose@arm.com,
	steven.price@arm.com
Subject: Re: [PATCH] arm64: swiotlb: =?utf-8?Q?Don=E2=80=99t?= shrink
 default buffer when bounce
 is forced
In-Reply-To: <028734f6-2a72-4509-81e0-7e69bda20253@arm.com>
References: <20260120070102.182977-1-aneesh.kumar@kernel.org>
 <028734f6-2a72-4509-81e0-7e69bda20253@arm.com>
Date: Wed, 21 Jan 2026 11:40:12 +0530
Message-ID: <yq5ah5sfjy2j.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_221024_589437_13B62E4C 
X-CRM114-Status: GOOD (  17.93  )
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

Robin Murphy <robin.murphy@arm.com> writes:

> On 2026-01-20 7:01 am, Aneesh Kumar K.V (Arm) wrote:
>> arm64 reduces the default swiotlb size (for unaligned kmalloc()
>> bouncing) when it detects that no swiotlb bouncing is needed.
>> 
>> If swiotlb bouncing is explicitly forced via the command line
>> (swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
>> query the forced-bounce state and use it to skip the resize when
>> bouncing is forced.
>
> This doesn't appear to be an arm64-specific concern though... Since 
> swiotlb_adjust_size() already prevents resizing if the user requests a 
> specific size on the command line, it seems logical enough to also not 
> reduce the size (but I guess still allow it to be enlarged) there if 
> force is requested.
>

Something like the below? I am wondering whether we are doing more than
what the function name suggests. Not allowing the size to be adjusted
when the kernel parameter specifies a swiotlb size seems fine. However,
I am not sure whether adding the force_bounce check is a good idea. I
only found RISC-V doing a similar size adjustment to arm64. Maybe we can
fix both architectures?

@@ -211,6 +211,8 @@ unsigned long swiotlb_size_or_default(void)
 
 void __init swiotlb_adjust_size(unsigned long size)
 {
+	unsigned long nslabs;
+
 	/*
 	 * If swiotlb parameter has not been specified, give a chance to
 	 * architectures such as those supporting memory encryption to
@@ -220,7 +222,13 @@ void __init swiotlb_adjust_size(unsigned long size)
 		return;
 
 	size = ALIGN(size, IO_TLB_SIZE);
-	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	/*
+	 * Don't allow to reduce size if we are forcing swiotlb bounce.
+	 */
+	if (swiotlb_force_bounce && nslabs < default_nslabs)
+		return;
+	default_nslabs = nslabs;
 	if (round_up_default_nslabs())
 		size = default_nslabs << IO_TLB_SHIFT;
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);


