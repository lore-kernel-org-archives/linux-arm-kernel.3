Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1603CCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rq/mqDmZq8gMZ+d2R8pkO8FovF44UTPXxgcytXXSxc=; b=pqYSOTIDvVB2CrNN1HzIUm8W80
	DFwiKsYNBZy1T8ZTZFf1Zr09zNnMBuyiwUZMlFSbrVGeUnXfP/uTvtSmEyMwxdxT52sXT8/vYmGIh
	L8NvKq3LOQLJdWJGBawEP5/RrHJhI6Khqv4yLMUfoDWpAzfZ3A74XqlZMQccAraIGwjy8h+fEvoY1
	LiLcN0gVTFN6JuspXvPzLGeElr0eFXwOkE+7zSE36cABOxBzcpmuxiFj/ONFasZUBe7GZgR+I0BCw
	96tAl+044Qpx04fYyoZzWvKK39VOfXAOB+j+HVUN6jjuXQOJhSk0pC+1KCu7ePrd2WVpCzIKU26sP
	qxcK3USA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhulp-00000002lNP-2ONC;
	Mon, 19 Jan 2026 19:18:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhulc-00000002lJ6-3mjE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:18:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0833b5aeeso47002755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768850304; x=1769455104; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rq/mqDmZq8gMZ+d2R8pkO8FovF44UTPXxgcytXXSxc=;
        b=LGwaUI8Cbh57UrDvogfTd8YIVX0JVLt5PCFFRl2HzZ2poWkLFcxaVHy+JDKKXyrIBf
         NRY9Q+Rgy9/zZj3T93Q6cPnU8laQNoyUhozHint4hYVV2JrQ/Vgy5f+EoKzSqWv4l12E
         UtadkaWFz9anKP31qCaMbfBfB3Iw8STqi10rDXPp2FtvS/PkMmxJ4TTvPSsANRi0RPQM
         RwIB/HV9OOTVMfxce7Tyqk8TSmsvU5qrgf7xS7XERhTUZr9QaIjnGAmjBc67ZKLxAoo3
         NDE0DhrPFC5U4JSYNVd1ZzkV6c1vtoaT7EiE/lrX7wVsOxWvn9vTMnXwt4E5vhB9FvX3
         shkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850304; x=1769455104;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rq/mqDmZq8gMZ+d2R8pkO8FovF44UTPXxgcytXXSxc=;
        b=wXLFD8QJUfPtOC1yQ03ihH6yop6yCvwqEDjZfXyoqhR9i8Bu96uiixtWskrJQSy8D/
         sRYVOIvnQBvQiPoB4A+7A/OELB1ZmVEWXvuotMAhcPJersxgFpf7P63WV+GgUXbdbo+g
         CRSsbUCPPTMbbicHvHiUEqYfGtOOfpVjLOBkXtwVePVIwYUpvm5zn1qYSU/UYV4AJ2Ev
         T5CwttJjBIlPcpS8ci9FgthSCeLC136K8XSkZHqQU3oUn68JgnwE48Ar9mf/nRKu28jo
         +D4nqZfEN9kv3hdr+xW8gAEXSlt26Ft/pRDEcGkL70QfZhSr+aKaIee7gQbmJillhb/c
         fbSw==
X-Forwarded-Encrypted: i=1; AJvYcCXL6TQUuF1st+1g3A6N0Nxq7XhStN1FgKub+ORq5oLADmUzj6z2RknoCGnCD1UUKx+Y88bsRBXtLtdmTG2G/P07@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxh1GzxEL6+cYt3Zc2fGDqhEDYYi38EkM3Pxy8NzVSLnJYbXPh
	6E7ZZkfJeT1xLpKBv48bL6hHXqkrnVeHyGp7C7OtDuyukRd5hkP6dl7TM7R2XB5MdeY=
X-Gm-Gg: AZuq6aI9QiucQ4c9Tl4HY0jyXziXdds96GaLutQ2t6qn5+TvgODYnKhOQG0eG7Bch/9
	PrSfmV0w4zfIhCCWnA77Wla66cSI+Q7FxlrmH/XiMsXK7RU/640fziUeVsu2/L/8R7wl6sjkkmg
	VzI5/J04jkdhZe59CIEJT8MMVAe/Yf+qZdnW3YzHdAM5PnvRem8oSPINhCrX8gI/gkqwExkhhz/
	vrvQJ/hyI8SVIfN+P3iBsT969U5JhQ+WaZ/N3Wcs6hK49gYwuL+f427HUzpZ1dCFEpAQH+JjiIG
	bmIMn3WFdufUJi3hIO3Z930rwqUO2Oi6XHEiuVE/hBYmsU75fehAXCe5Op6pi+dcz6Phbxx2zs0
	7sNTBWJyOeFK4FtL/QaIvSj3Y9A7VOdTq3R6cMApd45bLtV5RqRA21audqIiusd/BhwwbCp0Hdl
	58SgO8d+2VSPU4+e9K6QtTcg62uVTPRxjpoJ9enUfR4nmqSlljNl00dFNz
X-Received: by 2002:a17:903:2446:b0:2a0:af76:f8cf with SMTP id d9443c01a7336-2a71885839cmr129978275ad.2.1768850303599;
        Mon, 19 Jan 2026 11:18:23 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8701:f0de:dc5c:239b:cee7:ca39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dbebasm103144495ad.55.2026.01.19.11.18.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:18:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
Date: Mon, 19 Jan 2026 11:18:12 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <31207BE9-C83F-4B4D-9A3F-7F25DF574E89@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
 <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
 <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
 <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
 <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_111828_838547_90C35A64 
X-CRM114-Status: GOOD (  25.89  )
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



> On Jan 19, 2026, at 11:01=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Mon, Jan 19, 2026 at 07:52:35PM +0100, Michal Simek wrote:
>> On 1/19/26 19:38, Mark Brown wrote:
>=20
>>> This was specifically targetted at some embedded x86 systems where =
there
>>> was a goal to reuse device tree bindings for things that just can't =
be
>>> expressed well in ACPI.  _DSD is generally considered tasteless for =
more
>>> server style systems, AIUI the general approach preferred by ACPI
>>> forward OSs is to use some combination of DMI quirking and =
registering
>>> with a per-device ID (like the per generation fake PCI IDs that =
Intel
>>> uses for all IPs on their SoCs).  Just blindly accepting _DSD can =
end up
>>> with something that's not used because it's not what the ecosystem
>>> wants.
>=20
>> Is it a better way to use auxiliary bus as was recommended by Greg in =
past
>> on drivers/misc/keba/cp500.c review?
>> =
https://lore.kernel.org/linux-i2c/2024060203-impeding-curing-e6cd@gregkh/
>=20
> The driver there appears to be doing runtime enumeration based on some
> EEPROMs on the system and creating platform devices based on what it
> finds there so it's a bit of a different thing, the aux bus suggestion
> is about what the code that does with the data it got from the EEPROM.
> This patch is for something described directly by firmware so there's =
no
> way we'd create an aux device, that's purely in kernel.
>=20
> I have no idea what the hardware this series targets is (other than =
that
> it's using a FPGA) or if there's even a motivation for the change =
other
> than code inspection.

We are using this on an AMD Ryzen Embedded V3C48 based system. This is a =
data-center switch using Broadcom TH5 ASIC with 64 port OSFP cage and a =
whole lot of hwmon/pmbus and temp sensors. We have an AMD Artix 7 based =
FPGA that sits on PCIe bus and exposes about 80 different IP blocks (I2C =
and SPI). Behind each IP block are various devices. Each of the 64 OSFPs =
is handled by its own IP block (i2c-xiic.c driver) and is wired to one =
of 3 MSI interrupts.

We have implemented a custom irq_chip/gpi driver to manage the =
interrupts.

All of this gets automatically enumerated by kernel and works today, so =
there=E2=80=99s strong motivation to get this merged. It=E2=80=99s not =
just for code inspection. We are currently using 6.12 kernel.


Here=E2=80=99s an example of what a SPI controller/device would look =
like in ACPI ASL:

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

And here=E2=80=99s an example of I2C controller with a TMP sensor:

            Device (I2C6) {
                Name (_HID, "PRP0001")
                Name (_CRS, ResourceTemplate () {
                    Memory32Fixed (ReadWrite, 0x80a40c00, 0x00000200)
                    ClockInput(25, 1, Mhz, Fixed,,)
                    GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0,
                        "\\_SB.PCI0.GPP5.FPGA") { 14 }
                })
                Name (_DSD, Package () {
                    ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                    Package () {
                       Package () { "compatible", "xlnx,axi-iic-2.1" },
                       Package () { "single-master", 1 },
                       Package () { "clock-frequency", 100000 },
                    }
                })

                Device (TMP0) {
                    Name (_HID, "PRP0001")
                    Name (_CRS, ResourceTemplate () {
                        I2cSerialBusV2 (0x48, ControllerInitiated, =
100000,
                            AddressingMode7Bit, =
"\\_SB.PCI0.GPP5.FPGA.I2C6",
                            0, ResourceConsumer,,)
                    })
                    Name (_DSD, Package () {
                        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                        Package () {
                            Package () { "compatible", "ti,tmp464" }
                        }
                    })
                }
            }=

