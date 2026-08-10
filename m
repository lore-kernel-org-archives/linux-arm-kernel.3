Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F56C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0lggjtUq7t4FnGr3h+/8GK5Aapn1d7YcvCZUb9d1Uc=; b=NDWeNX34AT9kDsFuZ3FKcu1NoA
	kSmrojAGY4zI1YP+qhRpOoI+epfW+qG5V0Vxy7ylqEW/0OU1IoHrP9t/PvEQ2mQPH8+1sCSerSX6L
	iKFo5dtUoXCDMiiGcpthwbi1ncM2ehXdhoB/ry9a/p1z7hzo6lki8O2oeLKWH7Cj/zqD/FCP0u7mo
	yCdZg1UBlFWvB09GPp+LqgSrIHFosUy0iGJ9+GdM37Sac2sliIndFDu1YQbEN3xRI6fYOAw8oN4+6
	YH5T6o0qg0j1C7lXNWu8gtbvq5kOzPscyNjGJZo0yD+v1U+xXGtfu0eGGX3bCkc70l6YxDXOYZT2q
	Oh63ywMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUm2-0000000Cdab-2ldd;
	Mon, 10 Aug 2026 18:30:58 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUlw-0000000CdZw-3Jxx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:30:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786386626; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mz82WlIZan4fdradr0G0GV3tyuUfiq4KtXMHRclOx5h0EVDg/01VH3IXOSMdBKq0Nz
    RpA2X6GcOkMpsV1v1b2PtMoe1oID9L4A28OzKnTkCaM8b8im7d/V7bG0bMa9WAhMdMcE
    MWuULX81LacRG2Ro1KCA3TsNPHiRfdYwllSQPVRrgrovLJGw4OwVZF/Ps8CW1uKgaWGL
    4Z9tMoINerl59ecIOopZlH2yS7wibGsEem3VRKaRlxq7RMfncpMqYM0TysUUcNyHaC3e
    WYdkO9bs9z1YA5XiTusw4BwJLKjAY1BRWJVk6ysU3GM3gUHW+i+D7EgXOybYJ8pVKg/R
    iCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1786386626;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Y0lggjtUq7t4FnGr3h+/8GK5Aapn1d7YcvCZUb9d1Uc=;
    b=BdNoX7e1nAB5IzdQHcDbAB/bVxkFYnYZPy2aXCmx7pyjhGMj/Vhmoje+EmZmFkecrz
    le3csCEPySzasspnAyAExXrFw7WKX9zfAFHm+CDuy87JN9xRoNjYUOGSzclHKL04+XcM
    1tVcABBIoW2vRl0CCs0fBIkyJ6FlghaOgboTL/htO1ER2dZEpyRxKHXb+3lX9ht6ocOJ
    REYZKmzeoT/m/N+DiGZv5W1JibEDPMzB0CVBcqzuxFOHWViLBQZ3+RWOkHnjm7t4yLpJ
    Jw3fdXqOU/qXnDSXW3qDYk4KcMfwD/nZdPDxq6tWwz/mHvJfiR+74tt7bs7JTQIwBRJ/
    DRaA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1786386626;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Y0lggjtUq7t4FnGr3h+/8GK5Aapn1d7YcvCZUb9d1Uc=;
    b=ljQniUtzrPH2m+M6l4jZSMuX3O3WCuc1I+Sflkhg2jefmDsFT2nV3M/ziNtjNlhZmX
    jYY4ZIVVXURLDIuLDbsEU07ahP6eDA0Jw+AriHYveH3AGK4tyN1UVFhy37+Ep67gTtsS
    ZnNLw5Pw7prMoJDHCc/Y8SEsiw4H4C1bE6NngaNLkN5VHq3hoN4qpZmqc2kpESB0t/lh
    tQWTMN0GUu1F8OMtWpzp8HsZkaGZ4xMHp254c0XM6mtuCxaTWjgkg6qGrnDdDC4GhU6r
    aPgkjOT32puRm7n+XWHTqng9V9ae3jXi05R1lXZlIOfcUZWLCMYbLh46sPOx6MsDtRA1
    OXdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1786386626;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Y0lggjtUq7t4FnGr3h+/8GK5Aapn1d7YcvCZUb9d1Uc=;
    b=dMb3aEkL+xg1cxalBAaM/8Z1E2miIaNANpAVl9947lRoZbqdOKy8hsYWLsSfEjREKF
    jZP6rL2OFErxCAB+VkBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrTipoGmsiNZ9v/oGyp26o/Wi+pVFrZX1Db5b3z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q58eac27AIUNiJm
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 10 Aug 2026 20:30:23 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH 15/16] backlight: remove pandora_bl
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <2C9844A3-3C4C-48E6-863D-BF8328CEE540@goldelico.com>
Date: Mon, 10 Aug 2026 20:30:13 +0200
Cc: Daniel Thompson <danielt@kernel.org>,
 Grond <grond66@riseup.net>,
 Stefan Leichter <sle85276@gmx.de>,
 Grazvydas Ignotas <notasas@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Sen Wang <sen@ti.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com,
 mfd@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <92FE1162-8C61-4186-B073-6AB4B2BDA640@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <f897f695c0e1e128d7ebb41be8dfdce4d634f552.1783749722.git.hns@goldelico.com>
 <anmpiADsvzW39DNx@aspen.lan>
 <DA9588C6-0238-4713-B1A1-CB2123F02028@goldelico.com>
 <20260810143914.64d29a5c@kemnade.info>
 <2C9844A3-3C4C-48E6-863D-BF8328CEE540@goldelico.com>
To: Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_113053_100753_46868F9F 
X-CRM114-Status: GOOD (  29.80  )
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



> Am 10.08.2026 um 15:23 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 10.08.2026 um 14:39 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>=20
>> On Mon, 10 Aug 2026 12:45:16 +0200
>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>=20
>>> Hi Daniel,
>>>=20
>>>> Am 10.08.2026 um 12:35 schrieb Daniel Thompson =
<danielt@kernel.org>:
>>>>=20
>>>> On Sat, Jul 11, 2026 at 08:02:02AM +0200, H. Nikolaus Schaller =
wrote: =20
>>>>> Retire the platform specific pandora backlight driver since
>>>>> it can now be replaced by twl_pm and device tree.
>>>>>=20
>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com> =20
>>>>=20
>>>> Yay!
>>>>=20
>>>> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> =20
>>>=20
>>> Well, there were some good comments by Sahiko to the prerequisites =
of this patch,
>>> because it has one speciality the PWM BL driver does not handle =
(avoid
>>> interpretation of PWM signals as W1 protocol).

Here is the report: =
https://sashiko.dev/#/patchset/cover.1783749722.git.hns@goldelico.com?part=
=3D15

>>>=20
>>> I haven't found time to work on this, so we can't remove this yet.
>>>=20
>>> In the end it may either remain a pandora_bl driver (converted to =
DT)
>>> or become a patch for something else.
>>>=20
>> But then it is a TPS61161 on top of PWM, not a pandora driver.
>> And then there might be just a quirk for that chip in the pwm_bl =
using
>> triggered by a compatible. I guess the quirk is this:
>>=20
>>=20
>> if (priv->old_state =3D=3D PANDORABL_WAS_OFF) {
>> - /*
>> - * set PWM duty cycle to max. TPS61161 seems to use this
>> - * to calibrate it's PWM sensitivity when it starts.
>> - */
>> - twl_i2c_write_u8(TWL_MODULE_PWM, MAX_VALUE, TWL_PWM0_OFF);
>> -
>> - /* first enable clock, then PWM0 out */
>> - twl_i2c_read_u8(TWL4030_MODULE_INTBR, &r, TWL_INTBR_GPBR1);
>> - r &=3D ~PWM0_ENABLE;
>> - r |=3D PWM0_CLK_ENABLE;
>> - twl_i2c_write_u8(TWL4030_MODULE_INTBR, r, TWL_INTBR_GPBR1);
>> - r |=3D PWM0_ENABLE;
>> - twl_i2c_write_u8(TWL4030_MODULE_INTBR, r, TWL_INTBR_GPBR1);
>> -
>> - /*
>> - * TI made it very easy to enable digital control, so easy that
>> - * it often triggers unintentionally and disabes PWM control,
>> - * so wait until 1 wire mode detection window ends.
>> - */
>> - usleep_range(2000, 10000);
>> - }
>>=20

Exactly. The Sashiko comment to this section was:

When switching to the generic pwm-backlight driver, how is the TPS61161
initialized into PWM mode? Because the TPS61161 shares its EN pin for =
both 1-wire
EasyScale digital control and PWM control, the removed pandora_bl driver =
included this
hardware workaround to force a 100% PWM duty cycle and sleep for 2-10ms =
at
startup. Without this initialization pulse, could the TPS61161 =
misinterpret the initial
PWM signal as a 1-wire EasyScale command and disable PWM control, =
preventing
the backlight from turning on properly?

Well, I didn't see this but it would be on the safe side to have it.

>=20
> Yes that is what I mean. It needs to be ported somewhere. If it can be =
ported to
> some compatible =3D "pwm_bl_for_tps61161" or what fits best it will be =
fine. Or it
> could be in some compatible =3D "pandora_bl" driver.
>=20
> Has to be worked out when the development machines are not blocked by =
3 or 4 other
> projects already running in parallel :)

Nevertheless I did a quick look into the pandora_bl driver structure.

Here are my findings:
- the code fragment is part of pandora_backlight_update_status()
- priv->old_state remembers if brighness was set to 0 or not
- so this code triggers on any change from bright =3D 0 to bright > 0
- the pandora_bl driver is the only one to use TWL_MODULE_PWM besides =
twl-pwm

So the most natural way of transplanting this appears to me:
- add this logic to the twl-pwm driver
- add a propery to escribe this special need (e.g. "disable-easyscale")
- use this to triger the extra code in case this flag is set
- and if the pwm duty cycle changes from permanently off to real PWM
- this should obviously go into twl_pwm_config() to detect through =
duty_ns
- alternativey it might be possible to handle everything in =
twl4030_pwm_enable

Suggestions welcome.

BR,
Nikolaus


