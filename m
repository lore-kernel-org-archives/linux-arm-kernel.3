Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096A1C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rb/oEzPquB0AN3zNExVOUPkHhu2SKGcn8YilK2l8ikA=; b=D/QQ2DJKjewodTc4tu3XsZgdV6
	8KmjZBUlIQhFUbl2jPfkFd7nhUjcUjhM5rYiuhVz7B88jJgpjetuNRY8Pvsy8Wz+kcEVK4hxv2kQ7
	UgCf+IDvl8S7ePgLcohT1fGr9ZcnC8521/jvXYq2QjMK1IAoNTlOAm9RZvAFfMgknPmKInG9WiFSf
	pjM1j8fcmw7w1dE/yehqiZ4bZARM2Rd/QEqwzy5c6KtJARksORWYT6GXd8JbfdSG3d+qM+lL08oqf
	Ee5UxxHxYBqbaAMHdysWaqyHie5+Ub24sIjc3oMMLkf95TtPrH/m5Tg5jOV1c6RZd0Ifp/S/lcAdx
	HWStUqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJiR-00000007SrD-46LK;
	Tue, 18 Feb 2025 09:16:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJW2-00000007PTO-2kAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:03:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJVw-0005iJ-9J; Tue, 18 Feb 2025 10:03:36 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJVv-001YXQ-2k;
	Tue, 18 Feb 2025 10:03:35 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJVv-0002g6-2W;
	Tue, 18 Feb 2025 10:03:35 +0100
Message-ID: <15bbca6567ff640fdcfbe1a9525989887a94732c.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: verisilicon: Fix AV1 decoder clock frequency
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner <heiko@sntech.de>, Hans Verkuil
 <hverkuil@xs4all.nl>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, kernel@collabora.com,  stable@vger.kernel.org
Date: Tue, 18 Feb 2025 10:03:35 +0100
In-Reply-To: <20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com>
References: <20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_010342_684031_5A457BDD 
X-CRM114-Status: GOOD (  11.72  )
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

On Mo, 2025-02-17 at 16:46 -0500, Nicolas Dufresne wrote:
> The desired clock frequency was correctly set to 400MHz in the device tre=
e
> but was lowered by the driver to 300MHz breaking 4K 60Hz content playback=
.
> Fix the issue by removing the driver call to clk_set_rate(), which reduce
> the amount of board specific code.
>=20
> Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I was going to ask whether there might be any device trees without the
assigned-clock-rates around that this patch could break, but the DT
node was introduced with 400 MHz clock setting in the initial commit
dd6dc0c4c126 ("arm64: dts: rockchip: Add AV1 decoder node to rk3588s").

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

