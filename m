Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB12ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w8XV6+23pG1GwIAnlMPNyvO9XoJeONrWj1tA/S9B74=; b=fcKparaellHKK3ULQfK8+UM5D2
	m6dMcrYCyhJlvLXKUACN7q4AE5DWIKtVBjM+sSC5wjqBURd041XlcdgE2PCu5R83KdRS4la9Cq6BL
	rBt4CKDTHE+yeykBCHNQ7/kyd6uVvKk2IORr0x8S88ziWlyLTxV2K6jT63kM88YG8+/NkRmzv2aDL
	lqlk9zfwOs1pAPmI5Vz+6JpYjguwTK9W/LQtArq7Z8FSRsGxOwVeUOslUavMdvZ3rdiqv2gBSgoDl
	T6CoTK+LkCf5cwT6ovlLbbHISuM4mWY3CY3EMI8N/osIX470AnHEZGhfTRkrK0QT6B6AhdX3Rc15B
	1y8rzWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlEt-0000000GYSz-2URw;
	Tue, 12 May 2026 11:25:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlEr-0000000GYSS-3sDG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 11:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8474F4022D;
	Tue, 12 May 2026 11:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2603C2BCB0;
	Tue, 12 May 2026 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585124;
	bh=No/1r9NXSOvgxBku9vx1UG+/LfWeGy8sRNaCqMvPgOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmOy6kHzN5p1IPWyFzACokakRsYFASS4O46h02LnikTFHm0UdzpDfsasI8fn2JxOi
	 Cyg85QidHWc+4Cj1+R/o/iuSVUq9d5ggESsqOiUx27kh0cUJw20zT/pIC9MNRhdIur
	 ozwJlCIHb5ZA3SixWmdh21PtoirTQ/n1TN45z6C3X0BwTBaJYTRPz8NA5Yt8lDZ5z4
	 LxcjszL5K5g/e431tsdrZeORmm4PpZN+jg9I22idu/n+0/Lb7ZyGM3+1rMqV0658MT
	 JnSxoxPC+58RZ5NPJ0kKPm7LkXcCJmBOWELeDNChkaEOBnTIQgzyCfc/Ok8cMozvBs
	 gk5KFrm1d+yDg==
Message-ID: <de0f32eb-2216-47a8-80d4-bd66fcb253a9@kernel.org>
Date: Tue, 12 May 2026 06:25:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Content-Language: en-US
To: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>, "bp@alien8.de"
 <bp@alien8.de>, "tony.luck@intel.com" <tony.luck@intel.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
 <275595ca-6044-4882-a9fd-ca9d496a27a5@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <275595ca-6044-4882-a9fd-ca9d496a27a5@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_042525_983522_256B497E 
X-CRM114-Status: GOOD (  13.36  )
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



On 5/11/26 20:37, Nazle Asmade, Muhammad Nazim Amirul wrote:
> On 11/5/2026 7:54 pm, Dinh Nguyen wrote:
>>
>>
>> On 5/8/26 02:52, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
>>> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>>
>>> Guard the irq2 retrieval with an of_machine_is_compatible() check so
>>> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
>>>
>>> Signed-off-by: Nazim Amirul
>>> <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
>>> ---
>>>    drivers/edac/altera_edac.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
>>> index 4edd2088c2db..b30302198cd4 100644
>>> --- a/drivers/edac/altera_edac.c
>>> +++ b/drivers/edac/altera_edac.c
>>> @@ -348,7 +348,8 @@ static int altr_sdram_probe(struct platform_device
>>> *pdev)
>>>        }
>>>        /* Arria10 has a 2nd IRQ */
>>> -    irq2 = platform_get_irq(pdev, 1);
>>> +    if (of_machine_is_compatible("altr,socfpga-arria10"))
>>> +        irq2 = platform_get_irq(pdev, 1);
>>>        layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>>>        layers[0].size = 1;
>>
>> Why? We already switch on arria10 later in the same function.
>>
>> Sorry, but NAK.
>>
>> Dinh
> This driver were used by cyclone5 and arria10. Cyclone5 only has one
> interrupt whereby arria10 has 2 interrupt. That is the reason why the
> interrupt was guard by (of_machine_is_compatible("altr,socfpga-arria10"))
> 

Yes, but look at line 397,

       	/* Only the Arria10 has separate IRQs */
         if (of_machine_is_compatible("altr,socfpga-arria10")) {
                 /* Arria10 specific initialization */

Dinh



