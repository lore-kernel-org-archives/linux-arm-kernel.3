Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FD4CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0EPRZe8YJObgeqfHix/soVRNAxr+rVxG0fDuUG583s=; b=fGbmLqVQLJ4H2EVpdDYvSwaxRl
	ISmNQ4V4oziFB4Ct+WlJ3FJpMWsUECKYzy3Cs2r++HXuOrRmKgD2xjrOcd9dBLMT/rxPBfPH04qjl
	GM2a5CQTh4yG6QXDhSBQDHJpGdnRjX9hmiiFlUR/uXVU/NpEUDKbkIRBrFUL5JY4IuJfsvXd9azWF
	3dTlbuXDuadpr3nNgkBZdVT1s3hAnS+aq2cMu2U3f2+NO0+TB4gz6T1DmUIxLvhjSCyq0KOpBJk49
	5Ezer9Q/FxdrfSIhv41ZJhNW1W160rZiiKH32xTAZsh+5VE+BBrVOFquQLLKTUeY/HMfk/cRpK7R8
	L1EhLO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utm3n-00000006Hyb-0Os0;
	Wed, 03 Sep 2025 11:53:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkvY-000000067eY-2Pgv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:41:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-248d5074ff7so5925015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756896079; x=1757500879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0EPRZe8YJObgeqfHix/soVRNAxr+rVxG0fDuUG583s=;
        b=C4ed6ZLlQGIyCqBy60YO+vQbcUGqgmncp4bTYEUSzo5UtDya8b2n112HT6B7E2mkp2
         STsPdGC7BVZMYnDUKB+d9M3RCOr2piyfCeTGnh5d5/4IznwoAPCkl284WDSGpR+AMaeH
         pdne0aqZImvE2loRxyVsn8WE52ng92y3n1EIh+Y3yaQf4VXg5IxOueFy8JEQHSq3elqy
         gRsUIu68pjozGm44EJsJTs2hIZFBorTnHOKskrSVNKeLFiZRpDBhSf6sCoOssm0Foo2u
         BhnC8P2WbqRlkzhjJsDUY0uzx5GgM0ZuF5dhjfzSmYDcsX64yMZ5UqYYOt9dwgn6Wspo
         Qw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896079; x=1757500879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0EPRZe8YJObgeqfHix/soVRNAxr+rVxG0fDuUG583s=;
        b=FxV94RM+eRMYISPISY4qHdBdM9Z+Z2wCi76rOIHdbzIPOVxYa/fhYTZqWMI0GUat4d
         jtAyFh3Lnk1joX/05qw+akXWnL3gWFdPlaH4cBZrSzCUSC39scZzqmhI6UwAaXfF5QQO
         B9puutLao6m4DQQ/niIY3UPejjVwUymKFrRl0GVC7zusRZY62R3PDk5qKQ0G5D63+hDw
         1F+K15KvYACs+L2lSZsG3nma9tP78s7po5QvuoXt7PQ3z7xEqN3nm3ENbrl7+dZ1mT+j
         Q8zKNWduD3eqz3jryPfSYe2AZJskEhwLcrIjvBXmgA0LU4etDDroPoN2G6AHBRcr8dph
         5TyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxDOamfAxpW03q2ITXlhxZkhzUJ6VjAMzCarVtzVx35im060c/3pUrtNfwmtyfMfCH2ofulXdqQWNvka+iGsQD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6TIHylLUfT/PErrO/58ll2AjhPZUiJhOXCKHU9drZpWAzd+CD
	wwJVJ7sPcTngl79eZrueKwENVURY3z3blgJKADtq8RafvvzxbsYy0Mk/NrcuAJOt+vaxizG7Bll
	xDIc5CZ4u9L7XvI0ApYBeCfEAG9rGUqSjWw==
X-Gm-Gg: ASbGncuaBTsTWcElOMam7Z2QFY8/kicQKY48KJcd9UEAYuG8LAZjt0v18tC0ypQw75X
	MsCJeeGyG6PwXMP8ekbR+OG/G6T9xrFnBQ8mYmYuXxSWYNxKbMI7DJNGDyUtFQ+Ja5ZdddD7M0K
	Xzu3BNR3mnnD6lZSowbgMBaemWFiS3c0dl9s8aFZKEaFAUjbVAcAtdQrE2+OmNJa6gun9J7cRfp
	eusj9Y=
X-Google-Smtp-Source: AGHT+IFBlgHU9/9J/ynH5B/Y0lYKvN7CIRjLzFRFLjCUSdV7/phYhX05by3bq36srAY3SNogU76UhQZ1T1/Qk7whF0E=
X-Received: by 2002:a17:902:e891:b0:246:2da9:73a2 with SMTP id
 d9443c01a7336-2493eff73d7mr197893025ad.27.1756896079484; Wed, 03 Sep 2025
 03:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
In-Reply-To: <20250901185208.394cd162@booty>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 3 Sep 2025 18:41:05 +0800
X-Gm-Features: Ac12FXx8o6RDyP5im-Wa5RK1y5nzjHR2o5AyrKxsM3tEIkvqqNNrZcDYhIoBDY8
Message-ID: <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958()
 for iec958 format
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, l.stach@pengutronix.de, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_034120_613966_36B04650 
X-CRM114-Status: GOOD (  16.13  )
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

On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Shengjiu,
>
> On Thu, 21 Aug 2025 15:31:28 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio dev=
ice
> > driver needs IEC958 information to configure this specific setting.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Acked-by: Liu Ying <victor.liu@nxp.com>
>
> [...]
>
> > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec9=
58)
> > +{
> > +     mutex_lock(&hdmi->audio_mutex);
> > +     hdmi->sample_iec958 =3D iec958;
> > +     mutex_unlock(&hdmi->audio_mutex);
> > +}
>
> Apologies for jumping in the discussion as late as in v5, but I noticed
> this patch and I was wondering whether this mutex_lock/unlock() is
> really needed, as you're copying an int.

Thanks for your comments.

Seems it is not necessary to add mutex here. I just follow the code as
other similar functions.  I will send a new version to update it.

Best regards
Shengjiu Wang

Shengjiu Wang
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

