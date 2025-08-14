Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D8DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFUrylcigol2hllrcza769/tLyOk1d4CmbqHA8zoLyw=; b=UtLkjYQ/PxUPOMQJyMt/Rji7lI
	vBlMoXKNmfTyfqEWb0b8yJ8XJ/XRqOrUNJ8qaZQR71yyMzQaKExj8hq2KLQAtvYHf0lgamym4X/w7
	HCl7Xs/lluA5HahtCoyFT8hbx3JKIi6UwlLvXnBXFX4S3ICEWxZAI39mhZc2kByUANYqvEIgW5JKe
	BEeURZrqNk9iPd0mgmKmSYz5mJz/knTXQ3VLqT6ZOASe4wSwXkvuoTh7qyvu7ePNF6fRm93W8Kxlc
	dDYMGEGcCprz9nWC3grYXidFSr+oL5Epe1lxvRbHwFHgm1s9c8VbXNx+5tfjyqzeP51PcjoYXd6DH
	NT/RvdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYP4-0000000H7Xz-2KPm;
	Thu, 14 Aug 2025 13:54:02 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXfq-0000000GvUs-15uR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:07:19 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188945f471so1994030a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755176836; x=1755781636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFUrylcigol2hllrcza769/tLyOk1d4CmbqHA8zoLyw=;
        b=C94A40OAyWcpnZ33S+8EOYgaDVwB0Jwjst3zlPkeJKDdWiAh5VYrE59ejBkx9O20vw
         lfs3Jz1pSiz4uP6rRvZhmV8XhwWtrHYFdia/q++T2gJFGNqXkPPnXvgVkMNijQYmPiot
         dYGgVMVQbx/oUFVAJUQyvzz+fjbvYSApslCqxWYfMSQrRNr5oIkHdmywEQ/vAXkKxaFg
         U/NO0hdGAJIqlDX9p+AjmTZfbE/tVP1qrmGazwRCkX5IgmCAi1JmgEue2zYhDkMBc5rL
         6dStX6ZaUdGAYcmYTrx9hsPzIKpTQASJ3S3rUTDpZWheTliI2bE3nvfTJRqE0CwmzJ9I
         6aMw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/mS5j5JM05IqHk+Pac9KwqG5SNCJzrt0dSHqj5XBfU2gPI9/4kzerEMmX+MT3kddr3jr3XZDnD0oGq1NbJhO@lists.infradead.org
X-Gm-Message-State: AOJu0YxzMoDq5316l35u7NAIae9E2uG2bLHnPgTOI0YAbK+qtV7iyZe/
	zhRC+qcI9i9PW0047IG107oTNaGUWLFtRqrh85B0kNDMgSmHqqoXHpmQ2Hij1Zgs2SY=
X-Gm-Gg: ASbGncsGqw/Uu6F18SRQksueDF68gO2RL6xdAi4JEDtmlYr8rUdvsxR+Q01oXnGIrbI
	NjXiCEoON0+ruZLzT5hSBsiDnIlW8fyOTHIx61cwV+Ejj5bDqETSz7EccrCDCuVHpLMWcHK3FZc
	s/xvIZj2FGCqi53GEH65pOM6f9NbO8pbbHIIBysF+MMPUDJuZJH+UXuJh1x1MVtJCIuoUOaTZgA
	zeeD/hePiC51xl3E+pz9Yf+cTyZPPJCN8Sl+5o4RLGxjDyMyC4TJzXQAo+cCoZG2Dxs+I0ahDr9
	OZ7jk6/JnW0oBfHTiZEZQ+TREOq2K4SGhmWEWkstwDkNxhZURD2gc0uqDMUeSaIguZHvxF9RTue
	C02xNM6w2Bw0yE6Y+ZwTTownz/KxPwBIHNNwjK1o4U69/C7MqFpob
X-Google-Smtp-Source: AGHT+IFs3CQbha/ynIvLrbzZs13bbiEaJkAMhXFw8GPdUc5eH67UmQsdTmwEsKRkBOzJpbV4WAmtnw==
X-Received: by 2002:a50:d797:0:b0:617:e2f8:c44c with SMTP id 4fb4d7f45d1cf-6189116f05bmr1516912a12.0.1755176835643;
        Thu, 14 Aug 2025 06:07:15 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618461ab3dcsm5664115a12.56.2025.08.14.06.07.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 06:07:14 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-618896b3ff9so1974941a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQDViLfkYMS045K5GBXJfHdpkAtSCYfisCCXhmyYAC5FsvLxGE/BPcQ/xHsihtNzF0igAnpSViJBPjmQMd0Awk@lists.infradead.org
X-Received: by 2002:a05:6402:5206:b0:618:3521:6842 with SMTP id
 4fb4d7f45d1cf-618921e9bfcmr2202592a12.16.1755176833833; Thu, 14 Aug 2025
 06:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
In-Reply-To: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 14 Aug 2025 06:06:35 -0700
X-Gmail-Original-Message-ID: <CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com>
X-Gm-Features: Ac12FXzLclnfzNMdgfWr5WLv-lJF3C441CLYE6NCa_SPc5-EdJWTW2hkFqFeYNQ
Message-ID: <CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Apple Silicon SMC RTC driver
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_060718_303569_596E3002 
X-CRM114-Status: GOOD (  21.91  )
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

On Tue, Aug 12, 2025 at 11:25=E2=80=AFAM Sven Peter <sven@kernel.org> wrote=
:
>
> Hi,
>
> Now that the core mfd device has been upstream I've prepared one of the
> child drivers that is still missing: RTC support.
> This driver is required to read and set the hardware clock and requires
> a reference to an additional NVMEM cell to store the offset and thus
> requires a device tree node.
>
> The series applies cleanly to 6.17-rc1 but is based on a tree with three
> additional commits to add the SMC nodes to the DTS which didn't make it
> into 6.17. You can just ignore that and pretend this is based on
> 6.17-rc1 since I'll take the dts update through my tree anyway.
>
> Next to this SMC child driver we're still working on an input/misc HID
> driver for the powerbutton, a hwmon driver for the various sensors and a
> power-supply driver to manage the batteries.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Hector Martin (1):
>       rtc: Add new rtc-macsmc driver for Apple Silicon Macs
>
> Sven Peter (2):
>       dt-bindings: rtc: Add Apple SMC RTC
>       arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
>
>  .../devicetree/bindings/mfd/apple,smc.yaml         |   9 ++
>  .../devicetree/bindings/rtc/apple,smc-rtc.yaml     |  35 +++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   6 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
>  drivers/mfd/macsmc.c                               |   1 +
>  drivers/rtc/Kconfig                                |  11 ++
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-macsmc.c                           | 141 +++++++++++++++=
++++++
>  10 files changed, 218 insertions(+)
> ---
> base-commit: 772c260c9c7f916c9a2508839df4f03fc19f3773
> change-id: 20250812-wip-smc-rtc-e856b6f24603
>

Series looks good to me, thanks for submitting them!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

