Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D839FD1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHRJUUe4qBU3jMnR/014D6ykMod61nDwsGapWt+8eV8=; b=Q+nLs6vVIZ1tOt56ggYHk1qg3F
	sKpzcKxHH9uewXBlc56QOPD/7TkePf7FedBGFZL0WLkWPk4liJhD0yxdSScPoQz7wsccxvWW3sDHD
	RHZYMtIHrBaJ3pQNxUlAjOtYa8R6shJE6mf5NeTXuLsDckaqBNkV9X5eOZQL1VeTT8ksx1c1g0MZA
	XmktfrkKIgfcBSaFjNQLnrwUDxhvr7zXQrC6sE6ufackP6UdxI12s+PWNsT9czBqexwUU+Y1IPFvr
	jmueAngE+BjA9jrz9xzDwy9rTfKYm5bQcZ3LtOzBKn0QVypXOs47cBlo6Eue7c8DB9yEYjKNC7Elg
	ZKhX10pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82v1-0000000EvVL-3LSt;
	Mon, 04 Nov 2024 19:39:19 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82tJ-0000000Ev7G-29Qq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730749047; x=1731353847; i=wahrenst@gmx.net;
	bh=HHRJUUe4qBU3jMnR/014D6ykMod61nDwsGapWt+8eV8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Hq94fEEwOp2b+g18twxwSd1BXAVnk0g5Kf/7PLMX325lojcA1FKhQsPudl5O2FYU
	 56WSopfFIfL613fT/mEi1Wk5krRJY7R5WJ4/QqQCv/Oy6dC+mEhaalDzJF973ebq4
	 MzTmywK1o+z6Y2vL80jasoQWQX15xoBwdtzYfobOibtNObVhG+7GoH65oy8ZhbNZD
	 XJCmh73xFlPM9gacD3xzKNpt0JeLfPFzUrF5c0laQo26+YTUWY4yYU09C/eEFABds
	 Z5azlSqyiQ/i6cgY1cg+x0+nLApWYPm1Kyr3x7id4KXx4pjITtuCV4z20VQC3hFBf
	 0dyuntjDb2/CxgsAvw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1tAXrJ3vYJ-002Bap; Mon, 04
 Nov 2024 20:37:27 +0100
Message-ID: <e42a6573-fc0d-4a12-9895-09c1889fc759@gmx.net>
Date: Mon, 4 Nov 2024 20:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
To: Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 regressions@lists.linux.dev
References: <20241102134522.333047-1-wahrenst@gmx.net>
 <20241104093901.rb5ozxt7qkdgoatc@pengutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241104093901.rb5ozxt7qkdgoatc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3QUeJFnW8IfUDzUNR3gHgR1GLzSJwBr2VWJeYALXvvQo2Dx3pKc
 R/3ZgYDtC+toB/++6G0GvS/CXbk0ckOVkqertfY4jQYMXzN69VurWjmsBcPrfvcE6OVphnM
 gpHlZ0zTROZGsN0flINwOO6bdY7NAA8P1RGBwO52pds9HQ5WwQSFp1P9Y8R/JjPMl5QX4z6
 +2IIj9CzENqrj9jnJiSWQ==
UI-OutboundReport: notjunk:1;M01:P0:h5KB0udMUDs=;AI4WhMe78Bj/ADR/ZjjqpSQXFYu
 TVpk8jdDCDyDs2eavH9OmRT9BOMyWmtKz5+fu4jGuNfVg1O8vvj3O1nn99I0d5wj+plKAfHTW
 ulONPu1XpBkrgeRdtlUvOKx8cR1R+EFggHUouFfdcIJrRSxgs3btp5vsWTYoQouir+BkyCujN
 zwtSD+Cv1MqitaOXJ+XsJN1LgCUvlSXO3Xw39PE4tSgdpd2gtxa2AY+Q7Mp6RA1TzDD7HFDcR
 Z00L9Cw3mL/uxBezrMAyAjx/f3DrhmovYZK8gnw3dVgdAv6auRut3gCilZq7YNue12Bw8zwCb
 MOZYhCo2RA0MKy/0KRFm3I78OM8SCfIw7v+3fFfsXWTIAhY9gJ4p6wQs2T262ohRjnPwD1tjJ
 RuP5o+RzsQcP13csIbkQPDzXaInyrqIDPsLjcXiojinbrIUEdEM8vim+x7ZRrBg22YXeKSxNl
 WN927O8oR5QIwQXzEDRIsJ5S5aaXnegykPwBR270z+z15aFtKy2H6qWHf7CvYXFSFYUpVIlCK
 wFNW9H3+R5Emwo2e5Lb4PZgGhx+qhkkd4crxdWsQ5/Ys9iXOHrgn/aKG0xn0xi/QaZb7hvdU5
 nYE4XCgMY34NL8F3+jOWg6fVPRoaNuJN6cvkbkbhxl/8FvpS+H9YSdTUmq+DPveyOXzZr5fws
 LNPTG4rvBLjz90dqufEqHAglEbLWplhOcxek0sDuGmHMbmuC5V0hXFgI0JdLNAmARDsb76czm
 ytXa7vs5bYMcRSS9K1SKn6sgGzS+yRa1Ro2dy0vd/fJeWCcc4BMEldW2R3g1q+ZyHzXePwwMo
 sibno5DLHfnVfd/b7mm3W42A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_113734_032375_FE5EDBA3 
X-CRM114-Status: GOOD (  15.60  )
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

Hi Mark,

Am 04.11.24 um 10:39 schrieb Marco Felsch:
> Hi Stefan,
>
> On 24-11-02, Stefan Wahren wrote:
>> The recent introduction of reset control in pwrseq_simple introduced
>> a regression for platforms without RESET_CONTROLLER support, because
> This is what I was afraid of :/
>
>> devm_reset_control_get_optional_shared() would return NULL and make all
>> resets no-ops. Instead of enforcing this dependency rely on this behavi=
or
>> to determine reset support. As a benefit we can get the rid of the
>> use_reset flag.
>>
>> Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset con=
trol")
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/mmc/core/pwrseq_simple.c | 16 +++++++---------
>>   1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> Hi,
>> will trying to reproduce the Rpi 4 regression from here [1], I found
>> the issue above. I'm pretty sure the Rpi 4 regression is caused by the =
same
>> commit. Unfortunately I wasn't able to reproduce it.
>>
>> [1] - https://lore.kernel.org/linux-next/6724d7d5.170a0220.1281e9.910a@=
mx.google.com/T/#u
I think i've a better unterstanding of the regression in your case. I
noticed on my Raspberry Pi 3 B+ that this change in combination with
arm64/defconfig causes a huge delay until wifi is probed (~ 32 seconds).
Maybe this is caused by the fact that RESET_GPIO is build as a module,
while PWRSEQ_SIMPLE is builtin. But this doesn't explain why the driver
seem to never probe in your case.

Regards

