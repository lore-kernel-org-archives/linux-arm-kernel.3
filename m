Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CB6D43369
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPfsizR0GhWQSjoMoj6ev7y0kRO6mxVltbXk9yQ6RCw=; b=u7/Z9WoknNH7mvtiXh2bXGRA56
	HyqMuDcNQ17986trrspxHGVedwhTH2TTAVZS45rvblqI47dwKO7joLDS9OgkDfXijutHE9OTtXSsK
	XESVAwqq0qWM4dPRPs2lf9Y9zCbpxuaA/lEvn5C2pCNoPEISeGK6T09OljWWomOSE9IGGUzOG7Grl
	d58ZhIwaJ48GI8xRW1drVZfX+rbau07SZFkq/fAoo2KfJ4FvCawOxugyEjI+YhglyiFEKkyBfl6aB
	gBBuVHIsek+Z+xaGqfsYd69+uL28sVMbq9hOPdt8uBjkiWDA1t97BijuKERMSKYLxdxjHp6uWdmmQ
	GEZ550/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93cZ-00000007IcM-3hOx;
	Thu, 07 Nov 2024 14:36:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93an-00000007IDT-2wi9;
	Thu, 07 Nov 2024 14:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DBB9A44434;
	Thu,  7 Nov 2024 14:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C0CC4CECC;
	Thu,  7 Nov 2024 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730990076;
	bh=cPfsizR0GhWQSjoMoj6ev7y0kRO6mxVltbXk9yQ6RCw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mKF4NHK9r1+8tE9VEE779JEN4YPJLcLdTe0ttAjyIwDylxoTTtqzFbRIggnKq6uO6
	 h0ALIHV3VWB3WAFXjQfzSLL0my3BWqJfXs4I7YMzmIOnpVxYEU8JG+OMCC8Aw5lx5Y
	 P4X6ee9KvpVlu/bdq1FZZJu1k1GlZFJdrz5LM13BCPXSr54i109bus6IZWoj9hSMzh
	 oSRr+qhDaLaA5MkqRK7XwxLsFRkjTbTmOfHzQzur7abh7e+N2u0P4BjreVSRnErD//
	 G8Px6e6FJtL+VivgnxwhJaqhTXu8wxx9Q4cnHk/ZFAHffhIUx5iGO1pogYTgw6Fbgi
	 a5kieyYvbkBrg==
Date: Thu, 7 Nov 2024 15:34:33 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>
cc: lee@kernel.org, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
    conor+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net, 
    srinivas.pandruvada@linux.intel.com, bentiss@kernel.org, 
    dmitry.torokhov@gmail.com, pavel@ucw.cz, ukleinek@debian.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org, 
    linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH v9 1/9] HID: hid-sensor-hub: don't use stale platform-data
 on remove
In-Reply-To: <4934964.GXAFRqVoOG@diego>
Message-ID: <nycvar.YFH.7.76.2411071534110.20286@cbobk.fhfr.pm>
References: <20241107114712.538976-1-heiko@sntech.de> <20241107114712.538976-2-heiko@sntech.de> <nycvar.YFH.7.76.2411071358210.20286@cbobk.fhfr.pm> <4934964.GXAFRqVoOG@diego>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_063437_824779_05F6503A 
X-CRM114-Status: UNSURE (   9.20  )
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

On Thu, 7 Nov 2024, Heiko St=FCbner wrote:

> This change was more or less a surprise find, because I wanted to make
> the platform_data pointer in the mfd_cell struct const and this the hid
> sensor hub stood out as doing something strange ;-) .
>=20
> So patch 2 of this series actually depends on this change to not cause
> build errors.

Ah, right.

> But seeing that we're after -rc6 alredy, I would assume the brunt of the=
=20
> mcu series might need to wait after 6.13-rc1 anyway - but I guess that=20
> depends on how Lee sees things ;-) .

OK, I am keeping my hands off it for the time being.

Thanks,

--=20
Jiri Kosina
SUSE Labs


