Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC790C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyiTj6alOlQUBpvVanvP3WSeuGMqb9NQa3cYxb5z/kE=; b=ki1GdlgDNHvWbPYEXEw8rlYZ4I
	LqL3b1EQUgpg1z3oCz+Adlsw1DM2lP7vFd8F/Ia6JsuAbhsJEuRwghjsYnyxd7zMyl2Oo0uW5nsHB
	i/CbzYnvE8rtYnfSJPW5xDPpDSyf0pyAFbv7C+Nxwd0Xsh/wjoxq5ppS6fmMoPm/g87EYFe2Errp2
	hXRURZmRq8yp9sB6h/oxG+Utw63E2XKlo1GcCqlKMoHKKiVaBYQUkRcH2BpOUfc+Y4j3Bxsn7Fdst
	85ReigcMUnZLLPK6sFPF/lGi0s4rRTcJvvf4HDhwTJMhxW21f8TifKcQRbUoh+NRJvs1oZ3i7MXiK
	9gIxTcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tdo-0000000Fr4e-20Mt;
	Fri, 11 Sep 2026 05:17:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tdn-0000000Fr40-1LEA;
	Fri, 11 Sep 2026 05:17:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B574E42DBE;
	Fri, 11 Sep 2026 05:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD391F000FF;
	Fri, 11 Sep 2026 05:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103854;
	bh=MyiTj6alOlQUBpvVanvP3WSeuGMqb9NQa3cYxb5z/kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMmIbpxIlWoNOpEzY53NE/GrzWX+ITjvAwiJ7k5RzH99owz9sqGHfCEeLVJPVvxvv
	 fRWfuu4jGHGC1Ko9r6fwd+l4+bOy1buyVW6OEnHr8TWj4nk/LxxPj6Fex1qDUHAX5x
	 +ZZE9k27z55QOAD/QshaCbFnnrRubk6JRkjIQJPK9Rw+Zkt8V+b2Gwb8YnJojhMgKQ
	 8SvJUxn2oFJGW4K132CNUODpE//NcdEiY5I0E3xjInfVyGt8QTt2dbYRTVJ8781qmp
	 hNdmRZLdRTQsMtt26u2Ld6uNShYjV0sR5e8h4smj/N0HGDGY5D7z7PCPBjUZYnAEZm
	 TEX3nnBAlS2xg==
Date: Fri, 11 Sep 2026 07:17:25 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 05/12] phy: phy-mtk-dp: Implement power_on and
 power_off PHY callbacks
Message-ID: <woh776xuf7vavnb55lrup6runersvwtw5hkauarjn3rzfuu5sx@n5b5tjt3firs>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-6-angelogioacchino.delregno@collabora.com>
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

On Thu, Sep 10, 2026 at 11:20:31AM +0200, AngeloGioacchino Del Regno wrote:
> Add .power_on() and .power_off() callbacks to mtk_dp_phy_dev_ops
> to be able to call those with phy_power_on() and phy_power_off()
> API in the DisplayPort driver to be able to stop using all of
> those hardcoded register writes in that external driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

