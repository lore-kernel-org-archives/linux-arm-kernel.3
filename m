Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF010C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/1XjgDM2zvwUKqTXN8xIQijd7DIn4lsKVtfgTVJNUw=; b=RcCIwCyt9bjq7AqB+vj0H6gLkp
	e5Rteu9FT+U8jPbY/4g7ZWoS1RPNVtvGbuQ9uQ2tIrj60YkKKgtfqYajshWblp4HCA52irMo22AGa
	VfxlZnzPmdReUasU/vIb3+JttIXFA5hi85S4f1hi9CCThdHbPJp4cK6td0KLkZYzrd+c7BAnaVogy
	rbrtYpqa+L0263VygOKRNchA8hLP23XVtqDNuNCBsHceEInm5eBQLFyUyxmmzl9R37/Nzn+fxl+TI
	p75QCVCiIrgidQZET0JSLElRciwFqV2y+xHQmsPQ+bP6jsG736EPJBka/bVIATlutGgt/jOp++4iE
	ZxCMOqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoNh-0000000Bpnr-469r;
	Mon, 05 Jan 2026 17:28:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoNf-0000000Bpn6-1yIT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:28:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso1141275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767634114; x=1768238914; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/1XjgDM2zvwUKqTXN8xIQijd7DIn4lsKVtfgTVJNUw=;
        b=R4DE8hUm5MRzgSyXzHNdU1oEnRaR6WRFUwy06DAlQ14bdq0ECFPs+altFNOFACGUiz
         vEyw84NaWuSHyAFXGhqDsXsCE5+qIe/fpzCk2RZWGOiitwrz5EqVAjx7gnTZ8U8/m64m
         71MtIUo8onrw+X/rlwlTFbAnoJ2KwJgrUcrF4ZO0E8lmrMkRZu35b6ip37gKNa7F3IWA
         mkqn7tQHY6GtCDcUY3Y/TkdB1DbrzDw5KjJtfDT7OFJz057aMm+1TEkolIOANkgjbMcd
         MYkvubOWymzYf22P8isnUA+sK4PIhK9ld2Vi4UKDgQvrFj2nYwXe6VJuylPVwrhXYRFk
         es9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767634114; x=1768238914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/1XjgDM2zvwUKqTXN8xIQijd7DIn4lsKVtfgTVJNUw=;
        b=vQHDx3evQJtc8Yx+VxWvOmQUPXfRgQOS0+L6s+/lXgfyNmL4gHUMWj9DEHUjF8f+hy
         qIxyEbIaU0vhVoAYlE57gOfEGUhT9o2qFJn7J96yolfNRt5apWZe4/IIXUo/j8KTi9LP
         giPuFrL6ca9dCSmnT1mVwiRrVTEpe4PBYDWnsjpg4fKQ9JKvYxdzavU09teGamaZGOtV
         cCp46AXSbm4FfUGydV/4TaGxEgSLKinUJ6AImuT1MJSEY3ndV321c9bn6e2YOo19f+Rs
         6fCNWU/1C/Yvwe9BJpKNyyaMZDXaf4xgKNb83w+NJIjNEM2o617Lf0erQUGst5k+b4nU
         O4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqayza+5wAr11EwgAYBB1gwbfU7kE1XTnm851CCM35W0F4GtiYnFTP7JVSeGRchOIaUzyJ9HIrHzHPoUncFLJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzOpE7TFlIVFs5YIrMct/E4hIbHXcxRek/NeTpSvRmjJINQiQok
	KhGc1mjHY7A3baNYdjEj+DW1OEJkHBe8uPA5Oq1vFe8xsWuAoVZc7xeWn+8x1wPBP4pbato6tFf
	cl1uxLRQTT80xsUFqmbqlrs3FSuI4TP8=
X-Gm-Gg: AY/fxX6HgkR4f/gOd3efkRkhbLM7hpW5+zveFExTESXLKrv1zL/Ik8C3G2CvdQh1XRE
	PlPsdzOwDGzzLAOjShaU7L8SOmCAhJRZQrz+ILokrcGuu6cFBcgvhYkJQx9DhmFwzvpoMgN7W2C
	nJWj8O5RhKBruiA05R5cHVRTHo1kCzy290rsUUjFJh3FnSRzzuEpvqME7N065USMqnTyZfCr2nW
	sWYAW0OquWap3A3dHDburYQ5yn4rMUn4EO2dIvIaf6aK7eVY+0FG7Db/mY+4LQLVXHb4uXb/QZ/
	gpBuNN8TqbBABku13ZrfFU3npFd7
X-Google-Smtp-Source: AGHT+IGpy3FSTV06PFzbySqT0GxE+YkHmWqyF+kpdkmaFPx4+wxyXnjiYwrYZ6SYwKhEXTYGmchl6zZMo9euRvgtVx8=
X-Received: by 2002:a17:902:d547:b0:2a0:d692:5681 with SMTP id
 d9443c01a7336-2a3e2da7892mr3742555ad.24.1767634114320; Mon, 05 Jan 2026
 09:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 5 Jan 2026 18:28:23 +0100
X-Gm-Features: AQt7F2r1mVRbDaQh2zFy4l3agObZCNqWz_Ifa4aviOfolqOQgQGGMy9JJh7ZWmA
Message-ID: <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_092835_511788_8F8220CD 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Hi Bartosz,

On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
[...]
>   mutex_lock_nested+0x24/0x30
>   pinctrl_get_device_gpio_range+0x44/0x128
>   pinctrl_gpio_set_config+0x40/0xdc
>   gpiochip_generic_config+0x28/0x3c
>   gpio_do_set_config+0xa8/0x194
$ git grep gpiochip_generic_config drivers/pinctrl/meson/
drivers/pinctrl/meson/pinctrl-amlogic-a4.c:     .set_config
 =3D gpiochip_generic_config,
drivers/pinctrl/meson/pinctrl-meson.c:  pc->chip.set_config =3D
gpiochip_generic_config;

pinctrl-amlogic-a4.c still has:
  .can_sleep =3D false,

Are there plans to send a separate fix for pinctrl-amlogic-a4.c - or
was the intention to fix "all" Amlogic pin controllers in this patch
(which would mean that the change to pinctrl-amlogic-a4.c is missing)?


Best regards,
Martin

