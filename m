Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ADAD44153
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5/gaiAv8h6HJm8JV5izVAzWfhwGHsfvkAT3QjKySqk=; b=EJtaPMa40egcny4UxuEnytERUX
	CzjOdBPeicfutDjslFrUQSpNc9/eOLsF0RCyobFlk4/hkjYmLkYUi428THV9ZOKAQaTZaNaG+yr/O
	KZ5CT9zjHUhUf+Ajqk2mIsIJJriqeC7/HLKVpKf+V+Zm/5CLBPGGiezAmX/io5StjwKs0uGJ++9JC
	9xmjQa5LmKaynlIAUudJofEgMBjAD114bRb+kIblSqSa+KLZZDL6mlitZWth1T6JH1QnE9XOWDXjg
	h3JvpG1tH1kmVuH1hrIIWuOiYH/ZxpoXOZHxjpPxtzlu7HkzNS9gSfp6XihkgjdDon9sUvJic2SVN
	0VHfmRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNdK-0000000CPMN-3Dmv;
	Tue, 19 Nov 2024 12:47:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNcP-0000000CPEz-0hOM;
	Tue, 19 Nov 2024 12:46:10 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5cfc035649bso3484927a12.2;
        Tue, 19 Nov 2024 04:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732020368; x=1732625168; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k5/gaiAv8h6HJm8JV5izVAzWfhwGHsfvkAT3QjKySqk=;
        b=UPXODAbYzUk2TKzA3mz0IECKSNwgVSfkfoqvaTYSsQekwO55i3CRU5HBYgHIf4+9E7
         XrqFgadkOAQOfC7e4h/rfW2Q6WcggHakmTMbw2BSMt6OCx1+UinmRTh5hgnAtbqBp6Lk
         mHXHJnZ/O+rqDO2hGqQ1cjYATIxeipbAMLAFEO5nnn9UCZ8vWlejSxd7lbVbZBOPAtL8
         6CcxcevyV52rNpUwbue3HKbLz1iD/U0eAQKnZCsW/R8K3s4WGIp1uSIYu9KpDyADrTLF
         XyBnsm40p5BEFmZa1s8dk+xD2WMlGYKuF2H7pLUwk8vBkoWYCPKWkvaEuT0ppL+ertOc
         bHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732020368; x=1732625168;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5/gaiAv8h6HJm8JV5izVAzWfhwGHsfvkAT3QjKySqk=;
        b=kp208foyjD+xL8QYlgd0EwpK+xTcXRutYGGt9GU7YvDem2ieJo5usDUtF4IQK4owDm
         5DenIpYZhEo7CpySacIuLIkDjg5IgnkdYWzezlV5q4pa0C1SFXWOQ9aQnBsrOH6gG8eX
         7tciVj2sahHnKexcokEfi/nLBIx/aK+ZkLpDlw8hPBDaLR0cxlAv0/fozTK01/R2SftK
         KI+18hiwGRKsjrU8yR0umwy9MWsdoAG5EN0zUIwZqoXlyCfice62yWs8cYn/NjFvRr9T
         GcvM1dFMZpcGQqf8qv2CxY1FcOZX7vHpi357xr1HA5Bg28MY/6cXWM9gMPRBs7gXl0nS
         mIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9ly2fS6EUwa5nyIuGSZiUfexzPmEoTIUUbqYlqPqxU0SyxiZ+8TZUTjWJ0lSaCwOFoZyeKjGO11wOQ8fEWzo=@lists.infradead.org, AJvYcCWYrn3XIZI/puE+7bQlREkotSjyc/QB/lBOuYHT5fsMxiwX2/IESjARaMjYm3pNy1tns0q1kgtAL+fMPgDpugs7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/7AgmwmJotvsfrVKLvcqRNgEU8UfoAMsq4nC/4TPQ1JoTCnM5
	lbpOJBj3nj09ADmInHXjMkNqx1ZGp1E/8Co5RdrRR0tTqprzrSpd
X-Google-Smtp-Source: AGHT+IHCYZ3NKhKPZWjj2AvexgxpQZKs0aHkGi3venZoVOafZ13nTepAJ8dEvaexbzt3d9JyKwNwfg==
X-Received: by 2002:a05:6402:268e:b0:5cf:bcce:7422 with SMTP id 4fb4d7f45d1cf-5cfbcce7560mr6787204a12.6.1732020367487;
        Tue, 19 Nov 2024 04:46:07 -0800 (PST)
Received: from Ansuel-XPS. ([62.19.98.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cfcb3edce9sm1966351a12.35.2024.11.19.04.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 04:46:07 -0800 (PST)
Message-ID: <673c888f.a70a0220.26ea38.88b1@mx.google.com>
X-Google-Original-Message-ID: <ZzyIi1Bsz5djjEGX@Ansuel-XPS.>
Date: Tue, 19 Nov 2024 13:46:03 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v7 0/4] net: dsa: Add Airoha AN8855 support
References: <20241117132811.67804-1-ansuelsmth@gmail.com>
 <20241118144859.4hwgpxtql5fplcyt@skbuf>
 <673b88ea.5d0a0220.17b04a.bc4b@mx.google.com>
 <f8c50ee6-a3d7-45eb-9c11-8018cc4043cb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8c50ee6-a3d7-45eb-9c11-8018cc4043cb@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_044609_202097_07A891B6 
X-CRM114-Status: GOOD (  20.84  )
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

On Tue, Nov 19, 2024 at 12:10:19PM +0100, Paolo Abeni wrote:
> On 11/18/24 19:35, Christian Marangi wrote:
> > On Mon, Nov 18, 2024 at 04:48:59PM +0200, Vladimir Oltean wrote:
> >> On Sun, Nov 17, 2024 at 02:27:55PM +0100, Christian Marangi wrote:
> >>> This small series add the initial support for the Airoha AN8855 Switch.
> >>>
> >>> It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.
> >>>
> >>> This is starting to get in the wild and there are already some router
> >>> having this switch chip.
> >>>
> >>> It's conceptually similar to mediatek switch but register and bits
> >>> are different. And there is that massive Hell that is the PCS
> >>> configuration.
> >>> Saddly for that part we have absolutely NO documentation currently.
> >>>
> >>> There is this special thing where PHY needs to be calibrated with values
> >>> from the switch efuse. (the thing have a whole cpu timer and MCU)
> >>
> >> Have you run the scripts in tools/testing/selftests/drivers/net/dsa/?
> >> Could you post the results?
> > 
> > Any test in particular? I'm working on adding correct support for them
> > in OpenWrt. Should I expect some to fail?
> 
> Unfortunatelly this landed on netdev too close to the merge window. I'll
> unable to apply it on time and process the net-next PR as expected even
> if it would receive ack from the DSA crew right now.
> 
> @Christian, you will have to repost it after the merge window.
>

It's ok, just any timeframe? Guess 2 weeks till net-next reopens? (just
to put a remainder on the calendar so I won't forget)

-- 
	Ansuel

