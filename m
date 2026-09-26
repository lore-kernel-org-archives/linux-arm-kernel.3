Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6ACC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LvRVZi/gGeHaFV3EytSFghp++iimgFUhDwJJVt4934=; b=qR5BSrkXY6w/h/pP64mJgFgmtw
	QOeaERZIHDeV6bGTVzByoweTVO2eiIWwW0k0v6q/6N1gGtXAtdMhyxCRagPySxShQc4JQ4os+t7Zd
	P0Bk+AdgWZXJ26bv6Y0nZ8BsaZmL1Q45weQL4FA7xC7RC0a1ZsuO/gg8p9mrdPOCyL34TS4H5kTo+
	eQVME0CjSuVLa+YJiHC/rMk1IcG13tJd+BqRL5eplH0Y2cpWF3QMwNescZ75NJh9IuQQaP1VhxPBm
	l/9IQ42UESQvaoEamLvPVtqRufbbn+UmFpfX7NtOE4b414P9HQBkY7OWsPfWC4JF7NlaA1BxzzvJp
	JBL2aObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJEk-0000000EuxL-2sxx;
	Sat, 26 Sep 2026 03:38:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJEj-0000000Eux8-3Vp7;
	Sat, 26 Sep 2026 03:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38510405BF;
	Sat, 26 Sep 2026 03:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40641F000FF;
	Sat, 26 Sep 2026 03:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393885;
	bh=3LvRVZi/gGeHaFV3EytSFghp++iimgFUhDwJJVt4934=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hg/xWZ+Onm2ZkLe6P2ZAmpdXc3L+1SeTb3eJTAd7JckRZ/lyfqSO5HR+UU9QT0AB1
	 h69LkOoMXVopJp7HGwGFQyIkV36vKjA6kyvXsGOiWOnOvKB6Y0mMgJWhY1EQLjixgL
	 WSCFJuGWIgjOYU1SSoKNIOTpYKiw1bZ829DJtY23zsiPEFwmSGAbEkgQDvm3GxO+7y
	 MoSqyjHlQuVItzAkIdsqFdO7YeTzpAlJZt/Lydk1lSBjZBcJ7anQShxUCcZZ3klr4n
	 M5DXYHRL1aFUpQJyDRSMpncFyCTpVsT4KVG5CLgS5YGWz12ZCXd0S6+CSJtoHe1BLn
	 3n6db1Z1ULzRA==
Date: Sat, 26 Sep 2026 05:37:49 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 07/16] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Message-ID: <ivamoiqpjjicp7cnff32o6yl64g5kugd7vdmubi2vr3eahuuik@g2pysc5iruuc>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-7-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-7-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:54PM +0200, Sebastian Reichel wrote:
> When a mode change is required rk_udphy_power_on() disables
> the clocks and then calls rk_udphy_setup(), which then enables
> all the clocks again before continuing with rk_udphy_init().
> 
> Considering that rk_udphy_init() does assert the reset lines,
> re-enabling the clocks is just delaying things. Avoid it by
> directly calling rk_udphy_init().
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

