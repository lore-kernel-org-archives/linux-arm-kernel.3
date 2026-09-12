Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E2EC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3qwWyqi3bNUqorYQGcKxNjQwJcXGV0fC7D1AqFX08M=; b=q1XGV4G86l5WU5veJL6rvks/pQ
	oxhdQaYU6Mfc71/SFLrncV3iyc7ZB5uLIsyb4pyB5PrX3uyWpEVXbCzQxOI5vuaBC3O+xyhVi2Hcc
	BGdKpl6uIXcN4iYcwlceBBGUw2teJzgdB0WJqYdmZA/tbU81s915zHR7KklDuHc6/q4pV4OQ+yfs3
	TbOMQEgE90Cjq464OFuEFne3NhEKkosMquscPL83gRfQySOhLkbFLaXHd0DecBLb809dGl9MLDUER
	/eTrUVFM7hskpddr877zkYaSOfvgiW2fTqZL6gqBSCFq61XyDjeU5vKw11N7kygU/EJ2JlCuHl0XL
	yEwXM81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IlU-00000000ggS-0mxI;
	Sat, 12 Sep 2026 08:07:12 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5IlP-00000000gfi-3aUz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 08:07:11 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 0C6721380082;
	Sat, 12 Sep 2026 04:07:02 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 12 Sep 2026 04:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789200422;
	 x=1789207622; bh=f3qwWyqi3bNUqorYQGcKxNjQwJcXGV0fC7D1AqFX08M=; b=
	Lrt/fM48uvxyR5iY147Dg1TLUxzhC6V9WeE9G4Nf2xS4+pkFwVgvQlPsZgX1ObsY
	hxNwAbimSrgLpG19RfvyiSqHjWyUKu/DrU6GHqrd1Ny3X/qxb2V7PLMrwMTGxJ5J
	hxhHSDw6DzkOfUQoTLd/xCPLr0ZkyiUbbdsArhbOLbeDBOETI9bYaulAFEdBhhYB
	8yV92Rxc4ba4CNFpTlX1DQ8hmsjEd2RUFxoF2+d6ai2JCK/3mEz0yCBKDLCy0kT7
	MblYeZafK+CpuQ2/h4Xvl/E08vAxOSUkiRJzXlUswU1dssfWm8A/JrDq84M4L8cU
	2hzmROIQ1QhHapZ/aclkGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789200422; x=
	1789207622; bh=f3qwWyqi3bNUqorYQGcKxNjQwJcXGV0fC7D1AqFX08M=; b=l
	xb01r0kwHfIHCGkG23JDkVT0OR6WYaawzrtFN7BXJBAVCJeq1Uh+/e7Gg8JYmtXF
	1LCmYWrVh+aXxK5P/aKoegaKad7yStYYhFa5ivwWliqhk6EY7BLZYTcIbQ4z6YAP
	OgbD33qflDx3/fBJ5dTlkLlHBZs9X0dE/P17DVw8jlpi5mFAJYYwLaUHyVeXRB3f
	CdBLMEWG4iHPdsLf2rroVuXg2vYAKidKUSvaUd82yVymPftKPUW6ojD1IN5haV6W
	RHa8fD3MVF0wRBMz5082rQG2m7E0jTrMHkEZvxZ3XxwrNqgA6EB6PgmjTdxzlq1x
	xsRPvrz6z+1EwtsZYC6DQ==
X-ME-Sender: <xms:GwilaiM9DoEGXPS-5POglj3Fs3UX9dKSgEcrGATNpDMJPGNSuR9zRA>
    <xme:GwilarxN0E-D3ujq0LTikzEohK71z4qj5L4kuPdseBnDwMgcrWtIyG72C2_JeVM5A
    FBrlFgdq3_j6q1S6Y1dTCO0Qo2bNHyHI3LXOfX-aFV8Bj-yyr6y6g>
X-ME-Proxy-Cause: dmFkZTEnMfHZeL1bdmK0cMv43Ykw4Ux5EmKrIdL01M3dqOuqJ2lE5s/Zf8fR7tEIJo0kPv
    zWtV+y0PrEAHOjaSKsxSLCyqEt7BsSvRONex+NaaPtPqORZ63NRy+Js06kSKO6B4kHMOw6
    X66YzjTgLq7T2dVQ/Wy+z0mQ4yQi6eeqwM+Ha0y0Pecb27IXKwT7AyfrUjOgPW/ax0pbxm
    431ZmN3/a8b+CFj03gZG/0GqmMDdPzw9zIGPXhsnXYuTl1E61xnGM14GRGmIYVt0/4ruFj
    bJzQHDqH1XLMGaU36Dad0/cx0LiIfSRIILMzpeOL+9wHlFYdYe8pNXSPkjqQSck9kl74XP
    aCzd84oPX17C7TH8ROIK4AlY8as07h/xF1/mi69Tj3lPRbQOBi9KqgToWBN9+IbxAFo0Bl
    O91jo3tZhjZHGmsdRT5I8CZPH49W4wppnyIMbWnJORO8mrIahMZ6pRtbPa974ykxYGKMc0
    xa2sGvHlvvuBThI5t8oyZDRmkUDZCxhbR0R3u3jVuF2XW3z+rnrLNhMoF4j2qzzk8B1zZz
    lJPY/WsxQGZwEdKj8dXZcU/q8nWTM5JBnCaWjr2cJoG1Wha/0dH3WyaH3eGu7Az0Ec7QPm
    5/9iLK7Gy3Htywzk5qwWNhjRQMpdbPa/lgeqDfBz1ZWNbrYIda+j3gvZ7Xqg
X-ME-Proxy: <xmx:IAilakYs_TJapqNKc7Bl7_t1LCTdqWksnA1ncYoY1SxGbgOkM5mR3g>
    <xmx:IAilamUNZ9SPghoBE-fNuCRW3yvOkVXSEolaLNroFm67Oxs_i5V_HA>
    <xmx:IAilakGOzLYoRVy5sbiYSRPFTKbqOoOKrzwo-FEclMQe4BRLcwxJkQ>
    <xmx:IAilajCG69PBf_6_2kGV2BfXz2ckOvpTnN8WdA2x9XjMv6PH7RVuBQ>
    <xmx:JgilasFp5Sb1z50QC1Sew28jzpy_7_aNbHZVZSIJDSN67XqZa69ERdel>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 549A532A007E; Sat, 12 Sep 2026 04:06:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AK-jVwBtQCQR
Date: Sat, 12 Sep 2026 10:05:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Daniel Thompson" <danielt@kernel.org>, "Helge Deller" <deller@gmx.de>,
 devicetree@vger.kernel.org,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 dri-devel@lists.freedesktop.org, "Jonathan Cameron" <jic23@kernel.org>,
 "Jingoo Han" <jingoohan1@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org,
 "Guenter Roeck" <linux@roeck-us.net>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 mfd@lists.linux.dev, "Michael Hennerich" <michael.hennerich@analog.com>,
 patches@opensource.cirrus.com, "Pavel Machek" <pavel@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Support Opensource" <support.opensource@diasemi.com>
Message-Id: <937fb2c0-e910-4ab6-8599-ff5ea67fd9c3@app.fastmail.com>
In-Reply-To: <CAPVz0n0pBxP2J=5DN+k+ut0HRnTmsU64orXwxa19G0+WAxN-zg@mail.gmail.com>
References: <CAPVz0n0ryOns2sCJE_jFana9MVzwEj1QZuPEa8FNhGbHXnMB+A@mail.gmail.com>
 <11652e5e-053e-45b0-98a0-0c1cb2aeedc4@app.fastmail.com>
 <CAPVz0n0pBxP2J=5DN+k+ut0HRnTmsU64orXwxa19G0+WAxN-zg@mail.gmail.com>
Subject: Re: [PATCH 08/14] mfd: remove unused aat2870 driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_010708_934571_B00746BD 
X-CRM114-Status: GOOD (  12.00  )
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

On Sat, Sep 12, 2026, at 08:42, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 10 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 21:15=
 Arnd Bergmann <arnd@arndb.de> =D0=BF=D0=B8=D1=88=D0=B5:

>> drivers/leds/leds-lm3530.c
>> drivers/leds/leds-lm3532.c
>
> LM3532 has full OF support and is functional, it just does not have
> device tree users yet. I have a device using it - Motorola Atrix 4G
> (Tegra 2 based).
>
> Here is commit removing LM3532
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=
=3D46a6457870825d8b782d350fdc7e27c540734d41
> Here are my patches bringing up Motorola Atrix 4G support
> https://lore.kernel.org/lkml/20260721100245.444623-3-clamor95@gmail.co=
m/

Ah, perfect: this is actually one of two drivers that I independently
noticed as a false positive while writing the commit logs, and I
dropped the changes in the update I pushed the branch yesterday.

In fact, I saw that there are three other upstream dts files using
this driver. In general, I assumed that anything with a DT binding
has users, with the exception of the devices inside of a removed
SoC and a few PMIC chips that were tightly linked to a removed SoC
from the same manufacturer.

Thanks a lot for checking the list!

      Arnd

