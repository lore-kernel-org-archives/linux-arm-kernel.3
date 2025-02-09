Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAED5C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN6BsUHEH5FXjdXnOtlQJLcbGf6yABUBwTpgya5QN0U=; b=xqKrrrDtyNv2kIAUfhyebUGCS8
	mpx9arO4EDpe5f4qIT7cXrWUqk6FvjDcsprX+PsfNGQ4+S6bx31GUMOs1mo2AbCGRu5DNlPO/b2h9
	Hhs6y7UFx+GAEuuP19ARwLA7b/LkES+vaDXff+KxXp3jrQ1fJq+K2PiQxkVJxlhwCK5eGGsCzDj3k
	1voS6BhEl2BFIGR9oo9sT0JNI8dJ9wADuEKcip48m6T126W3IgcwvK4FwHwPb/arrUOi5HW7yYDNq
	W4gPyg/3vaoHL/v6KOL/jK6NDMXwhNKihe9woURCmbi7Gfzk45zRM3vqVEZCOFbejRt/GMk4NtzX8
	ieoFcrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th68u-0000000EnuU-3Lvp;
	Sun, 09 Feb 2025 12:10:32 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th677-0000000EnKc-2Rrj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 12:08:43 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 3011E1380224;
	Sun,  9 Feb 2025 07:08:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 09 Feb 2025 07:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739102920; x=1739189320; bh=qN6BsUHEH5FXjdXnOtlQJLcbGf6yABUB
	wTpgya5QN0U=; b=X+y37JrO/KiFdedlXjjDPw1e2l6OVIOW/MFHXttS/7JEob1u
	Ms5WjkvZxNUA32Dz6uPKdrXW2X/NnnZPdSM1D4l8JLXbcefPG8v6dDNRj6MXyHVz
	1pSpSC/lnu+vwdKT2lkYC+J1f/c1CgSDBn6R3eFgo80E1kpGV+jYl5M+LLWu3/9k
	EuuuFyHI/t5XjCfOmUIFshADFikE3LDmXghGNP47vF2wLNRZpDFoeFRxjUund/EL
	/+DjIcbxlqN/lacmZG0s6+H7XhDXuBIRzOS2GBtwwDlNb5lnZELaZ1kLVK0J3kDE
	tQ7dGjeqg4NHyiv8I39z/YQWZQ6/piE+20sgUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739102920; x=
	1739189320; bh=qN6BsUHEH5FXjdXnOtlQJLcbGf6yABUBwTpgya5QN0U=; b=z
	PCreYWsddEqgj9/oUMakQn2Bet86Qa3onvqihysaGQ7gVVU3p3cA1WhuMZzC0Egi
	Jsb7b2lxiGDfI3U6LvlvTJndzowicfbjENzjG8rrmPsFe+pRI/cglyU3QDKtb+bk
	YbL4eYaIesbkf8ceLexeiTxRewkOELMnbxUZnTJWcOfWdaKu0S8/5AXhqBsIj0Rm
	WiuWO0S1RVV+TZkuMHBr+vg6GxZb6NlmhfjOBzRSNjjt/8+o6qSaKFzXCVdMGlU7
	yknIk6v9e7ns3uTk0s2IgkoZ0meqjPaAon+dCbki+JLpR0oU0+RUYvQPXt4W/I3B
	VyrVhd7H/fElHpCSA9few==
X-ME-Sender: <xms:x5qoZ6aemBIE8AsURUf1TNBb4zDm1kU6kktCxNB3SMRjXnJo9fj0uQ>
    <xme:x5qoZ9bMgoZSdPRQnZ1NTmsmvqNK21hoClXPHNkMRoZXqgjw-E5GdzcDVoFA7YiQV
    rLCHYyqHkBtsiojKdQ>
X-ME-Received: <xmr:x5qoZ0_TYSr_In0WGmSP3cYWY3FHqBzGIFRL8AE8YAaaGkuSZ73Nfksd364CQOfYbKqm0QSWA6xEBpyfCoT8FtipkOpzGt3yqZ3apwQ8Jw1RUXfzdyc4n0pcH9laJv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrtggrnhesmh
    grrhgtrghnrdhsthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhi
    ohdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:x5qoZ8peN4MWOfpf4qdAll3NLeLiXG95AFuvEXlr669FtdE6lHHRag>
    <xmx:x5qoZ1qcOGjsmIW_xeeu__G44kzKlNDz6XG1kw0j_DxEOHsFByqg_Q>
    <xmx:x5qoZ6QKcuw0YzrLjFFgCSIeOLP41tXYzAyQ8u9o6-rp3iXk2JM__g>
    <xmx:x5qoZ1px65uIynOfZgWzxrYtGWFwiqNaJlXihd9ApAsBRG9dPLo6YQ>
    <xmx:yJqoZ2QO8H3QGCwH8MnwUVxZYA6q7cjjoFUUZQGgvcGvjiX6hBBq-oe4>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 07:08:38 -0500 (EST)
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
Cc: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 RESEND] arm64: dts: apple: Split s8000/s8003 SoC DTS files
Date: Sun,  9 Feb 2025 13:08:23 +0100
Message-Id: <173910236336.99422.11777393599765500005.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250203113949.14760-1-towinchenmi@gmail.com>
References: <20250203113949.14760-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_040842_130146_1F5717B5 
X-CRM114-Status: UNSURE (   7.64  )
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


On Mon, 03 Feb 2025 19:38:31 +0800, Nick Chan wrote:
> Despite what the code comments said, the DTS files were not split properly.
> Since these two SoCs are now known to have minor differences like in
> latencies for cpufreq state transistions, split the DTS files now.
> 
> 

Applied, thanks!

[1/1] arm64: dts: apple: Split s8000/s8003 SoC DTS files
      commit: ef7980d4b2745031318bec172814e2c6260a4288

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

