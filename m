Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB3DD15DAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhTrRioSM5724TJ+3W0Nd659X2C2YVlrtfSbdjFEVeg=; b=rabcI1+Nk2VJhyyigmh4F4rnv8
	2hcEXXk6fPSXGMW5xIooqcJrzgZiOeF8Kz+BQd9pu+ZjcXnGL7rnVdXlRu6GMo8swvdCDH3Wh0oeM
	P+Kknqd1bRUw59/2ix19ahElpRrXnn941b8aUkXE+NZvx6GSoRSMe2ZF0IBVICbG3h2ASQFOMKMqJ
	cZ49jZt42RdYbypICthcxfqIGP1y8toYOAOg2ZdKKV9IjhjFXmutHIoveLmx/8RYe1s03n7zlIWCQ
	xbnFT2ErE16nPKjEJAz5omR5j+xQfblme/zze9EUeFfPtZkKGNvVY81i6UZAddIfkGlm3vxz6csdP
	p7RkqrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrBr-00000006u8g-0IAc;
	Wed, 03 Dec 2025 18:02:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrBq-00000006u8V-2woN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 18:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 920D3601E9;
	Wed,  3 Dec 2025 18:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA50C4CEF5;
	Wed,  3 Dec 2025 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764784977;
	bh=+v/xPS8BinNaQUJiCUoK+hTFkJtV9XTX8tCGOQIkgi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSKksOq6vdBViu1TJ/JFCO649aoQTql6lcwHO2pR91sxtrkr0BUn8O4WLST9iM97s
	 xst/7wK2IE7dHXDZnuizDEEeZmdLtmkYE/xD6u4/cIVRERmnAvXZ1gN0oR7Dd7MokF
	 Gt6Er2sz7cShhwWS5Q9bzVvfmYLlerTdnMYAN7mKiRs8tROItenuDaJWfaLDVvbJYm
	 R3lOCJDhHTBE0amhw6BpdJR2FkgiPhCFNcujrgHYrZOnx8w+0UDopEPVTQoicZb+29
	 Q9kC/jtRe3CpFeTUWV9rBhY0ajjqnbENyyaWkKvGjAe8CSj5QJs+8s/b6ZXm+XA4kB
	 VSbSASHQ2J/5w==
Date: Wed, 3 Dec 2025 10:02:56 -0800
From: Kees Cook <kees@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] lkdtm/bugs: Add cases for BUG and PANIC occurring in
 hardirq context
Message-ID: <202512031002.ED3098374@keescook>
References: <20251112175316.2841017-4-ardb+git@google.com>
 <20251112175316.2841017-5-ardb+git@google.com>
 <aR4ERqeHFbSWooZW@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR4ERqeHFbSWooZW@arm.com>
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

On Wed, Nov 19, 2025 at 05:54:14PM +0000, Catalin Marinas wrote:
> On Wed, Nov 12, 2025 at 06:53:18PM +0100, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > Add lkdtm cases to trigger a BUG() or panic() from hardirq context. This
> > is useful for testing pstore behavior being invoked from such contexts.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  drivers/misc/lkdtm/bugs.c | 53 ++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> 
> Kees, are you ok with this patch? Happy to take it through the arm64
> tree together with the second one.

With the small addition I just sent, yeah, this is fine by me. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

