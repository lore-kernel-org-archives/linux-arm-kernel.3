Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EA8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGA4yt8JGp+St6is/Io1asPfAbg43aJnzQEEcQdlRFo=; b=yULBnKCv/HiZ1tYU/6DKx7OCUN
	ejYR6oDXgXBLa80Zcb/tx4aUCmWIfSJxWrmizHE+mAMVbOa4rSYbOLgovwqiOVK6cgy4wEvSJVlBU
	i0OWR/k1AByEjutMT8jqZ7IhlV+fxAjk50kj7LjorutouByye7lkx6q2WmznJs8FrbBp2qKm4siJG
	+2aZ/MXSIaHU1gcwXMwYo6JtYb+mGuRTyh24AgBs7s5MMRkAYPsoN7BsuZBVZKYNRIbTWKVp6qoNi
	zucKqD0Cd3RpMj3bYdTgOCYnEdRhwNAD36GZVuuSNtlht43HuPY30oP/h3KLihp/zox6MZtnP9mSK
	SaC+/fBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcAr-0000000DZeC-0Hh4;
	Wed, 05 Nov 2025 11:59:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcAn-0000000DZct-24fA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 11:59:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so7421182a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 03:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762343970; x=1762948770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGA4yt8JGp+St6is/Io1asPfAbg43aJnzQEEcQdlRFo=;
        b=e0eDOnngTcyH5pqjQqc8MmghkQvU618fkvJ7sxz4972BE9v9uVopws2qaskPXGjhM5
         LUn3pov7jXoqLAa5rcGsfont4ujAJV9tFi9Ss7XVTkF82Om84I00ptpNtv68YyFp9mbw
         k7lU1Gg7HvAVrmtgSlwFR+4QwOyEB3c5GusnbNGWd1/NEH9LY+kb1VJSZbhooYmRjUBP
         AKCTDOnFnaY5YbcYVwTMFiT7Yy8vl8E9kUpEgFmDLJkYTeq1k/zVS0V8vp5uQ8eTkV6F
         mM0nc8ocUaxxegOEEb5DJOmGHjyRnmkbFfxn1tI0CXXAsPJjrL9Nk98r3sY0yquVlAFa
         U5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343970; x=1762948770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGA4yt8JGp+St6is/Io1asPfAbg43aJnzQEEcQdlRFo=;
        b=JzjIMOjmEigQiopW1ZvMLAIoKc3yGR08ibH7A3dwQhj5DzTGtDjH5flYpeXkmltpxO
         ds6eDarcfXDQQwS3x+8T5HKYtY3mixqejvJLG4h2cLwDetiHtNI9mocQ5cizj+MI/Uo6
         DwV1fL9oYdSx0g3wJ6C5GqvYho4rlpEChV9p2Qj56F6U5EDXxtMRO4Hs/zkDCiefvRfh
         HRjYWeJF3Uj0w8tt3VN5nrvd/5X/fVsdvBrc9NJPGOgbVuiVJBfNGR4YIS96bEW7aaB8
         Spstnb5F8NuvPOa7l58O/o5kFllsTEKQwYFxvl3YdqSI6eD9WP8G949odQhgDJLZAy8d
         khiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrYahO2vMC8rip1wRx8PPxVCw6+JDxAR5vbA/5bEpZ3Igx0rvclZegE53Vsok9HlVuPioGg6q8mptyxyqoGyiv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7j2JIH9tR+Bfxu5qNSH0DHFQzNOvFzQFpjt/5sYET7JPH7ApN
	b5AKvJP78WTVCmuG+5UTB3BKin14sUTCdP8hgqjIime2cD++uzbQZoAnJd2Qa5VxZK4LC/sqvNc
	hp8uGogHXmJcmlbxGEQkyNTFgWAc2YEA=
X-Gm-Gg: ASbGncuWJKR95Za8Vp+ozP0iyl9CzgmstYU4GLE1skH7KsbBY6fkpb3WDGdHeRuVP0a
	uJx/YTdaruOuM54Vw/V2xWH8lrh/vHgbFelstOyPaP83sZzx+u1OrXZ4XVxgj2cJgH3fpA02DGj
	GFi4WZbjq1wpi9YHCWw42T1BszSrPmxzx/vskC0r6NFeLDpPLbhsTHRKyculEyt/o3DDsqUzCbL
	eMPKSF+vaLfAEoEW3nFycPyghKdW3KuEo7A5n0SJdv7vPm+avnlc8A/LuA=
X-Google-Smtp-Source: AGHT+IHz+PW+hI6DHk/+yycP53/owJKFK51FLmbG3Xn9iePHYqTjIDevvgVm2fd1OHm0B5cu1KiyF7i4XCTMNvcSxeY=
X-Received: by 2002:a05:6402:50c8:b0:63c:1e15:b9fb with SMTP id
 4fb4d7f45d1cf-64105a4c967mr2540436a12.22.1762343970155; Wed, 05 Nov 2025
 03:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20251017073954.130710-1-cnsztl@gmail.com> <08911ae2-fef3-432d-a236-d820c9cb67ac@gmail.com>
 <5af928c4-4b6e-489c-ad39-26cef3dd7473@gmail.com> <10751338.nUPlyArG6x@phil> <e52de2b5-bf10-ce0e-66b7-66b1c46525f3@manjaro.org>
In-Reply-To: <e52de2b5-bf10-ce0e-66b7-66b1c46525f3@manjaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 5 Nov 2025 17:29:12 +0530
X-Gm-Features: AWmQ_bkTo815Ekf1XKwqKW52Tftmcvjv3vglHmEOmCXrknL0gcm_NsK2eBkal2U
Message-ID: <CANAwSgRXwozYr8sYtV8RRb1jJAb=9VNPfsLGMmW=f38XV-u=MQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Tianling Shen <cnsztl@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Jonas Karlman <jonas@kwiboo.se>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_035933_577067_D508AEC0 
X-CRM114-Status: GOOD (  35.35  )
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

Hi All,

On Sat, 1 Nov 2025 at 18:21, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Heiko,
>
> On Saturday, November 01, 2025 12:54 CET, Heiko Stuebner <heiko@sntech.de=
> wrote:
> > Am Montag, 27. Oktober 2025, 18:34:25 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Tianling Shen:
> > > On 2025/10/20 12:44, Tianling Shen wrote:
> > > > On 2025/10/20 9:53, Shawn Lin wrote:
> > > >> On 2025/10/17 Friday 15:39, Tianling Shen wrote:
> > > >>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> > > >>>
> > > >>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O error=
s and
> > > >>> corruption when using HS400 mode. Downgrade to HS200 mode to ensu=
re
> > > >>> stable operation.
> > > >>
> > > >> May I ask you to test another patch I just posted to see if it fix=
es
> > > >> your issue?
> > > >>
> > > >> https://patchwork.kernel.org/project/linux-mmc/
> > > >> patch/1760924981-52339-1- git-send-email-shawn.lin@rock-chips.com/
> > > >
> > > > Thank you for the patch! I will ask my friend to test it but he use=
s
> > > > this board as a home router, so it may take a few days or weeks to
> > > > report the result.
> > >
> > > Hi all, sorry for the late. My friend has tested this patch and it wo=
rks
> > > fine after 50 times dd operation. A big thanks to Shawn!
> >
> > So I guess, we don't need the patch reducing the speed anymore, right?
>
> Exactly, the approach of lowering the speed of eMMC to improve
> its reliability is no longer needed, thanks to Shawn correcting
> the DLL_STRBIN_TAPNUM_DEFAULT value in the above-linked patch.
>
> We just need to test does HS400 work on the ROCK 5 ITX reliably
> as well, so the previous lowering to HS200 in commit b36402e4a077
> ("arm64: dts: rockchip: slow down emmc freq for rock 5 itx", 2025-
> 02-28) could be reverted as no longer needed.
>
> > > And hi Jianfeng, I found you made a similiar patch[1] for the ROCK 5 =
ITX
> > > board to lower down the mmc speed, could you please check if this pat=
ch
> > > also fixes your issue?
> > >
> > > [1] https://lore.kernel.org/linux-rockchip/20250228143341.70244-1-liu=
jianfeng1994@gmail.com/
> > >
> > > >>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
> > > >>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> > > >>> ---
> > > >>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
> > > >>>   1 file changed, 1 insertion(+), 2 deletions(-)
> > > >>>
> > > >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b=
/
> > > >>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > > >>> index fafeabe9adf9..5f63f38f7326 100644
> > > >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > > >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> > > >>> @@ -717,8 +717,7 @@ &sdhci {
> > > >>>       no-sd;
> > > >>>       non-removable;
> > > >>>       max-frequency =3D <200000000>;
> > > >>> -    mmc-hs400-1_8v;
> > > >>> -    mmc-hs400-enhanced-strobe;
> > > >>> +    mmc-hs200-1_8v;
> > > >>>       status =3D "okay";
> > > >>>   };
>
You can also try this patch, which enables stober in the eMMC controller..

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c
b/drivers/mmc/host/sdhci-of-dwcmshc.c
index eebd45389956..62c9faf8ec85 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -77,6 +77,10 @@
 #define CV18XX_RETRY_TUNING_MAX                        50

 /* Rockchip specific Registers */
+#define DWCMSHC_EMMC_CTRL              0x52c
+#define  EMMC_CTRL_CARD_IS_EMMC        BIT(0)
+#define  EMMC_CTRL_ENH_STROBE_ENABLE   BIT(8)
+
 #define DWCMSHC_EMMC_DLL_CTRL          0x800
 #define DWCMSHC_EMMC_DLL_RXCLK         0x804
 #define DWCMSHC_EMMC_DLL_TXCLK         0x808
@@ -660,6 +664,12 @@ static void dwcmshc_rk3568_set_clock(struct
sdhci_host *host, unsigned int clock
                        DLL_CMDOUT_TAPNUM_90_DEGREES |
                        DLL_CMDOUT_TAPNUM_FROM_SW;
                sdhci_writel(host, extra, DECMSHC_EMMC_DLL_CMDOUT);
+
+               extra =3D sdhci_readl(host, DWCMSHC_EMMC_CTRL);
+               if (extra & EMMC_CTRL_CARD_IS_EMMC) {
+                       extra |=3D EMMC_CTRL_ENH_STROBE_ENABLE;
+                       sdhci_writel(host, extra, DWCMSHC_EMMC_CTRL);
+               }
        }

        extra =3D DWCMSHC_EMMC_DLL_DLYENA |

Thamks
-Anand

