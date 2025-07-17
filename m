Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A49C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCCh+o003YcA0EOQv+9QFXT7/N6o1tA3bae7OHo+cmQ=; b=IKkFTLnDdJWJwCsiTMpwzB9l7M
	NMGlQ8wxclCwd8cFjKdtvD68o7E+XhdEgGRRzDGHRnH9a7OBpxDukeZz0XNZRiPcZaVbh92E9caCO
	aDKc3GFrPHsmhZ6JLqzxcMZELPIzLHQwzwjNYn3swR1o2vQhK82NUnyk0jr4Fffmzvay0IJ0K0TwU
	um2FsTYV3+5nXJbUt7WiPr/yr3hYz3k7LnF4r5u21ZzR175gFob1QSy20uhFNBKXruMDbhWn4ubAn
	BSvUXIPcCglhFPj+uV5TQ8v3nZ/Vc077xnBW/uCB2xlYDZHQssFcMJdKkiLys9s5ql8MxlHJDnyGX
	UlYcC23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJDV-00000009TtR-2fJV;
	Thu, 17 Jul 2025 07:39:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIvw-00000009PyP-13WM;
	Thu, 17 Jul 2025 07:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CCCh+o003YcA0EOQv+9QFXT7/N6o1tA3bae7OHo+cmQ=; b=Sb4TTbxyxiDgQuJhQRwTlezXuZ
	ndsCkb3KK8RpL9i3sauoWUWQsfxM9CYNFir1F2iRqOw9WscSAklzMOb67ZnciZCj3qrKMzv7RYyfM
	RXd6MMO7+BwTz/Yx5Sq8ZgNRSe2Z4PG4zXZfURqbenPgP8DXIArpS+2lrNChxBQUpO11ZQL9Cd9S4
	jIU4DvqK4N09T5yDIH5qRAnVUH9GegzyclpmggSHhHiGeYHyJBzHvnB4nYeRvhGkyO8TUul2riH0E
	SLtod0/X0loDmyaaP8tUPge8CvnWFrUrFrk02eB2GejkiKWyuKX+aHd3vgJ9XQMPAR71EnyFY6CAk
	8FfmpiAg==;
Received: from i53875bf7.versanet.de ([83.135.91.247] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ucIvf-00010Z-Vn; Thu, 17 Jul 2025 09:21:20 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexey Charkov <alchark@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v6 0/7] RK3576 thermal sensor support,
 including OTP trim adjustments
Date: Thu, 17 Jul 2025 09:21:22 +0200
Message-ID: <4178173.5fSG56mABF@diego>
In-Reply-To: <aHgHxR1_Gzu8Dwbm@mai.linaro.org>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <aHgHxR1_Gzu8Dwbm@mai.linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002136_309278_276BF28B 
X-CRM114-Status: GOOD (  31.12  )
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

Hi Daniel,

Am Mittwoch, 16. Juli 2025, 22:12:53 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Daniel Lezcano:
> On Tue, Jun 10, 2025 at 02:32:36PM +0200, Nicolas Frattaroli wrote:
> > This series adds support for the RK3576's thermal sensor.
> >=20
> > The sensor has six channels, providing measurements for the package
> > temperature, the temperature of the big cores, the temperature of the
> > little cores, and the GPU, NPU and DDR controller.
> >=20
> > In addition to adding support for the sensor itself, the series also
> > adds support for reading thermal trim values out of the device tree.
> > Most of this functionality is not specific to this SoC, but needed to be
> > implemented to make the sensors a little more accurate in order to
> > investigate whether the TRM swapped GPU and DDR or downstream swapped
> > GPU and DDR in terms of channel IDs, as downstream disagrees with what's
> > in the TRM, and the difference is so small and hard to pin down with
> > testing that the constant offset between the two sensors was a little
> > annoying for me to deal with.
> >=20
> > I ended up going with the channel assignment the TRM lists, as I see the
> > DDR sensor get a larger deviation from baseline temperatures during mem=
ory
> > stress tests (stress-ng --memrate 8 --memrate-flush) than what the TRM
> > claims is the GPU sensor but downstream claims is the DDR sensor. Input
> > from Rockchip engineers on whether the TRM is right or wrong welcome.
> >=20
> > The trim functionality is only used by RK3576 at the moment. Code to
> > handle other SoCs can rely on the shared otp reading and perhaps even
> > the IP revision specific function, but may need its own IP revision
> > specific functions added as well. Absent trim functionality in other
> > SoCs should not interfere with the modified common code paths.
> >=20
> > Patch 1 is a cleanup patch for the rockchip thermal driver, where a
> > function was confusingly named.
> >=20
> > Patch 2 adds the RK3576 compatible to the bindings.
> >=20
> > Patch 3 adds support for this SoC's thermal chip to the driver. It is a
> > port of the downstream commit adding support for this.
> >=20
> > Patch 4 adds some documentation for imminent additional functionality to
> > the binding, namely the trim value stuff.
> >=20
> > Patch 5 adds support for reading these OTP values in the
> > rockchip_thermal driver, and makes use of them. The code is mostly new
> > upstream code written by me, using downstream code as reference.
>=20
> Replaced previously applied version V5 with this V6 patches 1-5

are these commits available somewhere?

Because git.kernel.org reports that
  https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
has not seen activity in a while?

Thanks
Heiko



