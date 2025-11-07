Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAF2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDUTuqIm1mC7bv4+LL+huhJyC8iiKtLcTtZF/qxPnqw=; b=Uj6HukTvDx66w3ub3vud8A4XRZ
	tRx+fnmnO7HV6QYnvxo9YgxwleTjf2AmGdVRTZESNYF58umKLeoGyUR+u7ratrc2LMVWWogb2E0fu
	Vl5jVn0UcVXyVB64NlEqxm1sayCE5eJRhYqcGbCRyPF9KomvxS1UnqmON1VW0RO2AvOpnLqlHPVmO
	kKLPKo6gHAMUxiFsMuto17ISM1cM4nQvoSZFDCpcdOAjofOD1zYevz046w+oOq+wlMCNcrqmSn8AM
	z9DCAQkNkvnNXqVg1hlsTQyHzcIyRjuYS5FkpVqWSfPY+gV4hUIN9a3Jwp02V8J3od81+iK5pZrvx
	JsLYoA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHT6F-00000000wv1-05Ig;
	Fri, 07 Nov 2025 20:30:23 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHT6D-00000000wtZ-1sZh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 20:30:22 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8804a4235edso10988516d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 12:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762547420; x=1763152220; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bDUTuqIm1mC7bv4+LL+huhJyC8iiKtLcTtZF/qxPnqw=;
        b=cisRBpv/ZRwGbviGsoykbY5YcsSo1nwPGSlcnkLlHULGFj3dOy+xwUTass2nrGyYVs
         60wmuBx1k6dxWEww7fUfNtTspvXS/vcwqSP/8+uDzvNnxybabiRbGs/v2i9rEcVZEfuY
         peVF/s1m5GMFWWgmwnM6IZ1u+t+5FB69mavtBtKcMCT+MRww5ie8e7PbGDhJm+f21QZo
         AtIfvPI9c9dtydK2qdOed0wj3L1DhcA3+mzJtBBfib6klDTHbhEK7ukZFV3BpNRrvsnA
         e4fDDq1er3DCxaoi/j8jvZbpw74XNoy/KARx8s+G2wpBsO4Gr26qF+wDCTXNFmAGFZ7+
         Lsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762547420; x=1763152220;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bDUTuqIm1mC7bv4+LL+huhJyC8iiKtLcTtZF/qxPnqw=;
        b=cZ+Av1ZkXec9FSHLC6KsjiK7//56EIDnfMKSArhZ2L2em16TByr+6RqJZimHmnXJqD
         CAyTID5DoALwX1mBIcdd4aPRBX+yRVpHLLDBeOAJ3hy8VtC9xgRSqM/BXLhLHxcy1/fm
         p0vYU7YE6xlecLDKPOw3FmaZ6UqeloXxD1+jB6I9FjeMRR5YROUk7w1JqiXsHmxovF2t
         chH0p/+gjt+0Yo/frWleGgXSxbqyi4YYXpSpF54iB8qYmehE8hvNcHV9OiQmgyQeSONC
         weZQ4voh/bTerRWdtr1u/JmEviigEcyEohVJGiA/Gg6JjOmKcx73n+2WBrNkRoOthym7
         bQbA==
X-Forwarded-Encrypted: i=1; AJvYcCWhgwgDHTsNYQQks9fWu6LWrDfI9Mwt/NBOPbovMFemMfs7Vza+cQjDsFsbcmjwg7iYAJJnQXJLBaOMAxiCNt8Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwCimPEpxIviDnp7OsG7tfkU7SHzyrhCKh9/CqgOmODN4lADchz
	C8+MGQC9p+X7Icdpf5wd9LjapAcKmto4LleGUkJ9IlnpjufthB9FT9cb4/E2UEGEnQ4=
X-Gm-Gg: ASbGncv0cUaqRKhekemumM3GGfdq1Z49Q7hyFljY6qla+uvSQkx94kGw9S/lW6QBo8C
	SeYz95eCwqYDdNMAd3ocH4BwxQyd3v0zBoxG36Iv+xubRuWA4QlwGqzvV00pggdsxjErHwe8flm
	eGulmMHz8nDjgkWqnOPvFbEEBzwND0xCz3U/k0BrllgmQMVoOJirXHd8h4K8it62XN6PtIp6nfY
	UmRHi3ivyPceuhF1QwSuJ2rgdeaXn78ihQ+0Q0/+52J+LeHWONfaO0Xdko+Nh0F4qTYLS8eBI6v
	fTW3/G4ig8d023Ayc4ntygkI1RHXs7+23bHIR+aSBxmShLav6ynIrFhrUMUxzXZP9tJkejbSiAl
	3MvrkZ3DVxZBl87Sb4uASWGLage0oIpifzZOr25heHfWhUEmyzIYVgpl+ct6ZwxGcSrdrDfHtIf
	NKTZGHo2X7ve/7Nvlm
X-Google-Smtp-Source: AGHT+IE9+bUnPNb+D1GoECSagGgXpcy/iSFjYsJia7JIfqLUwPkrl0EwAL48d7DeRv+bzbrI2oATHQ==
X-Received: by 2002:a05:6214:dc4:b0:880:5001:17d1 with SMTP id 6a1803df08f44-8823871e956mr4781436d6.37.1762547418122;
        Fri, 07 Nov 2025 12:30:18 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:ef24::c41? ([2606:6d00:11:ef24::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda578532csm1296591cf.19.2025.11.07.12.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 12:30:16 -0800 (PST)
Message-ID: <65c923cda564f308eae5f24191afc1c15c500ea9.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/4] media: allegro-dvt: Move the current driver to a
 subdirectory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: yassine.ouaissa@allegrodvt.com, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek	
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date: Fri, 07 Nov 2025 15:30:15 -0500
In-Reply-To: <20250716-allegro_dvt_al300_dec_driver-v4-1-f87c01c9f7b5@allegrodvt.com>
References: <20250716-allegro_dvt_al300_dec_driver-v4-0-f87c01c9f7b5@allegrodvt.com>
	 <20250716-allegro_dvt_al300_dec_driver-v4-1-f87c01c9f7b5@allegrodvt.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ticGmTQqqGJykJCTcdtU"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_123021_518118_C13CEBE3 
X-CRM114-Status: GOOD (  25.20  )
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


--=-ticGmTQqqGJykJCTcdtU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 16 juillet 2025 =C3=A0 14:55 +0000, Yassine Ouaissa via B4 Rela=
y a =C3=A9crit=C2=A0:
> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>=20
> In preparation for the upcoming driver update, we need to relocate the
> current driver.
> This will help ensure a clean transition and avoid any potential
> conflicts with the new driver.
> This patch is crucial for keeping our directory organized and
> facilitating a smooth integration of the new driver.
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/media/platform/allegro-dvt/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +--------------=
-
> =C2=A0drivers/media/platform/allegro-dvt/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +----
> =C2=A0drivers/media/platform/allegro-dvt/zynqmp/Kconfig=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
> =C2=A0drivers/media/platform/allegro-dvt/zynqmp/Makefile=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 ++++++
> =C2=A0.../platform/allegro-dvt/{ =3D> zynqmp}/allegro-core.c=C2=A0=C2=A0=
=C2=A0 |=C2=A0 0
> =C2=A0.../platform/allegro-dvt/{ =3D> zynqmp}/allegro-mail.c=C2=A0=C2=A0=
=C2=A0 |=C2=A0 0
> =C2=A0.../platform/allegro-dvt/{ =3D> zynqmp}/allegro-mail.h=C2=A0=C2=A0=
=C2=A0 |=C2=A0 0
> =C2=A0.../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.c=C2=A0 |=C2=
=A0 0
> =C2=A0.../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.h=C2=A0 |=C2=
=A0 0
> =C2=A0.../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.c=C2=A0 |=C2=
=A0 0
> =C2=A0.../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.h=C2=A0 |=C2=
=A0 0
> =C2=A0.../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.c=C2=A0 |=C2=
=A0 0
> =C2=A0.../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.h=C2=A0 |=C2=
=A0 0
> =C2=A014 files changed, 26 insertions(+), 20 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 60bba48f5479a025f9da3eaf9dbacb67a194df07..2cea337bd426f203a8dd8f5f2=
689f8091137175e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -817,7 +817,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> -F:	drivers/media/platform/allegro-dvt/
> +F:	drivers/media/platform/allegro-dvt/zynqmp

If you can get Micheal approval, you can then carry over this for the follo=
wup versions:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

> =C2=A0
> =C2=A0ALLIED VISION ALVIUM CAMERA DRIVER
> =C2=A0M:	Tommaso Merciai <tomm.merciai@gmail.com>
> diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/p=
latform/allegro-dvt/Kconfig
> index 2182e1277568a407f51a23ea437811c50b1183c8..e9008614c27b9490d1cd29fab=
887977a1918ede4 100644
> --- a/drivers/media/platform/allegro-dvt/Kconfig
> +++ b/drivers/media/platform/allegro-dvt/Kconfig
> @@ -2,18 +2,4 @@
> =C2=A0
> =C2=A0comment "Allegro DVT media platform drivers"
> =C2=A0
> -config VIDEO_ALLEGRO_DVT
> -	tristate "Allegro DVT Video IP Core"
> -	depends on V4L_MEM2MEM_DRIVERS
> -	depends on VIDEO_DEV
> -	depends on ARCH_ZYNQMP || COMPILE_TEST
> -	select V4L2_MEM2MEM_DEV
> -	select VIDEOBUF2_DMA_CONTIG
> -	select REGMAP_MMIO
> -	help
> -	=C2=A0 Support for the encoder video IP core by Allegro DVT. This core =
is
> -	=C2=A0 found for example on the Xilinx ZynqMP SoC in the EV family and =
is
> -	=C2=A0 called VCU in the reference manual.
> -
> -	=C2=A0 To compile this driver as a module, choose M here: the module
> -	=C2=A0 will be called allegro.
> +source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
> diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/=
platform/allegro-dvt/Makefile
> index 66108a3037747020d549bc0a427881e0667a3f0a..d2aa6875edcf7760901996aac=
4d5ac98282cce20 100644
> --- a/drivers/media/platform/allegro-dvt/Makefile
> +++ b/drivers/media/platform/allegro-dvt/Makefile
> @@ -1,6 +1,3 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0
> =C2=A0
> -allegro-objs :=3D allegro-core.o allegro-mail.o
> -allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> -
> -obj-$(CONFIG_VIDEO_ALLEGRO_DVT) +=3D allegro.o
> +obj-y +=3D zynqmp/
> diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Kconfig b/drivers/=
media/platform/allegro-dvt/zynqmp/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a0a697c420da47f87f05153a=
2dbfbe5d3ccf988
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_ALLEGRO_DVT
> +	tristate "Allegro DVT Video IP Core for ZynqMP"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on VIDEO_DEV
> +	depends on ARCH_ZYNQMP || COMPILE_TEST
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	select REGMAP_MMIO
> +	help
> +	=C2=A0 Support for the encoder video IP core by Allegro DVT. This core =
is
> +	=C2=A0 found for example on the Xilinx ZynqMP SoC in the EV family and =
is
> +	=C2=A0 called VCU in the reference manual.
> +
> +	=C2=A0 To compile this driver as a module, choose M here: the module
> +	=C2=A0 will be called allegro.
> diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers=
/media/platform/allegro-dvt/zynqmp/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..66108a3037747020d549bc0a4=
27881e0667a3f0a
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +allegro-objs :=3D allegro-core.o allegro-mail.o
> +allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> +
> +obj-$(CONFIG_VIDEO_ALLEGRO_DVT) +=3D allegro.o
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/=
media/platform/allegro-dvt/zynqmp/allegro-core.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/allegro-core.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-core.c
> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/=
media/platform/allegro-dvt/zynqmp/allegro-mail.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/allegro-mail.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.c
> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/=
media/platform/allegro-dvt/zynqmp/allegro-mail.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/allegro-mail.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/allegro-mail.h
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-h264.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-h264.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-h264.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-h264.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-hevc.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-hevc.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-hevc.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-hevc.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-rbsp.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-rbsp.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h

--=-ticGmTQqqGJykJCTcdtU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQ5W1wAKCRDZQZRRKWBy
9LquAP4vrhxbrcsa2NVRSdgDGr1S60g6GOJFRtdYIYHSkGdo0AEAm0E/gtv2/K/S
yEhiuHijQF7Oy/mcG+Fguwx5A8DoVAg=
=tUk5
-----END PGP SIGNATURE-----

--=-ticGmTQqqGJykJCTcdtU--

