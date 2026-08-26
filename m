Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B26FC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoibuipogw8WclF1xR5HyS23ry9/ifoPowPx6lvjlCs=; b=gPtc7pjsqADEsHj9u2XeiIIM4F
	qlrHvVpFmtM4A/Dtf0Bnm6FHIQFmP3TTMkEDZEN6zANExpICb0VGRChdTvAaBK7D4zhgbiVu3jPmf
	QJ7Q5PE90MOVvBtF80QSHM9IuDgB2Ocho/S9cxi/pU7uYI6HhqNn/WlY3lfbvBHYnDVEvGYq7dZNL
	jFBdvPGz9WACaqY0dLi5JEcQWgbPyYeMZ0o9bnoYCBcjnhqg8H+HS1j6L8KCg0x+KKz5vVZwPwaHA
	r8ySF72/hnyQ8cDmiGN3lh0qQ/xZ1f/vqfJ63ObYzCvSZrfhrZooaBeV7nej1cAOwbRsNMj3PdHjJ
	ItbITuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8hU-000000023SX-13el;
	Wed, 26 Aug 2026 08:09:36 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8hS-000000023R8-0nrE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:09:35 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66c711b7f2aso1054300d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731773; cv=none;
        d=google.com; s=arc-20260327;
        b=EkmJsSj230kM4ITuCSY0s00S3UZkME/vIA99+/OmBc7s7bDQRKPM2SaZdX29QdyuDo
         qxRJVxj+4+7uKCz3gGHQzvDRvl84kzlyE3A9eSSKQlDylMvXwteiR0WrQqP206Au3Rqv
         ZPwn5RewxNOq55BeI1tNwghRk2kN3Lu815PInDUIUqxILzPDTQsDOqFMvsbqBFoyHzxp
         iBCdvRjK/56fDaVUubz8ZKOc7ZaZnMGl+eBEQ+n5Z/FD5gw0wjkwsJz57leSbLlPBoDc
         bTxhyN2lTqTARzXbec8pGTxvrokPMwNtYz75kjDROaFCAj0S9rjYX51IBX3rUSpSfu4S
         W+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoibuipogw8WclF1xR5HyS23ry9/ifoPowPx6lvjlCs=;
        fh=L3BnejE08o6QUzHuk5Ry/v4sTZUQn9Ejeo3+cjpj/yA=;
        b=hSbzV+04srvOUhfWsPdmFokXKNtllsk58SN7fKm8JERzFwKZO/Fzozwy/MHw1SANkw
         1QV7mfQAZ60uj202jNZ5yBumXcRXVWnPCHSl6EBQEzW8PVANJnXHywDdBflHVHyXmPgB
         o1ipYPnuihqLGShVRA0gjn8FnNMIONFS8hyxikpPDfVIKNGcHWe5H3zfBqUZoTsDUbxA
         AzCYYXhHJ5W2MUzJFtUoOo+sDtR4CIfu3wTddSVX3XufUPY1Vw+kBikRK0k0aFwTm1Ud
         9uLEOQmomBh+YPay5x9lmzVCRZHSPTqkxvB4ailerVPHJ0jymCVtO2PdBu+eqpP1fTjr
         sUzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731773; x=1788336573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoibuipogw8WclF1xR5HyS23ry9/ifoPowPx6lvjlCs=;
        b=hE/6uB9hBtzhXfgp59B5D7Y/ma/Z9B/A8U+xJZo25KgQL7UkKV5xt/GmHlJHts8nqf
         ZiccqsYdnQrlZAFGKxzu9zPgYWinCBRpAphfJs1PnRqkuKVnmJ3Rocw/04Ju/7qAcXwl
         WFpm5s33rtYWdxDSTYZHzYkXUzZgkcs2ikYM/6RYLyuCIEZWDyvkY8uftCjJALdmtYa1
         BbEGc1qZgwpk92KpKoeZ0p9jO86Ri9n8A/m9qYoO+/dVcOVUXwzXmaM291J9paY4M19k
         b3VF1Mlktyo9qihbWmxTv4+WrUDX9SlP/5/hEh0fMrh8A2WqrrD55tJRzpjD5g6/WD8h
         V8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731773; x=1788336573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoibuipogw8WclF1xR5HyS23ry9/ifoPowPx6lvjlCs=;
        b=l3TDpHKVlkWUOSyW2tS0HnRFoIFyUf5oXTtHFQNiCupECiB5eXfdl22hCvAAqEaqw9
         a7Ax0gwFD5pjj+ish1R4fp1Hb+NmQEPtNGGe0FFI0Pe4JJVPEk5atwfFXcz9dkq06ZRp
         7jwR+A8rDu67iSL0M+HEUw3ybB6Ih8oftBnzegp0uQTv68QfsSAuIim7/Igq9bW9ctEB
         o0mg5OleYILmcFwh7prhnh72LO1b029Vvh5Ll8lljEtkunxaXDV60a2QqxYtDAaPHFb/
         xUTa38zcQ9Jz35F/jrSsjt3tsdD4WkC4rGphfktD3Y9XBU2+gUv+8f18DApsWrrEG4Ge
         NSjg==
X-Forwarded-Encrypted: i=1; AHgh+RoXQpljs6WJZjfDEaKGQ8MwXF0z02jeTweeXydNcq8Ql5mXcTJRAVXEDegddUAcCVsB5BnXW63OUoRhc6crMPN7@lists.infradead.org
X-Gm-Message-State: AFuF++mHMfvnqid1cXalVDUXLiwpSvJkbCw6sn6buh8Ry3YqDtBcW3A4
	Pn1fEHxo0Qa+E88MmklKfZuRNB0oH8WWovpwitp2lP4jke3ueFIwNrDkyXhIvDC+l6jCO9ucquD
	PzEgeCG3fRHB72xrhVTK12zoyK0iILaE=
X-Gm-Gg: AR+sD12HjmiRAQWHAvug6epBguYVQGi7LfxcBrm6gdMOQU5/8RkUEf+4teR69B5LxyE
	JzGFuTI4H5EeNLqSJ5VhnugcTJBgnkf+MwhDRc83iJlvw1DjbUwxM0phSwf4YnCKuUmOdRPzJPn
	6O3q8bDg0fJXkmPUl9M0yYuvdOWITIFce/wd98CfVPGRtRKlDiZQzXa9r50VuLPSKdBK+39gx3A
	A/xD+j/4d2Ai1X9tKEUIaH9WY4bEINHnxtxbtsetNQCPC089WuY2KE0Z8B08xUJ0nKZ6nxXjsuY
	26saVFPGFVDZbREcJ/d2p5Wvmx+RktLbtwTU/q2hAtNObUw=
X-Received: by 2002:a05:690e:4146:b0:66d:13ee:2daf with SMTP id
 956f58d0204a3-66d257d9e4emr1314684d50.43.1787731768110; Wed, 26 Aug 2026
 01:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260808152654.2943371-1-lgs201920130244@gmail.com>
 <144ef4b2-a200-4634-a4ec-539a0ba9a15c@kernel.org> <aogYAmDqlgmnEd3X@zenone.zhora.eu>
In-Reply-To: <aogYAmDqlgmnEd3X@zenone.zhora.eu>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:09:14 +0800
X-Gm-Features: AcwNN1UWlYeU_Fm6Vv0GYzUXavNzpuhA_CQkuRUt3KOhhAYuo0_VKS3Q7UQ3-ug
Message-ID: <CANUHTR-eRRw+uHBzAK42jVmnfEv_zV=_RgPGtiBCjZzjr4PJ5g@mail.gmail.com>
Subject: Re: [PATCH] i2c: at91: fix autosuspend cleanup during teardown
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ludovic Desroches <ludovic.desroches@atmel.com>, Wenyou Yang <wenyou.yang@atmel.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_010934_302093_4C7EA850 
X-CRM114-Status: GOOD (  25.38  )
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

Hi Andi,

On Fri, 21 Aug 2026 at 17:22, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> On Thu, Aug 20, 2026 at 04:50:13PM +0200, Krzysztof Kozlowski wrote:
> > On 08/08/2026 17:26, Guangshuo Li wrote:
> > > at91_twi_probe() calls pm_runtime_use_autosuspend(), but neither the
> > > probe error path nor at91_twi_remove() calls the matching
> > > pm_runtime_dont_use_autosuspend() during teardown.
> > >
> > > If the autosuspend delay is set to a negative value while autosuspend
> > > is enabled, the runtime PM core increments usage_count to prevent
> > > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > > during teardown, this reference is not dropped.
> > >
> > > The documentation for pm_runtime_use_autosuspend() also notes that it
> > > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > > driver exit time, unless runtime PM was initially enabled with
> > > devm_pm_runtime_enable().
> > >
> > > Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
> > > error and driver remove paths.
> > >
> > > This issue was found by manual code inspection.
> > >
> > > Fixes: d64a818859af ("i2c: at91: add support for runtime PM")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >
> > How many separate I2C, drm, crypto, hwrng etc patches you sent?
> >
> > You sent vast amount of patches, all separate, making it very difficult
> > to track and respond in efficient way. Do not do that.
> >
> > Group your work per subsystem.
> >
> > You were asked to clarify and respond to incorrect fixes statement. I d=
o
> > not see how you clarified and responded at all.
>
> Is this a kind of LLM command or what?
>
> I'm going to check only the patches that have been acked and/or
> reviewed (people have spent time for that), for the rest, please,
> follow Krzysztof's direction, put them all together (or ask your
> AI to do it) and resend.
>
> Thanks,
> Andi

These patches were submitted manually.

Thank you for the suggestion and for taking the time to review them.
I=E2=80=99ll follow your and Krzysztof=E2=80=99s guidance and group the pat=
ches by
subsystem when I resend them.

Best regards,
Guangshuo

