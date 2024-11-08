Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFDFD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTVa1YU8xsCqv7a/zXFqOwk3vw0mA7nyf3KobTF4xeo=; b=QlcENhOvEP2vOudmpP9oraUP6X
	vfJNlpbr2dw1UVuzZS/G3PQLSGJD+WgQRUu81ctR3IAUCObWDH4cav8FgnTnWYMG5qg3ldDCOEWeC
	ittaackjy1SuBXAPKxqxi2W76POJusmU/q7D9vqaF7NIMxA3+121uL4mJq92FXlRiTkuS5kZIoofQ
	A0Ui6IRjP7bGoEUIAtw33yUg4VrbBSZ4/6TwWdep0uan7nPIuqXec2SmVWqULf4cRiJNa9yZVYRG7
	rblv7Ne2C5DCVPwCaVscr1nb/aRaTokXffq0lhhlNwp2eAuXASV+WCKFI31jTcPmzNNKSZbYWrDzF
	DHRPFCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PoZ-0000000Ap5W-0ajd;
	Fri, 08 Nov 2024 14:18:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PQA-0000000AlQZ-0QJI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731073987; x=1762609987;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IAq5ttC3vbAsycsYo3nu25UcjBasXzDzBPtVRRcBV2E=;
  b=UC4OJ15ezXbi38rZtU2+A60oAFc23hAgx3D0Uyv7FbsHqIc6g0c11TgT
   k4zWsEPzEmhvtevUWMXp1QuHfX9dw3mafFcVQOhkSXhG+m5GL7Dtj7q2F
   7RXtGXDf5hyGTgWyKvamdbBF3/dyIR+IF1CfMXMb3me2i/Qiz6DwrR1Aa
   nprFgurmnVpwuC0T/nMWA8AJLT0x5iPtYyEeh5L9+sRcbn/GaKA1Kdyte
   iRDAv6Be/SXHXX5ok6ufmeTaInS93po9KfydbAII9a8MKP1BN+HfKoYkn
   ermAffcwK7GLFrEA+4kHE9Qpoz0hXdrjibECpdER1CwqxgyTduQQUX0qz
   A==;
X-CSE-ConnectionGUID: n9Mhh33+SoCqjpbzpzIr+Q==
X-CSE-MsgGUID: oHmViC4PRB2IqZex68sauQ==
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="265192530"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Nov 2024 06:53:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Nov 2024 06:52:33 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Nov 2024 06:52:31 -0700
Message-ID: <2bf3bf7d-0360-4673-a7c7-4b74a9300f63@microchip.com>
Date: Fri, 8 Nov 2024 14:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tty: serial: atmel: make it selectable for
 ARCH_LAN969X
Content-Language: en-US, fr-FR
To: Robert Marko <robert.marko@sartura.hr>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <lee@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luka.perkov@sartura.hr>
References: <20241108112355.20251-1-robert.marko@sartura.hr>
 <20241108112355.20251-3-robert.marko@sartura.hr>
 <609ef9c4-18cd-4a80-9821-5df27727772e@microchip.com>
 <CA+HBbNFomosu+5_C0+6cqKcc3B9DFiXXPxexFYjY4ud2LmWqmg@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CA+HBbNFomosu+5_C0+6cqKcc3B9DFiXXPxexFYjY4ud2LmWqmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055306_188583_6768FFFC 
X-CRM114-Status: GOOD (  19.70  )
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

On 08/11/2024 at 14:40, Robert Marko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Nov 8, 2024 at 2:25 PM Nicolas Ferre
> <nicolas.ferre@microchip.com> wrote:
>>
>> On 08/11/2024 at 12:22, Robert Marko wrote:
>>
>> A little commit message would be better.
> 
> Hi Nicolas, I basically reused the same commit description as for MFD
> and else as all of the changes are
> basically the same.

Ok, I have certainly deleted it while replying. That's fine then.

>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>>> ---
>>>    drivers/tty/serial/Kconfig | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
>>> index 45f0f779fbf9..e6cf20b845f1 100644
>>> --- a/drivers/tty/serial/Kconfig
>>> +++ b/drivers/tty/serial/Kconfig
>>> @@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
>>>    config SERIAL_ATMEL
>>>           bool "AT91 on-chip serial port support"
>>>           depends on COMMON_CLK
>>> -       depends on ARCH_AT91 || COMPILE_TEST
>>> +       depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
>>
>> Checkpatch.pl reports some "DOS line endings", you might need to fix this.
> 
> Hm, I ran checkpatch before sending in verbose mode and I dont see
> such a warning,
> my Sublime text is also set to Unix endings, I also just checked with
> cat -e and I dont see
> any DOS endings.

Ok, indeed. Probably my email client then. Sorry for the noise.

Regards,
   Nicolas

>>
>>>           select SERIAL_CORE
>>>           select SERIAL_MCTRL_GPIO if GPIOLIB
>>>           select MFD_AT91_USART
>>> --
>>> 2.47.0
>>
>>
>> Once fixed, you can add my:
>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>
>> Thanks, best regards,
>>     Nicolas
> 
> 
> 
> --
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura d.d.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr


