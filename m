Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E0C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81Y9fywoqF7EeyNEvfPWdoet0imEzVFFJD69wE8Ijuo=; b=UUO5Z+HTDxvdFL42U0IFjcY0rE
	qpXPT548eUaa+RGFOC0xqdN9Ri7q/s4ZPsLkSzleaIQNZ6YkPmv2CoouynhI1GgY8UBZeF6Ywpexe
	0QypLa4uChpaKfgdVkWpGDrvjjizZ/LlfVFSj00TjCLDyvBAUg/BP0lKk9baoOgt1KBFLC6VzJ336
	BiIDKw/WyHlAVDWRCvdHqfZtGQ7BWa+3Uu1RSLyiPkpo6+Z1pJmbLTUpmfXslsMoCvVqrjgDfRxFO
	phQf9tDk+o+cAY62Mv0Id95Njx7VXgFBYzHpilVN1BsxQJvE9SiAWIIvi/6Ce1m5Gppl0fPF8Qkug
	jm6giw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUDX-00000004Hrw-0m9C;
	Wed, 23 Jul 2025 07:48:47 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueU66-00000004GbY-2HQ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:41:07 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3e292dcc066so48715725ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753256466; x=1753861266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81Y9fywoqF7EeyNEvfPWdoet0imEzVFFJD69wE8Ijuo=;
        b=W4gm8LNX49ECMaPM9Tn6ajO9uG4r0wScizX162XETGOnQ7s+hdU27V1vhW0Z3snfFw
         NjCM4u2gDTe3K2lB3tfn/B367vN3CVl3jdGYDyeotaQt293QOqkTebWMJh/OXl+hIR7m
         GvewJD2e6H8O+A2OAlQr6iOI4Y4emfVzrOejTC62qJZgfNxcISULgbqilDXivLwrtoNm
         xPXuXjqeZ6beoseub23js+cRMFgJNV5+HHB7I2R2HNUEf4t3Bmd52iSJ+202kbAjwOb5
         JVVVarcayRtjGmpKL7jBztNgoBJyhFVphOrwKliblxsDnKz9wxWu4u6KFx82WrB83Va+
         NUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753256466; x=1753861266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81Y9fywoqF7EeyNEvfPWdoet0imEzVFFJD69wE8Ijuo=;
        b=IOGvzw2UmoN9lkq2aPI4Lp1wc/CmUDg3yJl8+AzXXHaoYhXaJWOPA2ExeYbUVqty1k
         Wtn0Utv3T1scjC75dSTUxzUJ7B4nmSDVlMAv1rvJcfY6n/2CA193Zsw9QdOmlQt/Jriq
         g+neWpxG1zwZNFjKXdJT38qaLYfSG6w9+AcftEd8UZfTn4vgVPMxLEJTWZ4ioyiTcdy1
         rRe69FR+hJQXTdSgFAbEMvJwVMQgm6FfegxWupFMx3VlK3T3uJzx/jAU9nStMr2n7BrA
         iDnB8lcWsiEZ6BxvCVVQBwugCYxf5RP1YGhQQ3FyQzNmJJwZn0AftD04132Qk6iwj1UB
         dsRw==
X-Forwarded-Encrypted: i=1; AJvYcCXAx3nm/tBhRCljarTwuPVo+rc5yXDDuNIxbxf7MCXKjsI0LB3YSyRyqFZumVPT/r6bmkxfWbhoq/b5d+pQbkF0@lists.infradead.org
X-Gm-Message-State: AOJu0YyikYYpt6/H4jMGlFxu4hHL9N+vlAgD+telbYtT7+tm5Uku4rlO
	L9uZt8+LeOIwOoYOeAh0GQTYIM/xtUpjERyMCEFK9uBqWwNRdIvGvV2FVt4z6Cled2KXlO0hXP2
	jjupnfM0giNRZg1/LaV38bj7VSiK7dL8=
X-Gm-Gg: ASbGnctgvxI9k/pqQaSNClkFeOKdYA72LAOlV7ekAVky1VbEin86q1s/NmJHLErd/3Y
	AjrVmA9j3sOvqglMOJTlgvhhMBBSlCnHsTOcUc8PF0EEh83y1NZmn6MaEZTZeiYO0a3ddRuZEVt
	9bfohw84nwnnz/ekdzPSzvOIqS2eK+C/kUSiTs2pY/vhCH0UbVFraV7MhJyPYaAtk/tB5LxC0iE
	6fvT7A=
X-Google-Smtp-Source: AGHT+IFxfL3iPUA5T5lDVBBDYyqD7VIFaDA3fQJ5O2oa4O2dCluRKQiYM4kl1jFwdLxNmmpTIZDHo7HQtauQmGufUFM=
X-Received: by 2002:a05:6e02:2384:b0:3e2:c212:6164 with SMTP id
 e9e14a558f8ab-3e3354dfeb9mr37438145ab.12.1753256465669; Wed, 23 Jul 2025
 00:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-3-shengjiu.wang@nxp.com> <4668607.LvFx2qVVIh@steina-w>
 <CAA+D8ANQdOuEiHrOWAbqVN2oFAAop2agBzKB2_YsoQ3_SFYYNw@mail.gmail.com> <85f1b9f3-0134-4385-9ac6-f3c6c2eb546f@nxp.com>
In-Reply-To: <85f1b9f3-0134-4385-9ac6-f3c6c2eb546f@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:40:52 +0800
X-Gm-Features: Ac12FXwt3CFjI2gmqrSV6-EQJlh4rFyR_XU_vqi0YUQRGTQLoRTFr6d47NZAQO4
Message-ID: <CAA+D8AN6HSTwByHvqfkLnZ=UFPo8W48N5oRf2CtF6pXdCwSXag@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_004106_861894_58EC4A17 
X-CRM114-Status: GOOD (  12.32  )
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

On Tue, Jul 22, 2025 at 3:50=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/21/2025, Shengjiu Wang wrote:
> > On Fri, Jul 18, 2025 at 7:51=E2=80=AFPM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
>
> [...]
>
> >> Am Freitag, 18. Juli 2025, 12:11:48 CEST schrieb Shengjiu Wang:
>
> [...]
>
> >>> +     /* IEC60958 format */
> >>> +     val =3D 31 << FIELD_CTRL_P_SEL_SHIFT;
> >>> +     val |=3D 30 << FIELD_CTRL_C_SEL_SHIFT;
> >>> +     val |=3D 29 << FIELD_CTRL_U_SEL_SHIFT;
> >>> +     val |=3D 28 << FIELD_CTRL_V_SEL_SHIFT;
> >>> +     val |=3D 4 << FIELD_CTRL_D_SEL_SHIFT;
> >>> +     val |=3D 0 << FIELD_CTRL_PRE_SEL_SHIFT;
>
> [...]
>
> >> But where do these numbers come from? I can see that downstream kernel
> >> sets these bits depending on audio config being passed.
> >
> > These numbers are defined in standard IEC958 spec.
>
> Can these be defined by macros, even in a certain common header file,
> include/sound/asoundef.h?

yes, then will include ALSA maintainer for the change.

>
> --
> Regards,
> Liu Ying

