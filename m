Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57007C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asrF0u9bX+YETjMxSTJvh5rVP0ohIXEanddnLALRraw=; b=Bm2OryTJPcakkjaY4qLwi7vL/q
	TSL5cyYdjL3m2M5yBoia88UwdjrW58AMLmdvxRBCsYr3X+EZK0R2weBrnIRLHbh9EakQk/xKyhGdP
	NmZfImENGluS9iQ3LWnVAZ1flxhPJUh0xPjeLL2gTqzwBaW0rey2BXauBYWJOm0FSp9FbPAbJZCub
	8PJynuHfaBAnHYv/cvLzUiAMX8KTzXMb0lpfU1/WAKtVQbt5DaTq/jNTFYf8i0/HHeteMBtLiqrTp
	1Oz3ObICrNOdtWpBINkUjxltEZkxvp34fE6WafVlRajwoW+oqdQt1NnHifBhDWfAcKxYQwggXGqjI
	oUnjDTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZ86-00000006LiQ-3SF5;
	Fri, 03 Jul 2026 08:20:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZ85-00000006Lhv-0cti
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:20:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EBC2600B0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 08:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B661F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066807;
	bh=asrF0u9bX+YETjMxSTJvh5rVP0ohIXEanddnLALRraw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g1/bkJbupZAlyCSXPu9bCHa/ZtEv3YBBPrFvwDfMqKh1hRimkfftfU2D+QeiG0WxH
	 9I2iEd1rp9LiKxrWq+A7wkYsNjRfdJ3CAf7kZyCXVDyLp2biehWBiscW+aZE79nMYF
	 S0gn5GV05EhW2jwI2ECapG4WdqBqjW3w308NJchwQnHiKdM5AuNseQ8aHqru0zSr0w
	 CjZMoODw/dOYmhCAtpXkwqL7zV/S8Yl28GBKX2V3VqEOv+Ti+jXFJ08Hl3CiKRBedo
	 t0ec1+k9HnKreoy3X2zSt8lEVGxlsXAw7hy+tApOT+Ar4+ftStPHAcHDMGJAA6i5WC
	 vzeui/QEqXCpg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b19e7d6fcso2556211fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:20:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr/e0+ofsqG2ySbWxOcguCnHED3CvAa6Sc97dSTGFBUGj2YiwMpiaOu9DQFYBirAv61JCb0LcjEJW4KoP9om6wp@lists.infradead.org
X-Gm-Message-State: AOJu0YzSIoy5S4APOWaNXwAuEBq2GxpnVFRUIQaP8+SFQGKS27P/Z9vn
	xuYbLcfRZxtfy0/4mDPuFFegZKVSe7+r4TJS2zOb+QfPNbmKu7Ma/ja4RArtMoNzZQQ3j1+W+d8
	QhukSNeZ9qR9jDwug8CjlzM2QVaAvDt9YoejEvqALwA==
X-Received: by 2002:a05:651c:1547:b0:39b:3018:fdba with SMTP id
 38308e7fff4ca-39b340f3e6dmr20771621fa.26.1783066806661; Fri, 03 Jul 2026
 01:20:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:20:04 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:20:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com> <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
Date: Fri, 3 Jul 2026 03:20:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfKkd-FYA+4-jjgSW+F34ShotOY3Jkq5vuEmOGCtfYx3Q@mail.gmail.com>
X-Gm-Features: AVVi8Ccaevf9d4eyRM_6Pqww_NGDFnClLnLs7TOb7wYTeUcKNISsM-dwHisAhxs
Message-ID: <CAMRc=MfKkd-FYA+4-jjgSW+F34ShotOY3Jkq5vuEmOGCtfYx3Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 2 Jul 2026 10:34:02 +0200, "Th=C3=A9o Lebrun" <theo.lebrun@bootlin.=
com> said:
> Hello Linus,
>
> On Thu Jul 2, 2026 at 10:00 AM CEST, Linus Walleij wrote:
>> On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>>
>>> Successful driver probing should be silent. Drop unconditional
>>> dev_info() call that is done at nmk_gpio_probe() exit.
>>>
>>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>>
>> I actually don't generally agree, but you are using this driver more tha=
n
>> me now so let's go with your minimalist dmesg style for this driver.
>
> I get from where you stand, but the info level is somewhat strong.
> Documentation/process/coding-style.rst agrees ("When drivers are
> working properly they are quiet").
>
> If you like this log line we can turn it into a lower debug level?
>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Thanks for the reviews Linus!
>

My personal preference is for silent drivers too. You can find out if the
driver probed correctly from sysfs. Only if it didn't, do you need to know
why from the kernel log.

Bart

