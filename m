Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B7EC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODxVBtJRZe/U6qUE2Fp1FYpMsJS82tGUQMuUfDkgxMg=; b=3J0l0vPkLQRp/S21ahIph8aWUN
	wTIC6yoZwukGexlPkoruqB4+zXgQ0XnEuDQ2RXKPIOQ77qBOl2uBACXa3fyNfscMmmjiOqhnMteuN
	3joDPIMTg7+6es0xU0FavwJvkxkXqhSu27qpNcHaq1572MeYlQUtLmI7Yt4Krfn0t3LO+4fitWn7A
	Je+t/gZBSDc8+iTn1jZrjAGo0qQjG1Pxs+Hzoxg5gpkpr0bVREfPDjNe/JOwPW25YKthG37pEgzAz
	P795d9wjL7wp/B3Z+37zSMQjvpIAAZMYvs+SlHyew3L+Ota38hfOIyXllv4j/701O2nQ/lYd4qVqM
	0/pgNchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cA3-0000000E5Wn-0InQ;
	Thu, 10 Sep 2026 10:37:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cA1-0000000E5WS-30y0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:37:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D0DF41610;
	Thu, 10 Sep 2026 10:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CDA1F000FF;
	Thu, 10 Sep 2026 10:37:36 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260803034319.992323-1-hongxing.zhu@oss.nxp.com>
References: <20260803034319.992323-1-hongxing.zhu@oss.nxp.com>
Subject: Re: [PATCH v5] PCI: imx6: Update MPLLB bandwidth to improve i.MX95
 Gen3 PCIe stability
Message-Id: <178903665594.5136.3269558239888927735.b4-ty@b4>
Date: Thu, 10 Sep 2026 12:37:35 +0200
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


On Mon, 03 Aug 2026 11:43:19 +0800, hongxing.zhu@oss.nxp.com wrote:
> We observed poor bandwidth margins during i.MX95 Gen3 PCIe tests with
> the default MPLLB_BANDWIDTH value (120). The margins worsened across
> voltage and temperature (VT) variations and different test matrices,
> potentially causing link stability issues.
> 
> Testing with MPLLB_BANDWIDTH value of 140 (0x8c) shows significant
> improvement in bandwidth margins across all VT conditions and test
> scenarios.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Update MPLLB bandwidth to improve i.MX95 Gen3 PCIe stability
      commit: 50901546f3bf9e76cc13d8146d1b1604a392a477

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



