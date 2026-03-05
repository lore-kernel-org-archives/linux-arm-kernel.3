Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47560F30955
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/B3L3Xu38pLEI9aWzEuoVdxX7Qp2NIDeM+Gg1/xjBI=; b=tmYw3GIBtzy7AjdyCK5hjqczEL
	w+qf0G+cxNEy3YOtYxPRSnpbvuDR+cXiOIDIjWYDtBiLqF3TSGhhCMEJzxr9oRKbtsicdLZswxq39
	/OeeQBFjXGk0M1eV/lUBxw7B4oyd7QZs8S9z5awB1SlLQ0P3N4GsRSy8CP1mpvlJMG7dtF6e9L9UC
	B9OmoPK9GevB45g7Mbd8Bpp9/Q4X4IN/T9mGILaIqEs1NBuV+nGkOE0UXheIQwM/XpytjsAPDZbx/
	4dm4dxWwtmbq7pu+1SGNDbZgjSmLnWZRwcL/vCovSBAimQV008wIrxa9y93n7ip37tr77DmrXuplF
	NivKp3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy84X-00000001nrx-46Wb;
	Thu, 05 Mar 2026 12:44:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy84U-00000001nqg-3bm5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 12:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83FC143F57
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61057C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714694;
	bh=7/B3L3Xu38pLEI9aWzEuoVdxX7Qp2NIDeM+Gg1/xjBI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OtqYMvb5oPxe5sMzeuWM/p9QhfY79P8WSa8Oc0dmxSoFCqAxC+CeiyJ4NR/CKYXp5
	 2pWsVJ/8dTjJPaOTsMOrLWg9QrWyIT17qWYKoWkp2uev1+hKn84FX5s0QnjAl8bNE/
	 7JpPIBkXPhGvuxF9NkQde6xY7s3+z78cNibHOOJcW8DPll2R+OOPS/ZPgglANmm0bm
	 z+fq9gwNqWVY2cpjU7AjP46t/Fi3qyyprLoCv6ETr3JC7/UsdbQoEj4fnlA7mjJ3u9
	 kpBnTLkqR3bbedcx3T7TtOd2iumdT2sN3/QFxWt88OY6wGjq0mmb5qwwhn72EVc8bD
	 zEhwMty5ybC+w==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad46a44easo7001845d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 04:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwx8Z0EUv0hwayaWYbhvACAPANcftWAhmSdGVNu8AmfyrEMyn8dLMvxXrasYFMDSrbgF7vpz9Ls4AB8kyi1TnA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Vze5iOtA5BLI2wC1ik3f0nBWmq5UAmAspKLP0EnCnIajBE2K
	cu3lf92lnvQ483G+hBDGScCuseEW4nsdYVrrU429KLkLDWh7ektlh2OkEo/5q9Kb5rEBRP1UNe2
	K7iPl+/cxA9mueGcfG1OVSEvtcGf51cc=
X-Received: by 2002:a05:690e:1a12:b0:649:5a6e:bc88 with SMTP id
 956f58d0204a3-64cf9bac208mr3552462d50.46.1772714693758; Thu, 05 Mar 2026
 04:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-19-vladimir.oltean@nxp.com> <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
In-Reply-To: <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:44:42 +0100
X-Gmail-Original-Message-ID: <CAD++jL=m+cEcqy1i2H0tdeBa3Sy76myGAR9HdBqrT4u-x5v50A@mail.gmail.com>
X-Gm-Features: AaiRm53u9phsGhzUDeKiqEnTp_X3DfbqaQ7dJ0SVurbn78IH1263DExaHPtG4YM
Message-ID: <CAD++jL=m+cEcqy1i2H0tdeBa3Sy76myGAR9HdBqrT4u-x5v50A@mail.gmail.com>
Subject: Re: [PATCH phy-next 18/22] pinctrl: tegra-xusb: include PHY provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_044454_948392_B4A97541 
X-CRM114-Status: GOOD (  14.14  )
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

On Thu, Mar 5, 2026 at 1:43=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
> On Wed, Mar 4, 2026 at 7:00=E2=80=AFPM Vladimir Oltean <vladimir.oltean@n=
xp.com> wrote:
>
> > The tegra-xusb pinctrl driver is also a PHY provider (calls
> > devm_phy_create() for PCIe and SATA). However, according to Vinod Koul,
> > having PHY provider drivers outside of drivers/phy/ is discouraged,
> > although it would be difficult for me to address a proper movement here=
.
> >
> > Include the private provider API header from drivers/phy/, but leave a
> > FIXME in place. It will have to be moved, eventually.
> >
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>
> Fair enough, is this a regression so I should merge it for fixes
> or just a nonurgent fix that I can apply for next?

Sorry I realized it needs to go in with the series.
Reviewed-by: Linus Walleij <linusw@kernel.org>

You can take it from here.

Yours,
Linus Walleij

