Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4E8C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 04:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjehE0byLT6LFQc5LPjjr+h2YCj0kTxyUsbUd1G/6bU=; b=DtNxLozmp7v8W3
	G3lCarAgK0SBX7zZ6r73T+zBWHOfnvYxZ7h/JNQELFZYfMW6jImcoPQL5vv7uasXy2QjkGjnn8PAf
	Rqicz5i+E3ury4pxDMFag3jj3G3odBV4AkLZ0muEJD5YoiBkA2n9hMMMA/CsdczS2aXio7761K6XV
	EKRPei1UBx7gl9hY2UxdbhV4DMyigFGOSkTPlkAnQhEL5YbA7PV9uhJg/KoWKcETN+avcI0E72QFQ
	WCvCJQtY+YVx0MWAl3vCj1iNq8cb8OhZ7O812RBdrD1B9869fbrZ3ve2I5RrlEJNjFIOjV8Pm/SwC
	1ewQfzGITVauyceHCGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVNO2-0000000GMvH-3WnK;
	Sat, 28 Jun 2025 04:41:58 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVNLk-0000000GMnd-1DSG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 04:39:37 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5550dca1241so444613e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 21:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751085572; x=1751690372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjehE0byLT6LFQc5LPjjr+h2YCj0kTxyUsbUd1G/6bU=;
        b=LtKixDLgcUXaPE8AOgnuaU95Azpm+ZYS6HPmK/5ZIJQXR/HVtIaSd7bRoBKj2ZtXbc
         B6z3xl4MpMNUxEUH4BXxZymg92NjzLLSLg2SNtTAF7LwIW+U5ml0/oUz7m4SygHmLtTa
         o2Vtb0XCNn8VYMEqi2hvwCzNEcRdVQjgD8uhPBhDLIKLC0anfyJ4E/TtsEyD4mnd+hmY
         LzWFG9x+Nb4SPTKVDWLkhijCez6Z+xHcbDrppzT/G6HVGB5qEJVNtF9BTXoPNstSqDPe
         sucLWWytlD2Jm69Je3ZEGI/jcYH116GquK/vm8/qs39pYntHyO3BpjmZpSqSeMVayLEh
         Y2hA==
X-Forwarded-Encrypted: i=1; AJvYcCVJX4zgsmuXmAHwQz/jQaLUzOLDYKfk+oY2r8JtfHtZ6o3uGAFeDktUVpm6I2tijmjm/dGsiCjOnYE4R6HXYClk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhztutyjr9WONwbdJJPgWehAlLCAvlzSArVGm9T8y9OgVIudPB
	Y7GZXLkVMTQKYDz4i3BeHryY7ULozoMIXLuD0YxSMxjiU82Sjap3cIBwCLDQIDh8
X-Gm-Gg: ASbGncuMWzG0BSHNByMwxbLOALXAftg8lDfx5/C7kfRnsromIPH3xyRb3of6Ue0UFZR
	cDmQVJlCZWleiz/kIOXcMLMwZk3wtYLmgPYHHtuyct7O2j8q8eXprL1x4J5NiRPsGZ5eRVtYtw9
	f/5hwA8UBJ1WLa2U6wjpYr9OBeoK52RmzkcqT9K7IdK4wd2ScFwzx79Weulhy5gS5LnXR/3qJL9
	ZNHzlsG7S4RPwPTmNR4jzNtJ5l4NO83SyQyQ8nqVhF+kew0toJ33baUIl5ljpm8sO04S3EieUO+
	VHAPcQOiWDk+IGStAlSwFIn4N6t/xgJ9Utk6Ykpj/X/SWxYA8XmjnTRhRrxFcWNFQP8vR00pvuR
	Mty2OVyZcdPZJ11IDVBEB2bqVQX3kQg==
X-Google-Smtp-Source: AGHT+IHEN+9ZsgJMA8cZW19EeZrXawpifQnLLzyWJLRSIUiuzKIVykK6zZo+0XeyVN4bZSviBHZ6Jg==
X-Received: by 2002:a05:6512:3d10:b0:553:d884:7922 with SMTP id 2adb3069b0e04-5550ba1191bmr1551373e87.48.1751085572038;
        Fri, 27 Jun 2025 21:39:32 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b8efbsm669926e87.121.2025.06.27.21.39.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 21:39:31 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b7123edb9so4571551fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 21:39:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTFzJ4GSadzkn4uZpsmXUixHUrLMjSdDGn1DZk1Ik8KL+olgpwLw/XbHJ2EkHZGE6U5L2l5sUROp4gPZF2xjEs@lists.infradead.org
X-Received: by 2002:a05:651c:304f:b0:32a:6c63:935 with SMTP id
 38308e7fff4ca-32cdc4480afmr15261101fa.4.1751085570044; Fri, 27 Jun 2025
 21:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 28 Jun 2025 12:39:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v67VVc4ckvzy+w++wcEUPSvV9Uxju2H4qTRNhjwAgYpzXg@mail.gmail.com>
X-Gm-Features: Ac12FXwd7he7qKrnxN9KLQmU6bishZKuh8vNiwYMugN6VxIMRflq-7o7dltAy1M
Message-ID: <CAGb2v67VVc4ckvzy+w++wcEUPSvV9Uxju2H4qTRNhjwAgYpzXg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_213936_325866_38603B25 
X-CRM114-Status: GOOD (  10.63  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jun 26, 2025 at 4:10=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.
>
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 =
pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Acked-by: Chen-Yu Tsai <wens@csie.org>

