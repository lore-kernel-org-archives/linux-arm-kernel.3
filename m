Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1360AC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gl9oaGaRIsYt/WyBdN7UO9fsD1iIFpw+hRE7Ip3gDTM=; b=tlavMvn/zTOond+7SsGuTcjGjB
	PVyyRy2p4OA0URSd8+WJEC+e8clFb/ilTyprdwV3IPBL5/dafRqk3M1uMaWYcOPBB8UhkH/KUzDBu
	Fl2l6fhz8xO9/Y0E5plxArb6vspIibV9JyvPSme7dm1+dCSSg8WDFGiKio5uyN4GKG1HkRfrm6Lk0
	rlreQzsxIrny8uP1VxO8GEJljTyqQZ2vd3IaBMLsCxvP/9M7+1KoQVzLdIH/u25flghbg1Mq5f0ox
	NmUEUFcBZbB9KYzMgqhmgGLuvutxRomEHXuyrmN/Z0FZGohvUVOT52dbBZ0Jp01ep/CcNsOqE+wmJ
	TJzoq+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qdI-0000000AQce-06IU;
	Thu, 10 Apr 2025 12:03:48 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qbT-0000000APzP-23Tv;
	Thu, 10 Apr 2025 12:01:57 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 8903511400E8;
	Thu, 10 Apr 2025 08:01:53 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 10 Apr 2025 08:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744286513;
	 x=1744372913; bh=gl9oaGaRIsYt/WyBdN7UO9fsD1iIFpw+hRE7Ip3gDTM=; b=
	dfg+YRcn27ujd2Kv89PNH28iSsx/7J18F2jg5wmmBRf8pCwvQaPjV1o7P8x/kROs
	vvkaEZGKh4Yqj/RLXvclFPtu4fPBMK93Enw9GPRzzd22JO5qVvYm0yiIY2OM+VUY
	LDtnq75Oz7w9eYYD91Bign6GT4zSA/4zm6MROyaMlWAFiKWre29U84VLxU2FSPkE
	NT8uPtszkU/yY7WEuAAw1X0JSKFJVmEtqK9qOtv7PpM0LtNOCaMPhVbAQg2Wt2kj
	ehPfW65hcdqzweofIQJwcG/YCyhN2fBlCluT87167OUV386sVeQu/JcMKerWhegc
	iyUPtZcAywhDc6RVXB7nUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744286513; x=
	1744372913; bh=gl9oaGaRIsYt/WyBdN7UO9fsD1iIFpw+hRE7Ip3gDTM=; b=r
	8Zp9VEODKfutsmRAEbgUnrmBP3s0vdxVjQ8hpakmL3zjajt6qqTpVw916454vjfD
	MYCRUzOEQP66c9+jX4v3aRjSpzYdR3Pn2o6ABlec/Jb5b5J0FuSN3zDzgEJncxJG
	mr3wzL6l/A6SV4p+IF4pP1V3cyE2ZJRzIm2kkXP9GowfJB2Gkb15nmC3EMZTHmhu
	EvaIZiuyGZoiFUksZ6ewc3NIgmf17tWIdAfOXtj2hf/Yh/2erVvJqYsgVmYyw70p
	WL9b1Dpt3dH/1I6j59XUt7MntbL0AAiWiX/QrDcuw9gI8Sh+Gq2BMb8rn81QmirA
	MEVWkzxStZrSeZgYJBRtA==
X-ME-Sender: <xms:MLP3Z3ZzkHrptGtQOUk4WRvDyC57tPhsZw9eTxDP4-DVo3giJ-5fBg>
    <xme:MLP3Z2ZJ-wOZhDIeQ-61FKaOu6linY8MUS3ia6cJ4zjA8_UAANbvmqWCqELvg8xO-
    G4GclEPSZT2KHJX96Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinh
    hugidrohhrghdruhhkpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordgu
    vghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnshhuvghlshhmthhhsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepughqfhgvgihtsehgmhgrihhlrdgtohhmpdhrtghpth
    htohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthht
    hhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvgguuhhmrgiivghtse
    hgohhoghhlvgdrtghomhdprhgtphhtthhopehrughunhhlrghpsehinhhfrhgruggvrggu
    rdhorhhg
X-ME-Proxy: <xmx:MLP3Z588WIt1trNXStRldSHp7GGw67WcEJeidMURVp7sO9bDhwqc0Q>
    <xmx:MLP3Z9oVgKRh86jQsy2Z2YvyqQrLhGfsSpuomX5U0Ip0M10L_vEhqg>
    <xmx:MLP3ZyruZoteQa0f9aj6BpwIy6D1WAEC9Mg7V3M4simfzGzh1FZ-wA>
    <xmx:MLP3ZzTAa1BWV4e7XYPfF-qLN-dK0NxTmJItaIgjsgO8qeTPamDZjw>
    <xmx:MbP3Z_j0t2xgFRutTCp2TfvmslhP_6FnsCjYr9_pkLwdxVg5p1L3TQFr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B1352220073; Thu, 10 Apr 2025 08:01:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T2340d8c52bdbc82d
Date: Thu, 10 Apr 2025 14:01:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Daniel Golle" <daniel@makrotopia.org>,
 "Qingfang Deng" <dqfext@gmail.com>,
 "SkyLake Huang" <SkyLake.Huang@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Simon Horman" <horms@kernel.org>,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <0b5c6443-f50f-47a1-b5f5-900d70b69e06@app.fastmail.com>
In-Reply-To: <67f7a119.050a0220.b15d0.3df3@mx.google.com>
References: <20250410100410.348-1-ansuelsmth@gmail.com>
 <c108aee9-f668-4cd7-b276-d5e0a266eaa4@app.fastmail.com>
 <67f7a015.df0a0220.287b40.53b2@mx.google.com>
 <67f7a119.050a0220.b15d0.3df3@mx.google.com>
Subject: Re: [net-next PATCH v2 1/2] net: phy: mediatek: permit to compile test GE SOC
 PHY driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_050155_585983_03651F2D 
X-CRM114-Status: UNSURE (   8.34  )
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

On Thu, Apr 10, 2025, at 12:44, Christian Marangi wrote:
> On Thu, Apr 10, 2025 at 12:40:15PM +0200, Christian Marangi wrote:
>
> Also 99% I could be wrong but from what I can see in NVMEM kconfig,
> NVMEM is not tristate but only bool? So NVMEM=m is not a thing?

Ah, I missed that. In this case your patches are both fine.

Acked-by: Arnd Bergmann <arnd@arndb.de>

