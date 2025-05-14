Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46617C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=; b=Q6xIAtMCwF3s/COtn0GQED69ks
	oGuJGKL8YSGZBthd/AGX+I6S7QuA+24Zn+dXD98KWZLzTQkUgsh4p/ajARFW1lP8OEc8yJkCCwTAD
	ZD/9+X6embuLQXNR6Ii9cl7bSupYXNF5CGcGbKNsrLIzwoQsMfPPtj6aWeLAE+jZ4hpqt8JvoMAbM
	kE7cijcKg7V7ThDNhi2pk6h678f5JyhfjSAwhnFPxWZZDQst0ABdwPlutmvddqaqb6CzwR6vI86Vs
	AoLyHZD/oM8dnZB5kNRzNJInuhe10FydagFT1EmQeG8cNls7j0g3B5Y2tonbCAi3qcPfyho+YzNh4
	13xcYpbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFICu-0000000GDzK-1ql2;
	Wed, 14 May 2025 19:56:00 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFI6N-0000000GDC5-0BOL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:49:16 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-72bc3987a05so185865a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747252153; x=1747856953; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=;
        b=Sx65x7E+b7d4xiwQvF+t/Pwbod/5R5EsR8Wxd7WDGK2g2pMVlGhn7sAlXzQH3e0v0t
         O0WLhsYEzFIk6CNQwknNGm4waAUcS3t5psMUUF34v5i3jzaRXGUXMl1QHlChSuUWO+CS
         yBcfKxgSgmpKhXsr2S2Q/Ycg81WPKf4EEHeBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252153; x=1747856953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=;
        b=etz7jYobZVNSk2716frAi9+BZ8FSqFf3xzpnwFx3pJmxv52AhkgonY7BPyksiOROPa
         5lmcc7Eq176+5sFJnudvxsYebOizt83fk1U6M3niZ+VUfNEUmC5Ga+G/yHc+w34+ZNx8
         fmssfLta9lRjQqcF1V6v+HY+uU63AiTgZvZAw9z1hB34QdJtwzHW8Qhs6brLbvQqtG+c
         O569+QNJE8rdiFxwe73+T/oCvP5KmlgvfHSxC/gCXm4xUE7+PFXHXugOXuDX85sH0/XR
         Jfm6WuzO6YWjqx6DkVDKXi1eS44sjsYHu9wfJRhjnd4dYXuNLzdKYZnxAPzBIM1nVQ7S
         k9wA==
X-Forwarded-Encrypted: i=1; AJvYcCUg+MScpF4iuaGI83yCGvWEiw7IoSuD4nx9ikYyyU2gZyaQHDc1EajtDP8Gj7ZzmYSMZk5+yJ7NROF5hpMB3Muj@lists.infradead.org
X-Gm-Message-State: AOJu0YyY5wfGq6wrnVnfocF4VUURd+BYjGGwEYaFS00tyq6xkG9RJwrs
	j0wv44bnnyB16JYwXdydsEVmxHvtvzCsw0cRApItN7P9zVYomAJj5J47yU52Q0C01V7vNBuMVU0
	1Er/eb9zqdntxtfeLmf2U33UvnCXkZpVERILs
X-Gm-Gg: ASbGncuBlt+YC7WeIutzOoXwGRM8iuCbeQa8PuvL5Q3vqYsa7UeWe7K7sRjdMMesSfi
	VDp+8T6+ABiLV+JfDT7l1Zn8Zem7d0I+EylWS5bkBteoC/3aluLT3xqeui9n7oWqw1/blBHL0hK
	gqd6MnCI7+SFfFDhK6p/d7Y7aaHZthwk3FRoaSoz+pReVtK9wMusWSEKSpAo7q4Q==
X-Google-Smtp-Source: AGHT+IFCJSg8hIfl+Y+fxKZiYgrSWqqDLysVmocjXAAcg6uBcAFRx9APEaATMEgkLVcMFoVK/5iaOwFvZXjnUM20XV4=
X-Received: by 2002:a05:6830:3814:b0:72b:8593:d3eb with SMTP id
 46e09a7af769-734ec6bf6bcmr531328a34.2.1747252153472; Wed, 14 May 2025
 12:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240410000730.628043-1-treapking@chromium.org>
 <9c5aa4fb-a83c-470e-acf8-dd31303e50c2@collabora.com> <77c4437f2643475de495733d7840421198b78f49.camel@mediatek.com>
In-Reply-To: <77c4437f2643475de495733d7840421198b78f49.camel@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 14 May 2025 15:49:02 -0400
X-Gm-Features: AX0GCFtecwOi8CEP2jK1ekxhH3Moa-nChPFzhyIRNlzu-0bbcdPxgTRcYXfWwSA
Message-ID: <CAEXTbpdNxFd7-RMXyvYraqC5cj_BgycAO6JWdNUo50DVn+yntw@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant
 code in lvts_ctrl_configure
To: =?UTF-8?B?Q2hhbmctWWkgTGluICjmnpfplbflhIQp?= <ds_chang-yi.lin@mediatek.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "nico@fluxnic.net" <nico@fluxnic.net>, 
	"rafael@kernel.org" <rafael@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"rui.zhang@intel.com" <rui.zhang@intel.com>, "lukasz.luba@arm.com" <lukasz.luba@arm.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "duminjie@vivo.com" <duminjie@vivo.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"bchihi@baylibre.com" <bchihi@baylibre.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Nicolas Prado <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_124915_082693_0F6C3DAA 
X-CRM114-Status: GOOD (  35.62  )
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

Hi Chang-Yi,

On Wed, Apr 30, 2025 at 4:26=E2=80=AFAM Chang-Yi Lin (=E6=9E=97=E9=95=B7=E5=
=84=84)
<ds_chang-yi.lin@mediatek.com> wrote:
>
> On Wed, 2024-04-10 at 11:55 +0200, AngeloGioacchino Del Regno wrote:
> > Il 10/04/24 02:07, Pin-yen Lin ha scritto:
> > > The removed variable assignment is never written to the register,
> > > so it
> > > has no effect on the device behavior.  Mediatek has confirmed that
> > > it
> > > is not required to initialize this register for current platforms,
> > > so
> > > remove this segment to avoid confusion.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >
> >
> > Added Nicolas Pitre to the loop;
> >
> > Nicolas, since you're pushing support for those, can you please check
> > if CALSCALE
> > is used/useful/necessary on MT8186/88 before I give a R-b to this
> > commit?
> >
> > P.S.: Can anyone from MediaTek please confirm if the 0x300 value is
> > right for this
> >        register? I'd still like Linux to properly initialize the
> > registers, even if
> >        this could technically be a default value.
> >
> >
> > > ---
> > >
> > >   drivers/thermal/mediatek/lvts_thermal.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > >
> > > diff --git a/drivers/thermal/mediatek/lvts_thermal.c
> > > b/drivers/thermal/mediatek/lvts_thermal.c
> > > index fd4bd650c77a..48d2f8ba3f18 100644
> > > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > > @@ -985,12 +985,6 @@ static int lvts_ctrl_configure(struct device
> > > *dev, struct lvts_ctrl *lvts_ctrl)
> > >   value =3D LVTS_TSSEL_CONF;
> > >   writel(value, LVTS_TSSEL(lvts_ctrl->base));
> > >
> > > -/*
> > > - * LVTS_CALSCALE : ADC voltage round
> > > - */
> > > -value =3D 0x300;
> > > -value =3D LVTS_CALSCALE_CONF;
> >
> > As a side note, I believe that the original author wanted to write,
> > instead...
> >
> > value =3D LVTS_CALSCALE_CONF;
> > writel(value, LVTS_CALSCALE(lvts_ctrl->base);
> >
> > Cheers,
> > Angelo
> >
> > > -
> > >   /*
> > >    * LVTS_MSRCTL0 : Sensor filtering strategy
> > >    *
> >
> >
> Base on xiaojun.zheng
>      The register is for PTP function, and in MT8192 it's not required
> to do such setting any more

This driver is now also used by mt7988, mt8188, and mt8195. Could you
confirm if the PTP function are not required for all these SoCs, so we
are safe to remove this?

As a side note, Mediatek explained PTP in an offline discussion with us:
PTPOD stands for PTP (Performance Thermal Power) OD (Overdrive).
PTPOD is a technique to let the HW runs at the same frequency but with
lower operating voltage to save power.

Regards,
Pin-yen
>
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

