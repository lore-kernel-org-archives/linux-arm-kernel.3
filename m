Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26843C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMda9b2M0HE7bDg1/E+8Yg0zmUKaV5CLAKi97xEwv68=; b=1a/D+Lvg6Rkh/gcjSRXi+QwsJE
	E1cizJYUOddG86NkeEu7T5p8OyIKjNquV6QyMszGI8p6DfjN0zTyHvhUau+cRP+R2AeHKE0CSrHXE
	NIXX9ELX0Rdex2X7UJ1zwKApI/eCMkvi6ORwNJLgm6C3fQub5uaHCcxy67/8boZAT1C6Y7wJFi5pH
	HPsn0CkzHE8HFdXreth/G9zHL6g85WRz1F17eZTOVWMs4kGT610qW9Se1DwiFc5J0rNnUnFNoyhVb
	sYGFvBNUz+xxO2Lx9XeZWHthDQONJtFxAkocCwiulU3elLphjk4uC7uiEbn20vrBIzZEuqZqZirUX
	Ex2y5TVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iDg-0000000AvkB-3r8B;
	Thu, 24 Sep 2026 12:06:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iDf-0000000Avjk-1sDW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:06:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38B26441F4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7B01F008AB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251591;
	bh=AMda9b2M0HE7bDg1/E+8Yg0zmUKaV5CLAKi97xEwv68=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AN2eipIwmtVZ4M5Ny3OwliN67dMXjEm7YmJn4+ad6DexfVZp3CDJtiYnaoFksqodn
	 mwZ1b4SVH63NPUXV2EYeIbJRRnrYEqDgJ1aM+hTpYkpLxQ5NV73qb7D1u2ByBnsLeP
	 Zl/DJDHTqT6OiaH1vubVrlpERsPaD3Mgx1WPdPuV2fXw3E7nHMRQJbcEbRckmRj7yG
	 gAfxCXLubigONN5I0PrBpD2HatKrJBxPWMsz/eb3BPSEVakQ0QFCs7J7hyRnjtVFT/
	 4LqPzByO1QeWXrKGOuxdQ7j+UV3m6HYuvu8nlQbIgjj6b8xSrvdI9ggm13W8104LNs
	 lIZXxp6e0q25g==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so1721983e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 05:06:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwoM3T0FxBbWupYWnfGPjDQ4ZAfdSrXXmDgLzUA+iYuJevAgJpENg4dPlyjp6peIXgW9HUrO3w0u82lS7JpmWIu@lists.infradead.org
X-Gm-Message-State: AFuF++nvaFwZs4QWHXrHJEkNui8EHG+KCvCAz95S7yVb/ckHbQX8BeLK
	UJK3wirywup/aEM3O0FZtioY+lFA25OS/zwj5Ny1d2bgjjwnoXLYr+vUC39p5g0yUfEDQr6yBn2
	xUuRS/eCCman+s4NkmRd37sKLXRUd+rZFf8YQwS03BA==
X-Received: by 2002:a05:6512:1192:b0:5b6:423:9fa7 with SMTP id
 2adb3069b0e04-5b8df1f3ec5mr826739e87.31.1790251589716; Thu, 24 Sep 2026
 05:06:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:06:28 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:06:28 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
MIME-Version: 1.0
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
Date: Thu, 24 Sep 2026 05:06:28 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdx6zH16Ej-7EDVw0cKix7+h2tOxSL8pc1PiXhptA_R-A@mail.gmail.com>
X-Gm-Features: AclHuK_9ekJ2IaIbciUj6wKN51mS4Pn8kPTOGKYEK1UcTaHgO2MIe0OH-x_Yx30
Message-ID: <CAMRc=Mdx6zH16Ej-7EDVw0cKix7+h2tOxSL8pc1PiXhptA_R-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>, 
	Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 21 Sep 2026 09:20:21 +0200, Petar Stepanovic
<pstepanovic@axiado.com> said:
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions, along with interrupt support for input GPIOs.
>
> This series adds support for the SGPIO controller found on the Axiado
> AX3005 SoC.
>
> The series includes:
> - Devicetree binding documentation
> - GPIO driver implementation
>
> The driver uses gpio-regmap for GPIO operations and provides
> controller-specific interrupt handling.
>
> Tested on Axiado AX3005 platforms.
>

The series looks good to me so if there are no objections I'll queue it for
v7.4 in the next days.

Bart

