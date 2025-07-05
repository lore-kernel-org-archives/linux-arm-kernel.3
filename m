Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E834BC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BzfNtLpFJK/1rL9CXjpJI51Ye7+7b3LCibh0EaiIaI=; b=16MHY+Tdhh05LFQTuLddjKYZck
	nLQ5ZErQqfBu/fVMRIZ+mp+vCbaGhUhuGCs629LlcSKULddEZk96f0YuwXhAeTizUUGSQTDFxgvSv
	ig99XKtDqnO7gDSuD9tnjGvxbUOUYfOmQBiI4+hkLegrk2K38odHAE0cBKQKYMILW6MTnanu4e20C
	MasQVKLlrG2TZJ1opi3siZqpw5bvMsmBuNRuEt0VbDe0uJmKwnrdwaCqnKGT0yFbyNbE3n/oMgk/q
	ZB6iwSCId8/zd21XuQpXa5rB3yiu24x4haFDmH7Ees8DkFc79nrFbZZO3ZngSkXl/euXg7ILNPugx
	9sDKKAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxbB-0000000GF6x-1EiJ;
	Sat, 05 Jul 2025 07:46:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxOb-0000000GDt0-2DBb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 07:33:14 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so2751966a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700792; x=1752305592; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BzfNtLpFJK/1rL9CXjpJI51Ye7+7b3LCibh0EaiIaI=;
        b=qX/WxpWB6mpioFYIlhAnWaVBg+oJox/HD9yJXdrWd09rSj8WRaHIv1hkQZpbMp+6Jl
         CPtHOU0P6L+qYXgNl3sDAIuPZIsHiRSy6VjyCIEsTs87VeWD/2sclDfsXtu3UmCegqJF
         Ahck+ieov33PWZtp3IIWqzMg1dTkB055Fq+/R2ENBBZFZMrCZt2DtkBqwP26dGr12fXF
         iLM3nQ4w0p9Gn+KhPmLsZ8t5otdAbbza2mF7ckqPonFsjv1tfXrq9B7PFxcIk1oTxpIe
         ADniK/QU3TTb/Zp9uQf9JWd8wvvqfRjW4q/OJShT+ZUTLAZud0lzlpv85LDW0CZ4AYAA
         6jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700792; x=1752305592;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BzfNtLpFJK/1rL9CXjpJI51Ye7+7b3LCibh0EaiIaI=;
        b=duMzqgi8TgOPfp/IhnFnLkF6lI4l9ZQxhvEsLudY7KkE06TUHDdNVxn4iF29tPNb5e
         ScDgCeu447jKLEbu8icD07QRz0HXPXiUsdgf9aUaPFTR0pbPBrk1PBF6kmf7Spt/jFvV
         SzqLHBgWXrEjZQscI8IsUiWp1GMXxjaiLEcfcGaHNIhgJqgToEhg+ogL+95UPh9uR3IF
         ntsUQIdqw11O9EZ0xp31tvWHqJiNfZ4f7iF0jcz79M4AIVIo0dxD03mzvytxJhflrKu4
         Hxivyo4tSKQuOIkfraiLJElHSbo9bRXS+hvauV2rZn4yO0GwOfqVUcXFS9YUinxUQ6M2
         /Png==
X-Forwarded-Encrypted: i=1; AJvYcCVpyMHLnwlVJPtZMCy2Irru/XwzVVLbhJ10eWgZJQfJEwJ0sBjysJJztFCSWoFwI319gEMJuc/mORNYaUZA0AHx@lists.infradead.org
X-Gm-Message-State: AOJu0YwC0dJycp+koHFk9aB12vqWOmVgr8lSC7cPOLqMJzZsCG2qNogr
	kyKeFdOiNLq5TTFowOvVdgcF+U9Cut7hkadK/j/TCGNyYj3Ao3uG9Z5wl7vUoQU6LM4=
X-Gm-Gg: ASbGncvlhZRBg03ncUJAfXoxtIWCqqqoLJW+uIn4nE4r2MU6ROG/USkYCnAcA01fad5
	PnAYP1OzeCvbiVkETxusmvW/TbasFJm4s/B2+pvp3JsdWElbFu0O5UBL7QeuDgpA6LE/kc+Ws60
	jrCa/mywom17nsmg72sbzufIipBqS4LNjKUYWhEdbJ/nTkMomYzma/5D9fr2I0/w2rcDQds/hy5
	FdSELE72xl00UeTrR8TIFzNcsEA0xYWL1Vh5NJ3IUjv1/W4yxOL1Aa/CfGkhk+lt5bz2N1EpYLN
	OhK1XXdOOfakwEO4MFkB+mCq2SiwB46UGU3eBlUEiiqpIucKDfBkC/AwV84lYCj0bqWvEw==
X-Google-Smtp-Source: AGHT+IEyjZg5XLjSr836IBwSt2gYJioyHjqnWyfO3B2HFhMs77WWIN1RLtUFlIyuT+MplatiWpCWmw==
X-Received: by 2002:a17:907:7ea4:b0:ade:44f8:569 with SMTP id a640c23a62f3a-ae3fe73f353mr500816666b.42.1751700791818;
        Sat, 05 Jul 2025 00:33:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e7d5sm301895766b.151.2025.07.05.00.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:33:11 -0700 (PDT)
Message-ID: <0f6dac77-14d4-4bf9-a622-1f075568051c@tuxon.dev>
Date: Sat, 5 Jul 2025 10:33:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: microchip: sama5d2_icp: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-4-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003313_570039_7DBA7A9A 
X-CRM114-Status: UNSURE (   6.73  )
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



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 46a8a137d8f6 ("ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>


Applied to at91-dt, thanks!

