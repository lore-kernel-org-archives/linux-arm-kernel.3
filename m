Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D61CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi7aFsVXooiOWK/xFNMU+6lGjpO1Ry0geAVu/sFe8xI=; b=QOWBuyBMOeCGYepVRs3x8Mz2cP
	eoHC0zAFkB2I082RsZwTdXSXFsylH34RQyJCROyRiJIs4Vst0RR0xkYigSgrddRT0L9ocPtKQ/Y8X
	8p+cbfWZek0sFJc1PeX9i4eAE/BOYn7pp4M4pKXspbX6nQA859Zj3BQoWVOeTL0tDBdX5HvdbTfKm
	nHOQdXvEZ317hAjxFUwfTyVpbPQXliksD2vE3X8uVN4hwrcnYqlYsSue26Z1Avau28mv68E6/Sz35
	QW8vDjeWqBubNpdO4QjTazUqpWacBfI1TP2FdtyFLhLPG7kL80JFSCF3YYrVzdIL/AZ1LvFssntRH
	PRyKB8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyI8-0000000FTO8-3XMw;
	Wed, 14 Oct 2026 12:41:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyI5-0000000FTNh-3Kd3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:41:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55DFF153B;
	Wed, 14 Oct 2026 05:41:00 -0700 (PDT)
Received: from [10.57.9.28] (unknown [10.57.9.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BA443FA32;
	Wed, 14 Oct 2026 05:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791981663; bh=DsC4q+4yg6eLHkPxNVJf1vPqliSRaUMAYV//mcmB3hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROgEgrXYixPVhlypL/B3nQZg0NGcVidZSj5LI1vGmvHnBWnkZBR3nmYvDZqFGSXoa
	 rdsP3QHD0SE3MVRl57iZU0wCiBlAPMEVTuQ9oaL6PFoH/0DWlnAFhwODlogUaspq8p
	 27yz/Hkuy71iI+sCFzo3yKRvT8q61TcwFRVNFsX8=
Message-ID: <d943b66a-c779-4b85-a7c6-d73ef9941dd9@arm.com>
Date: Wed, 14 Oct 2026 13:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
Content-Language: en-GB
To: Sudeep Holla <sudeep.holla@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 tabba@google.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 jonathan.cameron@oss.qualcomm.com
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-3-suzuki.poulose@arm.com>
 <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
 <8be050e3-8af1-4f04-902f-9bc01b209dd0@arm.com>
 <3fbd4739-a4eb-4428-95ae-ead22e7cf9f2@redhat.com>
 <799fb810-c33e-4d0e-9a70-7092c0a681ff@arm.com>
 <0ceda99f-0352-474b-a30a-c5e79b817c2d@redhat.com>
 <ade8dd16-4f09-47d0-a821-636ca4c62565@arm.com>
 <20261014-victorious-prompt-kelpie-cf3a87@sudeepholla>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261014-victorious-prompt-kelpie-cf3a87@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_054106_060620_AA639B1E 
X-CRM114-Status: GOOD (  14.07  )
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

On 14/10/2026 13:05, Sudeep Holla wrote:
> On Wed, Oct 14, 2026 at 12:06:54PM +0100, Suzuki K Poulose wrote:
> 
> [...]
> 
>>
>> Then it is RMM's problem if it doesn't check that the right level of
>> SMCCC version is not implemented by the EL3. Also, where do we stop
>> the checks ? e.g., We need SMCCC >= v1.3, when SVE is supported.
>> And >= v1.4 if SME is supported. Shouldn't we leave this to the RMM
>> to verify on init and fail the init ? I can raise this with the
>> tf-RMM team.
> 
> Fair enough for v1.3+/SME/SVE checks, but RMI interface relying on more
> that 8 input registers for one or more of it's interfaces (e.g.
> RSI_ATTESTATION_TOKEN_INIT, RSI_MEASUREMENT_EXTEND, ...etc) indicate
> it can't work with SMCCC v1.1 or below

Fyi, those are RSI interfaces (Realm Guest facing) and we could add the
checks there. This series is the Host facing interface. That said I
will send a fixup to add the check for v1.2 for RMI too.

Thanks for the feedback, both!

Cheers
Suzuki

> .
> So IMO check for v1.2+ is completely justified here.
> 


