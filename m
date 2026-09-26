Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE60C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHnANxNG9dMQBtJ/mshlG1MygeNIbtgRmVltQ972YrI=; b=CsuJ5Wj0MIQrbVKhGsfwRs0Iso
	oDlV+yx/s2fgLzzNq3QWRcK+FUQnElkb2gqJMuc9bFrxOWdeyRYxjBOBKchkov5kO51UV0hG4tGzW
	PNZwn2gfO6Es+IGqMUDJhLJqMUurd7OcaAMwGLfz8d1qcotxFBgdHrhuYv9dpTH30uyfgjDg4U7yO
	+PpyVvkAQ0B+BvpHqSEizYn0/4FxfC+Hu5mIkHSpzCATooxkAtXKg+EJVqFEg7Oj6jrR75Pl5vIik
	CJ9UsOzv1HTtsWTa4TqhfH55tnhsxE7LBocQmnj8WzZrzzttujnH+QBQ0Hs+75ylPfWf5ugKjshci
	MVIFFb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJkG-0000000EwPN-2pI2;
	Sat, 26 Sep 2026 04:10:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJkG-0000000EwP7-0a9V;
	Sat, 26 Sep 2026 04:10:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 420BE60136;
	Sat, 26 Sep 2026 04:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FC21F000FF;
	Sat, 26 Sep 2026 04:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395839;
	bh=zHnANxNG9dMQBtJ/mshlG1MygeNIbtgRmVltQ972YrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bb1X/hiOxHw1uvCg6ghPzXAKXXqXViNCBG+FEqhewcJhb74QmTQEU0YNRa8RgV1ah
	 IUVtjL/neZNwFvZPDuHoPd3ZL+aMBpiYv+fFK61nn/gdw7pZOfsyqT6wmA4mI0p8dN
	 e7jNUQMd9PzAohJqClAiCqolfhBouqKktYCDSwmo6j3NaVpVZfh+j3fFyXI8NsB7+B
	 bxFdaWD+j4sitQwHumZ7JigiKJP+TXMlVs1J1Ci5hLC8EpI9p41MSNG8g94nyoF8VD
	 uGx1V/l0TLwPfJjImOMTBG2peB6CbjuDoL1C/CorOpWEkbqqo7AsA4ew6R1r0xaZbL
	 9JWGpmMVI/c9A==
Date: Sat, 26 Sep 2026 06:10:19 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 14/16] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Message-ID: <d3smhq5cy4tqigiwwnyc2o2phgqzfthlq3og2642s7axdt25v4@oawozf76va37>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-14-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-14-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:50:01PM +0200, Sebastian Reichel wrote:
> Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
> with the existing helper macro.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

