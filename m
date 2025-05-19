Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD4CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=As/kTGBPQ5eBvTGcLqqJV9KysCV4aWSd2Ql4HxJei6w=; b=sr5zirWFrv7RfOeuCciAPQIIqv
	Itjw7nXNqxR8vevgcPajq0X1HTQMC8dGBo5rVj5IPBqNvKmAPXFppmqtWwHZGuReO59miFjPOvJkK
	reuI9L7hvHmzRD6r14ewDUvy+CqjVMbE6ih4zHL83ZylOYHA/7n7AXqz7ICrjbED1C8YjlRrbkKmD
	2BbPfuDfHSDPTsdaBJLlMCnSMGalHrYVaxe3CNlXx3miL35PqDS3IKNoe7VtnQNFf4F+Iwo6skeYB
	bQ6Bo6UUoy3+S5VQalCsUBgXUtrTcSJmHX6SZCspDI6L3wTCueZgW41xgWXXOxKqxeFICWeUUp1vk
	E1806VZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyRc-00000008xj7-16RI;
	Mon, 19 May 2025 11:14:08 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyPZ-00000008xTL-3yAn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:12:03 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-328114b26e1so13914191fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 04:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653120; x=1748257920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=As/kTGBPQ5eBvTGcLqqJV9KysCV4aWSd2Ql4HxJei6w=;
        b=BvJIBNzf5PThQCGeAnODkatclqYeaKS5DfQxAACxO5RwwvenOgqTthTKL6NlwEdPNM
         qt9ekEItl29scMUhhyiDdkaYElbcQXprD/jUz/K3v3faUTgkUtoCcmU8qi4aUj3RELSq
         f2IBs83J/esEtIN8MU80VPJKmMmNRqzJJUbdfJQz3FEdQgDtSKiiECQYHV8dbre8KPX8
         ueELNclmB6gYlFkYoZlL9yp1N4ArmYU5doXu+0zsbcnyrUTNkf0PtNvwnt5qtAb+MIJE
         2K0yQjcgv78uPdpRNcSfoz41uCx0H18vGF4PmSoda/k1iL3g9dDSzzBOTSWHNpE0TShy
         J5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653120; x=1748257920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=As/kTGBPQ5eBvTGcLqqJV9KysCV4aWSd2Ql4HxJei6w=;
        b=OTN+B50kN1eogOYWUYBkpdMg5mtSgRfC0dG8SeWfg89dhxFORbMuB8AiK00aMFaTh0
         SFdK+l3md9R8/6mjQ7TM7ef+JMjUyxIgh5CcV1q4x65P5zahf/6B952qlDlkLaSko1z3
         x2yshfapwm8tgNhD1tRib/CrK9qeyNH23wdm+34YefR1oy+6oeKTO8K0CNSqM7FhUuAr
         qMHT64n3lQSSgFtrEPDGYJCi1hr7dzHUl2WqAYNC/5o+0UAwMUpZxOlxdJGddN9CGKyq
         wGglkhqtKiaeP5d/MfVIUMIdlm6YIWaV0uh1mc5NH7wr07ZAtw324K0OnkKNEp182u7U
         /KKA==
X-Forwarded-Encrypted: i=1; AJvYcCXmokb9BdSFu77zaFOIHmPxzigBKBvlZDnpE0p8MlqeBsNew6pRkz8atdeZLeMXyndza/sHlAar0UfgS3HBfnvM@lists.infradead.org
X-Gm-Message-State: AOJu0YxOmQgNRnfjjoXLlRLiWXBim3tlEp5IfGyEpHJK29iLOvtSKhQ0
	IsK7umW96fkEsxlPaGw869DLrzD4yWGGxlecrpCfV2mpy07ndG+E69bhHKIOXbRPsQVko6TFFjG
	wH8wdwMIBt6U+FI1CPmkEh1e42owLglE5dmvO5z4aiA==
X-Gm-Gg: ASbGncuWI60YlJJRtVcu3rD4y1wbTaUOfbo03V+/Bo//nHlQ9yx451e6JEQaqsxk5NI
	BEhsubALp8vrY4F+mZE+q3PXP9i4ZM19vN9kvaF5h0jWcRLMbIpeVV5mkYGsISwBRU+PKNlzOGp
	MGUJ8BsEpfBDOrMQHAYiVQ4T+5goflGLKAFPdaVXpfqEOkIVrPZawAr+4Jx/sowWg=
X-Google-Smtp-Source: AGHT+IElbpXRVMcZRygThyBdzbZe6aWKZ0v5i2qkL24Us+95XFwU0tUYON/GzrFuoeqg5lUBQdujjRItOXVlv408oJs=
X-Received: by 2002:a05:651c:324d:b0:30d:dad4:e06f with SMTP id
 38308e7fff4ca-328096986aamr39036301fa.2.1747653119958; Mon, 19 May 2025
 04:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-gpio-v1-0-639377c98288@nxp.com> <174732137152.17517.12381683522631139304.b4-ty@linaro.org>
 <PAXPR04MB845950186761960AAE5A472A889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845950186761960AAE5A472A889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 13:11:48 +0200
X-Gm-Features: AX0GCFsnF7MKGdDOuJxUvTHGfe0KA4VzWjS5k-RXwh_BI-pWzfyBxVgg8qQ4FXI
Message-ID: <CAMRc=McXAKw8rZzKtfz6ekUcTHLP_ik7MN2FyWYoZUyx=bSdsw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
To: Peng Fan <peng.fan@nxp.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_041201_981294_D1C17BAF 
X-CRM114-Status: GOOD (  21.31  )
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

On Mon, May 19, 2025 at 5:56=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Hi Bartosz,
>
> > Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > On Fri, 09 May 2025 12:45:31 +0800, Peng Fan (OSS) wrote:
> > > This might be a bit late to post this patchset, since it is almost
> > > rc6, but no rush here. Not expect this patchset be in 6.16.
> > >
> > > This is an effort to make irq_chip immutable to elimnate the kernel
> > > warning "not an immutable chip, please consider fixing!"
> > >
> > > The major changes
> > > - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> > > - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> > > - add IMMUTABLE flag
> > > - add GPIOCHIP_IRQ_RESOURCE_HELPERS
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [4/9] gpio: mpc8xxx: Make irq_chip immutable
> > [9/9] gpio: pxa: Make irq_chip immutable
> >
>
> For the two patches, there are build failure
> with powerpc-ppc64e_defconfig and
> arm-am200epdkit_defconfig
>
> GPIOLIB_IRQCHIP is not selected. I am not sure
> how to address the build. You may need to drop
> the two patches.

No worries, I just sent out relevant fixes.

Bartosz

