Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D934C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuRdi71y/Q07Zr0MBc7GJWjk7RuWsv+BfUkLAdyG/cU=; b=nEmhG8LdaMActLbJgbymVHFmjV
	L2lCBQx+w5hvBNobsTbHmOLtZIc8++MJgt1GvLNpnQmtlaQSR0VhqJnG4ls4258VIQwSC0C3oUC0n
	RmMJuQNu2ZpkPnh/tSpCskdqdmrCdsnS3qcAEBvt82CKRolLhHXcHnoOi2JEa9RoeWVQLpBiBLv6A
	QgLxeW6CsMvytmKaF6lHThRIyMCxXLHRxgpRsf+WMqdwdLzAdxGpxoTdkgFtUZYR2QJGgBvKuizgi
	W2VJ/AkuQotKIQuE4J5wl43z3yJQ9WT9LB+J9MKN9noT47TCdrlCfo7NN6v2CYgeUyy3g51VTH0sN
	DqbHb0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyhC-00000005v96-0Mwa;
	Thu, 06 Feb 2025 10:01:18 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxa0-00000005klz-1A6u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 08:49:50 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 11157240027
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Feb 2025 09:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1738831785; bh=jPsZI5mGjV5SQeDpUeZhPHMKEgxep0dBQJt2kniVRtM=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=okwT1yJMpew7qqsIlIS1VzDGc2yUZDKSFQ+eXroWLNmyrTm7mKusTnCsEuKQArbdF
	 noebHCcA1niCQAVKFfF+fPgvJeMwsSu0zQh3hQZ0HCJOCR2JYvbbWBoEPWkgsrMcrh
	 OabqwoSiUW3SKfCwGcH1Rs5kNTZaCOWwULe0fvYlut5mgDZAdcAWCNFc9PWOuWi8vM
	 RdY6F479b0GbfG784A06nrW3jR+xS/gkKIvcKnxChjryRu0aWWkSDPGFOyPSkik+tJ
	 bPklsF5FYcAW14kDH4Lz9Sqf7ol5JlVD4iJ7GEBfvQz0TX3KB77G6QpqKPRXkWDS/N
	 KNGLzpJixDkXQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YpW4k32JTz9rxF;
	Thu,  6 Feb 2025 09:49:42 +0100 (CET)
Message-ID: <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
From: Martin Kepplinger <martink@posteo.de>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 shawnguo@kernel.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 08:49:37 +0000
In-Reply-To: <20250205172957.182362-1-martink@posteo.de>
References: <20250205172957.182362-1-martink@posteo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_004948_473046_B293EBC9 
X-CRM114-Status: UNSURE (   9.30  )
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

Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin Kepplinger-
Novakovi=C4=87:
> media_pad_remote_pad_first() return NULL if "no enabled link has been
> found".
> Check for that.
>=20
> backstory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12
> now and
> I know the hardware works on an ancient nxp-kernel),
> I tried to enable the sensor link, set formats and stream:
>=20

btw, that's roughly the
driver:=C2=A0https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
that might need additions to with recent mainline kernels. Will the
sensor be the reason for the link not being found here?

                         martin

