Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42B3C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGI+jBXufkLU8VtoZIyAUhAygRKSiHUyX05VgztKA4o=; b=GST3wfnTcslTlQG4dhj1FoVN8L
	K4HFGnf/BFbcktawUM5Y7uOkBn1iGpc3eOp2v6NAGkIGDFfIiHwlLeWbA6fZzy9tCf3ceytniAdP0
	YVcU+l5dpmqwsRDikAcg/9OaQ4s8+kX58UkvhTwW4gl6M3zDSUqeD5o4F3h7GYyF4OQK5MU+vayuf
	RZB8d7yVYwUQ55Ik11iCmzQ8ZCmHBT9UIBNqo1W85UOuhSy3d5fdesVZ/L4hQ5v+aySWG05ntSJ1h
	aMaSR0pS85ufZL4ti4+U9pS+CUrd4NsXNeen2uqR50wwEKmvixmkApMtkHmIm2RRpIcSIr1CHgyET
	DkNxrO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhny-00000002Iqd-1W4U;
	Fri, 17 Jul 2026 12:36:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhnv-00000002Ipu-3bBA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:36:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BA161476;
	Fri, 17 Jul 2026 05:36:30 -0700 (PDT)
Received: from [10.57.84.220] (unknown [10.57.84.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DB2D3F7B4;
	Fri, 17 Jul 2026 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784291794; bh=cK5CyITB0AQ4m/M1LPMHQsYqVGfmWCfGzBB/iAt08Fo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SWY4iwE32bOwuSxhu1Kr1LYKKKXPrBMFSFsib240wu2IB7V33T92lfoCNtCvAXPRu
	 tDR54r1ifr8tF0pN1OPK5iKnW7W6gAVayDho5Y4frWx7ELROJHnFijd5hlJvaDQoFe
	 ZLPPTRk6SWeGqDpwVM6hbKtrmRZgFqBqIDuSl3bM=
Message-ID: <c000fe3e-2c10-4b2e-9f3c-852e38be5eb8@arm.com>
Date: Fri, 17 Jul 2026 13:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/8] misc/arm-cla: Probe firmware-described devices
Content-Language: en-GB
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-4-ryan.roberts@arm.com>
 <7927c483-57ed-4253-a7df-40104ff2b192@app.fastmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7927c483-57ed-4253-a7df-40104ff2b192@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_053635_943114_D3FA6965 
X-CRM114-Status: GOOD (  11.60  )
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

On 17/07/2026 13:25, Arnd Bergmann wrote:
> On Fri, Jul 17, 2026, at 12:47, Ryan Roberts wrote:
>> +
>> +static const struct of_device_id cla_of_match[] = {
>> +	{.compatible = "arm,cla",},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, cla_of_match);
> 
> This is missing a device tree binding, and probably needs to versioned
> in some form.

Given the aims of the RFC, I didn't think this would be a blocker for now - of
course it's on the list for if/when we get further along the road.

Thanks,
Ryan


> 
>       Arnd


