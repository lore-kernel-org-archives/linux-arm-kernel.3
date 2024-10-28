Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CE5D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sifr2jJTKHUjzilORSWtcX+eJYT6NU0RJzPCM1a85Qs=; b=NJg0RBUjVDoXFNihZOGtAIDRYq
	ynl5MMWrkhaxqz0eRsSbGyEvBACtfpVw9o9z9WYT55gUR7mVhEYW+0j6yZ2YDfzwt+mDEEdLxDD/M
	2ORD4NLreo+llwxKZaQvsYCw8DOw14AA6j80f4j4x4t9ugZfHd51/Hs7e2cmo6SNkR+uWCCVN0q5s
	o0hH2nTbh59YXRMTKVD1XvFIHzlwbaRRFFiRdzH/4N1Cwb79VWyIoZ25mHMLIU+1INH4+j6jjWFeu
	5wV58KeK0sYtdLBQJsYSVmFzJPnmBx5liVt5q6kGfgdwcl4CI5shU/7iRMe87adyJMJX2MLKtSwb2
	7L4e9ifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N7x-0000000AQEI-3PXG;
	Mon, 28 Oct 2024 10:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N37-0000000APWZ-2v0S
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Oct 2024 10:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sifr2jJTKHUjzilORSWtcX+eJYT6NU0RJzPCM1a85Qs=; b=Q2EZrdQLOPrJJea5PofBzjCGRK
	XWyC4YAdIAnI7sNJNpylmOISsCeAz6S84JUoBoViABaSdsL2oeti9zYNYUlsCprs1vsiY87Qfb5As
	ekBvJr7lr+2L+uG3H8/jG9Wf1PxDYuTyLXqVUplTyghn+4P+V7gy2qhWER4qCveeFP8/SyevnGTuT
	8JzfoI1p1N6UgeE4h0ZXgWCrtYsktjvNNXoTJNlvqkcTV4gwUBXb4pShIVjg6CUR0aBRDA6xjxNXk
	yyPWKF3dHtp30icgszGTOIirvAFGhzgjnufxzTBwIi3r4qAOH3vO3s+hf/2r/lppnGjsDVEALe8jg
	b5bEUwWQ==;
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N34-00000009czQ-0AI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:32:36 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e29327636f3so4280364276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111550; x=1730716350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sifr2jJTKHUjzilORSWtcX+eJYT6NU0RJzPCM1a85Qs=;
        b=cddophJ+9HZeu5JHb5M0FthMkLsUjDjpkKokqwr1pc5nDYERiUdg8KQFadRU42X2K7
         fmiFQSAYOGC9u3L7J1o4B2v7Jt/06Q9+y2X+/7LDG4XDCaK78gPG6a10HKUmhNUm2aMC
         hBnG17MclylxxHfvGoEPy0vfhtdAqYVPzn8iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111550; x=1730716350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sifr2jJTKHUjzilORSWtcX+eJYT6NU0RJzPCM1a85Qs=;
        b=jVoAs4wEF2aXR/6CtkV2GZvqEDnkf2676b0J/W/gFOzpKhHUoihaGJADcuO8foiIOe
         SeRGaOpZdCCgjQBdTwjvdZsNaCxtvwJPRVZQKI0SG0EEHd5jo5vZciqpSqyYxtXoxdjz
         jha6dnMeT5kwi2VpvAhplEu72EStELABV33d/+ofBrBRnJaspMPfrckQ2u1OepegGQG/
         9/CEwqsAJMB+ArSYVmKJWb207jmcl5TGDwGjJs8EEsGYusWz1GROxoiOSdXu7LtR3t5Q
         HPVA0ZgF9mFvWseAiyP+Is8VEv2ALYpgKj0WEaUmylzcjCu4rvewBR0eLOJi9Mqx6i7S
         Lrkw==
X-Forwarded-Encrypted: i=1; AJvYcCUB5PXkCHzGiAlGCn7AJAxvW5mRBPXfjUIYYAkI5/nkdbB6j3V60L5LLxx7kMOAVAdg/mIlzmUwcUfZK8zoglkZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBvyY4Iq9tGWuj0of45eiJNXoq41KwS25apXJCDLVfAKjxU3C8
	ZvdSuLS3SI61zqVtl9Qb/khVUSw2bpqLD5/BXFCrs4cN0Yzyw6cV+6dlScoQoIWn3TtWmYZ6JsO
	OpD0TfMgdIMd83mM8YlMVMhCo2bk6ogyL8th5sw==
X-Google-Smtp-Source: AGHT+IF9ddqHdtij3qzgutlZYqDdqye4Y0X7im5D9JxYtJ3EWaxqlKOCIp8dtlSZCbbCN0feWNn58wnCJ9/AjxCbxos=
X-Received: by 2002:a05:6902:18d6:b0:e1d:194a:51ee with SMTP id
 3f1490d57ef6-e3087a4cabcmr6741526276.12.1730111550644; Mon, 28 Oct 2024
 03:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
 <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com>
 <566859c1-a397-4465-987e-0682b07a703e@kernel.org> <CABGWkvqqg-PGAZTCz=MMLRx5F93jaN_=z8zJt1sDd3PHXd80PQ@mail.gmail.com>
 <6c3e6071-822f-4230-b76b-276330de07ef@kernel.org> <CABGWkvrU507BHoP94Y7fEyFr=chuuy3o=oBHtuWRvwTw3GnxXw@mail.gmail.com>
 <82db5037-bbd3-4005-bde9-02df1bf4c475@kernel.org> <CABGWkvqXZ+YAvo-AtUy+Ftdu0xxXKuhOwcSTwO5Fv6D3yzttNg@mail.gmail.com>
 <b847ccb1-1eb8-4119-8612-212804cb50d8@kernel.org> <CABGWkvqkmo9O-O1taR651W4xo=yqar=p71e0LKqRte2CGZ2Z8w@mail.gmail.com>
 <7bce31c0-8c74-4d65-812f-01951a0d75d1@kernel.org> <CABGWkvqFi_y8OzKbi=K7ucW4RuY_zh6Z4a=uO2oqQRoVE8LaCQ@mail.gmail.com>
 <CABGWkvrR-vVTpNSBD_etjn4SteO8cpUed+dTvYguHR67UUSsYA@mail.gmail.com> <fdb76466-3258-4c71-bca3-50fd3cc94a0e@kernel.org>
In-Reply-To: <fdb76466-3258-4c71-bca3-50fd3cc94a0e@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 28 Oct 2024 11:32:19 +0100
Message-ID: <CABGWkvpTospGbdPtEz-Fn5OL52+Fp6tQxdoAVFZUP_HeG=a7aA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_103234_265971_4B13ED8F 
X-CRM114-Status: GOOD (  25.44  )
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

On Wed, Oct 23, 2024 at 7:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/10/2024 16:58, Dario Binacchi wrote:
> >>>>
> >>>> This is another commit [1] on enabling spread spectrum that I
> >>>> implemented some time ago for
> >>>> the am335x. The most evident difference is that in that case the nod=
e
> >>>> was a clock node and not
> >>>> a clock controller, as in the case of anatop. The parameters are als=
o
> >>>> not exactly the same, but
> >>>> that depends on the platform.
> >>>>
> >>>> [1] 4a8bc2644ef0cbf8e ("dt-bindings: ti: dpll: add spread spectrum s=
upport")
> >>>
> >>>
> >>> OK, I still do not know what "0" was, but the items are fixed, so you
> >>> know exactly which clock you are configuring here.
> >>
> >> So, after delving deeper into the topic, is it now acceptable to use
> >> the property
> >> "fsl,ssc-clocks" instead of "clocks"?  As in the patch I applied local=
ly?
> >
> > A gentle ping.
> > Sorry, but I haven't yet received your response to the previous email,
> > and I'm not sure how to proceed.
> >
>
> Yeah, the property is fine, but I don't think you need the clock index.

So it then becomes reviewable v2, which I had already sent some time ago?

https://patchwork.kernel.org/project/linux-clk/patch/20240929172743.1758292=
-2-dario.binacchi@amarulasolutions.com/

Thanks and regards,
Dario

> The lists - like clocks and your spread property - have strictly defined
> items, so it is enough if schema lists items and says which spread
> points to which clock.
>
>
> P.S. I think you might pinged me on IRC, but you know,
> https://nohello.net/en/
>
>
> Best regards,
> Krzysztof
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

