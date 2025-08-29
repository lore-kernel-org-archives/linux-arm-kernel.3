Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A45CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k55FMI1+I3YofT/NFGFbUAEdT0oLWBjHI6fE4D4wyEQ=; b=JpYYFJ3XgOE4FoxDZQJ8S0Kub+
	TJKXiJDsnBOpa/GtyMw48CZhr8Z9Ol4KMqhwG3NawigP12RFDGR+LqX1JXvN1JCCZOMFbzVEdhtcJ
	QzBU5LviWls2U0XhjKOiS/9s0l8VrnYv72nPH8wOZpNQtDP3OfDde6ePZz5fu6bz1/k+zmKFiKkhQ
	VXG/VoNyalurT/9V704/ZEkdOzKnFlvsT/aV/AR+K6VzmCB3y0u97ep5MHIo8N5mKc5xtPy1tHzJ/
	k51EcKKeO/9F89iJUMC46umPNBGa3h/eOpzOctM01w0AKb41yJYgO9WW0h23x2ug1PEaBVJJnpILp
	A2Nc1g2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruMk-00000004wn2-3yV5;
	Fri, 29 Aug 2025 08:21:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtvX-00000004prV-2XV4;
	Fri, 29 Aug 2025 07:53:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E72060051;
	Fri, 29 Aug 2025 07:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C5FC4CEF0;
	Fri, 29 Aug 2025 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756454018;
	bh=lGnjYgv5elXMwfPyxfMjkMn1zViVKrlNZ159H/ar7Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KGOt9k6JGUZm/s/BiB2row7YwILB1Wv9QyejLhNWD2L1ohpPgQtX52KGXrGK1Trd1
	 C+WV3xgYVoOVvrGKjrDxxZ9DXMIkAu9wg5pc/QWoZImosfpFINNXIfEHNb6MV4XxsL
	 i3Jyh6T+vdnEi26V2a1CQlNksFjbyCgzEybK7NydCv2Rx+TIIf/7jmqAUV0IsG9aX4
	 DvejgTIDG3gV8I+89DKvFjUK4wZpQkcdhWOiNKs1H+riOkIzIUr47oY6TFWjYPvn2P
	 jBzvaMohNV0D3/pWSGgdSgNpBScQbXwcZWfPMpzV/xrKX9/RXAPIkp6KoeZe6p29oR
	 h1Ka89zJ+O5PA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urtvL-000000000g6-3mNQ;
	Fri, 29 Aug 2025 09:53:27 +0200
Date: Fri, 29 Aug 2025 09:53:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix device leaks at bind
Message-ID: <aLFcd1ZLr0HUm-CM@hovoldconsulting.com>
References: <20250722092722.425-1-johan@kernel.org>
 <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
 <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
 <aLFbcznLUutbMo6r@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLFbcznLUutbMo6r@hovoldconsulting.com>
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

On Fri, Aug 29, 2025 at 09:49:07AM +0200, Johan Hovold wrote:
> On Fri, Aug 29, 2025 at 07:51:23AM +0800, Chun-Kuang Hu wrote:
> > Johan Hovold <johan@kernel.org> 於 2025年8月27日 週三 下午5:51寫道：
> 
> > > On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> > > > Make sure to drop the references to the sibling platform devices and
> > > > their child drm devices taken by of_find_device_by_node() and
> > > > device_find_child() when initialising the driver data during bind().
> > > >
> > > > Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> > > > Cc: stable@vger.kernel.org    # 6.4
> > > > Cc: Nancy.Lin <nancy.lin@mediatek.com>
> > > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > >
> > > Can this one be picked up?
> > 
> > Ma Ke has sent a similar patch [1] before you. And that patch fix more things.
> > I've already pick up the final version [2].
> > 
> > [1] https://patchwork.kernel.org/project/dri-devel/patch/20250718033226.3390054-1-make24@iscas.ac.cn/
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-fixes-20250825&id=1f403699c40f0806a707a9a6eed3b8904224021a
> 
> I'm afraid that patch is completely broken and introduces a potential
> use-after-free by adding a bogus decrement of the OF node refcount.
> 
> I suggest you drop that one and pick up mine instead which is correct
> and cleaner.

I see now that that patch was included in a drm pull request for rc4.
I'll send an incremental fix instead.

Johan

