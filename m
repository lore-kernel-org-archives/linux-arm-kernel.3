Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5024C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZc2EiIpiR1jbCJW3RySooBBbbiUPbLkEcbSP1phsmw=; b=qpeo+n/4PjLmm44n+5nqe7omZP
	UHATeusmMYswbpC0Sfq9biZmEqTsozbKFyj7/YzFwl/1MAM7yO5qAMGdpLrvQmeTpKNf4aCK9EW7z
	FtbDnuTmvEZj11JmI4GBH6iEuGEDznYlEvGUEyLgbXD5b/jgr6RNOhslNNQ0281crB/BaltHX07td
	dW9ePApfU7wqhghnKswWy+BxiEdkOv409moeet4nfxZ3wvsMJzZUv8FcIVq2qwkmXNaz7314WJMz2
	evXtUS9/9rRXUSUKDCHRF9swFHXSN/1MsmT8jJUC1jVvRbawdh8rjbCX44vV4iJCAEqoAmQYxCGap
	mXvY9uAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9pb-00000007E0c-282C;
	Wed, 29 Jan 2025 15:18:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9nY-00000007Drf-2mFf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 15:16:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC622497;
	Wed, 29 Jan 2025 07:16:36 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 840FB3F63F;
	Wed, 29 Jan 2025 07:16:09 -0800 (PST)
Message-ID: <7662f558-1a41-4845-94e2-1cc6afe96d51@arm.com>
Date: Wed, 29 Jan 2025 15:16:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: proton-pack: Add Spectre-BSE mitigation for
 Cortex-A7{2,3,5}
To: "Doebel, Bjoern" <doebel@amazon.de>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 blakgeof@amazon.com, pjy@amazon.de
References: <20250122174736.1560714-1-james.morse@arm.com>
 <508f2d34-15e1-4c84-842c-ec34bcbdd4cb@amazon.de>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <508f2d34-15e1-4c84-842c-ec34bcbdd4cb@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_071612_747778_08613659 
X-CRM114-Status: GOOD (  16.19  )
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

Hi Bjoern,

On 23/01/2025 21:13, Doebel, Bjoern wrote:
>> Spectre-BSE is a variant of Spectre-BHB that abuses a power-saving mode
>> on some older cores to dodge the BHB mitigation applied to the branch predictor.
>>
>> Only A72r0 actually needs anything doing - this is basically a bug in the
>> published BHB mitigation sequence that was published for A72r0. This
>> series moves A72r0 to use the WA1 firmware call for mitigation, and adds
>> the necessary reporting parts for user-space to discover which parts of
>> BHB/BSE are mitigated or vulnerable.
>>
>> WA1 is used instead of WA3 which was new for BHB because we can't rely
>> on hypervisors not to use the 'local' workaround, and for Spectre-BSE
>> we don't need to worry about discovery via. (Which is why WA3 exists -
>> for cores not vulnerable to the issue mititaged by WA1).
>>
>> Arm's description of this vulnerability can be found here:
>> https://developer.arm.com/Arm%20Security%20Center/Spectre-BSE
>>
>> This series is based on arm64/for-next/core, and can be retrieved from:
>> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=spectre_bse/v1
>>
>> Backports of this version can also be found under spectre_bse/backports
>> of the above repo.
>>
>> Because this vulnerability is hard to expoit, but the cost of mitigating
>> it is high - the mitigation is disabled by default. (see the last
>> patch). To enable the mitigation, a command-line argument is needed:
>> 'spectre_bse'.
> 
> I see that the patch to introduce this parameter is in the git series you linked above,
> but it is on top of the three patches in this series. Did you intend to send it as patch 4/4?

Yes. Oops. Thanks for point that out!


Thanks,

James

