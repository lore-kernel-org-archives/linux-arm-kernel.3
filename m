Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2A4C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgtjBGVAZ1tS5fJXKd4+bhI2PQYUrEH4Cz/qfvC/2po=; b=aEr6Rg7wMFSso4Wl6Hre4Yf7Qk
	RJowUhiQHJIVAuuZJ5zn4mlcRFZ+y/HlBDUL7SuUpPOH9POeHXQsbNsxTdfi2mnIKp+DCyEXuGhD9
	ZVO7G/l8Z25zCNZwpEa4HvEHzaJVCKfM5sp4NmqXBxqd68A1/UaMb3qlKcIE+N1f2TPMCZ0xpEQEZ
	1c+jzwbHPokG9++rkze+W9kmHxzF2AB201c2HpMuY88lHcEksYWYTMrtOPEZIlD4piiU8oa07/ZVK
	AJfGk8ehdIRmbPd/ghk/qswrPVdNCSmGCqXNovDqMXfVvqOgdrNT7zTW29GoAvX0M+BRiM6M2sb/+
	gro+6K7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwrz-000000073TH-2VN3;
	Wed, 16 Jul 2025 07:48:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwkc-000000072Oy-27hS;
	Wed, 16 Jul 2025 07:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=qgtjBGVAZ1tS5fJXKd4+bhI2PQYUrEH4Cz/qfvC/2po=; b=FTxmbPG1x9gKKjsM5WAh+rNIRC
	/+YNAwSYKFOaLt++uJ4akLU4L1U3GETfMY892VjCy5ZAPJnsrTOxzSQtdS2Npx5vrgDaI+q2gfISo
	FaSHyV2RSkf2RiUvTVOgEFrZKhcu6NXSPclXeHBTz793LdTFZqCMt3lVmXh8gVkH2Y9keELpbryPl
	CZ8aDjoPcXgtHDjDNDuGI7sPMsDiQz0cDk4gyULnFp1hcUNUtnyUDulCnWUUWYbmuzcqXsl2lz2z8
	UFk5YsvH+HJU7Co075/zAc39Up67VtRcLRfZlG6I+JYhQdESBQ4dEJG0WcGPM0E4hvxo/GOw83Sqw
	pXOdRX6A==;
Received: from i53875a74.versanet.de ([83.135.90.116] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubwjz-0008Vz-1P; Wed, 16 Jul 2025 09:39:47 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add support for Type-C
 TCPM
Date: Wed, 16 Jul 2025 09:39:48 +0200
Message-ID: <23651445.EfDdHjke4D@diego>
In-Reply-To: <c84cb838-e6e7-4ed0-8d12-67b82f85ff28@rock-chips.com>
References: <20250715112456.101-1-kernel@airkyi.com>
 <eqb5m22om6bx2ypjtnlwdjmgfyycpmgrlvro34xwlwjj4j2jeq@mrarg36wetp6>
 <c84cb838-e6e7-4ed0-8d12-67b82f85ff28@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_004026_568495_8AEC0ED4 
X-CRM114-Status: GOOD (  21.00  )
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

Am Mittwoch, 16. Juli 2025, 03:56:27 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Chaoyi Chen:
> Hi Dmitry,
>=20
> On 2025/7/15 20:05, Dmitry Baryshkov wrote:
> > On Tue, Jul 15, 2025 at 07:24:54PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> This patch add support for Type-C Port Controller Manager.
> >> The extcon device should still be supported.
> >>
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >>   drivers/phy/rockchip/phy-rockchip-typec.c | 335 ++++++++++++++++++++=
=2D-
> >>   1 file changed, 319 insertions(+), 16 deletions(-)
> > Please keep TCPM implementation under drivers/usb/typec/tcpm/ . Create
> > an aux device and write an aux driver for the TCPM part.
>=20
> Sorry, the commit messages may not be described accurately enough.
>=20
> This patch adds mux/switch operations to the PHY driver to improve=20
> communication with the TCPM framework. Since this PHY is a combo USB/DP=20
> PHY, it requires configuration changes to the PHY lanes based on the=20
> USB-C  plug orientation (CC logic), similar to the existing extcon=20
> mechanism implementation. Of course, the original extcon functionality=20
> will remain fully compatible.

and looking at other users of for example typec_switch_register() [0],
there are a number of them already used in other phy drivers accross
=46reescale, Qualcomm, Rockchip and Samsung.

Grouping the mux/switch with the phy driver as this patch does, makes
way more sense than to introduce additional infrastruture.


[0] https://elixir.bootlin.com/linux/v6.15.6/A/ident/typec_switch_register



