Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3FAD4661C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+Y9JPHMLgTUXc+ecELZBiMS5bikr+UFRMXA2sNtZ1A=; b=Kn3U4CEmoUUN7FRMwS/jS9sHKK
	5rAVB4zXbwpvNAKdf8OwAxoVoXGfjZr3b5EfSIFP6YpiwjLQXQQVhX71ZpzBZUvwKPSwOvK7AeaEU
	Jc9LKsZgo7NVbwhbxL4qUEFSeFdijPnNl02WgArTiRNbfq1sbmWBlJCo/LlvT3/Pkx4whbimwqpeY
	oaKatrq8FTORmEXJA3ChNf2Lfi18eoDq6VGFrc6xHKiJ38Z4t4jcrB7042+rQ9+YiPicOEXuNOl+x
	yDOYoySZAVZf0oiks1vARJ5MANN2IyKhuOYJP4fSuRlXsW2ftXOWNhO82C0ETK9AynC8mF/FiOo9K
	hg3/NkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTCC-0000000D5VJ-2geE;
	Thu, 15 Jan 2026 19:39:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTCB-0000000D5UF-26eS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 19:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u+Y9JPHMLgTUXc+ecELZBiMS5bikr+UFRMXA2sNtZ1A=; b=mgNEENa0IPrQYjaQqPfWr7pRtK
	bvO5+AAVKNA5Z2H99dOYqRtx4c5+MXmRNgFuY2uIe4yaYA6jaX7wbLNVWLbpE6qtMom/NeFd6ShS9
	LlqjZqZq7/gUHw2aZZ4hhfLwwXIoWyEO88qpkmX22WTYPs4QVhhwvgaEwB1L0nEZbzqsG4Ix5IJlo
	+BL/COl53dNqKaisD7/wcqLEMNwNo2/+EG+d6DBnej1+HTUFrr3MET+aeUIramh7vxKYTm2rZKtwv
	wHak+hwJcpw95Hna9OlNrEmtwLU/3wIL6WFmfAEkFVrXg+L7sJIHDwsieo9keaPUNOWvsdUp33eCk
	B1UnQQOw==;
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTC8-00000007Wnm-1riE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:39:50 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7cfd0f2ef93so582216a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768505986; x=1769110786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+Y9JPHMLgTUXc+ecELZBiMS5bikr+UFRMXA2sNtZ1A=;
        b=jVqA0BGXhi1xpwlhmqrKVeOUQ44f08dRE6qjFbJ4BiqE+siw3whHtaa68OnIudngDH
         xOgebO+IL86lEvLIMnTEgfceYKQ06pPT06wxxN+hM4jvNx0Lm7NxIkFUT5dIAaZTXN7z
         6hjESc3Sj4vQoeClpOd+84gEV/35GFUsMoxfX4dV8XM8Btln5PcyRH0mIBZL4reOW9/0
         OSqFYNpu5SNSYpX3qH/eoISxkz+FytI7Pp/yOnfQgWfcFO5dBHAvr5NyL51eHyhXEstQ
         N8OVU0vUuc/iE0toZlzj75fJ4W3qgo7yzUG9YMals9Q5gIpCXBBHX49zwLpfsX2jS9v7
         rnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505986; x=1769110786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+Y9JPHMLgTUXc+ecELZBiMS5bikr+UFRMXA2sNtZ1A=;
        b=dFO9umD4WTiec1pFz3P0WepEjxcJSyxBSWYezrTCl2w3ehESbIG9AXboUc0mBR2knP
         5Mwk+kazsxMcEeNpURP/zGCQhPQxe93zU4b7Ip+KMl30iG+1BYAUIHTOoAuH+ABNPgAy
         bE4Dmf9UYz8xCaB4S5myvqgctJ6fIFF7X9QibZoZfb+wobSvMXxVvpqEKecx1hABKkhB
         TurBsouqiX3O6pYhP3JCFllvxcM80QfqDxZhxXWlDRVfqL5/LjcxDPujx1zlCKKDWvTf
         5B/JqqNWLov7agKuPO6W+RumG55U19OxGz1Afox37vVNuuGkQ7HJZ1m2/+Ga73ImCa5+
         oryw==
X-Forwarded-Encrypted: i=1; AJvYcCVgEp57bSAoR/jfMYeL9hMLcjlFiLZakhWJwgPXji1K3oct4UqEqN/c4GyJQpIPuFfTVhH6skC26nwaDMQleCGs@lists.infradead.org
X-Gm-Message-State: AOJu0YxLV73b7hirk36F4RXQl0/2CGNfAWUE3wIr8Uh8Zyy6/QtM9Bxn
	A6HXgzD/JO4eZuZPzoThPbaBu4Q4n/A34/UGIBLCvkeZLWogQ567+7jGeXgBePFnrOD4/92yigj
	kdX1HEYzlMfZVrLaLernDOxi3eIv+f2U=
X-Gm-Gg: AY/fxX5rg0kHE2FCqS7UdRU9wfT3+CE4hDhhRvxTzRYyEtlDSGc7aoz4Nda1OhE52l4
	O54eCyDPlFsaMkV52ogu5FuQcWYcNfmxKZXfQX4KsDRzhqmkqKu4SbbU3desiS/kfwY7yQw5ATI
	+la1177aHarGT0JpCamKOihU5d/Dwva42LDDZnLPk0QrNh7FMzJDireioRrL5Cqsy9yT4+77c/E
	eXIZXhu3yzxcfnZO9l5puzO7uUWyiQPYftJpuWrtN+KzbX63gSSushmxUlJX+vvqgnnCUAbcFMQ
	bxR4Sc3pPZpp2/xlz4IH2KAdMA==
X-Received: by 2002:a05:6830:6f87:b0:7cf:d119:9953 with SMTP id
 46e09a7af769-7cfded88a2dmr339380a34.16.1768505986076; Thu, 15 Jan 2026
 11:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <67ccb8f6-f9bd-4266-b79a-b688bd6d030b@rock-chips.com> <8536413c-8687-4d75-befb-8f25e54838bf@rock-chips.com>
 <6934ae0d-16c5-436f-97f6-c11d304ca51d@rock-chips.com> <CAGJh8eDXT43_PfmUbShL4Hysfkd21R=sCerRNe_AGQANbwvSPA@mail.gmail.com>
 <b49b223e-e728-4ce9-b972-242ed9b5fa4a@rock-chips.com>
In-Reply-To: <b49b223e-e728-4ce9-b972-242ed9b5fa4a@rock-chips.com>
From: Marco Schirrmeister <mschirrmeister@gmail.com>
Date: Thu, 15 Jan 2026 20:39:34 +0100
X-Gm-Features: AZwV_QiTFtSgqSyC27FsHbFXergz67zSshuEZxUAYX8VeT_CedW_QILqNjpuJNs
Message-ID: <CAGJh8eB0i5UYN=05SfNGQc4dMA5_ffktErY8GjX85JWjDna3Dw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] mmc: dw_mmc-rockchip: Add stability quirk for
 NanoPi R76S
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	heiko@sntech.de, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_193948_606704_B0E0F43B 
X-CRM114-Status: GOOD (  26.07  )
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

Hello Shawn,

On Thu, Jan 15, 2026 at 1:25=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
> >
> > Based on this, it makes me believe that power to the sd card is complet=
ely cut
> > and when it wakes up and knows how to continue, it still must go throug=
h the
> > retraining phase.
> >
>
> This is another mistake for your NanoPi R76S board. Before sent this
> patch, I already checked the dts and saw sdmmc uses vmmc-supply =3D
> <&vcc_3v3_s3> which is marked as regulator-always-on, but it's *NOT*
> actually per the shcematic[1][2]. So need another fix for your board
> to make it actually gpio-based power controller instaed of function
> IO based, as when powering off the power domain, the power control bit
> will not be able to maintain.
>
> [1]
> https://wiki.friendlyelec.com/wiki/images/6/60/NanoPi_R76S_LP4X_2411_SCH.=
pdf
> [2]
> https://wiki.friendlyelec.com/wiki/images/9/90/NanoPi_R76S_LP5_2411_SCH.p=
df
>
> Except for the patches you have tested, please append the blow patch as
> well to test.

Bingo. These DTS additions fixed the power stability for the SD card.
I have verified that the card now wakes up instantly with no errors and
no retraining delay.

I tested this both with and without your driver patch (the save/restore
phases logic).

This confirms the issue was indeed the power rail being cut during
idle periods. Great find on the schematic!

> --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
> @@ -192,6 +192,18 @@
>                  regulator-name =3D "vcc_3v3_s0";
>                  vin-supply =3D <&vcc_3v3_s3>;
>          };
> +
> +       vcc3v3_sd: regulator-vcc-3v3-sd {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&sdmmc_pwren>;
> +               regulator-name =3D "vcc3v3_sd";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&vcc_3v3_s0>;
> +       };
>   };
>
>   &combphy0_ps {
> @@ -726,6 +738,12 @@
>                  };
>          };
>
> +       sdmmc {
> +               sdmmc_pwren: sdmmc-pwren {
> +                       rockchip,pins =3D <0 RK_PB6 RK_FUNC_GPIO
> &pcfg_pull_none>;
> +               };
> +       };
> +
>          usb {
>                  usb_otg0_pwren_h: usb-otg0-pwren-h {
>                          rockchip,pins =3D <0 RK_PD1 RK_FUNC_GPIO
> &pcfg_pull_none>;
> @@ -751,11 +769,14 @@
>          bus-width =3D <4>;
>          cap-mmc-highspeed;
>          cap-sd-highspeed;
> +       cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
>          disable-wp;
>          no-mmc;
>          no-sdio;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det &sdmmc0_bus4>;
>          sd-uhs-sdr104;
> -       vmmc-supply =3D <&vcc_3v3_s3>;
> +       vmmc-supply =3D <&vcc3v3_sd>;
>          vqmmc-supply =3D <&vccio_sd_s0>;
>          status =3D "okay";
>
>
>
>
> >> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> >> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> >> @@ -36,6 +36,8 @@ struct dw_mci_rockchip_priv_data {
> >>           int                     default_sample_phase;
> >>           int                     num_phases;
> >>           bool                    internal_phase;
> >> +       int                     sample_phase;
> >> +       int                     drv_phase;
> >>    };
> >>
> >>    /*
> >> @@ -573,9 +575,43 @@ static void dw_mci_rockchip_remove(struct
> >> platform_device *pdev)
> >>           dw_mci_pltfm_remove(pdev);
> >>    }
> >>
> >> +static int dw_mci_rockchip_runtime_suspend(struct device *dev)
> >> +{
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       struct dw_mci *host =3D platform_get_drvdata(pdev);
> >> +       struct dw_mci_rockchip_priv_data *priv =3D host->priv;
> >> +
> >> +       if (priv->internal_phase) {
> >> +               priv->sample_phase =3D rockchip_mmc_get_phase(host, tr=
ue);
> >> +               priv->drv_phase =3D rockchip_mmc_get_phase(host, false=
);
> >> +       }
> >> +
> >> +       return dw_mci_runtime_suspend(dev);
> >> +}
> >> +
> >> +static int dw_mci_rockchip_runtime_resume(struct device *dev)
> >> +{
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       struct dw_mci *host =3D platform_get_drvdata(pdev);
> >> +       struct dw_mci_rockchip_priv_data *priv =3D host->priv;
> >> +       int ret;
> >> +
> >> +       ret =3D dw_mci_runtime_resume(dev);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       if (priv->internal_phase) {
> >> +               rockchip_mmc_set_phase(host, true, priv->sample_phase)=
;
> >> +               rockchip_mmc_set_phase(host, false, priv->drv_phase);
> >> +               mci_writel(host, MISC_CON, MEM_CLK_AUTOGATE_ENABLE);
> >> +       }
> >> +
> >> +       return ret;
> >> +}
> >> +
> >>    static const struct dev_pm_ops dw_mci_rockchip_dev_pm_ops =3D {
> >>           SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >> pm_runtime_force_resume)
> >> -       RUNTIME_PM_OPS(dw_mci_runtime_suspend, dw_mci_runtime_resume, =
NULL)
> >> +       RUNTIME_PM_OPS(dw_mci_rockchip_runtime_suspend,
> >> dw_mci_rockchip_runtime_resume, NULL)
> >>    };
> >>
> >>    static struct platform_driver dw_mci_rockchip_pltfm_driver =3D {
> >
>

