Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA523CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pSVK+9EQxqVMM7Yjv49ZmJRac0skbNKar4/N2MFVSo=; b=Kc2qOeHM5LWxI40G/HBXZuZTwr
	4qdbZjndPz1auz2awUI7alFvs5NAIJnSYQM1UFsJz3en2SRrXWGYvSnN5V4rj2hPTcRDfQxDtLGdq
	KJGtu7WsIyOZ1dhKu/W7JsSTPxRcZQ/8fcUPrac4+5SXETe3n1TkvL8nkimcZ3+NzTHdPwYAGLAZV
	PWbHQ6zb0ich1rHFfdFnf4nk+2PQqwdnDbdBIywn/oPZ5WWigyK5iK2KUw+45O5jSnCxZs+7y5Xa1
	pX9cCMyP0Tg5vZLIE0fXRG4voYi+qvR2FpH4U0MWSi1Y0S4eRNFuTMSp2IySPOVH6rATPoba1ZpzJ
	HLEY+uVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPei5-00000004OsQ-24vn;
	Wed, 20 May 2026 11:03:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPei2-00000004OrF-2YMw;
	Wed, 20 May 2026 11:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0pSVK+9EQxqVMM7Yjv49ZmJRac0skbNKar4/N2MFVSo=; b=RYBTev16Cq3YvXNlWCcs0wFF69
	eDsv+adZLd1yT5ULefQtKo+X44tNcAfUl7t5o/+u1cHreJ/abr4bRZAV5wiboCua7jRg8cb4PKW8+
	iV8dK9Iwn/0DzGNqFo9QYDao4UtZXXZN4gEdvRcrawQmjOn4gaeea5dZino47REa62XIqncgRRbG4
	WHmyxcV/KDsnFDUSbfsKoZ3kLMCN6lQS9L3ky99UPpD9mHwBimd7B0+XIZPHeACsIgJ/cfmCa5MJ6
	rVJ/9tdrUlRY+PFZTbKHebAYyizsnFaclzUbWe2lc3+DVt34ghHvhSYC3+iRF3wrpIix+IcQ+vHFc
	9xKGG2CQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v15 0/9] Add Type-C DP support for RK3399 EVB IND board
Date: Wed, 20 May 2026 13:03:00 +0200
Message-ID: <4958503.687JKscXgg@phil>
In-Reply-To: <c0bc4796-afe5-40ff-8816-9605a6114d23@rock-chips.com>
References: <20260304094152.92-1-kernel@airkyi.com> <agxo8ic94e81nQRx@kuha>
 <c0bc4796-afe5-40ff-8816-9605a6114d23@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_040330_647635_CF2C20BA 
X-CRM114-Status: GOOD (  24.01  )
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

Hi,

Am Mittwoch, 20. Mai 2026, 03:13:25 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Chaoyi Chen:
> Hello Heikki,
>=20
> On 5/19/2026 9:43 PM, Heikki Krogerus wrote:
> > Hi,
> >=20
> > On Wed, Mar 04, 2026 at 05:41:43PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> This series focuses on adding Type-C DP support for USBDP PHY and DP
> >> driver. The USBDP PHY and DP will perceive the changes in cable status
> >> based on the USB PD and Type-C state machines provided by TCPM. Before
> >> this, the USBDP PHY and DP controller of RK3399 sensed cable state
> >> changes through extcon, and devices such as the RK3399 Gru-Chromebook
> >> rely on them. This series should not break them.
> >=20
> > What's the status with this series?
> > Are these inteded to go via the DRM tree?
> >=20
> > thanks,
> >=20
>=20
> Thank you very much for your continued attention to this series.
> The maintainers seem quite busy... Despite there being no further review
> comments, this series have yet to be merged into the DRM tree.=20
>=20
> And some of my other patches are in the same situation.=20
> Do you happen to know what the next steps should be? Thank you.

=46or this series, I would think it'd be best to split it a bit.

=2D Make patches 1, 2, 5-7 its own series
  * patch 5 _should_ be included here, needs an Ack from the phy-maintainer
    to go through the drm-tree. It does look independent from the other
    phy changes (code changes themself), but needs the function from patch =
2.

=2D Make patches 3+4 its own series, so that phy maintainers notice
  The code-changes themself seem independent of the rest
  * Reference the drm-series and explicity note that the phy-patch in it
    needs an Ack from the phy maintainer to through the drm-tree
    Hopefully helps to get that
  * patch 1 has a Reviewed-by from the type-c side, but needs someone
    knowing drm-bridge internals to agree

=2D Makes patches 8+9 its own series, reference both series from above
  as dependencies.


That would be my take here, to have the right maintainers notice they
should do something.


Heiko



