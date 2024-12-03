Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0ACE6689A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24kNbAf2DV9qqwNGoDvbA1XyQw+YLYxtcrmKEHcOfOI=; b=141eYA2VdTww+EiPIwziUoGL3N
	QJzAzHhGgtCZpyyCgfw/d7ko9hW+pS0MXf0F2M3rojYL1+cRXduf3lRkpv2dk3X2slyvbth8M8b8V
	Wf9Nqi7awYWmwddmtTvClKHsP7RpQKQ+rHWPbQciwSh2rt0/dny3GCtsxcDUYMB5i9gz359A2Pwsr
	MnVvgXHH0g68Q3NSPDM2CKlvDl+zvfHpXZD/n/FF2ZnxGXZaZZhBSr4y84l8MyNBVTAanyXZr32dK
	dg2RvhZTlim1xF9d1f2v4DFURNUpvnpN6DPNIj4TrBl5ihZE8w3Om2sSQ5A6Wy7RrnCfac5cB/vXL
	DdzBOIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPqt-00000009253-160m;
	Tue, 03 Dec 2024 10:09:55 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPps-000000091v3-0FFh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:08:53 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D16EF1140109;
	Tue,  3 Dec 2024 05:08:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 03 Dec 2024 05:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733220528;
	 x=1733306928; bh=24kNbAf2DV9qqwNGoDvbA1XyQw+YLYxtcrmKEHcOfOI=; b=
	YoXQmWqadtJcnc70qtzKm40uS4bC/GMOkqoHIfm62TBcFDALwVW8juW5MgGEB1YQ
	tgJHw9+OGZBNVVwQ0UbVK5Dza4i9Q0IGfWBsdOsbNo2r/fQVHqs9hhJEgSnAB8GT
	efzOJT8a/fIxjn+1oiMumVD+i7gWD5u+++E/PF0NMIE6hKCW2z1yx9yn+OrVNmEN
	AqTniePcXQXEvOHHNBjClcAJrrFWYf/apBuPg9p8/b798LxTqkhH9wh0Z4P6tZL/
	5rSL08XNA4iPjHpzFc62bHAjvCmIkxfvLuRqMHxlmOOTRCwaokvNqFcw4mA5hfii
	Rdip1ucVZoRT3F5JnvvRMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733220528; x=
	1733306928; bh=24kNbAf2DV9qqwNGoDvbA1XyQw+YLYxtcrmKEHcOfOI=; b=f
	5q+31OlGFiGOXMEBuOCfkEe044TMNI5QHd4qIWUcwJo3oDqZBBOB0gTayYaj6ALl
	Ju6UcKPwyHo2rFlvzgdCyBDtZUgQy+VgnPou6kF5XtgpaSpzHvBNflWN9TqdMbYb
	+h+9BsD/bRvgN+NS7pTLw97dJuzKnoJg7ogWozO7DJScl3bXWHphYO0B9J0xD/4i
	DiSAunJy4+iTeS6twSTuV8s1+0E7RkCKHZ8itmlVjCNQnRXv4GJe/9p1bT1y6jTh
	WZx3uwxjWtgLPUcKObKlPT/bJWI7Vs2g7oYKgZ4V3Uj403Xqj2GPaTYHXj259Blw
	jJ/+9WdiWhUgkFg++Dkcw==
X-ME-Sender: <xms:sNhOZ6zHTtp7SjSpgoPJ5j15kSjKQeWRWKROl970_d0fW5Vdp5xG7w>
    <xme:sNhOZ2SodT2n-rhOWy3WSuHDMQvr_qeMw_erFL-xujF4EX1M0CXqevdh3B7UPqmXq
    6RhX4sWnshRQ4yaWto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddriedvgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidroh
    hrghdruhhkpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhulhhirghnsehouhhtvghrqdhlihhm
    ihhtshdrohhrghdprhgtphhtthhopehjvhgvthhtvghrsehouhhtvghrqdhlihhmihhtsh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:sNhOZ8Xi8sv7AGW58kvqGWMlzGRGRBpRhD1QO5GOcB6Mki2N7Fys9w>
    <xmx:sNhOZwj4pjYFhUOct2ToTKJUmpYXGfJpPdM0ifmWN4RzbCTLyoxOug>
    <xmx:sNhOZ8CPkht2LHwOKdjB0PxRGzZMRh19aZ6PKviYTurgsye_mdWlDg>
    <xmx:sNhOZxJRdPCYRfJbw_7sMVwi9279H1UTdnUK44wZOzyS3kkvFEBHVA>
    <xmx:sNhOZ75q0xqZBGoOEAh_V4Sfd733ngs-lKLzef4mJMZlfInk_-gpDkoh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4DDE42220071; Tue,  3 Dec 2024 05:08:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 11:08:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <jvetter@outer-limits.org>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Julian Vetter" <julian@outer-limits.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Message-Id: <609b026d-d54c-4a11-b7df-6ef0ac315f25@app.fastmail.com>
In-Reply-To: <20241203083838.3260036-1-jvetter@outer-limits.org>
References: <20241203083838.3260036-1-jvetter@outer-limits.org>
Subject: Re: [PATCH] arm: Remove IO memcpy for Big-Endian
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_020852_483464_CD6F7295 
X-CRM114-Status: GOOD (  18.54  )
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

On Tue, Dec 3, 2024, at 09:38, Julian Vetter wrote:
> From: Julian Vetter <julian@outer-limits.org>
>
> Recently a new IO memcpy was added in libs/iomem_copy.c. So, remove the
> byte-wise IO memcpy operations used in ARM big endian builds and fall
> back to the new generic implementation. It will be slightly faster,
> because it uses machine word accesses if the memory is aligned and falls
> back to byte-wise accesses if its not.
>
> Signed-off-by: Julian Vetter <julian@outer-limits.org>
> ---
>  arch/arm/include/asm/io.h | 11 ----------
>  arch/arm/kernel/io.c      | 46 ---------------------------------------
>  2 files changed, 57 deletions(-)

I'm not sure if this is safe on all platforms. Big-endian arm
is extremely rare in practice, and in comes in multiple variants
that behave slightly differently:

- On modern ARMv7 the byte-invariant big-endian "BE8" mode
  generally well-behaved and works as one would expect it to.

- There is one ARMv5 "BE32" based platform, the ixp4xx, which
  works differently, and this in turn allows multiple configurations
  for its buses where a byte-swap is performed in the PCI
  controller.

When the little-endian I/O string operations got optimized to
calling the word-based helpers in commit 7ddfe625cbc1 ("ARM:
optimize memset_io()/memcpy_fromio()/memcpy_toio()"), Russell
intentionally left the big-endian versions alone, which I think
was done for the case of PCI on ixp4xx, but could have been
out of general caution.

Before we apply your patch, I think the minimum would be to
have Linus Walleij try it out on an an ixp4xx with a driver
that uses these functions. Maybe Russell remembers the exact
constraints that led to using byte access for big-endian
mmio string operations, and whether the new lib/iomem_copy.c
version causes problems.

I also looked at the little-endian arm32 version, and
it seems that here the generic code would work fine, but
the custom variant is likely much faster when both the
source and destination buffers are aligned, as it can
do larger MMIO transactions using ldm/stm instructions,
though the generic version would be a bit better if the
in-memory buffer is unaligned.
We could get the best of both by implementing optimized
arm32 versions __iowrite32_copy()/__ioread32_copy and
using those in the generic memcpy_{from,to}io.

       Arnd

