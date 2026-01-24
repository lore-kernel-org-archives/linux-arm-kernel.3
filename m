Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93678D715F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 20:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYADJ7a3tOQmNGWyLcUEM0xq6x1UhQsh9aMmN/qvP40=; b=n3q2k2B2Uqk9jaqrvrLf/fkF9r
	r82FzJ6pcHc1aP/4zO5iWvfb5Dxx1+g4BPpPmhUmhhVmq3hqB14WOMP8fWmVG6woBWvuutHCrQblW
	UtNq5Ori7wkemENmGnN35Ht7Bi5A6CL1rLr0BOeN0dbOhJ10xMFbvAEgjCjxgbPHI4I3HZf5K3jcl
	hvzKJwZyYwJjwFBh68aZlYIn6w2rX5LQqByBK48h+uKkC/+BB3owsYw5svK67PiCoDtvBHgYTfXy6
	i+6SahF32XsIdRpqjysdW1rB45udgrq0hwOgO8IJvaE5jklZXxhWd1M0YBAWvTLuylHpu9A8R93YR
	wEo4994A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjkOi-0000000AW7L-0Ny3;
	Sat, 24 Jan 2026 20:38:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjkOb-0000000AW6u-0end
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 20:38:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1vjkO3-0005Oc-09; Sat, 24 Jan 2026 21:37:39 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1vjkO2-002JL1-0a;
	Sat, 24 Jan 2026 21:37:37 +0100
Received: from pza by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <pza@pengutronix.de>)
	id 1vjkO1-00CvHY-1B;
	Sat, 24 Jan 2026 21:37:37 +0100
Date: Sat, 24 Jan 2026 21:37:37 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
Message-ID: <aXUtkR0J0cK98ZQQ@pengutronix.de>
References: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_123813_218657_18032C4C 
X-CRM114-Status: GOOD (  14.00  )
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

On Fri, Jan 23, 2026 at 10:51:26AM +0800, Jacky Bai wrote:
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, the ADB400 interface must always be placed into power‑down mode
> before being reset.
> 
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
> 
> To avoid this, refine the power‑domain control logic so that the GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power domain on/off sequence. This ensures proper ordering and prevents
> incorrect ADB400 reset.
> 
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

This fixes a sporadic system freeze after a few hours of alternating
between GPU activity and GPU runtime suspend that I could reproduce on
i.MX8MM since commit 055467378bf1 ("driver core: Enable fw_devlink=rpm
by default").

regards
Philipp

