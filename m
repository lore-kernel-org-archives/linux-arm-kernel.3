Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E5AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQPsyR7dAWj0HH5X6ewchiw1dxigQ2xEs+aOiFD7V1I=; b=MBBqXfMevj18gO/3zoUMDraGLe
	ruVLGAXvWf4JxoJNL33HfHFjcMZwq8yZyOoeN1qkXvmYFpzmoEKsyLBByuY7r53JJcZ1lIfx8wa7Z
	qWQzpiBpD36iVJ2xZ/IiPX/1FBQ6EAh8+SiGbpR7Cfausy405+Lc01LmD8OdOBwEnCJZH2Aof0RLA
	OSNspt7i5lkJwnzqMzFparH3qCLzrxC7Cz+3HKgwF89WQv5apguW+2CsH6Fy4HqGw+iZGYL3UJo6V
	cjUh8eeXSeEUpJmtzHTl6m0D2wQ2gtMWBHmSHPU0MLPa9EdRH1ST32DxCe2iLZdxklZonLfsjyOad
	8727zZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXul-0000000DdLZ-0Zzb;
	Tue, 17 Dec 2024 13:47:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXpd-0000000DcVX-3hDw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:41:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so7486016e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734442908; x=1735047708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQPsyR7dAWj0HH5X6ewchiw1dxigQ2xEs+aOiFD7V1I=;
        b=a5vCzHCEetmFpfjOMZK5fGD5IXEgTGkSnKfVg9d0Y1601jvjVgQ7EwZN91Xbyq6O66
         qNWYu4wR6/l6Huhakxkm9KDhdsOnKOGK5cE0Qyknndt3LKq1ZKZSd5679xI3WY+M2fxN
         O9/fdxnTMkHM9zNnu/hMLR42yBfDtj/LIIhIQvnB4BwHrYgvakCoeZxxxmKlyUOG2HzQ
         024vslrBXa+WzG9BN4Mivu7wRV5UVbnmE7A7Z1k76zPC25bdQtdS3tCl6X9DItYta5je
         bxZ4xa7U4jrhcysIoRrWhr7ICSYS+nRDNnTL7WqUfeVx3wGLNxVxv39kw6x3cC20JU+N
         KntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442908; x=1735047708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQPsyR7dAWj0HH5X6ewchiw1dxigQ2xEs+aOiFD7V1I=;
        b=ssznNfY+e3X24cfMXPq21oESFs8LCVbdSkySC3bDnmiq8/dVpfeA2jEhS/tLjHhQZo
         rG3Dn85IlxSsjOFujeNtteUHbeEHhQbp3FI0W8Ysszxa/uWAKaxcqEXjjxr7UjE8O6tb
         ePcJJGTgJ3RdFPmPig/fZtSwe2RfEqWeqktOFaDG33lxmN9PLx+jSd0/0u2+2VW4tK3j
         wPtltMuUiOpvb6Q/MpMUhGo81cDDB6BLZkCl1AUthrO2dZ644t/MuNCtJvYtSbcXi8C0
         aXihEBrhYl3uCpepZGhqQnf2dxsx1oB1v8P4IWNdecqWiqGbV9BWwdA7QRBLrWJHdkQU
         E8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTSMyUZkFaQIoxT0TLn3MYwZkL5YkF8do+qEhOfw/peQgZoKZwX+0x0afD6fbtNAQ0SOxfy1Ynox0zZuItHe8E@lists.infradead.org
X-Gm-Message-State: AOJu0Yz89SLzsdzF89wZYe5snJPKgsKQPNaGGtjaGawMG2Wj81N0a8JZ
	afQBmZ8he3fTucw0r44q1Ll4j0wFpAVrhshAwZkXgd6q6zRWz6GpZ0peHxf5dWRHzVfHRDmZnah
	CfilZBEnL7zpVVQXpSJNXuT/+yilE6Y/o0vYkQA==
X-Gm-Gg: ASbGncv5TqiZbxaCL4HJifQH/TJQpmpBCxOEblQr0tuhpdYd/4M5Cu3Yr1qTeI5wOuh
	Ka5TYCRDQzx7W4mFxIvi7RfZwymjxdf3VGUazBw==
X-Google-Smtp-Source: AGHT+IH4HRXYBmosVzpwGFebPuano60MtISoT9J69VFwW0An/ivv1V9rgWffgN2jJxOLz0JsvxSobN0rBrRAtASDJGM=
X-Received: by 2002:a05:6512:3c85:b0:540:20b8:7325 with SMTP id
 2adb3069b0e04-5408fac7aeemr3900258e87.2.1734442908199; Tue, 17 Dec 2024
 05:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20241119140805.3345412-1-paulk@sys-base.io> <20241119-prudent-jasmine-lizard-195cef@houat>
In-Reply-To: <20241119-prudent-jasmine-lizard-195cef@houat>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:41:36 +0100
Message-ID: <CACRpkdbcDwJaLmCa_YoP2zFw3fiWn-d1Q773jGh9kcVN8aWQKQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
To: Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Kocialkowski <contact@paulk.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_054149_917037_C7582477 
X-CRM114-Status: GOOD (  13.65  )
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

On Tue, Nov 19, 2024 at 3:43=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:

> [Paul]
> > The pinctrl code supports an input-debounce device-tree property to set
> > a specific debouncing period and choose which clock source is most
> > relevant. However the property is specified in microseconds, which is
> > longer than the minimal period achievable from the high-frequency
> > oscillator without a pre-scaler.
>
> That can be fixed by introducing a new property with a ns resolution.

Perhaps, but I think a setting of 0 should just yield the minimum
resolution in this case, as apparently the debounce cannot be
turned off? This would also make sense to expose for
gpiod_set_debounce() as explained in my other mail.

Yours,
Linus Walleij

