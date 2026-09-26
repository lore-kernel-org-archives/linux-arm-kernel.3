Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323B0C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs86mSw57dq+/rdX8lcMX883ksi6aUdvw3n+ATyGask=; b=WGsqxdgjTJ7IY7xKQNGBrqpsyG
	xjNpsmw6wlaFNRReenTvy6U8mP/cJRai8ezWT2YhtkIpx+48EnbIOvyT7pgpP+AFxDQMTQ90KvgO2
	Ty0l+81WIJ7PhIHlJJC0qJYX1fr0eCfL/81zr0qiTVBG72vErE0Y/NTdHvCnVsJgCRKrhtNnDfKnW
	+0tnrT2WTZ0J4kkjPIr+5XdcOUlAoKeaikv5RbRAvWxShkW8PsOOpvuVxjbwHYCSPZMpBqEm3vBUV
	IWYh6LeU+S5wYO6a0ygF/zj/sCST6wVWvQ4yVeIrppLIRbPhlhaQ1zyeCXty8xA1m2vtyhGuAB7bG
	HwdQ2nIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKsy-0000000F1EQ-0y1u;
	Sat, 26 Sep 2026 05:23:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKsw-0000000F1EC-2lif;
	Sat, 26 Sep 2026 05:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 248F043EBB;
	Sat, 26 Sep 2026 05:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9DE1F000FF;
	Sat, 26 Sep 2026 05:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790400222;
	bh=Fs86mSw57dq+/rdX8lcMX883ksi6aUdvw3n+ATyGask=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=da4X7oGHdG4/YsqtXt/fW30+txiAsXQFf0YpnCZL7uLkcnIeH7+hAtCFqFUzxXKaO
	 SYZ3SzNcKm6lK3HB2Z/VDr6hr8fIxVDwipRgCnqNMTRAX37n5v0127K/rc8B5glCw3
	 3gGGq1ad6pX1eb5mBMC9z9Jf7VA7xDoW4D1/D1t6+qtF6EFu1ORXGlZtK95nMdfbpv
	 eoXxn1CCL6X0bGUm56ZJI2tdEOJL7A1m/R5y8VNI+OloW4lVzFdn9GeIOoHoP5q7WU
	 ACuvM2GjssogUkez97vvuG8f1hGZs6dT3fNvbH7lI3lvssckYIDGjEo66fxxkW+D96
	 Snql6kfCyvH2Q==
Date: Sat, 26 Sep 2026 07:23:27 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 10/11] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
Message-ID: <zkeoutxzqdw63u26ja4fm3yychnp5hyiohsurtwdarcjtdiunq@5r6ll23dokgo>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-10-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-10-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:13PM +0200, Sebastian Reichel wrote:
> Handle rk_udphy_reset_deassert returning errors to avoid theoretical
> (Rockchip reset controller driver does not return errors) SError.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

