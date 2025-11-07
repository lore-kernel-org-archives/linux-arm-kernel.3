Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D679CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3MYsOwUR4ontrP/Jui3taLN5zLST+IKcpEwg+9F4BE=; b=N2v/5WSb2nXwQR0fZhPImatmvu
	iFUUAXzd27GBDZ3ftk9mhVV2rUNdZmQPGhC/6fVnrn6y/At/jCGPHdx0N1YgccDgfauvIrj7msVxT
	z/jqFyafYD2YTNsBpuwB70S7ocNqP7tWkRBPymDX9V4fgj5mV99e+p1kf1MC7RdRvSGzC47yLMlPa
	7nVYvfYdFn5rnu2f0ZSjdoqAAJK3U1xclucWGNrbA3pmw3EZs+gA9C/ZjGli3+9bqxNLLhfUPSPqY
	ITYUnNxTOIRRebKak3pSquSWaePboKZYAQTQ38YG/q85zsFmyoDRBDTsmoRXQ7imdUkZHurg15YKV
	6B6tz7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJpo-0000000H7Gw-01LN;
	Fri, 07 Nov 2025 10:36:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJpm-0000000H7Ge-1Ybk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D3MYsOwUR4ontrP/Jui3taLN5zLST+IKcpEwg+9F4BE=; b=gV8rahzo3FT0IPtZUy8+3MJK8I
	XJTt+CX1zoCWtixKSBkn3xd42GoG9u49xkK6Wg8SLuFiZ6w9dnEVkGe5Xu+JBIcwdwFh7iSGTtd73
	KwaTm66lFQysiZjhtaCjTz1b1LjY048dcN6DBrynni8aS/utY+dN2aYs08DDziCYsnmIcDnXCZnYU
	J7nKRfsnpz1jxzgV93NebXbJUKr2EdFvRfCmuYs4xJ+CsZSpNAAjwyD4/HHfyLdTcZEGwLVK1x5I2
	WajihWvbPplzTR4izypXFyKJIo1AzMn8Kw5FlF4OTqa/yU0HvuwEAgxTh5cg60aB0XuveRXIscKyX
	nG+5N7Hw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIy1-00000006CNc-2557
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:41:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJpd-0008P1-Hn; Fri, 07 Nov 2025 11:36:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJpd-007VwK-17;
	Fri, 07 Nov 2025 11:36:37 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJpd-0000000041V-14PK;
	Fri, 07 Nov 2025 11:36:37 +0100
Message-ID: <70dda82cef6a916475cf05e3c2e06b95b66402cf.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] media: staging: imx: configure src_mux in
 csi_start
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Steve Longerbeam
	 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Hans Verkuil
	 <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, Michael
 Tretter	 <michael.tretter@pengutronix.de>
Date: Fri, 07 Nov 2025 11:36:37 +0100
In-Reply-To: <20251107-media-imx-fixes-v2-2-07d949964194@pengutronix.de>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
	 <20251107-media-imx-fixes-v2-2-07d949964194@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_094113_814009_6D4F1F11 
X-CRM114-Status: GOOD (  15.77  )
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

On Fr, 2025-11-07 at 11:34 +0100, Michael Tretter wrote:
> After media_pipeline_start() was called, the media graph is assumed to
> be validated. It won't be validated again if a second stream starts.
>=20
> The imx-media-csi driver, however, changes hardware configuration in the
> link_validate() callback. This can result in started streams with
> misconfigured hardware.
>=20
> In the concrete example, the ipu2_csi1 is driven by a parallel video
> input. After the media pipeline has been started with this
> configuration, a second stream is configured to use ipu1_csi0 with
> MIPI-CSI input from imx6-mipi-csi2. This may require the reconfiguration
> of ipu1_csi0 with ipu_set_csi_src_mux(). Since the media pipeline is
> already running, link_validate won't be called, and the ipu1_csi0 won't
> be reconfigured. The resulting video is broken, because the ipu1_csi0 is
> misconfigured, but no error is reported.
>=20
> Move ipu_set_csi_src_mux from csi_link_validate to csi_start to ensure
> that input to ipu1_csi0 is configured correctly when starting the
> stream. This is a local reconfiguration in ipu1_csi0 and is possible
> while the media pipeline is running.
>=20
> Since csi_start() is called with priv->lock already locked,
> csi_set_src() must not lock priv->lock again. Thus, the mutex_lock() is
> dropped.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Fixes: 4a34ec8e470c ("[media] media: imx: Add CSI subdev driver")
> Cc: stable@vger.kernel.org

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

