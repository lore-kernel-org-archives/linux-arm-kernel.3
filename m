Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633DBD2444A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGUWJRfLEGG5MQjirrXoFGblqtB6v7zhyuKgj/1LsZ8=; b=18e6vePAkmy1089a5pHYZLs9X1
	tklDlGkmjP4DSXPJnUZ9lIIPrhjl5F3vczWMAYaCbxfOSN9SC8Acl7CH8z/7/oN6iKrtKDu6FJT36
	pZQPOsXoThnfuraH/uXJxuRepVmloXM508pHAeWQcpC+Qqy3FRrjdL0e9xDu/RwX0dt5ZYQLaiHE9
	84bHBP5ZfVR84NufDXcuh9daGR7yKaB1TPVYBKjnJpVrj2VnEOnK2kwzUHmt4lUSLNnA44qwrq82B
	7WUZD59pgWSKB8w1iRCY+pKqeu/QnnQB3uTlVpiihXFXx6/aoFlMEBWYSTxTW6ux/PEoSohy5upzE
	549sceww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCsG-00000008LwA-0sVM;
	Thu, 04 Dec 2025 17:12:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCs9-00000008Lv0-0BBG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 17:12:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-429c844066fso84672f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764868323; x=1765473123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGUWJRfLEGG5MQjirrXoFGblqtB6v7zhyuKgj/1LsZ8=;
        b=gCiBpy4zlizrtJCagQU77OuY3gRcjqorzEXrx06//yX6DuYG0gOHZ0cWVpvL5Jwa0F
         RQg8w4wtE7vp1uHhL3zOU1TKKzJ+q67hh7kMaRb6mIt3gg+69cUMMXNIZrBRe6lO8GEl
         F4u3BC+iaRePzy2Sw8VCC/M8sESr2NjeMyBDsuhbSh3wf45qHb7ZRo4zWIMbEU4LQ/Mv
         hltafCki2V6jXS9aqBrigpne2Wh5J71K3Tc0FCAw2e6vESicuM7sKv5w78e5pXxI0TlW
         AVfRe8hITeb9deD1pX7ijeDdXegTBBZ4PuA5+lGtPyuSzfMhLZkxIfVtV6Vip77mGEc2
         RrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764868323; x=1765473123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGUWJRfLEGG5MQjirrXoFGblqtB6v7zhyuKgj/1LsZ8=;
        b=eHskKGAVRgHi0L8Xe9al5V1s/TFXBH0SOGfkCW8UyCiPdHwspymcNFeommKkuckEs3
         FDUZY/waTDxbmPYGxg1E8+h4B5H0eYY2odiA3znFNyG7cHXhqVDqZqnrLXVWc+NjrDS1
         wJ5i6eUwhvJmPX2v5SDF51mi5rBJh7BCEBx/RiwxAB27i8m6+vZ9PU/8Nal7DCE0J+Lp
         T+0fmxMl5DylwhQVUXvhEzcWHww5ZiFl76RlhrXP9KJZUpTCe5/9Ujl+oXFA2tHxodEN
         S6uAngLT7VDghWtCZXiYD+BdilEQGBkkTW5/OKGFCIAjY9bWoXDBXQFQanXIYQkHxkU9
         E/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXpDljsz6vx/wbbmVTLmUzjCohY95wzhmVQl/uobAxDZXIeDY+wxnEBoSayNeVIcYQDdQXRdUUr+4rk6/SGFL1v@lists.infradead.org
X-Gm-Message-State: AOJu0YzOS1PUB8PF3o1xA4MNsQQAkjNSHXTmRkeQhg6X8vg/ka1g2S6A
	aHGQGPJJNFp7g5lEG2Tl85W29iAFY+uhHtRBzjpqlVakH7S8D+T96sdQ
X-Gm-Gg: ASbGncsouzS76x6i2W07rhdzBZCTsQSeULvlBwbSpjWhGBhrJbXsld+LvbiyXYmB40Z
	rSfuTCuH6/XDP5QP8iyvA4NLv9S+L28ZnaUC7+1A3KJWlUibOwJyXNc2saF/jiQ/jJTnTiwdE2d
	jGHsx09pbyl5QQbYAbLilxLYQvsLj57m1dkzsWxvk3U9JGDkizBISUrKH4eazSwEYsK6iv7S+oq
	fJG8Kro2KIKAnCV7DFqbN8fy5K0C4f8WWzRsnvi1X++48+mN78wkojfSqo0ubZfSzy/9p3qqSHk
	IYB/zTJjLKhEhKwQchzIa8/DIVpf9a9DIP8rq0rWMMYJQbtFT+Ny4g3epBQ563rYLIc71qntazF
	Kq1Bw0MwfRxMSPXSv/VpwYavtGES7RfkoCUvyWM41h3muEowd+VSk7ui50Z2HJzJ0s1Rz/vhp3I
	F8sPM=
X-Google-Smtp-Source: AGHT+IGxkkIvEqrKzXYEjrd610hQ5Joilqojfn2sZR57wWJ4rYVFOquGZdhrsExO4Zfqp1zUdehCbA==
X-Received: by 2002:a05:6000:2f83:b0:42b:2dff:d394 with SMTP id ffacd0b85a97d-42f731e6940mr4153566f8f.8.1764868322949;
        Thu, 04 Dec 2025 09:12:02 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe9065sm4190267f8f.8.2025.12.04.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 09:12:02 -0800 (PST)
Date: Thu, 4 Dec 2025 19:11:59 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frankwu@gmx.de>,
	Andrew Lunn <andrew@lunn.ch>, Chen Minqiang <ptpt52@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204171159.yy3nkvzttxecmhfo@skbuf>
References: <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
 <20251204160247.yz42mnxvzhxas5jc@skbuf>
 <66d080f1-e989-451f-9d5e-34460e5eb1b0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66d080f1-e989-451f-9d5e-34460e5eb1b0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_091206_303992_89A646EC 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, Dec 04, 2025 at 05:48:07PM +0100, Krzysztof Kozlowski wrote:
> Both are the same - inverter or NOT gate, same stuff. It is just
> connecting wire to pull up, not actual component on the board (although
> one could make and buy such component as well...). We never describe
> these inverters in the DTS, these are just too trivial circuits, thus
> the final GPIO_ACTIVE_XXX should already include whatever is on the wire
> between SoC and device.

Please read what Andrew said:
https://lore.kernel.org/netdev/3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch/

  Assuming there is not a NOT gate placed between the GPIO and the reset
  pin, because the board designer decided to do that for some reason?
                   ~~~~~~~~~~~~~~

You two are *not* talking about the same thing. I dismissed the
probability of there being a NOT gate in the form of a discrete chip on
the PCB, *exactly because* you can most likely invert the signal in the
GPIO pin itself.

