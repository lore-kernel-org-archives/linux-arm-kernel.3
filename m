Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D2ACA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:Content-Type:MIME-Version
	:Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poceB6zKoYQu2FsWNzDmrgG3238OZ8RROO5Gpc1RH5Y=; b=e6f8yYA069oxyY/+vzX4oJ2593
	krabqnN1qK9U+eZW8Xh4rMJpHUaXQ0h1b3Svym+bTE5tT72igVo1VMQ+w3HVUYI7sGjPtMSkPoRVV
	X1lZsaELjtDTIi1FvFjS2xIUu69oAqpj9h5zORdlvaOA+cpc+gU0lnkBY3GtfGsjQe97CzBUR0IUd
	vSrwm8ySPmd3qHvDyfC+SNER7Pyr+Q7QMUECLsfB2GWrLXyQuhHyp6u4tkEf6jHG2LkDTuGY48h1+
	jQ2CwjkC/lJulqq2YBhklT/Cu948lKe/L9/+HMhisg3j2dwoSe6nkFx1zbKTU9YTgdm/aGXZDRK4N
	e0BxWhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsQl-00000005rgB-2R6e;
	Wed, 30 Sep 2026 11:24:59 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsQi-00000005rfe-1Rm4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:24:58 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so28260455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767494; x=1791372294; darn=lists.infradead.org;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poceB6zKoYQu2FsWNzDmrgG3238OZ8RROO5Gpc1RH5Y=;
        b=gqo3fZm37mUgW15qi+wfnzypYNl2kZ0zmy6uYR7qvGS0WxCJQ5T0QhPecCcdAsIcqy
         RoATXsYNzsyB/jh/tKzKx0VHqAn3GbwjuOJ9SaD0RY+HuShCyfAtrs6cSGmdBfTYNXLo
         N2JNxmh3mapr67t5hHBAHdfK8R4+zWjF1ZG/eSDjFNzZC/jgwy/XFSsM7ySqLpDqbX4M
         vpRdiB22FbnVAB+EG/LvEzsExVjK1SbL7cth5gSgqMJmGph1QbG7/Q0ymbEsNe0BOco8
         h9uL3LoAuMpzzIYNykcGP+pfJ98/GHfZQXYiFx0TzoYjAKjZsG7hVAelZ8Zfb0PIJI76
         15SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767494; x=1791372294;
        h=cc:content-type:mime-version:content-transfer-encoding:message-id
         :date:references:in-reply-to:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poceB6zKoYQu2FsWNzDmrgG3238OZ8RROO5Gpc1RH5Y=;
        b=t5Cbt3OsW+a1OP7/xmbDe1cUHNkWIyrhe1IZqCKQ7rR3ZuusUJCWqAjRFt/a62/a6k
         z8nyIkpJ6Ewt/mEIVy4HSD4noAIGigMaTTIsg46FW8QGFyukbRescMPmd/02/HW/or4p
         Nl1wILKpbR8252tUJ9Gzvhzd/p1B/bSGWKjy5gslNZb4u2tLbLyjbW7mShLAQEfZaAto
         YuVlc0haVJWex9dxKJpQE9l02a7Y9pUU7VLmOWLOZbhQpFErijZOgYKy1kn0Lyyq4HZ7
         yhrQa9/4/mYsTGlACXR7kmxazoCUwt+YmwwaxzsVp5A9kg3WejRcsXbwCViPhCnzFNuy
         RfxA==
X-Forwarded-Encrypted: i=1; AKwUvBwq61JtNLuoj+o9190bsliZof8ayyxtrD9M5h65vliyLkLpOs3pWf7gnFvQ2WIv0mSkQ5cmLfO3pf6FrspT/DQo@lists.infradead.org
X-Gm-Message-State: AFuF++mCCqDWYt6ZBUDPRb0PLKqg2pJjaDnyiDLkQTVyH7CzyvrO554W
	eecNYPU/btvNL/feKhd5mgdi/vOwI9t6C4yrxb2ubHFCeUu5bbsqyBq5
X-Gm-Gg: AYBFou2xc9HkwgQTYHCwEP9bj1NYsW5EwJperT4czdxWUZlJHLIsCMk2aIbEmacFZ6Y
	LZv8Q02vAuZLVNy/1BjVkQEqMMDgw0iNXaODooYTUjzSG5y0IEqh5gFRRJRphyjiBVxTt2RauQd
	1pXhEjc7H6jdY9DeYrOLY0TmcdGq1TrWYp9j1LOxT9TM2Hduhc1kDlRDyisp3KNpdklpyRH59T8
	+bnKyOadLuF6ub41i7EvIV7t31Ec7+CtA5lroLKJYQWXQ54eb/H1FKcdE+euGdOPjNbp+Y9bmu0
	tVK4cwJiN9Gi888T/63sEECHnX0VpKW1re2wVnw/Hc0CZBv8zF9kClXWUrlRBmh0QAGsMY4ZETa
	2NJa3pxefdYBz8Erk/pu4vjdTNKuVJfvEYYOx/+AeAjHoGmMH2fiXoBbbTsLw8Nfvx0dAiu3Bp6
	5ehjYqrZgmIZjiybySniyL7eqqEZ6KkhoEEYzZ6dB9jE6dGeMkSqFPQV95ckE5+TOHbGiPYS8Xs
	Y1oeWQtjTHztwlctVL/U6OS5HQ/ZDfl
X-Received: by 2002:a05:600c:3b0c:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-4a01aff4fb5mr16519855e9.27.1790767494156;
        Wed, 30 Sep 2026 04:24:54 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01cd002bcsm3626105e9.4.2026.09.30.04.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:24:53 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
Date: Wed, 30 Sep 2026 14:24:51 +0300
Message-ID: <179076749140.3134070.3869742286743401078@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>,
 Jason Li <jason.li@cortina-access.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_042456_826841_B0776043 
X-CRM114-Status: GOOD (  19.02  )
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

On Wed, Sep 30, 2026 at 01:08:07PM +0200, Arnd Bergmann wrote:
> On Wed, Sep 30, 2026, at 12:57, Linus Walleij wrote:
>> Look at this in your Linux tree:
>> git log -p b61c8bf4694b5115766849378dcb8787ff54e65e
>>
>> This is essentially a resurrection of that driver.
>
> Jason actually came back this summer to try again, see
> https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-1-jason.li@cortina-access.com/

Thanks, I was not aware of either. Comparing the two, it is the same
IP: the offsets of CFG, RX_SAMPLE, TX_DAT, RX_DAT, INFO, IE and INT
and the bit layout of CFG, INFO and the interrupt registers are
identical. The Cortina Access version additionally has a flow control
register at 0x04, RT_TUNE at 0x0c, STATUS at 0x2c and three more
interrupt causes (break, RX underrun, TX overrun).

>> Anyways, clearly this driver is not just for CS75xx so name it
>> cortina-uart.c simply, and update symbols accordingly. Kconfig
>> should be SERIAL_CORTINA etc.
>
> I think we clearly want a driver that works for both the Cortina
> Systems CS75xx and the Cortina Access CA82xx, hopefully that
> would also support the ones inbetween (CS80xx, CA81xx).

Agreed. For v2 I will rename it to drivers/tty/serial/cortina-uart.c
with SERIAL_CORTINA and SERIAL_CORTINA_CONSOLE, and name the binding
so that it can take the other parts. I would keep SoC specific
compatibles ("cortina,cs7542-uart", later e.g.
"cortina-access,ca8289-uart"), so that the flow control and the extra
interrupt causes can be enabled per compatible.

I can only test on the CS7542. Jason, would you be fine with adding
the CA82xx on top of this driver instead of a separate one? I am happy
to add the compatible and the bits you need if you can test them.

Thanks,
Fil


