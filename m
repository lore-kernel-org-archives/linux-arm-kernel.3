Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FA4CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT8pSHZDMYbVu3YwS+G6dGmg9pHpwwi9lDlBo2IR364=; b=yVUfWH15xvmGvMScT0iPvi8POe
	gR3eAVB9DvOpD2QhVSk2EUokAiOT/GiCNfwY/FamIuVUe9iqmUervctRydZRRFYHKtGRDBhgdyZso
	HKsMOrkRX8uM6RIxyu1VlC5nee9JHLlCgYVSVB/9VAZZfiY8EJm5dAoO5t/A9HG9k8M1tNoi4ntcY
	G6ElPvpQudX+CMiUYCZOX1Mr51PMdzV112XFWB1VneIstCEelKLJyJpX1Ds1m5K8o0A2G535MzFrE
	wtlSXhnBfRF2Ok7/EzNCkgtOOOfHGX4Z6WZc8R2TkdDHjfgqoGbPuj0TXJpkIFgFMa8TjivI1oHjC
	6WIpPazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCVC-0000000A57d-3DbF;
	Mon, 12 Oct 2026 09:39:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCV5-0000000A54z-2Cvq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:39:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC7721655;
	Mon, 12 Oct 2026 02:39:14 -0700 (PDT)
Received: from [10.0.128.125] (Suzukis-MBP.cambridge.arm.com [10.0.128.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8890A3FB75;
	Mon, 12 Oct 2026 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791797958; bh=BCe7pe9i+jSQaDUbfBg+8WH0w4qiiFnPcfL8iRSqg8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O4CQ0GtMZDen8O5yXO9WZ3bSbGtCCtT5gZz7VYlyIKAeMbmEUJOPR0zyFXiLx4Fgv
	 II+GogzCYDU4ZtuVD0z8R5aslyFjLAKFRFrDsVaIg86WqNTSmR/K9sQlcGPZWGbmG/
	 XmiJTRClS3da2U0nR07OXJ9f3jXM3WiXDlE+/Sd0=
Message-ID: <fa110c56-3faa-4819-bb94-0d82935c4ac5@arm.com>
Date: Mon, 12 Oct 2026 10:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: Pass only the required device probe
 arguments
Content-Language: en-GB
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>, Russell King
 <linux@armlinux.org.uk>, kernel test robot <lkp@intel.com>
References: <20261010100249.643327-1-aneesh.kumar@kernel.org>
 <ebb8c99c-5f76-4c36-b3cd-c238b53b3d8a@arm.com> <yq5aecdwcqsg.fsf@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5aecdwcqsg.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_023919_622168_FDA70B18 
X-CRM114-Status: GOOD (  13.23  )
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

On 11/10/2026 14:25, Aneesh Kumar K.V wrote:
> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> 
>> Hi Aneesh
>>
>> On 10/10/2026 11:02, Aneesh Kumar K.V (Arm) wrote:
>>> The device probe passes zeroes for all seven argument registers to
>>> arm_smccc_1_1_invoke(). On ARM32 Thumb-2, this binds an input to r7 and
>>> GCC 8.5 reports "r7 cannot be used in asm here".
>>>
>>> The current smccc_devices entries need at most one argument after the
>>> function ID: TRNG_VERSION has none and RSI_ABI_VERSION takes a requested
>>> version. Pass zero for that argument and omit the unused arguments,
>>> avoiding the r7 constraint. Check argument requirements when adding new
>>> probe functions to smccc_devices.
>>
>> Is it safer to use x1-x3 to 0 as they could be the results that we
>> get back from SMCCC v1.0 onwards ?
>>
> 
> 
> I'm not sure I follow. Passing additional zero arguments only
> initializes the input registers; it should not affect how return values
> are handled. arm_smccc_1_1_invoke() already declares x0-x3 as outputs.
> Since these probe functions require no inputs in x2 or x3 and we only
> inspect x0 on return, why do we need to initialize them to zero?

Agree, I meant, passing 0s for x0-x3 future proofs the new calls.
We know that x0-x3 could get overwritten by these calls, and is
safe to be zero'd on a call.

But agree, for the existing users just x1 is enough.

Either way,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


Cheers
Suzuki

> 
> 
> -aneesh


