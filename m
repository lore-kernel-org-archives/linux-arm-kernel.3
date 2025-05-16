Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B2CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=echaWsMPgS84p2tKl50KjLXJo4dRcu5w0psGE99gbAM=; b=T7gMOTUCAJPbCnhmyux0TEpyoZ
	5bo/ngPizSLFsD62NDbtuB32ASZJHEucMx3V2K28HVm76u3wtmef2la3Lsm0KhA0HVfLbtmfhVVWg
	Y/HM9mDWiVVGBcy47lV5w6jJBAHOaSnj6pJ0fMGOaaPVheA1uA9utGv+uMKTN6ugov2jWG7ZeFKeE
	4chrUki1p9ju8S2RoeVrUVurbuX0++gmhCsHHoFhhCrlQBSOicuqIIgiMu7bUhYw6hsv321W/Nk7a
	Xxlb+GXbAD77PHxHaTLOvNPagnP8LtoikAviudps5Zxj68TWMDCmnxmfmu22eSyEezUEuPwGavsnT
	5r92YNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQ8-00000003v7j-2HJF;
	Fri, 16 May 2025 15:56:24 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwrx-00000003pgH-0abu;
	Fri, 16 May 2025 15:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747408859; x=1748013659; i=wahrenst@gmx.net;
	bh=echaWsMPgS84p2tKl50KjLXJo4dRcu5w0psGE99gbAM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JAVlELFPP+9MIMarxdcdDEkFyZo+DEM9kMQm3hLhTuEOQnl9ODaDIiOSSPr2cHrB
	 EDVOk4xgs/e5SNTDeBvx/ABtKA8TZEX9EE/U8bo2d8pN899EuCFd1zv5tPF3oFQYM
	 Sr8VpAFJIpYhoDymR/X/rsbCS8VBOhc+bj2IoDyaxbRMQ3dAHHXy59nCvEFgIvku+
	 vaX4ygL/7T2EM6eRsAn3IvC0htq8CpuKhsVv+L84+sAtc+Y2ZXdFlFNHXbxMKe+dP
	 Fd7+mfUcEoi4q0ljxp3uiTvoPIYiTQI8IUatLVh+BXvNJg26GfgCB6TvHPs3Qup/B
	 vxW/2kd7wFmKLqkTXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1uz9VP1uKy-013gDB; Fri, 16
 May 2025 17:20:59 +0200
Message-ID: <84336a0e-8758-4135-9e49-f8a106823964@gmx.net>
Date: Fri, 16 May 2025 17:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Searching for firmware timeout cause
To: Etienne Buira <etienne.buira@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
 <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
 <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
 <aCZqVzM5h9lwbfpQ@Z926fQmE5jqhFMgp6>
 <77f25ee5-1079-4729-866c-cfdeeff1ad9a@gmx.net>
 <aCdOooM5a_zx6MO4@Z926fQmE5jqhFMgp6>
Content-Language: en-US
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <aCdOooM5a_zx6MO4@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N5GdmUkWp3qWyxrYo13MHhYZl8+9IYmyPEhadeg74yXZxa8xscR
 4+ZW7lfDfh5+9L5ZfB/Hp656qWHKoQOZIfA3X1RQKgQWPNPomrDDLI4huhHIwoDLsne46MP
 AWVyFsYJmBvswHNMpBFMRO7R6HWkOmGVxqd0j2jhUnNvFerYdWAqmS4Kz4sKrvjgDs7/alf
 MF5RBPdpaG4Ya3mj+/IBg==
UI-OutboundReport: notjunk:1;M01:P0:4y/UC9Kh7ro=;lUmvYGdPcVIXsCCGTTq9Uh+M32z
 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
 y1p6qkNz4N82eE4h3FRMqFlWAz0E1g4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082105_504534_FB3697AE 
X-CRM114-Status: GOOD (  16.15  )
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

[add Phil & Raspberry Pi list, drop lkml]

Am 16.05.25 um 16:41 schrieb Etienne Buira:
> On Fri, May 16, 2025 at 01:17:41PM +0200, Stefan Wahren wrote:
>> Am 16.05.25 um 00:27 schrieb Etienne Buira:
>>> Hi Stefan
>>>
>>> On Thu, May 15, 2025 at 07:48:04PM +0200, Stefan Wahren wrote:
>>>> Hi Etienne,
>>>>
>>>> Am 15.05.25 um 13:48 schrieb Etienne Buira:
>>>>> On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
>>>>>> Am 15.05.25 um 11:44 schrieb Etienne Buira:
>>>>>>> Hi Stefan, and thank you for your interest.
>>>>>>>
>>>>>>> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
>>>>>>>> Hi Etienne,
>>>>>>>>
>>>>>>>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
>>>>>>>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
>>>>>>>>>> Hi Etienne,
>>>>>>>>>>
>>>>>>>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
>>>>>>>>> ../..
>>>>>>>>>> Out of curiosity and because i never saw this issue, could you =
please
>>>>>>>>>> provide more details?
>>>>>>>>>> There is nothing connected to HDMI 0 & 1 ?
>>>>>>>>>> Which firmware version are you running?
>>>>>>>> Please provide the dmesg output, so we can extract the firmware v=
ersion.
>>>>>>> Firmware version is 2025-02-17T20:03:07, i also attach the full gz=
ipped
>>>>>>> dmesg, as long as a patch of extra traces used.
>>>>>>> I did not specifically test other firmware versions for the timeou=
t
>>>>>>> issue (but i did for video output).
>>>>>> Thanks, i'll try to reproduce.
>>>>>>
>>>>>> Sorry, i forgot but is this reproducible with a recent stable 6.12.=
x kernel?
>>>>> Just reproduced with pristine 6.12.28.
>>>>>
>>>> okay, i've update the firmware on my older Raspberry Pi 4 to the same
>>>> version as yours. But even with your configuration i don't see this k=
ind
>>>> of fallout. So I think we shouldn't apply this patch until we really
>>>> know what's going on.
>>> Ok, thank you, did you make sure a powered hdmi sink were connected? I
>>> noticed there is no timeout if no hdmi is plugged (but there were when
>>> monitor were powered off, maybe specific to my monitor).
>> Yes, HDMI monitor was connected to HDMI 0 and powered on. Raspberry Pi
>> OS started as expected.
>>
>> The fact that your SDIO interface triggers a warning, which I also don'=
t
>> get let me think this is not just related to HDMI interface.
>>
>> [=C2=A0=C2=A0=C2=A0 3.603736] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D SDHCI REGISTER DUMP =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [=C2=A0=C2=A0=C2=A0 3.603739] mmc0: sdhci: Sys addr:=C2=A0 0x00000000 |=
 Version: 0x00009902
>> [=C2=A0=C2=A0=C2=A0 3.646852] mmc0: sdhci: Blk size:=C2=A0 0x00000000 |=
 Blk cnt: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.646856] mmc0: sdhci: Argument:=C2=A0 0x00000000 |=
 Trn mode: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.646859] mmc0: sdhci: Present:=C2=A0=C2=A0 0x01ff0=
001 | Host ctl: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.665697] mmc0: sdhci: Power:=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0000000f | Blk gap: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.672214] mmc0: sdhci: Wake-up:=C2=A0=C2=A0 0x00000=
000 | Clock: 0x00003947
>> [=C2=A0=C2=A0=C2=A0 3.678736] mmc0: sdhci: Timeout:=C2=A0=C2=A0 0x00000=
000 | Int stat: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.685254] mmc0: sdhci: Int enab:=C2=A0 0x00ff0003 |=
 Sig enab: 0x00ff0003
>> [=C2=A0=C2=A0=C2=A0 3.685257] mmc0: sdhci: ACmd stat: 0x00000000 | Slot=
 int: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.685260] mmc0: sdhci: Caps:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000000 | Caps_1: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.712672] mmc0: sdhci: Cmd:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x00000000 | Max curr: 0x00000001
>> [=C2=A0=C2=A0=C2=A0 3.719186] mmc0: sdhci: Resp[0]:=C2=A0=C2=A0 0x00000=
000 | Resp[1]: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.725708] mmc0: sdhci: Resp[2]:=C2=A0=C2=A0 0x00000=
000 | Resp[3]: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.732230] mmc0: sdhci: Host ctl2: 0x00000000
>> [=C2=A0=C2=A0=C2=A0 3.736724] mmc0: sdhci: =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [=C2=A0=C2=A0=C2=A0 3.819205] mmc0: new high speed SDIO card at address=
 0001
> Hi Stefan
>
> I think this warning is because there is nothing in SD slot (i boot from
> usb).
Okay, this was the reason why i wasn't able to reproduce. I usually boot=
=20
from SD card.

After connecting my USB SD card reader to a USB 3.0 port (not USB 2.0=20
port), I'm able to reproduce the firmware "timeout".

@Phil Do you have a explanation why USB 3.0 Boot on Raspberry Pi 4 could=
=20
cause such a delayed reponse (> 1 s) for Firmware transaction 0x00030066?

@Etienne Actually an empty SD card shouldn't trigger such a register=20
dump, but that's a different issue.

