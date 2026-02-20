Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1149FC55ABE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nj4Sruc+lNxj7h2GpORgNoUmKB3DGWmmf6h/HT8p8z0=; b=NsRPbrIO9txQXa3MVTFNC0X0gp
	UASk4WtAyjwTiZbNTKiMwPIt+cYTc0jIVcvzQijJRKaVgmaZDyXGjwU718nMIZ+/CdLLIjiHaOxhd
	wF/GVlkIoAWlPa8/RrETZe5x3+jhrPwwdTNZJSh9jwt/Ya0Ys8/dBimUFlHU/3bEfdqG7V/0kysUk
	xPpaIlJSb5sVgT9nGQR4AN1GCUXuPnZcIbFciJMEnX2Db1E0+JB113z4z3tpbtLFF5fLmDL2+AWeI
	WyiXiRl8lSa03csetCA89ep00EDag5QJKDRfS2qKXxkpfdHAiJwxOTqJIGticcDycyOtN9VV2l3oe
	ArFBDCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPsN-0000000EUgN-0w8k;
	Fri, 20 Feb 2026 12:44:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPsK-0000000EUg3-0Y6h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 12:44:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 60AD6C1E4AD;
	Fri, 20 Feb 2026 12:45:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 864745FA8F;
	Fri, 20 Feb 2026 12:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55D29103688C4;
	Fri, 20 Feb 2026 13:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771591487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nj4Sruc+lNxj7h2GpORgNoUmKB3DGWmmf6h/HT8p8z0=;
	b=eImEQMnnz2rGoBWZL9YrluPhipygkv4r0wZE/3lz+jzY2fGTp0aUQAqiL3K1m9SLpLXurO
	8XFdf8Qgl5JrTzz1/JBWg65RpUWuZVN7UFxWHBa5vg0bh5Scu4tPDW1UN8G/dfSOedJyoC
	mznnCBS1Myc6fzgH4WJQxLYDuLQDxh+9coX+vToxA3MIkkVLXp3fauEh78wDyMctSACVxt
	vuwP9Dt16KaZAx594tXvgIixq7YICPcx+9I/jP58MPPwoaYEks6qBEV+vqs3jBL4nz8Bq1
	cB+SpHXp7wLyzQoBuSWAaJOXCc6FLj+V0jsLSnlO74dQE+gaU9nf8xrfzJOPmw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, louis.chauvet@bootlin.com, Chen Ni <nichen@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260204090629.2209542-1-nichen@iscas.ac.cn>
References: <20260204090629.2209542-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/imx: parallel-display: check return value of
 devm_drm_bridge_add() in imx_pd_probe()
Message-Id: <177159148142.510757.5758922562967714281.b4-ty@bootlin.com>
Date: Fri, 20 Feb 2026 13:44:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_044452_617349_36B14C96 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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


On Wed, 04 Feb 2026 17:06:29 +0800, Chen Ni wrote:
> Return the value of devm_drm_bridge_add() in order to propagate the
> error properly, if it fails due to resource allocation failure or bridge
> registration failure.
> 
> This ensures that the probe function fails safely rather than proceeding
> with a potentially incomplete bridge setup.
> 
> [...]

Applied, thanks!

[1/1] drm/imx: parallel-display: check return value of devm_drm_bridge_add() in imx_pd_probe()
      commit: c5f8658f97ec392eeaf355d4e9775ae1f23ca1d3

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


