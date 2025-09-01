Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2082CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtzxvUr8vZxd8BREn+bPHHNBP8tJDJJwcdr3v5pD4CU=; b=m5eAS9G6KTaS/aCHI4rgm92rGJ
	i5ne6yJFZmBaZYFhsZ5UqjH3yIEbpGldDwqm4jjEHvr0ZGNhl6wP0QUeW945Kx+36j//R0pLIZWIk
	KPHg2o3rNrwzTFBiAjA6//N0BCdYhmi4+LKAoIeNcgL/Z8rhXzpOWdhYIeDnL9v118YinDCrsC2Lh
	jU8Z//1fM+Y9DAGkqRy2C8BzqoZGT8VGjFXFlw/+D+ZP5ZCNlTPipgGrme/Dlc9doxr0b2Mecx9Cq
	RlGcDF4LgGdBQiXJIbhsUSLyA3bJGPo+hfMz4di3IrimTrP/o3tKgUxXI0qouzdM3RChMLxIBg1dM
	aHGdrNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Av-0000000BclZ-3GRd;
	Mon, 01 Sep 2025 08:46:05 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszms-0000000BYst-1aQt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:21:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f6186cc17so3133289e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756714872; x=1757319672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtzxvUr8vZxd8BREn+bPHHNBP8tJDJJwcdr3v5pD4CU=;
        b=fyqD9o++6Rb/7ogx61MMg5azUAytgy4aEe46aQnS/nFjppZphk2MkGD6NlwsfnxrKT
         Z5PfzLEeeNxYTE+EA6WrbjB+rf1A1CkG6MxsSepHCSJOeZEEKwzP169lBDgJuyTPYJ1d
         by39/PML1x/+B/kunWUmrCkmJIbaz35oh0UM4bsnDbAT2NbE0b6KqSzb2s9pK9nTWGMA
         9iDh/j5IM37xydjZ3+lX9wIyNPdIKrEEXqbxO3b1OzhuvW12B/AY0Aq0Fh2dINQi//sn
         gPPUoANdYavLcaq+cor9ViUE1AJmEY+nETPZ6CKVDlhGvpZRWyYH9md1IalHu/F+SBL3
         lk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756714872; x=1757319672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtzxvUr8vZxd8BREn+bPHHNBP8tJDJJwcdr3v5pD4CU=;
        b=E/02AGCjkxHe6YLtnlx4rBCvd3SnAXlyyEwzPpireMkupbX3O1EI9yIEG2DxDfZoz+
         kCQAX2ztIIcE7VP2IxKCtB5RIlJVHG7sgjC51spwOHSvD2OxDs7gTMLhW2DaSqY1hol+
         DYEsLKXTlR8WNiEheSLvOReV6cCWW+whlF0lGtjJ3qakBc6tFT3J3nUNq9Y91ZM7i1Wt
         dfAdwQuhqcaF9mFOdi539pO311VuEXhATV62IECrDW4cJDzaWfZ3A6LoCBH6HSGcZXtn
         sfIKl9lgjXJEA6e02AjY6BOK/pgeiQkm8QdcLig+HhT0UjuE/ahC2y5X3R/zJQp+/V5X
         Amrg==
X-Forwarded-Encrypted: i=1; AJvYcCVwc4bmswLzJnctG+VmxRyx6s/LimCGYQUo5l+BkCgep080qE3zHLCCmlx5ohtLE2KrXp1Ob1F7VPc52IXTI1p2@lists.infradead.org
X-Gm-Message-State: AOJu0YyxVOcthJoFu7LHdNQvnvju11P8uk8NqQ8tlIIdwfQDjR99Nz98
	VtxNumk1hA3PjfwHpyKyrFp7CndMrMtaVzFm9/hbYKoFTEVgYS7p5rmFa9UvCpi1i2dAH9xiWNh
	kUxT9zk29vcrIRzc+zoGLtFqu4Atnauc0d9L5ZhgWqg==
X-Gm-Gg: ASbGncvv6aEQYJyGG1zZWYPeM2G6J8d6RjZit6jHhKtXeKtAuGrM0ldHSIvyrA5CLSp
	uTSwkPHg/3kGXZ3z+tpkRlpZKjMS0pSkyugw5+iT5MIt9v0J2Yx1JkkOHv6o5tdcYhnGyxsqYOE
	z3IEBYLqj1ay/182LskT2W1Aq0QgiaYlSUi9Mqp2R0+gqwoMPa0ZZBhockx6SQbBrEOCfQeJ/Zu
	ejxdrqu0+swn0T2hg==
X-Google-Smtp-Source: AGHT+IEaD5coQULhIexfF1mqVXsJQC24MaqrNpPKJTVWeCuhL3ZZFklbo3Bq+zdNZ4cv+ZlQPPiJygTUgUeUbhR6Jvg=
X-Received: by 2002:a05:6512:ba7:b0:55f:68a2:769a with SMTP id
 2adb3069b0e04-55f7094fc5fmr2092828e87.41.1756714871924; Mon, 01 Sep 2025
 01:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 1 Sep 2025 10:21:00 +0200
X-Gm-Features: Ac12FXxXum4wFPneUej-Q8PgTeyjRANYxjsjqL1ILL7wHJ70KeajDhKxosakvEs
Message-ID: <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_012114_418357_9A39239B 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@bro=
adcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Overall this feels merge class, I am looking over the requirement
series from Bartosz to see if we can merge it all today.

I also looked in a vendor tree for the (by now 6 years old...)
BCMBCA driver, but it appears to be a completely different
beast, requiring some magic 0x21 to be written into a register
to "commit" a pin control change.

Yours,
Linus Walleij

