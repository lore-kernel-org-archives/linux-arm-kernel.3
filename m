Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C638CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahcojl+A6ntFnOChIODr49z1OKuZ64mcv5dRgxrqT/E=; b=C78BGvMFEp+sLIls39ChZLYMRU
	L5S3sXBumt2Q3/Chgku8C15Z/WFfWOaHnZY1WJaBXYB8oJNUbCSiZ18Ty/OI0MBQ6stQ+5vHxNPfa
	8DkC+5nSCr63C6WLjIxO58/64yDRjWsFR5tDsxn0PBf0E+bx98rbP+VgICvMugKolUM5mZNJEqVYG
	/u5IYTu3TAA63+4WioQSzcz9tNJE1hUSxsRqAazTxpKAQQ1dJnzFQC58YQHFyp/a0S74Z09jpytYB
	/mD8+8N1zS5OhEXXGEGrFAXGcJaKGmpI/hodHFCVfBiR97AMFWNe3tq3LIIXjS3jXQ7BftldHsGeP
	2QcF2D3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQMT-00000007103-3b7z;
	Mon, 25 Aug 2025 06:07:21 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQIl-000000070Yl-2jAu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756101811; x=1787637811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ahcojl+A6ntFnOChIODr49z1OKuZ64mcv5dRgxrqT/E=;
  b=U73ZJleo+LxCuhAuvaJt0OYgs+ulfAqXytfY0OtvaHCjG63w53H1y+XP
   T2HTI0sUnQdljo0UNtFFgH2lDqoxdgbVL8v20WvuwXrBJwde/urqKBi1k
   /O66rSJMSaelV9KtDYeEHE9S2y7FUgK5LkaExAyneuz6Or+orxe6uigQh
   L3ejzxprpyX4748NzNoTUhbWAIGciya8jpe/FY/rkImQ/slhXHbeg14ot
   34a+LWYVr2UFakWdk23Qcw1u+XEbV6KJyudxDPzqbs4l3CGr9rtV48EGp
   BBMOBn9Vf7jwfyVZ6oZw64hYL+s542QXbzBb02dbKmxvJ1p6xVRAq5ug9
   g==;
X-CSE-ConnectionGUID: eYXtE4gxRt2fo178KhMmRg==
X-CSE-MsgGUID: xloUEWyOQDS5nhRBjgVz5g==
X-IronPort-AV: E=Sophos;i="6.17,312,1747692000"; 
   d="scan'208";a="45884087"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Aug 2025 08:03:26 +0200
X-CheckPoint: {68ABFCAE-C-20CAA7DA-EC9DC758}
X-MAIL-CPID: 8FDA0A8C775CAFACFD752DE80AB64A2D_0
X-Control-Analysis: str=0001.0A002101.68ABFCAF.0075,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3D58166F33;
	Mon, 25 Aug 2025 08:03:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756101802;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ahcojl+A6ntFnOChIODr49z1OKuZ64mcv5dRgxrqT/E=;
	b=TJu4Y3GhOjRZs63dqoFYNkLsTObb3F581GDE3GRgJbOt00TmHkQxj7g3QbFb9TMrrVnDYL
	q60DCmI4I1PUjRHoIGgxZ4jrdL3Se+wXjABYlNv0YnmAovfCuDyfaZPzWyrCqvhnlHDtD8
	8JVDBIdxkJ+wDcx2pE3kCFl4sfUege7EUg7vEPGG7hioaxP5RFCRaMjp/hnopuL/+mAJiL
	0ujtYovNiA9giSiEM/ngzhM1JouznmkwIx3xtS50HaNXbOxw/TKFb2l9zu3WbjTn78x8QC
	bfx5RGl8/rHuJ2CY/fpi4OqKv+qIBKJWdCE8pA56NxE0tWaEz6ehpdH30EI/XA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Mon, 25 Aug 2025 08:03:19 +0200
Message-ID: <2800962.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <dc6af2fc-5e7f-4ec8-a7aa-6bde6518a83b@kernel.org>
References: <20250822135715.3335023-1-alexander.stein@ew.tq-group.com>
 <dc6af2fc-5e7f-4ec8-a7aa-6bde6518a83b@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_230332_178960_E0C3019C 
X-CRM114-Status: UNSURE (   7.06  )
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

Hi,

Am Sonntag, 24. August 2025, 13:26:43 CEST schrieb Krzysztof Kozlowski:
> On 22/08/2025 15:57, Alexander Stein wrote:
> > MBa91xxCA (imx93-tqma9352-mba91xxca.dts) features a USB attached WiFi
> > module. lsusb says:
> >  ID 1286:204e Marvell Semiconductor, Inc. Bluetooth and Wireless LAN Co=
mposite Device
> > Enable the corresponding driver.
>=20
> This does not answer my questions. You can plug there something else...

It's not pluggable, it's soldered on the mainboard.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



