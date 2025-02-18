Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F359C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omBAmhhC137AZmIbep4GVQID5KGL5caL+CaVGpd9kgI=; b=TUXjV7vvV2EDn8aQD+/yjSbG/3
	vC0bEABA/Pbwxmp5beXVwQWqun9Dt2XHhOmzT4ZbygPzTmEbQpR+6DcUf1CGTvP7TJJGiz+uT/3jj
	FXonaGO7+IYhmiTreDZYDMhSqBzRmLKp4B+fZKemr/zJM+YfUAOy22Rra42YIYfWKE3gVgMRht5zh
	HMeCalajPUIV17n62EOnmyqSh/rGX1Xy0A0/drO8tWisuy0K+7VGlgqN8plFktqRf5apS2ggfZ8xy
	F67bZZDhTlrJg1dqJCb9edzwWnnZ75YCINEshImEqR9U5dO/j+Nc2N/tIiO7ABQZZFP+VKSv/N5rZ
	UB+yDGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQQr-00000008xfK-2Ey0;
	Tue, 18 Feb 2025 16:26:49 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQMK-00000008wU8-1nb4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:22:09 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.stl.internal (Postfix) with ESMTP id D3DD7114017D;
	Tue, 18 Feb 2025 11:22:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Tue, 18 Feb 2025 11:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739895726; x=1739982126; bh=omBAmhhC137AZmIbep4GVQID5KGL5caL
	+CaVGpd9kgI=; b=FUVqeMJB8ChlxsR+VUv9GAmH6Q/cL3bz3g0BU6L7uMYtZO9s
	ok/goazpzqbGhrvekllmd2iqOjzYve3O7zyHb6//j1anQ1Zp+/37q8aPHhhFnqBn
	1wOkN6lenbziWm2Z6A9PvR9JZvy3j7K2sJ0QnY9dsI3WE5AO8zhd4br6qsmlYqXO
	M8HKP92iDbpNpt7hirt/MxclF2qTRevBiXgY3Pj4wsgqtOpOj7KWjdwtCSNRpcsx
	T1M6MuIxIwCK7MgAWWpEbItIUZa2Ku7oZr+vBKVDn5QTpSiGVvphCqilhSP8IdBy
	1T7NeBCJViPzmp7cIena1tj519wv/tCsmdFITA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739895726; x=
	1739982126; bh=omBAmhhC137AZmIbep4GVQID5KGL5caL+CaVGpd9kgI=; b=t
	vubKYaCZvno9YYA7RZg/eW6r9GDBKJAc0dPYQqIEcgTvMkGT/XaWhwDYE5KzRc5Z
	eoMS4Fk0crFD4RXvokGxSlfq/e1QrCpijbEkDEeWV5Y8UMDbjc/6JPyMPWW9LNY8
	R0bP91c01yXaJ2Buml0GjPT8UY+tznvu5OEFAg6PA73lpNCmgN8+atKm7m3Yp62s
	WA1+OAnU5MjK95CU9DPTMa6X5lxsF803rVqccax5lZXLwyC3EKVGuy+3Jibl29iQ
	AjvQU/2XGEAujjXQoopVtrEblKrhXxcUNGjwsBwD6riom9CtwWrLerCbjSLjt7iy
	6TfZ4ilxU/taVHaqCOfeQ==
X-ME-Sender: <xms:rrO0Z0uj6d7YquOQbnm2CtIKuZSPy2j8kHVq0anzX0kAx71R4r8YMQ>
    <xme:rrO0ZxcFSq0Boj1GpMVnF5kTbqBbJvDyhERtyBmVBcOBoIe-nhH7weSuCUtDUPdj0
    4hvKxnC5gAkz7b2Kj4>
X-ME-Received: <xmr:rrO0Z_wsq-MjfWdsQe8PpJkr7jkcJanLoNvwGTmxNFGWaEyn3YBnqGlmIXNJOjBgM3jLq4qxK7gfIhLPeU_XjfxMUwN20_ivBHGZLDJM8MXoMcxHjQYQwoq-vDY5HzU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlhihsshgrsehroh
    hsvghniiifvghighdrihhopdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdgu
    vghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnrgesrghsrghhihhlihhnrgdrnhgvth
X-ME-Proxy: <xmx:rrO0Z3P7f_9ftdfTbDKZ07pUJhU2BRRsyEvywxiR-UlOefDZjdzOjw>
    <xmx:rrO0Z08mr4m-n2fXt7xKGj_Q-x3ye6x9u61waJ0p7Ff8UtOPf06jjw>
    <xmx:rrO0Z_XluE_J3LhlePFn3hpX0DslxVD87qOP1pa0sNUwXXIDkbvGuQ>
    <xmx:rrO0Z9eYzfYKuIqaGXhlldOyXwKc1E9Xw2apNneoqfKtiCI4LeRQQQ>
    <xmx:rrO0Z0xxAjaL_sI9A8NG5J3J3LMxKNzzHQxd0xqfwCdFydFGmWTWyA-b>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 11:22:04 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH] soc: apple: rtkit: Check & log more failures
Date: Tue, 18 Feb 2025 17:21:55 +0100
Message-Id: <173989559064.48099.256452329848917938.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250211-rtkit-more-logging-v1-1-93334e9c1c77@rosenzweig.io>
References: <20250211-rtkit-more-logging-v1-1-93334e9c1c77@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_082208_538168_44FAD8A6 
X-CRM114-Status: UNSURE (   6.06  )
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


On Tue, 11 Feb 2025 12:59:44 -0500, Alyssa Rosenzweig wrote:
> Check and log the following failures:
> 
> * regular messages
> * management messages
> * failed buffer requests
> 
> This helps debugging.
> 
> [...]

Applied, thanks!

[1/1] soc: apple: rtkit: Check & log more failures
      commit: ca0272d8638a4c50ecc2c63719f81e022d3450f1

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

