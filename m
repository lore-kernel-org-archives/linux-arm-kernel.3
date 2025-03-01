Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC951C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 04:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZorOuY6ncc4kslEZnPP6ut/v47zjzY6T9xbm/XY/UU=; b=HixLkRxFfr/FVHDp/bfG+DNQpW
	QM2zT6ard7hF4v1JkhaT5djigLgMjhYcu7aMyaylnTcSxdrhBTd9637DJ90AffeYOOhIjlqlYVQ8D
	wqqjQmxdpc+nE7NcRNuRobCemkE9ZkZ7j746fQz8kKbiasKHe7mY6nJTX0Det1sdh30g9peSC4Ga8
	WTPHiu2vDPwM+6nLOHQg9banq9Y94XLXaCGlfHgAEln37GQYPNuEzSwyRxLfpObgeo0YK60NLWHga
	UnfEJWn0P8whR7i4UhMXQv3+2Watx8N5Y9gsHHMUgOJLA7n+iKbVEBH8LijPsC/mzy/Qws9TtoklW
	WlPiWlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toEfS-0000000DOYA-12fp;
	Sat, 01 Mar 2025 04:41:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toEds-0000000DONU-3avB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 04:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 395725C03A9;
	Sat,  1 Mar 2025 04:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921E4C4CEDD;
	Sat,  1 Mar 2025 04:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740803994;
	bh=cthizsVH9XEvy/+Wq2qKLDOxSqhYdJN2GBeD/Fh8bYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YH/lMEfI07cQfym3AM2ngKc0hTnPiHCWT1PztoN9wMV2vf6/IWksUL2whtm4Gt43+
	 KqH+B0aZ8MuLl8zAGM7U0W7Gdjf+dHpBjY+VchUKdr9ErivvplMIgoha2xviuPnHip
	 uoLvDVsh8Abr1UGO3BV26ldjxMdLSWePSWbgvVQNzk2gKef7qFOrnWRlu1gAg3KYLT
	 JIWuuKJqSe3++BZj19RpXtEnvcHNa291mT2dgRWNDLdxAZ9ol3W3r8I7d6+KOEQUhj
	 B2xU5VCTcEkAXQMM84Z9Ualtc6fHXMUnxaDZQU5GW6ozgQtdujmUBotidvAX1jHtem
	 m3Ri0S4uhp5cg==
Date: Sat, 1 Mar 2025 04:39:50 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Keun-O Park <kpark3469@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	Keuno Park <keun-o.park@katim.com>
Subject: Re: [PATCH] arm64: kaslr: consider parange is bigger than
 linear_region_size
Message-ID: <20250301043948.GA27296@willie-the-truck>
References: <20250224062111.66528-1-kpark3469@gmail.com>
 <CA+KhAHYujgeC2kAd-vs0N0zwprpeqtD8G-8DpJ0w2RSxzZ5SQw@mail.gmail.com>
 <CAMj1kXH-QmuXGi-5MSEzz7zSpPYWvM2eBPN-NbWF+R=49P2_2g@mail.gmail.com>
 <CA+KhAHYDui3VkebjxZLnN_ijMUzJf2BRMqtPqqos+rCbf8J7Ww@mail.gmail.com>
 <CAMj1kXHyZ5_+ZrcRtdx4X8LA+mzCNcXUZM_3QcEudYGbuGBq0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHyZ5_+ZrcRtdx4X8LA+mzCNcXUZM_3QcEudYGbuGBq0w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_204000_939933_99EDB559 
X-CRM114-Status: GOOD (  18.83  )
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

On Fri, Feb 28, 2025 at 02:11:41PM +0100, Ard Biesheuvel wrote:
> On Fri, 28 Feb 2025 at 06:55, Keun-O Park <kpark3469@gmail.com> wrote:
> >
> > How about adding a warning message in case of linear region
> > randomization failure?
> > And, there might be two options in my mind by now to consider hotplug memory.
> > Either giving an option for users to override "parange" as kernel
> > param or providing the legacy way((memblock_end_of_DRAM() -
> > memblock_start_of_DRAM()) when CONFIG_MEMORY_HOTPLUG is off.
> > Users believe KASLR will work fine by enabling CONFIG_RANDOMIZE_BASE.
> > In case of linear region randomization failure, I think at least users
> > need to know about this failure.
> > Can you share your thoughts on this please?
> >
> 
> Randomization of the linear map has always been a best effort thing,
> so I don't think this is a big deal.
> 
> I wouldn't object to the new behavior being conditional on
> CONFIG_MEMORY_HOTPLUG, and fallback to the old behavior otherwise. But
> ultimately, it will be up to the maintainers.

Personally, given the confusion that linear map randomization seems to
cause, I'd rather reduce the number of variables on which it depends.

I also wonder whether it's actually useful at all...

Will

