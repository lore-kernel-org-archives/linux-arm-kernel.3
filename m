Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A412E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcDSjeks6TlFjnGYIqpnkk+EjNYuhIl6j1UVmh3/ZuE=; b=lYQyNvwOjrSUS2
	yE5DGpplg10zieiQxTjkgqfG2lNPD7NV6fxrY2KxeuClBbQFYpLOcCpMb1rIs4hQXfCADcyJJkPHi
	QXVf7HXF2D5vSYeAsf/r/7k4j3gJcUkBMfXm2XsW1IIM9CV8rsqMrDhqs16qVaI57FWpgv3enHWRt
	i68T714JISslNxAbRruk/MKVX7TS3KGdShl9UYXwO2riM/bBiqwv62/DgrY77YfbxFPCcu0/okBnQ
	B0pniri4/Nmg9gbmHcPAzBDam664P84QeAALGSqyfR/9z8fUYFaNvYcZQpzPS4W4F6K0f2Y18WgwZ
	7jpyeuu2MABnoMW07PgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmwQ-00000001MOi-31Bb;
	Mon, 06 Jan 2025 13:14:46 +0000
Received: from buffalo.ash.relay.mailchannels.net ([23.83.222.24])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmkL-00000001Jqj-19v7;
	Mon, 06 Jan 2025 13:02:19 +0000
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 885B51641B7;
	Mon,  6 Jan 2025 13:02:08 +0000 (UTC)
Received: from uk-fast-smtpout8.hostinger.io (trex-7.trex.outbound.svc.cluster.local [100.109.217.170])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E86D2163474;
	Mon,  6 Jan 2025 13:02:04 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1736168528; a=rsa-sha256;
	cv=none;
	b=+MGFwFRWxGnQkdzbUusmcuVsKaD6FqRQXym6aYXyqLZrJRseAwcgfWxW+3Sw03NgXcqS+W
	OzCA3ZMkNwUy9aQfJhDxAIHQ7tMmoHgeJohGMr01IeAkaAHaDU+7kbmWtY23kbxvbtwUDT
	gAmYCVppbOHkrdoJ7Ir9eI0Uuln3wxvExZOF4kMjLYLyoOKDf4UcsqGODojujtqeoZRT9I
	uJFviwW6+4tickeFoKHvAa+OYL1opLkKeN7KtxZqrcJC9NdzUcJkOUGW/tkplYESVgJedc
	cjGG9wL9vJo0hlcepBjQ/sxt6nokilD/mNGcU6Tpi89P+ckUK5fSdA6907qXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1736168528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=AcDSjeks6TlFjnGYIqpnkk+EjNYuhIl6j1UVmh3/ZuE=;
	b=uENe8QvJ9Lf5GumSpe8pye6l/HupodHK+lj90nHD65kAIdsfs0Edv3phRhro72yLJJY/ne
	T+wzaY6TnEWY7y7vtFm/vyQXDNVN6sp+Ape8jz+fVi7YbRwnr6X2QXKDsDYdhn4yg68XM6
	xAJbKAv/c41/NifN+Ny83P3R0hcySfytwpEWKRijGXnmHaD7T0E5dO7GrEkdkpWYMac1YH
	kOx8VtlGrM7Bc6FUecdEvQ+SjnYW4+sYCXlRATTucZUlDNfK2ACQ1yguC9WUduugIALV7p
	+muQ7tM8XKk/ojJHgtiT9CtvG1GQjLOm+5Ej5sGqbAwQbfzg60kKJ/WOOgmR3g==
ARC-Authentication-Results: i=1;
	rspamd-7c48484bf8-vlhwn;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Company-Spot: 7ca0a4c92aa3c7f7_1736168528359_1456431916
X-MC-Loop-Signature: 1736168528359:626636087
X-MC-Ingress-Time: 1736168528359
Received: from uk-fast-smtpout8.hostinger.io (uk-fast-smtpout8.hostinger.io
 [31.220.23.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.217.170 (trex/7.0.2);
	Mon, 06 Jan 2025 13:02:08 +0000
Message-ID: <bd07fea7-2473-458a-b0f2-f03afb6a8b32@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1736168522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcDSjeks6TlFjnGYIqpnkk+EjNYuhIl6j1UVmh3/ZuE=;
	b=mlJ8qwQ5EvPAxtT10MwR1IlP8+211LJMFdbtycwM2pmJc48WD+M2zl6DiEc8LcNvo+Yypd
	pddR5brQ+rQhMO6B4W23cvPjsaC+p0TEsW4fV8hg7Q1zs26KbDBg3RZFyfpq3YK76jCxtt
	XTc+P5pKb0rsHr4TCAIdc8QEgXI9x5JE96+bMMYv3JEj7vE1cYC9aHyYLcv4FvfQ2ikL4j
	HJX7ZnskyC5Ti5+qE3c7X/cX9y/VGkHf9pCEWKp8oBjC3iO9/N/W+ts2kpDbY147l307YX
	fGidqp2ejtV2dH6X2yFVAJqMjkWmeZaDE1fa7x8Xlgj+ZqCZLNxOqM/gek4AVA==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/9] net: dsa: mt753x: remove setting of tx_lpi
 parameters
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ar__n__ __NAL <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
 <E1tUlku-007Uyc-RP@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <E1tUlku-007Uyc-RP@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 06 Jan 2025 13:01:59 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ft9X/Hrq c=1 sm=1 tr=0 ts=677bd44a a=xjZdIgyYDteOtQQgkZ0oAw==:117 a=xjZdIgyYDteOtQQgkZ0oAw==:17 a=IkcTkHD0fZMA:10 a=PHq6YzTAAAAA:8 a=GvHEsTVZAAAA:8 a=4-z7pJFQCo3YSGV8thMA:9 a=QEXdDO2ut3YA:10 a=ZKzU8r6zoKMcqsNulkmm:22 a=aajZ2D0djhd3YR65f-bR:22
X-CM-Envelope: MS4xfH9N1taU54asjLrGreSAV/TehiAi7J06EL3eyr/omZSHO8gLmfXKXvQ5bOAI2GJNp5Npok24rRkRfxgEZNYsmmuhu8FmWE96hejcxZi+ChZckJwfPgNK s4fCUM7Wi67jRRhPpmSjwaVPjlzvSDdUx2m0p6yaZgk0lCNF7Hz64D/AOFixAu7ioUOISioX6JPE+EOS0yHgjPVdp3Sh2mqg/3YuRrZbwMHQp0jagjrugYYc sgtyMCkI5Vpw9XC82MXAL228DXBQwubpDkKil5EqUTNp1GoCW4WsYZh7cDotLi/gAO11PwmeDq7QbZ0hWkc+zU3e4S8yCVfPAbYR+ynCb71QtDDEj226R7rj Xg6R6WNbu+GIMDVy9k491mo7mhPaMgudWViHLoxb7wYyseo1t/QO5mPyXv3HjNUL61iJsfwTKPJFW6rTCVzHiVw4Jgo1zHRjEb0MDmZN9tR/jZL2jXbhBkC/ 4zJiaw+ToNXTy4WJPt7UEW2LIYIVnh2nSFhHeiFFZbuBuHTVfOJRNSbyzme7318sbFkKy6IB/ufPRZgKd1XLi+Gpp/TtKvaPJDaRP/3mbRi0HndNpHw5d1T4 8U43j1IYQCYeUjqixfpWbKUQeYYYmzkhYv1Ik7NIK6OzNuIgnc76BYguUhWSsM/C77mrORhSp6DSBFTUl+5bce1PKQnYLdaSFpfEqK+oWaNBB0NbcfFFarYe NiuDv58o7r214sFoVRLYmMbXv6su2hgPKTRRsI/2eA29uzpwYwq4wMbZMl0ompHn+/0xLhmgyM98LM20HDur7Ws6CwiV944ypBhargPWj5vsaslDuvYZavb9 poABEHzwWaHz2/JPKVXW33ZHo8Yg1AlF8PY9332wLdC0XU+2NTdOJx37ZW+Z2HwPY8Pmv9ouPq+/z94dBX8=
X-AuthUser: chester.a.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_050217_716378_6455E241 
X-CRM114-Status: UNSURE (   6.34  )
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

On 06/01/2025 11:58, Russell King (Oracle) wrote:
> dsa_user_get_eee() calls the DSA switch get_mac_eee() method followed
> by phylink_ethtool_get_eee(), which goes on to call
> phy_ethtool_get_eee(). This overwrites all members of the passed
> ethtool_keee, which means anything written by the DSA switch
> get_mac_eee() method will be discarded.
> 
> Remove setting any members in mt753x_get_mac_eee().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Chester A. Unal <chester.a.unal@arinc9.com>

Chester A.

