Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B7FD6AB10
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 22:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+l/aJg99+jURz0t2bEUsGc7u7mBcNC8I1cRKQs52X0=; b=TFhX8de0+vJK9DB+svFV7+KlRk
	97ZOqZA1E1IEmzH9MUX3ApSSTqFjJ59VNBJxLAWf5l1eN724l0H/58dw5XzZFkaGj+stbPz/aKE1k
	FlM5Pk0cp880vwX2Oi7j6q0kApIdHM9HjLNdvGd4jDTWDW5907ZFYtVvrkokHuhzqYBXnCYsr7J7E
	qpsyOk1HY1pXIjYCBo+BkenQBCkJqnHTNjZlWxdnfzmZgEMDzK2j3auFOJO2xgeRX35fB2PIg4D2h
	LZly+oOy5HyzB9er7LkaZr6NxNfSTe+Y84j4zaWX8BsfFrlWf6h8DX5X8N5GQO3hgBueZnQ8HS4gG
	YFmsQozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Q5y-00000000qGw-0MLT;
	Thu, 02 Apr 2026 22:00:58 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Q5v-00000000qG4-2A6i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 22:00:56 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D33341D000B9;
	Thu,  2 Apr 2026 18:00:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 18:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775167253;
	 x=1775253653; bh=n+l/aJg99+jURz0t2bEUsGc7u7mBcNC8I1cRKQs52X0=; b=
	ctutmgimzMvI2bZPsB1O2ZZKXvY6axgEpcR8Qbl1uv++VGD2WgvN02Qp+F5qcVaa
	N+MFB5N4pmnicHpZlNmkZma/JwNP8Q8Ga9f7ck2F/whle0EoEEkynNZ+SwoV9DSH
	jOjPxOk9gFDDBS769Am73XJ9yq5q2TTp5UZffaDwX2RZ3laBFczNb+EVm+avEN5K
	ZkAva8XlZBmivcLaTIkAE0Q7nrSI3v5/MRBoASnP7pNRKOXNDU33uZHtJS3hzSdl
	uGScJpLkNcdd0rc6Ya+lqMY3XiDWPoYOKpeBZqM9H6SyLgQD8dak5yjXNupDtfSX
	HuhKLe1e9Xl2WWeR1Yf8pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775167253; x=
	1775253653; bh=n+l/aJg99+jURz0t2bEUsGc7u7mBcNC8I1cRKQs52X0=; b=F
	YaoUNk5hG3M2diDOU2VH0Glpkw7FYla9e/U96Su0EHu3vfBzqJxBi0whd9HY2fiP
	U0xPMyLBrtrCK4ecabXLsh3K1XK7MJO6jYA++HXHMoYUTgPjhlyu7V3UVbMBsExI
	2TpwtxT8niWWHxbf+bJAblYX+T5xm6uaEplS6A4gSAKWKFeeQIBN92LZyzxe2MvB
	DKYr3tX6MjZnL6fcnqpu1CUs7D4EeFHqJvdTXHmoebg72eJLrqo7UllMvCzS4kE9
	WGSRZiqW/pxzvGiv5sjWPZfbIJ2Ppo3aQZlAYAvRGHbWMV5wCCY2TpN0Nhp5nvFC
	0TrPuE+kC9KH5UuxJxoEg==
X-ME-Sender: <xms:FefOaazhAPeFPitrxfd4RV0_OxMnnQxeVohRlpXInkrlDSKMWin_Rw>
    <xme:FefOaRFyPwRQl3d1ca8ougIk8KyaIVzHLVla0BZEZhufOguNFUe7M6FEX6uziGUtH
    OyXijglyDdqnYETNmmxB2AKfbNOMyFJxQlpd7oJh_LLYgnCDtBMA-o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhose
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtohepnhhmsehtihdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhird
    gtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:FefOadis3rSKqrJJm3JxxJDaae1Yyr8AtKKq1sYVVRGFLsZezNzl4w>
    <xmx:FefOaUmI7euFS-XesSs80Vi9BQ6ENMRktDGPCnbDzClJwkPVkBccvw>
    <xmx:FefOaQty_lR0M2SsKnCE7EmgCi5dESXVSgvpNJySWVy_PohnfAwNEw>
    <xmx:FefOaSYmfYR4x4SWGDH4h-Feqakvt9LVw0JaIDLnehS7m2KqtS7h4g>
    <xmx:FefOaT8n0SFb_xXotOFC9jOKo4qfexDgkIiaYuz9Z_Zq9SnCLC3x6RXR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5A3C7700069; Thu,  2 Apr 2026 18:00:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARM_Kd3jj6po
Date: Fri, 03 Apr 2026 00:00:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, SoC <soc@kernel.org>,
 arm <arm@kernel.org>
Cc: "SoC list" <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Tero Kristo" <kristo@kernel.org>,
 "Nishanth Menon" <nm@ti.com>
Message-Id: <1ed625c0-e977-42d4-85f0-91e90a4c3547@app.fastmail.com>
In-Reply-To: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
References: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_150055_623886_26E50DFD 
X-CRM114-Status: UNSURE (   9.74  )
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

On Wed, Apr 1, 2026, at 19:14, Vignesh Raghavendra wrote:

Hi Vignesh,

I've merged this now, but I see that there are a number of
patches that look like they should have been part of an
earlier pull request for 7.0 and possibly backports:

> Generic Fixes/Cleanups:
> - ti,min-output-impedance addition to all K3 board DT files
>
> AM69 Aquila:
> - Fix DP regulator enable GPIO
>
> AM62A7-SK:
> - Fix pin name in comment from M19 to N22
>
> AM62L3 EVM:
> - Disable MMC1 internal pulls on data pins
>
> AM62P:
> - SK: Disable MMC1 internal pulls on data pins and enable Main UART

Can you have a look to see if my intuition is right on these
ones, and make sure they get merged more quickly in the future?

    Arnd

