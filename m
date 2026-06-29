Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF56C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQSYL+rcbbMvXGkfQit/IeSyVBDzp7a1uiLZytls49o=; b=H39+aY/lZhN9g+cwU8kc4eU4J2
	pY8IHcGX9KXwM5PaKlm5WLjRYzUk82l62OPorT4mCBdJMbYRkTGABJYcO8NqrsjNG/+W5LyiYk7xJ
	kw3TSEY06BU5tznz0VYFf22dGqqyI81tgHYan09LrVFb2D8m2L7tV94yqd4+1o5WZIXNwYEgP3yWm
	q6CmTIapomoblSldyaTNnnuUgvI/wZ3IbhNEXCe2l/d/MMh4l8R4zGc9GkAsWFsBomNDpHUx4BZR7
	MVPPzw4eFCxzZfKpTBx2WLjOIMJzsxFmaezXi9qqPuePY4aQPTRiHrFyAchlCRP9qUOegl/0HCWh7
	5If+O9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEDr-0000000F7U3-1R2J;
	Mon, 29 Jun 2026 15:48:35 +0000
Received: from flow-b5-smtp.messagingengine.com ([202.12.124.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEDo-0000000F7T2-2VEk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:48:33 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 7F8A013001E3;
	Mon, 29 Jun 2026 11:48:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 11:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782748111;
	 x=1782755311; bh=OQSYL+rcbbMvXGkfQit/IeSyVBDzp7a1uiLZytls49o=; b=
	otExSv6CCfwgU+53OmRzfq2B2DYzwG97/7OG2yFVL9SLp2zuXWfhdL/w+7nIA4id
	pS7hJpE+p/zM36qUEbCM1LqXAUyUGB34hT8s1CLctdvUhUl0w1ZhqpR2HIS3PV7o
	bsnIFZBboF30NjRkOQ9UT+Q8NXhm9E13I7offTJ2aRcuG8r2Lm82KoHQohaMMwV5
	1pog70vnywIoIEN8MJJPZBLCU4XXKtem9FHI/gOfgvqsBOGTC7GkxZFe5P2Lw2ga
	yjsSm7K9GLJMBOqJ4k1/I3YVG3A8X1aWU9NyZdVYzw3BMgCE/ro9EeoLtAyGzeFK
	Pl4J0bO7j6edaTVNsgNFEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782748111; x=
	1782755311; bh=OQSYL+rcbbMvXGkfQit/IeSyVBDzp7a1uiLZytls49o=; b=Z
	P+OSo5yef9/cf64i9oZY96JMQWrkgDB3///chYutdOeJnhuCLMIQBthaTPJcoReA
	A42wB43XIfLOAHZlUSZRrEWmaIkkJVPyR9ZrNj0Zg79fjHX5GNwFKh44vBnstNjs
	+gKwPg044HSnH3p4e5kEU8/gJdXnd5J9rcJgbSl1CjuvG8G/lzCfuRrzQSuK0yFG
	nAQ3o6X2C2t4pALrCSMONEpg+Bh0sXEMP7jMgbrh5fxsQE9kGxPzz2YGv3rx56Gv
	vpRCb8LQ5USUCARnUKXaPOljl/bpYRFLx50FMB3vSHHH4V2/reUKPVgJULvxVire
	Mkj0fQjdTFT7fm+9wEFeQ==
X-ME-Sender: <xms:z5NCakeBygjeAHHHThz3dUsTnvB6AK_UVMjKz-WZKZVRr2lluk78FQ>
    <xme:z5NCahCpYUk2lb8a1RbHVmyXeGBSy5l5DdSrmUr_uS7YYPkiTX-Ewa_wUd6Pe47oi
    fqqLUBT-9g8HmIrQlngZpk17TUMnckWDzEtut6NIZEoxunmVuyUuWA>
X-ME-Proxy-Cause: dmFkZTGx/zQGI8s/7q5psZd2hog4QvvLF8VyS3SEh6yndDN0NLF+SUROST5TuJaRfbYzsR
    kRNLz+nZnLIWxTAnVDEiVI3LWMoT76m1NPebPhT28iJCWPXc0GO7oFLEPDfrdg9tfzroWb
    HnrfV5e1jPmjz36LnDV+54JGw32aQMY40K1t7WiGcRFvXEmQH6xS4redW3l3jMN7eHVHXH
    OMUBqc4hdT1AWM82wO5kRpwsYMYMv8K7MRSSgj1UrGhr0ZavzP88ve8YyHNE7ly6hSja/5
    QiP/FqZsNFQZ34zbxnGfKyKytbn/wMNNFVGFjw0DXOPPa8n6XjB/fzcu7YZiP8PrvEJSOd
    l8wa/9o9YFghE4nmtzEFNP5GHS4DgMKC4w2rG1ksKG4K1tNod94D3VEihl/RxyL9ohAzRZ
    DV3gAxtenHg9Z5cQJzoBipUKZ9pqhmJudtox/jlSGg2Nc/v34rLMtOwqFKQfA1uoQshteX
    Fj+AMNKhMnJ4QbvjVI2RQG1hwfF0E+t7vkI/rh/pkR03lll3huezz0P+7sfFgS0BBFEc4I
    tgwdiyeO6AWLRMbzNKqGc2BGlgFQrUK3BgCvUK9m1iH9OEbmB8sUgFESS3o9AeJDZgiza+
    QtMgrmbDhds3U+BZzmooK8ccK4+ZTU4CwBh9Kr050guMXdKmxiwbffVRqy2w
X-ME-Proxy: <xmx:z5NCaqnslMw1U4x946I_QUjw_ET8HBcAAsdnOpVQMvFlVCBGjb5OEQ>
    <xmx:z5NCatSrHaFps5ZyxX5SqaW3oWWvqcDK6TzS14FaET5Pf4npQ179sg>
    <xmx:z5NCanXHY9GeHNVa3tjFzINJQ_mrCW-T7sCwo55oVGN2tZsh_Krxbw>
    <xmx:z5NCars5LXs8k9icxryzzfrpvBcoTsGtWAAjyBjSc4vWQn2-iQYc8Q>
    <xmx:z5NCarutsUgfjq0e6Ud1ZnN0qPM1Eju682i8umHuTCrQdRzm5WnqOIk6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 215901820082; Mon, 29 Jun 2026 11:48:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A045QOfflcQ7
Date: Mon, 29 Jun 2026 17:48:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Marcel Holtmann" <marcel@holtmann.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Ulf Hansson" <ulfh@kernel.org>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org
Message-Id: <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
In-Reply-To: <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
References: <20260629135917.1308621-1-arnd@kernel.org>
 <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_084832_699157_05E85104 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Jun 29, 2026, at 17:29, Geert Uytterhoeven wrote:
> On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Most remaining users of desc_to_gpio() only call it for printing debug
>> information.
>>
>> Replace this with a new gpiod_name() helper that returns the
>> gpio_desc->name string after checking the gpio_desc pointer.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for your patch!

Thanks for testing!

>> --- a/drivers/gpio/gpio-aggregator.c
>> +++ b/drivers/gpio/gpio-aggregator.c
>> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
>>
>>         fwd->descs[offset] = desc;
>>
>> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
>> -               desc_to_gpio(desc), gpiod_to_irq(desc));
>> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
>> +               gpiod_name(desc), gpiod_to_irq(desc));
>>
>>         return 0;
>>  }
>
> Before, this printed:
>
>     gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
>     gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189
>
> After, this prints:
>
>     gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
>     gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189
>
> Same results for instantiation using sysfs or configfs[1], although
> the latter does have optional support for specifying the name.

I wonder how many of the other instances have the same problem
then. Would it be appropriate for gpiochip_fwd_desc_add() to set
a name itself to address this one?

       Arnd

