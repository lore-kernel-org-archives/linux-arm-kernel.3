Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E8AC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tfbbzkMLJ4su0Eq5fDHoD0tAesEFs6z/NL27gGK0kc=; b=Qcv8uTuJivVw7eJUrbzNCHWdzZ
	9m/aCeDmxPonZXJ371cqdONgKL3F4M0MtvovqzcwP/EmWR4yJzJfTJa/5ZnQjIsKKynJ5VsUaJln/
	k/5g6k8KEhV5CB3IJatKwySx/41eso+L5iaxqQ3AMRsaXxOye6hi+LvGqcXNR/O7QwhJeiQnBumPB
	5cbAJc8MnDtT8VCYXTV0OPoJ6EjNjzyzfoX09L9KDO98iSFRZ74BtHkZjnchb0gmOhIIqgx7cK3QO
	v5YEcXOKweVxzPZyabhkJCFBztGsO7L77gr8/77AWtKXi6xryhkkI7l8iZQsIhItxr9r5opvptcDE
	RRdzr2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugemo-0000000G7f5-003u;
	Tue, 29 Jul 2025 07:30:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugekJ-0000000G7RL-2vUD;
	Tue, 29 Jul 2025 07:27:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50198A549B8;
	Tue, 29 Jul 2025 07:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D6FC4CEFA;
	Tue, 29 Jul 2025 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753774053;
	bh=1tfbbzkMLJ4su0Eq5fDHoD0tAesEFs6z/NL27gGK0kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=goaYjTSHOpBLCp9UcX1vxeNDQqZ2C/hiGlkVaXLEnISbc6VN0AUnK7yjALpUczIz7
	 0amNFL+Ct9MMV7dWpySjPKUW0X6zBzG39qOhYKIBO372J6tn+zwVOLFM7UcZXxOVvj
	 zCsTQxBypNl+Gsv9EhFYDWsyUbCW/kmdWqCEEw2IFzNq7z7q+Jllb/LjZvQiled2n7
	 4h+KTaz4A5FeKUevbvbwm1B1qQIZsWZ2xSv7ZGqL3u5BRNBQQUrRmmmYEmNfyLxddP
	 heFPwTY/8B2TbxmN4ORXSUc3Edl1fj4mKfg6/zfGG/BDT9jaNnqVoKhkNiQ/JIiacT
	 MsZu+vvoArSYQ==
Date: Tue, 29 Jul 2025 09:27:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
Message-ID: <20250729-tall-fluffy-grouse-f5deec@houat>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n2s32cgvask3qzwk"
Content-Disposition: inline
In-Reply-To: <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_002735_813033_A005144E 
X-CRM114-Status: GOOD (  13.96  )
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


--n2s32cgvask3qzwk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0

Hi Ma=EDra,

On Mon, Jul 28, 2025 at 09:35:38AM -0300, Ma=EDra Canal wrote:
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>=20
> From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>=20
> As now the clocks are actually turned off, some of them are now marked
> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
> early boot or are required during reboot.

What difference is there between the CLK_IGNORE_UNUSED and
CLK_IS_CRITICAL clocks?

I'm asking, because CLK_IGNORE_UNUSED is mostly useless, and
CLK_IS_CRITICAL is probably what you're looking for for all of them.

Maxime

--n2s32cgvask3qzwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIh33gAKCRAnX84Zoj2+
dsGHAYCE7DMrIRIs46iEKrBa6NG56LrGKUNEa1Ohv9us6PuvoIDPo8i4FgZGJPWn
4k9SvhkBgPML7cwLjOb+Uo1kEcrBQjk3Y3N5YhH5HiWzdIK7xdBBA4OnKkmXKPDB
TPP038pu+Q==
=L4PT
-----END PGP SIGNATURE-----

--n2s32cgvask3qzwk--

