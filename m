Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD74AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cH0/G8dnIsLEQps0a+QRu5yJlelIyIdUnSqN98914W0=; b=DMGfUtP4nqnyga3iD5as2BIzBZ
	xsxVqbccjQWhinF9t4cZzqCMhncyHu3avaFcAWrf/nT7xQtOghBP5FdWGgGy7lYCbzZM4pahuVTLQ
	ECA6uYxbzBYY7g9bkK+XY14OiEgyCJjJ3zZo8oKwkJIgA0zCLPUm6Wc/WjtV3LswTFyFIFNE5WvcN
	2VFpA8ZtE45ZlTNfWeTidTd46GKt9T1+aj/PtIJRTZLllTxT5dFaGbBdHu0l1K5rQDSRMNhs7qbsD
	9bjrs/kAdbaqIdcRi+nc710keDgzp7wTQ1P93E1qs0b1Ac5tssA+GQHheOWlM84aYpTKUsHR13+CV
	rpKRb4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRC-0000000AdbS-3xGf;
	Thu, 13 Mar 2025 09:01:10 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseFl-0000000AbMj-2AfT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:49:23 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-548409cd2a8so795419e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741855760; x=1742460560; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH0/G8dnIsLEQps0a+QRu5yJlelIyIdUnSqN98914W0=;
        b=ZpGK+VyJnXvvFsBUjdhjJuQelBQ7lGpNUgwTkeDKzGI41ss6tDJig33MVFcnCVYmXW
         ryeuF1kLN6MEA+ndH2M/Ku4ATgY0chzL+2OawSpW0M1CECMAH7ijGLmeKiBt8Tr8+r0K
         8z5AXqAy4mM2PTHijYEEL0pLw5Vz/6oh18JKNwi2j5m3lDIudtCUfozHJoo+6KyoJKZH
         N7ihcGSy7iLqZS/VpT2BiWnFuDG4ne9NFNr9stOki2OdNLLeSkCZWk5bSmxh9QxzEYPb
         N8jXzsmoL6XS3Tx/3Qztbpsl9HtoqAldE1UKufIRfDHycUnShEptc7B+gF9dqQSgWPzx
         hKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855760; x=1742460560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH0/G8dnIsLEQps0a+QRu5yJlelIyIdUnSqN98914W0=;
        b=bXOhLUxM1hDK4NZqVqys7PNmC58SgZtY3m4143g/NFvvIU/HJQfFGwNNvBEQMEvfmj
         S0tk7atxrjSnLy2zSI2VMyi4svZ/7xDoiVexYUoLVY93y4zZbFVYn2ZKBl0HWk5MLNJP
         i7lh7G4FZyVZvLOmd5nx6CncjT5dUREgTsItPkcIL5oT2LyqGa2jK+yoUy+n2PVPHlIy
         HHRHOR3FLjQ1fs9I2IT/uIYOcT2f2zvzPBPuRjA5nZJfzNkIVvWuz2UcEvrwA49ZkpNo
         kBoZkT9vt88p6r1261EsF4Kp4pa4xR4RB9EsdyAjpNjastM2rzgs0jbdgtlywCFhSps2
         EP0w==
X-Forwarded-Encrypted: i=1; AJvYcCUUvY8rpvrRMw8frujgcW/syb+HOdhJstHlSVF+Tl1zn6xxQhlWzxVmPYgW0KkMFtzAtH6G/NdlRqVwg4BAQYAr@lists.infradead.org
X-Gm-Message-State: AOJu0YxdIFq6iaaBHoC/FdNxXT1IE2bn+dj5V/uCoyzxZpT1vWsasuHx
	xb2HJtU8JD8x7fvILqlGh0FP9MMo2kN6aQH3K78xDrCW0RosD3+gdn/Q1SW3Q0iIj0fNxY1R3xm
	OWcJ1j1wS0yjcBS/F4RhmmY4h9iz4l0QOjsALVg==
X-Gm-Gg: ASbGnctEwDV/KfbyXNSxSRXSH2m0mF23UZAr4/kCOmPaDhHjGxZXIbH0pdTua+N4Kbd
	uHpoRkFXY77tSahNn4tZLrUCkzH8h+n3llcIWCvKHV2pa54+eNFLwVI9Cm4fkxpIL8MJmgKOgv4
	UjOcV3f2jm8HMp3II31x6hUwcHFA==
X-Google-Smtp-Source: AGHT+IHZkAfEyI5h1xNp9EscwBtm7RYtlJrFqFkZLqQeebsL2P20q1EFV/vAiiJ7hbwVCtlIBk24ytpLzUux5mvsmjw=
X-Received: by 2002:a05:6512:ba6:b0:549:5b54:2c6c with SMTP id
 2adb3069b0e04-54990e673f2mr9060936e87.23.1741855759797; Thu, 13 Mar 2025
 01:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-2-ec4c382e3bfd@kernel.org>
In-Reply-To: <20250311-arm-fix-vectors-with-linker-dce-v1-2-ec4c382e3bfd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 09:49:06 +0100
X-Gm-Features: AQ5f1Jr7N3AP_OP74JY7L1V0VadIJIbOxnWg4sgQC81ix5N9CYiTFnZob5PuCj4
Message-ID: <CACRpkdatTYZ9oxSBdjTbs-LjF3ONqcA-9vYojPc-KSGZmoEO=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: add KEEP() keyword to ARM_VECTORS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Christian Eggers <ceggers@arri.de>, 
	Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_014921_559897_F3108D33 
X-CRM114-Status: GOOD (  11.12  )
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

On Tue, Mar 11, 2025 at 8:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> From: Christian Eggers <ceggers@arri.de>
>
> Without this, the vectors are removed if LD_DEAD_CODE_DATA_ELIMINATION
> is enabled.  At startup, the CPU (silently) hangs in the undefined
> instruction exception as soon as the first timer interrupt arrives.
>
> On my setup, the system also boots fine without the 2nd and 3rd KEEP()
> statements, so I cannot tell whether these are actually required.
>
> Cc: stable@vger.kernel.org
> Fixes: ed0f94102251 ("ARM: 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_E=
LIMINATION")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> [nathan: Use OVERLAY_KEEP() to avoid breaking old ld.lld versions]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

