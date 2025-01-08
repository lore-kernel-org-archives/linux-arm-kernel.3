Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A3AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBFfvevMsK9ZA/ZNAz6Nk2cp2esfcvJVDFz4UaKdqR8=; b=AjhDQc5+KKM2OUs4bq3u2G1Yo2
	qcKY1qEUU42x4QhQdhlbZ5o5ZI59xpe889F+KgF5jYkcZmdPjUDlieXLvFUO5XRKGxF8ATdMDHGdC
	4DHxYeigmgw0TenQy7Hd9t0l4XOKsw6tOXGjFpLqcmhmEW8p9WJP+ER48M1Zi170ABeAdZwk3EN8A
	bB3hdm8D+anziJKU15PSuj9wxvHklPD0Pn/w+kHtwleSuX0x6Y8j6t0S57OHnUPOCmGzM+4Dp4uDr
	sSxRik466VA65abM/i0P/tNqcyOHBm1myvKKtyFhFbMNePcvrSV+sYmBB771nRlu7MKJPKjpph0AT
	EOqTvTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXi2-00000008ujv-16WD;
	Wed, 08 Jan 2025 15:11:02 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVXgm-00000008uXM-3ugW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:09:46 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508F9cvb117690;
	Wed, 8 Jan 2025 09:09:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736348978;
	bh=EBFfvevMsK9ZA/ZNAz6Nk2cp2esfcvJVDFz4UaKdqR8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CQbgrhOqLSVYVmwXK/H/RzO1Xn7vpeei2DD1QvXiDmBYEQj17RxbgWA4cRAT8jCjW
	 2uU7EN76oAcgiOwctPkfCQ9e9nBOsxf/ZfOEXOhKAAt/kzGSthOuHEHn2yFkG3GY4V
	 CYN4TFrcD6NWkis0PCzLV8YXm/0AOJCdUK+tEDAo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508F9c2f056613
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:09:38 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:09:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:09:37 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508F9bXo041516;
	Wed, 8 Jan 2025 09:09:37 -0600
Message-ID: <1251db38-5009-4e93-9603-3ae02f276e5b@ti.com>
Date: Wed, 8 Jan 2025 09:09:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
To: Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@baylibre.com>
CC: <devicetree@vger.kernel.org>, Romain Naour <romain.naour@smile.fr>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>,
        Romain Naour <romain.naour@skf.com>, <s-vadapalli@ti.com>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
 <20250103212528.enq4ur5afxhwzh7n@outdoors> <7hr05eb5st.fsf@baylibre.com>
 <20250108131139.dygei6ejamh5zaij@segment>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250108131139.dygei6ejamh5zaij@segment>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_070945_060002_42C9921F 
X-CRM114-Status: GOOD (  15.38  )
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

On 1/8/25 7:11 AM, Nishanth Menon wrote:
> On 14:46-20250107, Kevin Hilman wrote:
>> Nishanth Menon <nm@ti.com> writes:
>>
>>> On 15:07-20241205, Kevin Hilman wrote:
>>>>
>>>> On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
>>>>> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
>>>>> SoC are used to drive the reference clock to the PCIe Endpoint device via
>>>>> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
>>>>> obtain the regmap for the ACSPCIE_CTRL register within the System
>>>>> Controller device-tree node in order to enable the PAD IO Buffers.
>>>>>
>>>>> The Technical Reference Manual for J721e SoC with details of the
>>>>> ASCPCIE_CTRL registers is available at:
>>>>> https://www.ti.com/lit/zip/spruil1
>>>>>
>>>>> [...]
>>>>
>>>> Applied, thanks!
>>>>
>>>> [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
>>>>        commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
>>>> [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
>>>>        commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
>>>>
>>>> Best regards,
>>>> -- 
>>>> Kevin Hilman <khilman@baylibre.com>
>>>>
>>> This will need a bit of fixup - See along the lines of the following.
>>> Additionally, we should be a bit careful about the dependency of dts
>>> mix up from two trees.
>>
>> sorry, these should be going through your tree in the first place.  They
>> are now dropped from my tree, please go ahead and take them along with
>> Andrews fixup.  Sorry for complicating things.
> 
> 
> Romain,
> 
> There is additional fixups needed, unfortunately as well: syscon yaml
> has two lists based on which dt-schema version you use.. your patch
> fixed one list, but missed the other as well. Could you integrate the
> fixes and resubmit, please?
> 
> 

Or since we already have 'ti,j784s4-acspcie-proxy-ctrl' for the same
reason, you could drop the first patch and re-use this compatible.

For the second patch, you'll still need to add in my suggested
changes and re-send.

Andrew

