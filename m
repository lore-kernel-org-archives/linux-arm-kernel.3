Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CD7C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brPo4LHaJaLSQ5NoCpOmZMudeFP07TbwWeUS06ea0xk=; b=nfwGONURTDI7jlxXYA4RGPLwgE
	F2R6jgpjxfV5/jQm6NkT+oDchDOhs+pRkVV5fWTlEMw/ON50Q+LE/7CObYJRSDMkKUhIxfSwrp6Lc
	zIslYi8D5Moi7Vv41Xzmiu1ymslmMOK6MCgRBHFCQRDaHJyhzxIujGkSNYRKrQCS/k/k5WpGoWiQ+
	N5OcTS7CLJn3EqnP9Jn7ItPsoRicU8uZmQROUVXCoFgLYD006XQYpothUpCkp0u0DGsJEYpOjk7/t
	gUIc/Mz5gA3xNQs6OJK0dlM0PPvPtVEllsDKFQLLY5ntATEe7woNRBXGmOHNxRJLrR3w8GaqvT2lc
	tqusbUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4teM-0000000FrDp-3aFJ;
	Fri, 11 Sep 2026 05:18:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4teL-0000000FrDc-2Zsy;
	Fri, 11 Sep 2026 05:18:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4928740C34;
	Fri, 11 Sep 2026 05:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C881F000FF;
	Fri, 11 Sep 2026 05:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103889;
	bh=brPo4LHaJaLSQ5NoCpOmZMudeFP07TbwWeUS06ea0xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aqvcKu/50z0Q96RozxSVN2FCdJdj60wTAr+738VbyA9chsWD71lUxzKnIs+yoGY7S
	 lEWPR/C7GNFg0HSkz8sLhVy1OiVP6ONFn13ib8TbMVnWooQ+p8iSvpLP7HPu2LQ0Ao
	 q1hOxnrFscLx1AXpKtk88OpR8hFFc1nrfhhMp5Tzpy3FuLjCrQMPVUpvcEQ/lvjbtH
	 vtjBbWr99tOWxAToIVCJsWuiIduPaPmKfM4SSmd6WDu2tgu0B0YxSd1ivFCAryqHsX
	 jlzL5ItD249IblNuD1iFSky513g56hkWiQHujSEmwKf+lCKcDiluSw6XSjxIJxI01m
	 pY0oEvzAZJ23A==
Date: Fri, 11 Sep 2026 07:17:59 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 06/12] phy: phy-mtk-dp: Support set_lanes in configure
 and properly cleanup
Message-ID: <d3qbwzwoqshalixhg2t32zuecstiy6uingyc4b4r6wmwcg6ggj@z2movep2kk52>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-7-angelogioacchino.delregno@collabora.com>
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

On Thu, Sep 10, 2026 at 11:20:32AM +0200, AngeloGioacchino Del Regno wrote:
> Add support for enabling a specifically requested number of lanes
> in the .configure() callback and disable all lanes in power off
> and reset callbacks for proper hardware cleanup.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

