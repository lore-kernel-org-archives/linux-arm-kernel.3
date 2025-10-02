Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374E2CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=; b=tbAJ4jr2/LfK9z7MEI/QOOM3jz
	gqK9JVIvq3RE8wmmJRJ0pslVzXnAXnvKPc49uAcFjT+pm4w9hvZkEQ+9NYg49Qx2YPZuQc8lNxvL/
	aKegY1tMY7I94B6+B+skFqZhQNq3DtnyDjtHmFBQaseLK2B+N4Ri9DmTmhlWHifuv+o3IF+BSDnjf
	qj90kut0uSldvPfniY+N+pgC4lixhBWGKgZ8i9JRQLRzJU8mmhWA8KbEs57Yt8RecI3L1j/ZhBM1e
	RezQ3CH31uA9uk2SGR7f5pE1iDq50QKV0XQB38xFNTKa5UIfPyXyRalWf82hwM/bIC9biOnvVz3VP
	VxK/3a6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M28-0000000Ao4p-3UqL;
	Thu, 02 Oct 2025 16:19:56 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M26-0000000Ao3w-0u8G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:19:55 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3304a57d842so1178434a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421993; x=1760026793; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
        b=bITcq0/c5KnuW8Y2XuJNVehrcW50yp/4WzznEXWVwQ7PGgXLyS2fzZByMoRPeuXVkX
         f/fbsP67L94RzQ0y8YIw3fUtaTMejD6xZy9fXBAJxiq/DUt4UJH2k4eb/QnQRDLyOBj3
         KS5q6kzrKN2AK/MbJsudNxP0A1UrsNktvifePhazCVwWK9wHCThHmgBDgn9Y67eYgDYH
         1yLQoZrlujnkYRXxt78PRx2PlHNuxFXuYBDSR8rGAkSLLB1Ij4hAAHwum0kh5TKQOfrJ
         1iqhsY+33fdKnZvQmIxAhTeamO6Ir8+NM+oPydBMhkNdnkDdj1f7gOc0FX42c4rLYWy5
         Mo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421993; x=1760026793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZZ5d24XDIxkk+JwavCHmACQ+MmvpDMF7i8UGLWVc1U=;
        b=mmBGoVAnUqnq3eVSCIUy4+sK1JKWxp6etu27BCnsc4WPTg/NZBnRi+wzw8nA+m96yS
         QNvLYe4CKGOdOnvTzx1dtkHNLzGQGb8j8pYL60Btomqg1r4LIRdrPuN9CPzNQmdYZ/lf
         +PjlP8CeUM82PK3VEa3CTxXJlFTgBGiF3lq/OfyzMZc3Hf+MspTX47LA8sfXfFYNI3KK
         fKElhEyz467mV4v77TNpthCBeE8nI1QEBb0h1MVcDddAx4snX1ORwmh/AjtUKUpWdj+Q
         MOloMrQgHhw7HvJkKw4RNytMg5RwrRF06WrnI91MzfKG0l0bXpPddGxG3EEH9nMyF1gv
         4Xog==
X-Forwarded-Encrypted: i=1; AJvYcCU/IxvQPtlDZE8afXlDtVzwNUqXJpX4WVLID8utcpjgaiWp6H6ujFzABH4sK0l2A6aUa+Axw2Gb3mgwSz8aSnww@lists.infradead.org
X-Gm-Message-State: AOJu0YwXJXsgtqg3i3slRG6RihDL+bvIrerfnql96DeobgeWRcZdbyZu
	g/yrpiLwyurVbY5PW/J7Ero52wzG9r9wlC6kTp+w2NsY+XUZZfYeZeB/88sQ/v2gFUszC80bYR/
	ZZdWwd6mB3gk2px/0/+L6C4G9JTe9/C0=
X-Gm-Gg: ASbGncttlINizdn4hUqwd1sPt3RS5rv2Ia3Jpz1UpDlCfb/vWkLoWFNXhzF0M+53M2Q
	V3G6HPp2Cej24L1rKbMT+Mnq7hZFDXmHx+H78mEbKK4902rz5vMPWcdJECl4zvzRLvnKkY2T3dw
	rIpEu9YIS//ZQ8FG4NM9mhPc4obdV+Om1TEGuq7Nn21WkOZCZ7pssG+GukEW2rTFa8oFzCPxD/Q
	O+Yylw4luz/cDK2Px0R1kaUiLXJfPI=
X-Google-Smtp-Source: AGHT+IGDpezXRZoKRUAmvsGEGRKGV3Cca8QMZMZ4Xe0LAt5a7sDWIZ6cqn+OuFMFCBuqxZGgIpVxUstpBqxpNK7ovio=
X-Received: by 2002:a17:90b:3145:b0:32b:ca6f:1245 with SMTP id
 98e67ed59e1d1-339a6e6329fmr8873915a91.5.1759421993437; Thu, 02 Oct 2025
 09:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com> <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:24:49 -0400
X-Gm-Features: AS18NWAkW_WGgw7RLjcHXntiCLOoMqdr7Jd-sVtGc97imtAcuufyjRqKmj5BmR0
Message-ID: <CALC8CXdUzp=sKeOaPnwJ3GWg8=qrXrZKNsKg6XeXxvutty-U-w@mail.gmail.com>
Subject: Re: [PATCH 09/10] iio: proximity: Drop unnecessary -ENOMEM messages
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, 
	Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_091954_254829_81E8702A 
X-CRM114-Status: GOOD (  18.18  )
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

yeah, dicks it.

On Thu, Aug 21, 2025 at 11:53=E2=80=AFPM Dixit Parmar <dixitparmar19@gmail.=
com> wrote:
>
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  drivers/iio/proximity/ping.c  | 4 +---
>  drivers/iio/proximity/srf04.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iio/proximity/ping.c b/drivers/iio/proximity/ping.c
> index c5b4e1378b7d..e3487094d7be 100644
> --- a/drivers/iio/proximity/ping.c
> +++ b/drivers/iio/proximity/ping.c
> @@ -280,10 +280,8 @@ static int ping_probe(struct platform_device *pdev)
>         struct iio_dev *indio_dev;
>
>         indio_dev =3D devm_iio_device_alloc(dev, sizeof(struct ping_data)=
);
> -       if (!indio_dev) {
> -               dev_err(dev, "failed to allocate IIO device\n");
> +       if (!indio_dev)
>                 return -ENOMEM;
> -       }
>
>         data =3D iio_priv(indio_dev);
>         data->dev =3D dev;
> diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.=
c
> index b059bac1078b..f9d32f9aba1f 100644
> --- a/drivers/iio/proximity/srf04.c
> +++ b/drivers/iio/proximity/srf04.c
> @@ -253,10 +253,8 @@ static int srf04_probe(struct platform_device *pdev)
>         int ret;
>
>         indio_dev =3D devm_iio_device_alloc(dev, sizeof(struct srf04_data=
));
> -       if (!indio_dev) {
> -               dev_err(dev, "failed to allocate IIO device\n");
> +       if (!indio_dev)
>                 return -ENOMEM;
> -       }
>
>         data =3D iio_priv(indio_dev);
>         data->dev =3D dev;
>
> --
> 2.43.0
>
>

