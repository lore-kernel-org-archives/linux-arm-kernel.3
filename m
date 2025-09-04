Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4728CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz0GiMYb44SvgwnTpnJ1WiT4G0dl9xf04AReEOrfC2g=; b=2EOfeFYMQ3DytBgp9nFDK8QkUS
	ksn9FDUKPV77Eue2AP26jvBEyPSKtoYltO1mwtrssru/Q6dKGlQFa6Ed4OvLAqAxTR9o+tz4rFgE/
	GutL5XgbgIhLG6ere+AcKptMS8dKZPWywdu+aI0Z6CMvK8nSyfBnAOfMO1wiGzd36X8ymCRF0gKHS
	xn+It18DHaBOKV5Fg5UTk/is6A44+VNzWVCRy3bsll111reAdhgeYdNR0ECSt1wN6ART0/qBjcw7F
	zaytoWeXtbzPfCt6KiAJTzLM6Jn/1LwbWb3VegrOYNbNTcEAQDJKro4dLW4Dsk+UlYaNPhGJ8I0zK
	fnMNBfbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6O-0000000G5OH-04xb;
	Fri, 05 Sep 2025 02:23:00 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJ2N-0000000F2K1-37mw;
	Thu, 04 Sep 2025 23:06:40 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-71d605c6501so16851167b3.3;
        Thu, 04 Sep 2025 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027198; x=1757631998; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz0GiMYb44SvgwnTpnJ1WiT4G0dl9xf04AReEOrfC2g=;
        b=SBwvcFDIACLx7OgMcorv43PJbcMh7C6OaNg4JbITH/x0R2UbfkOsADoaD8dCBH4+Vc
         S3jAN257BhPii9Tbc503lQrDYn/F+ty/dOcOgZstAtjxjvvmHI+4ff8+FW9Ee6YbAdOd
         45VQGCtBQrHRrOgLYYc8m1985Y74EhRLUxDwLg2HHcuvzVP2jdbjYSPJCPYT14R8jwvH
         K8312bn9McjgDvZGKNfPo7ZsEA/KcJ36VMeNfBD+TEheL6oWj+s3kY2QpFGYSszJQl0d
         3YCwrg76PbQMqpCXJ0jZtjf8sKNhJQP1lfUYV9niZLvg6H+LJfXFc08DW6WqxOQnzPAN
         3Zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027198; x=1757631998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz0GiMYb44SvgwnTpnJ1WiT4G0dl9xf04AReEOrfC2g=;
        b=nkW+oXSYjNynTbs1FdFeUuCJ1X10aHvtAjZz5KAGFPWRzrK4xRHBmu+iljjPrliOA0
         fYlUTrt7U+/i3WMpQRf8KnDWxDb+2jDVQH4ndMl0tDU6TkgPL0vel8XcJ0sc9H4AVARk
         tAoNYJx1wsm/Pk8WWrYCpnqmPMVaSe7C5WBaPUGCi8+KL/RgBavSd3Xzvd2E1TdQAV7z
         cRlAjbK+UVJVnS95N81pzHAtOP0bbZ2rEqjuicAxLdQ6i+g4+244wP48AVoLZsMdjDYg
         HCsnqz4sZXP+A0Zx5Fxe6b/tyRu6FgZHN7XkrD3QriVT1MajMTf7K5NTy0AOCXk47Hss
         oCOA==
X-Forwarded-Encrypted: i=1; AJvYcCVYnEYEnD8UuFmtRZuXeEmljesS0TTk9DAn5227MAaJtsk6PXFgWWnrDK6ziJ7ve+tKa5qZ3OWMXQSBNRYhJJXh@lists.infradead.org, AJvYcCXFRpx4yWfXvX+7ZEs0NfZBoWYFH3uTDMPxqjtuDmqagDvxBjjfv+DTrZP0h+Idy3ntrOAXwDDFR0oYaTrD9Yw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx16tdOihXJXK6GOPIraNCudXRh2pAlQeeUo96oCR5E5zMYMX3D
	QFJghPy1EmWNH8mwFhYHL1y1qWDCfqWMw64OvgATPAXxJwSBaLYM3IF90NsKUi4znOdiOOrnZav
	n0dpYUcAJdMXO4EDvNLE8k2jy5mnBybEBFrGwNhI=
X-Gm-Gg: ASbGncu0s/GaWVljGGrDS5O45a3qQBV+qVTVqnP6zTt/PsXEX7E5v3uc0zT6735yW0V
	MVQdGyi4ISPPodQMZ7gKx4+WNv1pfEnDyl2/rDC1PSmcnY/LdPEmuGoyXFm8Y+mEpD13ozlJX5H
	zc4k3bGyiuXoTq2PHlMGkil0sPmZ/ruBCLrx9fcR5dlrdwBCHkU8uDFNUcO1+h3xu9TB6aFhKlh
	Hl0XjXnNVjBvffMwaUmb6J/o+XsUsBYO+hb0GDT95INvig3Uv4Ki45JRT6j1J69HyNKobuluUFG
	GxO0XjswoJp12tSp7w==
X-Google-Smtp-Source: AGHT+IH/UOPapUe67ml8mQg2G5ZORmPRUqKua+tHRBkgLjhGsyEaV9W6C1STKBiXSzNdaKZDJ9D9LdHr4bJeBLGW/a0=
X-Received: by 2002:a05:690c:dcd:b0:721:5b31:54ce with SMTP id
 00721157ae682-722764fe1e2mr215403527b3.31.1757027198220; Thu, 04 Sep 2025
 16:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com> <20250903225504.542268-3-olvaffe@gmail.com>
 <20250904080239.779b5e24@fedora>
In-Reply-To: <20250904080239.779b5e24@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Sep 2025 16:06:26 -0700
X-Gm-Features: Ac12FXzcL3-czZFvhjU2Mujq6i9ZrXWDYBfA8bIrDPlQ3iKdmOHkCSCvjxw7aN8
Message-ID: <CAPaKu7RdpEtwqDHrjt4HJOJVYeRjUa38Sk70=6dD9WmXYtf_jw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_160639_780737_56B42BBA 
X-CRM114-Status: GOOD (  16.93  )
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

On Wed, Sep 3, 2025 at 11:02=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed,  3 Sep 2025 15:55:04 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor=
/Makefile
> > index 02db21748c125..75e92c461304b 100644
> > --- a/drivers/gpu/drm/panthor/Makefile
> > +++ b/drivers/gpu/drm/panthor/Makefile
> > @@ -12,4 +12,6 @@ panthor-y :=3D \
> >       panthor_mmu.o \
> >       panthor_sched.o
> >
> > +panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) +=3D panthor_soc_mt8196.o
>
> Based on the stuff you describe (ASN hash, core mask read from an nvmem
> cell, extra clks/regulators?), I don't think we need per-soc source
> files and per-soc config options. If it becomes too HW specific (no
> abstraction to make it SoC-agnostic), we can reconsider the per-SoC
> file approach, but I believe it can all live in panthor_drv.c for now.
That's about right except no extra clk/regulator is needed.

gpueb on mt8196 is yet another mcu running on its own fw.  It can
provide clk/regulator to panthor and no change is needed from panthor.
But it can also do dvfs autonomously, in which case panthor needs to
be modified to make clk/regulator/devfreq optional.  I think the
latter is where Nicolas Frattaroli is going and requires more invasive
integration.

