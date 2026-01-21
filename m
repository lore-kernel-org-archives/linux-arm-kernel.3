Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5027BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi7aXbmv6he1CgJqDX2117Fjg/Eaf/poMmD7frpY0nk=; b=RmTD/6K+6/7oA2yQvxFSw/vBFk
	EGYXPISAS0avZ54rDdAwOv7qxHiYOv95rRrXSN3yBOvOYHlUMpQVaQhLtY245hkcixQcTMMSYHA92
	/5YG8sL4+hvGxBrJPFslECIFzSNovEWdGbwSoPKmvfu/5t3wnQEjJzTiIEq2m/9wa/Kja06RH9f7c
	BMixKVXoOmMQVUvxh3GhvIl+BTtykHYVAQRyPjzqsSmsQx62OckWNau6b1Cltk/3vpUFDPe3n0P2u
	ZIhehQ2+n3YderFqL6ghWsWDxChMjDQUCzzCKLbye7CRR7pPiPyYZvUZINEWWzR1HxQqmsSJm2iFF
	Wh/+bFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwy-000000057ju-0qiQ;
	Wed, 21 Jan 2026 08:52:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viTwv-000000057ib-2OPM;
	Wed, 21 Jan 2026 08:52:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E24DC43EF1;
	Wed, 21 Jan 2026 08:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89847C19422;
	Wed, 21 Jan 2026 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985544;
	bh=D5ht449KAUzc5+yK2DExu5/NxubUP012nBVXKyuHYSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GH+DU1cNzzaJ0EtqvDv7O/ffPlXrxIEflW63r/uZknWPYScGmUZ9iR/ZTRA+Xxnyh
	 gDrWJzab8BHM6+Ixlp5vjHJRFBIOQJZaZIzKnVP8GGTkx36da7Wp1xyTLuX487lqhc
	 cIN9sYssijkbbyK9UGLWw2CC5aaVhYBol7OZX6mYX/yeK8/wjIWUBNnpBe7OG8s7bg
	 ZZMSZtgsNLJAgkCvDBRyZJzGs/o6gLOPCIcHwvyEmmGnriPchUlnE2l+lpArv+5Udx
	 5e6r0M27cB67fTSyczZ7UxztiEgREp8P5cP9fEjZAeDCh482rurtkcmZUruziPQWLt
	 D8lGmTbc6vjow==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
References: <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
Subject: Re: [PATCH] phy: freescale: imx8qm-hsio: fix NULL pointer
 dereference
Message-Id: <176898553780.1268719.17549107476486766127.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:22:17 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_005225_628088_0503C0E5 
X-CRM114-Status: UNSURE (   9.02  )
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


On Wed, 14 Jan 2026 17:50:23 +0100, Thomas Richard wrote:
> During the probe the refclk_pad pointer is set to NULL if the
> 'fsl,refclk-pad-mode' property is not defined in the devicetree node. But
> in imx_hsio_configure_clk_pad() this pointer is unconditionally used which
> could result in a NULL pointer dereference. So check the pointer before to
> use it.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: imx8qm-hsio: fix NULL pointer dereference
      commit: 4dd5d4c0361af0a3fd24f45c815996abf4429770

Best regards,
-- 
~Vinod



