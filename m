Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906BBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0w9s1AI3PGuJyduvF2wijkKODXuhx642loI9TLD2zUg=; b=Np1qEgZwjAUgF0tQdaaauFlwt7
	GuhQoB1jAU7SnbpJzcmX+lIC+A6OG/Eun/y0TBRdsVk+sn5GvBx2fB0JkT/xyBg4nLG/q1AqNEw+c
	JaFS08tZEiiXESrchUGnTUfX0CO1RX64N1ccC5cFkc4tBvZfIwXcZkiwoQXnr8P0NuUXO6xTn64ah
	IUlMWxwpZ0oLEvZRvCZ/WyRHqACcMtfref6lnuR3qLtKc61JBv2x1M+zRuNqwDjoL55BuY0Z4YFww
	txqqi35NV788Reyo4f0ecTPlzxq4awF8whJ0748aagan3pWuL/GGjv8uZAA7CDeAmdtSo7/ETz0S4
	3MPdJKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeCp-0000000FTY5-2Dxe;
	Fri, 07 Mar 2025 20:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeBC-0000000FTSJ-3bZk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:20:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55B7413D5;
	Fri,  7 Mar 2025 12:20:34 -0800 (PST)
Received: from [10.57.37.135] (unknown [10.57.37.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A666F3F5A1;
	Fri,  7 Mar 2025 12:20:17 -0800 (PST)
Message-ID: <ea78c21b-db4a-4144-b1b5-b1a37e1ed51c@arm.com>
Date: Fri, 7 Mar 2025 20:20:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, Charan Teja Kalla <quic_charante@quicinc.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <Z8sBuzx6sGq24n0g@lpieralisi>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z8sBuzx6sGq24n0g@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_122022_945841_CA4AD06D 
X-CRM114-Status: GOOD (  14.12  )
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

On 2025-03-07 2:24 pm, Lorenzo Pieralisi wrote:
[...]
>> diff --git a/drivers/acpi/arm64/dma.c b/drivers/acpi/arm64/dma.c
>> index 52b2abf88689..f30f138352b7 100644
>> --- a/drivers/acpi/arm64/dma.c
>> +++ b/drivers/acpi/arm64/dma.c
>> @@ -26,6 +26,11 @@ void acpi_arch_dma_setup(struct device *dev)
>>   	else
>>   		end = (1ULL << 32) - 1;
>>   
>> +	if (dev->dma_range_map) {
>> +		dev_dbg(dev, "dma_range_map already set\n");
>> +		return;
>> +	}
>> +
> 
> Why are we checking that dev->dma_range_map exists here rather than
> at function entry ? Is that because we want to run the previous code
> for some reasons even if dev->dma_range_map is already set ?
> 
> Just noticed, the OF counterpart does not seem to take the same
> approach, so I am just flagging this up if it matters at all.

The intent is just to ensure it's safe to come through this path more 
than once for the time being - it doesn't really matter whether or not 
we repeat anything apart from allocating and assigning dma_range_map, 
since that leaks the previous allocation. Thus this check is logically 
guarding the acpi_dma_get_range() call in this path, and the 
of_dma_get_range() call in the other.

> Other than that, for acpi/arm64:
> 
> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

Thanks!

Robin.

