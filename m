Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE0C98301
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0CbbXgsbOfBJ8N7OtD9ZcjSFwk0Z5dOnisL/uMONXk=; b=P1KGJLytpSuOZrIeQ69QjySGWu
	SRY0kzJYSxt+SKAm4cd0vAiSjg9IuSyAJbnKuoO+6nZ7VXbzd7wQxYaa22d/s/6f0idS1PJPTOlij
	gW735lxIVVoVLnapoN9ZBMc3qheMt8kyF92Oxg0lQeQ7TrAppu38YoP4iCnPRv5PIhKOaLQOvBKUZ
	BXAfS1C/2WhK+zm3VXan9Ls9JjA9syv7gc3yj3cxLh9PzlU/RxrsXEZMWtPKCvxgjC5uMB2imC+oo
	nZW5zi/iDbm9IvqxraWmOGTBSJUNQVMTghhpFE7WtuDH7jEOahPn6vcwOHGoawKXpaZttMfktJcDw
	kBYJw9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqBm-0000000Emzc-1VDA;
	Fri, 16 Jan 2026 20:12:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqBj-0000000Emye-47q3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:12:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a2ea96930cso15317955ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 12:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768594375; x=1769199175; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0CbbXgsbOfBJ8N7OtD9ZcjSFwk0Z5dOnisL/uMONXk=;
        b=CYD2V9QBjHQ2hf9m7N9QsEBi3vd4poHXVOzmAbD1CfaRf4wYy3aYYtTV4ezgcSwJSG
         m7PCPgSeaGmsTakgZyshDyq+7FW+kfXVrbnXFuA096uDY953Ttg3wQ2aAlH/92qdCJN3
         amaqh7xh2xsGDQE3LKkIemxbsJ8VfgPjCOxTBtv8GeKnv2GlerS3w2BF5xhI24+bNtBx
         XlizmeHjLZjeLCdw5p7h9TNmPS4mCX99L+wJXCZ+20kNRSWYe1K9kb6Z6ecvN3qaLldt
         6OTR2CaVw9yH/ota3ZLQ9AltET5wqG7s24eaMXz4vdC9/g9BySXv8uzjgFAIOtge/rAX
         Lf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768594375; x=1769199175;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0CbbXgsbOfBJ8N7OtD9ZcjSFwk0Z5dOnisL/uMONXk=;
        b=J74heNYn2v7LV2CkWm5uvtBKdW7HRAKLUbJ3z4bcLkfxWKBDEQP+TIlu1Mj1a13phk
         GKb51Py46YOI+A9xE2rDDv30M2/vqu8cuvkgHMeBcWXpp+mP2dMN/3XZXcm+X/1iJWOo
         5CCKA8bBdtqw6IbPO8OkzD4LPNIiG1ipIR+YcFC5SjHSGhY02EufOhJDx5cKeppxC4rL
         8FUWZnl86GXLWmd3ARF/v307KAyZUg/KoWOhqRteqtW99QkO8IfEJFGHALYnYKPT+My4
         4oZnuLKu+frtkUiEjnPa3K63h1DeklH3pZJtwbkh0HAJ2Z0AIB/eA9zp8/P7x2Rz6/4f
         A2YA==
X-Forwarded-Encrypted: i=1; AJvYcCVTbv9zCTRxCuRSAwmGNfOPaHC/5+NboxB+J9izMwZEQf35aZ52axIcX3VirLX8Ewe6XrAfxvpDXAEBwTnKLaGt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1nb7i30CRaahmCzJVmxwyVpoBcIHuSKE7G4TlrJLzaIdLvysv
	pqbudF0y1cs4U3mysPuE4nBl6CHoDfc19j5uNYG2Vqn/U9NEnADNJRPPxvC9gYqPmYcoK74ZILl
	h9lFLzNs=
X-Gm-Gg: AY/fxX585YCgCefHn+kH84NekDE9lZdJkeMExivOLmQYd9yKtvQGLiWgMh2EOZP3FJ7
	TRn0ynIHQo6ixaQajD+Ah31f24KS29RghzsvjiYvlpFPhhI76m0xsAsax9f0xv+7nXlz1hHwXQp
	/rOnIPk2ueJFs+bB1lw3qa11RG2/Zbc8p6sthIvUzUmxq4WxbYSFuxkQUMjtNHT2rFr+lQr/J/Z
	uymkVDiGdEvX02HQBEAxnplK4YdwtPWBcuGmr+YyMHwOQsZpvImW9+N1lhD2F9egMHf5Imqhld9
	2PbWOxRF2dZYMmKtg0AzG+JJmUqaflZyyNGb6TDv9gJSOPjnrGE4FTBzWAoFAu6s4/833sUn/lL
	uLkzUXIxDHd+rV+hCTSeO6G1AW4aAb4lXTRwo/k2mhWYnnEZ8E7mIKD59kM30OBmdU0OXbnTcd9
	0BBnRPtVjprHwRjlAqmY8N4lFxH+rKqvi+xxe6DrUdHP7G070phG8gsuEoAW9NgxN6NQzqwN8=
X-Received: by 2002:a17:902:da8d:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a71751a47cmr39358445ad.4.1768594374971;
        Fri, 16 Jan 2026 12:12:54 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm27613535ad.88.2026.01.16.12.12.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jan 2026 12:12:54 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] i2c: xiic: add ACPI support
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <4c3f28e1-69a2-410b-abe7-ed163e97eedd@amd.com>
Date: Fri, 16 Jan 2026 12:12:43 -0800
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C89C33BE-55F1-4588-ABFC-EE9B79FBAC0D@nexthop.ai>
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
 <aWjlTKrM34lfDsfC@shikoro> <AAB5CE7A-9264-4CE1-8A49-2FD3043B0A80@nexthop.ai>
 <4c3f28e1-69a2-410b-abe7-ed163e97eedd@amd.com>
To: Michal Simek <michal.simek@amd.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_121256_032501_B8580750 
X-CRM114-Status: GOOD (  12.14  )
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



> On Jan 15, 2026, at 11:30=E2=80=AFPM, Michal Simek =
<michal.simek@amd.com> wrote:
>=20
>=20
>=20
> On 1/15/26 20:04, Abdurrahman Hussain wrote:
>>> On Jan 15, 2026, at 5:02=E2=80=AFAM, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>>>=20
>>> On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
>>>> Use generic device property accessors.
>>>> Make the clock optional assuming it's managed by firmware.
>>>>=20
>>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>>=20
>>> On which hardware has this been tested?
>>>=20
>> This was tested on nexthop.ai data-center NH-4010 switch with Xilinx =
based FPGA.
>> The following ACPI ASL fragment was used to describe the device:
>>             Device (I2C2) {
>>                 Name (_HID, "PRP0001")
>>                 Name (_CRS, ResourceTemplate () {
>>                     Memory32Fixed (ReadWrite, 0x80a40400, 0x00000200)
>>                     GpioInt (Level, ActiveHigh, Exclusive, PullNone, =
0,
>>                         "\\_SB.PCI0.GPP5.FPGA") { 10 }
>>                 })
>>                 Name (_DSD, Package () {
>>                     ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>>                     Package () {
>>                        Package () { "compatible", "xlnx,axi-iic-2.1" =
},
>>                        Package () { "single-master", 1 },
>>                     }
>>                 })
>>             }
>=20
> can you share more details about cpu and bootflow?
>=20
> Thanks,
> Michal
>=20

Hi Michal,

This is an AMD Ryzen Embedded V3C48 platform with Xilinx Artix 7 FPGA =
with multiple I2C and SPI IP blocks.

The FPGA sits on PCIE bus and has all the IP blocks memory mapped. I2C =
blocks also generate PCI MSI interrupts and we have implemented a custom =
irq_chip/gpio driver that creates the irq_domain hierarchy.

Adding these changes allowed us to benefit from the existing ACPI device =
enumeration in the kernel and re-use the existing drivers.

Thanks,
Abdurrahman=

