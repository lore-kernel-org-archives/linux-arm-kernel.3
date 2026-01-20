Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE4ED2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIKhuYFw63DINEPQxv2wgmdGn5ZNASi1pTjZrRr4yhE=; b=IjzkuYa2jXtGu6+BQInB3sCmcK
	KHf+znxtO7rxjcIEvh9Ymp+Mu3NJXb0K34NwgA8L5lISxSCMwmISsHNSRPrLH1HqHkm0SwM6NdDEi
	ovjAHDhYft72jczx4yB6DB47ctyEkc9loffwcm1kQcMKqNu0plJazJI4cZDAgFq2Q6M/lG5ebt1cv
	6XMyhDn33WJ0kBIiaQtpSHJb5ND00njdJUWaaPtxteWaZV1iTlPNBc7BMcLg7x7d4w4YiXY0/j7PS
	f+szbCV4rG/6Yn3V+av+h2NQlnIEfcW/JZsbXeSUVuBt/rSnMcha+MRIUJ5lWY2lTfi1VG7C89aOk
	z85mIqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBHA-00000003sIP-18Jq;
	Tue, 20 Jan 2026 12:56:04 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBH7-00000003sI4-2Z9k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:56:02 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-88888c41a13so73462696d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768913760; cv=none;
        d=google.com; s=arc-20240605;
        b=jelC/fdh1uzO3TOc/BSo+o7lQUwYbV9wM0pyZqT6XmbKsO2oKX2d84O30/PikAVRfp
         EfExCFEWjiqTH5gNwVa+9co2xtDzc/e2fbjYSi4F8KMlxGoVKIBlEMGb5+T5xNpPTp27
         jvYdqpzz6GpuBXu/4K7Jobb4SugjH+emafYZ1NM1pDEaj4MPot2mqeszjyASBYGMbHSo
         7Uf6cing8UgycSNhWjyVMSusS4esxyYI0fDiHu0mdQu+j207XYYl/8jcukFhRrPWWOB4
         WJp7884Olzg+i8nUXa6+Yok6lIhdm/MkwWNotqAO//7GGCkRW4aR22pwK6PnSAnXPoOC
         WITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xIKhuYFw63DINEPQxv2wgmdGn5ZNASi1pTjZrRr4yhE=;
        fh=GWRnLEa+wJ9gk1aX3H542aPJ5E4EgBLW2wkwUtt5byg=;
        b=E3xEtXOWyHLnQ2+OLsXrSqHcrqN8RXebkby0FtLJes7QzZSI5fAg7gMcRSDngegVPI
         HqopJRbhx4tLBbcf7cDkXgIHJ2F5eoC1/rs7VrUjTWoJ/t+CSnl+fTOkVC5814/cqeW9
         MU/10P+rRLI7Nwmh0eg2xjSWsitVFasvPsuQOL0YAIjUw+My2rZ7yddCxRRBwzsMetdj
         SdR8K+vksPspwa7KEzKhcYkt4qBDQe1S+80753N8eGfsWRPnGTaZ8uJfXmFalaQpnPz4
         Hi5slMoBUvynm6akt3zsiVdMqIRlaRRRIDU2hmuomyd5Ht1spuqrZju8sgYjZsDQGgD+
         zbmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1768913760; x=1769518560; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xIKhuYFw63DINEPQxv2wgmdGn5ZNASi1pTjZrRr4yhE=;
        b=iamVg6K1i65SGOv9PDVvmPWd2+v1pGFLsd1uzkqKOkxwZVfUdLBgN6a1wwGzFqzMDx
         YUcUM0Xsg82U/hW5w7/9+N8Uf2bGYhc4ObHJ9K764P28MZgWGCJJtGzZ6abUOorkgNSF
         ORrNNAaMumJSRVVH/uq3hgPwRoPG7mtxheLtAwMAeVBmlJB1Cn7I8bDKxkOk5i1Zw0mh
         SsGZaxbSW6mYnfZOYinc1an4hzR8G9lfGE2gLrDYrVKgfFlTayN6Pkdpbieao0plmuhX
         1LfiqKdQf9OeHfHqQm6k5AGV1FFFkWauOb+lko0t0NX4lYQPXqTR1z3MQlKOls6BrLYK
         q+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913760; x=1769518560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIKhuYFw63DINEPQxv2wgmdGn5ZNASi1pTjZrRr4yhE=;
        b=uTPpnPtb7dBKsqWIGABBed1tVTWK9+PfOo8NgtQqnuCzGhf7bvzTlq6+DUsHSknSfl
         P0j15hbUZQW/jtmSPYHOAl2FnhN7v2I6Rzev+PZ5dpDCOOAdY85QWICBUCKRQxD7Sf1B
         rZeEfqZ05eeFP2WAZxsim8G2IfDuC5kuso7EiOeJFszBjzlv+aNb66z72bL7Qj1sQL+K
         U8vGG4FiutcWrTjOTfNXyb6mbEXUpSDiP/vEdhuQEA+clLYBfELRu05l0/hiHTQ0I+rQ
         EWd4yCR6/m8wpTnx0TdAZqUN8mqAB7PLFIKrpppdesKaQZyJ7Ot9L1F4k2nTcdis95pR
         DJCA==
X-Forwarded-Encrypted: i=1; AJvYcCV2v55BLESEjLLhFCbBnMif6xnuTu3LY/INAd1GYe9BR1alG6rHv6DneHc/mrJL83tRrXXIOAcNcYO89yM13w32@lists.infradead.org
X-Gm-Message-State: AOJu0YwRd+jxwbZN7v7Qnbr0fvjH5jSiwz4B2D7G6njEEMwNZNQH5gqd
	1rqKpXzf/zEamcvh8PCiXI6SdO/I6Gjho5N+R5iYaRZVNm11uC81qr0vvO7oNB5E/erpNDDXoWW
	Vqp58ym3QtbJsh1zyyo0WGroIC2jSuVTzKSE9zGEBVw==
X-Gm-Gg: AZuq6aLDI/2ynT0DraAL8miZdiHnYkTHKwuP0v7k9v6s+2lVZGAvAWwoJvFSUemo2z/
	bgXvcUOLlLkb0YDWmHTN8riZ1n1s1vDmFp7VIHbSfvnWMtKo0u15s0RMgUDtrN0ubKi6jl3E0zL
	wnmvAso5XD2ZZH8YWd9dLUcsLS9rLX5jCXnS3oUb++i/KsbbIjmqLj1dzNtNVjREHOGODtKNwjL
	ty6ukaKzGQxjxM7dPwNkqw3eTw6lLllGHeSyY1dutl9Dl71qoceo4sGYGM+E0FCb2eKeFG3eLhR
	rJM=
X-Received: by 2002:a05:6214:19c5:b0:894:6dc8:924d with SMTP id
 6a1803df08f44-8946dc893a8mr4189616d6.24.1768913760251; Tue, 20 Jan 2026
 04:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com> <20260120-cpitchen-mainline_gfx2d-v6-2-1a16cd1d70b8@microchip.com>
In-Reply-To: <20260120-cpitchen-mainline_gfx2d-v6-2-1a16cd1d70b8@microchip.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 12:55:47 +0000
X-Gm-Features: AZwV_QhsNtOa999KaX-_EQFOd0iUAVt0uZ4iVZSigcVCX1SaDa3SaynZsl9mIpQ
Message-ID: <CAPj87rPwJ_FHpzn-4wQ_3kG=iJfLbnF=KpCrOA8a59WrSW9c2Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/microchip: add a driver for the Microchip
 GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_045601_679442_185A64C5 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Cyrille,

On Tue, 20 Jan 2026 at 12:06, Cyrille Pitchen
<cyrille.pitchen@microchip.com> wrote:
> +static int mchp_gfx2d_ioctl_alloc_buffer(struct drm_device *dev, void *data,
> +                                        struct drm_file *file_priv)
> +{
> +       struct drm_mchp_gfx2d_alloc_buffer *args = data;
> +       struct mchp_gfx2d_gem_object *gfx2d_obj;
> +       enum dma_data_direction dir;
> +       struct drm_gem_object *obj;
> +       int ret;
> +
> +       ret = to_dma_data_direction(args->direction, &dir);
> +       if (ret)
> +               return ret;
> +
> +       if (!valid_pixel_format(args->format))
> +               return -EINVAL;
> +
> +       gfx2d_obj = mchp_gfx2d_gem_create_with_handle(file_priv, dev,
> +                                                     args->size, dir,
> +                                                     &args->handle);
> +       if (IS_ERR(gfx2d_obj))
> +               return PTR_ERR(gfx2d_obj);
> +
> +       gfx2d_obj->width = args->width;
> +       gfx2d_obj->height = args->height;
> +       gfx2d_obj->stride = args->stride;

You need to validate height*stride vs. the size here. Same on the import path.

Cheers,
Daniel

