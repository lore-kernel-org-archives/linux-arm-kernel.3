Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F08C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBBQIivu9R4hlVII8eARKlvSF8Id6Zmw+UPZl64Yvzo=; b=lN3cJOdqrl7E1qkYanJXVY9/mO
	b4u96QhKz5SEGpJVzcbmz3vroviHCZ62Ux+4Ncn18H1EUZH1NeIRNYW/ldE5601UD2QUGlJAi9bWu
	AQqUnX68KCrB9NP+vDqY3Zpzf+bJac1s6MVqLa88H45+JrStXpLWny0bH++HLYl9oPj6aCygFrckL
	+gJTmhYcGkcc/hNlNnuhuTF0RGqkDmCVv2xRroCBoflduHOSZkYFDLF/rPkzETyLh0q70oHCCC7cv
	YPHbh3tqZIf2sxrdc9DKnufoTDEHvLa1z7fYSdjQtvMb0z0iFZGudtzoG6NJQpaapKf505Yb+PDFI
	CC6hI1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxYs-0000000GEvF-2WY3;
	Sat, 05 Jul 2025 07:43:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxOR-0000000GDqc-30Tf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 07:33:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae0b6532345so469323966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 00:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700782; x=1752305582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBBQIivu9R4hlVII8eARKlvSF8Id6Zmw+UPZl64Yvzo=;
        b=eUNU+/Wu7NXXFHBmF6TlbeRacVK3DbbgJEAagKhIwr7mDIzCSbqQprKmc3trdNAilW
         kzAADwAadjOZ3etL2/IfLNxwH521CdrdDbE2k85zIkmrr3bH31ny+wO6WDKBVuUr3J12
         DGGLlUsPLvLf7lsCMQqpkQVgy1H13slYBxFJqFB1E05Euu5wY/IyJhV7o71+B5ix8RHJ
         z3DG20yz1ZhYA9N7TTPzOnD/TjtQXn7qlKRONQBHErGzHYlSpDWnY+cjM7Kg6yOqkr40
         lDCXNTBB8hiKpInrwz67l+HJ94joUlXkkRCgIzba4REqiqF2Vbbt1Bt619QZiS9mn3kp
         1aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700782; x=1752305582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBBQIivu9R4hlVII8eARKlvSF8Id6Zmw+UPZl64Yvzo=;
        b=LD7WAWOt2nqSpqwl1CZ5z1rFr5gj41mhE2HYYPnmw4IDEiZ+5Q410AjRgefgXjreo4
         SltS5nlX+UX8HoSXG6F060EXEplsGyNlRPslpbTcBjyz8QWX2CGMZgLZUP42U4T+4Jzj
         BJAJzBd1FbdJ5wQwvmcgEWCeyhAsBgcuDhoQ5kZCb/azwEpG73Dc7gmTBAQIQiW4nuzd
         XvOMTa3Ja40CHuhRcOqRL/jR9jamk02MZSPKKNPxMSmlVR2S7tMDgamqpMVI2k3r23Um
         f5aIaHZHVLW9AhGn/3cErWl6k03L5RtP72dMociG+coaA0FFO5Vvm0k3MaoZHeejCNRH
         62Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWiIIUAq++Qb9b4CxURQokCp1RM96PF/UxBxOxcEN5Hsr8P8cXTiCB1aXYV1bPCzCYDO1dd/KOmSq6Vzvd2pajF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd4KOXjXfEzVIgousCuYQaYUQaVlpAINdGPJLgIZHsWEjtqahC
	MS6FwS4qgDB4n+pUXUOMguwJSCJ6oVHMGGYTzXg9nf8fzZTlGcvCp6i5qN6Wq4mR/hM=
X-Gm-Gg: ASbGncsv3XBE7W1inDb5r0YVrODG5kEZhAEwV160RF1fntBBaRHrVyfCNwkPdNvmzIm
	wmxSJU8XgsXGSYY6xiybN002YpRX0EL1E/xAHXpa4VnEUY/0aDM9Xc71J+YVY52j2K+Wp0QvJcI
	xDBA9RHCXJ/62awMxL/Yy59K8x/Xqkyu9Vv8biCTnacI36fi8qsSVXreyJYCi4ttNdEMgYWmrEP
	ehiKiCIl3nHAbCfVjZ9996dY5cD0m3oSTZx4iF48iNj06RIeJ6jrUdP8/8YeWd9/iEebs3iqC/X
	jPfcqOyQ21T5tHX6Oa0SUopx//XE4L1ZQpRw4HVNKw0AFCWZt+nVO4L6sqphlaY0TwdK8Q==
X-Google-Smtp-Source: AGHT+IFKOW5I/XuGd4Dp5owBqCPbOMq1w2RB/ia5hoIkMKyEPcf9Oo2NcunX07fujYumjahMwc5UaA==
X-Received: by 2002:a17:907:97c2:b0:ae3:6e5c:1c05 with SMTP id a640c23a62f3a-ae3f83b2ef6mr584605866b.30.1751700782292;
        Sat, 05 Jul 2025 00:33:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae410916ee7sm72527666b.15.2025.07.05.00.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:33:01 -0700 (PDT)
Message-ID: <c714c568-a661-49ee-9645-4787cf15d24c@tuxon.dev>
Date: Sat, 5 Jul 2025 10:33:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ARM: dts: microchip: sama5d27_wlsom1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-3-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003303_759136_3B1CDB16 
X-CRM114-Status: UNSURE (   6.84  )
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
> Fixes: 417e58ea41ab ("ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>


Applied to at91-dt, thanks!

