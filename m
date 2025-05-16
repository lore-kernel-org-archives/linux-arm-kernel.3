Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90050C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 22:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApFBcOWG2ieHiTUYXnkfHS3k7Kt6Hoxe9udfT1lGPaU=; b=rAhYMSwB4MJrcHj7GF3DsMYLO/
	f7pl/zw+BFdn0LnBlA9GwXV+InQ4s2FCmMHN4xHfii8EIJCQa31iHrja7jzkTSJTICJqScJ3BjBiE
	m1XZeoR6iKh4lyFraljeIUHjfyyxkeP0Qg1SVTSRqUGDe1e26PRmgNwPjK3CQ7ATz9+zYjsiTgEbK
	FBK9p8SgEmFsTFT2sIfKqJ7gnVNeVKstdXGWs0s7gDQIbbOkAV8AH3Pu8/R/oEjLnf09vdKHzzA8v
	ymlYpnu1rZpSx2J4dSDAPlIQo6HQcMERgthVBIkJB33nHe8WyTiklJjNKZQ5aE8PbAGN2TXpIK9CW
	Oe5CgddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3h4-00000004lRz-1j5c;
	Fri, 16 May 2025 22:38:18 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG3ey-00000004lEB-48fw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 22:36:10 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GMa3UZ419051;
	Fri, 16 May 2025 17:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747434963;
	bh=ApFBcOWG2ieHiTUYXnkfHS3k7Kt6Hoxe9udfT1lGPaU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L4d1VxmvTUJDq2EFONO7jt0pi7rMHt/MtBucl1TBizYEbCt5qBh1Ed/qJQ3pAlUh1
	 WV82mGPqYzhrHz0MC8CDOnqm2ExeiP1iRCVnGLovZIDf7Tu3uSOSYA4ENCVmX8Jjyk
	 tEv7iZVfGPro3+ckEuRsZgNN3UyYxU94e63Pyn0o=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GMa3PX202875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 17:36:03 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 17:36:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 17:36:02 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GMa2EU095804;
	Fri, 16 May 2025 17:36:02 -0500
Message-ID: <5cede33c-664c-488a-aef7-4619368c24d6@ti.com>
Date: Fri, 16 May 2025 17:36:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] serial: 8250: Add PRUSS UART driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Bin Liu
	<b-liu@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew
 Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250513215934.933807-1-jm@ti.com>
 <20250513215934.933807-4-jm@ti.com>
 <2025051408-discolor-backwash-5574@gregkh>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <2025051408-discolor-backwash-5574@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_153609_075337_1BCD4C36 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Greg,

On 5/14/25 2:36 AM, Greg Kroah-Hartman wrote:
> On Tue, May 13, 2025 at 04:59:30PM -0500, Judith Mendez wrote:
>> From: Bin Liu <b-liu@ti.com>
>>
>> This adds a new serial 8250 driver that supports the UART in PRUSS or
>> PRU_ICSS*.
>>
>> The UART sub-module is based on the industry standard TL16C550 UART
>> controller, which has 16-bytes FIFO and supports 16x and 13x over
>> samplings.
> 
> If it is based on an existing controller, why do we need a new driver
> for this?  Please explain in detail why this code is needed at all, and
> not just a new "quirk" for the existing driver?

This was explained in RFC [0] but the patch description can be improved
so will fix for v2.

[0] https://lore.kernel.org/all/ba88a5c0-a8b8-4e48-9752-76881fa8e94e@ti.com/

Thanks
~ Judith

