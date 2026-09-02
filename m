Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8F2C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSS2ZyNCJhfDvdNZCG2wo1aIo6vAs4ArlqXzhHgn+3I=; b=ypy3hndWoshgHVZVdd+DNfk/Jt
	P1VveyaJ82EtnqUAS0UEbiQSalfIOzftt2bWlZMEathuntLJheWkg4pOkkPxH0p0woHxGpCABgNfy
	TP17+m3pI9BTPcVvk1HUlRLztD7GvZNnw4nF7ZObrOMBdJLRZj+sLOcZJtAyBzoGwpbrLoxFn7/yG
	bTQMXsS/5HSy5hvFZTVBW9U5RCe/GH+6pTwZF7YJZbFeWMhOa7TV2t49pK6W26MZW14xO4nxNJOK2
	1Wf9pgJUc/rQVN7hsVbneuzZf/ZUKto2P67eHk/piJxO+vtErpvi0zviL6bvclyTlE/+ksAQLBdai
	bXmOqgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1prK-0000000FbcV-0OO3;
	Wed, 02 Sep 2026 18:38:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1prI-0000000FbcM-03BR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7182A43501;
	Wed,  2 Sep 2026 18:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4200D1F000E9;
	Wed,  2 Sep 2026 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788374331;
	bh=ZSS2ZyNCJhfDvdNZCG2wo1aIo6vAs4ArlqXzhHgn+3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hiXw6pLxhNG9c+u9f+cZVoGUbPPqmElbFitCuj6yFGJoq5mvtU7Q27aoVgonJyH5b
	 CMSYiUOzWVTXpm84DAi/2BqP8djFMTU8DUZ/+6Sp9btS0EP5vZ9cwUSQgQtvDLaaVm
	 XyIMg8ZAa98HHTp5yrnVI/SkIU5e+cKF7SZPMDFCWsDgCiUs/kWaJEuvcMpQfSKHUF
	 VO1s4bdr/xZiIKlAsErvaDdRwNT9B5ArnLPqIJKMnoPYdhP3i8Y5PJclPC1MGPafkm
	 FeLW5u6QVJruyeZcA55CFGaCHBQjmbLuTzWlFqx72Ym3MwXkUQaTCx+zTLTRcdyemq
	 bbBEBBeUGJxPQ==
Date: Wed, 2 Sep 2026 11:38:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Yo'av Moshe <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
Message-ID: <20260902183845.GA2669394@ax162>
References: <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com>
 <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
 <aphSYUS7xGJjj2gT@SMW015318>
 <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
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

On Wed, Sep 02, 2026 at 10:10:23AM -0700, Nick Desaulniers wrote:
> It does depend on
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b27015390901@kernel.org/
> though, so you might need to coordinate your PRs to Linus with Nathan.
> Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-b27015390901@kernel.org/
> going via kbuild tree or what?

That change is already in mainline as commit 979c294509f9 ("cfi: Include
uaccess.h for get_kernel_nofault"), so there should be nothing for
upstream maintainers to worry about. If this patch needs to go back to
stable past 6.18, then that change will need to be included with it.

-- 
Cheers,
Nathan

