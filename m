Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C374C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEIItaEioquLZZvHq7i104UnlRJA8Ih56/eY09Rxm/Q=; b=i+bL0PSEqO2Xu8T5hUc/am6eTX
	7z6ww9624B4tGol/nnvZdzhSk0CUOElfIjby/Q6Xz/p2oE25akyvcxr6WZkNwxZRLraynj7NMuk5a
	PvJRnrV+RjyPOC208rUsqVevpjNCy/EU8D5uvbwzB0pYVkUTqPtU3/C+oog23yY38DTrBj9uOM7XC
	hkkX9GvZpciuWdJDHRIetzO8PmnJq/YIASb/xCcsY4noGogCNY9jkQExtLKNhibQ9Uvsc+QmVQ3JN
	2YYR/9fWT+tVvBXmLz2WYccY/qwefY5pQWu3euyw09z4CZOvq7nr4AXmGSyzSQdFNgkWfUYqN7sES
	DQ+mA5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfVy-0000000C057-1NRF;
	Mon, 06 Jul 2026 09:21:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfVx-0000000C04w-1hoF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D62B9600DA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB821F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329680;
	bh=fEIItaEioquLZZvHq7i104UnlRJA8Ih56/eY09Rxm/Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FXdHA9JmrwOtLvFB29IzRxxVHvucYnjIapNFbDsL+s3Kj6hm47Rpw5yuwn4Onea77
	 KcazkpAYfJP3Sk67QwhCjxxHknWr1IDiWA2BLZWXS9WQPNmf50IJGHXesvU7x1WKtr
	 XLYUcsfippqAZw/xAirLEdjkwVKktcv5b5wSKkP0Lr9MT33dfIzblf1Y/4mTbgniXF
	 Z3tBxkILBxDoTdk6cWnGpVH9K8E/ccT1rZaSehXn89v/+Rmrnng3e6No1miug/yz0a
	 M49ngX7qJtIofnv03veO70qYbEA+jzBlmRb48w8ueOK9YIlnqHxR5LBLyYPOoGLgsn
	 9N7qv0ZwbAAYg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39b293079d1so23257971fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:21:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrTSf0puwk/YWDbwBn64quWAd4XxTjMgWjYdfqFyh/eydnGkj0jF8VAZuIk2myMAHOfTC/1OL+4TDAaWcANMhCX@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ+L1G+OgcgNycTcYZ6/sYhePp4biNhh9DyDiX3rU9hBp1Eelh
	BQJNVwzB+uvRKDMgQNYlsGzybILefuE7OXph8DzksNcCenbbWs822HlgI/eN2cdOsDjdO3M7KLp
	fDkPKn9xcYqUtOq2VKJYyu7p7OMow9FyZ5YzYfeAaDQ==
X-Received: by 2002:a05:6512:110b:b0:5ae:b119:872b with SMTP id
 2adb3069b0e04-5aed5086f19mr2179567e87.16.1783329679239; Mon, 06 Jul 2026
 02:21:19 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:21:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 02:21:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com>
 <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com> <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
Date: Mon, 6 Jul 2026 02:21:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeVOgXQGEFT=cQqSckLPhDAz8HTZYod7UMBN46ShRVo5Q@mail.gmail.com>
X-Gm-Features: AVVi8CcLBvN_nPV6V0rnOI6AAzL5NvuLGojL0HVPiqXaFSJwg2igVrhoiUtSQPQ
Message-ID: <CAMRc=MeVOgXQGEFT=cQqSckLPhDAz8HTZYod7UMBN46ShRVo5Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
To: Linus Walleij <linusw@kernel.org>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 3 Jul 2026 23:08:23 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Jul 2, 2026 at 10:34=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
>
>> > I actually don't generally agree, but you are using this driver more t=
han
>> > me now so let's go with your minimalist dmesg style for this driver.
>>
>> I get from where you stand, but the info level is somewhat strong.
>> Documentation/process/coding-style.rst agrees ("When drivers are
>> working properly they are quiet").
>>
>> If you like this log line we can turn it into a lower debug level?
>
> My actual preference for the record is not simple.
>
> I prefer noisy talkative dmesg when the platform/system is new,
> and new stuff is being added to the kernel in every release in
> large chunks.
>
> This is when things could go missing and cause regressions
> and it's nice to see a "hello world" in dmesg.
>
> As the platform matures and get full support in the kernel,
> these can be dropped gradually, because the driver can be
> trusted to probe properly.
>

But then people tend to "forget" to drop these logs and they are never
really *temporary*. :)

Bartosz

