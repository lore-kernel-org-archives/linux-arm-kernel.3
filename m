Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1755E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 00:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOo5o1IkcWYIYeHg+0oB2U3HqNWFzIG3pPjklrK0UCc=; b=IU/0MSjio82ZSWA73GNEw6VDCw
	kSjQlTQKXwxCb/wj5gwJ3jH7ghBMK8EM/wbzDwsmHn7ZxHTgJI0kG/NnD1xhWsGxWMrZeBgt0ShBS
	WZ28l0ybh5Es8sYQ4eTfSSarRh+yuMvyBXoeLSPcHHix0gY3yCW/4ClNPyDHkb0eszGxeK2NaZ3Rt
	mjNMQZEXvPfA2D4MB6E4s3X8YiPXEOgPv9L6nGJo0EcrdQUkJ7Abb+mjDD5H+HdPB9Y/vrbq8rNYm
	T4OpfhQLpEhb+9GKh9rNHoFixdu7B9gmHwCwnvLM++ZFw3+ufxZkCpbDHJUyf2GdjMzISUTa9cU0x
	eBOnVadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLrj-000000001ph-0HcB;
	Fri, 06 Dec 2024 00:06:39 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLqg-000000001ah-37iS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 00:05:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53e152731d0so2294922e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443533; x=1734048333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOo5o1IkcWYIYeHg+0oB2U3HqNWFzIG3pPjklrK0UCc=;
        b=gpD1e+4oRUkMXgo1JYotJHfTfCgXi8BB23ONFSf/Rle1Z3WQ7vNtAf9Dz4uCxgaXO3
         S0gV3ZXsVDDbXCUKbfk0TkLB4SoQLyj3UqZ1lx927Ky6tobyvQaEZLnfN0f3a3576/DZ
         5ho5Kue5p54TUWwhSBRyE4V5dNvsYfjYKT4px64NrkwycA/xkfN/cp/OBcdvEfm46Z7E
         PSguXSZWIkAOyIL+tjIdoUWu2+87tyHHG7oTEzUQQYLTDJwCDslWuMeVzXlHq5FM+Y9x
         6vl+NrBL7BscV2YrAkOYqgHHgVbCEG9zCEWX4rohWRJjLDdppSR+3mP/A5ObWyE8ls/F
         DTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443533; x=1734048333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOo5o1IkcWYIYeHg+0oB2U3HqNWFzIG3pPjklrK0UCc=;
        b=CqM/CaLQo9JtWcLDwVC3SubyXZFaXHYDaodT/pnYwJdz4ZNb8yHNxXgK7vz0foyLcr
         Nw7O91PPvF6UOc0byx6lpV7smv2LudLc6NaMl4GQnOiuej2A8kr6tvGWBAlrM0MCGqAS
         cuJbDuCC0YJ4DRAr1jE9+e4G1ay4N87hHH4BqKgrEbcbOOK35LxB4o1eQqQ3B0PyTrsD
         nSlDPL5Ut/8rsoZqKReWWJghSysx3xd8hdujynwWPeT9gLIjo6TnaEIURNN8d2EaiY04
         Ju7PeVJr+6LIv747dddjqwbwjKnBvdzWR9Pwo/80LYKDrHNTBrRkYnlZfXpn/UfLTHFh
         d/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWi3aAUKyjkBQora1kQf8VZ0UtXubEbinTAuTIYdLHOTwYTCsbuHq1LTmAYQW23krenLjbfGE6WvJXsIPPZsW8I@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8pCYUqgDCTFfkwt4frtHmiQgvHUD4FIQeuCYdIXlcdffnKnuh
	LM25no6awkZ+TU5V/FEbM+3X6LxogIdCDgXEakUOxOX1VcQRXlnDnLpt9mCiwjpQv+KblVkfZc6
	BYhGmFQGJGMPthi9NP3uKxebk5ER6qGtoWA1Z
X-Gm-Gg: ASbGncvdH+US9PoF38oKKsEx7kE90KY898NE7dsRLAcPgm9XTqoLajdOGdiEd6HW0KR
	KM0ZzqZSzl1by9CqTIjn+xILcACdrVw==
X-Google-Smtp-Source: AGHT+IGyZ/TZMqzTp8+it+xJqPWDkQKwRdqrGP6nkAD/oOmQhsRauaZCXRwfpEP8IRWA2Z0RTrR2gBDTeLWDpYubwUw=
X-Received: by 2002:a05:6512:1189:b0:53e:18ac:b1fe with SMTP id
 2adb3069b0e04-53e2b6ba9abmr349123e87.1.1733443532699; Thu, 05 Dec 2024
 16:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20241204221859.2248634-1-sashal@kernel.org> <20241204221859.2248634-4-sashal@kernel.org>
In-Reply-To: <20241204221859.2248634-4-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:04:55 -0800
Message-ID: <CAGETcx-u9BuPLiJ+Hn_29xmR_W3d7jC=uPFsw70eC65CZ_9UtQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 4/8] drm: display: Set fwnode for aux bus devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, sumit.garg@linaro.org, ricardo@marliere.net, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_160534_798937_BD6CB8F0 
X-CRM114-Status: GOOD (  18.38  )
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

On Wed, Dec 4, 2024 at 3:30=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Saravana Kannan <saravanak@google.com>
>
> [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
>
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>
> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google=
.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

As mentioned in the original cover letter:

PSA: Do not pull any of these patches into stable kernels. fw_devlink
had a lot of changes that landed in the last year. It's hard to ensure
cherry-picks have picked up all the dependencies correctly. If any of
these really need to get cherry-picked into stable kernels, cc me and
wait for my explicit Ack.

Is there a pressing need for this in 4.19?

-Saravana

> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/d=
isplay/drm_dp_aux_bus.c
> index f5741b45ca077..951170e1d5d14 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -287,7 +287,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>         aux_ep->dev.parent =3D aux->dev;
>         aux_ep->dev.bus =3D &dp_aux_bus_type;
>         aux_ep->dev.type =3D &dp_aux_device_type_type;
> -       aux_ep->dev.of_node =3D of_node_get(np);
> +       device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
>         dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
>
>         ret =3D device_register(&aux_ep->dev);
> --
> 2.43.0
>

