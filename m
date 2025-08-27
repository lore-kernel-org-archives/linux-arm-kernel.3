Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24111CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b/UWPOy9ejR9aLMf1sg8tRrimPemQlPWdCCaJPUkic=; b=Y35ncyfHkAVP3IRx2A9F/+cDU/
	So+9PcPZXOl8LdJyaPjx1eRfVGDgDP1+Ufn9NVYpO2ogsav4FysTgATK5IyZitUSo7G23Y9VKGxYQ
	Y70Kw9Ncx1nHXnBhQBfXjkSNg0wGMvCexXBrMsDmjbpi14PwQBuz3xqkKJDSuG4avLFemZUaLV0jq
	A1/nVRH5U8PkoD5DbosjOhjU9EiOw30U5yVrEmsGoH5IcwPAY8uTixQRdxk/IVNZTjGxFJurq2WX8
	UcUSYbrjcjNyHWr/xxLeH+v8JmycQtHxxMUjV8A9GlCXnXYR7Z2tCaVZ/c+WtmYOPlx9Udg42ESFX
	lBBu05bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE06-0000000FAUQ-1nM0;
	Wed, 27 Aug 2025 11:07:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCoI-0000000EvXM-0qDc;
	Wed, 27 Aug 2025 09:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9E0943D5E;
	Wed, 27 Aug 2025 09:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98173C4CEEB;
	Wed, 27 Aug 2025 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756288277;
	bh=D1p7DvGbiFBfaeO1vt0gRq3Y5mYuYPgPSQ3cdG7XHY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgVKXSLiK7hhnCMIXJzEVcBtEe3aiX0qjTk1xb2DobiK+GD7gPbjx01v7uScAWk6T
	 hS+M4Z3Pl2JwJlFCBhlaPHKrSArciSnQaDIdyrVqQsuDLR30xVR/7Z6WhbzbXTVMjU
	 dzhLO42XIAIJVAqIaWUUksN9SVeczIOXITfD+HOfrf/Sgc1Qu3iRh2CnzjY+baJy2z
	 DnaogPyOeHTukqUIGveVYiav/q6q7jxJg/uYtYfjvA0+Wa8FkjLRLQFaKPYmcf+YRn
	 RkUm9o0DLf4gsv+l/eNRZIsmy7Ij3lEP5gATSSWN221e6bgLvwzxhQGW9+xB4UVmkP
	 JxtD43Q5TjtXg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urCo4-000000002LW-3dx2;
	Wed, 27 Aug 2025 11:51:04 +0200
Date: Wed, 27 Aug 2025 11:51:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix device leaks at bind
Message-ID: <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
References: <20250722092722.425-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722092722.425-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_025118_256310_0BF69285 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> Make sure to drop the references to the sibling platform devices and
> their child drm devices taken by of_find_device_by_node() and
> device_find_child() when initialising the driver data during bind().
> 
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
> Cc: stable@vger.kernel.org	# 6.4
> Cc: Nancy.Lin <nancy.lin@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Can this one be picked up?

Johan

