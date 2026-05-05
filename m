Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24923FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoY2xl3WFQWDPWBsQnDWvIzJN3zB4He4FVO7nRAlbIM=; b=FFfBaazdd8T/rAKok+/bWj3TFN
	gJu4Rwcv6mJNOG7xal7XT3jB6D+/KXvZdrrGn0pYOldnOPsiH0AKQ4L6/kW4D2Hx9DeQr+1jVq66I
	cz3hpd2QMGAhcVtCVXUlDHM49Xg67ALCTiPZYWVvl7Zp1boGwhZ7ZELGn5DovNO2qpiwDeTO2FBpm
	q2qcGAUZE+SxuHowVAzTVHrVoUAHOVxuapmZ7nNJtxzyyUtzoWlcU+Rm1zYp6bXkrUutb/zlZYdbN
	20mOMGfYkwynlZomKwKPhivIVqEZt777gOh84SgA/G0DMhZiPGX0VMtVRYdsCxwmwxHQcQTO7pCHv
	pNhTCvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHoa-0000000GfXX-2aHi;
	Tue, 05 May 2026 15:36:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHoY-0000000GfX1-3evm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC16D60181;
	Tue,  5 May 2026 15:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8A7C2BCB4;
	Tue,  5 May 2026 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995361;
	bh=XfXn5vFpNRL3BzSGTKkMxL3IKOMOJehLm1MshbVDa3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AWDQxVrn13Dvi2p5cBg7DvmBVJECkUW4KGkAuj/2mzPUAQ8/5XITfB8CAIlIVBWup
	 Ym7PULgVTijEOvsO5cJYpCZ6r6ErO8w+MlMtnc4xgvFx+znUvTZIIwWkwN0p4jfzoG
	 LWo5oINKYkWM9mX1HRZM1eRfgzgHIaJqbHlKSuEvQH11CNmV5fWMtpVELw+9aATTME
	 MKcN+LLmXSoPDoOUATagrCgsxKkmqNBJGEegbhF0Bm4+DtxHhEC3oOzhX7JvYvO8kI
	 QJL8T3MzE6XL3k2JjgzSMpsry6FmGG6iE5SPeLAMDZCdqVufAMdkK02Xn+AHz97wwt
	 yB7BwDwIaOx/w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/2] firmware: arm_scmi: imx: Support getting reset reason
Date: Tue,  5 May 2026 16:35:53 +0100
Message-ID: <177799528962.2896536.13143365004665388354.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 05 Mar 2026 09:56:43 +0800, Peng Fan (OSS) wrote:
> i.MX SCMI MISC protocol supports getting reset reason per Logical Machine
> or System. Add the API for user to retrieve the information from System
> Manager.
> 
> Documentation: drivers/firmware/arm_scmi/vendors/imx/imx95.rst +1542
> 
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: imx: Support getting reset reason of MISC protocol
      https://git.kernel.org/sudeep.holla/c/dc7ccfc86c1a
[2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
      https://git.kernel.org/sudeep.holla/c/c17216c1a922

--
Regards,
Sudeep


