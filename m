Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282EAFD3773
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnBjrX0bQL3U41NR9f2JQMbwQ/kpp6U5NlGNmgZ8yJA=; b=U2TaZWZLDk/KWsRlvDfBK4Rs1d
	q03iqkTmV1vuiZkolWRKV22K495fAEZNhPbeCK2xvWxOS0OCyJ9MeAYrUEtmps63bRlDRakR+gVC1
	TbGksA1jlLSNBMV6c2E1HigHOmWz10kZWlcDIjUB72898gKteUxpd8JECYuF2mV+iID54T6UXc86+
	sFFNbAiJXDPpcme2DEbutiZp3Srf/UfDMRnbT8xK8xTGh2TSr9pH7t1dDh3wTZ8zCXK4FMOdMd5Tw
	AN7oJ3rQwCQmSx88VzLtTwu0CWH5U9lHbjNOASuPNPRiwkJv+21Teo5vhRAdI4kXYt3tSjU8thu3c
	9T5u5eXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI26-00000004YqD-3vI3;
	Wed, 25 Feb 2026 16:46:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvI24-00000004Ypa-3RQZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:46:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE0854E41120;
	Wed, 25 Feb 2026 16:46:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CBDA5FDE6;
	Wed, 25 Feb 2026 16:46:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0122110369259;
	Wed, 25 Feb 2026 17:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772037997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nnBjrX0bQL3U41NR9f2JQMbwQ/kpp6U5NlGNmgZ8yJA=;
	b=Sa38iQd+A9UKiqdZk/EdYjEH6IBO5bXLaf0J6duKpVyx8/5+NjLYE550rxS7kLJUpbpHY8
	eB50pkmmpah8JYJwqV/iT4h1cI3uiSibfVSTduskPOQhZAvMmoR2KDPs0mdDd2Yx9lPqd6
	gKZanXCP8ffkN80WWGgJ/0eLb71d7YuZJ+a35EW5WOLeAH0izuKn1tcU1wslNNoj/QFQJg
	q87D7w2MtOgobKscNEY2h2aTgMKt9zDGeccgmdZoolDrEXj0b+DcOplelDiZt1vaxkEe/m
	idP2ulswtNRCJrKEISKNX2X4RNejHlMMei41fYPIcO9LV9edq/8v5zzFmVkPMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: imx: clean up imx2* NAND CHECK_DTBS warnings
Date: Wed, 25 Feb 2026 17:46:25 +0100
Message-ID: <177203795880.1985489.4831780196878536315.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
References: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_084640_990734_630A271B 
X-CRM114-Status: UNSURE (   9.75  )
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

On Fri, 13 Feb 2026 12:08:24 -0500, Frank Li wrote:
> The nand-controller schema enforces specific node naming. Adjust the
> existing DTs instead of modifying the YAML schema to match legacy layouts.
> 
> Update the DTs to follow the modern NAND controller layout, which has
> been used in the MTD subsystem for many years.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/3] dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support
      commit: d86e70e9ca995942e848515b089e9be7430c862e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

