Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDE1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FyNdq7QSQghOLluVRgy7Wxrmk0g9pD6sxxaWDMGrIQ=; b=PuA1gHUXVLwBXQPtIApkhnDcl0
	IiN7laPcLPd6aQgVr+kgxd3O+PLGkaNQJpzKcE5TfrQOh3fmH+Nj0h1hom81LfxakaUs7ASIwrsLY
	aYvpmM9Eav9VfVx+QwUb46JuWpe4DkbPjLqt5hKiAFQd1Pl0K0nqMOzVOK1c/s1hizUCKSr1GGtwS
	oqjXLqVrN1HQ6PSsIjfXuuJVm3ZT0TKUDO0ja9li9e2h0gDMF8XhNS61tsdh1GkhXi6u7VHniGNkH
	+ZE3T8ezTfRlO9OCjYGpkw0hoiCnAb2Vq6krrviHfcNrW4G3fd37f2vN1y15AVGHgRv34sxeTZ4nM
	4NkWrHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4JN-0000000BzBD-3D80;
	Tue, 24 Dec 2024 12:46:57 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4IB-0000000Byuf-0Pb0;
	Tue, 24 Dec 2024 12:45:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C24361BF203;
	Tue, 24 Dec 2024 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735044340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FyNdq7QSQghOLluVRgy7Wxrmk0g9pD6sxxaWDMGrIQ=;
	b=N7kD66nsYD0DWDypGCZBfHK9LDjkSdkwy0bo+SNaf2vqCrRHXa2wi2vV1OTyrLsN9XUrq3
	lu9B/SqVTpEV5ydKFCcUQnd6ew76PH5qD3040JHAgoSkQWHrNQNiv33tm1k6eBPIQ8qwN0
	2CgjhcFGnmktXboR6rFLvk92dsNx0UI8PSSbDgPW4oQMjpNVctB7Z2NiUjjE2AOpC3B6az
	Du+cSay4R/If/Pb0AuQY93KlsElJxa7cPp7TSsumBNdnPk2Rf74UfqwacDtgGKcNYSwNnq
	FH5tWchm7hzfeQGUn4b3sgKdV76LcDzochwBCt4PhqMK/BNEZZBntAfySvMDzw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de,
	vkoul@kernel.org,
	esben@geanix.com,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] Add support for nuvoton ma35 nand controller
Date: Tue, 24 Dec 2024 13:40:59 +0100
Message-ID: <173504401426.1625053.7886349006828481289.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206031318.156152-1-hpchen0nvt@gmail.com>
References: <20241206031318.156152-1-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_044543_281197_EF21DDA9 
X-CRM114-Status: UNSURE (   8.30  )
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

On Fri, 06 Dec 2024 03:13:16 +0000, Hui-Ping Chen wrote:
> This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
> It includes DT binding documentation and the ma35 mtd nand driver.
> 
> v11:
>   - Update ma35d1 mtd nand driver
>     - Fix warnings and checks use --strict.
> 
> [...]

Applied to nand/next, thanks!

[1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
      commit: c20e06019087410832455d01c97e9f72f6bb1626
[2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC
      commit: 5abb5d414d550998a235de1161ac6bef240b0c29

Patche(s) will be available within hours on:
mtd/linux.git

Kind regards,
Miquèl

