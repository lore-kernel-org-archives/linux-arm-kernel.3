Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84046E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 05:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIKarjSguBzb5vvGdGEBWsVx805GOCvvnK6El20HXXg=; b=HBbZ28ynL4fKgc0vaXwp9wb+zU
	NTYF9xE4k6lsYYXfcNi7bgsgEVHCX0FI6yXcQMkKzzyAAaJYLbmtpeQQO0HxtB0+INvjlzwBrBb9f
	uDn1mbdnGLzT1ljqRykXBeXBtwGobZL+7mCoxjp5Isek5SKl8e6iB6Lr4cPNGQCyzQu9xaS0Lzi9i
	U5CP0XeztlL9DYuc1qT5HwpbV1tnge7wB5VEZSmnwMcEs8UoKIXsgQy5cRlNkLPkUaagK03MBKDhx
	uwMHPiLXIc8yEJvaCaAn4mZc/kvjDZhYwR57wfxHp9lBDAHxvT/MJVo7O/GhBrmrhKqtxsKlNCh0v
	cEXV6+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVjt-00000003zeI-42tO;
	Fri, 20 Dec 2024 05:39:53 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOViS-00000003zLk-1a04
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 05:38:26 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6f27bbe8fc3so12093677b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 21:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734673103; x=1735277903; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rIKarjSguBzb5vvGdGEBWsVx805GOCvvnK6El20HXXg=;
        b=fgrR6kPc14ihgHj9rktWf21j+rybzmDT+pV3FrIwF46E/PrssuEhHcODLnWQto6l8A
         SM7wGz/bq6+t13rm5IkYmBY55IcSM0lRfghu+pAUPeD8wHolc3QY0NeYKuCtAoAFMC4+
         bUCKvf0ZAuxcx0a2n6Bw+Y1e8g6Y05VN9MfDrpEEs2m7Uw9ONi+GPPfR1fFJfcGIwx3L
         LQJKqKA6pLCd1UUT/hM0spPZe47qaiS9MPZq++BcdG0Rr0YAfBC3dma2QhZdP5X1mF7n
         nJ5ihKgZZY2CmfO3h8LE0VMF0mHEUTpLTkB+S98+hpESrQbeWuuGK9ZjiV0um1hJT2gc
         4YRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734673103; x=1735277903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIKarjSguBzb5vvGdGEBWsVx805GOCvvnK6El20HXXg=;
        b=fO9JceMgo+GJVc1iuEtmiLvGF9TblNk0OS5Y9lAIIc17IONa8Jmiw+fh59csjIkcKb
         zQJvYYljuEcQVsgR3VsYVn2TPRZKGqnNlN7RdqVEHBm2+lShi7ycGyfHZdUamwiVJXiH
         GzTsGsFrL9/ZP2mDqjNeGjM+uxUQsYJC9YTTorgdYmgDK24k5MSj9ZqPh+zgHR5kw0MZ
         uFFfIzX56zLHFQXGpQ5NC/4NTgviKOynfnMyfVoNa7Hm613sq4WL71AsfZhLg+LZ8/+e
         uh/s+UXZvk6jo2nJO9/mlXRaQ6s7YUHPCq/rHNwqO8/LnEAUG+PR9Q8pz/FFyjd4eN2E
         h4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGHRV39nMmB+UhVrsxVU240xfw+CYTMVThiRMd3l1uDjWGdsTvhN9Srq191Ff5qaqcUVllhvwkT3/QhR8BBLMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrIJzca8YA41LMsqlw4X5cYYZeQl0yM9qeX3rOwE5pTCR5qRPl
	FgkeX/Bb1c/PHVnJlQcXoO4ZWCTJ55ZbSvfVCu5r/CslLMn4EhmMX+bpM4UlJFsCV7xrKQvYLOT
	3+ILbUQNqX/OW+C8/Q21O7A66CZozhZ97N9FzPQ==
X-Gm-Gg: ASbGncugfMwFWUORdc7ZCcHQAWkwd/NvduxwX03zPO4SgjicJ8a2QSi/2RI0LvIKAZw
	KB8MedCBeShHQlDEDCxiQX/t7/D8+3nHAx4V8yA1+fAFkuQn/Y/tQ
X-Google-Smtp-Source: AGHT+IFzw4UTk3bYJjTLjWStSiQBoWV4fWweBYuliIxs6rVCPb45P2NhqG9sK5ndMaNn705CQufJ7trl8MkIav7ihTk=
X-Received: by 2002:a05:690c:6e0d:b0:6e5:9cb7:853c with SMTP id
 00721157ae682-6f3f822204cmr13331197b3.31.1734673103176; Thu, 19 Dec 2024
 21:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-15-damon.ding@rock-chips.com> <cg7bnhol4gvzji7agxazas7nkxy7zammzy67rjvhp35yqyraju@73daepsbmuae>
 <d2b47813-45fa-4148-8a4a-6cf4a18ee7ca@rock-chips.com>
In-Reply-To: <d2b47813-45fa-4148-8a4a-6cf4a18ee7ca@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 07:38:12 +0200
Message-ID: <CAA8EJpp0Smtqx7VQ5zdg9x3EhuLpk4u4vGv=rv8DHJ0rhei18w@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_213824_431642_4B83C757 
X-CRM114-Status: GOOD (  25.18  )
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

On Fri, 20 Dec 2024 at 04:38, Damon Ding <damon.ding@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2024/12/20 8:20, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 04:06:03PM +0800, Damon Ding wrote:
> >> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
> >> - Add edp-panel node
> >> - Set pinctrl of pwm12 for backlight
> >> - Enable edp0/hdptxphy0/vp2
> >>
> >> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> - Remove brightness-levels and default-brightness-level properties in
> >>    backlight node.
> >> - Add the detail DT changes to commit message.
> >>
> >> Changes in v3:
> >> - Use aux-bus instead of platform bus for edp-panel.
> >> ---
> >>   .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 52 +++++++++++++++++++
> >>   1 file changed, 52 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> >> index bc4077575beb..9547ab18e596 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> >> @@ -9,6 +9,7 @@
> >>   #include <dt-bindings/gpio/gpio.h>
> >>   #include <dt-bindings/input/input.h>
> >>   #include <dt-bindings/pinctrl/rockchip.h>
> >> +#include <dt-bindings/soc/rockchip,vop2.h>
> >>   #include <dt-bindings/usb/pd.h>
> >>   #include "rk3588s.dtsi"
> >>
> >> @@ -238,6 +239,41 @@ &combphy2_psu {
> >>      status = "okay";
> >>   };
> >>
> >> +&edp0 {
> >> +    force-hpd;
> >> +    status = "okay";
> >> +
> >> +    aux-bus {
> >> +            panel {
> >> +                    compatible = "lg,lp079qx1-sp0v";
> >
> > Why do you need the particular compat string here? Can you use the
> > generic "edp-panel" instead? What if the user swaps the panel?
> >
>
> The eDP panels used in conjunction with the RK3588S EVB1 have broken
> identification, which is one of the valid reasons for using a particular
> compat string. So the generic_edp_panel_probe() can not return success
> when using the "edp-panel".

Broken how? I don't see such info in the commit message.

>
> >> +                    backlight = <&backlight>;
> >> +                    power-supply = <&vcc3v3_lcd_edp>;
> >> +
> >> +                    port {
> >> +                            panel_in_edp: endpoint {
> >> +                                    remote-endpoint = <&edp_out_panel>;
> >> +                            };
> >> +                    };
> >> +            };
> >> +    };
> >> +};
> >> +
> >> +&edp0_in {
> >> +    edp0_in_vp2: endpoint {
> >> +            remote-endpoint = <&vp2_out_edp0>;
> >> +    };
> >> +};
> >> +
> >> +&edp0_out {
> >> +    edp_out_panel: endpoint {
> >> +            remote-endpoint = <&panel_in_edp>;
> >> +    };
> >> +};
> >> +
> >> +&hdptxphy0 {
> >> +    status = "okay";
> >> +};
> >> +
> >>   &i2c3 {
> >>      status = "okay";
> >>
> >> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
> >>   };
> >>
> >>   &pwm12 {
> >> +    pinctrl-0 = <&pwm12m1_pins>;
> >>      status = "okay";
> >>   };
> >>
> >> @@ -1168,3 +1205,18 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
> >>              };
> >>      };
> >>   };
> >> +
> >> +&vop_mmu {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&vop {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&vp2 {
> >> +    vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
> >> +            reg = <ROCKCHIP_VOP2_EP_EDP0>;
> >> +            remote-endpoint = <&edp0_in_vp2>;
> >> +    };
> >> +};
> >> --
> >> 2.34.1
> >>
> >
> Best regards,
> Damon



-- 
With best wishes
Dmitry

