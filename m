Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A580BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1U6htYr3KDizbM+pvOno5keAAu3JxFYL37YugBOwe0=; b=jhfJxDUWETA21jpozpieMsc6uJ
	lk/zMWhWET4TswXem7PVLUaSknphLsG6n+fD1IS4PUlsmodeOCPXN4EX8Buc8D5qD/jQD9WCuTUea
	gnTycKSHXKLw6QBeI2o1CwiNzUyzdrjOl6FQLVBKQIIwLiQPrSg2fDS+AReRIX8giUqUozVL0y4x8
	M5QrtFG9yD/z7tj7/lYejyP/uAy2FY9N31hBL1P9EFyH0GQOAzQZw+Sr3KGekn4YhGxUsf3fDuUms
	+Rl5OriGxRQNkJdlRAKDGjgFFNTO9AY+CtykIKJSSEONNarSx3RLW1W5YjQr4aaPpDhSCGz+4Ihpf
	cyjRc2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YTC-00000007pH0-16sR;
	Tue, 15 Sep 2026 19:05:30 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YT7-00000007pGI-2WtH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:05:28 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B2E62408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789499125; bh=s1U6htYr3KDizbM+pvOno5keAAu3JxFYL37YugBOwe0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AezeimY/EDjo3fPXgLQ44KDX5OPDDr1xgkzE1EhmKpD7gPcaQSQjTSBElZiXRAxkA
	 KILGB8FKia8q5oNdr52WrUsQ98GO/HtHsqLdegw4wrlygVFdOuGgh9g9snNDr4/8xu
	 3nvYU1Vx2XmgdCGifzb4oYWcVmckQsdkkneZfv9nQVhXlKHvuBuFghnI5XGCItVg/g
	 ZbyiL+JDMXAEQJLWXR3mnwgj5xXni5CX8KEjZWj/8+FYBxZMvVy+Lx9PB0iDEc1rxP
	 2yXvNg8nDcC3z1IJWmSFuW7cFS4GUm3/ZxZF6K/VLoGUYXIlJW0ebXouEL15PEJbdx
	 SQIzW0KKooMcA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B2E62408B4;
	Tue, 15 Sep 2026 19:05:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl
 <steve.wahl@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike
 Travis <mike.travis@hpe.com>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, Dominik
 Brodowski <linux@dominikbrodowski.net>, Michael Schmitz
 <schmitzmic@gmail.com>, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v3 0/8] docs: kernel-parameters: Remove eight entries
 for parameters that no longer exist
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Date: Tue, 15 Sep 2026 13:05:23 -0600
Message-ID: <875x069vyk.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_120527_293501_7648B940 
X-CRM114-Status: GOOD (  15.51  )
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

Karl Mehltretter <kmehltretter@gmail.com> writes:

> kernel-parameters.txt still documents eight boot parameters whose parsing
> code was removed with the drivers or platforms that used them, one of
> them (atarimouse=) since before the git history. There is one patch per
> parameter, with a Fixes: tag where the removal is in git history.
> Each entry was checked with git grep for its __setup(), early_param()
> and module_param() handler and with git log -S for the removing commit,
> and the name is absent from the whole tree at that commit.
>
> Changes in v3:
> - patch 3: name the commit that turned edac_report= into a module
>   parameter (fee27d7d9788) and the one that removed it (7fc0b9b995f2),
>   Fixes: tag moved to the latter (Boris)
> - the pata_legacy patch is dropped, Ethan's patch from June covers all
>   six parameters that commit 3c4d783f6922 removed:
>   https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/
> - collect Reviewed-by and Acked-by tags
> - the "Found by cross-checking ..." paragraph dropped from the messages

I've applied the set, thanks.

jon

