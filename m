Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A04CCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeZeuzSReGfBPK9eQwbs5L4xMf2825wPQzIjQtNido8=; b=bcn4eLnT6FlWlwkFW7OFxMLRKd
	8JPmbEBA83vCohMHEM4V+gUCh5h8p+7qpU5MVlGsvC8ApDNtV+QZ/VKmd/8ytx+YrxPMBAVlrk7nj
	QXTpINwAEgq4uce7e3xOcx7H1banUNvxsBhg+Rt6CC3xB9pbQM/JEwHhYbUrrAr9V/EihtsSJwNab
	4Yz/MUyINoqR4F8AJq+ip1DU0Ow22Rp65kmQ27ITJJ1M7oIG41mdbAq0FL7VXl/Viejktkutg7ga5
	Yi4/J+tPGgSb4pFpeRCHfGit7B1EpQPR8aBniVS8hHuWOq2Z16A7QriRaqvAJWFxoFYEoEItbV29A
	FhN6c3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvFp-00000006FCr-4C7W;
	Tue, 09 Sep 2025 10:07:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtpJ-00000005bqR-3is5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 08:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757406945; x=1788942945;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CXgkJ6vcEYUjaoEsiVysUMOuZtwcZBJNVprV2+pEVls=;
  b=V1l6/xnlJgdxrcxGa4Q51tmRE+Inslpf9VG0X+EtS54bzsEBBdKilYp4
   brwAnNCL2J7CzVGzqGZkwrCBhgS8fN5GWbiw2uI3IhhWu/37ImEOl/2Tb
   9VwSM3D/0eU4ebdbuF9tHPHiQRnbTCJ4k0DBxwJNJMDwQ4mLoOTZdOQqm
   YopT+jLYYpsZq5sk9QPrqoDPbpSnddIiUo+LsXC7O2rXhsppja/GxU6vJ
   LcEX5f6uZv9lBzQKQKnXbIV7AHx8UmOmrjwuKpL5CfmiLxKTYZGKt1c3l
   RcZ4hkFcasuovE+ppAV0PJZSHhal5mcmOQ2oMJK03K0JWHagNa7ivugOa
   A==;
X-CSE-ConnectionGUID: ofTAqQfWT8OQ6lC0/N7q+g==
X-CSE-MsgGUID: xuRAfyugTWW04SVqJa9bTQ==
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="213640830"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 01:35:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 01:35:17 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 9 Sep 2025 01:35:13 -0700
Message-ID: <1e1b3cbe-ee39-4813-8f17-1844fc9d45f7@microchip.com>
Date: Tue, 9 Sep 2025 10:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
To: Lee Jones <lee@kernel.org>
CC: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>,
	<luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-5-robert.marko@sartura.hr>
 <20250902100254.GD2163762@google.com>
 <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>
 <20250908141633.GB9224@google.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250908141633.GB9224@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_013546_194330_DCC292BA 
X-CRM114-Status: GOOD (  14.88  )
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

On 08/09/2025 at 16:16, Lee Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, 04 Sep 2025, Nicolas Ferre wrote:
> 
>> On 02/09/2025 at 12:02, Lee Jones wrote:
>>> On Wed, 13 Aug 2025, Robert Marko wrote:
>>>
>>>> LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
>>>> avoid needing to update depends in future if other Microchip SoC-s use it
>>>> as well.
>>>>
>>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>>>> ---
>>>>    drivers/mfd/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>>> index 425c5fba6cb1..8f11b2df1470 100644
>>>> --- a/drivers/mfd/Kconfig
>>>> +++ b/drivers/mfd/Kconfig
>>>> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>>>>    config MFD_AT91_USART
>>>>         tristate "AT91 USART Driver"
>>>>         select MFD_CORE
>>>> -     depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
>>>> +     depends on ARCH_MICROCHIP || COMPILE_TEST
>>>>         help
>>>>           Select this to get support for AT91 USART IP. This is a wrapper
>>>>           over at91-usart-serial driver and usart-spi-driver. Only one function
>>>
>>> Let me know when the deps are in Mainline.
>>
>> Hi Lee,
>>
>> I have tags from other maintainers, how about you give us your and we make
> 
> My?  AB?

Yep ;-)

>> this patch travel through arm-soc like the other ones?
> 
> Sure.
> 
> Acked-by: Lee Jones <lee@kernel.org>

Thanks Lee. Queued for at91 PR to arm-soc.

Regards,
   Nicolas

