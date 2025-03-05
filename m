Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB77C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+jhkYS0TRz2o1la5b8D/3y4xT0VqD2+ekryj9z0zm8=; b=n93wx5WJGgnai/kFnWFtcUS7L8
	otZsUhFVF1xbo4Hkd6Il9fArJOb2XkZE096gR9R2mzG2xZNMDxwfb/iEbzNHM7L/ECYUjpdjs0LE3
	PmOXx5lYP6PkPEkBHTnLlAKFEqe5pS9mPZVmT/697kXCGmVYhW4kXVW+Qqib2Q5rKE/1xEs5L1UEc
	QOAOOH9l322y/OR61mjQWRpUcLQHqMErtxbtaQZMHSfmuzrnRn1omaxDmu174t1xMYvcxJHea2NKP
	oO1iMoiW7urUsrqzQ03/cWsiBKd0L7Ti7FYotCaBxL9op36DtV415Vas9it6MNocAW9y7MNZJYcht
	C4Ltx51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkhA-00000007SSG-1Vng;
	Wed, 05 Mar 2025 09:05:40 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkYr-00000007Qo1-1y1W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741165025; x=1772701025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e+jhkYS0TRz2o1la5b8D/3y4xT0VqD2+ekryj9z0zm8=;
  b=IddJe2SEfyJo/d011ZEG0752KYZvECgRL1IrZ5fWm+SPfh+NGFitiu5F
   M6QIXW2XvTsjmRf/U2i/asfgN/OQDf6RB8oqQk9nctlV4koAnryISzmSg
   pnuPSooZhO90l5/qzlr1kiZJiYP4DzOYat6V/aEYA57VOjTVsXJ4ZrhGw
   1LbgAALYDB4/ywCT88LI6u8VFjVS/TuGAd5CFzc2D+L1GgSPFxifCGzHa
   k7uT7hUXP9GCICvkZc/lwMprAxXMQr9J1+I8byEQqVDBYJcN95754NK1g
   ZKSjAJGFMvVw/nRKBbuGsEHVazVIGlVf4XF4xxuStDiXIzPBN2PgXCHRN
   g==;
X-CSE-ConnectionGUID: tRwjRDSeTueS95ISt5PufQ==
X-CSE-MsgGUID: Mp++ScJxRMCuLKwD8CNM4Q==
X-IronPort-AV: E=Sophos;i="6.14,222,1736809200"; 
   d="scan'208";a="42301545"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Mar 2025 09:57:03 +0100
X-CheckPoint: {67C811DE-42-F35B2447-E1635CDE}
X-MAIL-CPID: AD65E4B5510E62E90C988CDA2D9A3F96_1
X-Control-Analysis: str=0001.0A006369.67C811E2.0079,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57F63170E8E;
	Wed,  5 Mar 2025 09:56:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741165018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+jhkYS0TRz2o1la5b8D/3y4xT0VqD2+ekryj9z0zm8=;
	b=kD1rLRYVbR3w7K+GjtmEYISp04lQVjebsKh0ladQK1ogzl0H2UjpGi0i4ws1KRAWE9Ben5
	J/KK43vOQAQglcqLXMdTLik/Proj5m3Zrr6y8DiM1oZIWRBB+AU9hV4GTpuMlH4tRoYhMX
	f5qdmvq+GeBBXE8uYaflFBt9jBdLbEo3UfXoj39skcRBERlo3pvaNiVjxGtcRhWbfTSR5K
	ldNQG+ygagGit6y17MuQcwn+Nt3MgoKh7WsT/yCaOZmtosTKn0MDN1YFghS/w5IXgF6OcT
	xEJlW0G3MR6dajelV0nnEPPFgqVPU2SxMW1Evo+vvmhX1cvan1wM/aT4IxJX+w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] pmdomain: imx93-blk-ctrl: Scan subnodes and bind drivers
 to them
Date: Wed, 05 Mar 2025 09:56:55 +0100
Message-ID: <23858231.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250305-keen-shaggy-bullfinch-fc77fd@krzk-bin>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
 <20250304154929.1785200-4-alexander.stein@ew.tq-group.com>
 <20250305-keen-shaggy-bullfinch-fc77fd@krzk-bin>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_005705_996954_E3D9A817 
X-CRM114-Status: GOOD (  11.89  )
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

Hi Krzysztof,

Am Mittwoch, 5. M=E4rz 2025, 08:17:23 CET schrieb Krzysztof Kozlowski:
> On Tue, Mar 04, 2025 at 04:49:22PM +0100, Alexander Stein wrote:
> > +#include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/pm_runtime.h>
> > @@ -297,8 +298,14 @@ static int imx93_blk_ctrl_probe(struct platform_de=
vice *pdev)
> > =20
> >  	dev_set_drvdata(dev, bc);
> > =20
> > +	ret =3D devm_of_platform_populate(dev);
>=20
> This means in remove() you will depopulate in different order than error
> path (e.g. after genpd removal). This is rather unexpected - remove()
> should be cleaning up in exactly reversed order of probe. Not sure if it
> can lead to any issues, but usual recommendation is that you either use
> devm() or not.

Thanks for pointing out. I will add a devm_of_platform_depopulate() to
remove().

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



