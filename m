Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA33F8DFF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKGT8+oI5jlDL3ravEcBTgJNErtqCMhd0V3+TKrCmZc=; b=ohx1SWIWS4a7Nnew4+23Lf7Hn/
	DlC+Q6t+HFkEIyi/z/bErZ4dxwrZcXl3/aAM7pNZXgKRUuX5MYByHv2wnoewFyQD6kRMVpgVPUFlD
	rMqdR8Pf/NmCxKU51ejfhpkPlxetM+r9OaOdsQbBA479nRmP3IEQsaHwnzxrujS78bRR9VBtiwiCx
	QTmISVzU+RSW/t741g7Mu64cRGP32VeQ0yUT8fJ7xeuDpW8rw+Ea+aUIxdTlXEgq5GBMyXUzC1fZP
	XdkqbFGU9i876b/ggCGXIkewVkdVbcGbM5v3jAiivy8sQ7QQPAQLIrYy+PHICOOOAPhPafgGg4uzM
	xwIYE7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDert-00000003hlZ-2pQJ;
	Fri, 17 Apr 2026 08:48:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDerr-00000003hkJ-2uP2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:48:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wDerd-000563-6L; Fri, 17 Apr 2026 10:47:49 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wDerc-005osV-2o;
	Fri, 17 Apr 2026 10:47:48 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wDerc-0000000047U-3JDd;
	Fri, 17 Apr 2026 10:47:48 +0200
Message-ID: <2605c4332e8a3e8950b0b15fc5377423cfed4a1f.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robby Cai <robby.cai@nxp.com>, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 	festevam@gmail.com
Cc: krzk+dt@kernel.org, andrew.smirnov@gmail.com, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com
Date: Fri, 17 Apr 2026 10:47:48 +0200
In-Reply-To: <20260417080851.489303-1-robby.cai@nxp.com>
References: <20260417080851.489303-1-robby.cai@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_014803_733343_9F345888 
X-CRM114-Status: UNSURE (   8.01  )
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

On Fr, 2026-04-17 at 16:08 +0800, Robby Cai wrote:
> On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing=
.
> Writing '0' asserts reset and it remains asserted until explicitly
> deasserted by software.
>=20
> This driver previously treated the MIPI CSI reset signals as active-high,
> which led to incorrect reset assert/deassert sequencing. This issue was
> exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> release reset").

If this patch is backported without 6d79bb8fd2aa, or the other way
around, will that break MIPI CSI-2 on older kernels? That would warrant
a Cc: stable tag.


Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

