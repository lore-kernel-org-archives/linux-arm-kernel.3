Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53C4C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWNHRRlLGAtt8jzmaA+9D/ojUTlN4AK1HzcVBXaO6JU=; b=egrn1Mw9O1RiY1rfTEm50rKWZX
	cUdXEa1ePWQy1y3xiXKgJYsV02iN3cxjNPwAuozWl1xmabZuk4CRIsIvEGeAb40a5dBX7zjCZTQ8f
	XLkJ9CLhwwVl5/TIQfU65ePRGA6qRYeWNzXhfuc4OmXiJA6QIx+6cMrtHbJw+S996M2cVA/Kf7+U6
	5CeLA2+524/1e4zJq1xvpKx6Khh7rIeAaar1nKR7RGDc7uMBKoxL3YT6nAfUBKbf8bGeG6X36xj0I
	whVhm/MjxD7265uZhai0iP+FfKfCwXm+J1W/X8yRnwH53gKDXZGuzwrHRMt4faHXjHsMUN7DJMH4S
	7CX/v/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57xI-0000000AdFs-05uE;
	Wed, 16 Apr 2025 18:57:52 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57vR-0000000Ad30-3pNK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:55:59 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-47698757053so80743011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744829756; x=1745434556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWNHRRlLGAtt8jzmaA+9D/ojUTlN4AK1HzcVBXaO6JU=;
        b=hFdzclifdi3wbz0CV/zgQTkVD+mF7MoCHZvPC0FvNlSFFZF+sx5AeoqKSuZV/QSYSd
         U+GrwPA6DeyxMBJS8o1ogDB3mvUikw6rDde/JDt3pz+m9Kbx8QmheI8TlSp9/SQtCta2
         03NQaOKU+to5Mktp8Qe1vFph+pbDecgKHp7Eu8NufQ1YTzullmv5o0zI7g1bXtJ9e08t
         89smjfrObwDjaLw7aCGRhZfh/7HPjIjwZCaMUhwkLwhYATWR3q2hkrISNAUm4/b/uNgO
         W+EEkBlBnw5jtDpdKXg1WXKALAEo40XOBMxgXm8LJUXJVEMokkkRSxISCFsy6vyaI3RA
         Uaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829756; x=1745434556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWNHRRlLGAtt8jzmaA+9D/ojUTlN4AK1HzcVBXaO6JU=;
        b=qCy8J2QvhtMG6FfR1fuGAMxvNbokBLHidvUSEFRO3rX7E2UYGtGLEZ2u+GfZcxSEIc
         VEbID6sQXYBL9e1ptlluMIIS53yqqv1K/y8P7MyadkIpq5uP/TG/DsU6uEECt3+2o/l7
         dK+vxWaYRVs/Mxc+MgKrFECbpYrbwhOAIDPCb1IAyOihkBle4p6GYqJz1KsjvC9yXb3i
         RazpWuVqwiTnGdJiAgBHC6LK2Ef0G1iTmUYLr3APUobJOcF/QFSbiulS/5TSzlrZ6iBS
         l8BA7/asA+pTYfjY32+cAzJYgQoz5GeWxe6O/tALtI9FF0ERiC2T3Dzy5uofs6yY3vDn
         cCVA==
X-Forwarded-Encrypted: i=1; AJvYcCWFkSm8a4/KHBu1vEIXLpQIIrNm3ltbTzKt9t9VTUa6zNQZMGqfHV0wUOZXOlEdrtfjcb+QDLOT5+7BcM+md52u@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+YwekzRw5N+fQGLHQs8m9bnLHqi1YJ4a6djEk75QSChBuZUgL
	aURtSW09NMW0Q6ghM/QPL7VJd7FaY6KWju15sS+tJJR/2cM0pednKCi4RlEAG79Qx9d7hwBVIfG
	7CFmKEXB9Kv9XpsS+Um/vxDfJK4E=
X-Gm-Gg: ASbGncv+Tlckb9qaZ7uOEWs0gXen0fBWZFgTQgIwfMPAGUZPd6VZmYCIiO3LNk0X2Io
	9F6VfDScK7zgIccJ6tu71j+vfjmZcNc7YKs9x6v0HoSGGAdBhftmvCvAqwUCAYwxPkN7yOyDpzz
	7ZthHSp8/74nYwIvuroVyfHdOCxaAWImQqB+sCHKSuIalkP950g6d3svWtMB+GeZk/4Q==
X-Google-Smtp-Source: AGHT+IEhXho+Wj3++MUDdbSnogTiFF+Hc7VltlvllgRmDoZ0RCwCinDjkFA7Fi5dWwvFAGxwURkTH52ruMHAO7zWqFI=
X-Received: by 2002:a05:622a:8cc:b0:477:419a:a3bc with SMTP id
 d75a77b69052e-47ad80c2674mr42168791cf.27.1744829756648; Wed, 16 Apr 2025
 11:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com> <20250416155442.GA3255418-robh@kernel.org>
In-Reply-To: <20250416155442.GA3255418-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 22:55:52 +0400
X-Gm-Features: ATxdqUFabw8TyNaRZlXev_Uf452FGKx5MvA3J16s1sRuFs46iscEw3eoNHUowzg
Message-ID: <CABjd4YyPzZoX98=FMwr91BG2RhYc0r5=9P-2GGAbR0s043duPw@mail.gmail.com>
Subject: Re: [PATCH 00/13] ARM: vt8500: DT bindings and dts updates
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_115557_948263_969F1470 
X-CRM114-Status: GOOD (  22.88  )
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

On Wed, Apr 16, 2025 at 7:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Apr 16, 2025 at 12:21:25PM +0400, Alexey Charkov wrote:
> > Convert some more VT8500 related textual DT binding descriptions to
> > YAML schema, do minor dts correctness fixes, and add a DT for the
> > board I'm actually testing those on (VIA APC Rock).
> >
> > While at that, also describe the PL310 L2 cache controller present on
> > WM8850/WM8950.
> >
> > Note that this series is based upon Krzysztof's linux-dt/for-next
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Alexey Charkov (13):
> >       dt-bindings: i2c: i2c-wmt: Convert to YAML
> >       dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YA=
ML
> >       dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
> >       dt-bindings: net: via-rhine: Convert to YAML
> >       dt-bindings: pwm: vt8500-pwm: Convert to YAML
> >       dt-bindings: timer: via,vt8500-timer: Convert to YAML
> >       dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
> >       ARM: dts: vt8500: Add node address and reg in CPU nodes
> >       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/siz=
e
> >       ARM: dts: vt8500: Use generic compatibles for EHCI
> >       ARM: dts: vt8500: Use generic node name for the SD/MMC controller
> >       ARM: dts: vt8500: Add VIA APC Rock/Paper board
> >       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
> >
> >  Documentation/devicetree/bindings/arm/vt8500.yaml  | 19 ++++---
> >  Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 ---------
> >  .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++=
+++
> >  .../interrupt-controller/via,vt8500-intc.txt       | 16 ------
> >  .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++=
+++
> >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++=
++++++++
> >  .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 ++++++++++++++=
+
> >  .../devicetree/bindings/net/via-rhine.txt          | 17 ------
> >  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++=
+
> >  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 -------
> >  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ------
> >  .../bindings/timer/via,vt8500-timer.yaml           | 36 +++++++++++++
> >  MAINTAINERS                                        |  7 ++-
> >  arch/arm/boot/dts/vt8500/Makefile                  |  3 +-
> >  arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  5 ++
> >  arch/arm/boot/dts/vt8500/vt8500.dtsi               | 12 ++---
> >  arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8505.dtsi               | 14 ++---
> >  arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8650.dtsi               | 14 ++---
> >  arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8750.dtsi               | 14 ++---
> >  arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  5 ++
> >  arch/arm/boot/dts/vt8500/wm8850.dtsi               | 23 +++++---
> >  arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       | 21 ++++++++
> >  arch/arm/boot/dts/vt8500/wm8950.dtsi               | 11 ++++
> >  27 files changed, 386 insertions(+), 165 deletions(-)
> > ---
> > base-commit: 62db22c2af6ce306943df5de6f5198ea9bd3d47b
>
> I could not apply this series for testing. What base is this? It is
> unknown to anything I have. Please use most recent rc1 unless you have
> a dependency then use recent linux-next or a branch in it.

It's based on Krzysztof's linux-dt/for-next [1] as mentioned in the
cover letter above - it hasn't yet been pulled into today's
linux-next. Specifically, this patch [2] from Wolfram is a dependency
for patch 10/13 in this series - the rest should apply cleanly on top
of 6.15-rc1

Best regards,
Alexey

[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/commi=
t/?h=3Dfor-next
[2] https://lore.kernel.org/all/20250330193833.21970-12-wsa+renesas@sang-en=
gineering.com/

