Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B615BCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhKmaiQzih6o5e+m6iarlbLwY3tULBomz4i39gpOQgA=; b=py8pz3qPt72lQI
	ZduZG48fx0Tv8B/BygSFS7uh2bNFQxA+xM9FmEMOwQUka2UMsPKbq8ZsDztkwaTWpTodIaaC/irou
	nDBxE7oMNcxmZgqXFQNtmvj4JK9D/YOCxye4kwRtBf/zEUn3WSVfg+H7HUH3cInF5RXiOQxBAIxps
	LpewvOwD3PDMctYYMC1iaSdnfcjVoCbX/A+tL5GVJ2MZQ8thDCBtCapFnlA1x6lU17zjiH4r/gTyW
	FERTAqbqhx4wBqg8xRIdknXpVb5m2J6eZIgBMOa6SQbD0zj92KgYgeHhXZmDTKZmnTjD9c9i498I5
	82hkfESUOEmcVyyNi2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdlE-0000000BiPL-25Wb;
	Fri, 02 Oct 2026 13:57:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdlC-0000000BiNz-07GB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:57:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F325D497;
	Fri,  2 Oct 2026 06:57:08 -0700 (PDT)
Received: from [10.57.55.104] (unknown [10.57.55.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454853F85F;
	Fri,  2 Oct 2026 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790949432; bh=L+fVfiRoU5Rocj6JDsGYZYQi34BP/ycGEUuQn0k/teY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YYTZ88Nh2VPrS5piRUfDbQ9WCTE6LlF7Ec3UTDLDWKAxgBLEHfsR8U2TsUnPzN4J7
	 MYUGn+ihgD7m5jjEEGjlDFP3YlN2TDOZn3aNATjeRP9GyhFuWJcqstFuE9x9dp1myP
	 bsVeveRSoBVURvZ/PdSFdJqoeEdYgn6H6d7bZGTI=
Message-ID: <d7561b18-23ff-42c8-9df7-3947b473f7ae@arm.com>
Date: Fri, 2 Oct 2026 15:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] firmware: smccc: lfa: Add timeout and trigger
 watchdog
To: Sudeep Holla <sudeep.holla@kernel.org>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-4-andre.przywara@arm.com>
 <20260921-elastic-impartial-pig-ea6b58@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260921-elastic-impartial-pig-ea6b58@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_065714_991235_124A91A4 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Sudeep,

On 9/21/26 17:36, Sudeep Holla wrote:
> On Fri, Sep 18, 2026 at 04:11:06PM +0200, Andre Przywara wrote:
>> From: Vedashree Vidwans <vvidwans@nvidia.com>
>>
>> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
>> timeout mechanism. This update ensures that any potential hangs are
>> detected promptly and that the LFA process is allocated sufficient
>> execution time before the watchdog timer expires. These changes improve
>> overall system reliability by reducing the risk of undetected process
>> stalls and unexpected watchdog resets.
>>
> 
> I assume this change is separate from 2/8 for authorship purposes.
> Otherwise it should ideally be part of the original driver. It is prone
> to firmware bugs without these changes.

Yes, I was quite torn over this. She genuinely wrote that code, so I 
wanted to give her credit, but I see how it's odd to kind of fix up the 
original patch in the same series.
I am now leaning towards merging this patch into 2/8, and also the SMC 
access lock (7/8), since it's not really safe without them.
But then still keep Vedashree's ACPI patch (4/8) separate, as well as 
the DT patch, and the auto-activate, since they are somewhat optional.

If you have better ideas, I am all ears.

Cheers,
Andre




