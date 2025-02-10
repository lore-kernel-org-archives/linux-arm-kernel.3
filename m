Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E071C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKHQGiz4NvdJKvoQkxoIKdTM8jzHy4P7c1SlQXpBIUo=; b=cKjqQtEK7sFUjRX+f0p8nkYJgA
	pF1AtKCWPmsmq+bz/5WtitOPdRe5d23IkYr67fpiAPbe72mb6RE2ZjA8Fg+wJWDjE3VyEXI0yxYQp
	PrbMlcCigFWkhuj4cppFyp4YKgmnxGkAmZdcAyw2de5h3/5OJluwln9YVcrsPJ96TVUqhGqvjycx+
	uOXaROxvMWpQ2ArkZ/RrETZXzwg94FpEfcJ9r4DPeabJcrLlY+XG8fEa55P9/DN/Yu7rTNT1Hmh6b
	xgCsOh0V2n88EwZxZI6G/Y9a4EL12b5pnQ9uX0aPBG9NzEm+A8zW7FxOtPHP0tnEsyPtMB3zsNopX
	xh8hJmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thREz-0000000H3rB-2dgx;
	Mon, 10 Feb 2025 10:42:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thR86-0000000H23p-0qRx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:35:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dc33931d3so1714088f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739183704; x=1739788504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FKHQGiz4NvdJKvoQkxoIKdTM8jzHy4P7c1SlQXpBIUo=;
        b=2ttxjmmn6nJQs6SbjPUSA/GTmJg/mtn3r/0hE+Y0qNYIhAWyJL7C5R4yqa7+WJTELI
         BJ8xOBzamzeUKVwAyeAybSxLI8daGNBikDObTNky1JflnzXd4LMRdI1Fz4c8vP3ptL8L
         0kKxlyVe5tvkwr7TbyRI50eJw9OLMzek+kJHOITFoNMRVDlrQsYXRe2huoeMw0de4Kej
         5c90nO2JlzdNWa/1DJKVEgntFShAd99Fr1M6rzRHsmlvYTCJX7KVAAbFjtbQYRozMXG3
         EYYlq1Gvedvmtmx6cj+RtkGxYMeeMa9dGSvnC8T6thn0jyolebK5RkYDIb/pAvEM84sg
         H9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183704; x=1739788504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKHQGiz4NvdJKvoQkxoIKdTM8jzHy4P7c1SlQXpBIUo=;
        b=kdlf9tUPRI8mHWo4O72uHfXPop25u7n7zDaj1R50dKRg4na0wB+MAQMHHOVOs1dbHb
         zxo9gsHa3E7WqH6Nh1K7mUlkytS6ujhp/e1uIaZdo5ceUcGensRU1FLsAavY+TmZt5hN
         HbYF+uo05J2kdPTXDC2fq7z+mTQY7QCoV6uYpbnanBSn0rkFvvIyYPaz4tQkN2J6C3Hs
         e8VDtDap74q4U5SYBfgXVQ+KkOSwdAKC8cLTNpa3AAEp6qAzz8F1CVwfXS21yi+Q+yfA
         uI9eEDMD9+YuypsszqEOqiL3jrIwgP2EAkr1hmqvXvHf3oR1HBG3GCUkLu5qjAQety8i
         +VVA==
X-Forwarded-Encrypted: i=1; AJvYcCXUuHSvqmo56NONUkQ0GU8BPyxeGwZQh/PFdvl+1V+txLr2AXkxKCxJMRW9szsLCNDUp7iqsC4aQzNW0mwXuUk+@lists.infradead.org
X-Gm-Message-State: AOJu0YzEY3dVLASJTAN9ESkCJ4U14onRweMOzxQ/pGo8LqdeDh+t8L8j
	zYbWk7acz4Pzy1cZhEx8VNfZqdF4VupHjp5e/sAO6LvE0ScLZ1fjRSqeSqeed+M=
X-Gm-Gg: ASbGncvUD/6+ltgDgohqBYQiMz0E7eZ+DPVkNEuAPMEUugixxT4913PkiKrxo8fW0of
	tsrjyV8xja6OP0LleE5e+76Tt9MBv7NF0MqSRZ5Q9yVLOiOKxh1b0abKMXCtsbDomrJEfhzdF/1
	5ufuKYqTw7W1yi7Ng5emWKHGJFfnUlr+CxbUiGrr0J1BAWZxfzQFUBtKKdjRoY3RMBZSq/t/HsO
	dNJh0/aZ5T7rG2JXKGGWRG86PvZw3NA9sYtHoMPzfrU4SeNn2fJ9Qn6yHKT+7FgylMXg1Kw3vW3
	0HopGQl5ddc=
X-Google-Smtp-Source: AGHT+IHKim6S0iEjpZOEjy3a/KC7HiRIjGC/bGpVkjiZAMbE9UQaktsqw2nc2F1sjGddVlO41Rt5wA==
X-Received: by 2002:a5d:64ef:0:b0:38d:e078:43a4 with SMTP id ffacd0b85a97d-38de078468amr1563145f8f.31.1739183704186;
        Mon, 10 Feb 2025 02:35:04 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd8dee385sm4753869f8f.61.2025.02.10.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:35:03 -0800 (PST)
Date: Mon, 10 Feb 2025 11:35:02 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
Message-ID: <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b4zifexupykrpb7u"
Content-Disposition: inline
In-Reply-To: <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023506_441559_E1FEBE37 
X-CRM114-Status: GOOD (  53.35  )
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


--b4zifexupykrpb7u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
MIME-Version: 1.0

On Sun, Feb 09, 2025 at 01:21:27PM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2025 15:40, Markus Schneider-Pargmann wrote:
> > Hi Krzysztof,
> >=20
> > On Mon, Jan 27, 2025 at 01:09:49PM +0100, Krzysztof Kozlowski wrote:
> >> On 24/01/2025 23:35, Andrew Davis wrote:
> >>> On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
> >>>> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
> >>>>> Hi Krzysztof,
> >>>>>
> >>>>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrot=
e:
> >>>>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargma=
nn wrote:
> >>>>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DD=
R pmctrl
> >>>>>>>> register in the wkup-conf register space of am62a and am62p. This
> >>>>>>>> register controls DDR power management.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> >>>>>>>> ---
> >>>>>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> >>>>>>>>   1 file changed, 2 insertions(+)
> >>>>>>>
> >>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>>
> >>>>>> Un-acked, I missed the point that you really speak in commit msg a=
bout
> >>>>>> register and you really treat one register is a device. I assumed =
you
> >>>>>> only need that register from this device, but no. That obviously i=
s not
> >>>>>> what this device is. Device is not a single register among 10000 o=
thers.
> >>>>>> IOW, You do not have 10000 devices there.
> >>>>>
> >>>>> Do I understand you correctly that the whole register range of the
> >>>>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dt=
si
> >>>>> should be considered a single syscon device?
> >>>>
> >>>> I don't have the datasheets (and not my task to actually check this),
> >>>> but you should probably follow datasheet. I assume it describes what=
 is
> >>>> the device, more or less.
> >>>>
> >>>> I assume entire wkup_conf is considered a device.
> >>>>
> >>>>>
> >>>>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
> >>>>> subnodes defined of which 4 of them consist of a single register. M=
ost
> >>>>> of them are syscon as well. So I think I can't change the simple-bus
> >>>>> back to syscon.
> >>>>
> >>>> Huh... Maybe TI folks will help us understand why such design was ch=
osen.
> >>>>
> >>>
> >>> Many of the devices inside the wkup_conf are already modeled as such.
> >>> Clocks and muxes for instance already have drivers and bindings, this
> >>> is nothing new to TI.
> >>>
> >>> If we just use a blank "syscon" over the entire region we would end up
> >>> with drivers that use phandles to the top level wkup_conf node and
> >>> poke directly the registers they need from that space.
> >>>
> >>> Would you rather have
> >>>
> >>> some-device {
> >>> 	ti,epwm_tbclk =3D <&wkup_conf>;
> >>> }
> >>>
> >>> or
> >>>
> >>> some-device {
> >>> 	clocks =3D <&epwm_tbclk 0>;
> >>> }
> >>
> >> How is this comparable? These are clocks. You would have clocks proper=
ty
> >> in both cases.
> >>
> >>
> >>>
> >>> with that epwm_tbclk being a proper clock node inside wkup_conf?
> >>> I would much prefer the second, even though the clock node
> >>> only uses a single register. And in the first case, we would need
> >>> to have the offset into the wkup_conf space hard-coded in the
> >>> driver for each new SoC. Eventually all that data would need to be
> >>> put in tables and we end up back to machine board files..
> >>>
> >>> I'm not saying every magic number in all drivers should
> >>> be offloaded into DT, but there is a line somewhere between
> >>> that and having the DT simply contain the SoC's name compatible
> >>
> >> That's not the question here.
> >>
> >>> and all other data going into the kernel. That line might be a
> >>> personal preference, so my question back is: what is wrong
> >>> if we do want "1000 new syscons per each register" for our
> >>> SoCs DT?
> >>
> >> Because it is false representation of hardware. You do not have 1000
> >> devices. You have only one device.
> >>
> >>
> >>>
> >>> (and the number is not 1000, scanning the kernel I can see
> >>> the largest wkup_conf region node we have today has a grand
> >>> total number sub-nodes of 6)
> >>
> >> But what is being added here is device per each register, not per feat=
ure.
> >=20
> > The register layout is like this:
>=20
> The register layout of what? How is the device called? Is datasheet
> available anywhere?

Yes, it is available here: https://www.ti.com/de/lit/pdf/spruj16

14 Registers
14.2 Device Configuration Registers
14.2.1 CTRL_MMR Registers
14.2.1.1 General Purpose Control Registers
14.2.1.1.3 WKUP_CTRL_MMR0 Registers

Each domain has their own set of general purpose control registers,
CTRL_MMR for the main domain, MCU_CTRL_MMR0 for the MCU domain,
WKUP_CTRL_MMR0 for the wakeup domain.

So I understand this to just be a collection of general purpose control
registers. If you go by feature, then many of the registers can be
grouped into units with a specific purpose or controlling a specific
device which are also grouped by the offsets they represent. I assume
this is why the other nodes in this wkup_conf node were created. Also in
my opinion this makes the relation between the original device and this
general purpose control registers better understandable.

For this patch the ddr-pmctrl regsiter is just a single register, but it
has the purpose of controlling the DDR device power management.

The other patch I posted is a collection of registers for the
CANUART_WAKE functionality. CANUART here is a group of devices CAN and
UART devices. Thes also have a specific purpose for a specific part of
the SoC.

Best
Markus

>=20
> >=20
> > 0x8010 - 0x803c contains 4 clockselect registers
> > 0x80d0 is the DDR16SS_PMCTRL regsiter
> > 0x8190 - 0x8600 contains another 7 clockselect registers
> >=20
> > I see the feature here in the block being clockselect registers. But the
> > ddr-pmctrl register doesn't fit into this so I opted to describe this
> > single register as one node as it looked to me like one feature. Of
> > course I would have preferred this to be different but it is not. Would
> > you prefer the clockselect registers and the pmctrl register to be
> > described as one syscon?
> No, because all the time you speak register=3Ddevice and all the time I
> was explaining that this is not correct. Device is the collection of
> registers. I already said it - entire block is the syscon, not one
> register in the middle, not 2 registers in the middle, not even 4+7
> registers in the middle.
>=20
>=20
> Best regards,
> Krzysztof

--b4zifexupykrpb7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ6nWUQAKCRAkjLTi1BWu
P62YAQC5oHGYjbucmodxxZp43puq++YDD8IuLKHSlRmG3XZyVwD+O7zUo7ZPRJN3
lAswQmm8oSeEBuky8oFV5/4ybaApDAE=
=siEO
-----END PGP SIGNATURE-----

--b4zifexupykrpb7u--

