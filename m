Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C223DC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEGujVrnh45aRHa6TGYv0vK65BrEMTGrkS+B+KBLQdY=; b=yO5eAZTJUeCahY5y/9eAlfFvd4
	3qszWKrW7Ii+wfVcyFmnDDZESEESm06TEwZixDQ5UCQtzZrHXid6c7O5D+C74+DNslRpmHc5HaWvj
	IN+QIB63zosN5bSKOKK0w7j+QQph7tFLCzCE4H8udJzubgZE1N/tvk03G02QDZ68yOLTKgysTGTv4
	f9LWqKjizo7NnO+4YNy4grjObDzeJs4xJ4WwRXhPvZhMuweapJ9TDZDacbPyVr5sNFLzMYg33fLCw
	uAye/O3odJ/Gkqswm8AhkldD0mm6jXIs7lV2wzyf+uHZ/Wg6dNfXclaLB+cKImzwaIR/SkI8ZZfBE
	/dqCDz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lkt-0000000CQk2-26x5;
	Wed, 09 Sep 2026 17:06:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lkr-0000000CQja-2l26;
	Wed, 09 Sep 2026 17:06:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA377601EF;
	Wed,  9 Sep 2026 17:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3355E1F000FF;
	Wed,  9 Sep 2026 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973596;
	bh=tEGujVrnh45aRHa6TGYv0vK65BrEMTGrkS+B+KBLQdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I05C/y3RGAUYs8rLS+AVasAowNXB0L71hpYAq6erADUXn5hHQkhD+0+xtK7cpCsFX
	 Tlg4o87zyOadC7pg8Zqfvrpa4NWWwtzsEjHVzbJvRHmZ3589sP1HNv4m90tU5iPCVc
	 gB8dR2YKj9bZRHjqnSn44gva1V3e5jNI1wf4Z/VMyno3eylGdGRwsNncBxZXN+//yw
	 15YtQvmp0YemRPV6GYgQ5SjxP5ZGE13+YXTRvm1urVIwEg97CY6xYzzTqRKeDQioUe
	 eP26eJBDjf1MDrLEkTNvR/RTG6pdANv7Nzs/s3fCwGgeyalvTl+kQrZOd757ld1QFn
	 LzyeefD/yNBHQ==
Date: Wed, 9 Sep 2026 19:06:27 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 04/12] phy: phy-mtk-dp: Migrate register offsets to
 SoC specific pdata
Message-ID: <42rp4gtodsf35nqkabudeskzxxdfsrhvsyug74i536cuyrhjfz@puo46jjfbnf7>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-5-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:37PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for newer SoCs and for adding
> more capabilities to this driver in an efficient manner, migrate
> all of the hardcoded register offsets to SoC specific pdata and
> assign that for both DT and platform probing.
> 
> While at it also cleanup writing the driving parameters to the PHY
> by iterating through all lanes with a loop instead: note that for
> that to happen the default 0/1/2 driving parameters were added,
> those are really just zero.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

