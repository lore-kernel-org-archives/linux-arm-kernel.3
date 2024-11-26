Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F3AD65559
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 21:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h3kJfGGhVM0yFSXEKXnzQX8yDxkzOWLSNwlq2YprHM=; b=HsqQa0A0Ly4F33vppNgHM7+fmj
	xwm36DMzAu50qW6WQKdq3lF1my7Aqcgy0iKlrhFzHMXwkQne5FxLm5HfbOn+JO0ReGMjE9bYh1RWP
	K/qmNRUj76/4PHYzDqG3WzjWEISXfdz22UJ7SPw5dlG8mXt0Otu9+Pv8ohNggqU95etgZIyMbAmac
	xTCPc42eoZxsjoZBqCTmnBEfGnxpdVqSIRjmB3cRP0gNVU8RfjMtflPxyd19YHmkM2t4Y278KDZcI
	iWBYhrt/99aZppxw1TlyP92x5L/lVprZYQP0Xwe8EXj2qmSUkwVhXMP9UWqZFR7aMNfN/9nLIrnJ/
	AludIr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG34S-0000000Bkph-2Tyc;
	Tue, 26 Nov 2024 21:26:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG33U-0000000Bkhy-2zIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 21:25:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso1410826e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 13:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732656306; x=1733261106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6h3kJfGGhVM0yFSXEKXnzQX8yDxkzOWLSNwlq2YprHM=;
        b=xN00FIOq6yWVGFSFBYldO51p87wAYacRE8T6FDKkvfYO7h+GAysdry1XPelzmdDH6k
         nqXtazi9k/SiFetleRsQlYIBfVS+OYkm9n8HYCzwiv512Ra5DDUaW6lKAAiRs9SofEfN
         3asnImFo64lN5aqqcHEqe8AZA5bR/qzdHuk9NLTF29p2xOb48uYNuZLoefdnyiwyizeQ
         jE72+20zG0ps3W7a8KFn1gLEfwhDZ4aW1D5S8sG1bItKJ54790a6oVoTw0XGWHm8n+tA
         +M5nFbSXwEPQO1T5jNl1OBVwAqcye3JXq6M5wZEzfJ+M0coQjh47xWbk0y1e1tByHpOw
         8Chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732656306; x=1733261106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h3kJfGGhVM0yFSXEKXnzQX8yDxkzOWLSNwlq2YprHM=;
        b=WEHwdfSDfi4PRGvFAqv355nIG2P7/zEvmXvI76XXEGcr/W9ztEuddDdwGOa2XA1Zvf
         y9vx5xpZosmH/WM09wTHvW+v/qop5DjzFt/GQjxOp/XKVejV6mLJrYWNm9XInqxbeZA5
         56Lz84JWm5Kqwg1BnhcXW+M+OPDLYof09Bn8F2T+hZb4pLSwtFeoFmuzz4bURKC8I84O
         x7ap1tvDUuysMyQgFmFL898mhbAaqcjBtZmIHPpIq3wWvwCGBFJJKrLNt0VwjsOGQgWi
         JbAwthsMcp8zmA/EWiXzcKyu38P1XKK9b+YnRlaGY/VYruNkJJUjCDEh1eLwSgR2LgKy
         LS0g==
X-Forwarded-Encrypted: i=1; AJvYcCV5SsFLdmqH5d8hau1hwXgKfggrUMEZ3E442sxUqWOebPU/JreLYpcwcUO2g3ZRmlsy1ZZqSpj/ZiYdaxEuj9XO@lists.infradead.org
X-Gm-Message-State: AOJu0YxKmj46JG7f/dzJj0KHuDgMI5IJ8FmgHFHCwP+3lAX5rh7uT7hM
	ISZJJiHRwkL6G9mg8YwuaUscmYQ+kPGmX66LZdytsqySnzc390Vl1qVF2rJPB38Ey97nC9fuzaG
	WT8aiop/XQh/NTerCxhpAGMJeEmDf+3h41g3aPQ==
X-Gm-Gg: ASbGncviHioys4UwPUwGGWuMaccEKV9qHOj0ljkg7abF2L5t7GIyuzV7dztbR0B2fMv
	ayDvoSR8h3c1TOmGI9UOkU/LdAW6Qtg==
X-Google-Smtp-Source: AGHT+IHSrPR6Pqpyg4e7ER+ek3MH0oeiQVFy40chfxmpilpXRCIjRdoDRTm7U+FqL/Q1H+0po9DrV+HI5wtgsosAtoA=
X-Received: by 2002:a05:6512:3da3:b0:53d:d3ff:85f1 with SMTP id
 2adb3069b0e04-53df00ff18dmr264363e87.42.1732656305985; Tue, 26 Nov 2024
 13:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com> <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
In-Reply-To: <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Nov 2024 22:24:55 +0100
Message-ID: <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Guenter Roeck <linux@roeck-us.net>
Cc: Esben Haabendal <esben@geanix.com>, Russell King <linux@armlinux.org.uk>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_132508_752555_9BA18B7C 
X-CRM114-Status: GOOD (  18.75  )
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

On Tue, Nov 26, 2024 at 5:17=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:

> > Making pinctrl drivers and subsequently the pinctrl framework
> > user-controllable, allows building a kernel without this.
> > While in many (most) cases, this could make the system unbootable, it
> > does allow building smaller kernels for those situations where picntrl
> > is not needed.
> >
> > One such situation is when building a kernel for NXP LS1021A systems,
> > which does not have run-time controllable pinctrl, so pinctrl framework
> > and drivers are 100% dead-weight.
> >
> >
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
>
> This patch didn't update default configurations, meaning PINCTRL is now
> disabled by affected configurations such as imx_v4_v5_defconfig or
> imx_v6_v7_defconfig, making pretty much all imx platforms non-bootable
> unless the default configuration is changed manually.

Since the patch tries to add default selects for all drivers I suspect this
oneliner is the culprit:

@@ -6,7 +6,6 @@ menuconfig ARCH_MXC
        select CLKSRC_IMX_GPT
        select GENERIC_IRQ_CHIP
        select GPIOLIB
-       select PINCTRL
        select PM_OPP if PM
        select SOC_BUS
        select SRAM

Should we just add that one line back?

Yours,
Linus Walleij

