Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF275CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrEv7zqsjwi3P+M+icSri3Qb2jo0e2SlJQEgIxrEQ0E=; b=SD6g99m4bbkFlsJ1T7UE1K2uYh
	cXkzG4tv7W6e92Rc8ipDlWwijcq9XyOK5y5s4QmzyOLFhYGZokQ4YrWytWosf3swOSFwllEexzQdU
	vnJUfRxLNlLJ28vpNNwYtGUh+jmklb33dSu6Hv03Vc7mBYY66mkMp1P9WKyTLICkq/hUX+XPfvvCJ
	RhcEqOK/rQ/K3gbUwTkFBxcX87dzbazL8sM64YD1FdMWiHeD+/X31mrn0N+4j0aNHeH6GOR3EKFxO
	mYjx2JBiaWJDYWBEBmnheXY6z9k9gbdQqSumOIlHvKsoD3o3MoDLWNl3BEcXSRVrzYHM4zXepfGSw
	aAi06I2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1N88-0000000GgdG-1VBV;
	Wed, 24 Sep 2025 10:53:48 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1N84-0000000GgZh-3co1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 10:53:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso1559476a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 03:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758711223; x=1759316023; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zrEv7zqsjwi3P+M+icSri3Qb2jo0e2SlJQEgIxrEQ0E=;
        b=U9rucMSWdi8NyMUwzLWRg4c45a36gMHkYskztHQFnciTLxImqCWSzBSiV+BasV1/2R
         H+vyM3xrFitbnl7qZgSQLtBRz6zxf3acKg12V+lkOd3+vqN4wDp3jWukzluX9y/CQGX8
         sCzbr/MHrAFsS9m2/2sjaHqpnSo/HsUhDzO9O7kg6PEpNMJWO7/BEl9s68I8Sahczu41
         EzkW+qyctOn8rTekfPLvCrK0Ecf0fV52yv7jaLhQSx+VXRuTgu2LzkaPW3k4SHYzqcPS
         zQBlYxf364Airr9G2QwiX4Vql7VJ5Dr7wRNELlk34zyAWyRQNwRMD7ZqcD40nkwgFYlR
         MPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758711223; x=1759316023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrEv7zqsjwi3P+M+icSri3Qb2jo0e2SlJQEgIxrEQ0E=;
        b=RczY9knCp1VDhI/79GGnNLXQxYo2M7KghwPKoZj0M6xrHCfEGwGIz1R3R7Qhs1EW0E
         P2GAelkh199H8WtlczpRoQMGeSb/yBsHbhA/yKROiHd1Tp6crBBRFc/eAN09z059Z3VK
         GmcbJfx78h5WGVqoZdJEnTKM6QpO3pmqOhO5vFCMWLReV5qSorQVQqH4ASS5SZACKE51
         vzTj8nvJhENalYe9P8k5AWHy6tIGXz+KJQz11EJsxZlhfbNX/SSWmn/Ns01wWddMiT52
         YYqWaffLCFcjMkXhiFd7BpleKyUZiWC1QMcZx0cd4GzhiqkQzay4adZbHIa0j9HLWZRH
         a5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXyRoJJPHszr5dPbWU9IYaZ6C0IzwoyrpINXXgJLnfaNRRQHpBqspTLOjM7bkvCAWI6qy4bygJyEiNnBCbF9SxF@lists.infradead.org
X-Gm-Message-State: AOJu0YxklwZ0y4QmFanfsDZbM5OYAfdAvKrOC/t2toyNWDOrw5OFew9t
	cCbZwbCLXh/GuSJOjnJkFdQZyEPULTCptrUBjIUUuRLrf2yZKLE2+jnQdRNaUcVxjgWsvjOvBGG
	4UbsssPA1+BK9Mnc/7oWnVyf8ZiP3DLA=
X-Gm-Gg: ASbGncsvqYSO6Ff6aWKtTPz98i52yHihbV4NfOzXif88cUxyQr+UzpTawE9c1xk9zIf
	Zyv+5IuHeW7+oDG9hf2I/AP+AR4rC2r1QlK93TuJIcqe7+zK7q2jlyZ063xB2fSML7xP/269JA+
	KdjrOTtZzEu0Wh/tRrIVfRnIdE499+V7AbNNCBCEQP8XNxkLrpDg/B5lmdIhr906x5Iix8eWnmU
	Uy4GEbTiebjijWo+QXgENJ/jqB6Ym7eSuOewN4L1Ik/OAiJpBzef87V6XO79ItFvHp1tb7xH30=
X-Google-Smtp-Source: AGHT+IElwm2D6ahJvJYWjzllsUAXxuzHg7w0LYwr0Rx19Xx6M2bIwwWSbKEC/u5fSfyIkYIz5R6vZEOX8g3yjZ+xBeA=
X-Received: by 2002:a05:6402:2b8e:b0:61a:7385:29e3 with SMTP id
 4fb4d7f45d1cf-63483b2cd9dmr2323581a12.18.1758711222765; Wed, 24 Sep 2025
 03:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250924090105.1061910-1-pbrobinson@gmail.com> <545e2819-9654-449e-aa57-636bee88c744@gmx.net>
In-Reply-To: <545e2819-9654-449e-aa57-636bee88c744@gmx.net>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 24 Sep 2025 11:53:30 +0100
X-Gm-Features: AS18NWCImlKVFGeu4aCQ269cXhwCpD6ZojqmN7wwszPeWUPh5IQFoTjTTFyU98g
Message-ID: <CALeDE9NjF2xnc3rLi_SK2FPMSf2codQxBwqF+Q4XEuGMd6i8Cg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Enable RNG
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, 
	Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_035344_906339_37692686 
X-CRM114-Status: GOOD (  20.36  )
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

On Wed, 24 Sept 2025 at 11:48, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Peter,
>
> Am 24.09.25 um 11:01 schrieb Peter Robinson:
> > The RNG is the same IP as in the bcm2711 so add the
> > device tree block to enable the device.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > index 4cd51d80d40d0..6976a88c262f4 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -226,6 +226,12 @@ system_timer: timer@7c003000 {
> >                       clock-frequency = <1000000>;
> >               };
> >
> > +             random: rng@7d208000 {
> > +                     compatible = "brcm,bcm2711-rng200";
> > +                     reg = <0x7d208000 0x28>;
> > +                     status = "okay";
> > +             };
> thank you for the patch. I know the order is already messed up, but
> could you please try to add it after uart10?

Sure, can you let me know the preferred ordering so I can understand
what we're aiming for overall?

> > +
> >               mailbox: mailbox@7c013880 {
> >                       compatible = "brcm,bcm2835-mbox";
> >                       reg = <0x7c013880 0x40>;
>

