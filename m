Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CA9C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCZNkFyXiC+ACs1VkEdYlthMmraN+tbZqQZ2QK7Jv6A=; b=k0auTP/OxL1Kf4Mo+uMkxLVwPL
	K/iCmomsAJhdZr1kqUfSHAvBWQWheI1QlsDVtKPNOWFWeRPrExVb4/OYaUslT1jWq2ZrHaVIAi5l1
	i8qlOMMKK9Eu/bwWvfzeQmOPDyQDzNLfEResTAGoxuyg/V74L6ZTSpVKSz8czJ+IrotpivkDwZa3D
	UZlOPaI60rjSWX04d/J0Zezu5/zfjxixCgnCbMQsHS5IDb4lnhuEHmCGMOo8bkP6vYlhDBfA50t01
	725PuvDnaKZiQfhFv8pwMjE+I4sXCP1XztAfNOs+E5AkZMRqhAwYn5/yOR7FS972Btt4QRPZZsW5I
	TphXnRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSXk-00000004ou5-29yd;
	Tue, 04 Mar 2025 13:42:44 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSW4-00000004oTH-20Jc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:41:06 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250304134053euoutp0274e718a53446102a6ee1026124c91a7e~pnUXD5U4X2441924419euoutp02o
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Mar 2025 13:40:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250304134053euoutp0274e718a53446102a6ee1026124c91a7e~pnUXD5U4X2441924419euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741095653;
	bh=VCZNkFyXiC+ACs1VkEdYlthMmraN+tbZqQZ2QK7Jv6A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qkHBRQob8lENXqQpj9evLPzZGrcLkx3waJ68RRvWQWDjKYGfOFdnTRkPR5YgT0r9t
	 bWaw4uzmqYeRET8UXipD1pBcflHD01/XucESdPYr8E02F8XVFdto8Fa/g5TaQGshf8
	 8YDfG7U6R16iPOjAdU2sgWQuNhyD/JYwo4o99jRE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250304134053eucas1p2fd253d9e8b19a8d56ca6faf034f59e83~pnUWyLufY0059800598eucas1p2L;
	Tue,  4 Mar 2025 13:40:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 6E.25.20821.5E207C76; Tue,  4
	Mar 2025 13:40:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250304134052eucas1p2692abf58857b6b1538d331ee3a319885~pnUWJITBM3099230992eucas1p2z;
	Tue,  4 Mar 2025 13:40:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250304134052eusmtrp18a21621ca1f23615e9e13532e81deb9a~pnUWIe-oj2618026180eusmtrp1x;
	Tue,  4 Mar 2025 13:40:52 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-ed-67c702e5c7bf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 49.41.19654.4E207C76; Tue,  4
	Mar 2025 13:40:52 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250304134050eusmtip103f4c4e81862bd42dd3b73011ededa10~pnUUA9vpM0878108781eusmtip1b;
	Tue,  4 Mar 2025 13:40:50 +0000 (GMT)
Message-ID: <7b5c90cf-00e4-4684-8719-f380badab064@samsung.com>
Date: Tue, 4 Mar 2025 14:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] arm64: realm: Fix DMA address for devices
To: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org
Cc: will@kernel.org, catalin.marinas@arm.com, maz@kernel.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, gshan@redhat.com,
	robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, Jean-Philippe
	Brucker <jean-philippe@linaro.org>, Christoph Hellwig <hch@lst.de>, Tom
	Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <2b6d5287-bdea-4ec3-a07f-986bd3c3b285@arm.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJKsWRmVeSWpSXmKPExsWy7djPc7pPmY6nG0zZLWfx/vxXFov3y3oY
	LV7u2sZksXL1USaLhtUXWC02Pb7GanF51xw2i51zTrJaHPzwhNWi8ch7NouZt28zWhyZso/V
	ouWOqQOvR+ulv2wea+atYfTYtKqTzePOtT1sHpuX1HvsvtnA5vF+31U2j8+b5AI4orhsUlJz
	MstSi/TtErgyjn19wlzwVq5iwYO3jA2MkyW6GDk5JARMJFoP/WHtYuTiEBJYwSix5MkXRpCE
	kMAXRok9kx0gEp8ZJXZ17GCF6Vje8oMRIrGcUWLC4lPsEM5HRol5z9qYQap4BewktvX8AhvF
	IqAi0TT5JCtEXFDi5MwnLCC2qIC8xP1bM9hBbGEBV4kjsx4ygdgiAt4SFw80MoEMZRbYzSRx
	/MoxsAZmAXGJW0/mgxWxCRhKdL3tYuti5ODgFLCWmH4sGqJEXqJ562xmkF4JgfmcEtM+72OC
	ONtF4tm8m1AvCEu8Or6FHcKWkTg9uYcFoqGdUWLB7/tMEM4ERomG57cYIaqsJe6c+wW2jVlA
	U2L9Ln2IsKPEogOrwcISAnwSN94KQhzBJzFp23RmiDCvREebEES1msSs4+vg1h68cIl5AqPS
	LKRgmYXky1lI3pmFsHcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwNR2+t/xTzsY
	5776qHeIkYmD8RCjBAezkgiv6edj6UK8KYmVValF+fFFpTmpxYcYpTlYlMR5F+1vTRcSSE8s
	Sc1OTS1ILYLJMnFwSjUwFbunGhiejbry/NlS6dh3p1tY4v52+HjXbrzFImw99dX02EdcIptt
	pzFoVPawLApc1/RrBi/Xl8X5l14uTAiYcShfy+9xR6I008p7k0N+Ll1T/WZew4YzFnEnNqTc
	XuQSU+jS09pueflyy6lJKl9OJ6gdyvoryx/Ws0rhe+PG5Xyf4yasv3V61u/ZapWHNy+dl+Em
	lZizatWR47mejl8+7J/lOevzlM+3lvq937A7SDq/5VbypM7tu1MqtXbev7/V3zK0rsx27auX
	SR37b5lfCRHaf80o8Lqkyv5/EZc7Fx0R2iH+50B8WriwK5Ps4hCeMn/TjJiNb1wq7SfMbvyS
	XzZr5gZNyUXOqr/bPkyIOKPEUpyRaKjFXFScCADY//6K3AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xu7pPmI6nG9zcbmTx/vxXFov3y3oY
	LV7u2sZksXL1USaLhtUXWC02Pb7GanF51xw2i51zTrJaHPzwhNWi8ch7NouZt28zWhyZso/V
	ouWOqQOvR+ulv2wea+atYfTYtKqTzePOtT1sHpuX1HvsvtnA5vF+31U2j8+b5AI4ovRsivJL
	S1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyjn19wlzwVq5i
	wYO3jA2MkyW6GDk5JARMJJa3/GDsYuTiEBJYyijxYudWdoiEjMTJaQ2sELawxJ9rXWwQRe8Z
	JSYu+MkGkuAVsJPY1vOLEcRmEVCRaJp8khUiLihxcuYTFhBbVEBe4v6tGWBDhQVcJY7MesgE
	YosIeEtcPNDIBDKUWWA3k8T9J9uYIDYcYpT4cukcWDezgLjErSfzwTrYBAwlut6CnMHBwSlg
	LTH9WDREiZlE19YuRghbXqJ562zmCYxCs5DcMQvJpFlIWmYhaVnAyLKKUSS1tDg3PbfYSK84
	Mbe4NC9dLzk/dxMjMJq3Hfu5ZQfjylcf9Q4xMnEwAp3Iwawkwmv6+Vi6EG9KYmVValF+fFFp
	TmrxIUZTYGBMZJYSTc4HppO8knhDMwNTQxMzSwNTSzNjJXFetivn04QE0hNLUrNTUwtSi2D6
	mDg4pRqY8s/4Sssv49Ez2CcbW/piz+bY2g2JzLPOOT24WrqUmZ//aM6fmQ6/M5gP/H286dnE
	Dy5+PfFTWa5WRptsn2NiuomhrO+tobfsk2/6U8+sY6vM1djcv2RaR5qx0cMT/c1Wz35dbrj6
	nOWB26e/q0oY3dN0/sWqnoruW65RdphDdGFbVKftbItdZ59sbV3vxMr78d3S5Kc3SpWmOH1U
	mLktmv2W+MeTQUv/ef76qLkpl/+48OVndo/iXigd/iDn7nu2Vs9pgq9br6zFC03W703LL7vv
	P9KRrHJ7p8gF56tfbpbEbctREJwT+VXcWfTKaUmxrbyN3QvmaXrv+uM86W3dZg+3OwuVdDhE
	Z4WXit/fqcRSnJFoqMVcVJwIAOptTr1vAwAA
X-CMS-MailID: 20250304134052eucas1p2692abf58857b6b1538d331ee3a319885
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250303113525eucas1p1099e087e2c11b9021603a6f13f8135c4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303113525eucas1p1099e087e2c11b9021603a6f13f8135c4
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
	<CGME20250303113525eucas1p1099e087e2c11b9021603a6f13f8135c4@eucas1p1.samsung.com>
	<2b6d5287-bdea-4ec3-a07f-986bd3c3b285@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_054102_703191_66CF947B 
X-CRM114-Status: GOOD (  29.13  )
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

Hi,

On 03.03.2025 12:35, Suzuki K Poulose wrote:
> On 27/02/2025 14:41, Suzuki K Poulose wrote:
>> Linux can be run as a Confidential Guest in Arm CCA from Linux v6.13. 
>> The address
>> space (GPA or IPA) of a Realm VM is split into two halves, with 
>> private bottom
>> half and shared top half. In Linux we treat the "top" bit of the IPA 
>> space as
>> an attribute, to indicate whether it is shared or not (MSB == 1 
>> implies shared).
>> Stage2 (GPA to PA) translations used by the CPU accesses, cover the 
>> full IPA space,
>> and are managed by RMM. The "top" bit as attribute is only a software 
>> construct.
>>
>> At present any device passed through to a Realm is treated as 
>> untrusted and the
>> Realm uses bounce buffering for any DMA, using the "decrypted" 
>> (shared) DMA
>> buffers (i.e., IPA with top bit set). In Linux, we only send the 
>> "DMA" address
>> masking the "top" bit. In Arm CCA, SMMU for untrusted devices are 
>> managed by the
>> non-secure Host and thus it can be confusing for the host/device when 
>> an unmasked
>> address is provided. Given there could be other hypervisors than 
>> Linux/KVM
>> running Arm CCA guests, the Realm Guest must adhere to a single 
>> convention for
>> the DMA address. This gets further complicated when we add support 
>> for trusted
>> devices, which can DMA into the full Realm memory space, once 
>> accepted. Thus,
>> a DMA masked address (with "top" bit lost) will prevent a trusted 
>> device from
>> accessing a shared buffer.
>>
>> To resolve this Arm has decided to standardise the DMA address used 
>> by the Realm
>> to include the full IPA address bits (including the "top" bit, which 
>> Linux uses
>> as an attribute). This implies, any DMA to a shared buffer must have 
>> the top bit
>> of the IPA space set.
>>
>> There is already a provision to do this in phys_to_dma* and 
>> dma_to_phys(), but
>> that is specific to AMD SME and is quite the opposite of what we need 
>> for Arm CCA.
>> i.e., For Arm CCA we need to set the bit for "decrypted" DMA and 
>> clear the bit
>> for "encrypted".
>>
>> This series converts the existing __sme_* helpers to a bit more 
>> generalised versions :
>> dma_addr_decrypted() and dma_encrypted(). Also, while converting a 
>> DMA address back
>> to CPU physical address requires clearing off any 
>> "encryption/decryption" bits.
>> I have named this "dma_addr_canonical()". (The other options are :
>>    * dma_addr_clear_encryption - Well, not just for encryption, but 
>> we clear decryption
>>      too, so not ideal.
>>    * dma_addr_normal
>>    * dma_addr_clear
>>    * dma_addr_default
>>
>> This also implies that the VMMs must take care to :
>>
>>   1. Create the S2-SMMU mappings for VFIO at the "unprotected" alias.
>>   2. Always mask the "top" bit off any IPA it receives from the Realm 
>> for DMA.
>>      KVM already does that today and no changes are required.
>>
>> A kvmtool branch with the changes above is available here [1]. There 
>> are two
>> patches [2] & [3], that are really required on top of the Arm CCA 
>> support.
>>
>> Ideally it would be good to get this backported to v6.13 stable 
>> kernel releases
>> to make sure that they are compliant with this change.
>>
>
> Please could you take a look at this series and let us know your
> thoughts ? If you are happy with the changes, are you happy to pull
> this through the DMA MAP tree ? The relevant bits have been reviewed/
> acked by people (arm64 and AMD bits).

The changes look fine. However I won't be able to setup new dma-mapping 
git tree this week because I got really sick has to stay in bed. :/ If 
You don't want such delay, please merge it via ARM64 tree. Here is my:

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


