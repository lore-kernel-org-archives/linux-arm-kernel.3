Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C4ACA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 00:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caq28f0MR5Zp2zVT+QmZvY0xnQl9VUoGhuuYwcNrVy8=; b=UrdhAv/VgxlTeFu9bAm/kqUUTL
	K04nsEuq9YICGoTNkcjwK06RjMNYz6+MT71w8odbk87fn+7t4MU3OrPLFD4ffT06T7AEOwyrGpAPE
	3zqZFnHUhGVLJMvROGMAYizdF88dRfiIHEKHLO/f84nw67JO3m4omoLnXiZCR6itTNMmY8UiMo0SG
	tUGqKsGq+86tYw7nDs/sorBGWkmawrDK8HvKPdIIkIBlbkuIoKyXwi+ttoEqbWfeeRwYz2kmTxKvO
	Kx5X++IWABAvOgJPgQ8iEjkBlJ4p19eCXQYN0cqlZe+s52+6BagAOE+SQr3PE3AR9XFwso+86Pnuu
	BI9oLdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussjX-0000000AswM-43QW;
	Mon, 01 Sep 2025 00:49:19 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ussgp-0000000Asq8-09dA;
	Mon, 01 Sep 2025 00:46:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-61cb4370e7bso5633110a12.3;
        Sun, 31 Aug 2025 17:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756687589; x=1757292389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caq28f0MR5Zp2zVT+QmZvY0xnQl9VUoGhuuYwcNrVy8=;
        b=a5GOGz1WkBkGtZ+DBu3lSmLvpbzx3N1QLVb6PzNZMpXrVcpaXrO2TgvbSRLweISlPl
         IDz4jlUsgsxD8wnb4JVrHF/JIO5Xtcy73i2bFob4A5EwdvFuEBD9yxYiEQOfJTv95LVF
         LveitNm3niAJ1ygIL1RuvDAdpCTe2oDxExv7xDWRiOqYf/yUssJE5AHEhw9/WCRv1gkP
         tJBH+xDJqzMSnCCEiM1Q8S/e2cIG2+p6knoVSzzjDzQJiZfNqEi/IF7228qhxFbxYBbc
         puWntW+qvEqcIcYktrlKVkFByGg/OA1qBXRerRtiXV1xJu1JvguWdUnQSdOXJZZUqBSN
         D9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756687589; x=1757292389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caq28f0MR5Zp2zVT+QmZvY0xnQl9VUoGhuuYwcNrVy8=;
        b=YrG3pl1Mx4vS7ChjG/RVFgGvmmkefdGBOYd7ksM1RZS5Whk/bFYeogQqIJo1xvm5p5
         tg9EBFX8dkBBdf28KVA6Pdxls5yH/IoNBmaKRmdNk+68IH97BKIZyZmzd0P348nt8Wsl
         yqWnPaNNJ41gOvWYS9+6uRNn+RFW3Dyy3uDUr2u9uFxTWKLjG6p2Rz1d0g/SPGJdUdtS
         j5mrZmkZXIpMtAejAOBSv4JZ2Kyk/vhU3xUJfUiWVnUkfGVsCOzbaVGGJ4OhQCyi7ULZ
         PTal69erDY+aZ+s+bEfBT3xgmjATu6o8N1eHZfz7KanFHSF6THPiLCEHANhNMM2adtDi
         ztxg==
X-Forwarded-Encrypted: i=1; AJvYcCUbMgdk/BfH2hteKEmUH0duc4CS8kgU7TJ3BMdJv5gFDqWwj73mkCxYALJU1b5/N1ee1XKWyrmeB0eqS0sXLcs=@lists.infradead.org, AJvYcCVJ0R+rlmZxrdJvjsH3tyYamCNZ9Fyu9K6ise7N3hXH27YfIZKA2i+2pBfgI1kHyfOiyg6iwSuSi8EoHn5R9pj3@lists.infradead.org
X-Gm-Message-State: AOJu0YxqzUcrXIJODN7XCVJ7/XMqz4i5KjXTwknMVTyAJKdg1NGeUNCO
	A5nQhnyGWzPRZbWvQKdh2scXb/QCQw7rEUpt187X36xKdjE3M3PG60hOLR7pHXL0baPm2GtYdPn
	3az8aPPQdqeU4Vhia0xhd8Kc4wJ31Kzk=
X-Gm-Gg: ASbGncsZSqARAA5yLhB4Pj1i7n8YggRNQ3B+8jwIW8/i8D8ErgPrXQrnQrJHSMIgk3f
	7+3VT30TYHR8FYZjzJsx9mEn4GMMqKDNb1LFvRxKOMvFpoPTc4pA0xUINHEs6yMFwrnXrfVeenh
	mTWDH4o1Aywc9Lz+vASN6vIJnnJarBQMG2u8i33vaSPxRLgBXqL8v+NWtgZCw274XIGAVH4chfz
	TVUTaGkzjBAAw==
X-Google-Smtp-Source: AGHT+IHK3Leq+3fJeu89rJWaErCRBW5RO5impY2LzaF/J9OxH2CGpEFncXZ0kPXeWO36QfuOyJpThlBtVSnMBaPVn+c=
X-Received: by 2002:a05:6402:42cc:b0:618:38d6:7819 with SMTP id
 4fb4d7f45d1cf-61d26d78d3cmr5362734a12.21.1756687589297; Sun, 31 Aug 2025
 17:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <22816630.EfDdHjke4D@diego>
In-Reply-To: <22816630.EfDdHjke4D@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:46:18 +0800
X-Gm-Features: Ac12FXyd3Kd-w_dxJLbuguLcQGoKS7dFJvAoLApW6pAwLmBXGkKQ-alchoyDVCE
Message-ID: <CAPEOAkSm+6WtzSL1GzU_srHQT0ZBKKoFD1v5+ePqHTPBndPS=g@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_174631_095767_2F28D688 
X-CRM114-Status: GOOD (  24.20  )
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

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:10=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi,
>
> Am Sonntag, 31. August 2025, 12:48:48 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> > native display connectivity through the MIPI DSI host controller and
> > PHY. The changes span multiple subsystems, including clock control,
> > DRM/VOP integration, DSI controller binding, and PHY driver updates.
> >
> > Key changes:
> >   - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
> >     phy initialization.
>
> which patch is doing this, because I don't see any phy-related change
>

The first patch, changes for dw-mipi-dsi-rockchip.c, some settings for
mipi dphy.

Maybe I should adjust the description, it's a bit unclear.

> >   - Add missing lut_size of vop_data for RK3368.
> >   - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
> >     which is required for enabling the 24MHz reference clock.
> >   - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
> >     and register mappings.
> >
> > These changes were tested on a RK3368-based board with a MIPI DSI
> > panel [1]. The display boots successfully with console output.
> >
> > [1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368
>
> Do you plan on submitting this board to mainline?
> Because having an actual user of the code you're adding would
> be really really nice.
>

I'd be happy to submit this board support.

However, after searching for a while, I couldn't find the manufacturer
information of this device and mipi dsi panel. I am not sure whether
the devicetree support of unknown manufacturers allows submission to
mainline.


> Thanks
> Heiko
>
> >
> > Tested-by: WeiHao Li <cn.liweihao@gmail.com>
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> >
> > WeiHao Li (7):
> >   drm/rockchip: dsi: Add support for RK3368
> >   drm/rockchip: vop: add lut_size for RK3368 vop_data
> >   dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
> >   clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
> >   ARM: dts: rockchip: Add display subsystem for RK3368
> >   ARM: dts: rockchip: Add D-PHY for RK3368
> >   ARM: dts: rockchip: Add DSI for RK3368
> >
> >  arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 79 +++++++++++++++++++
> >  drivers/clk/rockchip/clk-rk3368.c             |  2 +-
> >  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++
> >  drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
> >  include/dt-bindings/clock/rk3368-cru.h        |  1 +
> >  5 files changed, 102 insertions(+), 1 deletion(-)
> >
> >
>
>
>
>

Best regards,
WeiHao

