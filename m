Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5D5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pn4WwrIZl4q3yZbVPGmoGodJ5pv0OBWYacthkC8dikw=; b=dqe2ihuusI2H0noI5UwVjWTlUa
	1THc7P4/gQzROP+kEpy9+BwaLJf/iOJQxNUltvqWjeGCJSKXxh/4ApNwDSvarsOr67DNIqq9rNXDL
	knfEVysvI4mcWrk3/Vtt3fMMqezBGrQDDhKKE9W+lrto1B+cRX439+J23qraYSntUQxPQHAM5Y4xc
	e6sB93MSS6UWejCiTdJA+eGu6U3xfudRAV1NFXnCwASYFnpm6vCfaUEDz1avj8RzIlse7Vq8LzTx9
	SxqWYU6nBaiqYJyvWbNXBbH1IJj9buYrrW4QGfABb5ozwkmFWAyZojWN20hpzmeE9zlLz0N0gaglH
	Q5XwHqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuMD-00000002hMQ-1Osa;
	Mon, 06 Jan 2025 21:09:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuKz-00000002h7u-3UIg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 21:08:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso92145185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 13:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736197716; x=1736802516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn4WwrIZl4q3yZbVPGmoGodJ5pv0OBWYacthkC8dikw=;
        b=IwO+Uqkuw1txtxYp9Er4TBmb/aTgqtIIpY5a+aD10Jkeg3ndKc+I7A/CuNFu2xI1P7
         xKM/eGYM51tAu/5KUFTEhrw6ZPiDGbS98SvWZQ4zcwzRBArDFs8XvEBZvpu6K3N73Kdl
         jhIewybNfARb3VCyb7dq4rRRAUq8KAPTtuUklBG7qDa5IqpG2Ef2DISYRbwmngwZdBLw
         2UGWm2HuOHFOOje5neete1GjWJ3SEbSH2vMhowTM/Qp50m9QIeouWTU1/dZs26BIvn/2
         2luF6t5jzdLld5zrZ4mfWYqVL9eMJwGoKTe150o6UYtEmaGaXY8qMcVuw0vZGUP1oqoO
         NQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197716; x=1736802516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn4WwrIZl4q3yZbVPGmoGodJ5pv0OBWYacthkC8dikw=;
        b=VFKLa2fWT8NimbP8FJtI0Zxayvjj7zKKKzSrH6RSCoxOQWCjbOvPPUip4Gs/oSHxRb
         yRQwuE8bwddH751o0a+U0MCfnNsmIh63jH+sFTEmWb9Bj/jsHM1FcbISK1qOvMH3JQGc
         u24CKjiCMrgUuzyiRxe1mG9cmUREtPC+Z7bWUKJOH7y0w0najL4TPFnGuN5oQ+Lcgvn7
         owTGKnEQ61ADYCztqw11qdy8mfUy3ye3U2/Oy1OC4YltqsZ9WDHMQdNLfzD6g2lqjILl
         9OPLTI/XCvIaipC+7k5RBchzjh1QEIjkN6L1jIwkfLJQYrySEzwfp0IP9hPSZ8at/G2J
         keeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7scRKnZuygsz26yOLgPZYbfO9yQhI5rD211sUl7/aANSr1E51dwQ0BUA8bu5TwCol7jvR2dIWh9DutC3mWPs9@lists.infradead.org
X-Gm-Message-State: AOJu0YxmXJQUDRKJLBotXVLwR8jK+DA49/0bNymUtw/gFQsX2fU+UHzm
	EuBO5Qms6oRYcgxag8BLluR8JzB6FuzC3bkh/1PHv/1T11bVka0mdB7Jge3CQahKM+MgHbQPZ/E
	r8NIdC9MMKc1jw8dg0kCzUOZlmIo=
X-Gm-Gg: ASbGncsxHqFeyw5teDR6lYPgu/fl8njJWB7foFWIfIUpTL3jSIARcfilbA91mf7wEgh
	5KYOkIbOJrLEsNvHp438BayxAeJWpB15XIfUf5Q==
X-Google-Smtp-Source: AGHT+IFpb3vDJfP232azjpEU+8oSssPqo6K1SCqKB3P53xPN/L3f6eNng72pkwnRi0gFWGBCmZvu7mJXcvKfZqRicbQ=
X-Received: by 2002:a5d:6d8d:0:b0:386:3d33:a61a with SMTP id
 ffacd0b85a97d-38a79244741mr521665f8f.27.1736197715562; Mon, 06 Jan 2025
 13:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20250106205635.2177321-1-Mr.Bossman075@gmail.com> <CAOMZO5DDDFAWoTsujKuUsvRews4dez=rc6a3+Hnaq5iyoL6T6Q@mail.gmail.com>
In-Reply-To: <CAOMZO5DDDFAWoTsujKuUsvRews4dez=rc6a3+Hnaq5iyoL6T6Q@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 6 Jan 2025 16:07:59 -0500
X-Gm-Features: AbW1kvZB24N2etW-yV-pwtC9S97WKTC4_Kq8j5gim8H_zQaiASlwEuz7cyMaGoQ
Message-ID: <CAJFTR8RYt0v+4WOLthdPUaLYHJeBcUFMz5HE=eA-Dx9cDo8Msw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ARM: dts: imxrt1050: Fix clocks for mmc
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linus.walleij@linaro.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_130837_877559_BD07D152 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 6, 2025 at 4:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Mon, Jan 6, 2025 at 5:56=E2=80=AFPM Jesse Taube <mr.bossman075@gmail.c=
om> wrote:
> >
> > One of the usdhc1 controller's clocks should be IMXRT1050_CLK_AHB_PODF =
not
> > IMXRT1050_CLK_OSC.
> >
> > Fixes: 1c4f01be3490 ("ARM: dts: imx: Add i.MXRT1050-EVK support")
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
Thanks!
Replying to fix the CCs and add Frank Li

