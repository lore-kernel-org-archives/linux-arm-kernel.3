Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCjnwi8QfYnO+8yzfpol694kVs5T+6OkOnlzLTl6vgw=; b=LopCsYfFsn+PvkC9lUKXKNnGLP
	KAhQf/qCCXKirks7GXtQa5fjheCcb693G6dm47ptR+nHkWlRHlLbCnl/ua6ieXZDYfUvoMIMzlF4U
	s8jhsZ56DkZZu34ZJvVoh+MPEQmNU0RAwa1yUEoBTQRkK1fHUXnt8QGTYfTQtC1E85oHEk+vh5en4
	8PSRcU4Jzlauwpl1+6wF+oq0ePex8SWzpWPXqa4X3SFwT5vkYP8zx84BtN+FgWKpMrbC9JJwhVEFG
	XbfENmdhiGzHC2WB5hhb70BnzCLOx7wCAqW6Q2+G/gwxBlkz0b4C1ZEqwOzpVzJ+61LCdH31kW9Sz
	5lbSyomg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqMn-0000000126X-3joC;
	Wed, 01 Jul 2026 08:32:21 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqMm-00000001262-0UKf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 08:32:21 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 10A071380095;
	Wed,  1 Jul 2026 04:32:19 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 01 Jul 2026 04:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782894739;
	 x=1782901939; bh=VCjnwi8QfYnO+8yzfpol694kVs5T+6OkOnlzLTl6vgw=; b=
	pk4AtDVr7X0Ga3ZeWprkuDgz4D0ADwYPDjiF6dJpeDjRBJwKFomQfgV1i2cUPfwS
	YGG7oxHtxzxWOI/oCF1vTenXM/Bxnl+jzvqa2o4Uav3luge6v1KsVb0Z58Ux10SH
	ihh0bvVj3hWOmrddUlZbKOAN4x35MKqgbBPgbBV3RnkOt941tQlZLmtzA0NS1gVa
	wZi+BX1NBKmJrTAwiAoLRjtW42OtB7SEAhpJrWi1lBjP1k7jAL8lyCFZnVDg89+r
	yq3ugkbXbTZjzlXrAoPV90L435jnotEuAcLSM1fiUThBWAv5FA+0Gj5gsyx2KLQ7
	ZckqFzlkSmSQZ4fn81X3Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782894739; x=
	1782901939; bh=VCjnwi8QfYnO+8yzfpol694kVs5T+6OkOnlzLTl6vgw=; b=a
	PVd6uLEv7fU/TFcABcQ+6PpHoMr8BHiJ+7VXlOffrKOqC36QNz/tVpyV3NvzfTod
	D12qmE6PIf6WHNeISxeR2PjY2027TmvjNXrFxvtY38cmVNKGAlsBHfYZaEPMldtj
	Lx4aKKaBkPRT88prowJPqxRuZQHVZjBoqJ5QCw0xSe6s44p1rQ086mjOsoX28TPW
	9xsDJn/pATFSr1374Jh2BlzoBgdD3L6Pec9oMRKCmjzb9eZyHTCmKVWo3RDAktE8
	tNkami4hj34GWAN2LivncENYiAdNktm7yzF+45KtV6dfaEprjLbvQJRIJu7kUuvb
	iayg2SwCno/GXgKqzIgsQ==
X-ME-Sender: <xms:ktBEau0GTKniJ8UB3YIuVYzf3eXVLN7QylKoL2Bg3MvVCc4pVtvVDA>
    <xme:ktBEar60oidT1BA9rF5zAoFVaPJxONWxBjLfRIadX_dUCe2QqF-rSuhjZX7RPcIt0
    McilfieaxXTrUq93k9EhmP2DAH4aUXqX6JoopoRear13Gt0vfqWdww>
X-ME-Proxy-Cause: dmFkZTG0B4Rq0E7HZkR0pnZ163rac2T7w/EKBvk1H137+LZ1DDmAdSv9ox5RZtU3ubf1at
    u6WZgpkWy1yZ+xPhMEysBiXHkI/FAG+tA+IsC7Ro0iyP9baBdW/Gqq+MlndGYuJGyVzQes
    sd0BE3aLNH4YSDGlgFLBNAaYaG4sOQZZhfVJ0T/DQs+GdE4ZINEDpFh6AD1t6CMHbDFHDW
    Dyb4WNYJUZVB9C+3CFefMMbkInAN2w2O60GzAhBejddPbYdKqDE8euqw5cyFrUqYL7HsI0
    R+mzjjbALXsHGc4CbyBPpSyrrc7KFjZiKMINe5pj5pPVKzR16ORlRpADFkdNJmxEZmU+Hi
    ynyy/p0s3wJ+5wEoNPryrkVk9wTT8gYX2NL2ziGtuHO0uNldRlrz3biDchZ5dvxLIoQPIf
    4Ys0zoOwEAUJHKft5OKDDA9H2IMg5sfzB6cDfIpFIN0QNKHe1GarKKRW9xzRvvwFTC0xOM
    y4BJJZ5HI/iFaCrklCySRsAU30y83NuxwPgF9nAHDnQAYLQGdVKWf6ZBWmjRbJTc4RScn0
    PuPIT1IbJ8nqZLck0tWGST4XHneH+nQKFfqBV2Q8vd0Qp009muP0neRLplYkqbtscaQsro
    HqRhq0vRLrdvrrofCQK3xJLqp8yB0cEt3pLS1D0HPb/YWgaYMdL06KmwXiqQ
X-ME-Proxy: <xmx:ktBEaqLzev-1LnQpM8aDMtsrxpbXI8sZxIxM5-kJ2egQIJ0_s1wuwQ>
    <xmx:ktBEaituhqNUPSQSy6pSO_Qxs07LiQTb2hOujvou545SdGJ0hWLeNQ>
    <xmx:ktBEajm5fZl4R56Cjs77mdXM8OA19dWCSOQIvEyWIusUmQRiQ2DdOA>
    <xmx:ktBEaplfx6UlRi6-9Vko4Drjuya6hEFHgk8ptOVgSj4h5IyVGGcNBQ>
    <xmx:k9BEalsyhw0QnIjnuvZrS58BD58_C1KJuzD7-U3z5P3C3pb2O69T_it9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1786E182007E; Wed,  1 Jul 2026 04:32:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A045QOfflcQ7
Date: Wed, 01 Jul 2026 10:31:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
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
Message-Id: <72746bd8-8ba3-4369-a2e9-60795f183813@app.fastmail.com>
In-Reply-To: <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
References: <20260629135917.1308621-1-arnd@kernel.org>
 <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
 <ff4d7043-1929-4fa1-ba5e-f28403ad6fcc@app.fastmail.com>
 <CAMuHMdWhv8i6tkmOJU_ee9LAV7mMcQHe9FXgqTHCjGiEMWvn8Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_013220_250625_0CA31DEA 
X-CRM114-Status: GOOD (  19.17  )
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

On Tue, Jun 30, 2026, at 18:01, Geert Uytterhoeven wrote:
> On Mon, 29 Jun 2026 at 19:54, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Jun 29, 2026, at 17:29, Geert Uytterhoeven wrote:

>> > Same results for instantiation using sysfs or configfs[1], although
>> > the latter does have optional support for specifying the name.
>>
>> I wonder how many of the other instances have the same problem
>> then. Would it be appropriate for gpiochip_fwd_desc_add() to set
>> a name itself to address this one?
>
> I don't think it would be appropriate for the GPIO aggregator to set
> that name.  What we want to print here (for debugging) is the physical
> GPIO that an aggregator's GPIO is mapped to, not some consumer or line
> name (which is not guaranteed to be unique).

Ok.

> E.g. "<chip-name>.<offset>" would be fine.  As gpiod_name() can only
> return a fixed string or an existing string, it can't return such a
> formatted string, though. And consumers don't have access to chip info?

The gpiod_hwgpio() function is exported to consumers, so they can
already print that instead of desc_to_gpio() if the local number
is sufficient. If we really care about the <chip-name> portion for
any of the debug prints, we could export another function that
returns maybe gpiod_to_chip(gpiod)->label or
dev_name(&gpiod_to_gpio_device(gpiod)->dev), which are both
constant strings we can print.

It looks like we can also replace most of the remaining callers
of desc_to_gpio() with gpiod_hwgpio().

       Arnd

