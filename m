Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124CCC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VK83oYZiUr/4FmQT3AHsLHS5JaACjWwYH+JkriqTEp0=; b=MuAHCKGclgO1xBOz92Fd0IQIxS
	X7g7GMc0b+dw28BztwsxjgUeBa3FTCVReda+kgVyAh/UJ7Oi/XPPLoZumaEL29kqSqil/SxA8JtDL
	Tnb/KZL6YzUHSYTmsaxykrPfR/ke1+mEV2cW4U4TWXoVPceR9k8uy0N1ttwLCFG+MJWkkvsP2kFm7
	eDrBFSX7C7mILTFSp7b/aW8UfcCjwi+T7zv86SzkQU2UWx26ZeVKQFxHN9oheCTh3/AfKzd0bc6K4
	aXkbD8o4xLkdIKeizmmtViyPBbXarb6tisbRd+Y/SKXcemPuIuW2PKzbEDqrVuaz6HmOH/V4Z8Hq3
	I9tzeQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajIt-0000000BLFQ-0T5r;
	Wed, 22 Jan 2025 22:34:31 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajHZ-0000000BL7b-3RlX;
	Wed, 22 Jan 2025 22:33:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737585183; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mf5SCFjvqN7ECeeglhX4pUqVwkTxLeBy165andaGnIp/Fgu2n/1sN6TDoqBtOU2B6o8tkAl9Cftz/EYiJHMVFns+Hy8/Q3sA+Hxd9s/vd1R7wUJd4/kFQYfA7K91vgdM8SN4oVMgW10n5mSUeFZnVDyzAW36UIdR68t+n/VxrsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737585183; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VK83oYZiUr/4FmQT3AHsLHS5JaACjWwYH+JkriqTEp0=; 
	b=EOajkPhdQFwFGSaeZn8sjYVOeX3nf2OUIcG4inISrTCUcaZ1Kir8njkIMAdbBQ6jtrSn5VY6HHPS6/DSjFQplXRVgJznOqhDl7Is85m+Tg2lljv7myHfivzd6Vyo2Rs6pvi2qBXDM2qbRw71PA+910zpdXMu3EGgKW6ILsqgtKo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737585183;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=VK83oYZiUr/4FmQT3AHsLHS5JaACjWwYH+JkriqTEp0=;
	b=FrK5YHLSKXM+x3in0IfbPVxSH6sl9S5nkt1rAE5IOjgSaXDZNf/nlH4aMR1+1TmZ
	jCpyUNWSWtcZy/yCR4A0rRakBY5nIWx++R0S8QaZ9gvlCILFHxAYE7hnik6W2YNX+CJ
	IoRmX3lqWISJbRL+iiMvXz3XrXDpD9Lrtmfrpoeg=
Received: by mx.zohomail.com with SMTPS id 1737585179773821.5799938261969;
	Wed, 22 Jan 2025 14:32:59 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 833431808C6; Wed, 22 Jan 2025 23:32:56 +0100 (CET)
Date: Wed, 22 Jan 2025 23:32:56 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Zhang Yubing <yubing.zhang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: rockchip: fix Kconfig dependency more
Message-ID: <zf6uopaitghxemdrjzbyb3kilkd4xncg6ckdhrauprcqc4m4gy@lvwzhptywvzy>
References: <20250122065249.1390081-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250122065249.1390081-1-arnd@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_143309_965046_9A22156B 
X-CRM114-Status: GOOD (  20.51  )
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

On Wed, Jan 22, 2025 at 07:52:44AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> A previous patch ensured that USB Type C connector support is enabled,
> but it is still possible to build the phy driver without enabling
> CONFIG_USB (host support) or CONFIG_USB_GADGET (device support), and
> in that case the common helper functions are unavailable:
>=20
> aarch64-linux-ld: drivers/phy/rockchip/phy-rockchip-usbdp.o: in function =
`rk_udphy_probe':
> phy-rockchip-usbdp.c:(.text+0xe74): undefined reference to `usb_get_maxim=
um_speed'
>=20
> Select CONFIG_USB_COMMON directly here, like we do in some other phy
> drivers, to make sure this is available even when actual USB support
> is disabled or in a loadable module that cannot be reached from a
> built-in phy driver.
>=20
> Fixes: 9c79b779643e ("phy: rockchip: fix CONFIG_TYPEC dependency")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks,

-- Sebastian

>  drivers/phy/rockchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index 2f7a05f21dc5..dcb8e1628632 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -125,6 +125,7 @@ config PHY_ROCKCHIP_USBDP
>  	depends on ARCH_ROCKCHIP && OF
>  	depends on TYPEC
>  	select GENERIC_PHY
> +	select USB_COMMON
>  	help
>  	  Enable this to support the Rockchip USB3.0/DP combo PHY with
>  	  Samsung IP block. This is required for USB3 support on RK3588.
> --=20
> 2.39.5
>=20
>=20

