Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95B1E77175
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 00:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=; b=X2wxxFG+v3FwxrPlR0Pve1T62J
	elr3AThYAI4V8nCBRWhpx1Jmji8SVEUn0BB1EAfME8sJcmAoPK9hDlxQldS33QE2p86to36Jg9G+2
	nYpszaAarV1/XBzV2Wf6+5EUxUSQfVQ4t2wzFGrS8XosEkaQ6Ab1NxIMjGQg5TaP4MuyoU5mkQydO
	gTF3pBR8Mdy5n797cgp9mQT5MFxqd+Bt751G/zAxPpi/Ah22sPspIpdg9rF//wbC5RHFevD982A3a
	GAwT3XMMWZMz2s5wnqcqUVsoFZOlYWI98yc4g5VfLMFz0FvuHFMhJ3qRQDAZ8sLN8XQSQjOcMsy1n
	NoG46TOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLtk-000000002KX-0i3Q;
	Fri, 06 Dec 2024 00:08:44 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLrl-000000001qd-1IBZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 00:06:42 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e2ad03bb3so422495e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443600; x=1734048400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=;
        b=hJoCitNUs86HeJTfOkeU7slctauFzPmfx/Pd5JBeg8DvmqV4zYj6HFvIEdlvB9mWsK
         d3nvRsPCg+639+zj4518DrUX6SbzfnouWbDYtiTLrcRCWZDMm0qRnrHxhmDHGSWQzhny
         fmUuYHHTy6oBEAVGrwyWpreqYmVyixTmgh+GifggK6ZLczRoFvFLXLLOWCmTBPXy7eyV
         mf8qfCeCG5f4LjBopx3n07gbo+olkgXLZkbZWzZRKPAbCE3jZBXsFHxTmKDk0+3w1CuU
         NL9jQh0sV+5y/7HBoFdJsP+pTnXOLqhpqQnuaH74u7rEUVVx2owNUSWvQFGymvie6Ik4
         9j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443600; x=1734048400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=;
        b=pSUr73Nj4gDMCgPEVpBtZcGiNoud3LfxWt9pBHqmSX7jwKPhRM8PlETnxOVpSplF+B
         vNEy5WVaVowUkDSWcSZdME02JNHc/LIP0UHCocQyyRyUpftsXUV5zTZHkNZnVMYDB0Ij
         oqMAJYrNyaZ66YoJBPmFQgGquijnpUVae8aLmrixKqKVrYzLcrU5eodaHmFmug1J0aMv
         Tot21uoPvatC+c8hwASSFFAoQq5J1Iiwh+u9sGsc+Cag7UkTyTNG9bcbNYzs2oBa1V6F
         RYEx90l4Zb0IWHnDI+LqmE/Q2izrdu4UqYr9XfCTKUblp9BepYMAwXSFXveefGjiQQS4
         jH6g==
X-Forwarded-Encrypted: i=1; AJvYcCV5T2iabqSdZ6HV2+bTiAA/e50QK2SoujMV93pnZ/FZW2SEMdg0QYApBLa77qEq1lc1aTFoP6W2BMQ5G2IURgQy@lists.infradead.org
X-Gm-Message-State: AOJu0YwwR0ugjuvREwnUt5zcGH5gHVwqDtc0zuJiyx+t147sGqF91DEI
	Lqn9bhUKTj01sUBMeyRTXMnd6FoBKj36CGoXjh92osZ9R3jqRshY6fHF+S07ycNjiGjTgpSkjnf
	wU3wCgW/Od1OR/7lKizFKBVJ2EYTeEE2UbXAs
X-Gm-Gg: ASbGncvCXhetbtrLpM4QFryLqjzjuV7aOQOhMhGtoAk24YDpTvcp4gtxWsE9rmLjBpS
	w6JA7XVRZOCGBJQUSc/K1LQV4pXbAxA==
X-Google-Smtp-Source: AGHT+IFMKCgNjf7EuTIfzy1U+mxlTHH4A6RijBLU54vNTWXHVXJQWJqIB/kHPOOCzpMc5RVjG0prBUt0JknyJqn08+E=
X-Received: by 2002:a05:6512:4024:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53e2c2b8f76mr213110e87.20.1733443599437; Thu, 05 Dec 2024
 16:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20241204221726.2247988-1-sashal@kernel.org> <20241204221726.2247988-8-sashal@kernel.org>
In-Reply-To: <20241204221726.2247988-8-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:06:02 -0800
Message-ID: <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.11 08/15] drm: display: Set fwnode for aux bus devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, elder@kernel.org, ricardo@marliere.net, 
	sumit.garg@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_160641_347309_0CB69EEE 
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
> index d810529ebfb6e..ec7eac6b595f7 100644
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

