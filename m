Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCDDC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlLHZIgUEXLJ1A4VhDTFiqfve7pfF8vpaw5UvbfUxiE=; b=3lm8Pji41NDzr6439hYiioKFm2
	OLiOA+kUadT8dfsmbMcCgofUyMfMyzNWq+kvNJgrtyhMM/E3vPt6je454S00bCZS3K/A4eSmuaK+j
	Ut4BEV13xUC2yfqhghL4GtiwLTM85bvf4c5b0hQoJ7hHQrPyXg+MgVDYdjiRq6wrZdVAiINIlcVOb
	mUI5TTYl2BW/pG4odE7Gxy/iGvQzStwUPLEfJ/z90KGa3clevj8RkHwcu3tXnDDndzJ5BtjtguoS4
	l8TKxVvXqDjVfkiacZ9MCshofO5AT87C6y3c4LCEdy0RPSpHdHcxQobT9iEXUa1FArB6VQY1RTg2t
	3O/VOZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseRD-0000000Adbu-2UmW;
	Thu, 13 Mar 2025 09:01:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tseGW-0000000Abah-3JRT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:50:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseGN-0001Gu-AA; Thu, 13 Mar 2025 09:49:59 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseGM-005VRT-2g;
	Thu, 13 Mar 2025 09:49:58 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseGM-0003wf-2R;
	Thu, 13 Mar 2025 09:49:58 +0100
Message-ID: <d138f147c5df4091418ba8131cdc02c349c7d0ef.camel@pengutronix.de>
Subject: Re: [PATCH v5 7/8] reset: imx8mp-audiomix: Add support for DSP
 run/stall
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org,  shawnguo@kernel.org, mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,  linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
 Frank.Li@nxp.com,  peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
 iuliana.prodan@nxp.com,  shengjiu.wang@nxp.com
Date: Thu, 13 Mar 2025 09:49:58 +0100
In-Reply-To: <20250311085812.1296243-8-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
	 <20250311085812.1296243-8-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_015008_883437_E1948471 
X-CRM114-Status: UNSURE (   6.94  )
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

On Di, 2025-03-11 at 10:58 +0200, Daniel Baluta wrote:
> We can Run/Stall the DSP via audio block control bits found in audiomix.
> Implement this functionality using the reset controller and use assert
> for Stall and deassert for Run.
>=20
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

