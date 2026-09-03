Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0836EC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfEMK0a33NS2jaUvlauAHM7l7SnnnIidRASqMeaGC3E=; b=zCoqCKjxjm8c/z3T9JQ5uCAsLT
	etlYhW2SEC2g7uy61TiLx8ArWhpdqdNSFEsNsfgi/gt5JyNKq4H9+Wyy7/0XkQ4IJx9kQqVrgFoSc
	k7fW4nIDorLh0UqVZzaFogMOmDwklc3S8N02tp4Y7L9cYZJxYSLgEJ6F68nHQ2/EWGnMMO9qcSB0T
	cEAajYlrUn+wDIqbrY6MABcWQxGXhlI5RIL08dvI8shF71ajlvtzIcNJxEeV2hzwumee3W4fYtttt
	eOR61fB7+PpU1+sCWakB1BlhKHby2+WLJy4w3J4KcnOdO2zBkJh5XeI7vhaUNA92micT2T2AGU7Uq
	ENvB7/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Sg-0000000Gk7N-2dUn;
	Thu, 03 Sep 2026 08:06:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Se-0000000Gk6S-2E4r;
	Thu, 03 Sep 2026 08:06:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C61B91A1983;
	Thu,  3 Sep 2026 08:06:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97DCF602B8;
	Thu,  3 Sep 2026 08:06:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1907411C79B6F;
	Thu,  3 Sep 2026 10:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788422772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TfEMK0a33NS2jaUvlauAHM7l7SnnnIidRASqMeaGC3E=;
	b=B3MGEt7o91rWgG+OB/jZ1KGIDkbGvXO5at21Ffhuhwy1BLzE7/eEvyCrcrZCz3B6PmJYwI
	c2Kbsow6FPwqH6sYJflF0L917opYPsrVJEsRKMdIc0/3e2Wv1Ze0laRume828yiEgzxFVN
	UBPjeyIziLfZJv7MggpfPWQIVKVKHgUxSlXqAL5vD2/yNgtNGXMvQ+IJJavF6S0cn4A6pT
	4xolGMxPMlR0m/S4/mpwcwUThfNmj1pykbu5gApMlog13rrejTdvNibxWewkwdVg/avr4Z
	mV9svE0JBMYT05Gj0Ay4yAPcbTPABP4VJyLxL8rZRhcelcHfjOubopJnlJClAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Michael Walle
 <michael@walle.cc>,  Finley Xiao <finley.xiao@rock-chips.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
In-Reply-To: <CAKTNdwF_wY8JSoQs=auK_9YNGT+hwQ=dAhcRVsf1E1CVvFs-XA@mail.gmail.com>
	(Alexey Charkov's message of "Wed, 2 Sep 2026 16:40:16 +0400")
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
	<20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
	<87ecfc81e9.fsf@bootlin.com>
	<CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
	<87y0dk6jpn.fsf@bootlin.com>
	<CAKTNdwF_wY8JSoQs=auK_9YNGT+hwQ=dAhcRVsf1E1CVvFs-XA@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 10:06:08 +0200
Message-ID: <87bjae7o9b.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_010616_703248_C6AB54FC 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

Hi Alexey,

>> I haven't seen Sashiko's answer but isn't the goal of guards to just be
>> released whatever the actual return path?
>
> I believe it's based on the guidance in [1]. In this particular case,
> gotos don't jump outside the scope where I put the guard, so the
> scope-based guard is still correct. However, stylistically, it is
> indeed uncommon to see scope-based guards in functions using gotos.
> Explicit lock/unlock is easy in this case, anyway.
>
> [1] https://elixir.bootlin.com/linux/v7.2.2/source/include/linux/cleanup.=
h#L148-L153

I never read that paragraph before, but okay, makes sense.

Thanks,
Miqu=C3=A8l

