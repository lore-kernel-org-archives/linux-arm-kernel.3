Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=; b=QofdLW0vnrsUazOKskEy/JV5Xg
	xu0MdqRGGbtFJ6M7WTjctWBuiaYitRdBCXwSJqIOBg4am6XtqOZ43KGMJD9tlB7SY9g7xR6BMle8r
	cl3ZCnbmlfxKF1AHbZnpauxX4Cr/pl/+ihIYJoi/8DwgdttwdvnPXdGCyrI8AIT/EkvdsSCOcfuyr
	rTmi3yzdNVjMghdf5QhQ/2QfoX0o/jw9DkE/ORVdBkCav+IJnZvDo258EcLO8kUw1qFy6FNA0Kkob
	pi+X8d/hf/YDkNo0di+a/jGSf1KLwQ3pfWjvQCRHTTn0X9nlzKxYrTUE9F9LSKjkCo+ATZuoSOga9
	mf7Dgjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdbv-0000000CFbg-2wBP;
	Tue, 14 Jul 2026 13:55:47 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdbr-0000000CFaL-3aj0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:55:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so3296678a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 06:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037340; cv=none;
        d=google.com; s=arc-20260327;
        b=rL9kw8noHOiximXXeRpBUFo+bjtdsTp4qGhhtqpjrNbMGikHFwkJBiBrrOzBBwiB5q
         QQvrd/JPNkqfAEEgFHvZVg5/WK/boM7wOZbUS8W74Q+HhxkgFm8aQBrADOUgv/uWoKIC
         E/jymN8/Lu6rpimFMEy73osaGCSLnoMrtfz3JI2CWP/5ApHCbDjkeYV2rB0L1ozHV9q7
         WDCYGVvbd3SrYEMS4N5hNDmC+yiHkBnBN1arFw65PKcAUkcZjuWK1aU4Rn9YTWtrz006
         kEsuof6H6cAiKbS5uPsHNCYCjQCsSAdPLZ1MMeezGFouoge+f48f97NDDcPjGjaC8bbc
         Hw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        fh=glWS+P/UNMzWxZ9okvwE8LBBh/Oo+OBGLDpX/Nkw0AU=;
        b=oXodcd7Y7XwQKlFzp8EDV6pcfY4VbNIlUETus2iA90Zo/1QMf/n2PSCcoaHRTYhC9I
         g1AG/8KZr0ZV+g7yBAsoN4D6/Bs9zE6vYLhWAlxjApOOmG7iYnsnIQsPQmuWNJsCTrNV
         P5RNyZDcVI3xGT59jIfZ+PAeLZEg2khU5gCA3eTvmXa0+ZCDedGoQplRqcQ1uMepJQ09
         13H5DaUb8rMWrfXm2Ct2b5qAwgojnhsjpa7S95HE8Y+35zco80GN0eIUq3jwW856QsbZ
         pB1QU/7+sef2qNJRxSUpHr37FN6E/IQwLCTJ25yi0pX5FtGAqPAwJ/T9sN9iScfRRtJ8
         h0lg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1784037340; x=1784642140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=T9s5qowLxy4cwpR93Pkcx5I6qxPCpY4W9J5z4bUwdtdJ3n0sovYsE4RoiPB/fZWGlO
         vVKdVhTZtRbjzCp6ONKO6JTsh9BLlbkv/bIAPobqVyF4FliJ/Y/V7ndIK9y5javybSUK
         cF+9/S6ANwjWaRaKHAmCAz7sFSCzsdiRgIyew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037340; x=1784642140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEW5lZA7kJtV8D1OKZ5O+uDVKLKbvueVayiEwtysTM4=;
        b=QEjNldLTjrd+Ehe5J9vIFyV/E/nAeUJwaJI7mZsk75U9tnslXEt6Bcjq5Nz58p2kMz
         /F4p0xC4ljck5QzTEtPpYZfqJpjQmilK+2sUY/BIFE/yyHJxgYucGh/72VxsBCL40ieR
         kWaFjljF4RK94EOHrH1tp+Q3eOvmI21ObVPaH2pyQQG4nI0zAjin0D012zgb36T1UiPv
         dcIl4M/AKvx8EQxRBzCSLOg4QjqTHvI2cOjfoZ65SX7MHhAmozoAItEshOM06m9K9kyg
         CHcH4aV4zmeggyCBAdf8L9Kp89aHeoXVGUtm0SJg70mn2EikHe1JB8tKHJwvlrXoiNqj
         cAyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHlYrgwNctIDecAL52kzS4KUJFFTdO1GXws1TVoB4RkSOqGIAFBkMLNM5eNmh5hr2I46ds6sgZAxbc2dMdBOKk@lists.infradead.org
X-Gm-Message-State: AOJu0Yygh2gtiLzNG8CugnPbvK8GsdoBKRxr+W+7ZycJLzyk0bGh3pvY
	qFFJ1qc3GYfTi8XS7UdP2OolfIeo4tdotMyzGmRkTfHgIMQNhqc9GziWeEk+PDE8MwJtj/H+qnY
	P4sPbqzT6YaTOouLo5UVWdtlhWMgAMvlIe0qCP3LedG8scmET3wgZ65QdbQ==
X-Gm-Gg: AfdE7clEpoK7wMEJ4FmcEGvEalYniHQKbn+gz+OEEtZJsT3pc6CwdX3rV0bDAad1I14
	4K144ZY3CD40dXeAQ4r1e41Y52n9bUDp6r0vZdOWDaVGkxY8BBdwrzHy4PK4QVyl17WnUwDWcUf
	kHOPli2KNlVLFPJb1r0EKmKix80kR+4zCuD1Nr05fU4rUTwWT+9qX/wmzwbURtuP7qBa91PZsTJ
	sr2bcoihl6YhF49xpIQH2rBdJJeAtu546XBAwn3jCLTqL+SES0y4J/EoM9DAYXYIwAI0H92n9ks
	pJ+7o/vcZXl8MHqx+jdYPW9/cp/KY8o=
X-Received: by 2002:a05:6a20:450f:b0:3c0:9c19:65a8 with SMTP id
 adf61e73a8af0-3c110a30fb2mr14802853637.64.1784037340342; Tue, 14 Jul 2026
 06:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 14 Jul 2026 22:55:28 +0900
X-Gm-Features: AUfX_my4HWQr0GTS92czUivB5kzuMCNXDtWp5XUMf9HPpLFf89A5CuHvz5fm-hQ
Message-ID: <CAFr9PX=UE0OtdR+XSZShPXUp9BSL=NN6tr_CSoyNPSxzdLa3nQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_065544_136192_B5414008 
X-CRM114-Status: GOOD (  10.00  )
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

Hi Uwe,

On Tue, 14 Jul 2026 at 16:25, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> A driver module matching devices using an of device id table is supposed
> to declare that in the module's metadata. Add this information for
> several drivers that failed to declare these.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  drivers/gpio/gpio-msc313.c      | 1 +

For this one:

Acked-by: Daniel Palmer <daniel@thingy.jp>

