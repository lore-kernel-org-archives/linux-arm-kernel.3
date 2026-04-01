Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E54D3514F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ign8BH+mfSDXyGFsdWSnbkmSAo0FIeOLr/WNbXWqZNo=; b=UuHwODhkyZ/RQrVi+mdBkTczGu
	U00nLJsI+EuuppHFa2srnmd52l4B/XTjg1WvF+wgcFR+MS1833de0ZzmPNJQ3Vm3Rzl5aIS7Fm/oH
	XfQUSXsoYUrq/ig9HImvuobz4O0AZ3ZQoKCALzKDSP6fD5RplPG+fDG+BBdxzDoEVCjfcwExrjsgN
	bIHyg35efScZsp4gHHjxLZjHgx2uL0K7LD8p89AWp+z697E98HL9/ESNV6PGrcBzYTyp/PFkMb4Tv
	QNzzHT55i2cFUbPx3uKOxuTXI4rdzF8TBWbOigbf2nPcp4BfN+rQIrmo2MoEmV5XoweRopsgRq1N+
	oDi6k8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qXS-0000000EGcd-2rzF;
	Wed, 01 Apr 2026 08:02:58 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qXO-0000000EGcE-14Pn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 08:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Ign8BH+mfSDXyGFsdWSnbkmSAo0FIeOLr/WNbXWqZNo=; b=XnhzjaLc9oezds1LCnGwb1JZdi
	xBGnuqrtNr7BvJPnP7lSR47hWnYBA7I9buCRu7+kTTA6XUax0J3Vgiz3ONcxk4RoegoiARjpHGu0U
	qj5kGscUn0FjG6073Y1wEnp/+zthaUlvNZplc2ZTJ++lrmX+co78HjYKcBcliv1kHKJUgO403ENPK
	PL8FJivmTcO7WcHJs/H/sqdgn1ALTuOfYygQeN7X30HnVZyuqJpf7j99QfKQg4nuJKFHnpJ/b3LHf
	8j9+6Z6WXO8wYSeZ05lz3iof733ul6Oh2Uq2T6fL7fIvKyJVU+omGvXUup/kSPMNcZvaBc6xP3gfc
	eBO+q0pA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7qXJ-00018m-1v;
	Wed, 01 Apr 2026 10:02:49 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w7qXI-0007AT-2N;
	Wed, 01 Apr 2026 10:02:49 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
Date: Wed, 01 Apr 2026 10:02:48 +0200
Message-ID: <1955363.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <40dcbb9c-15ad-4765-9f7e-40a571f98fb5@oss.nxp.com>
References: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
 <40dcbb9c-15ad-4765-9f7e-40a571f98fb5@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_010254_405319_63EE4961 
X-CRM114-Status: GOOD (  11.24  )
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

Am Mittwoch, 1. April 2026, 09:26:03 CEST schrieb Daniel Baluta:
> On 4/1/26 09:40, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > SION is BIT(30), not BIT(26). Correct it.
> >
> > Fixes: 7ece3cbc8b1ef ("arm64: dts: colibri-imx8x: Add atmel pinctrl gro=
ups")
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> What is the general attitude around using symbolic macros for pin config?
> Like here: https://www.spinics.net/lists/kernel/msg6072866.html
>=20
> I think there are useful to avoid this kind of bugs.
>=20
> If I get enough Ack's I can move forward and replace all magic numbers fr=
om imx dtses.

Somehow I completely missed these defines :-/ That's a good improvement,
especially as SION bit is "custom".

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



