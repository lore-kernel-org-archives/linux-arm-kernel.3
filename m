Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D193C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuLTNu10t9Op8BVt2TUYGYUes51ASXSsTqsYh2FmfbA=; b=A2p6YKWMBn6Gtn76DtU9K88IZs
	Nlzo3mMxG9Y9SXu1IDhp8Fi+bps1J0WU18tnv4yy8wiw6Bt/HM0GtnlkIpqLMH2kFbRWXQy2Y9hEs
	LrUeo/gO94/zKqho+YnCvsUKKXigzQXivfTK+1BIxPC+YnW+pms+gYF3LBGJpBj+jTj5V1e8MYijh
	3wMNS2hxqeWfwVIfTNphyAjt3eiTZAauNkKB0FZMtvezx4MtonglUCZGGQCEl67NZzOLil+Py6c8C
	nCLQ5sdzDNAOm0mbCUbnxrtLcKkCikUl9K6/u+/2SFYRUlNWC22YBsTBIEgY1L01SGp/cZrBRdeyJ
	Ul1Vegag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkImq-0000000CB4E-1klg;
	Mon, 26 Jan 2026 09:21:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkImo-0000000CB3k-18DY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:21:31 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1vkImW-0000cv-MV; Mon, 26 Jan 2026 10:21:12 +0100
Message-ID: <255e1946a67efadf13f468fc24c907074037a45e.camel@pengutronix.de>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
Date: Mon, 26 Jan 2026 10:21:11 +0100
In-Reply-To: <CAOMZO5Ag6jtVqeXW30QNy5+1ykmGTt4G8DxcsyOUMvNaeJf5Ug@mail.gmail.com>
References: <20260123-imx8mm_gpu_power_domain-v3-1-3752618050c9@nxp.com>
	 <CAOMZO5Ag6jtVqeXW30QNy5+1ykmGTt4G8DxcsyOUMvNaeJf5Ug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012130_321562_22342478 
X-CRM114-Status: GOOD (  13.42  )
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

Am Samstag, dem 24.01.2026 um 18:20 -0300 schrieb Fabio Estevam:
> On Thu, Jan 22, 2026 at 11:51=E2=80=AFPM Jacky Bai <ping.bai@nxp.com> wro=
te:
> >=20
> > On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> > domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> > also triggers a reset of the GPUMIX domain, including its ADB400 port.
> > However, the ADB400 interface must always be placed into power=E2=80=91=
down mode
> > before being reset.
> >=20
> > Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> > handle dependency ordering. In some corner cases, the GPUMIX power off
> > sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset=
.
> > This causes the GPUMIX ADB400 port to be reset while still active,
> > leading to unpredictable bus behavior and GPU hangs.
> >=20
> > To avoid this, refine the power=E2=80=91domain control logic so that th=
e GPUMIX
> > ADB400 port is explicitly powered down and powered up as part of the GP=
U
> > power domain on/off sequence. This ensures proper ordering and prevents
> > incorrect ADB400 reset.
> >=20
> > Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>=20
> Shouldn't this have a Fixes tag?

Yes, it needs to go into at least the active 6.12 LTS series, as the
patch changing the domain suspend ordering is in 6.10. Other than the
missing tags:

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Regards,
Lucas

