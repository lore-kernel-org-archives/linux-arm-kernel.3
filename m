Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37050C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/ZPl8hYKvlE0zF25CCtGHgMXwe0pyCBpsgPmfYBVQA=; b=ERCePLXerJ1LQurCIYtOgIEKsM
	FXq6lL+lOS+/XlSkbUCDzNTCQk0VqGuopddb8nQ/nmNAOfmbN/PzHeBPyn+qC1xlQpxVZ4zMEoATx
	S7LIKXRhnqUmsZkTr6giBBI2Wzg8HjSqGD5lgJGKdct3ONZ7U34fcOdgTPVfCMDs5DoQebWXyWkMx
	fYskUouUNnizCVEi1qtkABn+jyec0ToR1R+u55bz3cYcDp2BJbCdvbuUUkRf07lopvqrzmUJAueTi
	B66RDowNkFOrv+8K99V663dLxCXfUW8QvKhTOjX3sbp+U6fHbYZqGrBKD/cqxIiNJnxVpvVWq0EKM
	f2k1jePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Gk-0000000CmN2-3MXc;
	Fri, 28 Feb 2025 21:51:42 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8CK-0000000ClTm-1Ciu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:47:10 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A37AE254019E;
	Fri, 28 Feb 2025 16:47:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 28 Feb 2025 16:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740779224; x=1740865624; bh=Q/ZPl8hYKvlE0zF25CCtGHgMXwe0pyCB
	psgPmfYBVQA=; b=fqHhm1xHlzVhtY1Vbjgrfp2EP02LKkoOdekFrEgRsc1zcJOI
	ggpmUPg2e0cFXJvDa/6Rs5DTKQkY+2hgJdkA6uABqoGSMRYqEAE+vxy6lupNed3u
	y6G/FUTGiPqvflCgCfmaBFuRamUApOgbS+zvcLFEcQMzOAEr1PR4r3YgrA7FMMG3
	fZCFwB/HUiADX7F+/XI52hbduoIqa7qQoo/e3o+GfKTWEcG8R5NyKG2riSoTzQCt
	WpF44mw6Ycox9TWkKrnb7ubBcdt/NzMVebFLvYYSaej5SbN7Rn5/UGXWFQCkHYk3
	XNm8YlW/lkA4BRCQz5m/5/3YMT7PrUweIwM+6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740779224; x=
	1740865624; bh=Q/ZPl8hYKvlE0zF25CCtGHgMXwe0pyCBpsgPmfYBVQA=; b=6
	dIRyO1F5mskS2lXBjigz+hlCayNNzWv2fT7XZ0aIEKUSn1OyyO3m+mwbOOyc1xiq
	0ZsjkT+/2xBfatlqwU+SpIY8jx/iRRyyVIM5h+CXERFAT2Rn2hloCC6QMzJwou8r
	xyHo7xIEoDkC79P6bM4TjwPjcC0BmxfO+nUWprFh11rm73e89Pfx0AsyQm7V/iQf
	ifwPnR0wYDK5W28NKDQw7w2hFjITegKajjdCQDLcWVQ/TQDqemCRE6I6c/e4r94p
	EeiM8TP3f/eriEWUxVBtf5LpXQiOc2gY7R5z+X2wtc0NVQj9eBH//Ub4hfzKoEOA
	ZqtVJLZYvlSstX0Mym0zw==
X-ME-Sender: <xms:1y7CZxzwH1xcG2lY9vzHi4MO9a40xkGqexINzLx0shCpFCR_m8UQFQ>
    <xme:1y7CZxSAGNXpe1_J_cvAtnJtxuM0p9nkXRc3TuhZfm9EbLzhtjojn7bGoGf_Fm8-v
    rMJwcE2OnKoCN5krz8>
X-ME-Received: <xmr:1y7CZ7XYUCCD5rckJPHggXhS9AirCe8BUD0pnY7a60o8XjVjnlRXkrpAUzbXBLQakB-0sgOPjP22waCqCgt0XGHLBKwsJqmB2RCXUOOlKTsNvlxYRxQ9diUfRebMLP0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeludehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlhihsshgrsehroh
    hsvghniiifvghighdrihhopdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghp
    thhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhrtghpthhtoheprghsrghhih
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
    rghrtggrnhesmhgrrhgtrghnrdhsth
X-ME-Proxy: <xmx:1y7CZzhP3mZqGz0OHbVAImhh7nOqvpFlqOruUCgc7aifa5n4uu4uFA>
    <xmx:1y7CZzDPt1sGvfxvfRaAPBa5o8d_RiHbc8h1kq4O784g7FD3jrXtPA>
    <xmx:1y7CZ8LzjlLvnxkKfNkICzEK4aBPR0rgnUF9zPXQBeEYz4Np5eEzfQ>
    <xmx:1y7CZyCnU_trvwblRfUCngMfye8Sh2AlTPisWOPS5iaDrcDWVKKTIA>
    <xmx:2C7CZ1A3ssd-04Quimn1bou4rMPlwsgE_0n6A-ZXqeQSUCDF_Waoc6WN>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Feb 2025 16:47:01 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 0/4] Miscellaneous Apple RTKit fixes
Date: Fri, 28 Feb 2025 22:46:51 +0100
Message-Id: <174077915358.356311.14232401754625389723.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
References: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134708_755496_FD3499EC 
X-CRM114-Status: UNSURE (   8.43  )
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


On Wed, 26 Feb 2025 19:00:02 +0000, Sven Peter wrote:
> This series contains four unrelated minor fixes to our RTKit driver.
> These are mainly required for drivers which aren't upstream yet but
> have been part of our downstream tree for quite a while now.
> 
> Best,
> 
> Sven
> 
> [...]

Applied, thanks!

[1/4] soc: apple: rtkit: Add and use PWR_STATE_INIT instead of _ON
      commit: 3e46b6df8465e7a1c0d8e87a0966ecfb753ae84b
[2/4] soc: apple: rtkit: Implement OSLog buffers properly
      commit: a06398687065e0c334dc5fc4d2778b5b87292e43
[3/4] soc: apple: rtkit: Use high prio work queue
      commit: 22af2fac88fa5dbc310bfe7d0b66d4de3ac47305
[4/4] soc: apple: rtkit: Cut syslog messages after the first '\0'
      commit: e210227f0259d2666cc41b28ed1b7b0b0a99ed4d

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

