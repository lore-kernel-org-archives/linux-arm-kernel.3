Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821E4E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3TPBP6t+GJK9sLABw7iuDGZ/6x8FUIQxd10a+gfRfo=; b=O11ulhLkm5QdLuvdsPzl1nmH20
	PVduEwAUG7JKbxRVnXMGnHk5FszVqGZ9k/HNGsBZ1aQxuVPHeN1I92YToy86sLhAnt2p/uVcZ1uNy
	qbsZQQJzkdCi0HIPTDUmwTzxQZLB+nQtzDO63vs3Eo2x1N5LEJb1GiWJWgBe1AtFEysIrsQIuZ7hp
	zQBvEU+Lc1WcR44cRwdoKOLIGUxbuVwqnB5aEBTH8OFUgRDRTDDa6qZ3byCfpLaOCs1bg05KuwuyN
	aPRmFylRxJOS5p0ZknUUO1Il0KLuz0HiN230EXL1JrsR0d7Yfb6uOUac1xBK1F4JiqkDN5ZVhwNiJ
	pThlBScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLsk-0000000027E-2xlE;
	Fri, 06 Dec 2024 00:07:42 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLrL-000000001l3-0USO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 00:06:16 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53de79c2be4so1625021e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443573; x=1734048373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3TPBP6t+GJK9sLABw7iuDGZ/6x8FUIQxd10a+gfRfo=;
        b=hEfksAYgXD+e18toXMO7OXL8RCk2nSGy2lQnFnCkINTQoBZLqpYYEQvkwXfW3aPi+5
         olpUREY4enBk5fuy1Ib3xvnuN41CKz3zyUM1RQ+VjCEhtfgcz+3HpB0PrfaBIbAGHfOd
         f1ca4kQ3MhR2zS9UI1Nw7Ad4FZpTrU1DGvPt/wJYc/tGcJEzpnbalLj+i6WwJIzkfGVS
         xRuwLShnwdRGssko5J3ReOA9fPemQ0zBbOwgW6zQZPszLmJ1b8e9DFFskjPLqsHpCZWt
         Na3vuUCw8uBWDpmsGxHOtwoKsUZCNXpoI6xp/81gfRbw0rM5IF+ZO9yMAxYbK0CTrvXS
         nONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443573; x=1734048373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3TPBP6t+GJK9sLABw7iuDGZ/6x8FUIQxd10a+gfRfo=;
        b=TJZW7WViwAGhAZ7ZZzbcA/uPQzsEFkg0HIHc0nuOCxjq9/suMq6/sR48gLdb/jK2j9
         S1oPVz91RO8Ft1l2TF6TUhF9HsvrLSLNRhSqcibEruikzL8TlvStjGJoUi44+yZUJiI4
         wHjuUFvd8zkCJc6Vb03wXPMFrjZ11hgwJDm9d95n0ZOGrNnnfhR/J3zlXA0VlJ/eaKI0
         zB8+Psy6EgJT5ppMYySdTcAzFKCu0m0F3Ypjh58EYMl81HktJRBYUqX93Gk/2RtEz0U9
         aedWYC6+L7ByvznK2EPXPJVWsXgH/NCdkDNPWx+1ZVancgi5QLRHijtZimRPawcqNekE
         0Wag==
X-Forwarded-Encrypted: i=1; AJvYcCUKC2vAiaVBKo8SP9TociINmMY4iCsCYLse4+VGoMQsZp4HKLZSbFAuVHJBXJALPpzqTIM2yNNtHsq42pPsQcuW@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ1/iIXacglaawD7aZE9XQMrpibJEq2jjvs6GYVulERorrIlKU
	yFESTsT4QtY+ucSLHMZUZf5sU4VGGkOwCfj/vL1lnQlx1rBARqe5xfK4floogLmeXwuRyniPBuy
	maHL8Hvgjcq96WIjb0Nfpv7Jx1olFcf2dSKD6
X-Gm-Gg: ASbGnctpMNLCDhHkV8SCfnrLM6g82FGo+yOuWeu1/OaAS9v0S6lbvzuKNxrtd38z5PA
	CvuVzyUhEYUZ1hZarE7fQE5oDbEscUg==
X-Google-Smtp-Source: AGHT+IENUCJT3jmuSq+uuBSoJsgvgSBDBHg4ob0uMlJQb0PpgFG3hX9cyDh1XGO4hDnpY6OiQOw6us+nrtPgXeARTyM=
X-Received: by 2002:a05:6512:104e:b0:53e:2116:fd2f with SMTP id
 2adb3069b0e04-53e2c2ba477mr238894e87.24.1733443573131; Thu, 05 Dec 2024
 16:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20241204221820.2248367-1-sashal@kernel.org> <20241204221820.2248367-4-sashal@kernel.org>
In-Reply-To: <20241204221820.2248367-4-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:05:35 -0800
Message-ID: <CAGETcx9RpUz0hR-X+rO6yKRxOmrMLveU7EMSACF49kMTMqdaRg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.6 04/10] drm: display: Set fwnode for aux bus devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, elder@kernel.org, sumit.garg@linaro.org, 
	ricardo@marliere.net, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_160615_189282_40804B10 
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

On Wed, Dec 4, 2024 at 3:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
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
> index 8a165be1a8214..d15c0f184983b 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
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

