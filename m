Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D71EC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t66wtfl5BdVxlhDOQRkeh55EG+hhfZY+YFaDqLZ38qY=; b=Z1fQfAz44tf1QQIPHI/qIUO5Z4
	NXBtTWwIUsyqWP80FbMyBrl/j/kcN4gI6gPCuelzeitM4HKOlHbC2bL0b/fk9ujj/wkRbjdiYZpQ4
	+W+3UJiFw6U8CMsEioO7ws7NuXs4clKPKdgb8KcnnEH+BY86lfi+fdJ0+Bbzc1UF+M45QLx+B0Arp
	nhF/HTi6RIlnys9Chb8HbMXB7fAyIGbDpHkEA1sCa+BUt2WTaDqyzYCjd0TpUX1ZWlW3E73+n/pDP
	6HazWPX5zs+lp8zq8Qqvpac+/PyExPhR2WkXkK2/i+XFvQzNIoSveTaqpV0cst1SKJ53hC3ryntOM
	KMS0FBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6Bd-0000000Eoh9-0jnM;
	Sun, 09 Feb 2025 12:13:21 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th679-0000000EnLC-2C9U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 12:08:44 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DE88A1140173;
	Sun,  9 Feb 2025 07:08:42 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 09 Feb 2025 07:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739102922; x=1739189322; bh=t66wtfl5BdVxlhDOQRkeh55EG+hhfZY+
	YFaDqLZ38qY=; b=cKq0OklADd320mrGYbrvbgdIRJbZOCX1f+BJ/Pa7PtycBv5j
	U7A7QteIm7cu/DWHc0RltyP5Lt+hIVGp6G3kyaHCHDvL6vEgu7iG1jwc7TabEr57
	/howWmU1mFIY9oOwW7t0xrs76RPfo5NYEBzrUfXs99jIgxNsm3KSVVp1gtgSRzo5
	T/wp9/BjFjNom3hLyPM2sb2+6CuMxNFmJIIdvmJgIgBCEAR5wE1Hy02yffDFRgyA
	FrdjNNKB+M4lCL7fHrGM/1rxV1m5ShLN33frPiMkoOo+e6QgsMO8P8oUlw+4HJZc
	rRePB+VpExaKlsXSZ4wf7xkGLIOU2yRUVFfDzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739102922; x=
	1739189322; bh=t66wtfl5BdVxlhDOQRkeh55EG+hhfZY+YFaDqLZ38qY=; b=O
	DUNTx7l8X13IumI8lSdINOCPbem0joek59s4jGE6SjyEnVfwLsKWWdS3pjTipsaI
	AJ60oEykEVedDEa8VVW5dmKoeZdW3H/3VeDujVGKBVkdYCojh3PqaYUIg/xcz/XL
	rzfUghK41PFGnswUYUXMZFhCcmdugLAnYa7qvK6+p4Mc8MFtpEf2QTj0Amkj3kyO
	g7kw8xuA8HAmKtV7meQnomcrU7gQ7h4D23DrCkJUBcHaFuAkN+8JPftt0Hipn8rv
	VqExpxhv3s3nAyVNk/B02nuhgGi4s0j9FjT6EPN5/cI0ly5y8qdQwq7m1lyJQBOZ
	H29aMYi/P8EaPWSjBV1Og==
X-ME-Sender: <xms:ypqoZzWRbnk6-WhLu4YsXw0OudS4UW4JknQypZmuLEElPMlPkEDHug>
    <xme:ypqoZ7mNWyXlEn4boU_3qNB01LKann9aGR4TRz4FHSTa-rOV6DnFzj_mrgJeLtBWF
    XS4VbvFGi2llugDo5w>
X-ME-Received: <xmr:ypqoZ_blOzWYcr-nUBSm81kmL7mXj5hTbu1_Icj_mXTNhU8pVfIc8F2yTQkcf5HPFwudPCbCbHVxv6_qbG9OtiajyUX8r17Fk6Q7zaSPeoYwTkZhasyz-HOg3jrfG34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrtggrnhesmh
    grrhgtrghnrdhsthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhi
    ohdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ypqoZ-VZxxJCNMpSzEB3t1Zsif-WLxOyAlo7QQfytsNfZaGceujrBw>
    <xmx:ypqoZ9nIBMuzK5XIr4Xy9dQcgOATPqkxTm9vXMf28PBHr0atmXlh1A>
    <xmx:ypqoZ7cWb5TWFLNT6irWwDktU05eG-XggJs9S8E5MDOBtcUamD7PKg>
    <xmx:ypqoZ3GnBhe8qCgwhuPKgiRRkb8Ohp7IzlN3Hgv5OxdY94TBG8IyyA>
    <xmx:ypqoZw9m38tSndC9wJWCZhX_kCJNCgppOMu1ItNz_hNKWJps-eIHfTGb>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 07:08:40 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	Aun-Ali Zaidi <admin@kodeit.net>
Subject: Re: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
Date: Sun,  9 Feb 2025 13:08:24 +0100
Message-Id: <173910236336.99422.4456794656376955896.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
References: <20250203114417.16453-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_040843_640399_A54F6E3C 
X-CRM114-Status: UNSURE (   8.17  )
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


On Mon, 03 Feb 2025 19:42:51 +0800, Nick Chan wrote:
> This series adds device trees for the Apple T2 Security Chip found on
> some Intel Macs released after 2017. This SoC is based on Apple A10
> (T8010) SoC and, for many hardware blocks, can share the A10 compatibles.
> 
> Changes since v2:
> - Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: apple: Add T2 devices
      commit: 007c9b75f7e34d83d5a5230a0fb376730d9dce96
[2/2] arm64: dts: apple: Add T2 devices
      commit: 4efbcb623e9bc5c1430b3fbc3dfdd4fe0945c64e

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

