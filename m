Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0A4C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7NwlRIP4E1yBW4nuVVUNvL0Y4CJ7QJjvPb5T04liKM=; b=pJyl2Y94gbjZs05hDoMHYlAbV/
	5G1/Iz82Vlru4xtvIzzPvTcY3jouiflJG4clR/wGjPwFXOTJzywzHOTwQnjTgXgHUCjGLoFir7Ohh
	sObfYTSf7/eM4VpkZqx7hIDuUZ0pABpc34JrR7siIlMIC7H4zSzTyYhRvxIuIx0h/iClAJyoyH+YK
	R6ZPQ1W1UBFnJXf03r1xyCycfUqvtE6khINvXOmwyfBmEWzUsjgtq3aHrIgME7FsqNZb/OpRbLXAW
	ltAXbDmeFJfH1auyk2CNzMsdJaHGZ3XyOFylrY+XdDAF9p+QVQRQasveEsPJPrLRas9nj6lo3GXFQ
	VicF2sYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6yg-00000008Wnd-40SR;
	Wed, 29 Jul 2026 16:17:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6ye-00000008WnP-3Mjg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18286600AF;
	Wed, 29 Jul 2026 16:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D44C1F00A3D;
	Wed, 29 Jul 2026 16:17:46 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Richard Zhu <hongxing.zhu@nxp.com>
In-Reply-To: <20260717074121.3214222-1-hongxing.zhu@oss.nxp.com>
References: <20260717074121.3214222-1-hongxing.zhu@oss.nxp.com>
Subject: Re: [PATCH v2] PCI: dwc: Add suspend_poweroff flag for platforms
 with RC power loss
Message-Id: <178534186606.891279.14151884519982223229.b4-ty@b4>
Date: Wed, 29 Jul 2026 18:17:46 +0200
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


On Fri, 17 Jul 2026 15:41:21 +0800, hongxing.zhu@oss.nxp.com wrote:
> Some platforms like i.MX power off their PCIe RC controllers during
> system suspend, requiring full re-initialization on resume. These
> platforms need to enter L2 state to properly notify endpoints before
> power loss.
> 
> According to PCIe base spec r7.0, sec 5.2, the system software should
> transition the device into D3Hot before broadcasting the PME_Turn_Off
> message to initiate L2 entry. However, some endpoint devices fail the
> D3cold capability check in pci_host_common_d3cold_possible(), which
> would normally prevent L2 entry.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: Add suspend_poweroff flag for platforms with RC power loss
      commit: 5a53462aba161e809de90d45f2a39510a88b6ede

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



