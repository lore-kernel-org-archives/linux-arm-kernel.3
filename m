Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F66112584D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApzOhorybY3ljiB6CsXLMn4hxGlYu1mNujmVp2N2niQ=; b=SV/7w6hjx7CgBa7ZAiA6Y0MgQT
	gX04D8luP7vaYUZo/4fFtmc+F1QQkjCsVjX4weQ3eIUWevgUKNJSuBvmbyEnZxyn4dbJPoGyUddFS
	fUYueLHlt3577QEDgKPD8sC5UxcwbLYxyS42I4zpwikzwgOA0neVuqGAR+OY8dR5knQrfQiidVuIS
	4yPnjt6lA/8xOixQRVE/OmE7u/2BEam+Sde+NYmicuEaMTIw6ReZM3cojI1+f1AOp75nNhOTPyGUx
	eBO1JwAHoXGbDECPR2SDUsNZ2/9CfKxeX2u+PHpOFC/xwYZ/nAyUxnsourgHRnijLg/goppiOlxJp
	zQqKX73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lc8-0000000Bq0J-0hle;
	Wed, 11 Mar 2026 15:36:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lc5-0000000Bpyy-0L4K;
	Wed, 11 Mar 2026 15:36:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8AC921A2D72;
	Wed, 11 Mar 2026 15:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D02060004;
	Wed, 11 Mar 2026 15:36:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3133C10369D16;
	Wed, 11 Mar 2026 16:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773243402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ApzOhorybY3ljiB6CsXLMn4hxGlYu1mNujmVp2N2niQ=;
	b=hTMYs8gbtABgvr7pKPME09y7bDNuLcSMYon9S+fqwHgyT7pTRCzRe2Q5cx3h3jzPvyu78u
	CSXEv3072sVe8fghTqCD5i2AJ6Uo13xuqGXxB1h9404kbtC5/WjpKKY4SAW5vc3ir3h2Hz
	atAnyUR184z2lFRX0XgRoazDzSQtq21N5t85HfAm8BzVR9whLUNsf1j9AkhRW5J9/GAOC6
	XcnI6kSvTQ2+lEqNEw1l4QVKVO0AZHh7cm2EEcwDaEEz13uEDEdsxsQhiWtxgFOj2O6436
	/eIU1dFSyUYSc1CarzwNgnO5QbVNS/qksn6jY0M27XejcC+rfzKvwrRIGuhFKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Max Krummenacher <max.oss.09@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
In-Reply-To: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
References: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: mxc: set raw chip's to child nand@0
Message-Id: <177324339988.696314.2482763998911227271.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:36:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_083645_330216_3EDD035F 
X-CRM114-Status: UNSURE (   8.49  )
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

On Tue, 10 Mar 2026 15:07:36 -0400, Frank Li wrote:
> The nand-controller.yaml binding requires a child node (e.g. nand@0) under
> the NAND controller. However, the driver currently assigns the controller's
> of_node directly to the NAND chip.
> 
> Search for the first child node with the "nand" prefix and assign it to
> chip->of_node. This filters out properties such as "partition" that may be
> placed under the controller node in some older DTS files.
> 
> [...]

Applied to nand/next, thanks!

[1/3] mtd: rawnand: gpmi: set chip->of_node to nand@0 child node if present
      commit: 3a6e21ea57c8118d3095f073aeaf9362dc2c3865
[2/3] mtd: rawnand: mxc: set chip->of_node to nand@0 child node if present
      commit: f7bd1948a5461df9e1027d5bd9a511e754146689
[3/3] mtd: rawnand: ifc: set chip->of_node to nand@0 child node if present
      commit: ee78d466db8a001d137d6f9c97010b343aee456b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


