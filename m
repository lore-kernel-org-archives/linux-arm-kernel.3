Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CBC02184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwcueBSt0v4igogFveia71oHZaRrr/fkeR5Mu41YZ2U=; b=nI0bQ6KGd15JpOGob4BcVHKlwF
	VRwe9oOhXSEivG5uSub3vKalmE3/YfeP+JHZ6xS1o9g7XrdGIH45Y/ZTpr3SZm46dyDKQ6pBidP9O
	jj68FGTu4LRH1E6t/uK3yHzzE2wDbB29XZeLx2satTpr/svOCr0Svq04I/8AYObhSN7fhA+gQzuI1
	/QhJU89e3Y4sF86Y6gvS1LBm3YdgaFdLBBtwim0ZbdnIk+rzWPrsTFa1UAp2bv/LI1DWsbV7yl+K7
	EsKFw7Zr6fvZBIqbP0axVg/34iBIGBC/tv192NW4fNYCKPxDLcCgza421CS3Vojilqw57G2gqzsfH
	3SDLWHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbhD-00000007jZP-1mkU;
	Tue, 14 Jan 2025 07:50:43 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbfx-00000007jSq-3KW4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 07:49:26 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a81324bbdcso36493545ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 23:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736840964; x=1737445764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwcueBSt0v4igogFveia71oHZaRrr/fkeR5Mu41YZ2U=;
        b=CfHLH4Z+vCHM/JqtHEAgwMt6PVKffK6BlPybnML46vwbLZMP7Kfj4/rOxZ5v9Loxbm
         FWhqGCPOThez7RX3UXGP2RIFPPUn0BGve1I1NFrFzx+3kKBtL5dBuWxhX4gsa7SwoX71
         fDJg3+wEUENK7SUMKekiYLFPTE0bf5EcQcbrLvIHNrOBXl4mNL1ZgVusHBtvkHZO3Xha
         suQ6slmE0Nd8ygGdcLCpwb8mlVLRA9dai7oHeoKYp/MxdPJ9HoPGJLsxg+8sF/slh+h1
         90mVrdiS5K9DbPgROGx03L0itpI2GN2/wmSqmzr6yKvCAkObxqInG6j/Tf27SGDlrwNX
         VkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736840964; x=1737445764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwcueBSt0v4igogFveia71oHZaRrr/fkeR5Mu41YZ2U=;
        b=mcK0n4UGqZfrT4Auh90D0FQS3ZldR9HuTw/AH6MoXDoiVu7hZxTV3tlmgJ+rpW1OLn
         aYh85TeMKUx+Q07pUmr6j5qTNQsZwhCN0eBcDqB7dTufhXRP32MohHiyTIyhwUMcm0sH
         3wVFwor6VTKOp+e2jdJLHjVuqzTTBLME87E/tXHeO7i9SdnLjJWSivH3snafOaL9lX1k
         E/NOl1/syvZrI9HVjtOkC93aOU7pNxxmxxFHd3rgb2jUdaNNAcuB/5QNJ/IFvKErqaEJ
         52SnIGzre6yhTQfIQT1w5Dl8rHu/7ID9U/NZ4bPgsY8N7zNBCJ+S3n76l0ENRccWrtd+
         bDOg==
X-Forwarded-Encrypted: i=1; AJvYcCXb4OiOrA/vQZaYa3zi4eApVYFWjKobpy0mg8dz52Nie4xmLZkyZeO0h3mTDJrn6GFZlNNDcAkXMR3fyuDeAJyI@lists.infradead.org
X-Gm-Message-State: AOJu0YyPVVHs7ujfv+7cgVkNioJo4kBDr2cqV0ZOSBS9aIDtpQ1USfZo
	d9LulDuGejhZypwNWxvRlErAio6EIKIqAvF4meR6KJtsZGiH9OnKMcQUxdwWrh6BcwTdDQEW1T3
	F6jv12MGHHvC12O47dVgR7JD/IUlayYB6
X-Gm-Gg: ASbGncsLEc/sTX7B3JGzd3EsKgazAeKOgZAPUhdU80MwjIUaNWAEYoQqUR9teVQnPLw
	tnxgqsMRjq7IFA0m0G470K8S56jxkjlOQ+sEehA==
X-Google-Smtp-Source: AGHT+IF7DFFzOVv5hJRx2rOQ0X2GpsPhVUS6ku7AHMnjUUetYSaLVkkreyXpeUdIHpQEeAiftxB1brVoyB+IZRWgj4Q=
X-Received: by 2002:a05:6e02:164c:b0:3ce:64a4:4c52 with SMTP id
 e9e14a558f8ab-3ce64a44d8amr82366785ab.13.1736840964392; Mon, 13 Jan 2025
 23:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20250113094654.12998-1-eichest@gmail.com>
In-Reply-To: <20250113094654.12998-1-eichest@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 14 Jan 2025 15:49:10 +0800
X-Gm-Features: AbW1kvYSJoaJJYol0I1awhg4ecKmbyih-ivaEi2L6vs_lQ3XjVURqIPvv4zkPdQ
Message-ID: <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
To: Stefan Eichenberger <eichest@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com, 
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_234925_837179_C416A4CD 
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

On Mon, Jan 13, 2025 at 5:54=E2=80=AFPM Stefan Eichenberger <eichest@gmail.=
com> wrote:
>
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Currently, the flags for the ACM clocks are set to 0. This configuration
> causes the fsl-sai audio driver to fail when attempting to set the
> sysclk, returning an EINVAL error. The following error messages
> highlight the issue:
> fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.s=
ai: -22
> imx-hdmi sound-hdmi: failed to set cpu sysclk: -22

The reason for this error is that the current clock parent can't
support the rate
you require (I think you want 11289600).

We can configure the dts to provide such source, for example:

 &sai5 {
+       assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
+                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
+                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+                       <&sai5_lpcg 0>;
+       assigned-clock-parents =3D <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg =
0>;
+       assigned-clock-rates =3D <0>, <0>, <786432000>, <49152000>, <122880=
00>,
+                                <722534400>, <45158400>, <11289600>,
+                               <49152000>;
        status =3D "okay";
 };

Then your case should work.

>
> By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM

I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
the driver don't get an error from clk_set_rate().

Best regards
Shengjiu Wang

> driver does not support reparenting and instead relies on the clock tree
> as defined in the device tree. This change resolves the issue with the
> fsl-sai audio driver.
>
> CC: stable@vger.kernel.org
> Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/clk/imx/clk-imx8-acm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-ac=
m.c
> index c169fe53a35f..f20832a17ea3 100644
> --- a/drivers/clk/imx/clk-imx8-acm.c
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -371,7 +371,8 @@ static int imx8_acm_clk_probe(struct platform_device =
*pdev)
>         for (i =3D 0; i < priv->soc_data->num_sels; i++) {
>                 hws[sels[i].clkid] =3D devm_clk_hw_register_mux_parent_da=
ta_table(dev,
>                                                                          =
       sels[i].name, sels[i].parents,
> -                                                                        =
       sels[i].num_parents, 0,
> +                                                                        =
       sels[i].num_parents,
> +                                                                        =
       CLK_SET_RATE_NO_REPARENT,
>                                                                          =
       base + sels[i].reg,
>                                                                          =
       sels[i].shift, sels[i].width,
>                                                                          =
       0, NULL, NULL);
> --
> 2.45.2
>
>

