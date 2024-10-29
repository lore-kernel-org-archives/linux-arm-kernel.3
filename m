Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A96D2AB3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cqqrov4AdwCYPpG1iaZ3hsr3yIYdVKOBo5HLsmX948=; b=ebh3lSsqi/qihl0t2oTMCXvRWJ
	3sYCTrfl0GNWBWKVu5PE+fH5tfgffIU3iN1QsLcyhJR9lrsew64q85eOOn9ssN/4PooC40J2G+492
	OMBu4Ig4zf/2KZGJNMxnZKGnIAgeiA+KmPsXDneLgOEYbqnBb7Ast8fxlQ4FbbqSBtdz9D+QbJjGB
	k8XlhIV5ycp7lpvsX/JS7AOCbRYIKhZzZ/Dn9fX1zYViSPeHxe4xOIoDBuolJR+mEHoSAA5oxb168
	AimygACip+SiP/+WAy7dTtwOrPyayscoZJWlVrMGITmFIsO6EvRj3TK+noKSG4Vpto1PWyqnceXE6
	3ce4vGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mhm-0000000Ee9T-1Wu6;
	Tue, 29 Oct 2024 13:56:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mKy-0000000EaKt-0BIL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 13:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3774BA42E20;
	Tue, 29 Oct 2024 13:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026C3C4CECD;
	Tue, 29 Oct 2024 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730208762;
	bh=jrHqPfbGs6UW1a1ejxLnOehibvcOx7U9XWxUoCxSwoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jms2n7NkBUVyQyQ53pgWikeOEV2u54BzjjJIJ6usO3A/ERN/LVwKbKwBfuEETMW8/
	 Kn3ye63OUcssw5Ffbt+czxNdWd1DoonvF94ojADw8LzpMOCLvgtv4n5DMAUwvKG5YS
	 ZbZEdctq05uBBNHEHJIq4zGCQS2XEG+p+GmS475vC8i1+/VbXj9qTbpmGES7iI9zm5
	 JZrJX5f0Hp4QOSPHjmc5Hl2i4yBMMXFs8pC4UEsisFiBXl3RckPrGAGqM5576KAgVt
	 X5qLXxx1TeDNz3m4eBfya1MaC19xq0mVmXqYOc0VRALTg7c79Fz7EhkeUJeQHphXOS
	 NeTcb+Eo5K+GQ==
Date: Tue, 29 Oct 2024 13:32:38 +0000
From: Will Deacon <will@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: Switch back to struct platform_driver::remove()
Message-ID: <20241029133237.GC4416@willie-the-truck>
References: <20241027180313.410964-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241027180313.410964-2-u.kleine-koenig@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_063244_163802_0970C2C9 
X-CRM114-Status: GOOD (  20.79  )
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

On Sun, Oct 27, 2024 at 07:03:14PM +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/perf to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello
> 
> I did a single patch for all of drivers/perf. While I usually prefer to
> do one logical change per patch, this seems to be overengineering here
> as the individual changes are really trivial and shouldn't be much in
> the way for stable backports. But I'll happily split the patch if you
> prefer it split.
> 
> Note I didn't Cc: the maintainers of each driver as this would hit
> sending limits.
> 
> This is based on Friday's next, if conflicts arise when you apply it at
> some later time and don't want to resolve them, feel free to just drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend.

Alternatively, if you share whatever script you used to generate the
diff (did you use coccinelle?) I can just run it right before I tag the
branch for 6.13 and use your commit message.

Will

