Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C721C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R1AryTPhNH6vqIqKW5/6ef09cTbxqCZtxeiuNj7wb0=; b=39B6NHQg1uFjyfSaYwIE07RDuJ
	M0J3VUBjtu28tQez6+gCUdrRJEaEmDu1WZOI7WQ7uIL97SASyUScMlZwoNcBzJeL7FDYjrH9xko0N
	FJsAOryW0sBAPhTVOhiLtoYS+MhA7hWRCooo57d6NKWjEL5kKgQB1CrSDe7LoWW+fCTuHw3gC++AF
	kDgvxWRNHnZnYs+3OscsGf02ljZ+eynaBrxuExqbaF5ljoiNQKXTL5xvMxgQj4utkrHfpUsA1DHTl
	At7ITt9C8ta9acCkNU0ktxNpza9vi556Ed+rurm7rhZJzJ+TsJH7WNvl1nuKPyXoXhY47XjzTpkBc
	JjdA0rdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERRe-00000009GQ8-0S2z;
	Mon, 12 May 2025 11:35:42 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uERBP-00000009EY5-1ldE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 11:18:57 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EE918114012E;
	Mon, 12 May 2025 07:18:51 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Mon, 12 May 2025 07:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1747048731; x=1747135131; bh=8R1AryTPhNH6vqIqKW5/6ef09cTbxqCZ
	txeiuNj7wb0=; b=ZEZoO2tCNmwSdnwnJxE/d1l9NlLFeCFYdL0qlb6qL6xIlCPf
	hF2iarJizQyLFm8x2KzLfRavW+65RwLZHkD2macXXgtP6ZkCR07kM0AsMWAp4mP5
	b1eHvSoBA+6Y1KRtwiiXn1clD7x2diHeX+E3o0yc5ySfTSSL5vLIoE/gmVtSk1ja
	O+2RKLohnsiXP8AftrNWX5Df2sNZ78C9D8Mx8vx1N27ZNQ9mclwYCS5j1KNa5y0C
	WqCsmTLdTq/BdKv00MQha/vAZFHY62liGcGHS4aPPjj7oKo0bApwiTeKYHgDElX/
	PKUzBACRUNmz8yku5JBHwNrVOlPEndAcwsBcZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747048731; x=
	1747135131; bh=8R1AryTPhNH6vqIqKW5/6ef09cTbxqCZtxeiuNj7wb0=; b=o
	71VIvkbuLT3kGsowGOJJcwdT42sXnEfrYjJ481iyRenFZs/DjdVBy1erScpkFt89
	V1mJO2Qawd1M/+e5lOfWEMYqfjig2Ouw6Wa8HDebNGC43Bgrq3nNLDGrY6DZMCaB
	MgbEcqwwLuVMnKkI6hmhYUxjAhvJeAQbxxwe4tYjfYYVEl4m4aqY7SOzrEmiqcJA
	YCG99UzfVsP3WUWe3s4550bBnG3SRs23K1+XUeFuSDlm7UZvXsuPVvfCLfispM03
	QbC+S0LuaBVPM+MmzRmbSHUseByDwzim/FBz3QN6b93bmoLvzY/SEZzShopzdecr
	TSXuPMMCQI3EZ8C36Grbw==
X-ME-Sender: <xms:GtkhaMuxhIixs7p21gBf1a0Z3lGaLN01jbE7aoEXMUjV0ATKxr3m1g>
    <xme:GtkhaJcxVpGSL22cNbzohzJd4xiwMe3KVqA6nHUL9mZ1CDii7lQHmbNRdtxEZHq54
    BeKmKBo9M8LPqBzbKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhmkhdokh
    gvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepsghrghhlsegs
    ghguvghvrdhplhdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtth
    hopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:GtkhaHwf1fLs4ujDzYRV9p3oA3Lt4JG2bsbNc20DSXmw_eocXzmFsg>
    <xmx:GtkhaPM7O7JUWdN5Wd4NEAF-FcE-62VNd7UGjUafuz50M1xr5tBgQg>
    <xmx:GtkhaM-cXFV8dPcEYGmRkbX2dgNTmYprkObOHjphG973E1qh_XFlPA>
    <xmx:GtkhaHVaCx-SAYUC_qxcEr6LGzVJp6dM-85d--eaFsj7mQ3c6yV6JQ>
    <xmx:G9khaM_l9MfNgcxlpMCOrs9zCtzwYcG-SDIeitwMfLz4Wlb9mB0NWHtw>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0A6521C20067; Mon, 12 May 2025 07:18:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T54af4484963dacde
Date: Mon, 12 May 2025 13:18:29 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>,
 "Hector Martin" <marcan@marcan.st>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Lee Jones" <lee@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 "Russell King" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Message-Id: <50f35475-958e-481a-83f8-f19fc2259191@app.fastmail.com>
In-Reply-To: <aCDVgI4_LtE6OfO-@blossom>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-5-f5980bdb18bd@svenpeter.dev>
 <aCDVgI4_LtE6OfO-@blossom>
Subject: Re: [PATCH v5 05/10] mfd: Add Apple Silicon System Management Controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_041856_153706_35D793C7 
X-CRM114-Status: UNSURE (   8.01  )
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

Hi,


On Sun, May 11, 2025, at 18:51, Alyssa Rosenzweig wrote:
>> +struct apple_smc_key_info {
>> +	u8 size;
>> +	u32 type_code;
>> +	u8 flags;
>> +};
>
> This still has the padding problem from v4. With that fixed,

I somehow managed to drop two !fixup commits before sending this out :-(
One of them was moving type_code to the beginning and the other some cosmetic
changes (mainly starting descriptions with uppercase letters) to macsmc.h.
Will be fixed for the next version for real this time.


>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Thanks,


Sven

