Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F2CC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czsr8ut4E1IjeGJZsPHODj7dteAs5/QBRXMGMfAcAZA=; b=o/xTjuzlnvF7ckMiRBDfFoZ762
	n62I332h99Brg27RgiMIIfVVRaw+LgwTsJI9MktghNVNyADxzNCD246S1Axm7Kouh6weDBpFgMEfQ
	EcT2KwF+5a+MW5cdQnnSisbhVGp9xmyaUfZ6qvXno8yvjz1P1C1bF2yPPCluECkEIL/sprIupyOg1
	xY5+I+GyQCADgZT4Rf1f3YhUchmPklHRzsUbxWUSDv8seOav+hJ2PO966JAu5q7lRaxvD6N+4Cera
	ggTrECFusdpUCkruc3MckrsP6IhlNGUw5nS7PsNZ2ITs0TAAdN9gsnTL5MF23hU8vvxh/iXzqHuin
	u3pEsYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5ev-0000000El67-2KaN;
	Sun, 09 Feb 2025 11:39:33 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5Og-0000000EjCO-48u0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 11:22:48 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7863f9be4so346403766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739100165; x=1739704965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czsr8ut4E1IjeGJZsPHODj7dteAs5/QBRXMGMfAcAZA=;
        b=DT8F1lunelc3qXg8CXx9PbmxVnVuK1m+B6BS/4kcBf82a8efS5RExodM9ocuRMqXOd
         LytrsNtqinv5BXzZT0u33u3GE6DJ7Ofs3I20LTkA7H4yj/5cK0dvfh9QinWzBhHOdPcP
         aWNnG2MPvdGRyRqCQzFh7lw0GHdUug6g98xZFTJTIwpvhD61mkvGyOd5EvZa6DS3P4uM
         RmsR6w7qptKJvG1tdaK9mGSRcIvGOUGhYjlj5lzWtSaOXZDcRmwMma7faboakEUPArWS
         xPXMpzDlKzflNHUoUyffajKCZbN3t9hhmAJbMZ+epMRX/zyjof0fC/420uUPGBTjFVl7
         JFCA==
X-Forwarded-Encrypted: i=1; AJvYcCU2VM3VaBc9wZ0kTiVeBAC9PKJbSxT0bA+fD9FIPCNTpI06zZUg25t9tgmn316p8OTtzxazyEECillqQKO14O8y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+eu+gDvjgyNugKspgIxv66p+Ho002oHiq48AUsv6qaAF4BmFY
	Nl9ATxhZ4CeXl55AaH33lSkWdD7BtTuFQ3cqzQ1AULK15CAR3+yOOeJMELHulK8=
X-Gm-Gg: ASbGncsWucbv7J4Wt2YaV9cRTyUdnwvYy3Iwm9q0qsZMhTzOu/gSbTj5g9p0LogiY8n
	LCxIDdCwUhcoVnjIFqn8aKOq3WYTDwMPbp22RSPXlJCtAYDkS6D8ab2l+dj5f0XClZotcczc8o5
	7BiWxevdk6KEJ9dsyzOotJQkVjED0BlveFHJfDR3Nof5l5yfVBsR1BfsupQZS8/WKcZpPSJnRMV
	kU/A5feBy3jiD2TRKNU6x3OqWxBowoK0YPWsQbzLJRwqAk5q2PIDjWHGIe5mynXbpf+M2qxCk+p
	lriQznvTz2xu7Re0XMqZ9EihOnVcenES6hwliH485cl1wA==
X-Google-Smtp-Source: AGHT+IGzFvRdwFOrGwXCKd+UN+ncIyjM9BUEiBCCiBEfjag/2Kqz2NAfsriQN5oJrYX+/yuS6NR1CQ==
X-Received: by 2002:a17:907:3f1e:b0:ab7:7e14:684d with SMTP id a640c23a62f3a-ab789aa8727mr1151767566b.13.1739100165034;
        Sun, 09 Feb 2025 03:22:45 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fd67c2sm653535166b.77.2025.02.09.03.22.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:22:44 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de4c7720bcso3178615a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 03:22:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSW7ur3gSre4070J9t0tWT60JuXvecpDfP7JNYQ/L+EqiZPcI+NVfVAt3EeuXw4FvYtUngyjNSdd+nFbUFVF87@lists.infradead.org
X-Received: by 2002:a05:6402:5252:b0:5db:f423:19b9 with SMTP id
 4fb4d7f45d1cf-5de450236admr7763979a12.16.1739100164505; Sun, 09 Feb 2025
 03:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20250203115156.28174-1-towinchenmi@gmail.com>
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:22:08 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
X-Gm-Features: AWEUYZks2Pe6z_gT4XPe5iRvZlGve_lJKCtY1woYJMW8gNu9Xz8tZDlJPRfovXQ
Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_032247_030143_53E8DFD0 
X-CRM114-Status: GOOD (  23.98  )
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

On Mon, Feb 3, 2025 at 6:52=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
>
> Changes since v4:
> - Change type to BACKLIGHT_PLATFORM since the driver does not directly
> interface with the backlight controller. The actual backlight controller
> can be directly controlled via i2c and is not the same on all hardware
> that supports the dwi interface.
> - Rename file to apple_dwi_bl.c to better match config option.
> - Rename driver to apple-dwi-bl to better match config option
> - Indicate that the backlight scales linearly
>
> v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmai=
l.com/T
>
> Changes since v3:
> - $ref to common.yaml in bindings
> - (and then additionalProperties is changed to unevaluatedProperties)
> - Use hex everywhere in bindings example
> - Use sizeof(*dwi_bl) instead of the type of the struct when doing
> devm_kzalloc()
> - Use devm_platform_get_and_ioremap_resource() in driver
> - Fix sorting in drivers/video/backlight/Makefile
> - In drivers/video/backlight/Kconfig, move config to right after
> BACKLIGHT_APPLE
> - Explain this driver being completely different from apple_bl
>
> v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gma=
il.com/T
>
> Changes since v2:
> - Add missing includes in driver
> - Fix file path in MAINTAINERS
>
> v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmai=
l.com/T
>
> Changes since v1:
> - Fixed dt-bindings $id.
> - Make power-domains an optional property in dt-bindings.
> - Added missing error checking after devm_ioremap_resource() in
> dwi_bl_probe().
>
> v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail=
.com/T
>
> Nick Chan
>
> ---
> Nick Chan (3):
>   dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
>   backlight: apple_dwi_bl: Add Apple DWI backlight driver
>   MAINTAINERS: Add entries for Apple DWI backlight controller
>
>  .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
>  MAINTAINERS                                   |   2 +
>  drivers/video/backlight/Kconfig               |  12 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/appl=
e,dwi-bl.yaml
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.48.1
>
>

This series looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

