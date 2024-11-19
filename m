Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69A6D60D09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dU/X1LVj2zCJb7w3XKJiyRzUCWkgqM4B+4P6fFRGIhE=; b=a8DxRgt859OgKnQU4cxfxbV9fS
	7gbQQEmcSuovke5BaAeJbcD0g1C6g6cNUEkRvoP7piqrNNyBv7COkjm1/p0iS2JjKjuNph5FB6LMT
	IhmFA2UP+6rXEyXeG8cFgvUpBCkOdJ26cF6O8oytN+PuaHtNVyj/0yygSRxwWBSiFKdkFqWJY+QNP
	k3aKQK7rxq3qrMVEntj5HNjfeQurnUGtFbht2wt+lG7jNYMriPqfV/uGcAmS/j86hpVssrKIPq47/
	OTcOrl9oE1kHn1X51RPtGQdM8+O3gj8NmKFopOpIpVKboFtoLugKAeP73sLwAqAhZHBkuitnXLDMv
	bGO/LpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDJV-0000000B6Cl-4ARC;
	Tue, 19 Nov 2024 01:45:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDIZ-0000000B5zM-3DNx;
	Tue, 19 Nov 2024 01:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21A16A42162;
	Tue, 19 Nov 2024 01:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98427C4CECC;
	Tue, 19 Nov 2024 01:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731980698;
	bh=Z/txLvl4Yc8TUyGQzPm6CNP9JhRwBWqdG1jlFr/G05U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mzdPWv8O3YLS4zPylsi73dd4hK17RL310ZjbTLYXmccEirAGDjvq60xaR4g1/23Dz
	 xFRAt+bAHGiqpS6zYtrZVnOSa5NM+u1h+7/mHRwSIxrDxVJsQo3lZZHwF2Dkm/LnaC
	 rr+210O6vQpnDA+0+5VaFVESxlzQdIv2MZFYLAcsd7IyKucUY8vgxpHCxfsPQuDDAn
	 3dLy7wcXePMnrgiYg750wOShf7CxbS9QrgQYqE73sDkqjpdA/j39urb+MiD7hYr3jd
	 ZXu5DTxiBk7S8Rf9QLOtmFJjdPnEN47syrhvUuLvPAqI8zHW1/8lplv6YSpSL2k8+F
	 bzsZhhHVfmAyQ==
Date: Mon, 18 Nov 2024 17:44:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: wojackbb@gmail.com, netdev@vger.kernel.org,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Subject: Re: [net-next,v2] [PATCH net-next v2] net: wwan: t7xx: Change
 PM_AUTOSUSPEND_MS to 5000
Message-ID: <20241118174456.463c2817@kernel.org>
In-Reply-To: <7e5e2bda-e80d-46ec-816a-613c5808222e@gmail.com>
References: <20241114102002.481081-1-wojackbb@gmail.com>
	<6835fde6-0863-49e8-90e8-be88e86ef346@gmail.com>
	<20241115152153.5678682f@kernel.org>
	<7e5e2bda-e80d-46ec-816a-613c5808222e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_174459_869544_41922F20 
X-CRM114-Status: GOOD (  12.38  )
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

On Tue, 19 Nov 2024 03:01:47 +0200 Sergey Ryazanov wrote:
> > He's decreasing the sleep timer from 20 to 5 sec, both of which
> > are very high for networking, anyway. You appear to be questioning
> > autosuspend itself but it seems to have been added 2 years ago already.
> > 
> > What am I missing?  
> 
> Some possible funny side-effect of sleeping with this chipset. Like 
> loosing network connection and dropping TCP sessions. I hope that 20 
> seconds was putted on purpose.
> 
> Suddenly, I don't have this modem at hand and want to be sure that we 
> are not going to receive a stream of bug reports.

Power saving is always tricky, but they say they tested. I think we
should give it a go, worst case - it will be an easy revert.

