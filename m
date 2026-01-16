Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53F6C98302
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa0+snq05PA6LQZljIwRr0Hddt3kF9aOaEZOA0BQCJo=; b=ah2xG6k+vG/x3UfF7UGlRZJVY7
	egQKcXcSjROoT3jF5xfrcF7jpLYFPvYaNL0N05+yagbunEEmXm2JHE00fU3TUNjmlrgnVGNPweO3D
	yW95oV1qya2OrihaeOCQW6v96dBK3cmZDaU4Pw8xrBQA1pT5kn7mDOKaBE1AOMC4JYfGXU/E+DHyS
	c62Q1fNY8M5UaFTUWLSUzYHMlPzE7gDXzMtf279jZLkwqMSUzHBLvonaoyz/Rr5Lur9MbyQaMuWc4
	W6i65N6EIPFMjbgXezog+fvd6sPhG9Fjr8+EsNyPxe6f6AWH1XdFJs4UeB+GgLq+xnCk2qehgB8IC
	bMJiFirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgpvd-0000000Eiyi-3zt8;
	Fri, 16 Jan 2026 19:56:17 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgpva-0000000EiyF-2U4D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 19:56:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so1089711b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 11:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768593373; x=1769198173; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aa0+snq05PA6LQZljIwRr0Hddt3kF9aOaEZOA0BQCJo=;
        b=VO7jV+IW1q6MehkIsDyrzPOwKAzdDOzauxHczNw2SELHfcghSh/s2BOHW+78N3S5tW
         XZzTwQ7BeJ1/2s6XXw1lhxelzO1Js+EPM0gUuWMmo1SEnbCBpZdRjqNA8TsS2oAzxeej
         a8V8Icip8HAp1/UQVz+EvcqqUVQPpWgYXykfA13oCkZ9QPE/uvArfyzDWqKi8dt1Xrsj
         wHp7sYqVP3Hy1IgVk5sIoR9xnpjTeEIOb4sB4wYsq2aqWYkkuRY33nx8nISt/KiCl8xr
         0YnVxC7n7D2zxL6/GOVtLjUlCYKW3cQfYsK/hPDHHbOl0OVNEoM8KA+r7cO8wOsDfCzF
         +RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768593373; x=1769198173;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aa0+snq05PA6LQZljIwRr0Hddt3kF9aOaEZOA0BQCJo=;
        b=Evi0TqdmRlfvQAhro7aH60eQQXCvpvRW5fXmZAgc2djCV4N9kYD07C0u8h5RVLB/he
         5u4zL2rxpKOofQF5GSdGHS4sOIpOx7rVr2kTU5/wqB+z3hrGq1kxQw1enkqr4m0p/6uq
         xV8vV4uNRy+Nqh3xCpmJlO4ddsoG2E3Olh9YfylKwTvhjfS1Lb9tkEdZ2x6uIl3k+Tr6
         6Tak1E4xz4EmfPOBRaR+oA5yzu5a35xPVAwBxeOhAbqA1Y75IJHNYohh/i6Gn2xndUqS
         fEZHiNNJH3Xqht7LagbA6Bjd0auVjLLhE7ZYvnOVSS5FvWY3hNCG7s1bbuztBK4J+qPw
         Y8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXkZN/KmsPltpIUDxB6TGKa3c2h8bixWjmHOCqHdxLMkhqqFJsH7uccdzzD6qYNElMp+dXMU7pjII1X2HgRvIJK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1EmNlVqjSuLYPzZvzzxe2SGzxuRcu6Ahd3ziahrk2HfOZSnKI
	mY2chBgEsynqpKCHw9ZoD473VMthn2gtLVG6hePhFZPxdRtanaJ5upsjd7aHynfROD0=
X-Gm-Gg: AY/fxX6xmYrcoRCqmlAZtBp/BrPSlTC0s198ngy91s2ziWFWksQDhb/F3DNxsIO5bDY
	tmeKSY77LwdL8t8bh6Of/RAvvz+FIAnV1IGTcaVVZ8prUnwUaYcP9f4r8rcRbTqkRLmEq/FuhUF
	xmWnBOf6aSxnoXsYaTr7S5AYYB2b/OO7jGju2/3KnBEAoOzC4Y685v+UxNvdZJbtn8408m73Mco
	5yH4VxONTxYNIe9qhtN7kDM/Jld4w6bl5B6XxQqrrf9x6MOmOi+2DYh+Pe30enLFxtcUqmUfwri
	i02B0cw6gwhdxdeNLvVOQx5iZe1iBQYXfxtDkCweccde32Hk9fY4zvS4B9VFmK+5Z2saoAphzNZ
	NMonghsPS9OKVc8VTkI0i+rUtsmlhv0cbF5DWEoPC7XeIp4GX1xMGaASKG7FCZWjVFDUdB76rLk
	qyA4gtNLao+bU6GfMHTnTWbPjrJUoYvI51NcW5yr41+/fRSqONg8DqPVdzMyL6NIr2p/8JR/8=
X-Received: by 2002:a05:6a00:2e04:b0:81a:b602:daf6 with SMTP id d2e1a72fcca58-81fa030a989mr3690746b3a.48.1768593372649;
        Fri, 16 Jan 2026 11:56:12 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa1291135sm2705239b3a.47.2026.01.16.11.56.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jan 2026 11:56:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <b3c81793-32f8-4b2c-a32d-bc90024580ca@amd.com>
Date: Fri, 16 Jan 2026 11:56:01 -0800
Cc: Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E28E6728-2FF2-4AD9-B2EC-89A917A23D6D@nexthop.ai>
References: <20260115003328.26095-1-abdurrahman@nexthop.ai>
 <b3c81793-32f8-4b2c-a32d-bc90024580ca@amd.com>
To: Michal Simek <michal.simek@amd.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_115614_643924_E5351CFC 
X-CRM114-Status: GOOD (  17.25  )
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



> On Jan 15, 2026, at 11:51=E2=80=AFPM, Michal Simek =
<michal.simek@amd.com> wrote:
>=20
>=20
>=20
> On 1/15/26 01:33, Abdurrahman Hussain wrote:
>> This makes the driver work on non-OF platforms.
>> Also, make irq optional, since the driver can already work in
>> polling mode.
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> ---
>>  drivers/spi/spi-xilinx.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>> diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
>> index c86dc56f38b4..9fb1da2fcce4 100644
>> --- a/drivers/spi/spi-xilinx.c
>> +++ b/drivers/spi/spi-xilinx.c
>> @@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct =
platform_device *pdev)
>>   bits_per_word =3D pdata->bits_per_word;
>>   force_irq =3D pdata->force_irq;
>>   } else {
>> - of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
>> -   &num_cs);
>> - ret =3D of_property_read_u32(pdev->dev.of_node,
>> -    "xlnx,num-transfer-bits",
>> -    &bits_per_word);
>> + device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
>> +  &num_cs);
>> + ret =3D device_property_read_u32(&pdev->dev,
>> +        "xlnx,num-transfer-bits",
>> +        &bits_per_word);
>>   if (ret)
>>   bits_per_word =3D 8;
>>   }
>> @@ -471,7 +471,7 @@ static int xilinx_spi_probe(struct =
platform_device *pdev)
>>   xspi->bytes_per_word =3D bits_per_word / 8;
>>   xspi->buffer_size =3D xilinx_spi_find_buffer_size(xspi);
>>  - xspi->irq =3D platform_get_irq(pdev, 0);
>> + xspi->irq =3D platform_get_irq_optional(pdev, 0);
>>   if (xspi->irq < 0 && xspi->irq !=3D -ENXIO) {
>>   return xspi->irq;
>>   } else if (xspi->irq >=3D 0) {
>=20
>=20
> I expect this is another IP which you are using on systems with ACPI.
> Can you share ASL fragment you use for testing?
>=20
> Thanks,
> Michal


Yes, that=E2=80=99s correct. We are using AMD Ryzen Embedded V3C48 based =
system with AMD (Xilinx) Artix 7 based FPGA using I2C and SPI IP blocks. =
The SPI block currently doesn=E2=80=99t have the interrupts working =
correctly (yet), so we disabled the interrupts. This is what the ASL =
fragment describing the SPI device looks like:

            Device (SPI0) {
                Name (_HID, "PRP0001")
                Name (_CRS, ResourceTemplate () {
                    Memory32Fixed (ReadWrite, 0x80950000, 0x00000200)
                })
                Name (_DSD, Package () {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                    Package () {
                        Package () { "compatible", =
"xlnx,axi-quad-spi-1.00.a" },
                        Package () { "xlnx,num-ss-bits", 5 },
                        Package () { "xlnx,num-transfer-bits", 8 },
                    }
                })

                Device (NOR0) {
                    Name (_HID, "PRP0001")
                    Name (_STR, Unicode ("TH5 Boot Flash"))
                    Name (_CRS, ResourceTemplate () {
                        SPISerialBus(0, PolarityLow, FourWireMode, 8, =
ControllerInitiated,
                            120000000, ClockPolarityHigh, =
ClockPhaseSecond,
                            "\\_SB.PCI0.GPP6.FPGA.SPI0")
                    })
                    Name (_DSD, Package () {
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "compatible", "jedec,spi-nor" }
                        }
                    })
                }
            }

Thanks,
Abdurrahman=

