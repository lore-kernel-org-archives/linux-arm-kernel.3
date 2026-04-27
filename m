Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D72CFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dJ5ddWA2Hk2Ekn5t9qHr4ZYbm1sDBGcyRCd9iQq3Do=; b=KPIw8QhaJh4UVEcNNzOr57u0oz
	xMdlU6Ftng7Mmoeohugsm7huuHqrJ/8tgjhkM03dbTD9Io14BO1OF6GXi+LidHAj/JPBPRKZPWHKb
	0OIVhQQZkwhiI4/9okR98Ft58m1WUH9uCMGtc9xueTQskyIgaScbmfHygQTRjkMQF5k7B7ruczjOe
	e1UymrTlGKCeyggrxdDwYiYZU1C3NWIgKLWpDtQLh2mVYMBp8SA/uuBcGsqY9es7Pv2b5pdHeGz4f
	x5X7HcDQqyk60mrqLGvIp31BMSxmfLJJ5fh26V9p7Gc7mJYXuPD/jhFS5bBGP0agcrml0kaVC82SJ
	c64oPMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHN7Z-0000000H7QY-10Qv;
	Mon, 27 Apr 2026 14:39:37 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHN7W-0000000H7QD-3Jcl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:39:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0BC2AEC0509;
	Mon, 27 Apr 2026 10:39:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 10:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777300773;
	 x=1777387173; bh=+dJ5ddWA2Hk2Ekn5t9qHr4ZYbm1sDBGcyRCd9iQq3Do=; b=
	xyUJI61otV5UMkHvraD2sJXyoI25W8uXq5H0DVZGrgseGXWeyNVF4LifZUnrptGW
	RSLsZO0Yl/+FNndVNOapHKBRHLxd5jc1WlMY3YZGvyoZXAkXs0HT3oEWExB+6BEE
	yqjhaor2zLJSeB0VyYb2qyKHjsvm/TTTVi63aiHOMcsltDxhIxP+Brr4fG2M+Zwx
	Fe1NSlNNBjijGbZ7BmkI70HfWzoDfBl7j/iaR0W81emKoqgUUn5XrAGRSkjVa9L+
	ufpzcPzUWHonZY9nZD5nQYu43fTL6OlRekPXU3Ac9wgD7gWqnVcjBvQK6Q2PnBor
	71XfUd7d5NVSgHTkvKGQqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777300773; x=
	1777387173; bh=+dJ5ddWA2Hk2Ekn5t9qHr4ZYbm1sDBGcyRCd9iQq3Do=; b=e
	y8oL7D1a1t53eit4GXvhsDy3TPt5MPi4B/lXDJXwPefN30f99Y+i2VcmLovilI4G
	/a8P/or5Rv27Rq9mZ2FYKRUD1D4IHAOX1L++vPi3SJPjG8R/2MYUimD5DDPhxKbs
	gmolHIhOCiBg2h89Ro4xB9jxXRD4qe6tMZXNhd22V96/dOh0mxnzxanvtTZXDeHv
	yfwqBA/VxgHicCtshP8dnEI1Bw/VhAf0b3stdilI3IbTmydx5IivQMIdXkRH3WhE
	HbBaQdzZ6xuUbAn5yELeHKaVJVhi5a3Z3iyVz5LFhL7tp5Epo6ERGmJSzHvom6HC
	n+vyEUMnH7WRx7gNrFRIA==
X-ME-Sender: <xms:JHXvaTJfali91FjGgiTlqV3MlpAalfmddC7lf-IOCjWlTqZbEZGy2w>
    <xme:JHXvaR9IeDB1EsxCKvgnPZAATjrcHwSZWrf2ZyAaHt9AbWGVg2Drn1iCE1CfFD6FB
    xfE-XCx_pYbAdbNaeaTW9I9238EPScKtn1rt0YvVUQVLf0AFcED1rVr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhglh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtoheptghkvggvphgrgiesohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomh
    dprhgtphhtthhopehprghttghhvghssehophgvnhhsohhurhgtvgdrtghirhhruhhsrdgt
    ohhmpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrhesshgrmhhsuhhnghdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JHXvaUvSe6A_Ax0B_UbU5WGZicEJ-6BDsJ5dToCOMNI_x5d612TJiA>
    <xmx:JHXvadW-sHFz6yxPuiPhXXuony25Wy_cABk8tqyjS2rsDCHXxKVjHA>
    <xmx:JHXvacy526Xdrdel3YxejNJR1b0wIbBPnOtbeq4dLEf_1lJ8dZBW-g>
    <xmx:JHXvacHOvPQPjaQ5JZHyW-cWG5JZjIn6giBCHRAlWlowsPtU5o73kQ>
    <xmx:JXXvaf2ZmdfpIKl3Zo7G4FirjuAxmKswKpDHzdYve6M44Vh1GryYpwsd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A3C5700065; Mon, 27 Apr 2026 10:39:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ajj86gnT9gH3
Date: Mon, 27 Apr 2026 16:38:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <1441dc76-764b-4490-8d7a-85dc3b01edac@app.fastmail.com>
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
References: <20260427143546.3098519-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_073935_160101_36F85AF7 
X-CRM114-Status: UNSURE (   7.46  )
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

On Mon, Apr 27, 2026, at 16:35, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Sorry, I accidentally sent this without a changelog text, this should
have contained

"The crag6410 board is one of the last users of the gpio-led driver
with plain gpio numbers. The driver has several ways to pass this
information without using gpio numbers, using a lookup table is
the easiest way."

      Arnd

