Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE0BCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQreSMZcizUiDdYivY39+NvIk9xrh+GNkFREYZHeZBA=; b=IXXF2DLOgGhs2tlJwv3gQh7LG3
	Xv0fVTbu++eUli7g0HAAZEYjsr2IUgZwFFyx4NzRu2oIvOi3vcWDUHcy2f29PaO736fsLz7Cv+lwd
	PDNSjn2NVZ3gHmGFMoqqZMGscqu7VewWbMftUPU3rq8SgKqagn+fZ9ijmRJStdHaVL6ELW7MVGaVe
	QmG1kgXHsPBE7fpNPde8oLSOFHBWfLHRCOS5+02r2ULIeVc16KAHNMZbOROe4NDR6H4wGj++mDqoo
	S0L9MazBB6mh21mSfP3ACMBJn6gI8DYq25+xAIbeD5YfJiOsmLTGz3zVmvL050izoq+sFeitXd5FB
	tUDbFixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcfY-0000000Cxlo-0yiF;
	Tue, 13 Oct 2026 13:35:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcfW-0000000CxlB-1sob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:35:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A073F602C3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586331F00898
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898549;
	bh=OQreSMZcizUiDdYivY39+NvIk9xrh+GNkFREYZHeZBA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iAXWEmq4fOp7iufBpwIRZp8Q/oZpUVrRQ9UZAUOeJiGuV6c0h3Ya8Mafdcgz/drBa
	 22bRmdygV4uvvsyHt0c5TsL5UyDeBDSWTA6TffIBd4GmeP4ZhhuAjoHrOB7xbcPYcE
	 eoer6fEuWwR+I3HwV7IYrbg1Zgk1UxpOmTG3QRpwzujN7EFQPWPvTXpPiT1lNXAiBE
	 hoMnegD3N3xcSwmRI8TwiMKXxMx/UIE0rNMY8H3yf3NWdENi0IVdzd4e3HyHCp7gc3
	 gjdMTtPsnpIs3DeS9M5ERUkyUmwN/FsE2Y+3kaoo81X3uKLRLnFvlEKeZTtvzUr8U0
	 9N9CW0WGoUB8g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so2601767e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 06:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz8XrqhSRB0avFMyeEkNovmPSbGRxINXGEdWNN6iKeREw5B902DuAm5m2HEBVgHQeqkaw3U1ybn9r2rbbjQH7gA@lists.infradead.org
X-Gm-Message-State: AFq9FYICTjZiDmz4QaDc78xSyp161ZK6vEIfEoIKhSn9717C2ZnnB47k
	jLQYFAGW8533ldnXFfKYU/7ghYWl+LO9Y8c7YGltVpFLpPmCrCrFN3CLW40SxYYXkVXbvRd840d
	ziAnIm22nvu9vpfppEDv3EryIDyWFpMkG+JstVbgAQA==
X-Received: by 2002:a05:6512:3f21:b0:5ba:4472:75d4 with SMTP id
 2adb3069b0e04-5bcde6afa8cmr4940944e87.10.1791898548042; Tue, 13 Oct 2026
 06:35:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 09:35:43 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 09:35:43 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <as4tep73cAI57Yk7@ashevche-desk.local>
MIME-Version: 1.0
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com> <as4tep73cAI57Yk7@ashevche-desk.local>
Date: Tue, 13 Oct 2026 09:35:43 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
X-Gm-Features: AclHuK8ITRAMzeZzyYNFuZDUAjI2-0MeXgfOXBannT48q8bMwCyFujpuburhehY
Message-ID: <CAMRc=Mcc2b2Z0zrkNQ80NpV-H1MsihgeNtPD5dD5g9xcbiLg4w@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-media@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
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

On Tue, 13 Oct 2026 15:09:14 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Fri, Jul 24, 2026 at 11:40:59PM +0200, Linus Walleij wrote:
>> On Wed, Jul 15, 2026 at 8:51=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> > This is the finilazation of the work announced in the commit 61e1fd2ab=
ca4
>> > ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With =
this
>> > small series we kill gpio_request_one() and leave only two legacy call=
s
>> > devm_gpio_request_one() and gpio_request(), where the managed one has =
only
>> > a few users and high chances to be killed soon as well.
>> >
>> > The series is supposed to go via GPIO tree (due to nature of the last =
patch)
>> > with possible immutable branch for others. Please, ack.
>>
>> The kernel is clearly a better place after these patches than before it,=
 so:
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Thanks!
> Bart, anything needs to be done for this series to go in?
>

We don't have Acks from MIPS maintainers. :(

Bart

