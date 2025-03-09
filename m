Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2016C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD/hVb2SemsVg0IwRyhTyxsbti4JCV6rs55j397BRYc=; b=XUyLs8juRs9IoEoiXhSx0oCU6C
	FdTPB0WfEDCnYAZ471wWSKIer+GsIjZlgzYYFVW8wVvt+W4j8jMQnYlYBerzrpkhCXZIRQo60fthi
	i2Zbeih59QIJi6goYJFfPBGqf4bOL4tU78EWt3OrQ8RV0tFPf2wolLlPKcAGUNiTzWA79rVI3DvrQ
	1QpZymwQY+g/DfZhRpjzstmajZVrXzpBYOdzhfUkTZrdwcnQlXHIs7yZmeyhZyVWfgo8kMBDsJk23
	bjtPiX7IHZbTFV+EFUs4m/alHTF9uKc5kWDLjIB6qK9EOSsNCUxzX0lfLhe18zQEgt49avRkR/i7G
	Tv2dixQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMce-000000015OF-3ySF;
	Sun, 09 Mar 2025 19:47:40 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trMb1-000000015Gd-3TxC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 19:46:01 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 31D8613809A6;
	Sun,  9 Mar 2025 15:45:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 09 Mar 2025 15:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1741549558; x=1741635958; bh=BD/hVb2SemsVg0IwRyhTyxsbti4JCV6r
	s55j397BRYc=; b=R8fx0EhxTGtmyhm6cWzfF1GspBdj1wxiSW5GdBGmdrCiZnu+
	w4CW+FHGoRzITUUyHGSAnJyouxsD/NOVR0jUStoJinj5CchjlrsvJMimVto8gdV2
	ONTYV2xpqNis6tLgWwghCUXeSvx85uw9jYq+qY8Qmw5fCYTsdK2dkex2Dfj71pQI
	KMb5Vv/HV0xPHmOMU6xgCQlheUlwjRV6/l9sUcFq8JwiI4UeEvNg7niGRtGhmnRx
	47iNBGNxB47H0M5hbZq25MWDktkn835uaYqyqny44B43i7oCHITJwi6oP4Pab4bz
	tr5HkbtL9xWf/TkbXKAXUsH7js0v1N4TQmU7Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741549558; x=
	1741635958; bh=BD/hVb2SemsVg0IwRyhTyxsbti4JCV6rs55j397BRYc=; b=r
	ieZVbq5WLZ3V83sy3ehz/nNCYdmEdvEkpaLLgPTLNaTyK8vXJAdG6GsshAEajYwn
	s9Go8Rcuz4bCh+7sSIfIShcT4m/hYLVxQfxj+PFJNHgOP4681eB5xFIyKJ76feIr
	2KFLIt/mKqxVg37sh1FbW2f47rBlXhFLLKAoVIWU6RUx9Ml4JOO1MqcvXFpcW4TQ
	OEcgjHe3/cybSILNx9R+7b3h1ycNOW0RtR6o9x43zluu/Llkhy3sdU8TpJaiAvLg
	d7Dwij0wqvyOY4wK5rE9Hs8D5oA0zShzquEGIl3Lk80AWSD6ZHqY5MlScrngJVe7
	SsimBU3TMiJamlnI5fNbA==
X-ME-Sender: <xms:9e_NZxaqqzP0H4OAYQW8s1JVgkBo3gK882ts2NE8tKKIBoGrt-Y-Tg>
    <xme:9e_NZ4ZLJWP1Nd68TroZZVHxYp8C14YU88KJsGvPvYFP97xgU3jntL2w-cwXPuRCL
    YoEzwh4kgETcolSKpo>
X-ME-Received: <xmr:9e_NZz_ko4M7nnuugkVqtZAitqC6nD_o2FcT-KVQ6KUrjCsb6zqNvHlTL7Skg7B29mEMPAw8qYr6BKXEooJugb88O4XFxfDtsxutTRAxiUDWJtBnU09hiCG4oFPG30Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudejfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleetudehlefgteduffeijeehfeduudekhffg
    fedvueekvedvveeuhefgieetgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehsvhgvnhesshhvvg
    hnphgvthgvrhdruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlh
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrlhihshhsrges
    rhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:9e_NZ_o00JzXlX8jUt6GhiNnwqNLUxb0Q7K1iAEw0L_nBYs7hCHXEg>
    <xmx:9e_NZ8ru-rLdq4ln2RGvsFsheUqmOkp6FaXy_rine-H4Ttb3lvcEMQ>
    <xmx:9e_NZ1TEf3anjlevF0X-vhDQ6v8XhC1VG0IYylf9uDLpo-rjm2-S4g>
    <xmx:9e_NZ0qh14YLQk9TF4oJfbHxhy8aHHzhuRVVNBbK7gP9rkdVm1wdWg>
    <xmx:9u_NZ0LDMOJkdXaXtsV8PqUtxDkcQLcO0_dAQ5NdONbutNGu9OiKm4lX>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Mar 2025 15:45:55 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: asahi@lists.linux.dev,
	Neal Gompa <neal@gompa.dev>
Cc: Sven Peter <sven@svenpeter.dev>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] MAINTAINERS: Add myself (Neal Gompa) as a reviewer for ARM Apple support
Date: Sun,  9 Mar 2025 20:45:47 +0100
Message-Id: <174154951957.51578.1010090388720574063.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250303154012.1417088-1-neal@gompa.dev>
References: <20250303154012.1417088-1-neal@gompa.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_124600_225869_ED630C1D 
X-CRM114-Status: UNSURE (   9.84  )
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

On Mon, 03 Mar 2025 10:40:10 -0500, Neal Gompa wrote:
> As a member of the Asahi Linux project, I (Neal) have been involved in
> reviewing the patches downstream as part of enabling the Fedora Asahi Remix
> distribution for years and have recently been reviewing patches for upstream
> submission as well.
> 
> This formalizes my role as a reviewer for ARM Apple system support patches.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/maintainers), thanks!

[1/1] MAINTAINERS: Add myself (Neal Gompa) as a reviewer for ARM Apple support
      https://github.com/AsahiLinux/linux/commit/3a0d2facfa64

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>


