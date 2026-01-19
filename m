Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FB2D2ECEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=; b=DZ57QdHJk0VmSJwZKUpelIr9ol
	NOpYwxOB/FSAlF0QRWrTjprKKsKfPoSm2kdZ3I6TQRnVhHEv2Z82qn5+N5GNmEusvX6lt0VjZuKlf
	cOIaFzArk69yrrW7pyFQfNMqWPXoP/6Ha7tmC3xS+ZIU9su5fyPHbYqlNXWbDNUnzkqsXkDPrD9lZ
	W+Gtk8eBakdsYF9LwWpJAZTkHcIAWnqv9AqDKzW+9XgucyVAUeBDCOjZkLYTIRXJ+qK5FwjWQFs8i
	wPUlqAtuoOeqAJnZIHfVNLOLWauv2LGykhqaYZJ9JIXpWS5W4/X4mHh3UWLpxixyJ9Prp5UfxuUc1
	4lk3otHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwjj-00000002tVW-3MXR;
	Mon, 19 Jan 2026 21:24:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwjf-00000002tTo-07aQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 21:24:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a3e76d0f64so28631875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 13:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768857867; cv=none;
        d=google.com; s=arc-20240605;
        b=DrBeOxXQynWG7XETP6qCiqvwM74scwjxcqw3bObReKTfD8UpPwr+Puw4PW2CRucQNt
         qsl1IOoVkOWNotFi2jY2IgJFNsBrVOhBmTJ9QYogOh5OF0jsC/+wNxkjIDvhT9HersJ8
         ZfQt34QVSyk0iuHVHvdldbc26vqfBX9VoXjcEa/YVi9KEC8iU94nMvybD63fn2tlnAjK
         6VpCCsNMYWHi0Yfi4denvl1CRcjD/ylPd7xhrmHBNKOFDuErCv3zbPPmv29OTmT8KNKE
         kdMYCV98umM2a0mRcP2RV579faP0CIgX3KLXgtqaqalUgCr60YH69PG9ntMMaBecyD3E
         IeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        fh=oC1GR3btYAekOasoZKPayQCG6F7sszFISHiCIi3XsjQ=;
        b=QP7V9N3prvr39y07DVM6rK85p2ukFW+WDCIYuBC/9b2HyBwxmopWYRCSJHES9dPOZH
         Fx/JcccooY+f8xvqeSub0N9J825+ymErT5G2hw41+GgRgoe5SKj0QgEMsHZWqkfCmvk4
         15DYDNjh85qVKzRUro+mUiHnS197EkX7ROK0rjUCJYcLab47eJSDMKoEXMr54ti5q1ZD
         2a/7tMd8b5v3QaO0ja0NITWj86kxAZdwRZDWtcCmurhD47qCFoFN5a4hHTQD45/YQ+pl
         rHoHIjfngew29IgvCO3YLhjoc+LO5DuK1A7PxN1T6qzcMHhRmb1Pdd0qWdMMrlTuAW0W
         OCJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768857867; x=1769462667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=bJsohoTfefURwT4UVYR0lJQBNYYu1hVH+p8KqAlo1l/ChyobZoQzV0EI46XSh2y8cb
         OY780fP/He9iHngLaX/tNeg8fJCQvicEZnrgUIO8Q4HSn7RI+tElLY1AKfu8yRpkIx9b
         qM/xJIhbo55FUaghSfY8oyi5PGqbH5TxHpXuKwnQ45YNfybkewxw6vFLMeZnGiuOMqgs
         0ylmd8tueA4b8qSIJHPZRhgxAfyCRgRb8kJ/xkMf5brYOsdA9I50ZElprXWWa9RIFY17
         +1GvGKzfd3lU5lzpvdJUc/A2Xs5kkC57vSifgK7XAN6d7w9+8Am65FuTEvmaMpxRTlog
         xJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768857867; x=1769462667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AP5uij4auzaarNTMKGDAE5deLZectmAWZbcZ2tCl4Wo=;
        b=Jbr1ARF/P9gOMtWAtc7jfXIkEM1H2PMvXuYkGqmDQ+OA5dgVFRekqXhjcwxncPRHkh
         urTrPL+f8qS4KjWJqDCWuPbBEX9LkAXOm1jBHj20G46+Fd6bmxQ0lZn/IPTnA2XfuaxP
         jo1PQnPV6xIBV9TA+OQRGo47EBWOSu1pnzrXfyW1+nCkHGFPYqtxyAsepIcFu9xCfTQy
         er1d5HJzqmOvcHHTqVsB8Yfr74+IhAAUV9eYQ3mRHp0QgSHpY5rTOiF8LOeS2emeNTtv
         qIeY2+yfDq7GlS/Jrcdu6E0qREjRq7kFOB30ZkQna0PvEKM26uNdj1Qsw8LkuDeq1vAd
         VC6g==
X-Forwarded-Encrypted: i=1; AJvYcCWeZmesEkC98uByeMiiwEVuRBRCtjTxXo9L7ozbajTmP4O54pMnG+zzx5BmuLmRPODZ7DsXqWBATUMoJ43cFvZ4@lists.infradead.org
X-Gm-Message-State: AOJu0YzDtKX6/dJswYufREgObMmdT53VZbotDbYKC6tk9tPwg1/7LPYn
	MnsVcvm1zuN53L4c2u7DHi18492l67Oz+wFMhnfHNCjDVcAUTzT/ah9HKKBmE83CtrFJGdKKNM6
	OxT9ICH3TKzb/oWRCDNjjw3CdZjznB7k=
X-Gm-Gg: AZuq6aK/QprZ3GIDQ4Dk59jzo4etXWIXZSW8gKHcXN2Yf3WlMUV+BhpVEjjq6GlCiAY
	SRx2KIL66ZpyPVRgMm/Bibv2FnAMe2DsUYZ7SHkeqEDoEkys3elHO1SkLx/V12ZUi1jnl5NArzQ
	g/NRWZ5kvzUdnaYLC2HfvaVx7iT6cgfZGGnGzQzapD4FGrN35Oh8rGz7Vzta99Po5kCirJQmjFJ
	qVlrQn1mJx9JSq79fYrvwKaaBfSH1jZsH3yhdJjUj4d85PgrWzq/317peUsvVa+OUoMY/o++rhz
	5+6pSuU5c6O/IExwPLo6x2Rh+VyxT7BrUc647Pw=
X-Received: by 2002:a17:902:e787:b0:2a0:fb1c:144e with SMTP id
 d9443c01a7336-2a700990c98mr136201155ad.7.1768857866821; Mon, 19 Jan 2026
 13:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
 <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com> <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
In-Reply-To: <DFNN251V4JL9.2ECEDGOKN8I4F@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:24:15 +0100
X-Gm-Features: AZwV_QgxI3L9klOeJM7lsCljCRIK_bf05uJfhQMd5VWt4KtGJ4pArfXR_EjKQn4
Message-ID: <CAFBinCCz+MobtXYdiyWRBBFBDo77iULLOZ1p2i4fAVnpJ1NzJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_132431_136121_2D201915 
X-CRM114-Status: GOOD (  24.89  )
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

On Tue, Jan 13, 2026 at 6:31=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
[...]
> >> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *d=
ev, struct device *master,
> >>                                    void *data)
> >>  {
> >>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> >> +       struct platform_device *pdev =3D to_platform_device(dev);
> >> +       int irq =3D platform_get_irq(pdev, 0);
> >>
> >> +       devm_free_irq(dev, irq, meson_dw_hdmi);
> > I have one question (so I can understand things better):
> > is there a particular reason why you went with free'ing the IRQ
> > instead of "just" masking it (so the hardware won't fire anymore of
> > those IRQs)?
>
> One reason is symmetry: _bind requests the irq, so _unbind does the
> reverse.
>
> Another is I don't have the hardware, so I wanted my changes to be as sma=
ll
> and clear as possible.
Understood, thanks!

> In principle one could request/free the irq in probe/remove and then
> enable/disable it in bind/unbind. Whether it would be a good or bad idea =
I
> don't know, but surely it would be more complex and I wouldn't want to do
> it without any chance to test it on hardware.
>
> Also, that would only optimize the case of multiple bind/unbind cycles,
> which are not quite realistic without bridge hotplug. And brigde hotplug
> does not exist yet in mainline, and when it will arrive it will be used
> only for a few use cases.
>
> I hope this answers your question.
Yes, I was curious whether you considered devm_free_irq() as the only
"correct" approach (in this case I would have recommended a comment)
or whether other approaches are fine too.
This is useful knowledge for me in case we ever need to restructure the dri=
ver.


Best regards,
Martin

