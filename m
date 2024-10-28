Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDC7D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptxN7UQx680+8Nep+cFTxjI9+zmvMwutLIQwIT3A9BA=; b=HtzFXEmSZ7IXztFYILBmz7guo9
	HOURuY930tgd4W5A5LLOr28xk2v05DEdRx8s5zGO5Ia0I/uPZosbV4xAq6kZr5t1v18Y9ZON4QPpc
	jAcLG9qjhzbZ07mjmzuNRg1lew7G/I3lVYDLGYsCJpMzLlAkOCyYYB70GvIE5N/dufZwFsj5HeT7B
	nhMsQudetcF0SftC1SQS1fDw5sotVwsKNKxzs60RuXPlBEMPBnC9wzL4tdvPAQDbT7RX/ZGBhhezq
	meL0J9OuPhWHqdT8oUNLyXPABB191zeXNFpD3S2g14oXxG1UrXrNRrmdk/9fnMmXGmrUnu+sUmfjA
	PrByK7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NcU-0000000AWOe-0Hf9;
	Mon, 28 Oct 2024 11:09:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NZA-0000000AVsf-1u9O
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Oct 2024 11:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ptxN7UQx680+8Nep+cFTxjI9+zmvMwutLIQwIT3A9BA=; b=NWtyisdNdPhRscbpeFIi4hyuSC
	nnCOZBrzW9QSup7VlX6I+NCwDLTwoc61biCibKmE7FoJNSPzoX3iEuY69lEQRNl1m+1KiHIy8SF8a
	m+TlJgjXezECUqhuVcjPbONxkYuzo+MxsjhCZE8BiV59z3hmCYYLkMH8O9rGYtidjHUUT3+nhkaU4
	Oj1GckalUNJwz8DNwmLEFF3HXfGCXq8bFRPbkgZP76VEdVw1N2jAsLg+odUV/8V4eW4GBAee3A7ry
	+Scs2BimVTvT1Zgp8QMDIDptB2cLrjdzAjMzwsBw83x4mG54gq3J3Wh9dpHl2BxYJ7ecBBO1W/mtb
	VpwG1gVQ==;
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NZ7-00000009e36-0PF9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:05:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49SB5DfL072486;
	Mon, 28 Oct 2024 06:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730113513;
	bh=ptxN7UQx680+8Nep+cFTxjI9+zmvMwutLIQwIT3A9BA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V0PV4PaS1bEc3epVawS7wXANJouMPBMRniKiFy0N/XG6H0nFPJGCYx12UiCL/ICi9
	 B1iLpaq4Z61Om8O5zNFPkeHgU+oaUjhLpI+LxfUhhT0wf1cLkrY1C5pNYVeaQrPd2D
	 xe1BJzF7i0bCZ+z138UQYrQd9Jgekoik9MCv+PfQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SB5DDZ047842;
	Mon, 28 Oct 2024 06:05:13 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Oct 2024 06:05:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Oct 2024 06:05:13 -0500
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49SB58Ln020827;
	Mon, 28 Oct 2024 06:05:08 -0500
Message-ID: <a2848e9f-028e-4d58-87e4-50848fe4bca1@ti.com>
Date: Mon, 28 Oct 2024 16:35:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix 1 PPS sync
To: Andrew Lunn <andrew@lunn.ch>
CC: <vigneshr@ti.com>, <horms@kernel.org>, <jan.kiszka@siemens.com>,
        <diogo.ivo@siemens.com>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
        <linux-kernel@vger.kernel.org>, <vadim.fedorenko@linux.dev>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20241024113140.973928-1-m-malladi@ti.com>
 <1a0a632e-0b3c-4192-8d00-51d23c15c97e@lunn.ch>
 <060c298c-5961-467a-80dd-947c85207eea@ti.com>
 <2288a9a9-f9d0-4414-80a2-e11ba66fad50@lunn.ch>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <2288a9a9-f9d0-4414-80a2-e11ba66fad50@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_110541_540081_FC57BB46 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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



On 25/10/24 18:52, Andrew Lunn wrote:
> On Fri, Oct 25, 2024 at 11:17:44AM +0530, Meghana Malladi wrote:
>>
>>
>> On 25/10/24 01:25, Andrew Lunn wrote:
>>>> +static inline u64 icssg_readq(const void __iomem *addr)
>>>> +{
>>>> +	return readl(addr) + ((u64)readl(addr + 4) << 32);
>>>> +}
>>>> +
>>>> +static inline void icssg_writeq(u64 val, void __iomem *addr)
>>>> +{
>>>> +	writel(lower_32_bits(val), addr);
>>>> +	writel(upper_32_bits(val), addr + 4);
>>>> +}
>>>
>>> Could readq() and writeq() be used, rather than your own helpers?
>>>
>>> 	Andrew
>>>
>> The addresses we are trying to read here are not 64-bit aligned, hence using
>> our own helpers to read the 64-bit value.
> 
> Ah, you should document this, because somebody might do a drive by
> patch converting this to readq()/write(q).
> 
> Alternatively, i think hi_lo_writeq() would work.
> 
> 	Andrew
I tried hi_lo_readq() and hi_lo_writeq(), and it is fitting my 
requirement. Thanks, I will update it.

Regards,
Meghana

