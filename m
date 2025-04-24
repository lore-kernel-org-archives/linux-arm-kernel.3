Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519E8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmFv+tXEHYX7Ma3ew81kmxN4G8P+6CzJSOvVgnKOh54=; b=XavgLZRuTxuX+jy/05UZIYYiJz
	w0PId6XkenB3c7XLn+vtJclBqGz8Ypqi5rnJutUz5zjqYQF7b3D+q37E+YCBPEYCzIY0nPzGhfMeF
	N/0M2lPlwiN3sRjxIe+5th2sY7r5wmEIFZZRtjq9h1GuSDy1Tu8YgLxKXwSKa/y8AqvR8qUtcAJnU
	FwtED1KyZC1mzgOsof/qt1mo4kaP+BjaI31CK468jKQzXZGMEd4FTommF6BmD6695s8y/r8Rk7FWi
	KwJzjhO1qt4ZFIiHDzTd91OYA1oxVfNqzfg0GbPe6GYVhtge/2Jw4B+pSwOgWvMX4+uVCyHdrPKXZ
	vpXKi34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xZz-0000000ENn3-21Ir;
	Thu, 24 Apr 2025 14:29:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wh5-0000000EBjA-2zxe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 13:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gmFv+tXEHYX7Ma3ew81kmxN4G8P+6CzJSOvVgnKOh54=; b=QYaKA6/WO/M5T+QFivNHKAqHj5
	UZaQEVAup9jwyqtdSqrbJ3mHoUSJEq/rJmXIkNQ/liMg5MfvmYGtpDogW4vevCM0Rnm4S2tgLH4ZZ
	WSD0xzxVOEMVmQfk+H7whhsLMatAqjvIFqw2+GIab8TdMgiwy7yojTvm64Pw6luT7n9uwHzA0J3bA
	vdU9ts98MYSbXqo+mx+ogiW4/TVYdYmk3m0aJAUxLKAXQ21YYPJEsLeQFqc/fDQWwBaHuEowwroXq
	npHwiyeNAU1S54iISJUBBLW0hhpO/mH2/iCesPhdKviwXWlYVQ5WaEcCzWkqj940/U02OD+GMeSrG
	z2o77XyA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7wh2-0000000BneR-3Bld
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 13:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=gmFv+tXEHYX7Ma3ew81kmxN4G8P+6CzJSOvVgnKOh54=; b=E9
	4egB8CqtTOjDUEqJRsWVzhfzq39pm38uoijSaR8zqYVzxqKVf3UdUGAnvKpxqy+exD/orSQbqAic4
	XHev/HvOzLuJ5auj96yizY8WaPxhBqlSuh1DqYZ1nMQQFZt5C+GyPZv+hNRU8aoHnHuwMf5liMiNK
	tyhhMeyNlLvJy6c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7wgW-00AT1W-9j; Thu, 24 Apr 2025 15:32:12 +0200
Date: Thu, 24 Apr 2025 15:32:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <caad87f2-8243-4571-8236-6aa3d4fb9fab@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
 <aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
 <20250424014120.0d66bd85@minigeek.lan>
 <20250424100514-GYA48784@gentoo>
 <6e9c003e-2a38-43a7-8474-286bdb6306a0@lunn.ch>
 <20250424142006.021d6ab4@donnerap.manchester.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424142006.021d6ab4@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_143244_949603_89B28D73 
X-CRM114-Status: GOOD (  11.03  )
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

> Speaking of which: do you know of a good method to verify the delay
> timing? Is there *something* which is sensitive to those timings and which
> can be easily checked and qualified?

Not really. If you are on the edge, you might get more ethernet FCS
errors. For iperf3 in UDP mode, that would translate to packet loss.
Or ethtool -S might report checksum errors, depending on the driver.

From what i've heard from others there is a pretty sharp cut off from
broken to working. Just stay away from the cliff and it should be
O.K. for −40°C to 85°C, or whatever the temperate range is supposed to
be.

	Andrew

