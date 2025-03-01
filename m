Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE91CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emQgneBQx2GkDTPzVDPMrpW49qKtnf5Ma/tpnHu+lM8=; b=BrCX5iHaozzrMUfmewgy+JgEuC
	aerOfFzXW1734sOjjhfD2RxjYVmesai+Dyiu3ge+W1RohhhBYGruYWpGjs5KDoxVf8/JC6i7onwkb
	lyTx9RTtCMbcs2MYYnOeZ+lnOki17RldZicLuMnUQjIeqTVJmaAJBVtLZWI2qIN/Ogrou+FMtlHJb
	r0FIPF0vWzFTQppid2mzA6tPyNpYVFf77rlACzFXrpTIknw1ZOzc1w/eHaNE0F3zqBicJnXX9IYNR
	VTD1EWdDYWoFk/bTJkyyvW5qGb6+f2b22PkA3ZII17Fc3Fp2HVvbZ7ww2UCMaYN8QZNiD0465iVQJ
	/N+etIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKqD-0000000DpMG-1Mjw;
	Sat, 01 Mar 2025 11:17:09 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKlV-0000000DoM3-3jTd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 11:12:19 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id F422C114005D;
	Sat,  1 Mar 2025 06:12:15 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-03.internal (MEProxy); Sat, 01 Mar 2025 06:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740827535; x=1740913935; bh=emQgneBQx2GkDTPzVDPMrpW49qKtnf5M
	a/tpnHu+lM8=; b=1Zt7TsYuUPsDseNNo+8ZboYjCukZzltRCNGiZobleRAAbZ61
	+DEINfPW7ytAU8rVoVDJIB3DnW6CeFwaoks+WiJOFSJ74HD5L+5rhVwMgouXydkc
	rr1a0/j1aDORpVQ48GqE5XG38eVlb+U3yttBq1tIQuwPVeptxGEEg3gEmL97XSop
	+UTjQEI2uuTTZhEWUv0k5Qkor3EYFs7kz7QlXU/tT1lTBKo1PP5iUyfbu6qje0pc
	3zBrTStTxf+1yz2SI7UBIwv3xJWNxPHwQ3P0u6Fy1etvTu70XwaRP541BuWhdGtt
	mestxjOgZrG7vsXHwP/pSqBfKPq2AhfWQnh3Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740827535; x=
	1740913935; bh=emQgneBQx2GkDTPzVDPMrpW49qKtnf5Ma/tpnHu+lM8=; b=3
	WyofDg34NEAmG1IIbppF+U+1WYRDdsyTAgbrRU5x4m/xU9ucGDhPnLRp/fXCUOps
	LMEET1BKDEfKft3fpl+QEzAlweuwJLcnfb0Eab/xo1RvywpSWa/mI5OyK3fDU2qW
	hJ7yGYltO9rjYeSDcH1S2aSByKMaomDA0wEG2KTS9gZfbsGENuWhRESrDhgh6Mb3
	w49wb1xccO6vzHaQ6wT53y4lP4dbp/k8YzulaX1/ehAYU2mv39EMX/cjx41y7EAG
	oNAQep5BFF7797+oMHuA2fRmkHLCKVBh2sEvPccIXWv035rrT7dM5wDqls1ZY3jQ
	4u6XrOQWAB24UiRDpxT0Q==
X-ME-Sender: <xms:j-vCZ7nS1S8n2KRkLrQ3IQd3zaGY8WHneGQou7T2mdXF_7mjf3chMQ>
    <xme:j-vCZ-0K33EQgZhAoCbAZJkyJs_qYMFkkZ9ovSDTNMtxuoVdT01rVAlQEUswhMlx8
    tOjtDsZYVPZnxojPVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelfedugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
    feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
    tghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohifihhntg
    hhvghnmhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvght
    pdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrd
    hiohdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:j-vCZxrtpG8dOD1kK1nkjZB6mI2ZPo6C7AaojHHjZYhzH2iYKEshlg>
    <xmx:j-vCZzm8GRtOJv5mWT60XiAx9_kTuadqz9kcfylk9k3RhgKAYnkjwQ>
    <xmx:j-vCZ50e4NdzY9S2AKD3q7qkTIFNbU7Ea7adFSXec8amrAoc2EtrSQ>
    <xmx:j-vCZyuzkCXjW1_BhRx-vmmfht-du1u8zjqt8y3z0zXqAcE7Z9qQBA>
    <xmx:j-vCZzxd6ttZESm-38Va9fihMJk8oIDuoOU3vGte09e8X9CEzl7mxHl1>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 02609BA006F; Sat,  1 Mar 2025 06:12:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 12:11:54 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Nick Chan" <towinchenmi@gmail.com>, "Janne Grunau" <j@jannau.net>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <4670e5f8-2a92-46bd-8faa-dd3774517f3e@app.fastmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
Subject: Re: [PATCH 0/9] arm64: dts: apple: Add CPU cache information for Apple A7-A11,
 T2 SoCs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_031218_349261_B6AE8237 
X-CRM114-Status: GOOD (  11.36  )
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

On Thu, Feb 20, 2025, at 13:21, Nick Chan wrote:
> Add CPU cache information for Apple A7-A11, T2 SoCs. On Apple
> A10 (T8010), A10X (T8011), T2 (T8012), only the caches in one of the
> CPU clusters can be used due to the "Apple Fusion Architecture"
> big.LITTLE switcher. The values for the P-cluster is used in this
> case.

So this means that the cache information will be "wrong" when the CPU
is in the lower power states and only correct for the higher ones?
I'm not familiar with how these values are used; are you and do you
know if this will have any weird or unexpected effects?
Would it be better to use the cache size for the lower rather than
the higher states or does this not matter much?



Best,


Sven

