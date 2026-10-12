Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434FECA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwOf8Dc4TxSx32WOzwSp7Q6nGhu/G9ZRjwK/NvjcHHs=; b=YBJE9IzDZX7PLHN4YXrxJjMMKV
	KQGtZrUK2esaAvyqBA20FktRCb7gN0nqC5wem6AZkXCRD/YTeNU9O73yyB44dzzAAGNU+hiek+qR2
	i8JDCC9LqaaXaqcsecRmyzS3TbmgFqlqgY5kfNJMDDZWdVmBFv+f0dhsaES874XiqAOU6ymG5S3wJ
	YqFMGsJ2jAaoLjpHrGPgukaJdbC0ok+t6bKOyhBt1dpjhzdbDhffrG9pufda811jiOIklZ4sXCnh0
	xbZ+662JftLh4FV526+ul5o+bUVItzJz/QXO4dB06DkEsEvSBoV0lrzN9zt4KYq42q4PvxOyomaIk
	+bpcVRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIdD-0000000AvXL-2f4k;
	Mon, 12 Oct 2026 16:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIdC-0000000AvX8-3a29;
	Mon, 12 Oct 2026 16:12:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B1D543CDD;
	Mon, 12 Oct 2026 16:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409281F0089B;
	Mon, 12 Oct 2026 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821526;
	bh=dwOf8Dc4TxSx32WOzwSp7Q6nGhu/G9ZRjwK/NvjcHHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BLngqW/i/yi7ouv1qN2l4qytDHWZGEsgW9NgpRR52R9+cyCj/rmsP5IvvkOB+5vQG
	 R484XftbLYU9MiKQ9XKPIewGqbjy8WBgpeGCwosXf9nvFqxtfXY2V7h1uvRYbw/M8U
	 Sxp15CxL6AIr1cVFAkS6AO0wvrFJ1wYIx1ydRFdIjrAHFCmf/5QB2zGf68tf8gq7Jy
	 5OiFbxE/1SqAf4w0i5kg5CY1N1cxunIJUwZj9G4DM/cvLZdkp/nkgzF7aHVUiLEQuJ
	 1OZGsZq3J7G8FOUYnO2yAUWC7fRgyZu3qgMtmFG+lJiggWml6+EAX4lIkXs0JlzgSV
	 7p0q1lM1JO32g==
Date: Mon, 12 Oct 2026 21:41:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: bivvy.bi@rock-chips.com, heiko@sntech.de, kishon@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] phy: rockchip: inno-dsidphy: Fix runtime PM leak in
 inno_dsidphy_power_on()
Message-ID: <as0GyAtxP7a0oqrB@debian>
References: <20260917134627.2153845-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917134627.2153845-1-vulab@iscas.ac.cn>
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

On Thu, Sep 17, 2026 at 01:46:27PM +0000, Wentao Liang wrote:
> inno_dsidphy_power_on() resumes the device with pm_runtime_get_sync(),
> but the default case of the mode switch returns -EINVAL without
> dropping that reference.  The matching pm_runtime_put() lives in
> inno_dsidphy_power_off(), which the PHY core does not run when
> power_on() fails.
> 
> Release the runtime PM reference before returning.
> 
> Fixes: b7535a3bc0ba ("phy/rockchip: Add support for Innosilicon MIPI/LVDS/TTL PHY")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

