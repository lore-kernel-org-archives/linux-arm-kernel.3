Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE4EB3637
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=; b=aBMQ2R8r5RsjtB55NHhA+IqJzg
	R18rXr/NDC0u4iUYdpooU+FtnP83QK33xhRCVrBZ0wJ17m5zNp7oFFIr+dF2ngOcrm4b46Kkl4dRU
	8b/tx6k5gleASPbIJd5nO/m6X3ksZmu3ZJzPfqxjnusQAJhXwvnpVh1icpCKyjtpg09VzN27IK4Zv
	GC81iKyxeWZpJ/J+IdCR0wF5WSyXfyS9HjuDIdsUfkz6srz/pzocxVz5ZxBvtfFILv4KaMWzU/5UX
	LX42Vgdt/8QvWiv+SxAcdnlHoIyQnQeI/OWqCfJb/nMFYDD3Nt4z29PgjYS3sVNlOw6W8XklulAUE
	Nxs3uqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxARc-0000000DzRS-31Xa;
	Mon, 02 Mar 2026 21:04:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxARb-0000000DzQQ-1CwE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 21:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=; b=vrtArTF3pfhOmeEb8gxAld567J
	b4X2cDNNJblEx/zhINxxA99OGwpMh0JdEmOZXbUZs3bGlizwfmoVs1n/jH9YNGIQ21IVYe5r0wbuS
	yaizLPHijPtHZGZozAOJqZqiqMj+Lnusmq/68FBpiGQNoFOCyZdDm82iQhOZQuIWU3quZCWwXghyx
	Ygd98uV3i2ZwANY/SeR4FQNB5T3nSsjlbY5ybAPuWFF2vJ4sR3lO3NIHDSDf1Hz1jKE5FQFcT0bBG
	4GDiNRP+6laUD3ViSQ5XZwa2P47Mcde9xoIFIYOL7kLp2NbSWzBNx3QLz3ZAnfL3DwcB0HypFTde5
	Wugit0YA==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxARG-0000000A6uU-3KVq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 21:04:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ae505619baso8351155ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 13:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772485447; cv=none;
        d=google.com; s=arc-20240605;
        b=ObC3LywbfFahJcFWRvPtifB3/1SyvMxdwDXdb4b+dXKuh8RB1g/t4vNzeh7hvL4nCj
         ZRmUtwYXC58E4wYNwsIPYvfGgO8QHGb9x903O+b6dwqnnhaEx8/ISqPWWgZrNKx6k+Q5
         xXUJ3xVyeSEYxaV3vfZmGx31xXk7yoBJt/hxJprRay6k/tkXlH+TTx7SE+OZ8HVTFQDd
         WTxTyyMtvJmsyYudjp3kwihJzHW1IFeQGWaTVkvsZq8N6dVJeaCYuJHanlw2V1FgsOLR
         6p4NRC209195JvTJzMzKoTzZvE6HN4pt5c92I74Rao7X8ohQNi8p9JrqLkOCd8QdgjkO
         q1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=;
        fh=RcCDCMM3MLcly7+kzcW75CQH6XktFGBCEIHxIOVQXHY=;
        b=YVRzJeBzt0cLCTfG1W1AqXKlZyOKgDx/qM7TuYonkxfyOkmLW6k3Yt2r1Sty8PBWwI
         R+Vgck5l0uYH889BsCCLuDyJ4XQrslTDv4xon5hc3N9ax0HUpU9Rb803wikijjywncSU
         yFzO3p6yXl5TfJ6+O6x3A469XmJJA6zD0zf0mVWhjgCatr/EgKrFVHIxQ4QMchjr+lyF
         vcUi7ZLH3eHG+xXBOjDUa6fRjHM+tekLXCIm+iFZLp+hBUGJen4ikUGUmXvMG3M8GNaC
         6YbKHuorcbPNcNnZkAcDMKAQSJ5fNSQ548VpjxHDbDFNhOPEBzSNJtUSE8P3LgsQHbM3
         aMEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772485447; x=1773090247; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=;
        b=m63SzPOWkd+HwDk3QVhFANKgUQrr8Nj7Cq600B53dZbLFBPN7/sBNfVWIxD0UNBbAU
         v/cqUd2yv4O/W/QNmgNy+NU1kGLPxTMhrcXiyyoxm3eqFWK0BsC6KeWfSZOxhxn75ZCE
         eZ4aL/FgwuVd83Wy3baH3yVaRe09p235zFKjexkztVfuAZN+WxZss3XGd94Ku7dFvIYB
         4nBBRqiSPpL3p45Ft/WDjhsR4x07QQ8GUz64n53Ssb6wEkxD1JRrJc+ZtIckTgxuBEDQ
         UXUkpZ6X4tsk5/nEj916/lHUflJjSaQcYaDDQbU1Jrl6OwbAZalyLrLWqSrn0n3ouB3j
         JGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485447; x=1773090247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0B/W9oEfTx3Mdx8y1qNKPKD50lO55YEDov361/4WoA=;
        b=b4P+yftXVVsYObsjphiKPAc4VdOOyricRvKzlefNcsCh4cURNENVzAUvSGPCluCkXS
         aycW/kIa0GnxtzLkOZ6s3ri+TNXrsssdicvwGTJYpDibOvZUg5AC2oI3WwZ3XUuX1Am3
         kpeliryLO7EA8J9AwcMtHjmqkXByljJpkh2OlY4igQ8KR/MNmQiW8pBE1baKhsgbIE7e
         JaXSeshEduIZp4PA8p98JUiMjVstSsqkh+IanRJPP6mc2Pa6v29fffBV2d6OQATxk8In
         bj56l/BAqR0hCzgu5ZIEh4HoHgx6T+23ZwgGvo+/q9QC+qBIe8vsyI7K4sm7qUBg3vdU
         yJiw==
X-Forwarded-Encrypted: i=1; AJvYcCWaAZlVqMlQw9cT2JZJm0W1jf52pbfLo2vBMjDeiu6wEZDqIkCvDh9SOMjuJGcfsZAnqhucmD6FOxHai5H0Kc+s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt8gDOlvCHjyoSPQCvvJ7cYvpYd9R299AISkQHy0LQyskkLRGw
	76zqeEuCoRqvLe+KZUWfjixZk2vdWTgD0nlH5pc+Esh1WLuGyjsgWIwipmzp8HIiDx6LC7H8lj4
	oHQepdONceVUFGWxsgN6fDG24RS7MbuAodKxc
X-Gm-Gg: ATEYQzwC2jI/EbFFT+9YenZ0U0IXECe/CS9Oxdj0k3uc4D7m6cQavh5JhCR8obAoC4X
	1laB3bXMkVWdXoMmgnq/2MThnNyZNUtGLLtdTDa5riY/fonTNzaOeyxfgXW4rPLNUK++AV28JVi
	pJDPGnRNrFwaNkG71XoECRudLI0xIDptuXWGeRPajwYsGBJNWu38itVRsFiwoDv2C5d6EpLBcWH
	z/6cqndYD6enS5fMDmkyvbb+ibCEwMqvonwWE6bXHt9p+e4IKRmbpyXrgWypvVJbJDsVwvE9D/T
	JYaE1OQCLaZKwx30qnkdOxtRMyBPzCv3tHvjRkmx
X-Received: by 2002:a17:902:ccc8:b0:2ae:5628:a170 with SMTP id
 d9443c01a7336-2ae5628afe4mr43796855ad.46.1772485446798; Mon, 02 Mar 2026
 13:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-2-nick@khadas.com>
 <20260228-quirky-lemon-reindeer-1045f6@quoll> <CAFBinCAkxO4HoN0Cw0Fc2B3KRLLJqso1p5+qjNN_E0c26VOf2g@mail.gmail.com>
 <49b3a87d-7ea0-4da1-871e-35ddf5d5b454@kernel.org>
In-Reply-To: <49b3a87d-7ea0-4da1-871e-35ddf5d5b454@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 22:03:54 +0100
X-Gm-Features: AaiRm50TpdWh3Y_pvxvTMNOeIVTyBRxIzdF8SrzpLj8ML0Xjz_0wayl9w2nZ3rY
Message-ID: <CAFBinCDyhvzWO3gOL=GtnH56Guh2fkZyhmSjn2k3iJdhtmTdBA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_210426_963439_561513C9 
X-CRM114-Status: GOOD (  27.51  )
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

Hi Krzysztof,

On Mon, Mar 2, 2026 at 2:59=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 02/03/2026 12:58, Martin Blumenstingl wrote:
> > Hi Krzysztof,
> >
> > On Sat, Feb 28, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On Sat, Feb 28, 2026 at 02:58:37PM +0800, Nick Xie wrote:
> >>> Add the compatible string for the SARADC (Successive Approximation
> >>> Register ADC) IP block found in the Amlogic Meson S4 SoC.
> >>
> >> ... which is fully compatible with g12a?
> >>
> >> Write proper explanations.
> > Would you be fine with:
> > "There are no known differences between the SARADC on S4 and the one
> > on G12A. In the past differences between SARADC on the different SoCs
> > generations have been uncovered late, meaning that a dedicated
> > compatible string has proven to be useful."
>
> No, last sentence is redundant. You do not need to explain in the commit
> msg rules of bindings, because they are obvious/known. You need to
> explain the hardware, e.g. in this case the compatibility between devices=
.
Understood, thanks.

> >
> > Do you also require Nick to add amlogic,meson-g12a-saradc as fallback
> > compatible string for amlogic,meson-s4-saradc?
> >
> >>>
> >>> Signed-off-by: Nick Xie <nick@khadas.com>
> >>> ---
> >>>  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1=
 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-=
saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-sarad=
c.yaml
> >>> index bb9825e7346dd..5496a0dc714aa 100644
> >>> --- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.=
yaml
> >>> +++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.=
yaml
> >>> @@ -27,6 +27,7 @@ properties:
> >>>                - amlogic,meson-gxm-saradc
> >>>                - amlogic,meson-axg-saradc
> >>>                - amlogic,meson-g12a-saradc
> >>> +              - amlogic,meson-s4-saradc
> >>
> >> If this is compatible with other device, you need proper fallback.
> >>
> >>>            - const: amlogic,meson-saradc
> >>
> >> And this one is now kind of fake - how does this device use it?
> > As you have noticed later, it is currently not used.
> > Can you please confirm that my understanding of the next steps is corre=
ct:
> > - you're expecting Nick to omit the amlogic,meson-saradc fallback
> > compatible string for amlogic,meson-s4-saradc
>
> Not omit but replace with proper fallback to specific compatible.
So in this case we need to end up with:
compatible =3D "amlogic,meson-s4-saradc", "amlogic,meson-g12a-saradc"
Stating that the S4 SARADC IP is compatible with the G12A SARADC IP.
Any S4 specific quirks that we need (in case we ever find something)
can then be managed in the driver.

> > - and you would like to see amlogic,meson-saradc removed (from the
> > bindings and .dts files that are already upstream) - I will take care
> > of this once S4 support lands upstream
>
> This no. It's an ABI, you cannot change it. Not worth it, either.
You suggested adding a comment stating that future bindings must not
use the "amlogic,meson-saradc" compatible string anymore.
Since it's part of ABI we need to keep it. So adding a comment is all I'll =
do.


Best regards,
Martin

