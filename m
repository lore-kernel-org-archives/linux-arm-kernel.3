Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E66DD767FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1v04+9ti1vYqVbQdYptxRfNhaWQZMzRG+ZtM3H0vaQ=; b=Qq8xYNtdgpXMiRyBqOtYjVon1x
	HiIcTreZHa3BSiF8B4Tf6n7FTlWo6JjlsEzP0HMupP08dYUhZNlnhw4YK+Oy2H5OWqe6C8WMH9YIh
	hWZomS3aihAKHqTFym+/7b4UWUWiaQHCDsLsf0l+oQ4yhDyLz/MoARU5c0D/Je3M1uogBVSlkp3l9
	fk5ErLjqzx3jafzXW5DR/C8rZxwC7YFz059QWhkmEw71k7w3wgIRJPSNduVHrAq2meemGqpQzyhNw
	Sfq7tRXTcW6EPsi/Vz+yvM2gGijbnMYkf9W+To6zsq2dSrces2FpXg7vw0ohEWcZmcDvQuj8l8xZO
	L879bL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bDf-00000004gpS-2Kqp;
	Thu, 31 Oct 2024 19:52:35 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bBy-00000004gWU-2cad;
	Thu, 31 Oct 2024 19:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730404240; x=1731009040; i=markus.elfring@web.de;
	bh=X1v04+9ti1vYqVbQdYptxRfNhaWQZMzRG+ZtM3H0vaQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aEiNCdgSPEbrpSWpYozIWAYn8dmD4udFYE2kiJOoL+Fyu32NhSMO87/VJVv335E5
	 IPNqoi740C7y3hDndfjKuq4t1HqEMwlIuStSCYhnqOrklIAdtQ2NWjxv2LyKycI1N
	 +UI7dcQKWnE4/lF+WRXuuifuqUUCiBGKnsr3h0dxiFutMnAMpg6SFXqPe/ix2oN1j
	 AmFfXr025UTrIQ9bJcRTMUVRhD+qu12G68eu2j+P10cs4VQM9h3bSd7OGnGEmw+b6
	 y0+0uks2JbFYbTTy2P8cK+gNcZGGXTZG48YVksi3a/jTPDSOaut/APZ0cKpWYMUvE
	 dstt6K5Z6R1EfY8OoQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MDdy7-1sy6LQ3od5-0075N1; Thu, 31
 Oct 2024 20:50:39 +0100
Message-ID: <976d64da-d6e3-4bd9-af57-d475d9939410@web.de>
Date: Thu, 31 Oct 2024 20:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
Subject: Re: [PATCH] rtc: mediatek: Add mt6685 RTC driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3XXl7nEu0N/vYBvK/LYU8FhLs2999+6RWvF5+VlfHVprQOcd8U7
 u1MrLMUA+zFDcw431/U5L0xOsphcjpk6OMGIfTfbEm78PzEfs/8oKiaK3Au687A9PL/4oc5
 ytKK28We0pq39sEmBSThDZ85zMh0Gf2SfDdlx8ii6IDkMSstlmBXTRA8Yt522uYJWa9Ps1F
 t/0+bR8LKaBe6BR0U5viw==
UI-OutboundReport: notjunk:1;M01:P0:rfQbZlQQH60=;d02iIenzf35P94pc8brZadhJtjG
 fTcK9wg4yxhU5qgBQmkdpFcZrbQMBxpF/6U2hLILKo/ZmqeoPa0tsZZBmuwSZy0hbolTUU+h7
 +JXfHJDEmUKpYQyCdmnSQiU6YYzS4XK/UVf8Fvs2SYLjckViGsn9lYTVaSiO/6DXTRZBZroZI
 jokJ6xUb06/xNTWnu9IFW1vAi7iARfWvY/8foEaTUxk8QpbZn43L+rPgqwQPyCe8Bm169f35W
 PufN0DxGl+Sfpnq7wSepr2ppmyeoHn+2Y9UX0SPiJR/lb0pUIYQM9ERckV26tACS3hiBtcNCa
 RiHzr2X9eCznE6w+TvNEv2TCv5VZlVKqt6zWTEh6rfKmYGg695Q8jNO3wHBchPdUB2UWxQssk
 hzVlIMZCBkVmxJ0ilYBMwn4jGCWVW4Ywl6XAgLdnLRjn6DlwSxLxsdnmvfTc3KvrZFsoXlcZj
 o5WTHWJ/bBnIu7Ah1xL40O8tNaEgVl97hrsP8dxHQf+QtNDOADSym0ZdyWIfTYyUOd2w0v96z
 +pa4bRRWZ1/qsuDbqWqh+g/XjLjuINJetlyQ4Nz8z0uQlVXWigM7U8uH2ksFViOsqvkTFlt3V
 3D92+g8cA4mllhjku2y2FcddWbMmyB0bVYI8S4mm2utGn10HgIhR4H8JWQxfaIIaULDzMOicv
 VEnVjO63mLkIb/J2A3JLGtS12q+43y2Ci0mIhsVeSQUOc0Aq31CS8bPhNtW3rzr3/Up9O7hIc
 Od395FdXsJYk9BELSllGYxdO06cH1h5UsnK6BHbQZAyeFpuxVgkicqpwj7LUHKYGo3EqM9Vy1
 PKoeNiolPGUy11LUnHh9ddOA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_125051_195406_173A1BE0 
X-CRM114-Status: UNSURE (   5.73  )
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

Please add a change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc5#n45


=E2=80=A6
> +++ b/drivers/rtc/rtc-mt6685.c
> @@ -0,0 +1,1456 @@
=E2=80=A6
> +static void power_on_mclk(struct mt6685_rtc *rtc)
> +{
> +	mutex_lock(&rtc->clk_lock);
=E2=80=A6
> +	mdelay(1);
> +	mutex_unlock(&rtc->clk_lock);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&rtc->clk_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.12-rc5/source/include/linux/mutex.h#L2=
01

Regards,
Markus

