Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683FF109B493
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBdTZ4XJk/aBrMhfzRVF3zUCulaowGOaG9ZKyP9cK7U=; b=hT1yd3iDV4bwA8qt3qojYMZsjb
	3fLqf9GNQAQ/kgkTw+mQuubwAcRPdHFj0ithX9cU9efIs5OG1kNhFutpQOvdGdODOJkH3Y5irwFG5
	WtIyFw0Ea1t/eaJJQXcQnb3cCo/Omadas+xl8vIdxhxgS+7MwBQYxvzDh+9kDuo/FnCycjGnYLzIu
	WVQ+tKC6KWCLWbgtR7lqYgb0AheqmTN9Vy5b/J1+LHt7x5n/assKsRLedcVDYOvIR1CYZl+iNNVFa
	z84ilCtisbAgNK6z7cOspAw1Dlh3GWGc+n2Iv4ngwyycubkzESj1FLzinIpIALdrpgmdMAy7wBRci
	3cXxgsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bZK-0000000DE7a-24Xh;
	Tue, 31 Mar 2026 16:03:54 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bZH-0000000DE7A-3iEE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 16:03:53 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-6500040ef83so5338878d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 09:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774973031; cv=none;
        d=google.com; s=arc-20240605;
        b=A+A7qSubJKYNt++HsM1QZ9aIfc0DpKzMWhUzJMuilpYddAcdezqPMBNaMi2SUzWjo+
         0VoS3JGs5nVH9Cmfm4qr0cHm1Re3+2C6+g2it7c7eaqO4/PB4TmLOMOnUdxwECY17s1m
         Cs9ASPW6BUNfJ+efuD1vEqaLGES4iOonjk6M24qLQ6wLUOBkd8fHgRnm+qe6D6uQy5aJ
         gL3i6wi3wpU8pkc/hP3o09Nr+mQhUOzkLufc3dOMVZHu1fdgMLPY2jasLAR3fX7KIWKS
         NRP0pG70TdpWdLU2GvDYbBauTFX8ZlaVimdhSAQFLAAGkwPfUHnuok7Xhy2LGyPZA/Oq
         8hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rBdTZ4XJk/aBrMhfzRVF3zUCulaowGOaG9ZKyP9cK7U=;
        fh=jj7Z+JKHo44vzL+HLWxKAzvmYobFvJy8rgKWNmnWI1w=;
        b=bXyiURiNRwqRn1NsFfgBAm+A8Y+ZSwBStr8mGE3p+xtNB9up84KT9LIfFKPUeJ43J8
         F3tsB7oPfu0zpM7OU4coTEaiicIloY0FYAHPAUsrxoRdgNPqTxSv3LF5lbKwg12yNrIJ
         S0CLlYXkFTBbeTACE6n+mD2Awf1u/FMix2zDUqo1V7R4+Rj4MtPiEJaj/lC85nka2eJt
         EXeUHegbGMgjxB3jD2Zpiryuz4G3dfca+9lxRmKjDjb1Twc/w89PVQrGM680Y3igFErR
         Gj5gbPuis9Ye0jlvqgCyi5OizfRsPlMd3f9MBD/OdEcYg/eoBuLv4q1aqspVTAjW99vF
         XpPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774973031; x=1775577831; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rBdTZ4XJk/aBrMhfzRVF3zUCulaowGOaG9ZKyP9cK7U=;
        b=xXDXHAW2Hz6HHfb3FqWGBnqBgKABzOPQJ5QnbLgfklSlpnQf/WnspJVYsvCktjAwa+
         OIo5VukdxQBUd1+BhdJx9lygAwH/utbYColiWHSLEEiEJlRpAbUTBxScvEDQqysPhuzv
         /orfHNn8VjF3yFJjhIpN/WCmG7EaGMSWEH41+nk0+hVZI09yC4IiKzYzyVSIDx0/YYps
         k+WA0Rw1Y28Devwta7+3XgvKoYqE5VisuIGCj91kz5a+z12shoS+nIihdyHUSyG82MIJ
         HVN9hFrW4/fxmZc9kz3ebwHK8mpxWgl+hbhPkVasQVhhvwdNAX2Wz+U98cNnlqIb0m0m
         LdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973031; x=1775577831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBdTZ4XJk/aBrMhfzRVF3zUCulaowGOaG9ZKyP9cK7U=;
        b=i1Fw3cEbpScwjgQQljkdjWpMV2Ia4sUt/DW9tntHoWLiS7+gnPybFMoxEc1OXofPya
         l/zlvQvCIXRdCqoi6EamuvzdmpMa40QjdEYvR/bweWcmM5mMw5AEA4IGxEWQI++D+k4E
         mfh0fz6iTT9dsSX0N6Za2XpeSCr5R3V7FqrOiqufCmbzF0pPLwiUyIC3QnF0u7wsUEP3
         27UFjKxwzxmRsG2KnjKsLQJYlPPAz7QDMpazUgCP5aiB9c7toIlZH584AymJcflVoHQz
         rgI8pK4ez5i6Z71ooN4bzYJDzpAe02Ip94lliXxKhYFSG5/A1X97TGwLu/w6w257oLbZ
         YATg==
X-Forwarded-Encrypted: i=1; AJvYcCUam8EW3AkljgyY0UOzD7p8d5x4wvxNaWtTv4vabiMTelUzyyDwkQufFWdiuVYuWwjRec7NHIcmfHrHaNjAr3rh@lists.infradead.org
X-Gm-Message-State: AOJu0YzHRO5CiWzpDS5oKIbpm1ZxYwLi9mwILBXBnlsbez6T+thCqdue
	izvjWuVL2xlxq1H2+Gcd7YaEn9ArjXGPJUhu5ER3xuKHqxY2dj3BlsMz0vSBpfU0civ8JfALr85
	Wth4DrsBnuNJtlJk+JThoBkOcS6Shy+jIIP3Riox5yw==
X-Gm-Gg: ATEYQzxlWJIEj3Z5hMDhk8Wm7CxAX62oAOBNIFozA00Rz0AfwgErd3Yp8V/r2uPHMdZ
	lhYpHR7Wq3VL66luhLIEbI+8Cizpusis8u4PruyqOsF/F+SEJ+SBAHzCYtTcvqt4zt8Tn2CM2AY
	dMhFp1FKGyHI1ybbOk5uoDkcSSCkO2lSPO+CtlIcnXowFR95X48HKNuoSxysab79NQqVvJkIz9p
	vdfoWoepzXohtgH4X4lb7RnUv+zT8RH7nfcz0uJj6zEQdldDWNBRklzA34CFRilT9xxzDx8gLEY
	CkuFbcszEdjUnhZ6+lc=
X-Received: by 2002:a05:690e:11c4:b0:650:2379:665a with SMTP id
 956f58d0204a3-650237968d3mr5493002d50.27.1774973030427; Tue, 31 Mar 2026
 09:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260320-imx8mp_hdmi_hang-v1-1-ccfce0517999@nxp.com>
In-Reply-To: <20260320-imx8mp_hdmi_hang-v1-1-ccfce0517999@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2026 18:03:09 +0200
X-Gm-Features: AQROBzC_bCTqHlcTi3-7217Va-IAxfmw49HgqDKRyv7Q0XoLPSqjyqoAOhtHuJQ
Message-ID: <CAPDyKFo57xyjyp4C5g5PYvVj40bTXaFaEGe3kgrNi1X2HB3BUA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8mp-blk-ctrl: Keep the NOC_HDCP clock enabled
To: Jacky Bai <ping.bai@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Peng Fan <peng.fan@nxp.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_090351_928301_88161776 
X-CRM114-Status: GOOD (  15.79  )
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

On Fri, 20 Mar 2026 at 09:41, Jacky Bai <ping.bai@nxp.com> wrote:
>
> Keep the NOC_HDCP clock always enabled to fix the potential hang
> caused by the NoC ADB400 port power down handshake.
>
> Fixes: 77b0ddb42add ("soc: imx: add i.MX8MP HDMI blk ctrl HDCP/HRV_MWR")
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 8fc79f9723f07e34fd3f5162f2c9c549dcdaeb5b..3f5b9499d30a0c8fb8ad8ba3b638d7de1fc55ab6 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -352,9 +352,6 @@ static void imx8mp_hdmi_blk_ctrl_power_on(struct imx8mp_blk_ctrl *bc,
>                 regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(12));
>                 regmap_clear_bits(bc->regmap, HDMI_TX_CONTROL0, BIT(3));
>                 break;
> -       case IMX8MP_HDMIBLK_PD_HDCP:
> -               regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL0, BIT(11));
> -               break;
>         case IMX8MP_HDMIBLK_PD_HRV:
>                 regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(3) | BIT(4) | BIT(5));
>                 regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(15));
> @@ -408,9 +405,6 @@ static void imx8mp_hdmi_blk_ctrl_power_off(struct imx8mp_blk_ctrl *bc,
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL0, BIT(7));
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(22) | BIT(24));
>                 break;
> -       case IMX8MP_HDMIBLK_PD_HDCP:
> -               regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL0, BIT(11));
> -               break;
>         case IMX8MP_HDMIBLK_PD_HRV:
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(15));
>                 regmap_clear_bits(bc->regmap, HDMI_RTX_CLK_CTL1, BIT(3) | BIT(4) | BIT(5));
> @@ -439,7 +433,7 @@ static int imx8mp_hdmi_power_notifier(struct notifier_block *nb,
>         regmap_write(bc->regmap, HDMI_RTX_CLK_CTL0, 0x0);
>         regmap_write(bc->regmap, HDMI_RTX_CLK_CTL1, 0x0);
>         regmap_set_bits(bc->regmap, HDMI_RTX_CLK_CTL0,
> -                       BIT(0) | BIT(1) | BIT(10));
> +                       BIT(0) | BIT(1) | BIT(10) | BIT(11));
>         regmap_set_bits(bc->regmap, HDMI_RTX_RESET_CTL0, BIT(0));
>
>         /*
>
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260122-imx8mp_hdmi_hang-e7c5b4bdf1bb
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>

