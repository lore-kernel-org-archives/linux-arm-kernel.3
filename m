Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3EFC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiNsjWQEyZpPU2lsoxmyL7jHbDdd7M5piMd8IBeFtnY=; b=qVAr91+6A4AxWwIH9Jq45N7fua
	jWfPcmQh2Duw5SajKf47r4jMZVz0rGNIcJhrbAkyKpfZ7gWrRXz4wlXRMzUHoYfHthYBJzPddNF68
	FEzyr+uy8v47Y8P9cvPU0xUTLhwRD7ggXyJ9eQf8XIk+uHG1GaR5yHxylp5NDXlUNFQgNSV/ctHjp
	4ezO9kaz6ApOMisEJzNpjS9J9TJarRHMbB9EO0qtklC+ZxU4ChnwGAXz+Wd7LD+X8Ify6ZNQGNssD
	eTUdAU1gKpos9E1qe4IebRq/rkVJvke4D9iTTZ3GDDIAMY58KJaKMxPuKop6D90oAv1ZyUbT18ore
	BEOOpkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKf3g-0000000G36s-3z2X;
	Thu, 29 May 2025 15:20:40 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeHi-0000000FyPa-3vUy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:31:08 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-70e1d8c2dc2so10007857b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748529065; x=1749133865; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iiNsjWQEyZpPU2lsoxmyL7jHbDdd7M5piMd8IBeFtnY=;
        b=Wyojp8002Yv/K3l1rL0bmEsgfO67qAARFuvqCG5OV1dqY8mrwytuj5kQ8fjYOf9b4D
         tLz3oZj+kIdvLoVXdOwJMQca+GoCLAbRXS36/TNQqaLsq5SwTzaXGmE+Dh4tPFU+Kn09
         AFczheFH6VsQNiNU1QZQnwcbBOpo4wTckt+8LLLMtGRc+eH7BDOr3efI4B4nAqwWDJvk
         AUGafpGEkRr9oEGWgWj6IbysD0/xf+KxWOo/oPc0QTmtL6yiodweRebJ90aQNWuxlHp3
         73UgocsnMCC1rGre1K+paq7Uoi741tYpQFCktzDkb+1O3QbtLcleNdZ1Yf1e87e2lvRX
         1lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529065; x=1749133865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiNsjWQEyZpPU2lsoxmyL7jHbDdd7M5piMd8IBeFtnY=;
        b=w/+xL/BwKZojl8sW11eTNnHt1/A9XWdp4ot5phEVQ9rK6fR+492hGDDgH+ytwKs7Pd
         6EAXB0gLEXitG24JcvMBP5PmU8vg9hbBSfTvFpLrm5gfk68EddDGF08poLA++pYJUyUo
         LLwnMQibeNnjoEhSyZtS96wY6kaMlEKOboJgcYIRDJrSspnnoHpgTO4WShfTDTLYGf97
         eOOiXCht1k9V0U5zY6jz/IWXHO0s+r1c3lhiHrdQgdH/15uX+Ye5KOo+TSFn6xTluoU4
         ZoN+tDdzhtxggBJs6nf5d8TJ0HrprpxjHQIQY+g+sqIVY74uVpCx3NlRaqwpuqWIuLrQ
         raMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaSVA4V+1XrdhRqsF6s0/WRx74/j4QQ7T5osxoGCUTDO2nyl8ofe7cpWI+UqsaRF8i13jVFg6f4z8rECMFhjbL@lists.infradead.org
X-Gm-Message-State: AOJu0YzTj7HHjVTFbZew2QgjccH9KGaQBHfJGAJ2jWY+FOjzZ4nviKsx
	csOzDhYz7RHaVMff7SNEgsJa1Z7qbwXWGzYUTXn9ILxly0qMKx55mygSi3XMyMLeI3aecQzO2TS
	pUApAw2Z5f52BlG1Lp5LGoN2288msaPrhYI8PXFfoNQ==
X-Gm-Gg: ASbGncumxFkdkOzf8jvMzANZEGvSyhRC51NuaAChjnqkQ1FL9yG7vF4+wWvQDSm/G1t
	BNuyALazHR3YHBaIHXcKVJljNM8INCeWV6jN5AdZ0hlgp0mAXfiqIHKFbDeVboFH14FVoPpAPm3
	qOg6gmCVRR+8QA5RYqY+Pr4N0F4OtOmwQK0mDEbikwJw+C
X-Google-Smtp-Source: AGHT+IG6aP3uO7zL9olXY3uD2iNkvJAd0Zb+nywZHDYT5mlGvdkAedvr2taoqLqHeEIOtbchgpfhBcSmd0BjVvoBYKQ=
X-Received: by 2002:a05:690c:3691:b0:70c:965b:46f8 with SMTP id
 00721157ae682-70e2daaccb8mr277921647b3.32.1748529064648; Thu, 29 May 2025
 07:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com> <aDhtVkHfJvDfkfaX@lpieralisi>
In-Reply-To: <aDhtVkHfJvDfkfaX@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 May 2025 15:30:51 +0100
X-Gm-Features: AX0GCFs0RlzjYRbMTr-iLB95Xb99i0M6tDZ41x5EbK-0xfLufyMisf-oRGvKwZE
Message-ID: <CAFEAcA-=0GWG+rnHDOnsHg8cUq1pszN=x1-W+4MYZXXD8H8Pkg@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_073106_994293_E9FE97FF 
X-CRM114-Status: GOOD (  36.26  )
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

On Thu, 29 May 2025 at 15:21, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > The dt bindings do allow for describing Secure-world devices:
> > Documentation/devicetree/bindings/arm/secure.txt has the
> > details. We use this in QEMU so we can provide a DTB to
> > guest EL3 firmware that tells it where the hardware is
> > (and which EL3 can then pass on to an NS kernel). It would
> > be helpful for the GICv5 binding to be defined in a way that
> > we can do this for a GICv5 system too.
> >
> > > Two questions:
> > >
> > > - I don't have to spell out the IRS/ITS config frame (and SETLPI, by
> > >   the way) as non-secure, since that's implicit, is that correct ?
> >
> > Do you want the DT binding to handle the case of "CPU and GIC do not
> > implement EL3, and the only implemented security state is Secure"
> > without the kernel needing to do something different from "ditto ditto
> > but the only implemented security state is Nonsecure" ?
>
> Not sure I follow you here sorry :)

In a hypothetical system like that the dt could either
define the (only) IRS frame in reg[], or in secure-reg[].
The former would let the kernel not care about the fact it was
in Secure, but would be a bit weird. But I think we can probably
ignore this hypothetical in favour of keeping the binding simple.

> > (Currently booting.html says you must be in NS, so we effectively
> > say we don't support booting on this particular unicorn :-)
> > But the secure.txt bindings envisage "kernel got booted in S",
> > mostly for the benefit of aarch32.)
> >
> > > - How can the schema describe, if present, EL3, Secure and Realm frames ?
> >
> > The tempting thing to do is to have regs[] list the frames
> > in some given order, but the spec makes them not simple
> > supersets, allowing all of:
> >  * NS
> >  * S
> >  * NS, S, EL3
> >  * NS, Realm, EL3
> >  * NS, Realm, S, EL3
> >
> > secure.txt says:
> > # The general principle of the naming scheme for Secure world bindings
> > # is that any property that needs a different value in the Secure world
> > # can be supported by prefixing the property name with "secure-". So for
> > # instance "secure-foo" would override "foo".
> >
> > So maybe we could have
> >  reg : the NS frame(s)
> >  secure-reg : the S frame(s)
> >  realm-reg : the Realm frame(s)
> >  root-reg : the EL3 frame(s)
> >
> > ??
>
> I assume someone has to write the root/realm binding extensions.
>
> In Documentation/devicetree/bindings/arm/secure.txt I don't think that
> reg is a contemplated property - I don't know if the list of properties
> is up-to-date.

It's up to date in the sense that so far we've only needed
to have the 'status' property have a secure- variant. My
suggestion here is that we might extend that to also allow
secure-reg, and to have root- and realm- prefixes too.
Though I don't think we would want to permit secure-reg for
any old device, so maybe something more-GICv5-specific would
work better.

thanks
-- PMM

