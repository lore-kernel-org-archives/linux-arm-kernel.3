Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549F9C83F0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDywWjxdtqgZteOHlklAyHpSbZ7foh31pe/ikqYRz6k=; b=UFMivbiQ055vwY026MphkH2J2M
	c5enni1sdb8n8lSEXM2tg0HLk4Ho2fqP/lhZrr9tKYXr6XUX8mf9zIdvrKJFEUJc+9NG4P0MVf3uw
	aLkApdeu5gkhOhXQasQLtVAGJHw78WiCQtm1xtGW0my++hXYtBr6FTDu9vCwnNawvfFLtPBE64vxg
	sYzWJFBXA9/XtZURRCcs9u5XNf/LYNb58epYCR4QY1IvawjUiZo8O5exeb9QOQZn2gjEQtcnV8Gww
	tr4SrWPCQCv1BRBrkXKtz2vCjgJX7tlsFWvrtWRLINAVsdEI1aDUEC3GwzvxsjCaMQQaLH5wA4Knl
	7tFvInPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXey7-0000000EHkS-35ZD;
	Fri, 04 Jul 2025 11:52:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcO1-0000000DsZ8-28t0;
	Fri, 04 Jul 2025 09:07:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b45edf2303so595626f8f.2;
        Fri, 04 Jul 2025 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620032; x=1752224832; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDywWjxdtqgZteOHlklAyHpSbZ7foh31pe/ikqYRz6k=;
        b=ItOY2D65qDOJmCtIGyHygigG/TbBXn4R/jR3HDHxlBCcDy93sOMeiht4YPkq1J1M7T
         GhE/Y7jo2xtCQBhgEtqeJa+Iegoh/Qa+gBBy+qvq7tl5FTzdWFVq5LmjeE5BT9Oew5R2
         LRPlOQ8av3EbGOd4Nr8YNL3JYOoBo1SQzsJlnLabN1gZTF7p8JbC2yrJbuVoxbrFaMTx
         oUMzN42tTleGpmtwe5ucJNzXlftgp5XA1gHyVp7y+mHu3mWCjiE/ldBuHUF7KO4Q+/98
         WM3qcC9psbOps/S8z7TWm2NLWjm4qJvY6L4cEIAMudlnkSKGmmoGuRXOtm8Q/b4xUDlf
         HZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620032; x=1752224832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDywWjxdtqgZteOHlklAyHpSbZ7foh31pe/ikqYRz6k=;
        b=bSoh/2y17oVVmeoHbB4Sn3cH56eUrNfn/rqxnkEG0o/Ox2EtaWVuCSbRxYZZp/hmIW
         mYIyieYxc0J1KftPEeIuU2pFJm/+VpUhSRWPib1cCZXK7l2mphXFhgC9EDBSgYdpZ/ki
         OPD/QUOt1gwFOzwsXHvbBBFPca8nDivasfKTizK0JSbjQxVFB9s7L+2GooFXpZlClNT/
         H0FkoGBs+af0MzZYrBF3+y2ylk0AXHO2QZIOqE2lbmQXmplHzj5Nkv1V19WBfs0BlHDQ
         8Yr7PnzZNJaFKs2k+Y5Wpc6f9ZxLsSQfkz+PS14PXtJOGIQZGnpoG/AYEtLIvP6/RegX
         18EA==
X-Forwarded-Encrypted: i=1; AJvYcCUxgnt2KIpVr7Po7K2b4XA0+cw+8iAKtgmoe5ZnZ2nXghTROTzQ8iVYlW7aq3RXWxzmdfL8wELAiPY03wdfe7Q4@lists.infradead.org, AJvYcCV3qh8ONMX4NilBiyTthOYyBjrKgMviX3WEQ/kATCGtcu1ONacVfvft4DLFjNr8h5ln2Gqtd1EVh8nD4EUiEqezHQ==@lists.infradead.org, AJvYcCVdwq6pBcO3+zDqnbsGMjB8BTBKidOakn3FpWCy+hJKg3tZZfekxr/c0Let5t5fhevkLZksGbBIDHZ3SUx5Y7M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgG4F4RxM6pKopdO/Pot2zly7skDU/cIfKuGbS/qzRKy8M9MiM
	C7UhtVPyEqImfio0dhucdCbhY7imNbVaz+X4dGaSnm7rbZCpJUx1FsgT
X-Gm-Gg: ASbGncuxkwla0L2nNPT5AnrdebdEy052dW9gaJu8K8YHPDgzs8izlLHWZjZ7NSD3yEJ
	WEiC9XVbrt+7kJw4zSY8IWWjL0Gwlp5jQn4ufYTtysXDuBPtXttT0GwcoEpgCH86ZajixyTDG5N
	jynk2vgmS3p7bW++J9CmnNBGlaDtmwY49p2+nQdcO6kjdMbrEoUd06ezLKSqEy1u4FDJ/sv05og
	Lxyvoh7/1L138ioc7LnYAY5bmSxfwdjB34GXJccrmo9yY+oKc2PlygZMRM2A3de6Om8jQZdkqgR
	xYEs009G8sfSB/rY/1JvVeZoK9bhOc6bo0ILJRIv7NHH9InlIMGM32ReRzVuADdPQzWfnFxyffB
	Qs/WCRyntgjpiuvpUyrMzi5eAUmQ6mC+9ZYu2yI8eYGr2tNB5
X-Google-Smtp-Source: AGHT+IHEPxQdMHTXbR1zyfFVxzPQhYfItopt0GRpKhNC4icZ8avdDH2El8o9lUAz/MQc695EIAp2Fw==
X-Received: by 2002:a5d:5d8a:0:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3b4964f8be8mr1457452f8f.15.1751620031616;
        Fri, 04 Jul 2025 02:07:11 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c9f9sm1967858f8f.93.2025.07.04.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:07:10 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:07:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, 
	Martin Hecht <mhecht73@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Matt Ranostay <matt@ranostay.sg>, 
	Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Matthias Fend <matthias.fend@emfend.at>, Marco Felsch <m.felsch@pengutronix.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 41/80] media: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <oanwnvwlfewhtihgxqhxeuyayiqehzryqdsvmq5hku62nn7ri7@favwssinmjjq>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kwmvyrwxhkrq3xlc"
Content-Disposition: inline
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_020713_550120_6CC26CEC 
X-CRM114-Status: GOOD (  10.26  )
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


--kwmvyrwxhkrq3xlc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 41/80] media: Remove redundant
 pm_runtime_mark_last_busy() calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:31AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
>  drivers/media/platform/nvidia/tegra-vde/h264.c           | 2 --
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--kwmvyrwxhkrq3xlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmbsACgkQ3SOs138+
s6HR2g/+NoY3pcxcF7vUmDQS013DsHFgpV+Tl+JcGqzntxo7nvqoPqTVCDHLybr8
bkYad4XE946YrelbKsxzncJn4vZjVB6qrGMujyv65H8WfO7AG6nzlibOIunL8WOd
Y+uxVe5SBCDS7bajKFtmuEKFnz08e0bpIWOgKkOauDAuEkrbPsqXXYSUxXE+pf0z
8XTFc6AQAMeg4AQTnDMUYRA1FgHi5ZQCFhedxjKRmXSQd+P8td6GZsvYK427AWyK
mvKwRu4NPb6FosulEpEctkbpI6ObbN7fAUdjbIlSIHnNm9L/GDApH3zAGn5oGT0q
m1XodmUsGZHRJt7KEzAqHqx2pzM/ab9UNEJGDaCMzpYGJMjowIYpoVgxubKmwVUV
YgVNJ0IZL4QrGL5yr1S5XZD0+0pi+vH0nrjX9MewaJyhDebyBNKuifREtuPndWqS
hXBQXVtSFW/mMCCxyMYmmT6GBNjnbd+vaTiRFGCNz1cds0nz0F3LtGTAg+UjGe7o
p5+7dWzdafTk8aIeGY6Pozuei+LziegbVWpegNMLkK9TRVwm21bKvhggMay1Fl8z
R3OBaZKmkHmsqC25vsdaVhwNjFoR36UqmGhXUMnl3gl4aee0lbG6nCqJKBAfCJUa
dkGr3BlRGwk0DC98kTAVD7TUuwmROlTKR5tlcoLgvi7rPb/C/Ek=
=tZ0M
-----END PGP SIGNATURE-----

--kwmvyrwxhkrq3xlc--

