Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8076C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0vA91JCy6e3U4Zy4A7u6z+5xLKwz9OO6mJyFAEDjWo=; b=DVdC8g7quZ3zK+yVWq/C74wM1N
	lRULaLv6fWYuh311Xlw+nkSQXovc9kOjwQRAeaKnEB3+1I5haa92grwOp8tnczsZvV73kLUs9UIYO
	Jik2p1S0gJjI2U4rzdxCMEfYbw6Cj/EJQc0FeEaRiVZZnJROYElifv0Bg4sCDKQKSgTmFOP4g9dcr
	BNuvW7vYbRTMhjYue7SGSIoMAAhQ/hD/ZU3IkYD2iMh6wRb4nTeGcd5nEnBEa4H9/U7DXltQ9hUQm
	LHt46loKGLIuAuVgGz2sJVe2+NzPW+Cu3zG8G/yfq341umGDbhJW6vGdzDtj4CJ3A9MNz5uM3ymuD
	H52gqMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTBn-0000000G994-0WlE;
	Tue, 30 Jun 2026 07:47:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTBl-0000000G98j-3j49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:47:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DC3543EE1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1551F0155C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782805645;
	bh=D0vA91JCy6e3U4Zy4A7u6z+5xLKwz9OO6mJyFAEDjWo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=X5JY/iSBvE5bIvOcIm0YQO9+bwx9WFalRg8XAdM/Dy7q/Oxzbe5Lkdbglu5fv0OUK
	 fJYCmcrcJ4/g5E3FdwKdBPnaotBLNmXbb9CFrnUr/E7ro+IoDK0sXIOJqsF5jzvDxC
	 u+4wKW4E9nCYz3WkKxgbil4glsu3fn7RvqeVrNXIkyRolwRwMM1hkhdCyiD3jWHJYw
	 kwCPOdcOxX8X4XTiAtrhb54ePGhfALetVicbqlcx76vjApOHgz18CZe3D6FHPSjES6
	 9AjqebUwzzoVRWUFStflre7HZDVvMAmy1dTZPWhBVKqjyv1iE3P3xynnO7atbg0hPR
	 0bEvjEPk8WHxQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39b011ae0b4so18009861fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 00:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYoo2HXAt3CBDM6vWx/BHrV5inXuzojwEOJ0WD3kL6Rx0EiF8+8/aBya1mEry+Dhf6x1Z++c7E1w+K1ocW+L+h@lists.infradead.org
X-Gm-Message-State: AOJu0Yys0p3/NI3ZJkVDmKAcpO6WLpzX0q3D7PfHKpuQiPzFgEeFg8FZ
	0jQ7io+wPAxLVJImVMFGF9eU4rloDZOtPFjhlvdZ7TNdkLtFF0044KwPK1wcnlk3vH7hyteAK9j
	gGy/5lKhIyP0+8qQwXrPIh4Qz1E/vSyzy2Pfk88aEmA==
X-Received: by 2002:a05:651c:50a:b0:39b:695:32a3 with SMTP id
 38308e7fff4ca-39b1ddd1aa2mr5206931fa.13.1782805643902; Tue, 30 Jun 2026
 00:47:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 00:47:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 00:47:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <31477953aace52bb6594461e82ddf99493af2329.camel@bootlin.com>
MIME-Version: 1.0
References: <20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668@bootlin.com>
							 <b4396f57-3501-4e89-9cf3-8dc5d7cad9b7@roeck-us.net> <31477953aace52bb6594461e82ddf99493af2329.camel@bootlin.com>
Date: Tue, 30 Jun 2026 00:47:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdJJnRTOSEecqpX-EddJRAzWc_1a-cg3wrW8m0jR2Fihw@mail.gmail.com>
X-Gm-Features: AVVi8CeaJi7AWd-H-Al7farjl69e4bGemX_zfvWwe4vajt3tOcP7qfQEh_ha7H0
Message-ID: <CAMRc=MdJJnRTOSEecqpX-EddJRAzWc_1a-cg3wrW8m0jR2Fihw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add support for AAEON SRG-IMX8P MCU
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 29 Jun 2026 18:04:59 +0200, Thomas Perrot
<thomas.perrot@bootlin.com> said:
> Hello Guenter,
>
> On Sat, 2026-04-11 at 17:12 -0700, Guenter Roeck wrote:
>> snip
>>
>> Sashiko has some interesting feedback that might be worth looking
>> into.
>>
>> https://sashiko.dev/#/patchset/20260408-dev-b4-aaeon-mcu-driver-v5-0-ad98bd481668%40bootlin.com
>>
>
> Thanks for the pointer. I went through all findings and addressed the
>   valid ones in v6:
>

Did I miss anything? I don't see the v6 neither in my inbox nor on lore.

Bart

