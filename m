Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E153CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkHrMEWTroi5XQ5UGglMftMck4qCYCQpPf4gqWIwhrE=; b=QI84lPstLINAfJDeIda/ijFDab
	2fSFIUHsBI140d5fzPpToe0xnCWDGZkAHspW6g+nP088KVrR2024XVTswHgFCUStXjLubXh1kom5A
	gzKn15ZxzuUPtlxKZ7mNsybxMQTAR3+T+foLbQdLPXicd6hyxSMeZJLYzA3wMF4hYPo5fktRKfOPW
	GlOM9TPSg3MlE3IQBwDf4p0jx4aTtBZfp3T047+622GJEuLxXJOTCOVouEcajOHpgPZS+XXiF+2x9
	IL+ksIklcHJWM4DSDn2OwH0vhGRqYHRKwVjV406a1+5tQx6It6woGNOldWrOJtuqxj79qpqGTqPQS
	zJD9OQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzY2w-00000002VGy-2p41;
	Fri, 19 Sep 2025 10:08:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzY2u-00000002VGX-09VW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:08:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20E6D1692;
	Fri, 19 Sep 2025 03:08:43 -0700 (PDT)
Received: from [10.57.95.38] (unknown [10.57.95.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D058D3F673;
	Fri, 19 Sep 2025 03:08:48 -0700 (PDT)
Message-ID: <fc43aa07-d4ad-47d5-8381-61d4a9b8c467@arm.com>
Date: Fri, 19 Sep 2025 11:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
 ardb@kernel.org, dev.jain@arm.com, scott@os.amperecomputing.com,
 cl@gentwo.org, Yang Shi <yang@os.amperecomputing.com>
Cc: kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <175822779944.710258.10028837182267037801.b4-ty@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <175822779944.710258.10028837182267037801.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_030852_120062_7F2ABBF9 
X-CRM114-Status: GOOD (  15.33  )
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

On 18/09/2025 22:10, Will Deacon wrote:
> On Wed, 17 Sep 2025 12:02:06 -0700, Yang Shi wrote:
>> On systems with BBML2_NOABORT support, it causes the linear map to be mapped
>> with large blocks, even when rodata=full, and leads to some nice performance
>> improvements.
>>
>> Ryan tested v7 on an AmpereOne system (a VM with 12G RAM) in all 3 possible
>> modes by hacking the BBML2 feature detection code:
>>
>> [...]
> 
> Applied patches 1 and 3 to arm64 (for-next/mm), thanks!
> 
> [1/5] arm64: Enable permission change on arm64 kernel block mappings
>       https://git.kernel.org/arm64/c/a660194dd101
> [3/5] arm64: mm: support large block mapping when rodata=full
>       https://git.kernel.org/arm64/c/a166563e7ec3
> 
> I also picked up the BBML allow-list addition (second patch) on
> for-next/cpufeature.
> 
> The fourth patch ("arm64: mm: split linear mapping if BBML2 unsupported
> on secondary CPUs") has some really horrible conflicts. These are partly
> due to some of the type cleanups on for-next/mm but I think mainly due
> to Kevin's kpti rework that landed after -rc1.

Thanks Will, although I'm nervous that without this patch, some platforms might
not boot; Wikipedia tells me that there are some Google, Mediatek and Qualcomm
SoCs that pair X4 CPUs (which is on the BBML2_NOABORT allow list) with A720
and/or A520 (which are not). See previous mail at [1].

I'd be happy to rebase it if you can let me know the prefered base SHA/tree?

[1]
https://lore.kernel.org/linux-arm-kernel/11f84d00-8c76-402d-bbad-014a3542992f@arm.com/

Thanks,
Ryan


> 
> So I think the best bet might be to leave that one for next time, if
> that's ok?
> 
> Cheers,


