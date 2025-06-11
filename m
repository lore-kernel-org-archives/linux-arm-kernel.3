Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F1C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ezVxbmekm9/g4ysQqa2hM43KCRAzREg88IlWc8iOws=; b=Ch3o2EKhcvLPHolFibny80EU9j
	79+/AMt8px+OltnH0/6rzeWlfjxNHQ5vOAnUU93M0cGdXWbIMaYjjmOr9ZiOCLLUQ4eN932ReXzpJ
	/Q7xFDSmTetBHdKqe8XHItyPUfF+DUx+SQSlPrkoZzz1iQaPx59CCcuJ2etOqeZTLJM5kdnMWDqTz
	NB4tvJBz67WyvPp8flFn0P6myzZDfklNasj+oYbGyPjPhtiHUpfZ8kKlCvwNxuwK9MsmU1kQwtA70
	bJ6ZBmW2rbiVxh6HqifImSuL6bRqoYuhGrW6n3B2tQFpcQhvJExABJMMaD2gwWhb2E2EsNOSrYjN+
	yNcdoaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG8z-000000099Dl-3rgU;
	Wed, 11 Jun 2025 07:45:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFxB-000000097Dn-3wlH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 07:32:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uPFwv-0007lf-9R; Wed, 11 Jun 2025 09:32:41 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPFwt-002uFg-1G;
	Wed, 11 Jun 2025 09:32:39 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uPFwt-006l8F-0q;
	Wed, 11 Jun 2025 09:32:39 +0200
Date: Wed, 11 Jun 2025 09:32:39 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] PM / devfreq: rockchip-dfi: add support for LPDDR5
Message-ID: <aEkxF2Q2lBdfmUuJ@pengutronix.de>
References: <20250530-rk3588-dfi-improvements-v1-0-6e077c243a95@collabora.com>
 <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-rk3588-dfi-improvements-v1-2-6e077c243a95@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_003257_976728_89A26840 
X-CRM114-Status: GOOD (  34.72  )
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

On Fri, May 30, 2025 at 03:38:09PM +0200, Nicolas Frattaroli wrote:
> The Rockchip RK3588 SoC can also support LPDDR5 memory. This type of
> memory needs some special case handling in the rockchip-dfi driver.
> 
> Add support for it in rockchip-dfi, as well as the needed GRF register
> definitions.
> 
> This has been tested as returning both the right cycle count and
> bandwidth on a LPDDR5 board where the CKR bit is 1. I couldn't test
> whether the values are correct on a system where CKR is 0, as I'm not
> savvy enough with the Rockchip tooling to know whether this can be set
> in the DDR init blob.
> 
> Downstream has some special case handling for a hardware version where
> not just the control bits differ, but also the register. Since I don't
> know whether that hardware version is in any production silicon, it's
> left unimplemented for now, with an error message urging users to report
> if they have such a system.
> 
> There is a slight change of behaviour for non-LPDDR5 systems: instead of
> writing 0 as the control flags to the control register and pretending
> everything is alright if the memory type is unknown, we now explicitly
> return an error.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 84 ++++++++++++++++++++++++++++--------
>  include/soc/rockchip/rk3588_grf.h    |  8 +++-
>  include/soc/rockchip/rockchip_grf.h  |  1 +
>  3 files changed, 73 insertions(+), 20 deletions(-)
> 
> @@ -147,21 +200,7 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
>  			       DDRMON_CTRL_SOFTWARE_EN | DDRMON_CTRL_HARDWARE_EN),
>  			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
>  
> -		/* set ddr type to dfi */
> -		switch (dfi->ddr_type) {
> -		case ROCKCHIP_DDRTYPE_LPDDR2:
> -		case ROCKCHIP_DDRTYPE_LPDDR3:
> -			ctrl = DDRMON_CTRL_LPDDR23;
> -			break;
> -		case ROCKCHIP_DDRTYPE_LPDDR4:
> -		case ROCKCHIP_DDRTYPE_LPDDR4X:
> -			ctrl = DDRMON_CTRL_LPDDR4;
> -			break;
> -		default:
> -			break;
> -		}
> -
> -		writel_relaxed(HIWORD_UPDATE(ctrl, DDRMON_CTRL_DDR_TYPE_MASK),
> +		writel_relaxed(HIWORD_UPDATE(ctrl, ctrl_mask),
>  			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);

You could move the HIWORD_UPDATE(ctrl, ctrl_mask) to
rockchip_dfi_ddrtype_to_ctrl() and by that you only have to pass one
u32* to that function.

That's just nitpicking though, so for the series:

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

