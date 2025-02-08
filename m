Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FACAC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5/SN3DCvwYBNYU4/IONaZxto7bXDguxKcJOD+fv9VM=; b=aZC6iZ2nrJtnKPW7d8/GfZaLIN
	BmXxu1ynSeF5lXT/nWp1VKlVCy9dzvnMd+PgNmcCXoxEzmY5IrO2Sk8hphdGF0/htrOLaj6zk+JGG
	2/I6HFNDyOYy/eKWlSu6TFjdPOXkMbLEXkMBAHBQEC4mt4PkFHa95A147EGa08UAHU8bpGKWCQuAs
	b3KRPlyIrAe7RaAvWLZB98Im7Mj73UTTmSL94FbnlH1pbSi0Y5io06tW0qWjdv2ykTY/qiNFYfrhz
	PIYgSSu6538LdHag8/PIOG6nRV47YwXsgNKa5WBGC8niX5GzPHm/SYz0DGiKIdkEvDZixLS4fiiMa
	KcuWn7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaOU-0000000BtcT-3BO8;
	Sat, 08 Feb 2025 02:16:30 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaMg-0000000BtKf-0LHn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:14:39 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c051acc02fso498585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738980876; x=1739585676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5/SN3DCvwYBNYU4/IONaZxto7bXDguxKcJOD+fv9VM=;
        b=AL9+pyo9qLP1S/VIie2SVGiIUMrZMS4XCz4knfBH9G4zdKu9jOsCxKa6DbVDDCq7cV
         rc31lWiXAX6bSqjHlmiUdRA0sMImyqOMl8oJtuP+rvQSIYxg/GJ3Im4zf3J4O54aOOkF
         uZzJwiZPnurFceMQ8Kd6zACCXVJeHrdV/oSwMVHcEq84hcgSczY7xTngOvETbtlHvZpT
         Q7AUe7+hkLW230rH1ftKj4Hh/xsnoHrv6Hu2Jall1DJEAVftsgVX/MnaRRfDxCXtju01
         MpLoQbG9BOxaG3EaryoXcqJUIMIXoL+Va4wxWSvdKCNS4C9VX7T5TRnAT9D+/r/NVyHR
         w8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980876; x=1739585676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5/SN3DCvwYBNYU4/IONaZxto7bXDguxKcJOD+fv9VM=;
        b=AWbNjvGOdkvxhVGw6M7ydG7RRPqgsnfwKx5lFdg3/9YWEP2XtJV9Rw4uAzE+6Gm66j
         vBDOSqc+GNyex9y5JJczooDkS5bElvKc33PB3a65k1TvLBWurCMghhO0kgZqZeoaL9Lm
         KeXABHN9BE/06nq41e1NEi+bCFoK0y3EqtdLYaz8qfajYAxdS28vFnwDq9eeIQ2Zk6kI
         cQKH/wdm4tb+iz/Oez//oIsLTYwohUYx/SJ5ZbjRpZeu8v/3/5cqBvFWkibH5osxn4Sq
         pMtLtlChvKbZNA7RYCIQYhVCgerr2grMQdDISTtREjD4+PtGq4A8kFclgv2B4nuTZ6WR
         nYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8+cdbanbn+LoYi0EipZMPf+2wZ/tZ33KLJMBeADKtSsFnYGRKQejTv3qXkNxFl4KUwma3YoqxLnAIx+s9nadR@lists.infradead.org
X-Gm-Message-State: AOJu0YzPKAGcp7kpJKuAV6XWsIwDDJU2eK6nTv4Wf7lC/z2ZWuFYPmT0
	H6rwiFex1JQ0O3bnCSQ/7kVVBjJsSznTId5m6R936vkYqFI94axV
X-Gm-Gg: ASbGncsRj1ePXYbW1Icead3cOKO/1Vivqc+SukWfh+ycjdzUR+4UhCJz1BM1YTJ6ai6
	EqJTISvex+HaHtejXazLc6u1e6MBpFdDmh95RPdg5g8rYl22sltquMQb+tS+hx4sMeDO9VHh0xL
	uCGAWH+0/qMpsGwX4xf5huJBVw3F5XU3Mtu41Xs8NU03P+2R5ASou30uQG1oQi2GhHFchPNkoJf
	ZAy1Df4264Tsqwi5caRQYg/TlLkgIl+I2PpxMA3fjc8TAQ6aZ0Ym3FrVtZ04uc9DiMizmWGweBz
	2mDTaWQzfcyK4P//FlrcVfZr+BW9xnUWdZoKeag9dMNltVLSx7Og3oei5ddBJMk86Dc=
X-Google-Smtp-Source: AGHT+IHaHLnQCpbgV9vtfeCu+dFr6ymQXG7wzjMf9uGoP8yh8kD6+ACPqZoUxJqmQwOKBWPlDIRBWg==
X-Received: by 2002:ad4:576b:0:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6e4455e878bmr24319206d6.4.1738980876519;
        Fri, 07 Feb 2025 18:14:36 -0800 (PST)
Received: from [192.168.1.201] (pool-108-28-192-105.washdc.fios.verizon.net. [108.28.192.105])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e45074741fsm4078006d6.15.2025.02.07.18.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 18:14:35 -0800 (PST)
Message-ID: <8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
Date: Fri, 7 Feb 2025 21:14:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port representation
Content-Language: en-US
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=c3=b6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=c3=b2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_181438_127252_F8585DE3 
X-CRM114-Status: GOOD (  22.64  )
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

Hi Maxime,

On 2/7/25 17:36, Maxime Chevallier wrote:
> Hello everyone,
> 
> This series follows the 2 RFC that were sent a few weeks ago :
> RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
> RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/
> 
> The goal of this series is to introduce an internal way of representing
> the "outputs" of ethernet devices, for now only focusing on PHYs.
> 
> This allows laying the groundwork for multi-port devices support (both 1
> PHY 2 ports, or more exotic setups with 2 PHYs in parallel, or MII
> multiplexers).
> 
> Compared to the RFCs, this series tries to properly support SFP,
> especially PHY-driven SFPs through special phy_ports named "serdes"
> ports. They have the particularity of outputing a generic interface,
> that feeds into another component (usually, an SFP cage and therefore an
> SFP module).
> 
> This allows getting a fairly generic PHY-driven SFP support (MAC-driven
> SFP is handled by phylink).
> 
> This series doesn't address PHY-less interfaces (bare MAC devices, MACs
> with embedded PHYs not driven by phylink, or MAC connected to optical
> SFPs) to stay within the 15 patches limit, nor does it include the uAPI
> part that exposes these ports to userspace.
> 
> I've kept the cover short, much more details can be found in the RFC
> covers.
> 
> Thanks everyone,
> 
> Maxime

Forgive me for my ignorance, but why have a new ethtool interface instead of
extending ethtool_link_settings.port? It's a rather ancient interface, but it
seems to be tackling the exact same problem as you are trying to address. Older
NICs used to have several physical connectors (e.g. BNC, MII, twisted-pair) but
only one could be used at once. This seems directly analogous to a PHY that
supports multiple "port"s but not all at once. In fact, the only missing
connector type seems to be PORT_BACKPLANE.

I can think of a few reasons why you wouldn't use PORT_*:

- It describes the NIC and not the PHY, and perhaps there is too much impedance
   mismatch?
- There is too much legacy in userspace (or in the kernel) to use that API in
   this way?
- You need more flexibility?

At the very least, I think some discussion in one of the commits would be
warranted. Perhaps there was some on the RFC that I missed?

--Sean

