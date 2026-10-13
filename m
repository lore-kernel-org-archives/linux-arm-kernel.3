Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B165CC6B14
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=; b=S7osDi3I2OeShKqIo6fzSvcDdk
	mlvBQh0LJ3DNXymijVhTyGopQEWWGTzRQzTZAdkMVwhlJw1dnNl9gt051XqbsZEBqR5EQoMSVplU4
	KkiAP2uRENKB5gk2hqD8wL7anF7YmO/H+x2uXgC61fPIuFdMj9026x2tEQgcS7Sp3mxAMsRaTTSfn
	l904AfhjTT79NOQR6wrZ7yaqBzjyjE9rDw3i3d/P8L7prsWEp14biWH/pDJsfTtfiG2kepqewMdWb
	d8RvQltOkaamK7GP53E5LIb2E2j02rxMDaxWZ4+B1evRzfG/RsHjqOOmZC+dFHTEq2KiqaiDUiUR6
	wP+ST7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXJv-0000000CGNt-13oI;
	Tue, 13 Oct 2026 07:53:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXJs-0000000CGNE-2YGF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791877987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
	b=eSACbqttAKA7tGx7rmovthZp4tS4WMdCK9PsA4VJDsAiuJq+xfI8u6DnSY8O/nsshXdH12
	3cSMx/tWazSKZzvCd4az6Qh0Xh9IOy174TUbzaoL072T/qzhhwYX76Q/xnoTCIM6JYnEx5
	H/eeBFlCY6bD9TKDQwapFEWvKQukYHk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-lyc14nybN4SN3URk9S2iDA-1; Tue, 13 Oct 2026 07:53:05 +0000
X-MC-Unique: lyc14nybN4SN3URk9S2iDA-1
X-Mimecast-MFC-AGG-ID: lyc14nybN4SN3URk9S2iDA_1791877984
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b02d63407so1600992f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 00:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877984; x=1792482784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
        b=cS9Z/tF7NXUOFR7Vo34s1UnaEVVqnZvQdp0V9GS5fSsnt8P9ChJbAV1zn1XC8AkWlP
         xvhD2W0oXXpk8LdXHuzPJ0ZLj5+8mT8P/wbRGv6DpFmwg16ell4BZS4BFIKEIvyPkB9v
         pa8CtVbhWLze7u87wpdcfEWGRQjcDP8tGmTnAssgqAB1uWaBaFndzdekMTluNa4FRcPI
         E9ATaJH1ZFNDzTb2GjPhmoNrriTeQPS+vue9edqQLG4mHv4gAd02NTtLGodVQSTg7ahg
         IUVUdC30Bsa671C+AzDdxzT37tDRYMqbhl8bI+BtTEFYFu/QijdKT2N7742B+1tyFWvJ
         /CiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1Xszqj9Cy7Wb5w5DZ0eUZmQWEtWZBNpihi3Ex7j8WeBDekQCeNR1k9hKrn3mLJ6miaAnzljXFi7hkc8MjQRVa@lists.infradead.org
X-Gm-Message-State: AFq9FYKy4ygocWMg0FAubNI151XsYPdfxwVrGJCDCjKrNr3/g+g2wqG1
	pICRVT31/OwFZsnRbq8ZBcjSviVUWSGncBDz49JMUwx8DiVop3XcZ1a4pBPEMmNs2ux6NBLln4w
	KtjwtM7jjZ7eIhtSbr3m8tPr+rkt/k5Kb/Ikru+GWI2SKzSx4ITHMoShDuzpTs1K59M0LK908Z1
	wy
X-Gm-Gg: AYBFou2l0WBX1nWC6Y/CTxemvPDd2Kj4s8One3pMDfxpk7yTznT6AaFQknD9ZLpw2fq
	tTfMxFmp/dNDMRJePkZ4JxjFypxR1wI12zoN3tAgpGJKcVLbzfQ3Rg3yUJhvnxSM1GL2fl+o5xx
	t0cehdrye0ajnJo31zn9wRJp7hpzmcQrJAD87q/kF6PKh9HoYGExfInm7pu1IFirWVAYO5cC7EB
	kUIY/DS4kIja5wPw3mQt2TaKHRWT/vlXXJ/hnmES/YUoppF9GDvHoRfns9K/FdKIuFwTBLDGKF1
	KEgTC+9+5qynNVoN6ifqKNeIcX6zssr3aoy4u3MhHMt0/lBdJsw2ruE1V1ax0IO3npqhxeUYTpe
	HvT7sFrDk2znRXYNXIXNm7/1fNmFGMW/1tfGQ4hLIHHWLWh1o5eiyCqAfcyTX2mUjVwM+EMMIcA
	==
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr226794405e9.14.1791877983822;
        Tue, 13 Oct 2026 00:53:03 -0700 (PDT)
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr226793815e9.14.1791877983291;
        Tue, 13 Oct 2026 00:53:03 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm377412975e9.10.2026.10.13.00.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:53:02 -0700 (PDT)
Message-ID: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
Date: Tue, 13 Oct 2026 09:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
To: Aleksei Sviridkin <f@lex.la>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261006124731.1528963-1-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ih_1SGV1_QUzb6vtHqDBx3YMivqVA9_uNYdHHHYTubs_1791877984
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_005308_730207_23887FCD 
X-CRM114-Status: GOOD (  23.12  )
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

On 10/6/26 14:47, Aleksei Sviridkin wrote:
> On the Keenetic KN-1012 (MT7981B with an MT7531 switch), the Airoha
> EN8811H behind lan4 has its PHY driver built as a module on the root
> filesystem. The switch sets up its ports before that filesystem is
> mounted, so the port is validated against the generic driver, fails its
> phy-mode and stays dead for the uptime. DSA does not retry it.
> 
> Patch 1 lets the PHY node say so with needs-host-firmware. Patch 2 makes
> phylink poll for such a PHY instead of giving up, for a MAC that opts
> in. Patch 3 opts in DSA user ports of switch drivers that set a flag,
> and sets it in mt7530.
> 
> The poller can still lose a race against an unbind of the PHY driver,
> between its readiness check and the attach. That window is phylib's:
> any phy_attach_direct() caller racing an unbind has it. The attach
> guard series [1] closes it.
> 
> Tested on that board with the series backported to its OpenWrt 6.18
> kernel, together with a940003f44e7 and 07d995873960 (the mt7530
> .get_stats64 atomic-context fix). The kernel had lockdep and
> DEBUG_ATOMIC_SLEEP on. Local debug parameters, not part of the series,
> drove the error paths. They fail the connect after a successful attach,
> ignore the opt-in, fail the generic attach of a PHY with no driver, and
> add a sleep after the switch shutdown.
> 
>   - boot: the PHY driver loaded its firmware at 8.7 s. lan4 attached at
>     26.3 s, when the port was brought up. Link up at 1 Gb/s.
>   - port kept down for 10 s with the PHY driver bound: no poll and no
>     attach. "ip link set lan4 up" attached it a second later.
>   - opt-in ignored: the old behaviour, the generic driver took the PHY.
>   - two injected failures: "failed to connect late PHY: -EIO" twice, a
>     second apart, and the third attempt attached. Link up at 1 Gb/s.
>   - failures that do not stop: four attempts and one "giving up". No
>     poll after that, also not after a down/up.
>   - four failed generic attaches with no driver bound: nothing logged as
>     a failure and no retry spent. The port attached once the driver
>     bound.
>   - switch unbound while the poller waited: nothing oopsed.
>   - reboot with a 3 s sleep after the switch shutdown: the poll ran
>     every second up to the shutdown and not once in the sleep. On v5 the
>     same test polled 3 times in the sleep.
> 
> No in-tree device tree sets needs-host-firmware yet. The board is
> supported out of tree, in OpenWrt.
I'm sorry to give this feedback this late, but AI flood forces this
workflow on us.

The above looks like a significant amount of complexity for OoT driver,
and I understand it could be solved with a different kconf?

/P


