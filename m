Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFA9C61DE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 06:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKEypurhbn+A/hhYrWpuIDicafbAr2+ct/5OlPU0wvc=; b=OKnLiWMd2ycBQuVvjIu5s9lKKj
	QW4G927XJDzfYvXgLbIzBBXxXw9S5rcVOEUq39ncXtNZVjMetDmLiWYxlOsNvb5pOrEUn/xdSCI2w
	/YbagQt9OVbHtK5GjDPK7umAQxSaok/ryOiOgomu7izIDHjr/fxVXjk8/hqLvnDobH+xB6xqGusbx
	Wtye29eYL9XnkOCVyZj5aF7PsarChaLqr+RpE4DyeCVC8qGjh+Li6yUpG/MWU6RRBu8tcIn8KJ9jv
	1yPQQMSuA8t9U9r0zj3r5Cvz4sizLTp82c36+XkoeFcMhUIJaVjYhHyKfm5O6+vTrA38Wv8aqcgFC
	vQi/zN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1I7p-0000000B4Gb-0GnV;
	Tue, 01 Sep 2026 06:37:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1I7l-0000000B4G3-2Ohe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 06:37:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6CCAF4E4148D;
	Tue,  1 Sep 2026 06:37:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 388616053C;
	Tue,  1 Sep 2026 06:37:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD25211C7923B;
	Tue,  1 Sep 2026 08:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788244648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nKEypurhbn+A/hhYrWpuIDicafbAr2+ct/5OlPU0wvc=;
	b=UOuE6lU4zg3o1KqkkQJPmyZu+5/Xwr2pHDItPy9EIt0atoE1KpyHORRD0EEMMLVO9IH44m
	EU1j9R4FamRgFSQMZCI9OruXFl1JLl8c4Jpez/PS5gBTU4XCuV0Q8VjTtmpmno0oXIEi6F
	EiiCN7UhAoJ9rG8eRp+8WGQQq1g3GITZi51AeebSo0reyrWR/wqmPcBWDGJQq8Z15/m4XS
	l+FTpbyXGOH9G0wgt1ueGeieFUKjjOR801jA4g4YEcprsEs0Ce+z7G9PaLEIT3tDRxXDYo
	sBqcjevFau9ZlcfxzD2/iecNRvmzFjTWbAPWHHAMzDLVbGQotRSGuZfKqQWqyg==
Message-ID: <493afde2-8603-41e8-b6ce-f8e399c53275@bootlin.com>
Date: Tue, 1 Sep 2026 08:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac4: Use the full perfect
 filter ability for UC filter
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-3-maxime.chevallier@bootlin.com>
 <285c8969-2f0d-46de-b098-60ff10f30cf6@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <285c8969-2f0d-46de-b098-60ff10f30cf6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_233737_761474_90270443 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi,

On 9/1/26 02:12, Andrew Lunn wrote:
> On Mon, Aug 31, 2026 at 09:01:20AM +0200, Maxime Chevallier wrote:
>> Contrary to dwmac1000 that gets its number of perfect filter entries
>> through the 'snps,perfect-filter-entries' property, dwmac4 allows
>> reading the filter size from the HW features registers.
> 
> Does dwmac4 take any notice of "snps,perfect-filter-entries"? Should
> it be marked deprecated?

It's only used on :

  "st,spear600-gmac"
  "snps,dwmac-3.50a"
  "snps,dwmac-3.70a"
  "snps,dwmac-3.72a"
  "snps,dwmac"

So, dwmac1000.

I'd say, we can definitely deprecate on IPs that don't match these.

Interestingly, there are _some_ dwmac4 devicetrees out there that use
this property. It achieves nothing, and even worse, doesn't match what
the HW reports :

In arch/riscv/boot/dts/starfive/jh7110.dtsi for example :

gmac1: ethernet@16040000 {                                            
	compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
	[...]
	snps,perfect-filter-entries = <256>;
}

To my knowledge, 256 isn't even possible, there's only 128 MAC address
registers available :/

perfect filter size discovery on real HW says there's on 8 available,
I haven't measured the actual size of the filter though but it seems
more plausible than 256.

Maxime


