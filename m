Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB685C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnN4gkK7hnqg+1fHPpMhKULH0EAOxYwzimcsaqGrHpI=; b=Apm0u9sB3G7H3yoeiRKzgxfQQp
	gWrh4/oXUakXFEYyjKAD91v/Qj6FsZuPzE0oWt6jNTZmRF7b8MxtK/DSb/L3YVCRwFhu4zN2YP8Vn
	11789H6ILIZost9pjf2OHxoEOv91cuyVKjL+Fq6KlpvXUSTd6Ei4LmwJFijMS37cnIptUAt5xOEOy
	h4jhDO2i3L7avP6Jl2ebXqJWsC5W182WGDqDwV2X/3ltDtoL+3xsWKHgp9hkWfLR6kud4Ppz+M64D
	/TXQy6hOTFda5iG73C9A8jATYkGyq0CMYj5gjh+ItTFLYcTc8UzMlxVyS8vqjxQIfBGVtA6YnwjDy
	lZI0wLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOiU-00000003AW7-1R8a;
	Thu, 31 Jul 2025 08:32:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOO6-000000038Og-23lV;
	Thu, 31 Jul 2025 08:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SnN4gkK7hnqg+1fHPpMhKULH0EAOxYwzimcsaqGrHpI=; b=nt67wWbOozmrdStei2uDKou0oi
	JUfbs/YtFvbvyk0xU/vIThKDjzbAlY6JA9O1a+EPymvZSvddO6Mz7yr/HalubI8+LNMRstAnxihEP
	QRub/dVXS0103625DIbhimZn4sE7hRrW/RYhU1gYaLTP7vdn2zpitPTK4m5KHC8LSZoNNuU4KMRKB
	Nqrn1vuZpL/WOEthSFsRqK1KIC14a3cNt82X9xxc4kRtFN+Ujb8zodPWsxCcVX6ZnzBlhK5YekXv2
	4Ja3ws0DG/RitZoSgAWbfT+vtQKM4B5JNzxB+ey8/jqk28U5hf3Ghjfo9VFlNMiUO/gSm2bdTsEDd
	qEI8bSEw==;
Received: from i53875bde.versanet.de ([83.135.91.222] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uhONo-0006X8-Jv; Thu, 31 Jul 2025 10:11:24 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexey Charkov <alchark@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
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
Date: Thu, 31 Jul 2025 10:11:23 +0200
Message-ID: <3560770.QJadu78ljV@diego>
In-Reply-To: <CABjd4YzJeNf0Qq9qFeMcoYQV5erZGUeOpmJynRW88AeL9dJNhQ@mail.gmail.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <14c91ee4-3a09-4ec9-966f-0d563d7c8966@linaro.org>
 <CABjd4YzJeNf0Qq9qFeMcoYQV5erZGUeOpmJynRW88AeL9dJNhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_011142_687437_F50E5697 
X-CRM114-Status: GOOD (  35.02  )
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

Hey Alexey,

Am Donnerstag, 31. Juli 2025, 09:33:32 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Alexey Charkov:
> On Thu, Jul 17, 2025 at 12:20=E2=80=AFPM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> >
> > On 7/17/25 09:21, Heiko St=C3=BCbner wrote:
> > > Hi Daniel,
> > >
> > > Am Mittwoch, 16. Juli 2025, 22:12:53 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Daniel Lezcano:
> > >> On Tue, Jun 10, 2025 at 02:32:36PM +0200, Nicolas Frattaroli wrote:
> > >>> This series adds support for the RK3576's thermal sensor.
> > >>>
> > >>> The sensor has six channels, providing measurements for the package
> > >>> temperature, the temperature of the big cores, the temperature of t=
he
> > >>> little cores, and the GPU, NPU and DDR controller.
> > >>>
> > >>> In addition to adding support for the sensor itself, the series also
> > >>> adds support for reading thermal trim values out of the device tree.
> > >>> Most of this functionality is not specific to this SoC, but needed =
to be
> > >>> implemented to make the sensors a little more accurate in order to
> > >>> investigate whether the TRM swapped GPU and DDR or downstream swapp=
ed
> > >>> GPU and DDR in terms of channel IDs, as downstream disagrees with w=
hat's
> > >>> in the TRM, and the difference is so small and hard to pin down with
> > >>> testing that the constant offset between the two sensors was a litt=
le
> > >>> annoying for me to deal with.
> > >>>
> > >>> I ended up going with the channel assignment the TRM lists, as I se=
e the
> > >>> DDR sensor get a larger deviation from baseline temperatures during=
 memory
> > >>> stress tests (stress-ng --memrate 8 --memrate-flush) than what the =
TRM
> > >>> claims is the GPU sensor but downstream claims is the DDR sensor. I=
nput
> > >>> from Rockchip engineers on whether the TRM is right or wrong welcom=
e.
> > >>>
> > >>> The trim functionality is only used by RK3576 at the moment. Code to
> > >>> handle other SoCs can rely on the shared otp reading and perhaps ev=
en
> > >>> the IP revision specific function, but may need its own IP revision
> > >>> specific functions added as well. Absent trim functionality in other
> > >>> SoCs should not interfere with the modified common code paths.
> > >>>
> > >>> Patch 1 is a cleanup patch for the rockchip thermal driver, where a
> > >>> function was confusingly named.
> > >>>
> > >>> Patch 2 adds the RK3576 compatible to the bindings.
> > >>>
> > >>> Patch 3 adds support for this SoC's thermal chip to the driver. It =
is a
> > >>> port of the downstream commit adding support for this.
> > >>>
> > >>> Patch 4 adds some documentation for imminent additional functionali=
ty to
> > >>> the binding, namely the trim value stuff.
> > >>>
> > >>> Patch 5 adds support for reading these OTP values in the
> > >>> rockchip_thermal driver, and makes use of them. The code is mostly =
new
> > >>> upstream code written by me, using downstream code as reference.
> > >>
> > >> Replaced previously applied version V5 with this V6 patches 1-5
> > >
> > > are these commits available somewhere?
> > >
> > > Because git.kernel.org reports that
> > >    https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
> > > has not seen activity in a while?
> > >
> >
> > I just pushed the bleeding-edge branch
>=20
> Just wondering if patches 6-7 from this series are on your radar?
> Driver changes are in -next AFAICT, but not DTS. Can't wait to get the
> temperature monitoring working on RK3576 without out-of-tree patches
> ;-)

they are :-) .

Right now we're in the middle of the merge-window though, so everything
I apply now, I'd need to rebase onto -rc1 in slightly more than a week,
invalidating all those nice commit hashes that end up in the "applied" mail=
s.

So I'm struggling with myself on every merge window about that.


Heiko



