Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FB7C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlMpRkO0B1Y3vJHGlf5N8MK3VeLDRs8jsE+W9kL3NqU=; b=V5Di40MF/iH0dN3pJDEyMdxC5K
	PSfI5SLuIypHOXfkoMr/vtnCu7SesEM9jYdUJ9JxbDVKGmhwkHdPYG3KB04E78hPFGnCnbcfRynkJ
	SMMxEs3Su6ofCXvNtZCrks475kMjoH72ExD0oP9Ou+a+m1jCBoQeaxT6MXIVChvnT3QLhBd+q2njz
	dLFWfVWUSNycllbOeXQBACIpLiCCQLssBmFUgK7B5I3ph2dVnvRXS7iuKiS8bDmi/mZriw+QiT801
	+rJr2MQXpChRqfiTUWvmLVgh7dHqc6pSGdPBJ0U7cyXU+OA5rfRsXKaiG6GsekLzaMPj69Ptqm18E
	EtKENWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG1N-00000007bV0-0o8G;
	Tue, 18 Aug 2026 09:22:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG1M-00000007bTm-0HZm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:22:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D342660A59;
	Tue, 18 Aug 2026 09:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D7C1F000E9;
	Tue, 18 Aug 2026 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044930;
	bh=rlMpRkO0B1Y3vJHGlf5N8MK3VeLDRs8jsE+W9kL3NqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gBtyjcwcM/3VoTnHU2brZbF5myD5GWkpYcosT2Wpt3BF5WYVB2J35IDxT5Ff1AU4e
	 n4rLwIz3OWmajdWTIJUYmHTHSOMDaYA0wQygfVKbCr9z6yZKkzTxeU1m2hQqZiSNOG
	 yld+G4tyKxHkKfBikZChIADi4S8w6A7Eh35LIwy0y0V+yEs+CCQEcsG5gXsjdG5G0g
	 czPPjvMkPsmX1XHwXkAsuwDRU+X+z2V4dwK84wpJY9JP0UfNm+6xv1yNS2q6tIZ1PH
	 ngXa4GgXP2V22O96AsgUQwoVz8kortZ5d/n0D+bO4MDjaVHOZ4JAevxVP+hZ5iJqM/
	 L2OgL1GEmHFhA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wwG1I-00000000ojn-13G1;
	Tue, 18 Aug 2026 11:22:08 +0200
Date: Tue, 18 Aug 2026 11:22:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] bus: sunxi-rsb: fix usage_count leak when
 autosuspend_delay is negative
Message-ID: <aoQkQAxADxBQXNeH@hovoldconsulting.com>
References: <20260808062029.2597581-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808062029.2597581-1-lgs201920130244@gmail.com>
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

On Sat, Aug 08, 2026 at 02:20:29PM +0800, Guangshuo Li wrote:
> sunxi_rsb_probe() calls pm_runtime_use_autosuspend(), but
> sunxi_rsb_remove() does not call the matching
> pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> 
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during driver teardown, this reference is not dropped and usage_count
> remains unbalanced.

As I've explained elsewhere, this is just misleading. There is no usage
count leak here as the count is balanced whenever the user re-enables
autosuspend through sysfs (by writing a non-negative timeout).

Drivers should clean up after themselves and disable autosuspend, but
this is more of a clean up than a fix and should not be backported.

You've sent upwards of 60 of these in the matter of just a few days,
some of which have even been picked up. Please send follow-ups (replies
or v2s) as soon as possible to prevent further of these from getting
merged.

> Add the missing pm_runtime_dont_use_autosuspend() call before disabling
> runtime PM.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 4a0dbc12e618 ("bus: sunxi-rsb: Implement runtime power management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Johan

