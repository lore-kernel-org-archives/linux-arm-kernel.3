Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D377BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keaeHuBnA6yPk+ht4Eab1BXo8HSV7VPRSpTgBTborOU=; b=XUdm21JXU3pm0t5k32+7hmJB6K
	ZxNtU3uqimqM3yv6Gw4FjrfUD6auoU+O3hJ7zQIMIBAQmaDko+O35RiyxhyeONZgIy43xxRxsbTd9
	HNqhvADvCGdnNSBa42ijQmUVxvMfH8b6Od24gQPbPfty7P2GUi0CYHwZqh2sK59XhjX/1ZiCZQxce
	fD9RHwjA+SLklGzh2g8ET5xWWWc01jNZA+xluFivBywh+O1DL5O77TelFK56kEieKGXpmh2SAg44W
	/voTK4En5B/j98KxJSQg0uc9r4aPolt2x9TVwkMoe8xXBYed/WKmXxxARK6UZpAd7EEbL29jl7ovV
	t2aWM8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfaJ-00000008KST-3Qbq;
	Tue, 14 Jan 2025 11:59:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXfYy-00000008KBx-3lfs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:58:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa67ac42819so776532066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736855907; x=1737460707; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=keaeHuBnA6yPk+ht4Eab1BXo8HSV7VPRSpTgBTborOU=;
        b=IoGn91DiX8xSSFRMYNRKNoUBLkH/qO7QYRpAr4TjjwmSShcf7/N5g0kcxD5JGSQtyj
         VhV805bGBP5kiqcbvi8AELB+tL/aqV6KgZbkM7AdNUMR8cD0+t+8rvnvNRKylsPuFwpR
         WWHRSB6lLJx9ssNvlfYYIJBzB0Ryp5LZI0JVtGbplSVGNbq/QRGpahGJ+peVbOV2/K4z
         TejpzqjHAmd+PlECo98YdCdPx6CgtiHgq0UgsnLj3IzpTN7NgIjNSE61qmsjXvtpesxr
         LN+wbVooUnnkTMhnGkw4H/mC1dH2OIzY3kk+BKCyGlkBjhNoi04kjnLXOi2KjplWwrDD
         q/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855907; x=1737460707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keaeHuBnA6yPk+ht4Eab1BXo8HSV7VPRSpTgBTborOU=;
        b=BHf74quQaBxMzkmTfGA7ndiPYl0Tm1HbYLyh3vvED35bWANCqRUfp8zvaGpEv+KlbQ
         hcJMd9vx7Y1DL8mWpMl0beHMFcUQvY4OkzHLbRBHv5LjRDTi4Ay+zzv7h3XZuE8QGrGg
         522VKOxDKPqyzpgV8b/twnZ9MfFHdUxZT4QbVylfs9BKUHTjfSF0TWsXglJmJx/W9V7Y
         Y4Va8TK0asHwGDZBbfOLXFSMzYD8yMEuqkyYJtntDpyJ6nhgPN/mpYBnMQULdc9yVR9S
         qv3zPttVN73tGvXH3DWo0EXBjfbZozQAM5lHwg8eDSNALZXo0enyKqgDypgrLBhq28Ad
         AQbg==
X-Forwarded-Encrypted: i=1; AJvYcCUhShpKjZbxDJSrZ0tk5yLORIwmXHr3O7gJuhxSavSWeXQm6knvoG0dw3de8dq1ME5hkCOPAaNhLUImRpYzryBh@lists.infradead.org
X-Gm-Message-State: AOJu0YzeXEO1KFuQ9XtbbRrkiIkWWKx88rCdhdztR8U5OTxgxCUwFfJj
	q4zFAANbfZvK9tBvb8lffyd7iEBYOzj6mXEO9JDOY5gWWWxjItkx
X-Gm-Gg: ASbGnct68PrVQS5CW0z0HZX4rA2Y9PEDsSJOu5w1deEv2iEA7Rg9VL8tn3QQ8/qUFXP
	livUT4wVBCo3r6xhpz0LD2OYAIMRpv7QODel/K5voI8xGhRcfFGdj37M+iCLhp8kCSTX5gAp8eD
	Ktl9aMRpO8y3UEBLERDCgs4iXkQR9nixPmv6Qm0sS0psngrvr2OCk1z0t7h0XUsIEwlKkUX2u6j
	9ubBVjcQd9frPX6NCYcHuIN5Vr2xCmH8V38rLqx8lZIlkbtCoij0eDg
X-Google-Smtp-Source: AGHT+IHTulWCj2YYnNBcefAEaJouVTvuufskMNNQK2TUTyQ/FQiVcwIMr5PX23StjL4mn4QQ41c9+g==
X-Received: by 2002:a17:907:6d01:b0:aab:d8de:64ed with SMTP id a640c23a62f3a-ab2ab6fcf85mr2426598466b.25.1736855906651;
        Tue, 14 Jan 2025 03:58:26 -0800 (PST)
Received: from eichest-laptop ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dacf1sm629151066b.63.2025.01.14.03.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:58:26 -0800 (PST)
Date: Tue, 14 Jan 2025 12:58:24 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com,
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
Message-ID: <Z4ZRYMf_uJW4poW9@eichest-laptop>
References: <20250113094654.12998-1-eichest@gmail.com>
 <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_035828_958370_27EEB7E6 
X-CRM114-Status: GOOD (  25.39  )
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

Hi Shengjiu Wang,

On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> >
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > Currently, the flags for the ACM clocks are set to 0. This configuration
> > causes the fsl-sai audio driver to fail when attempting to set the
> > sysclk, returning an EINVAL error. The following error messages
> > highlight the issue:
> > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> 
> The reason for this error is that the current clock parent can't
> support the rate
> you require (I think you want 11289600).
> 
> We can configure the dts to provide such source, for example:
> 
>  &sai5 {
> +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> +                       <&sai5_lpcg 0>;
> +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> +                                <722534400>, <45158400>, <11289600>,
> +                               <49152000>;
>         status = "okay";
>  };
> 
> Then your case should work.
> 
> >
> > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> 
> I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> the driver don't get an error from clk_set_rate().

Thanks for the proposal, I will try it out tomorrow. Isn't this a
problem if other SAIs use the same clock source but with different
rates? 

If we have to define fixed rates in the DTS or else the clock driver
will return an error, isn't that a problem? Maybe I should change the
sai driver so that it ignores the failure and just takes the rate
configured? In the end audio works, even if it can't set the requested
rate.

Regards,
Stefan

