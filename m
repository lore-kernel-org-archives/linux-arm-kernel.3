Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39903CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deol0f8u75gq+l99XfozGVWWj2R/5r0t0S+4WGdqZJ8=; b=xPXjLNQRJB/HJQ/5CttRsnR6xm
	hbC8fXY1EH16D9Am84NXPGWtJtZj8BmdItsS8GDu2+XFW1DBIQJkI1h7/S7wWDEgkTgHz1msxCnYJ
	99AUeXpMDBo3BBf5z9QyTa1m7fWYtUii8UBKNZ+d7R7pNqr4V1Xw0uvQFok2ed8YDfCsMvv5nIYrd
	8bA9RLhV6xc5iwG5Y0gDGBVIsuTWaiMeupDh/L+jD9wm+DxV8bb8ZoKc23/gKIIWWAlw+KGYghEwH
	ymH1JFIozbz0lA1oq3t/hMuYq8OWwYa+4qwm7jLga+bczrw1b5Soi8oebT6toiMKITVTjBk9Cxswy
	og1VAYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwFq-00000007p2X-285f;
	Wed, 03 Sep 2025 22:47:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsac-00000007MHS-3uEl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 18:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C55F601A7;
	Wed,  3 Sep 2025 18:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24990C4CEE7;
	Wed,  3 Sep 2025 18:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756925534;
	bh=mhZwxZOfoGVVOKWYycNAVIy8/yJ/33jt/6HScs6WZfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSgy4D9hmmCtLtSAeX6slC444z205ObIwBdJMGVlOeF3w8ufwj8Wh05cu9sCD8VXh
	 9pcdIO+mOnCsGZk6kyU8eOBjyHRgNkxI7LRZHz83aKzW8TJahc2kxfoI59hcBzOTsL
	 aAEiMs0DWGog8q/wGt4BxYTJDhOgpNBgARmaohc/75wZIEUrcZyEym8z2bzTLeP5v4
	 FtvdUZyhryPDVZyPBX2Kuh9nCwSaQQpgWxbg8OWYMhd018uA6AUGNGw30o/+jHNK9S
	 XgN0OB8r9YQkH7alxz1c/PrFMulEj1fhHxLcAv/3VbhPgx1kLTXQyhjQaQPu82iAH3
	 ayBZSF1OPmkbQ==
Date: Wed, 3 Sep 2025 11:52:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
Message-ID: <20250903185209.GB3004824@ax162>
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
 <9650d2e240a9170175069e3a4f6d6d9512d62aa3.camel@ndufresne.ca>
 <20250730005212.GB2984390@ax162>
 <699dae8715b77f20f075452ecbaf03c2e0876186.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <699dae8715b77f20f075452ecbaf03c2e0876186.camel@ndufresne.ca>
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

Hi Nicolas,

On Wed, Sep 03, 2025 at 01:13:00PM -0400, Nicolas Dufresne wrote:
> Le mardi 29 juillet 2025 à 17:52 -0700, Nathan Chancellor a écrit :
> > Hi Nicolas,
> > 
> > On Tue, Jul 29, 2025 at 10:24:22AM -0400, Nicolas Dufresne wrote:
> > > Le mardi 15 juillet 2025 à 15:13 -0700, Nathan Chancellor a écrit :
> > > > From what I can tell, it seems like ->cmd_host2risc() is only ever
> > > > called from v6 code, which always passes NULL? It seems like it should
> > > > be possible to just drop .cmd_host2risc on the v5 side, then update
> > > > .cmd_host2risc to only take two parameters? If so, I can send a follow
> > > > up as a clean up, so that this can go back relatively conflict free.
> > > 
> > > It seems so yes. For this specific patch, I would probably rename "args" to
> > > "__unused" to make the reading faster. But does not matter so much if you
> > > later
> > > remove it.
> > 
> > Yes, after this change is picked up in a maintainer's tree, I do plan to
> > send a patch to remove the "args" parameter altogether. If you really
> > care, I can certainly rename the parameter in this change to "__unused"
> > as suggested but if you don't, I will just leave it as is to make
> > backporting this a little easier.
> > 
> > > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > 
> > Thanks a lot for taking a look!
> 
> While applying your patch, I realized the Hans merged another version of this
> fix, but made by Arnd. It covers the remaining too, so I will mark yours as
> superseded now.
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/7fa37ba25a1dfc084e24ea9acc14bf1fad8af14c

Thanks, Arnd's patch is obviously equally correct and the stable tags
remained so everything looks good from my end. Appreciate you doubling
back to this.

Cheers,
Nathan

