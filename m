Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA82C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WstYARRHn9ZPq1+nz6jOBzDzED9g5UXV27FiviiVoWg=; b=hWOXI9Q67t1mniEXw1BAPtEyNM
	TM1eRMphDKO+4pUrjw8tJDyvTO3O8l6PI+m4rEIvFtXhWQcj5h78M855R+cXhx+nGLi+wpLJyotfD
	AeiTYufjpTJYaABhwA/oyOzdvcxt3wckWXN+hE9PofzsEfA+k2/HJhomo/sQybUFCYcmD5BpEIFmw
	i7x5Z0vO3fB+Yxq4E/iRs7bSOrVl7vhRYrfRbuVHSs/k98AF5NamK4Nv2pATtGs0wQ4mmyrpvmZHX
	mVWjENpdlQ/YWGtjqJma5d5/T6ojKm5qejakpz2CgJ9V8jpUbSQsNPOvI6m+fi+is+/5llHh5uQHg
	Gxlhr82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATFv-0000000FVrT-0HgJ;
	Sat, 26 Sep 2026 14:19:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATFu-0000000FVrH-05Yx;
	Sat, 26 Sep 2026 14:19:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B0666020C;
	Sat, 26 Sep 2026 14:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D557E1F000FF;
	Sat, 26 Sep 2026 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432396;
	bh=WstYARRHn9ZPq1+nz6jOBzDzED9g5UXV27FiviiVoWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OHKLOpyMkis7lDS9EKv8y0gEmDo5E+1x/UstPIQ8QNm4BKvZLBpJ3uda7a8qoo43o
	 tyfEDk3gfuMXXSzsSUuvmi9iepVQ65vIzFS1n5jpnAhTkLkJP9/oIeLtCyprH70miB
	 73Cu8hRZg209NCWqYvBR+9buJN99Yc7NpxaH7BpkWmBOJx1LqPsg9WOwWzu8rf5/tz
	 cQ7HMHHZ3EOPz0VCyuUoOInSP3BN4yhvudvycrMeHMTeDBSeaqWkq+yeuvdYF1giv4
	 i7fc4D9Aru4ki1xtMJma7T7lem6jc0fnWgf7GtDsmSpS++wWd1wwFgvdFBuFaKH+mi
	 tmjlYgp9A/Frw==
Date: Sat, 26 Sep 2026 16:19:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: nikolai.burov@jolla.com
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>
Subject: Re: [PATCH] phy: mediatek: xsphy: clear U2 DTM0 force bits during
 init
Message-ID: <6tee7zkjxpm2pzr6hjngicb2h67runsffjajtf72qtazmf2zge@xd6rndya4wpl>
References: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
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

On Sat, Jul 11, 2026 at 01:34:46PM +0300, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> On mobile SoCs, the USB PHY is completely powered off during bootup.
> As a result, various bits in the DTM0 register are set that prevent
> the USB 2.0 PHY from functioning. Clear them as part of the
> initialization sequence.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

