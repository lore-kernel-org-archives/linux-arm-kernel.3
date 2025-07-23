Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5023CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=; b=LHR+5YXbwbf5RFa72OPSdKw6kr
	h8sADXWuHxz5JjnKuFc4mshRcc2O8093MHmnhsWJyMVpTqegPNL5Z+MQ+KB1eVRFqy5Tc0y+n7sxc
	XA+4OuOvJ+O6boS9OsM5lfz0GcXrP8ypF3a3u64MjtbfS9/0HUMHhLQoUMw9I39m4Gtpe223k5W4+
	pEO6UBZtW5wb5W+4M7fef/LNmMZ80f1DtoM6KbUfl6lbVhDB9Zlep6OQU/MH4Ywbk9a7Anksvr/So
	mhmzHpwCEo07pbuoNvYrBEOJHJnpMduhSAn5YJPUN1LTS34AEzB5yap+Ix+G7LMUoOKNlnwLgU87I
	TcHDdpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVMK-00000004S17-2spJ;
	Wed, 23 Jul 2025 09:01:56 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUnX-00000004Mza-09Wy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:26:00 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-879d2e419b9so4201141a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259158; x=1753863958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=DFT1ZCJHMZcPYrQJQzRnqa/m1n+9S/2uoZv3KXxjY1B6ZS6sc5vXurJiiQ+DrQLBKP
         ajWZgcrnUPHZoa1lkxeTvTdHRfcyRsqyf0+5uXYbMI5UcEP0RVKX6bKyfMCdA6sH3oXl
         tIwMKpyMyYQ2gvKoozvIO4KfXyv9Rs8q2IVnJWEaKJmdkfmpw7XIfbW+HLgUnrYucx2K
         Gu9b28N5yfup8su49Wrd+e7TzCCCUkJNdwiNfKDDtk8QMXfy6qTdkg2yAsD4AwG7G2My
         mlh8UScyDjf+iPQrYwWqWyRG8iYgPz5p1X+5+03Ri1h4UGLRtJkz7oiYoUMeTCIdOEGB
         G2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259158; x=1753863958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=Chcfu2zg2KDhGJahjJE4w1AddStCt+j0SdoNBJcmrZcRxNlOYetLcyyF9OjB2Hngjw
         SdBJdny++SNG0eDyt/gGj6/UUOIGdgpr3Dt1YDp71VpXWDCojVM1Sfb5y1C+W1WRaUkV
         8rBpzMlIGtzrmn7Elw96T7RE3enQ2Mu0nX93XuCi/Gl6ZkNygPWUMUWnvejGDYl2+qSd
         TTBUmUynXXzbZtCiK6gFXBbUVmaeixy3x0YNtJSHGPYY7dJstoNBpZlCLN+qXfoe6t23
         cZlkdvr71aUp46DQ1OA4QUuF5OlUrSgD0SOdIAEs4E00u0r2rchzqWGkFcwaodUPgL6+
         kuGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG89EiFZ9P1R5GvScwRSsO/JfN+ssfbdRGs0hka4237lHdUn9TaZOTnWvYhSh0rdzon5CtRdDCAEoOyHtVM8AB@lists.infradead.org
X-Gm-Message-State: AOJu0YxhWtpinI1Rbc1dXI03pY0AMPT5y4+9b8uhhl55GDCQZZuKIxr0
	jbNDWEB1rtaBbTD1WH2qRso+YfeZu0/iz9UiRlQp36fIHj+CAZLVOFpPH3GMfRdWsYQOEqUImei
	Tzsxv5H99iK0dICS/GprHF77UWZjCmPucXnijREZewg==
X-Gm-Gg: ASbGncvRjyvV0+229JP7potaC2f/waLbqkp0IWCaSialAKXN5teo5GR44uICkdXZf1r
	NB60Pem+t28KaiHIWRbLiRCvGh277SvYf0+zWnJnVDWGVN/A/dmMvmxbYycs57GFKiwloVbP4be
	RkSA9O7x5qKq31dKRAVpmoqjX+XBGQpyXGitV9AfJ2X4BNYTJd8BtEuBObGXrN+34zMVVydgvJK
	oMMe/i3qKlN4oY/aR9mzxEm5QN8bFvhwcFuQygfqHChWxY4
X-Google-Smtp-Source: AGHT+IFzwCafFosCdx131zbcEFY3D64m+7mo0loj5vAsYVkMFUgy5UAHuuRGjg5yAkxctR2cI5zO8+e+kqhHgdsFxCw=
X-Received: by 2002:a17:90b:53d0:b0:315:aa28:9501 with SMTP id
 98e67ed59e1d1-31e507dc7b4mr4498294a91.24.1753259157929; Wed, 23 Jul 2025
 01:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:25:43 +0200
X-Gm-Features: Ac12FXyLbBDcOzrp8fBxUqR9jIu-gUOTaGAF4LxjwERQBqGacqdoGbliH_T9iv8
Message-ID: <CAMRc=MdFoAa2omJgL__4mRqX5CYyhZ3VU_Uy-Tf1oPSuZdV93g@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
	linux-i3c@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_012559_185136_CEAB5FA8 
X-CRM114-Status: GOOD (  13.54  )
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

On Tue, Jul 22, 2025 at 10:16=E2=80=AFPM Harshit Shah <hshah@axiado.com> wr=
ote:
>
> -------------------------------
> Hello SoC maintainers,
>
> This patch series adds initial support for the Axiado AX3000 SoC and its
> evaluation board.
>
> Change from v6
> - Ran "b4 trailer -u" and add reviewed by Krzysztof
>
> Add soc@lists.linux.dev in the to list and send this series again as per
> suggestion by Krzysztof and Arnd. Thank you.
>
> Checked locally and able to apply these patchset to soc git.
> (git/soc/soc.git, for-next, checked commit: 7dfbf3176d886ff9a0c7786942d3a=
89809d0641e)
>
> Sorry for late request, please consider this series for the 6.17.
>

I can't speak for the rest but do you want me to take the GPIO
dt-bindings patches through the GPIO tree for v6.17 separately?

Bartosz

