Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23275F483F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 20:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=; b=f/fFwvT2YSImj8HtuyyPt+Y7nY
	fJGU4O4x+kRdk6hmyiUDkt5TO8Al1h2hM0fYWP6ED7XgfmVk0wdBRkZ+/YYS+g5ihREPIvv083lOY
	gTqwSqMW70Rh9fp8ef/n/E3IXsKGbv3vWjr4A+5qoy4RHztM7G20m+muwRwYWbZoYW9PEb9SJ6E5z
	9oVI2YEE4AR2Jd4/lmlF5nLGZn0lxM/7wlPzPWdvYFhGBSxeHHU2OiEVir1rW3dogMuqvUZU81M8u
	NHTBBqz4Wsqa61Xthm9qxKDKTO49ox9ivZPG2/p4HeQ3frOGslkZa8q9r+Ov6A/wR3ji/W+4rlYox
	CZJmWulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4llj-0000000HYRv-2e7p;
	Mon, 23 Mar 2026 20:20:59 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4llh-0000000HYRa-0EXx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 20:20:58 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-12a80c36350so1873691c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774297256; cv=none;
        d=google.com; s=arc-20240605;
        b=bHe7bgLaYs8zHhHcuKWJAhHbLlAqCQ31uM4fT/L0ODRdq+/nzRnZu3UjjkJCRJQbfp
         14iBsIJtF3CUt0tkevOwE4bVrQSViPbYlEuXbAhJPgLc7bsaebdkRR3PZl/VX3MA3zPy
         foetVJRxA+KZlbjE5SMowKZKW8YXRM6+Cqabv0tiME8asVNI2Yb0EG1Qz5sPAT2dPXLv
         hWPcFteUpAA+BoN3f2ndG2xbqgSO3ULRzRCFwmL7Q1vbKLt3hP9wQBxjh2/E8Fr7PE5n
         m00qs2bcvPBZRatD6Ww6NcKTau4dzAeA/ApRaTWjND8nkdzrg7RR3xj4iJ7enWDhXDO2
         oLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        fh=VcsH9IkIqya8OEVChgJDrhKoPgVjZ7Pv62fhPJC9Tnk=;
        b=LaiqwS6pTDRamt+WoxUVisFk9vhqLqJhHE/EUaIRHPLN8VAhUm4QwK9a6/EFMCdChZ
         jBtepkU2PA/NxHil0S1Y7YdwQtvht1sL5COo2FwgsWFj/201VnFyQ+igrkXLqvfPwkXQ
         MUl2fBKEv9/oR1weqr2bNYnD+BQI8NCjzwj7+t4toswpSzVJZ9ACzbxeUj+qq/xze1HU
         YWH38OR16cao1P6tz8j3RyC00mhRnR9cpW641AvjC+XTRmqhVSKZC6sW2n7BHI5tSPUt
         mcvKamUEg6nfdC1gRWr1q8+ytA2hZZhX1jiWfHletkJmSRawjcMwSGzagL7JDrS2lxOn
         duNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774297256; x=1774902056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        b=e/S5Mi9b1umiq28VlQLDqbrum++qV1NnfRG0VjqGaCj4Du8rfE3pKe3nVZT2NBPo9L
         tPhQ3iPDUAr3QSqmqEsB2+nInD90XqpLOeUIDwimulyzp3hGMxFlYopIAWcEnYJZzLet
         +L5ycGKb+BW/yKChnQCrKrJROclGbZtPvD+BoLAvF5dEEck2QCThoY4e/R356A69d5zG
         jugGYA0Z3T0QE75Su9zYxJIG+moWjKPgMx10Xt5QySUM+tUuS9Nb3zotmZHPNFgBsWEx
         yOW996xfNc/BBmGOW/Gqk3kTWyRbl5bJ7I52gRK+ZvDD1iQnd5X90fbS8DAQ4mKfB8ql
         8pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297256; x=1774902056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        b=bSLSSXO0+lVRx1q4BQFmRCszEjJLEMJG6sBmsSoxw7xyhrDSooMFdXrzjIMuy0DZVS
         2jYdcaqoTLGOyaY35sdrIb5ntjEA+6+RYcg4x0v/Ft0rk/Rrd5BrUgMBXt2uNvetztYy
         TcDxvx7RsOeLZJuveTjUvH+gi0H0ApVVECVsuOiB2yqEnXutrYH1EJ5UZXU9tiAIEAMT
         KrVUL4s1/Z1BsXNdrYs/XRrJB8QgTiJ9TduO1AOVMq/pBGgWZXGk5x9gevVEzD6UmUNm
         /ComBjqHpqoRkO+Of48CdVXQKFQ0iO08wnVlz77U4c01elBiQgys6KUxNXstPM8JYzH8
         YFTw==
X-Forwarded-Encrypted: i=1; AJvYcCWUMW1Z6lzgsXXiD2h4xen/ZAVLIorC/t5mnx2olSwvoD+to8zLU9adL0CFUwvZWTgRSPuf3wTjMyfc7d/NxUph@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9oFmxGmO4XSg0PBrFGSkUSX2dbFVtPZOoQ75iAkzLXpYw6woX
	ZsHWRCEJPydHpj25O4Je3kzeRu4dVjJOt4qwY+GBKSSPw6Sn90DiUS5Xz9nOVEkzN7q4e8wI0rj
	aLYDmWwowRtpQHjTavuzJapAKfPEbytU=
X-Gm-Gg: ATEYQzy7Pa3lNWRs0QKzysfrI23BbHNpIju2BJffuxw5RR13kPwpuh/FMmddXt0H0tt
	7HVpkwg2o9dE9LoyufrRTV3ix1GZFdpEUh4LSh8m45eFBOUfWo0Tl+iG/+7Rx7MTgAn416Y09Sq
	+qyJ6bPGAs7eGAQIa8OxkGdzMVkLFZA1JrlELDiH1KNwhwMI2VMDDH+ABsJFDD5l5pO3wfrwtXR
	JYIdrgnI708IOlM+B0RItmafh17bARjE8AJ1luOrySOdZ9ARtXAErzn/O6OOkCkSV3L9q5rlhkw
	RgUBa6xcdLbD+INr0agRlrpaJKilP360cKMIrKn6ymyGV+HAfHF/sDQz8By/UiYsFNR+NtgiMfa
	IoTZEZhtKXg830RksD8Q5mVAfmS3UoLxJ
X-Received: by 2002:a05:7022:6713:b0:128:d1c9:3633 with SMTP id
 a92af1059eb24-12a7265f60dmr5589793c88.13.1774297255634; Mon, 23 Mar 2026
 13:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com> <20260323191529.GA1054724-robh@kernel.org>
In-Reply-To: <20260323191529.GA1054724-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 23 Mar 2026 22:20:42 +0200
X-Gm-Features: AaiRm51XzKk2n6IioMvqGKwYdcIMaisSl_WziBcqMgfR8j04ziwnDez8lFdfqYw
Message-ID: <CAEnQRZCbGPqBBKjQiGB_pRj_8GYMFXXXVmpfsU0_AOjo3J5cPQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
To: Rob Herring <robh@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_132057_101018_F087C833 
X-CRM114-Status: GOOD (  19.30  )
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

On Mon, Mar 23, 2026 at 9:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Mar 12, 2026 at 08:36:56PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Cortex-M[7,33] processors use a fixed reset vector table format:
> >
> >   0x00  Initial SP value
> >   0x04  Reset vector
> >   0x08  NMI
> >   0x0C  ...
> >   ...
> >   IRQ[n]
> >
> > In ELF images, the corresponding layout is:
> >
> > reset_vectors:  --> hardware reset address
> >         .word __stack_end__
> >         .word Reset_Handler
> >         .word NMI_Handler
> >         .word HardFault_Handler
> >         ...
> >         .word UART_IRQHandler
> >         .word SPI_IRQHandler
> >         ...
> >
> > Reset_Handler:  --> ELF entry point address
> >         ...
> >
> > The hardware fetches the first two words from reset_vectors and populat=
es
> > SP with __stack_end__ and PC with Reset_Handler. Execution proceeds fro=
m
> > Reset_Handler.
> >
> > However, the ELF entry point does not always match the hardware reset
> > address. For example, on i.MX94 CM33S:
> >
> >   ELF entry point:           0x0ffc211d
> >   CM33S hardware reset base: 0x0ffc0000
> >
> > To derive the correct hardware reset address, the unused lower bits mus=
t
> > be masked off. The boot code should apply a SoC=E2=80=91specific mask b=
efore
> > programming the reset address registers, e.g.:
> >
> >   reset_address =3D entry & reset-vector-mask
> >
> > This reset address derivation method is also applicable to i.MX8M
> > Cortex-M7/4 cores.
> >
> > Introduces the optional DT property `fsl,reset-vector-mask` to specify =
the
> > mask used for deriving the hardware reset address from
> > the ELF entry point.
>
> Why can't you fix the ELF image to have the right address?

This is a good suggestion! Or parse the ELF file and figure out the
reset address at runtime.
>
> Or just imply the reset address from the compatible? It's fixed per SoC,
> right?

This won't work because for the same SoC depending on where you want
to boot from (e.g ITCM, DRAM)
the reset address might be different.

