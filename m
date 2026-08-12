Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405ECC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1suf9rH7Ekr2y2QrwVW+OuCixPo7Mqo7Tnrk3DdOUlk=; b=TNofB75678EjwgPAEmN3okmoMg
	9/WiFI18gs/0gFW6N8TfVvNTk7Y4LTtOpjl3vfQm1vVe+SaDsosEjxIhyMdep2QI03T2JFOchs8MU
	J66dsY5ShL2N8Q9r9J4Zf/jGj/lVdbWdxFJhSRc2OcuGQVhsPJzMkvKxQiCVhj2nBMPQLr6v/7bwa
	H3rtCN2W6Bv8afLY2ulsUhlRsFKiNWHV8FGrqJ3Llbw4WcE1QBY4kuDSaI9lZHKfvP54EWNhZBXHu
	BWD2MEWU/HZ8Hwya2KVdd3XpeU3Iw/7435Y2r3PDXHeej2VmXQIahDrGs+TyRs0OZY2es1UkYDa/p
	ivsoxwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuElH-0000000GuJU-1auV;
	Wed, 12 Aug 2026 19:37:15 +0000
Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuElD-0000000GuIn-3E4R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:37:13 +0000
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:f846:40e6:d9d0:ef5a])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 17475780368;
	Wed, 12 Aug 2026 21:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1786563428;
	bh=Gh9v9arV+AA5L9lbrpbqXH67R8Y8ZcLwr29YLXWFfVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qmp7I944J+iQHWP4pbdlxSrc0gSEXFqR9BlLSTuthMW8y6UUa4NoXTjqWaC9fiD0R
	 t3Z2nQiHuL3pkUrKvpVHp9iX2n4Ka2riv+KN00edPBUneNQesRBTDtLA6X8jX8FcFO
	 cHTxImLGeZHtIAYcfIdZf/0hvucldnI0EZQlpRGZsTBi+wW+IEAEIrnPrkLiZQsMpj
	 iKxV6y1jesTqRSGDWaRM8lXHe7uIHEZi9CK8Sx8wVfG1LGlBuKmK51zSebzdDfTunO
	 7xM5CL2rkGpt8e4qVMDT+0RKJ0WzG/5zAJi/Bo3IDVb4Fok/nwujm0Kkl1gXVrXmdD
	 bRjviZ4/zz9Tw==
Date: Wed, 12 Aug 2026 21:36:55 +0200
From: Vincent Jardin <vjardin@free.fr>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <anzLV--D6z-QB_iF@L30177.local>
References: <20260807-for-upstream-i2c-imx-lx2160-reverse-v1-1-f276ce8cb660@free.fr>
 <AM0PR04MB6802658862C4E2ED8628FFA8E8DD2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <anwI6qnsikPrd80W@L30177.local>
 <AM0PR04MB680259939B7ED9AF5BA5957BE8DC2@AM0PR04MB6802.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB680259939B7ED9AF5BA5957BE8DC2@AM0PR04MB6802.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_123711_948524_67B56AA2 
X-CRM114-Status: UNSURE (   7.00  )
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

Hi Carlos,

> Do I understand right?

Yes

> Only change the r/w bit, other data flow keep write logic.

Yes

> About code, Could this part of the code be improved?

Yes, done into v2 per your suggestion. I did squeeze a bit the comments.

See, https://lore.kernel.org/r/20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr

If you are fine with it, your/NXP Reviewed by or Ack would be very welcomed ;)

best regards,
  Vincent

