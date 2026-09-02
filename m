Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA353C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtsHa0PY4VBZ8+p3srWpam5h0SutKx/xK4Ns+YJ7IF0=; b=j5kOhTuAuaD+f718VjvyoMUhk3
	k5kiadotzvcFY+EPCY0nEABb0E718DNyJNHB0RSDrFE4/dATLeecW5R7gyoGqZAEnS07JL6gsHkQ2
	jPtW4YqgcAl2BDLhfIJdRfFxDckF9sZ//DyK7jQuFmzZo0DmZt3P/U/LTTrcDcdTyTLeiRgJ25rGr
	xC8mVFfx6zTxZEjAndI5qOEMRebdIXoe+drZ5QyZ/F6eUqWcUvxNcWi+awfy4b+gFx8GIUABXYmGs
	nlPACLhXFOjj8OSwgbCwHmfIzOYGiAfi13chG6ymiNe5C+ZOmQV3T6ST3/bvQICI0iuqsExQiWVHF
	sbnMbuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lkW-0000000EuvX-08lg;
	Wed, 02 Sep 2026 14:15:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lkT-0000000EuvF-3gJf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:15:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BCD742E36;
	Wed,  2 Sep 2026 14:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF34A1F000E9;
	Wed,  2 Sep 2026 14:15:26 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: leoreis.costa@gmail.com, fra.schnyder@gmail.com, francesco@dolcini.it, 
 frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Richard Zhu <hongxing.zhu@nxp.com>, stable@vger.kernel.org
In-Reply-To: <20260813095003.356062-1-hongxing.zhu@oss.nxp.com>
References: <20260813095003.356062-1-hongxing.zhu@oss.nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Move clock enable after core reset
 assertion
Message-Id: <178835852653.83808.12038237867062064510.b4-ty@b4>
Date: Wed, 02 Sep 2026 16:15:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Thu, 13 Aug 2026 17:50:03 +0800, hongxing.zhu@oss.nxp.com wrote:
> Commit 610fa91d9863 ("PCI: imx6: Assert PERST# before enabling regulators")
> inadvertently moved clock enablement before core reset assertion, breaking
> PCI device initialization on i.MX6Q Apalis platforms with
> ASM1061/ASM1062 SATA controllers connected.
> 
> NOTE: It is not 100% clear if the issue is specific to the ASM1061/ASM1062
> device or on the specific power-up sequence (reset vs cold-power-on).
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Move clock enable after core reset assertion
      commit: 16929741a622eb345057e41c7b335d9b297890e1

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



