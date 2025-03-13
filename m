Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1AEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djoLAWNyhhO2lylAA28mTlLilzhZWgTk0K3RY4QaoiU=; b=oG6mlgJscssCLadsaS6mpqcVAe
	TkFwftH0wGrfRGCN87aJ/D4KF/ucJbQSmiaPZgpBzOdh4x2+ZdGH1dH57bv0SEE8V1MBKCYDe7yzf
	Z4KsBG92Tj4luIdj5O6oACwcu12ogH/EIe2QlJbsc4Kz56lWsTzt/ZFul9ZAWkVd0cr1xnjEyYg9y
	hJsMsqABWC7BAFhv2lbd3EEAb9qH5bu/ENmqWbXqP390rzI4nSkJkKPA/N9yL3Yt5Dyd7oN1hN5m5
	NNaf5qMxJCEVy4YqfTc+B3xh5TC5Kam+J9QjCLuFbssdctizwk3dvyRp3bOiF854LGTCHqc4PUjHF
	N0ZNXGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseAC-0000000AaSI-2hTV;
	Thu, 13 Mar 2025 08:43:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tse6Z-0000000AZXj-0sfX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:39:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6J-00085z-03; Thu, 13 Mar 2025 09:39:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6H-005VQC-0X;
	Thu, 13 Mar 2025 09:39:33 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse6H-0003PA-0M;
	Thu, 13 Mar 2025 09:39:33 +0100
Message-ID: <5849017e43db7ece72463f5c84854386aa7d8e9d.camel@pengutronix.de>
Subject: Re: [PATCH v3 02/12] reset: imx: Add SCU reset driver for i.MX8QXP
 and i.MX8QM
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dong
 Aisheng <aisheng.dong@nxp.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rui Miguel Silva <rmfrfs@gmail.com>, Martin
 Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Date: Thu, 13 Mar 2025 09:39:33 +0100
In-Reply-To: <20250210-8qxp_camera-v3-2-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
	 <20250210-8qxp_camera-v3-2-324f5105accc@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_013951_241847_62BA4F33 
X-CRM114-Status: UNSURE (   6.55  )
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

On Mo, 2025-02-10 at 15:59 -0500, Frank Li wrote:
> Add System Controller Firmware(SCU) reset driver for i.MX8QM and i.MX8QXP=
.
> SCU Manage resets for peripherals such as MIPI CSI. Currently, support tw=
o
> reset sources: IMX_SC_R_CSI_0 and IMX_SC_R_CSI_1.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to reset/next, thanks!

[01/12] dt-bindings: firmware: imx: add property reset-controller
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D778752759bd0
[02/12] reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D6b64fde5c183

regards
Philipp

