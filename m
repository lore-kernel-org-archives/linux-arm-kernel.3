Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A75C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 21:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIYfd0T/j5SBPcpX/gdIeYqVuIXA6uYpUuJ16WL2Nwc=; b=t44NQ6WFUhYEQER3iVQZe0b69K
	+xFfwYFj87ige1FrOdOdS6FhudMn+/knrjjOmuHuMNz8fD4jreCHyD6/oTcHCAcW1wwKQ5qg368bG
	2t1z7OHXuXQ7mscivxrGIXXsRo7+0N9JjCPxbEaeoAfr6nvYss7zj8CN8Zz5TFRnYNrGZRml6ZIxa
	RgBrglmimdQhBr8pN79fkkaCmXwdb0H11ncYw1Dg29ZK5LCf2/Rj33b4sEnQ18Z1Nt5AW55ngUdTO
	BmoKSWtvlEcmp0DgFUOTyfs6bcsFAk8nM+P3o2vKNiN4ru1T0LsDnTkbKG1Y8tJbQWxgRp4bupvRi
	R9rGUUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRe1A-00000008Rjr-23ZK;
	Tue, 17 Jun 2025 21:38:56 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdyx-00000008RfH-3bQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 21:36:41 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6911411400E3;
	Tue, 17 Jun 2025 17:36:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 17 Jun 2025 17:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750196196;
	 x=1750282596; bh=QIYfd0T/j5SBPcpX/gdIeYqVuIXA6uYpUuJ16WL2Nwc=; b=
	KCjegC3K6flBXwulOVll3KWf/EzEdmW1BAz5X8DrAd8kLr0JFE+UdMCgNIRCSilg
	5s31hfinqhmq0VC34XOkvlpkw2/OXFFjKVvpUDmHvS2AhguBjABkSSC6wYygf4sG
	I8afwjoTbGY4fK6F2bKznSpS6RfA/aw6+L1xbPbH/VhVhbiBRUnxzJ16K9IkV8DH
	EitJkBJUDaEptHsp01MYHKmPNqrv3KzM7vYZRxZ8GUQALnhWhIxPaIkOL1ATJQIr
	+eBc/NXC6FZIhTqenY4bkYEBtPESQebYRwx0VDkxexLH5KzPy5UOq687QUYx96GF
	Rf4+rMZLwfipv8IHy5ecWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750196196; x=
	1750282596; bh=QIYfd0T/j5SBPcpX/gdIeYqVuIXA6uYpUuJ16WL2Nwc=; b=M
	31XUbFx01m41pY0aPUUcTAF2bPy3sI+44y2YHWSmAL0hg4ULnXy1ugm6s0LVf07x
	p9aG8R7JyaXtLj/5IeM4+R7756OP+q03gmnw0hqkHcIVMUhyL6OOd14DaEARrAzR
	GKZW667tWvSopXS+acodde2KTmSxaD/OQkcySVhax3QiR/mP4sffRpRUSVRmB7ip
	ncaVmqTmYXVEBSAYRudWdFIXe/AnU9e9rLtpQlXY/PfoKw5svNpBSNfpuD18VNta
	+B25tVAtfcESITXspx1+D4tDXVe7pRlIveG7aEMNMA3RX3HhKQc5E2OjKaG4G44O
	1aj7gbVodAWn60XNGf/5w==
X-ME-Sender: <xms:499RaEZD_DlwPXCnsdyogv7IV5w7uPrQLjTfvqiLKRbRUxj5sdDxgw>
    <xme:499RaPakV1Wq3hwDWLkIgQO6_xRrd6sqHJu7MPYaM_bAcS-NMqMImq-itkOp-HJn_
    nRBMJuRsm7gt7xAQKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefoggffhf
    fvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgr
    nhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvd
    dtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusg
    druggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghkphhmse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhsthhouhht
    sehlihhsthhouhhtrdighiiipdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:499RaO-YrnKBr6kD2zpEtZj8WFHNNs16X2XwlKriRaTyIwsXKatIxA>
    <xmx:499RaOpD9TSGIyXm5Wyt2wflEPxnhYF70iqyO1R5h19OGosdJgQxcw>
    <xmx:499RaPrqbauIWDLrHOiD3aGrYOzP9PWPDpT0FyfK_jq8SQzdj9w87g>
    <xmx:499RaMRESKoovWdkB_o--liF-aHtyJDhPXGI6IB4sC24oxqcJadqrw>
    <xmx:5N9RaMUQuUeyhdGj81brsjrmx5va47oZdymrgrrGOLa8EzP2Bv5pHvCy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BE505700063; Tue, 17 Jun 2025 17:36:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T5ccd62e2b06e7e21
Date: Tue, 17 Jun 2025 23:36:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brahmajit Das" <listout@listout.xyz>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Andrew Morton" <akpm@linux-foundation.org>
Message-Id: <2fb06649-f2e7-4ad1-a831-f8b6b0dbafee@app.fastmail.com>
In-Reply-To: <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
References: <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
Subject: Re: Failing to build mainline kernel for arm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_143640_380190_BEF0631D 
X-CRM114-Status: GOOD (  10.79  )
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

On Tue, Jun 17, 2025, at 23:23, Brahmajit Das wrote:
> Hello developers,
>
> I was trying to build the mainline kernel (top commit
> 4663747812d1a272312d1b95cbd128f0cdb329f2) and came across a build
> failure with allyesconfig.
>
> $ make ARCH=arm CROSS_COMPILE=arm-none-eabi-

The problem is likely that you use a baremetal toolchain, rather
than an arm-linux-gnueabi or arm-linux-gnueabihi toolchain.

There is some logic that tries to decide if uint32_t should
be 'unsigned int' or 'unsigned long' based on included headers,
and it seems that your compiler comes to a different conclusion
here.

If this is a freestanding compiler, can you try adding
-fno-freestanding to the cflags?

     Arnd

