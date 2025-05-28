Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91856C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDMLe1OsHNvAiaE+yCUbTBas5Ud07EYR3wfP01RS7as=; b=KR5vdfVZRmc3KPFh/PidjYist5
	FNuHP6wnGQbTAMQjowz0rf4V4pTeZLJizXaeFN9TkftdSFwTGB5CXf3CSIbAHfhSXS35XDwOP+DPo
	2igSG5Snubxh7+i+9OqNYXqnD9xwOftMfLU+LAuYPebaRVve4WdutibbFnA7IV3VXePVI0lL7pXh+
	LZy+zK/Tg2aKvymBxmk0s+WtDej/aYhd8squCQ1+iFIbG+oBcVHlpy1fB6jH2cMzPGYwuDckxlDDH
	JoC4P1p82JJfaX423bxf74z7s1TbPBFy4uxKFud1eAQ+bijp6ZB2NwsowvgaM7qWhSTTjKapRblXS
	LR9RcOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKFD-0000000Dmjc-3VjU;
	Wed, 28 May 2025 17:07:11 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKK7S-0000000Dls8-0w3b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:59:11 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BF5F61140135;
	Wed, 28 May 2025 12:59:06 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 28 May 2025 12:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748451546;
	 x=1748537946; bh=LDMLe1OsHNvAiaE+yCUbTBas5Ud07EYR3wfP01RS7as=; b=
	CbvEonSlObjQmr/ENFYwXlOn3Cnv1cN+1IEx+e2Ab23SPHhfKgz1XueM3fIcXkNy
	SNAp0dWWYLpZKbcTIbfHX2WF50LYIWSXFyoWc2k4lDZ5LWu8wh+Ve88KSODl6vla
	PDOK3aQC9aMwqDtboyP5v5mx4IIAX2Ur49yCoiq3dSEHzalS8tsVt7X2MOZ+1X7a
	FPrqnkEzHbUGqkywECJZMaABpCIXub1AUUaxeluVYhtY7YDGYr1GYd3N1PctEigD
	FFseJAiDEo8rfwobpyHH8ZETk/Q3TxxWDfMVAWUrFv95sv32QbsaOfaH2aobzCtj
	34WUyaPhAq0m1rSPDNteBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748451546; x=
	1748537946; bh=LDMLe1OsHNvAiaE+yCUbTBas5Ud07EYR3wfP01RS7as=; b=K
	YVf8BpUEaYAApd+aYNL/QKwjVaXyMecVPGA6F2XwKDk+X6SIwGCLbJS3KfOMpyb7
	moV7fEYaVU2Gcxp6gttLPCXQ3kZTV9Hr7Sq6Ex4Ql6DweYicAPUtZ/wNpJG71ylk
	hgy7zYqbVjO4pv4eBPsq2Y/FfJ1/Lk1UWgUpO56pWM55LNfxdcWAdC4w+VxwjoUx
	q9YQWKLUkDsvSa1GPyKnHL9KVIwlqrboSy0xrp3bS7AAyWPyg+THIDCQ5CHeJ5q/
	DuYLLnu16UIC0UFSwcX+XZKW/luz3uFtrNeng/xPGrTK59CzNLewj1VV8sO/zuo6
	BwlGuk476VBHwu0MNewfA==
X-ME-Sender: <xms:2EA3aGq_c7e29CDINjflnwN6vQsFRKUbM0wL4brFM1H1T2o9msR-zw>
    <xme:2EA3aErY78NnJY5ukk14GqjiP4AQUxHV3mBQ-EFX19AOddbhFlReIIMHkr1SbmZFF
    4oiyrZOGA09GdjRemY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeektdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeeh
    udekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
    pdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephh
    gvrhgsvghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehj
    uhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlkhhpsehinh
    htvghlrdgtohhmpdhrtghpthhtohepohhlihhvvghrrdhsrghnghesihhnthgvlhdrtgho
    mhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehllh
    hvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlohhonhhgrghrtghh
    sehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:2EA3aLPrCXH1sLOgxGk-N_ufObFw_-vDd88aHQv85aFF9g6SXA9TsA>
    <xmx:2EA3aF6Z49KxjlhsBtzOxXAr-GUQ3t56s0p7YNs-AnjMnWXg0OgDmQ>
    <xmx:2EA3aF6Fnml8oHrs4GRk-ujdxAV-1WPPJ8_WeK8n3b6N_O8cTKrWPQ>
    <xmx:2EA3aFjZ31ssou5dbrszO3e6LRcGJsfzBiCQmfVOoCSGbH_QgocyIg>
    <xmx:2kA3aGXqXDA0CXLM-NXCkKqSIAcrC_X5XH8KNVMj6ZHGavqs6JaLqFeb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A1161700063; Wed, 28 May 2025 12:59:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tff0b0175c39a25d0
Date: Wed, 28 May 2025 18:58:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kees Cook" <kees@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>,
 "Justin Stitt" <justinstitt@google.com>
Cc: linux-hardening@vger.kernel.org, oe-lkp@lists.linux.dev,
 "kernel test robot" <lkp@intel.com>, linux-kernel@vger.kernel.org,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 "kernel test robot" <oliver.sang@intel.com>, llvm@lists.linux.dev
Message-Id: <324a5724-7bde-42f2-8910-e70b5b5f9d9e@app.fastmail.com>
In-Reply-To: <202505280937.6802F0F210@keescook>
References: <202505281024.f42beaa7-lkp@intel.com> <20250528061427.GA42911@sol>
 <202505280937.6802F0F210@keescook>
Subject: Re: [linus:master] [crypto]  40b9969796:
 UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_095910_649390_95171FAD 
X-CRM114-Status: GOOD (  11.36  )
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

On Wed, May 28, 2025, at 18:45, Kees Cook wrote:
> On Tue, May 27, 2025 at 11:14:27PM -0700, Eric Biggers wrote:
>> On Wed, May 28, 2025 at 01:15:05PM +0800, kernel test robot wrote:

> I'm not sure how to enforce "don't enable this unless you're developing
> the Overflow Behavior Types" with current Kconfig, given the randconfig
> gap... I have some memory of Arnd doing something special with his
> randconfigs to avoid these kinds of things, but I can't find it now.
>

The main thing I do on the randconfig builds to avoid obscure issues
is to force CONFIG_COMPILE_TEST=y, but that only works for build
testing, not actually running it.

      Arnd

