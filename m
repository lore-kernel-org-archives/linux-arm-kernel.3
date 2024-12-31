Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB55CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg0xzBmwQrArrOItTGxpNn1gMbaQ2Jt8yThpebw6PVE=; b=AMsDW/XtvguEPrT2idulmyPTWU
	+XEhX9HAJPtjXr0cu0oEk8ykVrucJlSH0OfNT6qSbUBfpoTOX4u2lmKjgMHmxlYY289N9KCUFABxR
	gcNRrVD8g9nwXtLrBBcOKKG+JP6iCjlNsV+E2U6W2nkdMl9Af91IUyNWRyouB+TLeHfr9ckS5+8VN
	fj1r2MrIXz/bXXav/y1YxntJbGkD2TXARsFvhzcCiZuFVliU8a29/B6/3gvRLc7BX4QVToIhlrP36
	nEJqLKpT/8ADDhQVuYqnkvdfAycNPpdVqM1gNwdFU0tqc9SHnGWEsCUv1syS2Utm8zvbv+CmqDIny
	JyIwZ2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWFQ-00000006gJ4-0AZR;
	Tue, 31 Dec 2024 07:01:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSWED-00000006gBj-33hZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 06:59:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 529D81424;
	Mon, 30 Dec 2024 23:00:10 -0800 (PST)
Received: from [10.163.53.15] (unknown [10.163.53.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 071B23F6A8;
	Mon, 30 Dec 2024 22:59:36 -0800 (PST)
Message-ID: <ff65fb4e-4a7c-443b-b855-e5c3cd22889f@arm.com>
Date: Tue, 31 Dec 2024 12:29:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
 <Z2W5Bs0bZANI6NKv@arm.com> <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
 <8685ca94-1382-45c0-a3c3-4b5ccf244057@quicinc.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <8685ca94-1382-45c0-a3c3-4b5ccf244057@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_225945_960343_82DC9F5F 
X-CRM114-Status: GOOD (  10.86  )
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

A very small nit regarding the subject line. The callback
vmemmap_check_pmd() is already present on arm64 platform
which is rather incomplete. Something like this might be
better.

arm64/mm: Test for pmd_sect() in vmemmap_check_pmd()

On 12/30/24 13:18, Zhenhua Huang wrote:
> 
> 
> On 2024/12/27 10:57, Anshuman Khandual wrote:
>> However it does not really check the entry to be a section mapping which it should.
>> Returning pmd_sect(READ_ONCE(*pmdp)) is the right thing, which should have been the
>> case from the beginning when vmemmap_check_pmd() was added. I guess because arm64's
>> original vmemmap_populate() checked only for vmemmap_verify() as well. So probably
>> this does not need a "Fixes: " tag.
> 
> Hi Anshuman,
> 
> I agree, will remove "Fixes: " tag in next patchset

Could you please send a V3 of this patch separately instead
and not part of this series as they are not really related.

But after implementing the following changes

1) Use READ_ONCE() as indicated earlier
2) Drop the "Fixes: " tag
3) Update the commit message explaining why pmd_sect() is
   required here and how the originally commit missed that
4) Update the subject line

