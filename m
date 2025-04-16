Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB23C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twB0aG5oSy2aYBf8sj1I4DoY6eJcYgS5UGe7JOXKGEw=; b=LDDaWIUh1mCB6+8koOKWWpTE4c
	sZInX/Du2qZ6qrSY+qT9sJARBuHLO7F9PlxgT9cX/irUIj0iPNjT/ezHcSBLG3c9+WruHopl7ZoNc
	Uene9OldPWi7bsro8bf2nxuJKhlKh9hSQAJsc2yqLBiX/3aFizIo5YMBbeftV7tkttEtL+G2KmnXG
	koTQKJV5PcqElY5O8ubtPGOYmgKTOs/kF4NrTA3uxQCc5k+EMj3JGWLju22iD1YTUPO2nrkx7zkho
	G5q4H0BiXJmtB9J2kBPpUPF7wYIVq0PjkUbaZvu0wOxsT18WlIlovbP5UNRUGadObx3yKyoh+0Fdv
	86bq0DXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ro8-00000007q9p-0iPV;
	Wed, 16 Apr 2025 01:43:20 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rmD-00000007pqc-30j5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:41:22 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1159031366b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767679; x=1745372479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twB0aG5oSy2aYBf8sj1I4DoY6eJcYgS5UGe7JOXKGEw=;
        b=tlx8EYSD2f5uIYeAyYRHQ9woeQVubZ0MKUhTjmJDvfJfBEEZ4lWJpBLIFPkTn/QtZf
         jFbKnK829Ncw0qdAOuWBHdzqvf+McjNwJ+F486u6oj422YGVoB5MIIRbX+FVuM6nrSNC
         GxUePj3toA4IWdHooLjmVA1G538NZX7mXFlOizaW1tX92JRH8lpjp4fsJ8FkXQvkC4x7
         dDZiz2kkDyCoZy9eeYJqksCPi8Myvk1iywCw+v1KM+J1sib79S17jYWWixv/KPSH+WaH
         bRo57V1HUAoSp30v4mqMFpcYfmZers9Z3DKNf2rnYVkSmFgAszcp41ntOdw1DCWcWGr1
         JMDg==
X-Forwarded-Encrypted: i=1; AJvYcCVzq/5zon5GGmrOSjbpZOX0b66gwB2vCHWNBLNmxMAeoffUpPmXZUHwf5KzT/lXoDxh96wAFZPHTlfY0nWMhe2s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2phFoo2j3ciYTssEiz6n5mMi04UPBvHkMunNkQzolpUDNJLbd
	aDD3Pi0W91mAdnHl1s8lno5Hn0VKdAz5ui1WU9jtbdFrNcP4HJDiHwflzwbY+Qs=
X-Gm-Gg: ASbGncv/QzVKnUFP14lf0OUROAUer7rJu6cbKOOUxtyKUqVm4Vfp0B4ZDXfWnIaWnJm
	R6yHpfu8e/cSuT0i9ffJsQCriEtGFxlLCoNauZDGTXOz9uU+wSg8mRQxsYKu9Vu66eae4zURvRl
	Kj/ZaeVjAyMLG6vRG71Ogbjb+YuTzFZOGTwYT/NRilHX2Bkj9FUYx27sbOF3EZkkK6yJsKxSY2T
	W3M1w/sAnF6rSYy3/XgERdUQnbmEPfblaFtzKxXd1+0tCwa7kiXMG0JxdYENvVFtgMR9yL0J3i0
	X+02tazWKuGgJLSYfGDuCpXScDm3ZNyjJo6v3w3GoPZCrd9PMCq/SSvcv5G6NytqVsKfz5s=
X-Google-Smtp-Source: AGHT+IGUj1svfDtcxfDaMPIG+B5bGuH5j3k4EbLpcJP5oJ1hzi3/MVGkKcyGlkhJncuBpJe7GG3wOQ==
X-Received: by 2002:a17:907:9485:b0:ac3:3fe4:3378 with SMTP id a640c23a62f3a-acb381a864bmr107736866b.12.1744767678724;
        Tue, 15 Apr 2025 18:41:18 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdd5abcsm29337466b.43.2025.04.15.18.41.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:41:18 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1159025666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8To5pNVbbTgUYaftIgyAlNJJBopUZKbu+Io06yEAs7FmtGi/Y3qZRLyaNdtvPGvnBuTcCMRyYmoZT//NVQtm+@lists.infradead.org
X-Received: by 2002:a17:907:3d8f:b0:ac3:bd68:24f0 with SMTP id
 a640c23a62f3a-acb381ab306mr100622966b.7.1744767677634; Tue, 15 Apr 2025
 18:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com> <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Apr 2025 21:40:41 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9YWME75EqPYNU6LuhUo0kgcWfOh2qoo3WwQx0K1vObyg@mail.gmail.com>
X-Gm-Features: ATxdqUFONgVQ32LYCamWZQFAdqw-HYKzsclM2qfgVOPEPhemzTQ_TdOV1fFem4w
Message-ID: <CAEg-Je9YWME75EqPYNU6LuhUo0kgcWfOh2qoo3WwQx0K1vObyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_184121_761132_E8063674 
X-CRM114-Status: GOOD (  13.34  )
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

On Tue, Apr 15, 2025 at 5:52=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This driver exposes a SPMI device as an NVMEM device.
> It is intended to be used with e.g. PMUs/PMICs that are used to
> hold power management configuration, such as used on Apple Silicon
> Macs.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                |  1 +
>  drivers/nvmem/Kconfig      | 14 +++++++++++
>  drivers/nvmem/Makefile     |  2 ++
>  drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 79 insertions(+)
>

This driver code looks reasonable to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

