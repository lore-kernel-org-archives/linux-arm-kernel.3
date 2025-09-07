Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20C1CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re3Obj2gjzpK2St00Xi76adGxDxUyTVLJ7DeqSscTY8=; b=sad2scPVbhiJ38nyaEdE5Bkkjw
	SOenBvl4qsYMdQfZyL9FW32g4DA7hqibtsWnsqzO7qgpmMmoB6Q/N3Nh/pW/xgf++baSKHXp8R0Vq
	8dc+FIIFO0mNtQ5PGRoOzshoGRvC3+yR/sUO/lINC6IsIox/oGys6ZT2MwiLFyhKjOPON0flNrhqb
	pU1YV8ns7YSSiG8tos6M97FBrAuANld3D8vnqRzuRovbhciePjkNCDGirTi802cnnJW75Ch1CxQin
	WzioekeCnqNCKPTTifpfwWPKkEFLWYVav4jjapaeteHjYtO+/TWPSriB4qcnVy7kaxz6wiJjjW6b2
	b0BmpiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvI6Y-0000000Bref-2FH0;
	Sun, 07 Sep 2025 16:19:02 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvI2d-0000000Bqeh-090n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 16:15:00 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cKZt74Nh8z9t8Y;
	Sun,  7 Sep 2025 18:14:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757261695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=re3Obj2gjzpK2St00Xi76adGxDxUyTVLJ7DeqSscTY8=;
	b=ox+K1yHWNI4poCCLnaxxQJCeTS+CeSvrw/n/XuzU7KwTcQvdijxgTyhtU6750ivpRxypSi
	s+Y9LwquY7S4d5jPRXemig0Ynj9F0rpIIZbZjcPP7kfKd/lvwrgPZVMnLBQ7xHfGuYi13y
	mKzX7QAsG6wXgpRG5LTGeFWeUY4CU9oT1nP+bdaRkKCnLg3YueDZEuLn1zGrtuJLssEAaW
	YYutnfxwkKArv8g8B5RIIDrvZnwT5EzjPSkVbMLDs4+HBpLsQxCQMV8HYPBLFuFbPNPZLL
	bN9bEFIkWGHEPSnDAQYncZYveV294nGmM77SyYJa1g9r69B00zDr7UQNnT4dow==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=BNPLUgwB;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <29f2f2dd-b72d-4e17-bb5c-e7bb7a805d21@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757261693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=re3Obj2gjzpK2St00Xi76adGxDxUyTVLJ7DeqSscTY8=;
	b=BNPLUgwB6nGh1gpJr9igj1NBflvn1kQ2IvZN0VWLym9XxLOq5FQK02RnfHUjZ6LZxh5gCR
	NP8UCEcdlSyOLBAWPuz+4gT99SvWQI0V3uBKJhnYmDquh6ZFfjUNSi8SrM0+y4ovPhQF5P
	P9Yue0TsKIPohmUI5pXjCWx/hvjyz2yW6iibJ8pyJ/vw7YiKJraJD/v0jGUHb8goYVTBiQ
	rP4RQo1vBm4tDNF+m4AA9z3sOBMO9t0sgqN12cDC+C07CIwFWjOGZwHEqDo4hEyiYyog8c
	FryVW+qVBgoxT3wtnUqYvPWtMDRRAcnXK0oUBkIDDAhuDlFulNX+fkOLIFp3Nw==
Date: Sun, 7 Sep 2025 18:14:51 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
 <aLrXzl38OUhTJgxP@shikoro> <273d5067-4c9d-4c8c-8633-7f2d7c708216@mailbox.org>
 <aLtCUoIPSFfYb-k7@shikoro>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aLtCUoIPSFfYb-k7@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 699a8bde9424c7f00cf
X-MBO-RS-META: setwddmcdo88ufkk6rio945byxhbn477
X-Rspamd-Queue-Id: 4cKZt74Nh8z9t8Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_091459_224243_075E6F5C 
X-CRM114-Status: GOOD (  16.80  )
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

On 9/5/25 10:04 PM, Wolfram Sang wrote:

Hello Wolfram,

>>>> + * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
>>>> + * /sys/class/hwmon/hwmon0/name:sensor1_thermal
>>>> + * /sys/class/hwmon/hwmon1/name:sensor2_thermal
>>>> + * /sys/class/hwmon/hwmon2/name:sensor3_thermal
>>>> + * /sys/class/hwmon/hwmon3/name:sensor4_thermal
>>>> + * /sys/class/hwmon/hwmon4/name:pwmfan
>>>> + *                       ^      ^^^^^^
>>>
>>> For me, the output looks different, though:
>>>
>>> /sys/class/hwmon/hwmon0/name:pwmfan
>>> /sys/class/hwmon/hwmon1/name:sensor1_thermal
>>> /sys/class/hwmon/hwmon2/name:sensor2_thermal
>>> /sys/class/hwmon/hwmon3/name:sensor3_thermal
>>> /sys/class/hwmon/hwmon4/name:sensor4_thermal
>>> /sys/class/hwmon/hwmon5/name:pwmfan
>>>
>>> hwmon0 is the Argon, hwmon5 the (unpopulated) on board connector.
>>>
>>> I hope the naming is stable, but in any case, the docs need to be
>>> reworked a little, I guess?
>>
>> The hwmon devices are allocated first come first served, so the list can
>> look different for you. You need to look up the fan you want to control, of
>> course. Look up by name is simplest, if there are more fans, it might be a
>> bit more involved to find the right one.
> 
> Exactly. This is why I would suggest to drop the '^^^^^' line from
> above. We definitely have two pwmfans with the above dtso. So finding
> the right one needs a second look anyhow. And while I think it is quite
> likely that the list of hwmon devices will look the same (I don't see a
> race condition which would make hwmon0 and hwmon5 swap), I agree we
> shouldn't rely on it. I would also think that we then maybe should
> change
> 
> 	echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable
> 
> to
> 
> 	echo 2 > /sys/class/hwmon/hwmon<X>/pwm1_enable
> 
> or something? What do you think? Just suggestions, I am not really
> insisting. Well, maybe, about dropping the "^^^^" line ;)
I hope the V3 comment will be to your liking , as it addresses this 
part. I'll then send separate update for the native fan DTO once we 
agree on this wording.

