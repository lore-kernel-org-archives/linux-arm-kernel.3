Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F92C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5sus/GX7E9j3HiiTuXs0UmRHZaMZps1dyT/Km76kctw=; b=HPTl9umhD8FoFrK8vdFpLWwIET
	2e5oO3CsvkOKDOvA6EDcl43PdHRFW4pItwKKvbVhchjcvtsQ+kbiZx+vCrZtgy310GahuyEw0q/m4
	UfC/e8lOiebAr8InGCUQwR0tg1wET6VDpvtbz/qASB9Bm+k1ZNEkoJvV8j8MmddcadGSZEUZQ8ks/
	kgLTNTdHWLF1Ucc2pjMuiJtOmJyRIHyatYE408vDVSIH53Wfb30Z3RMx39Nv6ZQObsOvnHtN7vaTr
	LJcDCLio9HxXlvV4clH3teS3nQL9Bprqv71J9su2DzwGTbFdZEh7sMIIvgRoftQJzfEE8Ja3e8gIV
	zXUeodQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tse21-0000000AYtp-1sGZ;
	Thu, 13 Mar 2025 08:35:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tse0L-0000000AYgN-0RoD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:33:26 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tse0B-00077f-6N; Thu, 13 Mar 2025 09:33:15 +0100
Message-ID: <7ba2e429-113d-4e1c-968b-ffbe65bcf9f4@pengutronix.de>
Date: Thu, 13 Mar 2025 09:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "barebox@lists.infradead.org" <barebox@lists.infradead.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [BUG] drm/rockchip: vop2: uninitialized variables passed to ilog2 and
 writel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_013325_135973_CDD1ABAA 
X-CRM114-Status: GOOD (  12.16  )
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

Hi,

Running clang-analyzer[1] on the VOP2 driver in barebox[2], which was ported
from Linux reports that following variables:

  dclk_out_div, if_pixclk_div, if_dclk_div

defined in rk3588_set_intf_mux() and passed to rk3588_calc_cru_cfg()
are given as uninitialized arguments to ilog2() and in some cases even
used afterwards unconditionally (outside of error cases):

  - dclk_out_div: is not initialized in the HDMI, eDP and DPI cases,
    but is passed to ilog2 unconditionally and the result is written
    into the RK3588_VP_CLK_CTRL register

  - if_pixclk_div: is not initialized in the DP and DPI cases,
    but is passed to ilog2 unconditionally.
    However, the result seems unused.

  - if_clk_div: is not initialized in the DP, MIPI and DPI cases,
    but is passed to ilog2 unconditionally.
    However, the result seems unused.

I checked against Linux v6.14-rc6.

I am not fully sure what a suitable default value would be for the first
case, which is why I report this without a patch.

[1]: https://lore.kernel.org/barebox/20250313080950.3222757-1-a.fatoum@pengutronix.de/T/#m78ca98c01b73ef7fe3316e73ce62cfe4b2c111d0
[2]: https://github.com/barebox/barebox/blob/v2025.02.0/drivers/video/rockchip/rockchip_drm_vop2.c

Thanks,
Ahmad
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


