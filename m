Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225D7C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9OuFK8krYG5CFJQY5mJoDN0CmcjBiY8Df4psmo7f7k=; b=rB/5/17taNyScN3bTb4UUyN0oy
	znZnB4gnYn8JPUiLZGLo+ps8cK9OsNjn3qXiNE14XQgYQSayB9sZu/ewzY1RZ67aLSQvfMLexMacp
	jDsOawX3rrmrFpb3cbjg8f22O0EPrapAFziGAYAHOxp7NTehNif/96clk7CGh9zWvq/mVDe7H1Zfu
	0z5zfpSeT3X9AY/iX8Ih3sfe4LVPTnebLrvu88rXwjYfmbVv10dSMFvu7mPz40C+0E7e1OoI2wyUN
	dE9gHb6iPQhe4k/sS2waGt7z0GXAPeOYsg3Ib5rMrlKik3RsQT7eV/3mrhgzpUuWAcOKYHtOJcx2z
	Ctu3YSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fgs-00000002ZIK-3MxB;
	Mon, 21 Sep 2026 15:12:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fgq-00000002ZHZ-39Hy;
	Mon, 21 Sep 2026 15:12:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E23960142;
	Mon, 21 Sep 2026 15:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7491F000FF;
	Mon, 21 Sep 2026 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003538;
	bh=C9OuFK8krYG5CFJQY5mJoDN0CmcjBiY8Df4psmo7f7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ll1CjiAP/Ipjm1dHbz/UzwNVf9Su2P2qOIF1JmfRmgsGSU25vaCQ2xhjcQ1JLOaz4
	 EfWNN+ckuH8zevwEV0XQBK8ptDUjLCv1HjxSFkKj5eeUQmVDJlcrD8ayhqK3wOEBSK
	 3cVnaTQYVPioq0KH1+A2XfU2ddu58foJDAKEHR/9jP0tolYzATNsIURq3kcnkjU9cU
	 lKJYn7IToJuUKRUUX8u/zhpe+XdEabg6RFg+Wmb7azT7uw0H0Rr0NxFzltQXI9wdhZ
	 YAAp7ozwP56WEdbxFryz4ovhOso3trE8rzp93innvh+2VQaqdZodZbHALaKXJIHVaW
	 /2nWX6PpbDydA==
Date: Mon, 21 Sep 2026 17:12:15 +0200
From: krzk@kernel.org
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yonglong Wu <yonglong.wu@mediatek.com>, stable@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mediatek@lists.infradead.org, Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH] usb: musb: mediatek: fix child device leak
Message-ID: <arFJTmMczwQaRL7B@quoll>
References: <20260921085119.308981-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921085119.308981-1-lgs201920130244@gmail.com>
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


On Mon, 21 Sep 2026 16:51:19 +0800, Guangshuo Li wrote:
> mtk_musb_probe() populates child platform devices using
> of_platform_populate(), but neither the probe error paths nor the
> driver remove path depopulate them.
> 
> If any initialization step after of_platform_populate() fails, the
> probe returns without unregistering the populated child devices.
> Likewise, the children remain registered when the driver is later
> unbound.
> 
> Use devm_of_platform_populate() so the populated child devices are
> automatically depopulated when probe fails or the driver is unbound.
> 
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
> 
> Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/usb/musb/mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem, how to document usage of LLM and how what you should not
do if this was posted in a good faith.

Best regards,
Krzysztof




