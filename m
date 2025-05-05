Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC6BC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1D14DESXgEJssAmCS0DlckceNK8D0Dq2lVptoRgrgc=; b=F9UNZDh0zScw8+655OMjCW9htw
	mZQiSKJbxglPGtexQxM0RmXnnXO61yEo7hE7J79P3YBRsA75gfzn2xdHhY6XQT14FHKgUy+Z7a3TI
	AY/Vd2XHDkdFNStN2ImjRKCC6/Ya8a+JL55qrWFfqq+7Sa3MUUoG78tPhvQWIRwa5BG7RkLJR6njz
	lTIEO7TLbtT6zu9oikf2HLaTb8fv3Q+6HIll1m95dSu1r9bRvrmcQAWTA7jg4it2V6Fg9dztYg/S5
	jWexC+FdTOCgyn9ldqwBHiVlO0Pyz0CGcqf1S4YEVs1pjP2AsOHBNVsYssmf0AnBUkK+YO8l/hiIP
	MflC/Exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqpp-00000006jpX-1OMj;
	Mon, 05 May 2025 08:05:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqlZ-00000006iqy-11Ju
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 08:01:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad1b94382b8so168418266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746432091; x=1747036891; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1D14DESXgEJssAmCS0DlckceNK8D0Dq2lVptoRgrgc=;
        b=b4ZvP6D2lWiqAP4z1cZNZp3FYPgeGEhRhxsZQwyoiB8GpzKHtXDGB9TmQkbOfN5lZe
         PQSZzDWgldAyNz2XyP4gaeZow3lcnDvR6Esfzw5Fdq2TbEZf5hxhrcQ5nCY67wNCSdbq
         neHtE0fstKZHuX/lJM6BFgcI+u0JY2R0jDx/AlHhEq5oN1MQ6AjnfKHsw1QawjBCWY6F
         W8kgwZnkrbTVSdHOVPfscZ8isP7tU5FzDT8Xt1hE6QLl/qx6mxdjzPsPKPOnTV2bW0QW
         1iP07sD2Jj3l1lAs9X/B09/BxZj2OKrBgdk98S+eZiP23dDbdMFGL1fU7j2A9szWtVad
         lwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746432091; x=1747036891;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1D14DESXgEJssAmCS0DlckceNK8D0Dq2lVptoRgrgc=;
        b=NT7iZ0Qqz2HLPLCrZysu1W2eTCL8IcGtADLrQOEmE9FTPrI7qhq2ScJc0g+MeN0+9q
         EkTEH1pOpc8PQW0XlEuP6YC0WLuv77I0WnW5392J6SCItubrgf7jtCZewXqCc5WOtVsO
         rzYFFqC0L9fIt4H3P3l7zHesGKepOPUlqjLR13uKvgBcnAXcNdeOoeoqyJP+GkTOz/tD
         egH3NXffxHYJ1EOQlutpLY22tGY090St0CaYHxpwqzXeWe16eRrDqtjzFJh75eAChh8p
         5a+GwxEguIvkmiTprPMdGWHsDpA7ZRYuCokd9MnYSryb0rgvbzHVbdAvBVB1GAuUhoqo
         wLQA==
X-Forwarded-Encrypted: i=1; AJvYcCXHNlcXO2U7LHYAWGRt24DTTo6+luU//r5wNwJ11ra54hlY1GSdw/kdY7gV7wCTNA717B5rgZxf282O/W4k7qKx@lists.infradead.org
X-Gm-Message-State: AOJu0YxqcGZ9E82QV7gVF33en8FMkPotq1b2SnACKGY5yXcXmx0rBF1D
	ZqP1HkCRKPuvFNH/HTtmYfDPSEOOYoMOEBZ+Lx7mqxSDe6alaX4YCx40jmuFSIA=
X-Gm-Gg: ASbGncv4Y5bvjeHgDXtW5ufvzZuuEQGekCvOzsAXuL7r2FIiXWxknqAaEnJU89GJX5K
	ty/RRvlM8gKUm0ynTKWCjmbOkpctcTiCvXy8+gl89abxQ0Z+IX/tT5W4ZE8NgjkQnSLNQ4skPcC
	wGGmc2UbdO3koJEdWmqMYegoxOhGbC9iHAf6blbdq7URig4BX5nn6NNBI0XClFBlCiQMiS77fwV
	rYnCgDC7msEfSCIySCDxtY9kqyQhaJCAmqK8hsesOS82SUaAQIATNxgxaIsM5IYd5RAWu0mIzTI
	3k4KMnuQUN7vYpD/B5Yf305VC+zM3hNv9x+O22kDaK9Jm3ikKWKXwcpmXtLn/XdqMMRVRbHR/ee
	8K1uTS26X5xo5NJ2G+zKc
X-Google-Smtp-Source: AGHT+IGp4PfYHD/YxcY0Mn7oA5l0dQ/O7fQeMsiDfpR5dpQOL/r9zkCVIrRqDBHZGZeydZuEK+PkNQ==
X-Received: by 2002:a17:906:7f99:b0:acb:b0f4:bc77 with SMTP id a640c23a62f3a-ad190858b7amr637113766b.57.1746432091180;
        Mon, 05 May 2025 01:01:31 -0700 (PDT)
Received: from localhost (dynamic-176-003-040-035.176.3.pool.telefonica.de. [176.3.40.35])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad18914736asm449923366b.7.2025.05.05.01.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:01:30 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 05 May 2025 10:01:22 +0200
Message-Id: <D9O2I6OT6RSA.JDWMLFP77KSX@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Thomas Kopp"
 <thomas.kopp@microchip.com>, "Vincent Mailhol"
 <mailhol.vincent@wanadoo.fr>, <kernel@pengutronix.de>, "Heiko Stuebner"
 <heiko@sntech.de>, "Chandrasekar Ramakrishnan" <rcsekar@samsung.com>
Cc: <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 3/3] can: mcan: m_can_class_unregister: fix order of
 unregistration calls
X-Mailer: aerc 0.20.1
References: <20250502-can-rx-offload-del-v1-0-59a9b131589d@pengutronix.de>
 <20250502-can-rx-offload-del-v1-3-59a9b131589d@pengutronix.de>
In-Reply-To: <20250502-can-rx-offload-del-v1-3-59a9b131589d@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_010133_284032_8C74ABB8 
X-CRM114-Status: GOOD (  22.12  )
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

--64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 2, 2025 at 4:13 PM CEST, Marc Kleine-Budde wrote:
> If a driver is removed, the driver framework invokes the driver's
> remove callback. A CAN driver's remove function calls
> unregister_candev(), which calls net_device_ops::ndo_stop further down
> in the call stack for interfaces which are in the "up" state.
>
> The removal of the module causes the a warning, as
> can_rx_offload_del() deletes the NAPI, while it is still active,
> because the interface is still up.
>
> To fix the warning, first unregister the network interface, which
> calls net_device_ops::ndo_stop, which disables the NAPI, and then call
> can_rx_offload_del().
>
> Fixes: 1be37d3b0414 ("can: m_can: fix periph RX path: use rx-offload to e=
nsure skbs are sent from softirq context")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

> ---
>  drivers/net/can/m_can/m_can.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.=
c
> index 884a6352c42b..7c430eaff5dd 100644
> --- a/drivers/net/can/m_can/m_can.c
> +++ b/drivers/net/can/m_can/m_can.c
> @@ -2462,9 +2462,9 @@ EXPORT_SYMBOL_GPL(m_can_class_register);
> =20
>  void m_can_class_unregister(struct m_can_classdev *cdev)
>  {
> +	unregister_candev(cdev->net);
>  	if (cdev->is_peripheral)
>  		can_rx_offload_del(&cdev->offload);
> -	unregister_candev(cdev->net);
>  }
>  EXPORT_SYMBOL_GPL(m_can_class_unregister);
> =20


--64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaBhwUhEcbXNwQGJheWxp
YnJlLmNvbQAKCRCFwVZpkBVKU3urAQCJ69IFypvaFtVZN9A3KA4EhHPYFZnLhKhP
Pk2HK1dA9AEAlZm7/1uU/TAuxXN+0/6NZUVxbJO2yOQNMI6MhbuvGwY=
=/3qK
-----END PGP SIGNATURE-----

--64453a89ddc6afb76b4932a46c59c202600130e560186a7d832de92cee9b--

