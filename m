Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7871106705A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=; b=sJBpyL8vL7ZMTSDXXZUGI0afwN
	ooFRUjXJOIYn4JYMPnuDkYae+wxts5zO+P0B9eBs0o3ibP+8dSeTuO1qXnNJL+7u/85dJZUObKweh
	giwWECPvWZJ/fev+IS0OfvLKq7EV1EWegg45tbAO2KJHgKQG988lZBEcJ9uB/+BWG/yb+Ig/Zw+U+
	1DFexzcdJD+2gxGDxJujzd3+/twM/5ZkyXJ4aOEZqULd+gElEDGbMEQi8rAzGnzPYFjiW9sZubMCk
	LWctWyY3qF4mjlTRfbj8fsKTUIOylgAnxQGzez5nD9QEhzjQZBvwwMA2fX7Y/WC3Wh/tWUEd9M1BC
	Rgh7844g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iBv-0000000EQAU-1FbW;
	Thu, 12 Mar 2026 15:43:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iBs-0000000EQ9B-2hDf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:43:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so546879f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773330190; x=1773934990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=;
        b=WqATUtLVQJHGjmOpUMxoX5ejEvKHmrDYe0rUY9zeWNIl1Nwl1fmB3BN8XX+Q5R2RDx
         4Kl1kG3lbFVa+tAio/sMTKbtsujfOeTL0nF7R9GtGUtOMpc/L2JUM1xfBkGPHtcXyw8q
         Oc5/qC+Hv+sSnZQdMiKUGsNWXm5geMdpXcZpTDNjufqxE/cOQReqVVHkDyJNq2aFWYF4
         pCBO2rhvGm0DFW/6C2szsikff2PG+0xTIB6zOTALr3VnVDwYU3qZ/bs/sVyBzsSGKjBt
         FtyCN3gvQjbtpYkyp5DD7tK3wF0TtVBMn/vfFRw+zB61SPcGnkKquZbAUDSlYLj8wSB8
         gAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330190; x=1773934990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0FWnXZcfmBjSJmvownu5+w9xLPXUji+K3un2IYyipc=;
        b=DiOn5wdNJBgxVhbKlc8L0recCVtJE18zbyE3l9OxWd+4l3MTJZNzJlUAza6UYajZ6v
         PbPNAY3KRAcSnZ90r+UUbE6hTabZCt82/mWklU1R8XkKynCrkavQ/x8Zd5V1m7aD2isT
         bZQcSX0ERALr8r6j/QIdZCLsLeSrRuS5F0g3pekJN76d9VjCuXaTqaOTiUHxGpNLGpZ1
         l7oJAByLLpOtT7v6TpvE6v3b+b+J2/SNLvGs8VrrCbRNnzXK/Nk975jjo6GaMSWLbFVe
         hcnkzmLUZ9E6iH1oU/6T7E6HUKy5H6e8aHnveU8tuTZzAmrlwAgUZaFuqhsD4sSP2HNw
         SUQw==
X-Forwarded-Encrypted: i=1; AJvYcCVgcULC6/aSpxO+PZwHb9lQea7V0g2FrCTNqxrwvJQRO8BapLkiImpak8kVgFgMoDsVqnS4GNu4jWafQ3BaGE3q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2IiYIYsWi5e3V3DZzWbJUFnLqpZMfFqmk2f7jC7wIaS5fd2cu
	ukc1bM4c21OFsN8EPttB718+5kQF6XUZjZ+eIYU4yaXvTeTJMnhBVpsC
X-Gm-Gg: ATEYQzx9NtBFwS3IFIE6nZFUx+1ZQfirmZcX0Fmn4toXQywQ9ggyrAY92xm+ehOT7yq
	YdlLGOV3KS2ZhvYFkPE6EQAfIj8kZIVs57LZs/+ADLcmmcE+fDqFYJ4eZsjPOD7C1qNPlLKwGPD
	DocCG44bAeH1mPG+uD/nkCWrUwr1DWzlyHXjPnIhdCXwyLZdzFseb9A1EQosyIMR1o7xFNvRQYL
	GaYdrxwH4DsSS9zxI7J4Fmnr5hNcjvMb3f3Ey3kM+Y2a4SDFxhIlT0daLGrqjL1kmeFi1IxWjys
	qZ3EB2GHVmOMjc0u8d4e+vxZz/DHGw8MhvcHKwDBf8LL1NKohLkE5S/fIk8g3ePffWHwHjOCWOh
	nTietZ6CKXhJssYa6rj5j/gl/bCcjF44sGFGVFf76GYFVj/RgB4wfjf+BngUVytJTTCH4dfd+u0
	Yl1/dHxCx3sOUh34CMNYNcL7jjeuiBGUYnYqm9tbBJFzapr5RuH8eNGqVkPXXDERzEj3Xi5ILXp
	/alqg==
X-Received: by 2002:a5d:5e01:0:b0:439:be67:a034 with SMTP id ffacd0b85a97d-43a04dc0c3fmr244402f8f.47.1773330189741;
        Thu, 12 Mar 2026 08:43:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm2132231f8f.36.2026.03.12.08.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:43:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-sunxi@lists.linux.dev,
 Paul Kocialkowski <paulk@sys-base.io>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Thu, 12 Mar 2026 16:43:07 +0100
Message-ID: <2820906.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260311094929.3393338-5-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
 <20260311094929.3393338-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_084312_699495_FD188C46 
X-CRM114-Status: GOOD (  15.46  )
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

Dne sreda, 11. marec 2026 ob 10:49:28 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> The sun4i DRM driver deals with DMA constraints in a peculiar way.
> Instead of using the actual DMA device in various helpers, it justs
> reconfigures the DMA constraints of the virtual display device using
> the DMA device's device tree node by calling of_dma_configure().
>=20
> Turns out of_dma_configure() should only be called from bus code.
> Lately this also triggers a big warning through of_iommu_configure()
> and ultimately __iommu_probe_device():
>=20
>     late IOMMU probe at driver bind, something fishy here!
>=20
> Now that the GEM DMA helpers have proper support for allocating
> and mapping buffers with a dedicated DMA device, switch over to
> it as the proper solution.
>=20
> The mixer change was tested on a Pine H64 model B. The backend change
> was only compile tested. Though I don't expect any issues, help testing
> on an older device would be appreciated.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks for fixing this!

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



