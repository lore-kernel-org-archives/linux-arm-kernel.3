Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1419FC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJoZwOuIgjPdC0ssjGngXelUydnEq3wcG4T1qEICItQ=; b=H9UXpcvXt84wXs2qnuygs1Khcq
	rGU7VgeTfM8llRTUwygu6BOEj82FxgvGeEuKNE/kw43ImKtKgLK0wzU3n8rj6B6FvMEq7LckUm3Ii
	/AbHxsdNKI/K1ZJsws4D3wZl4BtT/xbVT1q8IzO82p1+9D5FX8Vtu+qksIih3wgTX7VMrh1PFnAbG
	0kJVdG0vi6n5MVCkg8cBENFmfmNbLkl066LdFGGYgHiDokDaH5BMAkpYZUErxgFarPLmMnQFr84Mb
	4InsO7UyFRWkIPXDeDKUGu/pWzej3XCRiytff2/yurIxiLvs0cbctsEVOK28I90GRzIhI0FmAA1Jr
	nmFCvZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN6p-0000000D9P7-3pRN;
	Fri, 21 Aug 2026 11:08:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN6n-0000000D9Ob-0qiU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:08:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EBE2153B;
	Fri, 21 Aug 2026 04:08:20 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF903F763;
	Fri, 21 Aug 2026 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787310503; bh=r+nWfseUDNsg7pRvQ6HFhuQDqkGoo3C858WzErP2FVs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=byORhdTJJj/wNVZLhbjCuCla2WOMUWXOZUufawxYXeb+7vu4ikT2xiqhBCyPJoID8
	 BsSVPG1qW//TuTIAKtG1BomqMKVTwTdG85ypmctJeyPlAlkc8fHd6rQRefn7qpN5Yb
	 VKaRRlk70XogrEkROd3qsPu/xHUZaDE/EVLVotII=
Message-ID: <b300856e-46da-4f94-ba4c-24064561024f@arm.com>
Date: Fri, 21 Aug 2026 12:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/45] arm64: interrupts: Add common exception
 state helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-13-vladimir.murzin@arm.com>
 <e93ae08b-64e2-4128-b1fd-910c4d197dbd@huawei.com>
 <86ebda30-26ad-438b-9f98-2ea9e3849cd8@arm.com>
 <6ac531ab-2a9e-430d-822c-9528971a5cad@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <6ac531ab-2a9e-430d-822c-9528971a5cad@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_040825_282875_D5F86626 
X-CRM114-Status: GOOD (  10.85  )
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

On 8/11/26 08:39, Jinjie Ruan wrote:
> 
> 在 2026/8/3 17:40, Vladimir Murzin 写道:
>> Hi Jinjie,
>>
>> On 7/28/26 09:20, Jinjie Ruan wrote:
>>> Hi Vladimir,
>>>
>>> Using two tables as below to map different contexts to the hwstate
>>> status makes the code appear more concise and clear. What do you think?
>> I think I already tried something like that and IIRC it hurts code
>> generation...  I'll have another look before posting next version.
> Thank you for very much.
> 

Interestingly, with CONFIG_ARM64_PSEUDO_NMI=n both versions seem to
have the same codegen, which is not different from the original code.
However, once CONFIG_ARM64_PSEUDO_NMI=y, codegen starts suffering from
static branches, with the table approach being slightly worse. Since
whether we use {p}NMI or not is a runtime decision, the compiler seems
unable to fully optimize things out.

Perhaps this is the price we have to pay for flexibility, but if
someone has ideas on how to tune the code generation, I'm all ears.

Cheers
Vladimir 

>> Cheers
>> Vladimir
>>


