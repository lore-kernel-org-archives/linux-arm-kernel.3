Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E02ACA5FFB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5gMLbV/jw9kkirryyuOIwhlWMMVSVE/lAczumiLD0w=; b=Yj5G1P4wOMpXonH3e0Yzv+YN28
	qMUG7OlSyWZVpXwSMRaMaFZIhTnzu8TheXGTrT8oNCJz0MWy05WMYADHkBLuvCmhOhdmRpD5fV3jy
	cEBb805PG9Or4PPbh9U0EieSdTTtZH78tslNJ4I2FZFxD/Rns61VcTx6BHo9EVqQf/KRhpr1PUOzx
	8HSFuPWd+1oFpNGV5tGgJLnPs84f2rJaQzYyfL3ksyWW+JmsKv3W3bW145jo7czteX6YoL2N+sfMn
	X++Zb608xVME5RTMDFI2TalN/QEKztij3HoLGgT1bkAvT/1ddEyuntm3LIPatdatIN71bR/OPvENW
	E40tc7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkDn-00000001X8T-0TXO;
	Mon, 19 Jan 2026 08:02:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkDj-00000001X7j-3cFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:02:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so5848810a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768809761; cv=none;
        d=google.com; s=arc-20240605;
        b=fy3QC4/YTl8UIRwpvPvn6eIhugGYsGRmghtiGtEAp2JtzK4/XQ5VJHpcJEBoEXbIyz
         Sf7hKdrbK+Trc7fISydpnB/+XOwqRzmFMYTx81NFeN4jhEjnpgDAj9+RFC4kHDccrv2Y
         VWLn2lHlGeGrHSGjssTcGRUxdbjcO9nve8x9JBcGDNG2lctqZlttLMOF2VExXN1CSHqs
         Ef/5/+iCTkVvRGDrU0/rDGOVmtsodOZyPgg+4dR3PeEt4+GOvrriS82EBEE2TrQNxqaS
         /Aqg2dXMqkQI88BHq78AV7zJ0TH1WfBsRsuFfXN1CDapbOu5WYscbNSLg2vEmF+HOo/1
         Qp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E5gMLbV/jw9kkirryyuOIwhlWMMVSVE/lAczumiLD0w=;
        fh=MZ/NOTP2z1yK6XpVovTDVhA61IeBKWPTvrkjXfer/a8=;
        b=Z8p49wd9fZVm1KCla3stqFoGOg7kvMCyxQ3s4cx40iFWVykvkvp8b8iz/BOENEurmI
         UYC2JgpS7Q+mwYYyrU/qab4Arl8/Hek9dGy9uWhxeuWpz+aqNlWkp9HOs4upVI15F62Z
         Qd7EZmkXTU9j4OJXRLEWyDg5bsQ3CKGB1ITDajb06BM3OeWebHdkGd3AYJSok8XL6ged
         3NcL7Y0XLN2+lGdI0TOqxxSsHUD2KKh8wWZZOaZeWePxRBUpsbAjbRCU67Ni8/Jm2bw3
         TdlLIqzGZsFDkCdFozAaALsdTC4oPv9naKryrhgKwjlUD2F+akRO566YB3+UqkmNAGpo
         vqqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768809761; x=1769414561; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5gMLbV/jw9kkirryyuOIwhlWMMVSVE/lAczumiLD0w=;
        b=QQVFHD5PxlaK8bBj1JqD3H7bQR1RDit13SYtFOM3AWHr56VQnYWQz0sxF+/A7XHu8+
         jZU7SU1VlqO0YKG0O4Dj9emU58A7DL3ph2BCHzV75rduSIpEXxr06ErtFQD9oGj4R3fm
         BBDaQJ+YrgnmbMX1FLXseLHCm1kDC9y1Mjnc+DChI+GJxJzdhVYTb3bksewIN1Y3dUyx
         zWIjU7C3bVS/qyufL7j7k5+HsLSFrhWD69za3PO83YLGS9Z3hFRcNO0y18D7hGIUABmU
         idr2h49iA/+uGWtDJp1cRc2wyfzHwWn7boowdiad2xNrR2AnhProybjy2z0bKf4YTEk6
         cJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768809761; x=1769414561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5gMLbV/jw9kkirryyuOIwhlWMMVSVE/lAczumiLD0w=;
        b=BvL5mAIa5sPNSjnq79HLHNnmPvpzeF5ZhGYkmrzTwddaLZ/+DcSzyQqG4M7gsLTrUG
         NXLEF8jrpLGAxSck85M3PIPps42KqmF/vuv1rsG14LgL+zQSMLNtP194jei0tg3KXXLo
         1V3vo4K9MmP1nYW2P2SBK6w8OfggU+UfjzAWN0Tpci8+lLNe3BTpsu8x6BBBgytn5orp
         jrzBRKbbEArMZx9Vk5yF4lX8iI0b9ZtG46SyVv71aT6nvd2b7DNhsoMEMaCRa3GGQL86
         bgiMaVzRa7e9c5afXr4ftzqRqMq1J4UsR88j+4rWJptE3cvkDkKPnK781KTDGOQQ07+V
         Nw7w==
X-Forwarded-Encrypted: i=1; AJvYcCUtNxVbroI7GjUb0e0R/qhgXCKimQMwB9w8v8CU44eXjilZMacGdrOn0XnB6vxJHQigukMbao4QzL2B7rF37PIb@lists.infradead.org
X-Gm-Message-State: AOJu0YzqReLP0tNprGSNUHBrpqEfpE9Vm5rwTlC2ZWRNT12wfj/QHEqc
	PUagnpodUKVzAYuK6chY+zJfi2NLewSxeZhq1YZLK7JkuoZwtNKVBn0JatqJ3onTGsRP5PH9+uH
	Xjghu14mE9FuGa0IRThQyYpJUkH7jovo=
X-Gm-Gg: AY/fxX4WWAKIGoAUzlrs5uot/jtfxpSeRm5fJrL6PtbNGmsjAAjyLBJM/DMwhVQLNRn
	72LlwuvgxhnjwDkX8oCY37idZGzAz5JBEXNv+uInj18HHVgukNva6CmHcB+2j6xarvQYxcBNBD0
	4mXuAS+tp5BRpreLdWh5rl+9Jcv60lDXcz1bXYTXOTzPM1LmiRval5oJusdD/uhStCbOrujBuuD
	Hpojk2acl0FzrnTC3N1x2urCkpCFHSs6wF2m45QrRjw6bP65pKy15tQ2kD0gDRsj332DmPEDohl
	uOy1Cf7rHdLtyfogvf1UPbm/BEL/Btq3W7T5Lvl/fUua4fLJd8bvxB9G3EK5JcJ7IvTCzljKZEX
	Ck5oBN2mKkDBo6CNZQM/VpsgHIrder7RQG3M9hQ==
X-Received: by 2002:a05:6402:2549:b0:64b:993f:ce05 with SMTP id
 4fb4d7f45d1cf-65452bd116fmr7271933a12.24.1768809761107; Mon, 19 Jan 2026
 00:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20260116151253.9223-1-jerrysteve1101@gmail.com>
In-Reply-To: <20260116151253.9223-1-jerrysteve1101@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 19 Jan 2026 08:02:29 +0000
X-Gm-Features: AZwV_QjD9hcUQzta7ih2I8JDpblRClcNe5NlO_infM0IaHOPiePu7HjjLZlFx5U
Message-ID: <CALeDE9OC7p6XMMwPk8_vsBe09RJHBK8KED=YAcykYqpQXzVfyQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Do not enable hdmi_sound node on
 Pinebook Pro
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, heiko@sntech.de, dsimic@manjaro.org, 
	didi.debian@cknow.org, conor+dt@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_000243_906925_EBA48189 
X-CRM114-Status: GOOD (  19.72  )
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

On Fri, 16 Jan 2026 at 15:13, Jun Yan <jerrysteve1101@gmail.com> wrote:
>
> Remove the redundant enabling of the hdmi_sound node in the Pinebook Pro
> board dts file, because the HDMI output is unused on this device. [1][2]
>
> This change also eliminates the following kernel log warning, which is
> caused by the unenabled dependent node of hdmi_sound that ultimately
> results in the node's probe failure:
>
>   platform hdmi-sound: deferred probe pending: asoc-simple-card: parse error
>
> [1] https://files.pine64.org/doc/PinebookPro/pinebookpro_v2.1_mainboard_schematic.pdf
> [2] https://files.pine64.org/doc/PinebookPro/pinebookpro_schematic_v21a_20220419.pdf
>
> Cc: stable@vger.kernel.org
> Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>

Looks good to me.

>
> ---
>
> Changes in v2:
> - Rewrite the description of change
> - Link to v1: https://lore.kernel.org/linux-rockchip/20260112141300.332996-1-jerrysteve1101@gmail.com/
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index 810ab6ff4e67..753d51344954 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -421,10 +421,6 @@ &gpu {
>         status = "okay";
>  };
>
> -&hdmi_sound {
> -       status = "okay";
> -};
> -
>  &i2c0 {
>         clock-frequency = <400000>;
>         i2c-scl-falling-time-ns = <4>;
> --
> 2.52.0
>

