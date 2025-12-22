Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D81D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=; b=2HgHhqPAeN/O38tjxtEIKWNKpJ
	HcHbbfkNiPxCcWt59ycsuuOXOlcM6ceXj1GqOzDpOkosdWdsKsXNqwNm5F8gvVB47T/D6ToRhOlYa
	I/xmhalDi7t+suLJmPtTc5kycKjWXo7GSLixTh13gjJ25g0u5P5L1gc7adZUVVkleepAqz8AFj4Kr
	jVIhBkHNg/TrthBsQLvCzzX1hDa9A41QkNDZhLVO4Yp5bTvtyq3fWuEdkacOT21+TyGTxKhmaEQK0
	vrXnJu4dR9uj1bODzpim9RQAHrpUhHDg4VPPcKVR3/ESo7VUHtWgAsghYC63+li1a4/rD9PFyGX43
	0QUnWZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdJB-0000000DdKW-38V2;
	Mon, 22 Dec 2025 10:38:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdJ9-0000000DdJP-16lh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:38:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29f0f875bc5so55017415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766399910; x=1767004710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=Vf6W+zd9Rylp9bo/e4btQ44sFwrKsd5cloPVLmnkMdoS3595atFPn7xMGXnk7HPDbm
         pyOITX4WAGcuX1eD+3hMcK3EIW0ufqGByrJ8b6HYesWEzr0oQOfRTdoXuwL65B6yOv1H
         +oNbnGCuYUGANwkEE8/4Qmqyg+RI9IyOTsVp9kxVNeNNHaRgK7a0KsISg6h071vkDYXr
         YKIOAgqAS6B6MPBEc6qtVlh7YphTOmTq6/8HMm1RtsSj1vgm6bjVxzw/eJ+Zbbf9CJq/
         se66cypkl6RYrnPGFGWWOTM+RPvhPs3TitpNOx9dymZPdPLJHw4kyMiVojnzr3guIWih
         k9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399910; x=1767004710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=BDKLypdKyuqE+mMU2i8qEo3AUorPPUwFPNKs0SKVCL3Y9Ptz+G7I/VvPeY/TjpK+Gl
         +rgIuLHERsSwgXFPCC+p4dLrV5v3t9+PmDsRFKSxRK1CixBLoCJ7xfN5OuIi1Qdngt7Z
         vLNRHs19fopQGnkazhm0Bv2plZHn8vWiHv6CgBzliVAK7EF9rw4SJ2zI1f7OjrlOvfg8
         S6TygjOW0XNH/UCXTeYKO/WQTRsQVzq2PfkhVxBzs3tkgDYQTg5uxqMUwTR09kSlNJ0n
         4hrhclu/nzVcXphy5GLfHrNTs7Ufuj7yRP0pGfIBFFvcoWEusxvGcxPMwPrRdykKrzxb
         sm8w==
X-Forwarded-Encrypted: i=1; AJvYcCWukOCDB6k0c+ZoZix8i6a6J6LzdC1ZM6vuftlAEZO8dttWZaGCP1ufL1zlXRA8cM4w2CMip+RKm1NMwX2Ugcsc@lists.infradead.org
X-Gm-Message-State: AOJu0YxXe37p+nVwaM8VqRRLqhyBHD8ESaS6WxMY+2KbZVsZZk+j6Lxi
	sD+PaHOW+yDcQCj4RHpgF4sGJxb0gHIYtyCFjBs9rYekea3YEczz9dtnl8lByOxYaKwzb+JUT0y
	3kaWJLjpW/GbktpAOt0lFnYn+HH2dEYQ=
X-Gm-Gg: AY/fxX7LmcUsB4MyumUyAcDimWAnpHstx1GOqSSWe6atm9XgvvulVMvkoblNaCDJ+9B
	FrU9/Mg/3HQGmM1RVGv0ukM2D/AmN54+o68YyvLbuuYCvE19TcOFj9NvlSDSFiztMVsT16v2FqT
	Kl2nNcWrXN0/FevKU4Oah4srBw1fG+PcNunurRGsaM1r2gKhJV89rvaqvMWnt2c3Wt74EoXkDlu
	HLHEOqXY3HCh0G44tlSoV9jtTBlNU8iv9ovDKcMOIfFSCVHbWeCbXnTme6SdfwtAiDa4wd9QExz
	4/D+eII6B4xssAlikccTDHUlKPuI
X-Google-Smtp-Source: AGHT+IEO/ZgFQp5AyfAAtwrHxXoiHa/X/03D0WDYxc4kBLqyULymzY/eR1r0RM8KzOikMvm9YYXtJ3AkgKqBI277jTk=
X-Received: by 2002:a17:902:f552:b0:297:c71d:851c with SMTP id
 d9443c01a7336-2a2f2736bc0mr91265875ad.36.1766399910127; Mon, 22 Dec 2025
 02:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
 <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com> <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
In-Reply-To: <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 22 Dec 2025 11:38:19 +0100
X-Gm-Features: AQt7F2oefOvD1VauOsJ6RYNy_cI4jR0Cqg9gQFauSbHiZ7j1ecdJHG9Us9r2rRA
Message-ID: <CAFBinCBX+DA71OA79SqrE20Nd=QUrU86SmYGXu0dAYG-R5nZ4Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_023831_306395_BA20666B 
X-CRM114-Status: GOOD (  17.64  )
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

Hi Luca,

On Mon, Dec 22, 2025 at 8:31=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Martin,
>
> On Sun Dec 21, 2025 at 10:51 PM CET, Martin Blumenstingl wrote:
> > On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> >>
> >> This driver obtains a bridge pointer from of_drm_find_bridge() in the =
probe
> >> function and stores it until driver removal. of_drm_find_bridge() is
> >> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> >> refcounted and use bridge->next_bridge to put the reference on
> >> deallocation.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
> > where I still have HDMI output, so:
> > Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thank you for the quick testing!
Thank you for doing the hard work ;-)

> I think I can append '# meson-gxl-s905x-libretech-cc' to your 'Tested-by:=
'
> line when I'll apply the patch, to make it more informative.
Sure, please go ahead with that!


Best regards,
Martin

