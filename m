Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B24D61013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV0EaAfSfWXdEAd8ez6i9+1b1e2fuFvIVn/DRhtOP0g=; b=T5cNBfPkg+oTd+Md02Oqkx79+Y
	q2ZsaSZ1MKA+lt3Pk50IIhh3tqTPWdrv78ffbfu0Bke5Ny4YTc1aKa05xM71raAeOU32taYQ0a4Zg
	c1ms0AY79iyp8oqAhOprgLadUpqgUZ9rLwF3+JGgXBVv7qcr9MRbY4yby/1AU9RXf1cIP8NIyDAla
	3tA0sROf2pNKxqOz/iSzesZHjz0iGAEcaukvrM80JhZFgclzOP7/mektNmJ37XHMc+181hH6rwK2o
	jbCLAzfdIo5IqgeGayMZoycaiokDY+dVkS5G/T1HXQEcfzuHjQ22702yDLLuMZ/6y2JMiwK4uIXGG
	caZp1XLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRi3-000000008ES-00rA;
	Thu, 29 Jan 2026 13:05:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRi0-000000008Dm-3zpV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:05:18 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-658d4059b79so744722a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:05:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769691915; cv=none;
        d=google.com; s=arc-20240605;
        b=brd4k3l3uJWiYWo0XtkWAH36mDEtbztW+jMAQvSJ0iccVzPEEBaQEarmh3pYn8XHTD
         iYxcfo+Lj55/GCBWn8goHBiwSsmrWLZr8H5owJ47yj0yuxtOTuFCnwgX+dLsl6vwKQiD
         vzBqiXTZoj83cOuux3i4DfFkAMU8YTcSosSOg4txGNqezA+KSVgjTHtrH12Cug1vUEvx
         Kcl+h7qUYN/GCqtsT886YzbuRff8y1kv+eycTdQxgGryubeFc2htYXtzfO+P++AGgo0v
         yifJdFQKtUSPQDq+sduxPxLgxXINgIjWQQFy+DEbchshi4G2UoTleLvuaXtxrOTCMXum
         DD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hV0EaAfSfWXdEAd8ez6i9+1b1e2fuFvIVn/DRhtOP0g=;
        fh=ntwoAF07/Ht5ZtCls5yhPa1Lv0YuyWeRGNfxxRwFJDY=;
        b=UF7CR9z9Bo6SlHacgwqifHTlESTyLU4yAi/3RZwOyNW89omqX4Vu6w9BvS/KjxkTHR
         +3BVpW4jMeGGhu1UXCAUucyQMcTKkzQlfid57p317iRa+ZJnhHHT4rGXuOPJ+//BkKwO
         lR83zSu3Iu5/CPI825yYUJRkhvH+s8hDDVwPfuPcp/LExBMccIXq2eVUbqa+rga6VVed
         xJcxCj6TD+Fv5l2vJ11EjrxcEQ1s0CLKkhlKtuNTYRpA0MiMe4OYN+kLNtVYwUQj6EmK
         BuB9eYG/WcglSm01sBwtEwy3lC1DNRgBZMWNS9wgrFQnVkQubylpWVW7WUsYgba6fZMz
         sEIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769691915; x=1770296715; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hV0EaAfSfWXdEAd8ez6i9+1b1e2fuFvIVn/DRhtOP0g=;
        b=BArtyrnZUw6iGIHwPL+mqxQ21RwSBT8z8IjGjbz5crSfqLXC0imZw/QM7IN1pSQSfk
         pfnsDLJjkRfvEX6mFXzlIwkAXqprO9hYz8fSt0HJL/EXCTn0w7fSs+LZwefsEwime0MA
         hqEy+MirGyGhDlQisFCu1RoVywgXPSaqtLnP3RaRIc/YMiC1kArzgaMRxqpJtiVujje6
         LqXqnhu798f6gxvDwHFOvaw1CH3NWGzUM/UNyumeTYxlFTqtVNAwkTyx0xYHvyC/F2y+
         /GHw2VEr9+1fjMEfJankkixvw0n9kFozT4DkbDo7i6Monq+SL96Lz7jdjwUsCjRC0hQs
         Yy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769691915; x=1770296715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV0EaAfSfWXdEAd8ez6i9+1b1e2fuFvIVn/DRhtOP0g=;
        b=rqaXZFyYt5PX6pf0hlHhVe+PML1/B+wtlfqB3DXtiuNxmQKR1le8Rm1E1aaYWC7tie
         PWtHVz+WlFUQQP907BUxa/titpLueE8KuDQevdPnhP48tHflS0it1F5j0KBJGqJrIClS
         eR1B7fbIA3xjgCb85BR36e/pTKQOrBW4GK4536mEsHzSdux1qVSK4pyB9NqKn14ZORHF
         1MpkdcMDuL4iiXV5SRRAqlGZ31owbsJPY+KYdWCeoSAQEdWkO0mwaKf12hpLRByzAhXV
         rKaC9LTqwWvvtBGstuUzHb1KoawusxZ9hoiQGeZqmbKam4b/xfm7VdfLgmJ0gwBfC9yQ
         GYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJW83PYo2JOZNNsYuOo4IysNHAVhvdcnmIhf6V3S9fHp1cOUXdXUHMm7xv4Uu7d14x5KEje4VuVbGGsOzZH/pm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh6d/70U5m425JVd0OO4Ilu6wa1RxUbx3KyGaN26iqI/ObFNu5
	c51DvQ6G3PpN+Ta7KmEGMniYbt55c6O2Ix/twoTiHT9l+xQIW2UPVZizkyniztjdTSP6UfaPt3v
	rU13/8txPs0cfaspeK1Cp05fyeuNEBBhYY0xj9aVllw==
X-Gm-Gg: AZuq6aI13QAgNAz2ATZBsQtEdnS1zsUVZagJFmBuFqqNhgYhXa0VRsLkhmAvHh/Cbz+
	qqAthR6YMEsG8b1PEZV5bNAMOydM70EChW1spaBkRps5Xj41z/W+8ALl/KlgRDTWHm0LP2yjl5W
	GgHfUcwodfa7gigyeOQp4VG/CdD0PMP7r/J8ioO0ep6JKeo6c/tw8ORKBj64k2GJC3sNH5CxBRo
	MQZ3+NQ6z/hB6smPAiWhPTjoqcdmEDT7ZuzX1+eLoOwvM1HNOa5KxHT9ni+leQE9ovlhLvXmk41
	Uw2497EpLFEKCYpUgKckuV5cDH9+PnWBnQA=
X-Received: by 2002:a05:6402:5187:b0:658:cc59:161c with SMTP id
 4fb4d7f45d1cf-658cc5917c8mr1678090a12.12.1769691914958; Thu, 29 Jan 2026
 05:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-2-vincent.guittot@linaro.org> <aXtXmN1V8wg57yuE@shell.armlinux.org.uk>
In-Reply-To: <aXtXmN1V8wg57yuE@shell.armlinux.org.uk>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 29 Jan 2026 14:05:03 +0100
X-Gm-Features: AZwV_QhIdeGA_SmdiEnXscTGdrXOcfbfoiNkh_dYEPgauVTbh2-bOtUlEiHJGvM
Message-ID: <CAKfTPtANQsmWAf-u6+isXh5UHJdo2mYELBYio=-UxZj3WM6-5w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: serdes: s32g: Add NXP serdes subsystem
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com, 
	bogdan-gabriel.roman@nxp.com, Ionut.Vicovan@nxp.com, 
	alexandru-catalin.ionita@nxp.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_050517_030514_3205FF11 
X-CRM114-Status: GOOD (  23.07  )
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

On Thu, 29 Jan 2026 at 13:50, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jan 26, 2026 at 10:21:56AM +0100, Vincent Guittot wrote:
> > Describe the serdes subsystem available on the S32G platforms.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  .../bindings/phy/nxp,s32g-serdes.yaml         | 154 ++++++++++++++++++
> >  1 file changed, 154 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > new file mode 100644
> > index 000000000000..fad34bee2a4f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
> > @@ -0,0 +1,154 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/nxp,s32g-serdes.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xxx/S32G3xxx SerDes PHY subsystem
> > +
> > +maintainers:
> > +  - Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > +
> > +description: |
> > +  The SerDes subsystem on S32G SoC Family includes two types of PHYs:
> > +    - One PCIe PHY: Supports various PCIe operation modes
> > +    - Two Ethernet Physical Coding Sublayer (XPCS) controllers
> > +
> > +  SerDes operation mode selects the enabled PHYs and speeds. Clock frequency
> > +  must be adapted accordingly. Below table describes all possible operation
> > +  modes.
> > +
> > +  Mode  PCIe XPCS0           XPCS1           PHY clock       Description
> > +                SGMII                SGMII             (MHz)
> > +  -------------------------------------------------------------------------
> > +  0  Gen3    N/A             N/A             100             Single PCIe
> > +  1  Gen2    1.25Gbps        N/A             100             PCIe/SGMII
> > +  2  Gen2    N/A             1.25Gbps        100             PCIe/SGMII
> > +  3  N/A     1.25Gbps        1.25Gbps        100,125         SGMII
> > +  4  N/A     3.125/1.25Gbps  3.125/1.25Gbps  125             SGMII
> > +  5  Gen2    N/A             3.125Gbps       100             PCIe/SGMII
>
> Shouldn't the mode be configured via phy_set_mode_ext()?

There is a phy for only pcie only. In mode 3 to 5 there is no generic
phy created

>
> This identifies whether it is operating as PCIe or for networking and
> in the case of networking, the PHY interface mode should be passed as
> the submode.
>
> Have a look at include/linux/phy/pcie.h to see the submodes that may
> be appropriate to pass to phy_set_mode_ext() - but talk to the PHY
> subsystem maintainers.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

