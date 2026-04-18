Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08495F99C89
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 20:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbLXe4Og5GCtNFoJgU/iohm65MD7uV97LErFdEaEF7E=; b=UdVPf9IWlUb8TyWQ7auHFSbKGT
	6Tuv73+xnDP1zUaZPkfrgfMtfJzLLHUB/A23LwRI5BjdlnDLJlU2/lrmEk7KxQS9tA7jQM+Cig/zL
	oMMy3NTQtTZYENGXiHYBves+P0c1jipjh0U5td8LXOaGwtH4JPqPNANTU7QxbYOcjdJaut2KMALpH
	zAKDqpLcb5MOu02p+8nlTRUVYQblIXKLBwkYGHzwBei45BESJ1pvWbv1c875pvxxtzhwfUQMozxiD
	j9YgHKdir1ZGtF3kdmE0gMFLW7bVb36QaW6Vq3i9OP28/JdmLimVX5DI9oupK1ix+Q2xP/XsU4BSz
	3aV66+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBx5-00000005BvO-0mCe;
	Sat, 18 Apr 2026 20:07:39 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEBx1-00000005Bur-2S5z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 20:07:37 +0000
Received: from darkstar.musicnaut.iki.fi (unknown [83.245.248.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fyjTG4pT0z49PyQ;
	Sat, 18 Apr 2026 23:07:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776542836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbLXe4Og5GCtNFoJgU/iohm65MD7uV97LErFdEaEF7E=;
	b=Kb/eSYaTGUs55bvEsMxccKvCe1lUD/sC5KPz52uNr/U8hOF93wi3MJ/ppCQzVraZzFgRSf
	NpbRguOwXxqkeAal1VE5DkM0YUkMeOOSm0b2kbTRx5Wn+bX6swZUBHk4lh29SsSTZk77jQ
	Mzv3ulGDMEVOV5fx744CmMbp0OwNLWupT+/2EXWypmaU20OQXi/cqeD8BhJGXrc7daAZ0O
	3a497Evvq0bC3XQVGjzncJo95Nxp64oByLOahYDQPAjtfkJ4RAxPEUdXH1K6047WHeGFCt
	cTnzSg7cYlVtnN8bqzTZWwbHbuIHQ5JYsjgVx2Ldhh56Sb2FWpuG5/Ew6OVcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776542836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbLXe4Og5GCtNFoJgU/iohm65MD7uV97LErFdEaEF7E=;
	b=OzG0N6MLYgpi1aRsblyHfoGw+pLJtJWCg2i8myzuMiQHgjQpE1b3ERF/7QzQ+DVFBBV98S
	eZFBGjKghztB7FKssj0DxIHoOAq02h1PDRTB4ILQtVrdOa4GfO8HpVjzOveNlPqCvZKjHf
	uUR1QP9Mm7sWsbpbhmzi7ylUWdy79YGZw0NMaA1Pe9OhaoFiBqj6IJxykjbGrw5TTLyACi
	Vef8no+A8Oe1cbnG2sNk40s2M6pefcWSxkk7ohZsWG3wgMkBhdIpY1ovKPCJSwAMu+bgaf
	T/qWkC9ydIY9j3wIvP8ffGOiAGX5n9OAKRiK1pZkS9TlRMdyDH2uvZyI/INq9Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776542836;
	b=eshlC+o2K2l5qT1L/SCjR+WV73Bxk3OnqYzN/ng9ZtWmLTCyGx4qWO0cj+sY3un7wD+DWF
	MIP3JwY4ccDiOSgOBlDBrCiDbsuKg5rQfQRsHgPRr2U6MQ3X8fQhxnqSfdAtPVXB6faeIN
	16RlXbFjoaeE0McGG6MI1iZ2Q3RmknYSgKIffA8i/SDklYeP4I2UHkA5sigaZmBd5Fr02U
	pXCen5Yb7Y2rCQya5YQLIRq3jKAY7ZrLVPIjThjfrC+Zjqn4GNR8QJdgko2rkq9FRWbRBi
	5/rhq39AbpRw5jUl2aGeuR57k23EZq+je5P9F9ullBxU4UZlhJ9erQa5rmyl7Q==
Date: Sat, 18 Apr 2026 23:07:11 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
Message-ID: <aePkb1qTEvnMhkDg@darkstar.musicnaut.iki.fi>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_130735_906136_519C7CCF 
X-CRM114-Status: GOOD (  15.85  )
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

Hi,

On Fri, Apr 17, 2026 at 03:15:46PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Peter sadly passed away a while back. Paul did a much better job at
> finding the right words to mourn this loss than I ever could, so I will
> leave this link here:
> 
>   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u
> 
> Co-developed-by: Paul Walmsley <pjw@kernel.org>
> Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
> Changes in v2:
> - add more missing entries
> 
>  CREDITS     | 10 ++++++++++
>  MAINTAINERS |  1 -
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/CREDITS b/CREDITS
> index 885fb05d8816..afd1f70b41cf 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -3645,7 +3645,17 @@ D: Macintosh IDE Driver
>  
>  N: Peter De Schrijver
>  E: stud11@cc4.kuleuven.ac.be
> +E: p2@mind.be
> +E: peter.de-schrijver@nokia.com
> +E: pdeschrijver@nvidia.com
> +E: p2@psychaos.be
> +D: Apollo Domain workstations
> +D: Ariadne and Hydra Amiga Ethernet drivers
> +D: IBM PS/2, Microchannel, and Token Ring support
>  D: Mitsumi CD-ROM driver patches March version
> +D: TWL4030 power management and audio codec driver
> +D: OMAP power management
> +D: NVIDIA Tegra clock and BPMP drivers, among many other things
>  S: Molenbaan 29
>  S: B2240 Zandhoven
>  S: Belgium
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef978bfca514..ffe20d770249 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26145,7 +26145,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
>  N:	[^a-z]tegra
>  
>  TEGRA CLOCK DRIVER
> -M:	Peter De Schrijver <pdeschrijver@nvidia.com>
>  M:	Prashant Gaikwad <pgaikwad@nvidia.com>
>  S:	Supported
>  F:	drivers/clk/tegra/
> -- 
> 2.52.0
> 
> 

