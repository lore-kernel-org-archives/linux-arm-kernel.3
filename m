Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F2E7E0D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=; b=Iq4qQmEOZs99QsqlPOoH+8iKib
	H9p9he0wS5Wi5Wg4rGCTDvs3wKhIkyMoh5G62RsffiEd6rA9Ox+o/uj/EwH8eeW6In5s5oyLhC5hk
	A5VvgjTMAo6+a3/NJl963MPD9FbWWxgjKcUfmcC6SbS5xxXQIdSOn8mNlBsrMIz4sNWdM64VbKReT
	AJsB2sH8GGu/kJaeVyOPzfCRu5R8TapKYWQkVISZIjktDwObHFVELakYN8Hy043HOjinh9DmXHOqC
	204wNXiHMehdoiuj9m5kfSJUWN/+UxOZVSk3+44CGWywAwdUUu+k8/pwRtW3rpzvkHQ6eJRQlsA+h
	LtrLL3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWHj-0000000Fsap-13hu;
	Mon, 09 Feb 2026 18:46:59 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpWHg-0000000Fsa8-1Vtp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 18:46:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so604389766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 10:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770662814; cv=none;
        d=google.com; s=arc-20240605;
        b=fLrHY6ml42mZkfvAomQOAlF53OZEL7ZZkpB9KoHO/JrR7zKtoMp/38NVAgErrRjuJn
         /qsoZDr1kf///N25zKAad1DWtPUzjZlA3wbqKI877b3OMZ38XKKXJQeDcFyiAnmcHLd1
         CnfgBVKOnunx+OTOvlFyQLbJC2NS+aqBjJh3neUkSxe54FqgdGKS5qZ4V6T1rKqTYtaK
         Rz5V6cL3UuVqR1RTaFJWNL7yVjnqytRNK10VWhxYj1toQQig24srjfsmLPn5NkUP/F+K
         HJp/EqEniB2EVXHDEEybwKD1f3UFvae5t4uXXBECtMbz03mL2hOGwhmTY0HWui4qO/Dd
         LhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
        fh=FP/nMjBDs3BqjQBiBoPq7E8FfONNJZ7/ERMLNcBt8QE=;
        b=Hn1Zw81Wnzo/myaAdAuV/JHXYHfxkrWmAs0HnUukr9iKUXIdoWotUqFNoQM7I8Ijcc
         N0iKUOrD3vWYf4GeBzCaIDW+QT+NXfyz/eQrJtLI1t7EH0xJVtovscBX7sArtuBaLkhw
         fl4bK5+Y8xKO4/l+4QPkD23JCR1Xv9GTONuVjO/pCrECQgzf/D1uRnuAOkkaNd66ZqBc
         ibVg8ae0l4seuX24ssQnK8pRnExvdyl8zWxj7A3gJGthTNxmU16vvkOz35PlMYGq2o22
         z/2ZyprRRixWIre4ZQM2qxlnh0MbGl4DFsglTRahbGw2pW6asygMEsKj0Inu9nw1WoRP
         xxKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770662814; x=1771267614; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
        b=cINyfSgnlQ3TabvhLP7SiY1MzJdEsmvrAMbRB1sHUTSa3SYBasT9qNYV0OAzCvdYch
         brAus6gM5ma4OhJm853v9duO8/uqZuTtu4QeGs71BVyqiZks3Bt92q/dWH9rXmZhH5T1
         +eCHOWOt2CfcW/S9PCIylV8B310XiTWh0x6uu2ED3IHbL+yDpoGfACs9LNCI4vZMNnyF
         VZQXcEyqCsi92Q/cVFbkS0CbiybdpGOk/ws4/Xlgq4CiUJK1fQEY5/JdAolCYoHgKJNc
         IkphhbvR0xrdCq/E5fAqqMvZJPJcmxkuIAQiak8kHqwD8fB8avIEoGa1UUYEgWd+5Cs1
         xR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770662814; x=1771267614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdy7gJsLYllkNO0/gdiw41aVS2auSaqMrEZolWNWaNw=;
        b=A8AVl7x/tFXfIj1vLtaG3vv10yb+oD5ywPIHkfqAE5j4GXTd2c3gaUp6wOAU/fF7kb
         F1pbCFmSruow7MBM0t2iGrQJ+BvyZxk9leCT0XxrQ78NUQl68A91c+WQOb+JFdkw15gS
         ViLSHDaQeQ/3xQji7qCkFRe8SJjcHMy2T1gpD/pWY07P27WOyHgtcO9SrKkc32SAS8lG
         e3u46ByQkvz7BS6ShdNsjezA40p687LjhN3uvnxwTtnsPBUYAyQUdbNS4Wd7BmlT1csj
         4Vr8PJTFrTdiXAnZUnbZwDUCPN34rGZSHdxLvn197eV/RNyvvVPJAAwYTGx+cc5T/Hyj
         VVgw==
X-Forwarded-Encrypted: i=1; AJvYcCXf3Olc2AKvKgGB2tOI3ZKDu4hUTX0tgyChcY3yDj2MT+/2vhvXj0ciB24miEM66upIj+pw3GtRiSS8LxGbZLgn@lists.infradead.org
X-Gm-Message-State: AOJu0YwpV/biYWbVQIPNOVjIUxzOtAgnCDhVsRMJGb2dtYkR8odwd3YM
	dqR4OCl1bx6A7KcJYJ/r70Sg9sNQ8tiv6jnSrSmhRUe+gasK9RmAAbOicKsf2BRhRCTF3ULGBIH
	wrxw2XU4DZZdzPj82HyTEBCwybVRLJmA=
X-Gm-Gg: AZuq6aI7AGfjRmGocWO6xAvbVhvz53r9l/v5PfM/CqHQC8Qtsya2xXRABPqbDSnhQyK
	xdfseM7tJb9DwaRn+u+2VfvCv44EA2qcv8LRrafKGB9AIAwtKlJnL/GNQRSwrywnkW/BiVjL2Cm
	rV1NKSfJvdbV+fwHVMO2bPhNuOdrC4fzQO7ZCndcmeImlhaa1BeS8kqzcPMtwn0RJh+pHzWqVEl
	s00MtkVV1KMl0bnkaF4YeqPu79pCzK1Ch1cqZKEmpBp5XwEiVswkcQaCyDVxWR0vR8nzw==
X-Received: by 2002:a17:907:2d22:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8edf34115emr746950966b.50.1770662814147; Mon, 09 Feb 2026
 10:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20260209090516.14369-1-l.scorcia@gmail.com> <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
In-Reply-To: <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Feb 2026 19:46:42 +0100
X-Gm-Features: AZwV_QheTmAVmlDGudBbkamp8UbdQU6-uwWFc-1fInCP0BGz1DgvN8YwMPCQ4dI
Message-ID: <CAORyz2J=zEMgNS6n6ouVZ3QA1moYfP053Jr5vhcscR9nDmKOfA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_104656_449725_03466764 
X-CRM114-Status: GOOD (  25.96  )
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

Il giorno lun 9 feb 2026 alle ore 12:40 AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> ha scritto:
>
> Il 09/02/26 10:05, Luca Leonardo Scorcia ha scritto:
> > The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
> > which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
> > structure needs to be stored inside the driver data before invoking it.
> >
> > As drvdata is currently uninitialized it leads to a crash when
> > registering the DSI DRM encoder right after acquiring
> > the mode_config.idr_mutex, blocking all subsequent DRM operations.
> >
> > Fixes the following crash during mediatek-drm probe (tested on Xiaomi
> > Smart Clock x04g):
> >
> > Unable to handle kernel NULL pointer dereference at virtual address
> >   0000000000000040
> > [...]
> > ---[ end trace 0000000000000000 ]---
> >
> > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ... but wait, what have I just read? Xiaomi Smart Clock?! MT8167?
>
> Are you running upstream on this device?
> If so, why don't you also contribute a nice devicetree to get this device finally
> upstream?!?! :-)

That's correct! Most of the work had already been done by the
wonderful people at postmarketOS, I just had to connect the dots. Some
crucial patches (mt6392 regulator, mt8167 display nodes) were
submitted in the past but weren't merged for various reasons.

Just rebased on v6.19: https://pasteboard.co/6bXQeWlwUqmz.jpg

I am trying to get it working as much as I can, then cleanup and
submit. At the moment storage, usb networking, rtc, buttons, screen,
touch, backlight, light/presence sensors, drm and gce are all working;
still missing wifi/bt, audio and cpuidle.

> Cheers,
> Angelo
>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 4c2983852596..2358407b8a6b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >
> >       dsi->host.ops = &mtk_dsi_ops;
> >       dsi->host.dev = dev;
> > +     platform_set_drvdata(pdev, dsi);
> > +
> >       ret = mipi_dsi_host_register(&dsi->host);
> >       if (ret < 0)
> >               return dev_err_probe(dev, ret, "Failed to register DSI host\n");
> > @@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >
> >       init_waitqueue_head(&dsi->irq_wait_queue);
> >
> > -     platform_set_drvdata(pdev, dsi);
> > -
> >       dsi->bridge.of_node = dev->of_node;
> >       dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> >
>
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

