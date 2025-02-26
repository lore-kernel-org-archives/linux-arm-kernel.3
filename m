Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C00C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BRNNMSZ1nsDm78pbs23hdXvMS5Y1hQRDJsmGna8aKU=; b=lzjA3AsjXm/c3IxvzTyOw7KhfK
	YEzc6lFaHOo1FvfcIw8eHSXt24gzFhaFBLB12tmRIY0PSn9aKXzXgS5x6TBMYNWh4LkMntoG6YBc3
	WYnL2u30y/76rnbX6buNX8r2+rSfQiHHqxoQuXrg7Yjo8DkGdwLXCqLMipusrctCybPaToaIr9qw2
	uegTyILXmmMQnDdDHznLYCUtYST6Ofesm27CqgH0NO/xF94qJoHF+KPe9WYzKG36ghBuSmS/91Sg1
	szUDZKxaAChyPu7BkWdPCrzL60KQtvML4tHPn+ZjrrrroNtR3IaBz0HUmQJ3WpM3/g54XvanzDz8x
	elnhKyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJWG-00000004MJZ-1dWK;
	Wed, 26 Feb 2025 15:40:20 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJUA-00000004LRk-3Sco
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:38:12 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 2BC1013800D4;
	Wed, 26 Feb 2025 10:38:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 26 Feb 2025 10:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740584289; x=1740670689; bh=7BRNNMSZ1nsDm78pbs23hdXvMS5Y1hQR
	DJsmGna8aKU=; b=hqQmJw3B6O87WgF9RFzJZuo2e90Jnbe65wb2PG/LOQpLYqpe
	sWyEpfnpa6ifghRlejdo51/t/YAyE8cEIW9CMwVrnnUvhzaFt3HFjluLR70+Y7yG
	LXn+TtcSIn+6irAmf29HOJOymWHNj3LZOxcpKw9U+GSSqEv09a8PNvR/h115ZGJT
	wcZjheM94RjwwOMgkeavH9gjv5pYwbbVCnP4UMPt32DG6OonHkjbn1AzCO1PycHd
	WbI8xu5jv+LkGTCdxFRLy4YeGObv5q2O57xEyc99Tggz7/6mfnpekcYQ4gPrIy9D
	OgTuKRQw2AyhFxe3Gm2chkAis1iNSWxCCH9OAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740584289; x=
	1740670689; bh=7BRNNMSZ1nsDm78pbs23hdXvMS5Y1hQRDJsmGna8aKU=; b=z
	FZVtVeRtpptHolXr5+BA3DBIHFIM9vZlizPH9VUwBkoxbNltxh9bJAHaR7QtMgds
	qf+6sjvYmJlNRlmeuuYLnhf7IOMZRXJDtlJWEVs1bWNTjGzwIjtYqlFvnieANcWR
	efl4Js9qYZPi52tLRugu+ZNEHdZQYRfhmOr7Qyk7WqPZDiXBZPTebHBumhc8mKZH
	2ss/5ac1fDcCvQZAV+b7kvskaJl/I5S012PnLQHCsZj7yHP7JI6hB21du+mHZT59
	IVpWuYTkuqiJvfJURr2qhssKgCZT8Qlipn51SR6rbzMcy5sy9qYdzScPJrdgm8Zt
	+plmOpjP5WbrZTwIWiyjw==
X-ME-Sender: <xms:YDW_Z3N_Xze10n7C5Jk1t24xEpByoRSCfc7H6tA3BL-LobH3rtXpUA>
    <xme:YDW_Zx-yJOCDw9VGxDLqFu6YHFJRW5YBjC9R48hG04ddBx87-HMuWB0MBaHreE_fG
    zcYwxTKLQXiyZhZvgw>
X-ME-Received: <xmr:YDW_Z2QJnHUMzk7K3XHy5rzUWuV9FbpZwTQuXcD0efBt-cM0M49joT2TYcvXekqh0IBvUltTUImYCTWAWbXKLYZ4-GLssxQOa_6LN_JfJdDjT-xlXdA0FcfUyWsXg5s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrtggrnhesmh
    grrhgtrghnrdhsthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhi
    ohdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhrtghpthhtohep
    rghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:YDW_Z7tD8-h1Frp9eX9qoXYhMUNxPad7YtzBFaFmedhJUiKFhSA6JQ>
    <xmx:YDW_Z_ecFZWnICHi0-UBLkkGmyrcjWb2WlHhNysX6GKZ0kTu6T9l9g>
    <xmx:YDW_Z31b1Eudz90MjAiWvuQpW42GY-srpSYlJceM_i0M8FgZeQ49bA>
    <xmx:YDW_Z7_TdkOtpbPGVPxKoIB6Zpe0H43gj912mzX_a09Ang4xRGRMjw>
    <xmx:YTW_Z68UFZIgjV22UGAs1wIof1oJzP1nWKiGY01lBcVP8lGpX_iI5LGC>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Feb 2025 10:38:06 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH] arm64: dts: apple: Add touchbar digitizer nodes
Date: Wed, 26 Feb 2025 16:37:53 +0100
Message-Id: <174058420088.275008.203693012021387035.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250225-z2-dts-v1-1-df101a7c17c8@gmail.com>
References: <20250225-z2-dts-v1-1-df101a7c17c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_073811_195381_F1451A07 
X-CRM114-Status: UNSURE (   6.58  )
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


On Tue, 25 Feb 2025 22:19:54 +0100, Sasha Finkelstein wrote:
> Adds device tree entries for the touchbar digitizer
> 
> 

Applied, thanks!

[1/1] arm64: dts: apple: Add touchbar digitizer nodes
      commit: 44db68dee1f77260d7037319e911e9883a6ffe0e

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

