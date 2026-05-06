Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A507FFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAGZRzNWoj71eYuAlCwOROEzF/QQfxUQn3hZ1d0klWU=; b=fkZpb6SAO6DvRg0P5xb0Ff3ZiJ
	2gUVbM/R4ma4Hy/stxsG6K5KSf5X2hckGeAuO9M/6Q3MahIuQv9lcNuk/7aW/eqkIdpVkpcdo5AWf
	9IypK8sH70daEh03dwn33qqCoSiHHxtvKYojUFmKiMvvkLyyKZ+bI7jW8xFQCmKRZz7TabCL0NBnw
	1HLFnzye5FeifLdQUZMxVlOa07eFvv4peJYQaD7HO7wT54wxGlsK0uJwJX2wYQgKQw+1cMpvFLoSd
	7NsqS+o5swhP6tvIMHJkM+GEcqYfmqCH7BeTyRuVYzhPJSj9Yrrl2wQ483p1YdTkWaIQRfl91e6LH
	V1oF/8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKclY-00000000yvi-1Xws;
	Wed, 06 May 2026 13:58:20 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKclW-00000000yvF-3dZw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:58:18 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6587cee8b57so7333847d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778075898; cv=none;
        d=google.com; s=arc-20240605;
        b=TtdrW2YJClFgRD81EzVUuX96nYttB0sNQBroe2mxfa1ykDdGrdJD2nv2ib5AoeLia3
         tRbPqIyztBY9Xtm9oxDh5PwP9M0Xksw2t31oj8duMDmCNh50fCTFhV4/sWFhl+Nvjdvz
         XU3qamTqWn5o3QA9Tdyihm9IO1Ps6ukh30/gWeVXDWUkhM0sax2Klm/oQjfvSHEW0r+B
         cHYyH8e26+e/BhoqC3ToNMh2GRwIC4K39Y+SpzFuiZBZhrzSc+Yetfo3C7E3KDmyUjcY
         +6usJUdC3qjr24Z+9oQ1xdrKZ1ldX04UXDCyH0PkcTsMx3ly3HEvGDUB5hidbr3DQ+Pd
         BEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yAGZRzNWoj71eYuAlCwOROEzF/QQfxUQn3hZ1d0klWU=;
        fh=IgjLtoSxZKBdBg+SN9WI9Q3D9H/aXXx01/mbdHZQoQ8=;
        b=Tz9k2bTzDHNwgUGKdWvNjUvb6dOrJ4hcxE/Nc2bkSe22VLpm/kX65EePuuNLGDsSgP
         WeRAvMK2LZ0eBJk50vb39wodiPIDEiw28zSXM22jZcDUeE7YxEt7yiQsFNEisV3yR28d
         S/6A6V4/iLq9S0/4sWcb6AivKOJn+VhF8Sp3w026SwrAHRXdt5EbC3CXMj6retITkwot
         C60xwLqUDiHta+eHchOw0drvdASBvjaQz16sKETYy0vDWyW9OdxMreohSyX8xjrd5sq5
         DYcQOpFBeLo4nntUKt8GmlWix5lUXADDGF6JykDD4zWYwhnCgQBL2dyx4pF666FflVH9
         aiug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778075898; x=1778680698; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yAGZRzNWoj71eYuAlCwOROEzF/QQfxUQn3hZ1d0klWU=;
        b=qpi/GvAk2KhRy4WgRcW4WCSun1DL166A7fc9mhiPB0nMyAhpIHb/ptZ1nlR2Au7CYT
         1yGd8jTChwCQ72Btl0njugjVBNSZk3x/JS9MQ89oAOQBqxnUygn/eB/DZx3lkW+3VEGS
         gGCulOB0n5MnCro6dslAOoJT19xu1Uk0HSCD5M87PjGxcEDWzfzeF+5BRsGz05dKm9OV
         3GivrS656QEDNY+9oPbXerVi/iQ5OPoHp2aRxFyVnnASDPEe8jpILAfXlLjqsgTt9JSq
         JEQ1RJOs2hw6HyneKOMM2PWPNhZUk573c7/2iSaWdshgSvlotgEeGOCEdg75w7/Rw0uM
         B9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075898; x=1778680698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAGZRzNWoj71eYuAlCwOROEzF/QQfxUQn3hZ1d0klWU=;
        b=b6PG3gNkiy2wfnAinWbW4QM3NhN2ufcGu09H4dxDm/zOlE476qkIx+A5vGMwrk0ru6
         C5RzXAcb4olaU6vgNFDgloZnT4X9vzxT+zx03aSufg1DB2EiC1zVf8htPSow4rC6wiIm
         FbzQvOYSzSbzZDntpfP73BoP/6G94tSptWUrR66V0jxpnPgZ0bFn92eC1Xxr92ivp6Wl
         jbb0Lbk5j/tx0Rn+ShTShkwBw/jKCveO7z0V5vt9s3geGCpqHs0g5dVRo0R4h2eVNf3A
         HHmS038nEmeeJ0+D1njeqaYEt1UUyPuC1kF1DVlZDCpIF/JoPm9bH4odOdM61k3CWWZD
         0swg==
X-Forwarded-Encrypted: i=1; AFNElJ8MJ3qyA2QGo8+0PMD5Sb2+8zGCWwP2nIw3dNXLkM4k2GuwP3nU4iJimU6nDrzFJMJwAGs/LBqwtd/eCtFhYjwx@lists.infradead.org
X-Gm-Message-State: AOJu0YyDa3Pi1Xc/hw6efk0Z7buKOyOMF7hGB19MYYggeTRalQ6Z9JlX
	pWDF5uU3IYGYuQsY3UFN9ai8cG/i/C4NpK1Xfug88DTHfQJHbuIXXGPlO0wg29oZ5+TZ7a+v3ZD
	DV9vxpQswrhIngO2xcuTuT/tLDNOkStE=
X-Gm-Gg: AeBDiesL8rjy9RJoFWCVGxAiO5MgwvUjXTeNfflX8b8SLFdmeZNpRcfz0ZtqUpQLeKS
	dIOhG5lFuArZWUt02x7O41c4WVdkCyoO+PHd7DuH1NhxOmxk7ZYKBrJvoyamEeixkqdemRkQrBG
	NFe5GmuFMcfy8TfHWkW90qM51rTw6fvy2l7yeFoHTDX5+i+qWifeakjkZdQvPjoIps1jBY/65bK
	/1e5FfjZdvrFtb42blopvik52fHZGm3NaDkvatkij/OavzR2IBbHxc7PsAnpUA4APLBHheoLwBW
	zFUho+ZnPXt1NbNd8seebgVrkujjvA==
X-Received: by 2002:a05:690e:1688:b0:651:be8b:e87e with SMTP id
 956f58d0204a3-65c799989cemr4075950d50.34.1778075897748; Wed, 06 May 2026
 06:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260506092324.635014-1-lgs201920130244@gmail.com> <afsO9TxVuz79FFQ0@raspi>
In-Reply-To: <afsO9TxVuz79FFQ0@raspi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 6 May 2026 21:58:07 +0800
X-Gm-Features: AVHnY4IW3B6qWimauAAC6R2YoxAVTsxlXp2RYpmYRhFA5w6dajkgOR-Qizc8_E8
Message-ID: <CANUHTR8PNO-3hfEMCz4Zz_2ERLonE7OyNzPWtAaDtVpNB=YGhw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_065818_910320_63C723F1 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Liu,

Thanks for the clarification.

On Wed, 6 May 2026 at 17:49, Liu Ying <victor.liu@nxp.com> wrote:
>

>
> By "minimal" in v4 comment, I meant not to use __free(device_node)
> in imx8qxp_pxl2dpi_get_available_ep_from_port() and
> imx8qxp_pxl2dpi_set_pixel_link_sel() - please keep using
> __free(device_node) in imx8qxp_pxl2dpi_find_next_bridge().
>
>
> >   - Keep imx8qxp_pxl2dpi_get_available_ep_from_port() unchanged.
>
> No, please fix imx8qxp_pxl2dpi_get_available_ep_from_port() to make it
> return int.
>
> >   - Do not change imx8qxp_pxl2dpi_set_pixel_link_sel().
>
> No, you need to change it.
>
> --
> Regards,
> Liu Ying

I misunderstood your previous comment. I will update the patch to keep
using __free(device_node) in imx8qxp_pxl2dpi_find_next_bridge(),
change imx8qxp_pxl2dpi_get_available_ep_from_port() to return int and
pass the endpoint through an output argument, but avoid adding cleanup
action usage in imx8qxp_pxl2dpi_get_available_ep_from_port() and
imx8qxp_pxl2dpi_set_pixel_link_sel().

I will also drop the unnecessary local NULL initialization for ep,
since the helper initializes the output argument to NULL.

I will send a v6.

Best regards,
Guangshuo

