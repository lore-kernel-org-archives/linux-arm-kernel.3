Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEE5C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 09:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEbT5bPhP4WcLW38oXwnbwZDnAF+BgzvO4LRwbs0urQ=; b=YvZJJmhChYBNPPR76SPv940pLx
	1nAzHlZzOz9F2/8iKtJ7NEsp9V9kgg9PYSGTRMEGqOPAcynbtBtV+2qlwaPlJVNqBUMtPRzI1jQhm
	01w/jjsrGEVKXasn8LPWJwAAsgnwsRpVgPKfp6fkyQ9MmRslaFsKOWw9LLptHEVaeGMBQJSXY/Tb7
	FTxHmo4zdM9NPn6+bGZ9mY+8StYX8JnO5nzT3R8SPZSMzO/fxh+qq0tfkoVY75M3XcLR3DfX55FWy
	yc1FkUmzM3cghe9xXW/ghbQOzSu9DOE56h/9HNN9RNppTATN6r4V13By4fd2Iok4ZK2Pjs3h/XFnX
	VTBeRQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYKF-0000000EK3k-1MQM;
	Fri, 21 Mar 2025 09:05:59 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvYHl-0000000EJd4-1sWB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:03:26 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AC130114009A;
	Fri, 21 Mar 2025 05:03:24 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 21 Mar 2025 05:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742547804;
	 x=1742634204; bh=LEbT5bPhP4WcLW38oXwnbwZDnAF+BgzvO4LRwbs0urQ=; b=
	merId6y0RnVKyxyTClbhwQo21y2zU3NJxajhrt0fwZPHI+8ZlSZKs1rmPXGGM+1H
	sCvRMNPcaI1oXd3+O4OHEeQMznRuy2+rcW3sXw9b4RHZC+qkkmticQcS+aP73L6l
	F9AiD4V9/Vyi9Ar4zjMWzJ8oHciiUBhjm1TeZkR8e/xKaunEaS1MjihdpbAWlPFt
	Ujd35Beeyye8C0NX02uziSfoRHdmSMAIuw+S6jWFbTWZS6r01Dys3iPz2tKTbgle
	HBL0TOAGIpOIGkm1Z17dAHyJGwtow8eBZ+xrieySqcmFSO2elOT4Tm0D4yMZVp4X
	FnphFbMXueWhfoNrIj1zFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742547804; x=
	1742634204; bh=LEbT5bPhP4WcLW38oXwnbwZDnAF+BgzvO4LRwbs0urQ=; b=4
	8cHDPDAZKTxz20VisSEmp78kpWp9L10BOI63t4yyNCLxVjDh6A38ALDDxxVgNOn2
	HVRk1iudMu4KiXWeZOB9F4ATNoF5esEUHVnI2TON9DCmyp7Dyeb9TOUkFNsKGxaQ
	53N+G19oC5fHKGWEFHsjp3RAUvfyQSxL+GnD1gkfS0lFTOgQHnqhfG9aeCP6MlAb
	v0M3BKwDFxd2i/qo8i1eqlKiMafUIWEwFq9ErmojD+yoqG0bvKTSrnoTdJ1z9kCD
	/UkiUUlFNOsF7VG0U8N93NLambZrE4dfYLhV6CVID/WGkJTetpkzrcyaYq162VJ8
	fY5Vj24JAiojVL8CXN3Hg==
X-ME-Sender: <xms:WyvdZ1vUgCVAHBf2-ld5VaanSDcjKBI90axcl0vtE5wRZooozLZVyg>
    <xme:WyvdZ-dIfqxJVKpJ1wR2iaSkNluIGnsDtEUaMxv9rns2zQZFdT4YSQWHFs8ob2tKS
    6pLuX5R-xxbutazdYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtoheptghigidqkhgvrhhnvghlqdhuphhsthhr
    vggrmhestghigihtvggthhdrtghomhdprhgtphhtthhopehfuhhgrghnghdrughurghnse
    gtihigthgvtghhrdgtohhmpdhrtghpthhtohepphgvthgvrhdrtghhvghnsegtihigthgv
    tghhrdgtohhmpdhrtghpthhtohepmhgrrhgtihhnsehjuhhsiihkihgvfihitgiirdgtoh
    hmrdhplhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WyvdZ4zsmGXN-tX6IEG1VMG842mhYjzOzA1BtsfWle6yrOArGRhlcg>
    <xmx:WyvdZ8PrlWRu1LA6oEn060yebTb1Ag-AqebjIH87b3By2Q7dwt6Isg>
    <xmx:WyvdZ19YrjPNr1rAc-u-ofNIqs40tfCCjaalcyFFnqlMxquFvSXLaA>
    <xmx:WyvdZ8WWG_8MBf2yt3HQFiv3e7gQRrkVgr-LDOeyBXcjVlOK_s-Wfg>
    <xmx:XCvdZ8XkCG1VoR2k-iT0qkyzlOA75Au0yJWyl33coS3AcNt7gadovbxl>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4B6622220072; Fri, 21 Mar 2025 05:03:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1bdb747f5f593b3d
Date: Fri, 21 Mar 2025 10:00:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Chen" <peter.chen@cixtech.com>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 marcin@juszkiewicz.com.pl, "Fugang . duan" <fugang.duan@cixtech.com>
Message-Id: <59619096-bfb2-428c-a4f5-2dfb031d126c@app.fastmail.com>
In-Reply-To: <20250305053823.2048217-7-peter.chen@cixtech.com>
References: <20250305053823.2048217-1-peter.chen@cixtech.com>
 <20250305053823.2048217-7-peter.chen@cixtech.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add CIX SoC maintainer entry
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_020325_555429_0EF33FE0 
X-CRM114-Status: UNSURE (   6.61  )
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

On Wed, Mar 5, 2025, at 06:38, Peter Chen wrote:
> +ARM/CIX SKY ARM ARCHITECTURE
> +M:     Peter Chen <peter.chen@cixtech.com>
> +M:     Fugang Duan <fugang.duan@cixtech.com>
> +R:     CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/arm/cix.yaml
> +F:     arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> +F:     arch/arm64/boot/dts/cix/sky1.dtsi
> +

Looks good to me. You can also add a regex keyword entry such as

K:       \bcix\b

to match any filenames that have 'cix' as a whole word.

    Arnd

