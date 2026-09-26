Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4416CC98324
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqhtRYfHxTdA5AHEl7GWLWSSMjHoYIs2MLO3IJpi5zg=; b=pW5/3fKFBfjceEMfheI9nphRMu
	sUjx6qab3fzYqhhJqQDO1OV3Avc0S5d7ZOy949K8r2pa1gQJZ4sVw6s5rNStgdSfo7unLOlRfFAUj
	VPU3ixiGeaVVbGC04ieKWm277JguYGUnq5ANYGFkBjPzD1rU0KewXfV+5eEgIboYI/al06YPT+8HT
	xIA4p/1d1ylgQ10EmQXlFXqPFxCIrZ7rTYf9HkGU2CnZogrJOYBsCvRyLqTJ2v8ZiALjOJVnalrf3
	SLhu5JNcqRywzlH+g4LXiK11kOROkvBusG5PWq2U34l8o4q5zAktCmv7U0tFbEVw4Lk0tmW3PqfFA
	6h4M8llQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAIw5-0000000EtdN-0ZHT;
	Sat, 26 Sep 2026 03:18:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAIw4-0000000Etd3-1IiN;
	Sat, 26 Sep 2026 03:18:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6480760136;
	Sat, 26 Sep 2026 03:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD061F000FF;
	Sat, 26 Sep 2026 03:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790392727;
	bh=XqhtRYfHxTdA5AHEl7GWLWSSMjHoYIs2MLO3IJpi5zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G/ZLnxNmeGfBJ4493KlkmVG/cHmt47L9J+GZg+mUIHKpOsJR82n9FHniGutYgqhp/
	 ISs3jmqGb3MRo2fGMCZsXf2AThJkvEvu6E3vs8DUH0AlBvHelzyabWMn4fidvnJepX
	 TWbcsJ++Osv6pDo9m/Ii+BSZjV87/lRS1y4JccKKIrGa2RPYW/XkjzCT0d66eOPfQq
	 jBUUBqa1pJDW1AGsx3+ZuSmaAkOx1nMn+fKwk8lODDgVGxVHKI9YKCLlYpF3mz+Gfj
	 fmKLIPAJR89RQO7bLIO/anVxJEq+TAfBpqbVkhFQAcQ79mURimEPtJrjdThgpd+TND
	 1c7DTRz0FM4Tg==
Date: Sat, 26 Sep 2026 05:18:23 +0200
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
	devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v15 02/16] phy: rockchip: usbdp: Update mode_change after
 error handling
Message-ID: <lywinqwwm2k7yycctngj7krt4e27dhi2pzzfcb5n4otgcj55rm@mk52fdcfq6yc>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-2-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-2-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:49PM +0200, Sebastian Reichel wrote:
> If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
> tried again. Fix this by only updating the variable after all potential
> errors have been handled.
> 
> Note, that no errors have been seen on real hardware and failures would
> most likely be fatal and require at least a full reboot as the function
> already asserts the PHY reset lines. So this is more of a theoretical
> issue.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

