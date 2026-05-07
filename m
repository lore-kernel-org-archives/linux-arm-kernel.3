Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737D7CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=; b=HrfWvOUFeHMrgbh7+1WPlKlg/G
	5DAFbfpuckMnzfLw8DWnoZzvYUUsaRc+GT6zcfJ6fAKFdH18nWoOS5sUytojhhlKoQXwl2djoy3nZ
	wby0bo0aX6EDQd+OQLrvuNMkvdoCx155k5QBws4bM7taWejHfyXHf+XtrIiEQcOqYtyEtbX1fhNn+
	Sy9yYTeJH9GoJjn24XMGf7YNwUNpOiTnDBQgwjjyLah4IeeG7umqGQsSZtz1IKe4x0UQi7i2HATh/
	KMDAh4X0TYMWUS+deoxY4QaQUONSoDTlQsn299WenmDKOTDXeVNDpYL4X3X3iOuuhNzhqKYKT7zkQ
	MAo4mPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvEI-00000003NXe-0uJi;
	Thu, 07 May 2026 09:41:14 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvEG-00000003NWr-0RXo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:41:13 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-651d692e833so589806d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778146870; cv=none;
        d=google.com; s=arc-20240605;
        b=QuruQH+lVbZF2+PzgDTcgdgMKb5/PyNyyMo/wsZNEKjn1YIyMpmmvi2zoNE9bcP9XY
         IGWx0/jDgbNDDiNgqf3GL04XEO0pzQVK7aRn/JrepS3Jf9y61W5ufSjA9Sl1DP/9exUL
         EktTpShXvsgZi+TLHuTbgck1rcMcTI8zEyWA9tz5UCswPeu73ZthgQ2uLqVeUuyE7Yad
         HP29wmvgpeyr4Y3k9vWrB2Mg0UkXWsVotjWs4YT3N+rSIMVh7XRMFdqIWDNjPOn12yi9
         lo3/12xnaIml+0gQR/Nr/7sgDJ0q3iItylEQ5kiMZ6tQ//Zq6PnwOy1rB3nfSn/A7EH5
         48hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=;
        fh=LgcMSQwQxcRNCKhzAhDYK4yfH6oVejdaYz1LX+JYUYQ=;
        b=I+dr//9ZLRqSoK55pW7vulYBuQfbfM0GrhisHvoElw9XZZLgxz3hWL5v4/yYANQJ6w
         EYp6HSUtmK6wwX46yjwVhKMZ3SH1FVg+WpV5b9EHVSjKQIHbi8QU1U9Topwc6Xg0K8Wr
         KvgPjADzhstYBAXWR7vxyhWksXciqvAN/nwOYZUmcY2OjyJL97aP22VPkVfGBZsKDx+B
         OHKf7SqiFToqKUQ+A79J24RHBgRNV0aBElqYxiKD7ByYLIxzbzYhiWzZF1zyFTbZDWWM
         6WCV9EnkzsGnDS95zTHf0cFf8Il4PqGs5bM8p7qZ7CGeirXt9bAYRCaNsALfjz1iTDDS
         wo1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146870; x=1778751670; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=;
        b=Y4YZIYuC/mh7b66V8y+8q6RQakIY/fZbtvP9d2BsFPLMnI8CAHnbrrfFjte63Dh2UR
         /gxzaKX7+qJ9tHM3xIykdmZUsSIb+ZrhJkPkNScdZfCfy5mvMVpX2pxsIOWOGwHgGi/F
         nttw+AA9KZp4JX78K6g3E0877z/Z2ZrIYqmn7SoD6ryVJdGdtTAKDAJ/pPL1Hs6W88vu
         IiLhLTEt3FkyZfef342vZznpC/gOtKJnZxQcMPQWYM7Qd9JP/7c3Ss3i0URz6Ws5XHmM
         BcCohiVuc8LDz+MWlNNGLWZOk1/rlMPHvENZQsANVpHq0QTcEFpq+b/fyw5J5VMFgaUR
         3Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146870; x=1778751670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=;
        b=OwkI9Fdjy6CId5WVvP96ohjnx5cuG3Ahb1NOCQHDHtAfC8jeCgPsl7d4ej5pW+702p
         nwI8NjDnze5gdI9NagoXhPwAdFEBtTao6rqOXZhULJZQCRQLp+mSKwUOks0/FYDtfKoQ
         X2PJmaHKblRB+kxZ2sEJH7XY6zZ4BuzTvwqNNt2G4JHtGxh2+4VTrSBierENkfs+88dG
         +n2pLBfYM4//WuZbm/nnk4oDwDcBANMr2M4IcPSWl6sVC1Zk7oKREjUjjVQhHArUL+r8
         8S1Vfz9Hjjcbdq8x+0uUMeb8urd5uisuFroAS+zTW4JWvsbf70DFD+iGqkXIUiNkArlJ
         JVvg==
X-Forwarded-Encrypted: i=1; AFNElJ/sB98txsK6zJavCnxXE+9UrAkNSDok1FirF/ZCfcDnxBFg68rZAKHgVgBA0vmyjMDmZtGzjdv91ZeQsoEAVli6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72aUd3He/zH18hVDpL/myjO1/MCR+GTvyRfzN6LjS7qk1qOhd
	mHjgdw1n8gvFSeq/EcCsmT+UYt3bPgbUhfNcEtxSDAku+hIjqkpAm6JZvckUo4Hgtp8nN7UK0E7
	vXk+mJrwRr8Y1D5hMJohRmVznspfRWSk=
X-Gm-Gg: AeBDievuGRk5vHOsD4woWsd8ItAxHTjSWV19n8qZdFK90LsjzkL3ccm6DSs6Ywk7+qQ
	U5W8Lr6GXSjUp+l+TLI/onO9Bxdh64kHC4/NqtUglx0jUCj8fiTFT+AaNS1zfiLPUUnn3xKqw/Y
	2gYrEgKiz/OjOCYoT5uxyVSIgWjwQ5BHzKblgqttEaQzCJ6swF3CKdVBGGPavhPnd5sL/gjR9Eq
	GcUgD8PV0r2nCaufSrhNnW/GPzXx4tltxjpeZ/lpMArOCEyb4NgsjzLE9frnp5sq/X/lFqPlbo9
	yG0jFReQk7mxiOyhA58=
X-Received: by 2002:a05:690e:1516:b0:65d:796d:8f00 with SMTP id
 956f58d0204a3-65d796d9d08mr2772997d50.41.1778146870374; Thu, 07 May 2026
 02:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260506142434.643523-1-lgs201920130244@gmail.com> <afv21xfKE9PxGWuD@raspi>
In-Reply-To: <afv21xfKE9PxGWuD@raspi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 7 May 2026 17:40:59 +0800
X-Gm-Features: AVHnY4KYf5mnb43sXj58-NXgedFQvaoKgE77KqA04IMyO14JzMOPYqCJb3R-yfY
Message-ID: <CANUHTR8BS9fo0a6s=+M6bfgCgcWtrpepg3ayv3F2bkDoWkYmDg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
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
X-CRM114-CacheID: sfid-20260507_024112_147465_43402B13 
X-CRM114-Status: GOOD (  16.16  )
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

Thanks for the review.

On Thu, 7 May 2026 at 10:18, Liu Ying <victor.liu@nxp.com> wrote:
>
> On Wed, May 06, 2026 at 10:24:34PM +0800, Guangshuo Li wrote:
>
> [...]
>
> > Initialize the output
> > argument to NULL so callers using cleanup variables hold either NULL or
> > a valid device_node pointer on error paths.
>
> I'd rephrase:
> Initialize the output argument to NULL so callers hold either NULL on
> error paths or a valid device_node pointer on successful path.
>
> >
> > Keep explicit of_node_put() usage in the helper and in
> > imx8qxp_pxl2dpi_set_pixel_link_sel() so the fix avoids adding more
> > cleanup action usage there.
>
> This sentence is not necessary, so I prefer to dropping it.
>
> With these fixed:
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Thanks!
>
> --
> Regards,
> Liu Ying

I will rephrase that sentence as suggested and drop the unnecessary
sentence in v7.

Best regards,
Guangshuo

