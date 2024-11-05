Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8D8D12662
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBA7bLE2mHqRkfZsK3UY/Q+ay2kNLXGkfRxWpEsue8U=; b=vT0nUC01U4CnVrdToqZy4gj7wu
	vmywS5HaqfP4BV7iXgVnJGFtfJ7g93O5Teaq4QSlj1z/gEiF+/gIwlIQwksmVR7SN4ffLgVAWRJ0f
	X+0G77L0t/4JOOj5TXF47s25QsnJrx5sHRRmVzu8sDRMhM+5d/AF90+/TJL+VoS31XfDm2jo7yr2u
	HGUeiGY5UTmev20ctr6XuxvzPEYIwL6L8O9ctFnExMRQxSKlYkkH4WPc6cJ/FGMp1V2/JMsKJ3Fwp
	Mpyu7zTc2wcnMHQ+ApusbbYQk1N67tY+hKZ7Qi1ubLQ+Sm5FnozaWHGh1tHdbYDL7tfzi8W91Og2X
	pdOhZDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ELt-0000000GEg1-2KdM;
	Tue, 05 Nov 2024 07:51:49 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EGO-0000000GDuO-2WvX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 07:46:10 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 387761140202;
	Tue,  5 Nov 2024 02:46:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 05 Nov 2024 02:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730792767; x=1730879167; bh=zBA7bLE2mH
	qRkfZsK3UY/Q+ay2kNLXGkfRxWpEsue8U=; b=i+Uy1IPw+rQa2KHZvHvCCRN+po
	OSdEALT2ieuvZ0nyuDlrZdTxkf2Kd4bx/OiRlcV3c6eN5YZFK25ALK2mrg4mf+gQ
	/UhbqXvKVP8DjhuKWzPq9CugJ5qD645f4NcT02OB2KROQKah1i89fl51YxmVzFmP
	FWexC/2Q4cPi1Oujc8VDGeC8j2aNjVAbgQU96dYllErWLzDY2Y7WvtOKjMwwLnBn
	UvUZURq9Anmqh2SONMpFVtAbfSV7FnKAAW33p24e2up8coNnRF2g9BxLZgVWsyPC
	I13Wgujozbf5DQJQYyZILA6jQ4Sq4oPFh//xtI0EfYIRlwxxDSYrYSiP/A8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730792767; x=1730879167; bh=zBA7bLE2mHqRkfZsK3UY/Q+ay2kNLXGkfRx
	WpEsue8U=; b=ZefMKQrXFc5eXO0xpC8u0IR/tkQcs3lh7r8al+MW6vPy3aeayet
	7hD6Y+OAOOWttXSAIA/TjNXhJm5S54ea8icNIEZpG0RT1lDioej2mBoQ524PP0qI
	73RaszP0DReS6Xd3focsHE3a+0MsFBdLJy6s6OWAl3uirhyQlX8nsKAAwpEABwNC
	4s0QUZ9aI8s94Jv+Y1eH9G2bTuNh9hqT4dSjRPNf1NQizBN1JWPj7q1km6Qg0JfP
	yHrTz5UIBHPW5ZgGTFWYcZbqQX4UVBoLhdjcLGoMaH0AXBkoqAYarV3D4ZEnoQea
	DTxYiRjLOHyNLIftUX9ggmEnu0KeWeW44MA==
X-ME-Sender: <xms:Ps0pZ5YttRNoH-iZitAsODK8Ed47ShS1B-14pDxzqAV2cPbx9IvQNw>
    <xme:Ps0pZwZJV40ZXhMQbcn0QjX-7ZCcnshqTBR1uXtSg1wlD0wivlwbMtlkN1snky9Sg
    MYAk0dVgqIBu5dQtZQ>
X-ME-Received: <xmr:Ps0pZ7_TrRat-rMTcXXRoU2luraaF5BzmVKXt0fUt0RXbuXGEMbgRK3IqFcqeTdNDib1ffwFbNSrIebaeLDzptA1wzJIngAg-Dc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeljedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtohepshhvvghnsehs
    vhgvnhhpvghtvghrrdguvghvpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvg
    highdrihhopdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:Ps0pZ3ouOO9r2fHILp75GBvr27RNiBKWDC6cqH73XVz5Y3mnCnbRSw>
    <xmx:Ps0pZ0oqaTVWRqBWF1wRLomqDTxlVJEZ_agc6C3K5on0CVvPJVRJGQ>
    <xmx:Ps0pZ9QZ5OKB6dhDwkP2eMt84DQPccruOmWX_WBS2xTeMFHCcwT4Fg>
    <xmx:Ps0pZ8oIYaRlI12mn8pzBO-ckFsbVZEuLOVK0NjhUMyTlnLFO2kgQA>
    <xmx:P80pZx7W8nbujgAr3hEXhDKtDiUxyJ8001pmZ61njQ9KvQK5R5tZCQmN>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 02:46:06 -0500 (EST)
Date: Tue, 5 Nov 2024 08:46:05 +0100
From: Janne Grunau <j@jannau.net>
To: Conor Dooley <conor@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for
 Apple SPI controllers
Message-ID: <20241105074605.GB923511@robin.jannau.net>
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
 <20241104-retract-wife-e1abe7425cc8@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241104-retract-wife-e1abe7425cc8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_234608_729405_93A139B7 
X-CRM114-Status: UNSURE (   8.72  )
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

On Mon, Nov 04, 2024 at 06:56:59PM +0000, Conor Dooley wrote:
> On Fri, Nov 01, 2024 at 08:26:12PM +0100, Janne Grunau via B4 Relay wrote:
> > +      spi: spi@39b104000 {
> 
> nit: the label here serves no purpose, and could be dropped. No need to
> respin for that obviously.

removed since there will be a respin for minor driver changes

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

thanks
Janne

