Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A268CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TceoMbVPyrzcVBNVbAOHGzxGRGxrO0zSw59TjOdJc7U=; b=enx32ik5++KyRRRR4wrufsbBA2
	eGnooFl/w0AugylrauKGIxebmp8jabieMM2Upaesqt96uhabxdm7iakr0/S0WRzyx0X5gpee0QE2o
	yUFv+6u38OEjVe+lWvFJYjTBee30dmFOlo3OavwzpN32u6n109iU1zO77oLwGhoDm3sLCbbqT6yCA
	CHV6BxONsCLJVEi9iDfOZEMojWZqcRI7YEpz93/uLKDxAbqOLIGztHThjOo99ToI7f8PkZbnPSZYW
	wJUGnekcpb7LC3IYkaLxPtdUH2pQBwOeBpQ8Wj/rZvTE+udLUjWf5OnZnNi52MXOZM+YRpbFwZPcn
	Dt2zAXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpjn-00000006yEe-0ddn;
	Wed, 03 Sep 2025 15:49:31 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBa-00000006W2r-2a80
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:06:07 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-560880bb751so1335245e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756904761; x=1757509561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TceoMbVPyrzcVBNVbAOHGzxGRGxrO0zSw59TjOdJc7U=;
        b=PtVqx60ERm5AO6nxCQMjAB0R/tyog1gxpVfDZxC9JXLDO4zUHNDEhyd0jZEkvgnVbK
         SN6jwWCWBJeS7cuUchJap0vJH2C+FEHfnlnAUEqTbEeTF0IIDG8pfIL/9FXxXr5GPzfr
         YUilwJi6t5VfovdHv9R9HV5nyLNBv1J5CvaXkPWyEgmtR1SnjCVyhA7oo+0zVp3ad9Gw
         6BW4JPHz0+WSLdMiZw2tYAYC2OzkuABxBaNJ/Sb4KKPODFvPOR7OCq4JdDgZ+b8+M48t
         MD6knMifX4Ca65vdiDg4QKY4FM1nGxJo760vJtWEwuErYAUte8WDNDJfxuWAnIRjm8Xq
         fCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904761; x=1757509561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TceoMbVPyrzcVBNVbAOHGzxGRGxrO0zSw59TjOdJc7U=;
        b=feIj+A5lpI3bXJl825epg2lUXUNr+5DY4hWJM0NEkhAcMjhWoajM1FktI5r5dRGrzv
         NexsKykrM+HTaB/81WoCIN2kD/C/3zIm/iSCwvj03l3zq9u9ciDpNcoslo8yyCZA14Cm
         q43PlMdFnXbt4Mn4r//9bOmae9Lvp5FwZq7edLotxYSCg2gvyyePzcKuYelC5E/LuuLh
         1rgjTlAiYa7j/iFFGrPhPj+9h7OHV3GF/E+ziSqX09sD+6vsib17D1fSjWXMq/IU8G8G
         7qQ6pRg4/A6WvBTzDQeQ31ONvO74atLqh3l1faMPfH1Ky57BOcbq3kuFt7TvquwsvpkZ
         yfCw==
X-Forwarded-Encrypted: i=1; AJvYcCXge/s2bde3+ws0dM/2ImbKBpOntFi7mF7A3pxMjyuO/N4zx6jiUQg/oKTPwB6xpIcRsyc4DP1aVIZk03i3aaRN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9/9/7MfBDW1k98l2kby5Wnksh+zsUgqYuUBfqmtJCkFtaysCj
	qqhcBejp8nu8MHUaIGYnkQ+UISaGTWh3JhltGxtyZKexan220y2G5U1pY+qMm3K+zDbowmFxD39
	mbR2q4IgmEeFhVEDgzLfF0RLPzCpLGuAaf86J4e9yVQ==
X-Gm-Gg: ASbGnctRMsiqVhwx5C+17xSy0005ekE5bohI7t/E4XQPSkbU2R83uNtCo3KMf5HIDlG
	lsgfkWw7jIcg2Uzw+ULS9NvSR2n4udUVPxu9uWpSyzMdkXCzVoitvYjtiaDQuo8ker1IvMXSrkr
	zuVHraH2bNZg+3eJjXRnXSKed3r0Vm4SGKiKMe6MMCpBaw1YB64wk6u6qDJGVp9IrkzMdkrWTZX
	yZ9Vsw6pVG29CpLSu8BKULTLdMYGikHPJ6IiY5QE4SWyMwD6HaxHomsVkqv
X-Google-Smtp-Source: AGHT+IFWW9Hzk4QvmFEIuxTuSzFqwAls1HtiU6FKjjOhdyOYjenmw3Gr/l6kYIu5clusIxlO2SHNIG7AoIrDQKR+nnE=
X-Received: by 2002:a05:6512:6812:b0:55f:43ba:93f2 with SMTP id
 2adb3069b0e04-55f708b5457mr3760512e87.18.1756904760711; Wed, 03 Sep 2025
 06:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
 <20250903090922.GE2163762@google.com> <20250903125524.GP2163762@google.com>
In-Reply-To: <20250903125524.GP2163762@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 15:05:49 +0200
X-Gm-Features: Ac12FXy3NMzM2aB5ePiUft0RXfVSx9L7KjPMSrAtYJCok4KyCrb9wj58C2zdW0k
Message-ID: <CAMRc=Mfn-F+99EmwUABOy8=qh7W+ixL6hoEKvnmXd=EiW6QiaQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] Immutable branch between MFD and GPIO due for the
 v6.18 merge window
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Pawel Moll <pawel.moll@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060602_654547_4EB37B46 
X-CRM114-Status: GOOD (  14.41  )
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

On Wed, Sep 3, 2025 at 2:55=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> This time with the correct commits!
>
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-v=
6.18
>
> for you to fetch changes up to 9b33bbc084accb4ebde3c6888758b31e3bdf1c57:
>
>   mfd: vexpress-sysreg: Use new generic GPIO chip API (2025-09-03 12:45:3=
3 +0100)
>
> ----------------------------------------------------------------
> Immutable branch between MFD and GPIO due for the v6.18 merge window
>
> ----------------------------------------------------------------
> Bartosz Golaszewski (2):
>       mfd: vexpress-sysreg: Check the return value of devm_gpiochip_add_d=
ata()
>       mfd: vexpress-sysreg: Use new generic GPIO chip API
>
>  drivers/mfd/vexpress-sysreg.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

Thanks! Pulled.

Bartosz

