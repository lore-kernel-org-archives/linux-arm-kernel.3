Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC3AC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3s5j8pQOgmFzwxdXRIENQONtbgTBd1Lm5Dh5URd63UI=; b=itRt/82dGLtep18Yd+786Jaae4
	xg6oKnOMp/RXFniOUqTRfWmb/oo0LrkzIgKwL45B0DjJmZVShXB0Kw+ZJAopQrkdN2z4cleR0Lww4
	0Xj/EaPVld1vMabFMHJ64UG66tjDGfSyysLSbbiOUwh1l8twxDjizapPIaTKV0AwO8yaCOXgfGElV
	HWmZBWH+ZxbIrWiKKMdM6Mg6/pbFWq7e4J2WtnDhq6GDmZoCU9PvmPCvARshS250ofmzYfkmJvyrq
	kiGXtEw3oMvy1Ch4HTSFa/ar0OQfbM91Rh+KIhcwXkZm8sPssrtEmHbWGPuy593crS9YswlZ3HVdE
	7XqUZ1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKfw-0000000EzxY-2PrN;
	Sat, 26 Sep 2026 05:10:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKfv-0000000EzxD-3uqN;
	Sat, 26 Sep 2026 05:10:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D6E860136;
	Sat, 26 Sep 2026 05:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344C91F000FF;
	Sat, 26 Sep 2026 05:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399415;
	bh=3s5j8pQOgmFzwxdXRIENQONtbgTBd1Lm5Dh5URd63UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AhQczImnptOx3Wl0t9RACVb7zDVsmdDN2QGtMqcFS+poWoK1lQJsjWjv7KpZeAHSk
	 ZVr8zmhHV2/PZaGzHyn6T59UekemJrS5OIkgredV3WHHwDbfFacU6D55uImbKTJZkv
	 Rr1fBTjKf66aLN3FXh9tJtsGF0WCZW6LO7NYk34ib73wX7jtKR6ZuD447qikH+GCwF
	 wAm6MSV58RrRj7epuSfylBt94azyMmISkdnV8LAg6HahlKdHViQBihsn/WGPPVr/RG
	 m+rOW1ME57Gps8OoPKtBp760PfcQnqW8FQoTNmgPFMzgatuDanDulrKi16njfZMD4/
	 wR9xZ9QHy29ag==
Date: Sat, 26 Sep 2026 07:10:03 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 04/11] phy: rockchip: usbdp: Factor out lane_mux_sel
 setup
Message-ID: <wwybb3nfv4tawgh7z3s2iunlm7cgh4cindkoy4bhlemnlivslu@rttrqzbvj6hb>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-4-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-4-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:07PM +0200, Sebastian Reichel wrote:
> Avoid describing the USB+DP lane_mux_sel logic twice by introducing
> a helper function to reduce code duplication.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

