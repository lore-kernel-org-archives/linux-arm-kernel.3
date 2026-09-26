Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A8AC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTWY+ooeNyiWZIlbNSBvzkPlMs8bY8Uu85Mi2iBSvHE=; b=FNhpX6P23lP2JkuMrrBAz8j2PS
	w1SQ5PxRwsTwZg9MN+UttH3gl5Xd953ZKr9+dkp54lBjk2YCt/h13csfkKdO4jag0fzsSTgrcE8xk
	Su50Q5ojkRYBR2d6jVmsUIcMO8giOXii4FeV5R3qMwF4UN0DedF0jY4Si1stJJlvX6zHbubQcvWQu
	sbzooz714Vm5zB+exNp6iRQ1zfcrykWv2s/ZyoaDXK/Nc7V4qdsgsk2I8YQa/l6NKMmaXwEZ871Od
	ANM+ozBeAxSjrsgx4fzLNSN55Yi5QpI9SGdtUzOo8SDPG1MTWifd6orixbl4ABcQx/LfJNwvVTbfc
	sL0NfXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKjB-0000000F0LM-0TvP;
	Sat, 26 Sep 2026 05:13:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKjA-0000000F0L9-1IU4;
	Sat, 26 Sep 2026 05:13:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB1D6429C8;
	Sat, 26 Sep 2026 05:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7451F000FF;
	Sat, 26 Sep 2026 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399615;
	bh=hTWY+ooeNyiWZIlbNSBvzkPlMs8bY8Uu85Mi2iBSvHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LVxax5kT/EzQtUTGTVG5vpA/i4KOytJk1FF2VhUXhkAW/nkpogLL2pYjoFlQ4/Ypz
	 zPE2jU2PiFP01y50eO71hA8feriHgFOdzjo1jjKKL7F90u87/Q8AhCwS2jvtfKZ6ux
	 WFewFyTOWEcuuT3WqAsESO8ZGp/XLeWqXKBnp9ZwnSgxon26p9oHGc82DbozyW5JXq
	 L9AlHoAKBinszf00wj0114MH+/OZEJSUAJyRO7qTg+FMIb+byx3Mu8GhgEhaG/5tAk
	 L0EJo6CCGrWFMYkQmp+JLQXjZIP0kYdf1C5p4sRwKi0DEVL882qMnJdNrqY9YK5VZD
	 PfVrIgl09/VrA==
Date: Sat, 26 Sep 2026 07:13:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 06/11] phy: rockchip: usbdp: Use guard functions for
 mutex
Message-ID: <36mqzbbbmgtvj42n7aebleyk5cl5ydnciuxdoxbmyku2f7mkxz@7q3djm6bkrzy>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-6-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-6-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:09PM +0200, Sebastian Reichel wrote:
> Convert the driver to use guard functions for mutex handling as
> a small cleanup. There is a small functional change in the DP PHY
> power up function, which no longer sleeps if the internal powerup
> code returns an error. This is not a problem as the sleep is only
> relevant for successful power-up.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

