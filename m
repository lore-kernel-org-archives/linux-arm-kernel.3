Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F012BFB5EBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 05:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15MJ9GR6Tpb7z90IZkVdAx01wuWjxeEGIqgBfYqZqd0=; b=JRexkpFgvtg/9LGcYveUzwEB1S
	G23jRRBZU8Q4rCDz7/SOW7P/SibzVFG5CEzsvJe2ZOMnVAB0SNxR4epqZWgckI1kZATYD8b823MEo
	+Wz2v5ITagjiMrOZ/GuooBxicbRMVEMTrO5CRLebQVqKqpfB+vFkGNZtojc9X689ABNZo6uiAWI5K
	M8rgo/lr1fYTxmyZZxcU89NaB9jmN9RceXeNz2flokeqHhWTh6zvYCT8oKt0LsFy10Vk8OEKgboGC
	sOJt7S/N0CcpLIogQ/rPhsZR4E8F4242FVmk8qExPheufMPbFqkDQtFscfBAvdnzjhTWK+kzqzqoQ
	uXWL/ULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MzZ-00000005RO7-3Aw7;
	Tue, 17 Mar 2026 05:29:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MzZ-00000005RO0-0Zha
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 05:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8389E60018;
	Tue, 17 Mar 2026 05:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1D9C4CEF7;
	Tue, 17 Mar 2026 05:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773725360;
	bh=Nf719nA30D8prEus9dGdhnEqiqbPlb11hG6PJJdTEfQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mBBRvNcSSEIrX5WbrxOAyAXPcRP6Myb9HARIBq1YwUn/ZBJzCpXxb/JFclPm2DtvD
	 +frAc7ngcpo6BtUrBehO2jzIOcam88SAvL3OW+8YuBd3Pt75keqCoLZ29dx/sbHJ5P
	 u8NZ9Vb5hatnC5a/MmeRayQHJ0M/8AHDCrDAnZ2MiDmso1BTZGc99qckvJ+Cm2V3WY
	 T3T3iiSPxZ4gQrSImHF2Ah71Nv+bg68o5TgofybaUz8y1sVDBV36TZ1emJkm7pAQLF
	 WzcB/+PEBgoJDFTzXv575s9QqLpbe9+9JmQxt1bwVsJuLDKbRN2bxzZuiyLmwTplt7
	 anN29qS96ghEA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, suzuki.poulose@arm.com,
	steven.price@arm.com
Subject: Re: [PATCH] arm64: swiotlb: =?utf-8?Q?Don=E2=80=99t?= shrink
 default buffer when bounce
 is forced
In-Reply-To: <cd026591-c278-4f89-9d21-1a2125a85a44@samsung.com>
References: <20260120070102.182977-1-aneesh.kumar@kernel.org>
 <aYOVf066Fdr9L-nw@arm.com>
 <CGME20260206061145eucas1p1917446df9763565b2b5ef829c5350a69@eucas1p1.samsung.com>
 <yq5a8qd6iep6.fsf@kernel.org>
 <cd026591-c278-4f89-9d21-1a2125a85a44@samsung.com>
Date: Tue, 17 Mar 2026 10:59:13 +0530
Message-ID: <yq5av7ev6n2u.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> On 06.02.2026 07:11, Aneesh Kumar K.V wrote:
>> Catalin Marinas <catalin.marinas@arm.com> writes:
>>> On Tue, Jan 20, 2026 at 12:31:02PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>>> arm64 reduces the default swiotlb size (for unaligned kmalloc()
>>>> bouncing) when it detects that no swiotlb bouncing is needed.
>>>>
>>>> If swiotlb bouncing is explicitly forced via the command line
>>>> (swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
>>>> query the forced-bounce state and use it to skip the resize when
>>>> bouncing is forced.
>>> I think the logic you proposed in reply to Robin might work better but
>>> have you actually hit a problem that triggered this patch? Do people
>>> passing swiotlb=force expect a specific size for the buffer?
>>>
>> This issue was observed while implementing swiotlb for a trusted device.
>> I was testing the protected swiotlb space using the swiotlb=force
>> option, which causes the device to use swiotlb even in protected mode.
>> As per Robin, an end user using the swiotlb=force option will also
>> specify a custom swiotlb size
>
> Does the above mean that it works fine when user provides both 
> swiotlb=force and custom swiotlb size, so no changes in the code are 
> actually needed?
>

swiotlb_adjust_size() checks whether the default_nslabs value has
changed and avoids updating the SWIOTLB size based on different
subsystem logic.

void __init swiotlb_adjust_size(unsigned long size)
{
	/*
	 * If swiotlb parameter has not been specified, give a chance to
	 * architectures such as those supporting memory encryption to
	 * adjust/expand SWIOTLB size for their use.
	 */
	if (default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT)
		return;


To handle swiotlb_force alone we can do

modified   kernel/dma/swiotlb.c
@@ -209,6 +209,8 @@ unsigned long swiotlb_size_or_default(void)
 
 void __init swiotlb_adjust_size(unsigned long size)
 {
+	unsigned long nslabs;
+
 	/*
 	 * If swiotlb parameter has not been specified, give a chance to
 	 * architectures such as those supporting memory encryption to
@@ -218,7 +220,13 @@ void __init swiotlb_adjust_size(unsigned long size)
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


