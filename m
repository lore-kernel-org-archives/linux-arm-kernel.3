Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F756E66884
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d9fLzjQ/AZqtv2ZVueKEFb1bGfJIO9edpVZ3H1jqFw=; b=s8wRcYji3kXlYkMaJnuZ4BXU20
	Y7PdFGWmQle/8w2POb1WL6YnOgnX+kOyAGWlt702YeAXztKNou7TLd1L6taaUpDmF6lcjdJANcyWK
	QO2m5rRchb6BxU1/OVOO8au6pKtdTagqOM7Zuq2uFYiCjbr16H6TUzz/U1Y0ZqrMVDUf35srRTQoo
	YfXUKSfbhKaJFJIpSUZaVJ7uuTUG22D9EJBTHAXySqChE+jQS9N2sbwWqtQYUWsprp9TM7Aj8hVIN
	SsRibRMZ5m2ToRoH5bML+8G0qDHZxg6PjfJrP6dXd+vP5271xke6eHk1p8W1rjAgChWxkzAG6uZmM
	GNN2LgDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhCl-0000000AxA1-3FHb;
	Fri, 19 Dec 2025 20:36:03 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhCL-0000000Ax8m-2dD9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 20:36:03 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 29D571D000A9;
	Fri, 19 Dec 2025 15:35:36 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 19 Dec 2025 15:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766176536;
	 x=1766262936; bh=3d9fLzjQ/AZqtv2ZVueKEFb1bGfJIO9edpVZ3H1jqFw=; b=
	kYZHsUm3yqBHaQvpro/+WVGIWBVYSVMFfzAK54GcyEOPEhFKvEFuAPrGR+cJTmUh
	WuqFNjPxZvQkkBDtAeuRT4Y6eEryMc/WKH8n1pZWJH0y0k42xCztHwa4qzaYSulv
	c8fjOxu/1OEcujcVhSJRl1VueSwH7a0Ugi7lgTQ5pJVnjDFeQ+QadG4vzWSUDkJf
	Gl2ii6dZ4T7T5QD5RZhU72HA+grnsmxMyM4UoZW8OJbUnvEkKRNTYf6Dyx7OFD1c
	z/BtnKw4w6z4ekb5gkp4VO5JU4ctwu672Z8pByzhuSQ+RGzGy4TN2hQsMMQkhZp4
	yDjEpWPhj/OnA/BzylISAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766176536; x=
	1766262936; bh=3d9fLzjQ/AZqtv2ZVueKEFb1bGfJIO9edpVZ3H1jqFw=; b=R
	g/gGMV6hGJSilE/ezNtky0vmAjZSzpFmvQe4yQSfpUOWkGu4+khqfe+CKsUsbbH/
	NWhG+aLxCk7W9xlqRRomISPzMad0RNuBJ4JzW8+tV77CvLOrZwYZpBfBxOSSIz9v
	cJinNF6Ej5OguuUgo8Ffg2liakO4Iuak9WNah7aNB2NdDJH+Agy4cPQGpoTO0R1I
	E50NjYk69gfh6dHUbDP691rKb0j1Kwmm+hQck5oLYemr4vJt5HIyG0JkVIr8FnPc
	MEIR7CnWx/AMfasIuVZN8J6smZ16rnvAZK0DfZAWUSQvK/TV++Mw9B67WJ7GlM/n
	iHzqzayWG1vya99RM3gvg==
X-ME-Sender: <xms:F7dFaetfjsH_R0FrwIjtYohr1MfQyeE2o_Kf225FkyDcAyfvlGgXag>
    <xme:F7dFaeTM_mVgkLqy_zis7ZjunWXe23L2cRxu6fojMT-CUeK-upeQDeRRCMxTOLG3t
    PM_he3EDc61UZJY2PHV6HnMgC-TNEEwy52aM303P8LlBxIBV9FxxI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegledvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtohepfihilhhlhies
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheptghhlhgvrhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    giekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtg
    hkrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:F7dFabR9fuVGLS8b2nH0EJEL7gMeVQyE2RmW6pjAmP-j5ztg66sWYA>
    <xmx:F7dFaSWdbgkitKG_ozO6MG4TRqQ12N7HBRnMw8O3mjcTSiNw9HFycw>
    <xmx:F7dFaaautW2GXmPM0khIdUKFWjjMT3nNkDSx5fj18akTdZS3YoKf0g>
    <xmx:F7dFab6-0sXi3QVEQ4kxkCC7Ickcc4xkhCmDssD-fi6cLmyMFZeyFA>
    <xmx:GLdFaZ8lTCnaSOSLz8dsTEi9P5rYOub2PGkiNAXcyFkNFyLQKKniTZRF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3E0EFC40054; Fri, 19 Dec 2025 15:35:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AQxZfb8dcq5J
Date: Fri, 19 Dec 2025 21:34:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-mm@kvack.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Message-Id: <513078d3-976a-4e6d-b311-dcfcfea99238@app.fastmail.com>
In-Reply-To: <20251219171412.GG254720@nvidia.com>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-4-arnd@kernel.org>
 <20251219171412.GG254720@nvidia.com>
Subject: Re: [PATCH 3/4] ARM: remove support for highmem on VIVT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_123537_743717_2ACB327F 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Dec 19, 2025, at 18:14, Jason Gunthorpe wrote:
> On Fri, Dec 19, 2025 at 05:15:58PM +0100, Arnd Bergmann wrote:
>>  arch/arm/Kconfig                    |  1 +
>>  arch/arm/configs/gemini_defconfig   |  1 -
>>  arch/arm/configs/multi_v5_defconfig |  1 -
>>  arch/arm/configs/mvebu_v5_defconfig |  1 -
>>  arch/arm/include/asm/highmem.h      | 56 ++---------------------------
>>  arch/arm/mm/cache-feroceon-l2.c     | 31 ++--------------
>>  arch/arm/mm/cache-xsc3l2.c          | 47 +++---------------------
>>  arch/arm/mm/dma-mapping.c           | 12 ++-----
>>  arch/arm/mm/flush.c                 | 19 +++-------
>>  9 files changed, 16 insertions(+), 153 deletions(-)
>
> This looks great, but do you think there should be a boot time crash
> if a VIVT and HIGHMEM are enabled, just incase?

Do you mean in the common code or just for Arm?

We could use the Arm specific cache_is_vivt() macro, but it feels like
the 'dpends on !CPU_CACHE_VIVT' Kconfig check I added is both
safer and simpler.

In common code I don't see a way to detect vivt caches. There is
cpu_dcache_is_aliasing(), but that also seems to cover ARM11
processors with aliasing VIPT caches, which are otherwise fine
here.

     Arnd

