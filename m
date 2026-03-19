Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F1D1091917
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jm2MmqwJpQn+S058TYQTUmQvMQC9Tb/3vBRI4X0gPQ=; b=Uw7VC/FCZMAq5E5tZm+h5TY0St
	u69aaO7lR2KCQqY5P+cABQy3WI8QvEFEJ9r0I4IE0daS/DNU3gV+x8k0U8220iFlvbs38PaJbYksg
	0u3JzAJLxr/ItgUW6WZ+ydPkQ///klPhzQ1funj0L2IQha47ayqKT5WmvSXesiG7vz77Ue3NN8qVc
	kzSDM50znggmLH6Fo+pFibMkVhfsuPnyG6UzFjzarSTOH8c8RrjT7Vhli2P32tOnRPq6fmqg6FxIA
	vhOtSpnLDY3ueh4rYed2qDnOYynl8kePZiedk+2GJ1ACxQYEPwfPXZc0jYS6dhy+HDCbWNvFkbjzt
	ErrLre5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K7M-0000000BY0J-3iZw;
	Thu, 19 Mar 2026 20:37:20 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K7K-0000000BXzR-1bwY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 20:37:19 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-38a4118c4f7so10617601fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773952636; cv=none;
        d=google.com; s=arc-20240605;
        b=JKg6T4kAnO4VYElvN/H6b08Ud0nOZNGafsuvQt06DADJyI6G9Vs5W9mKSjRo4fakv4
         3O+/+oLaGLC5clVte0rx+E6xoVxXbdVrACIEcksck6kxfJipeCexTYp/S6wNiyju6DZA
         zJAIZkJpIgFUqe5fldoFKidXSOHJj1vfM5bW21wh+MIOBPzGBk0ET/gtni1o+KwgURzy
         x2EPTVRRZEnxpQijVFzlUgWtwLFgVLaYfdEpoodJOqD1nmnfpWj11W20YjKWvT41IFLy
         eKKTRLDqnTbkHjNfGhhgksMdSvZ8eo0jjoIL6yDpCf44aIVTkPXxVWO7NPs47SRbVJdV
         bZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4jm2MmqwJpQn+S058TYQTUmQvMQC9Tb/3vBRI4X0gPQ=;
        fh=3+d5baRB7/A2N5sz72dPYH2hrCUf1FLIIS2Uj5A+5SE=;
        b=IW4bKfi8FVH2hzzS+XkqVbG7RmG/Jbl2nrGJHOCaK3IaRxjJF335qOZwKqKZqCusru
         Cywy+HdQr32zK+UJUoialcJ8+iQZBS6RDMIlNYHe5mRliUeqnvEr6CHmS8rgVLvj0/nh
         0/vC2sW65DI9GVPjrOZE0nQ7oZ1D1zfnO3l8zBDdnsTfyMneCaQ4WJgbTyJ2kEDQKdAH
         Tj4AJ2NYYWbOgN55TkoXWIT9z7ABfOGtE4fJPlWy3MIoArKRUMnm6dYVCsjeNbcd7d5V
         4qQ+JoT80TQKGQ7Zahon5i3Xdd590eNdcwqOOUWHk6mED2N7dnK5CLubne1tpukQ26Bm
         HSKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773952636; x=1774557436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jm2MmqwJpQn+S058TYQTUmQvMQC9Tb/3vBRI4X0gPQ=;
        b=kA8V6Bq9hA0IcybipulU4E67uYCfmh1bCK5dCDgE4Yj5KI1sdMo/faGLibJejJmxXS
         C3lM4b0Kwc62y/QM0W+VS4yLhM7AzL/yxx437HD7XDNHR8jaGMcAUoB92Ip8C/w63Gfz
         WhTZxwWAERZqquO54m8YubG+m7DIBOhP2BL/mR2vO3v86S68QHc+baTlUSOiq7zhFb48
         uiLZrx4sZai+M1fd97FYoerUX/7eRN4UJphtD6Vq3dKGrPNgaEZZAKrmKLScjYF1ko+D
         bgIKZHMxxAOaxtemF964gg6yTbPTKd6VnbaO2x8R3akTJ+V9vIO7I6pbdWcCx3DzwknT
         dpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952636; x=1774557436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jm2MmqwJpQn+S058TYQTUmQvMQC9Tb/3vBRI4X0gPQ=;
        b=LiwPLGCz2yCEuSU7Dek+25oEurBaKGASjY5+mp9Vnu5f0NfDQfl6JYSSzhNtfX2hw/
         R96c/JTTOPqNPRDdv64belzmcjlLAEmdIKnWPvLPyqQNA/TgTDKL+TLjPs/7iiGvVe2q
         7WhDeSBepufImDO+u4RE6c4XrYdEaDA+FUU31NmOElTQQwnRR7Wxp8deweE09Zg7vyyv
         Ts9Xe4v5faYuQ4obw5Aipkch5TosA3AygyLibP3nrSV7398jF+oxeoRpbjysbXn97IBC
         6MMSsBsXN2QkDd8Q27o38JDTat8w/puvM3lyiEdUHWBxhtYTWieux4b6c+sgDBgoGm/E
         Un5A==
X-Forwarded-Encrypted: i=1; AJvYcCUIfqTsTOrJ0B/kO77eCFcTr7wkcVO5d15Xk/uRkEUMWZPPY7hHSPdpGGGs4p5nAbifK+kAXHEdYOBWJpyZ3v/M@lists.infradead.org
X-Gm-Message-State: AOJu0YxGpN1u8k6T233FK5QtBl4NWbAKizogg2AbVAkPUqxwXSs/D1wB
	1vpFCJO3CB0KIL//Zj44F4+ekI6K6wVbgIKT0hdrLV/koIDkKOcldJbqA9TZL6vgtccpRmSt90B
	WykqzlcuJC9qH1AdNS6RGiv07mZR2JFg=
X-Gm-Gg: ATEYQzxf6JlM6TmeX8TZHj1lCcWuvUO71/C6jIfijt/JO9S68AKD8LSkleh/OWbxb7F
	UbjhvmS42w/2Pr6H8yf7JzCCEMUG94TRHGEMik/NpKr/vkHII2vYu0nV7w9jiPdahMecXCqRpgi
	gyO9n7MHJgLEg/6gPSesnFy9aAAk6a5zII4PQK4kX/9zIFfET3zkFav8j24HIdBL3u+3YeKWVPf
	lEW2EWUS2CphvUBTCCfYq/hoIB7JS8DP+DvmTPBtlRUAAj+j2E+7gLHDrMPasTzpgfb+u7sBUYk
	SGZEwHzRhXbkR3ByZmusIR5fRQ2J2bPd6kL2IybMqRL/9BbmEHpHTVcrKh1lUZtjC4LVqfUu
X-Received: by 2002:a2e:3215:0:b0:383:18fb:fdf0 with SMTP id
 38308e7fff4ca-38bf96ee31amr2254101fa.22.1773952635602; Thu, 19 Mar 2026
 13:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
In-Reply-To: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Mar 2026 17:37:04 -0300
X-Gm-Features: AaiRm50-FVCrW5uqx_caj9h1BrDi-gvkU_nz1UeamW4uIfef2gzzYIjKPKykSOA
Message-ID: <CAOMZO5DcaucpKj2=gO5kP3vd=f==ydzB+3FbGB4Jwg19Vi8fpg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25
 handling and consolidate soc data
To: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Haibo Chen <haibo.chen@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-mmc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_133718_443502_D5BD7D10 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, Mar 19, 2026 at 5:10=E2=80=AFPM Adri=C3=A1n Garc=C3=ADa Casado
<adriangarciacasado42@gmail.com> wrote:

> @@ -873,11 +865,8 @@ static void esdhc_writeb_le(struct sdhci_host *host,=
 u8 val, int reg)
>                 new_val =3D val & SDHCI_CTRL_LED;
>                 /* ensure the endianness */
>                 new_val |=3D ESDHC_HOST_CONTROL_LE;
> -               /* bits 8&9 are reserved on mx25 */
> -               if (!is_imx25_esdhc(imx_data)) {
> -                       /* DMA mode bits are shifted */
> -                       new_val |=3D (val & SDHCI_CTRL_DMA_MASK) << 5;
> -               }

This removal of the i.MX25 check does not look correct.

