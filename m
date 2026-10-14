Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3722CCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2y1htv9mMaGy/RCP3WtHuulaoUbV5F8RkbCwqimVvM=; b=fsaDdAUiyOaNzYh9raUp565fhK
	X9K0UGRO481KOqVHjdRwimCnPBy6IIyk6HoHS2syZy8UGB/pk1jPOkfuHKMc/Bt1jnO71Ks3iFCtr
	go5SlAzBP3I5sIwiEceE5V+i/WpuKcr/aiKmj13Kpw+etUyfYCeUmGTvCn38GvIWn2GKi79cW7LCR
	IBeXJxlp+3OAycW5jJ6iiOQXReMrKu01Vx8pvhxA26trXcFA/QoY5jMZuQSl2nP+Bj7gG/vpX4VSg
	/oaj1G/BLjBCXiJKpQGhf1r+PWdMFc6oNFoEnFs9MygKTeIIGvK+fZ238Ua5JCGE8IpEmGCcKmUk9
	Y8N+BkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGymL-0000000FY7O-1apG;
	Wed, 14 Oct 2026 13:12:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGymH-0000000FY6s-3S8o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:12:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4A1960219;
	Wed, 14 Oct 2026 13:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0A51F000FF;
	Wed, 14 Oct 2026 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983536;
	bh=q2y1htv9mMaGy/RCP3WtHuulaoUbV5F8RkbCwqimVvM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CQ/Fp5v47SQP+g395fhPsm4rFH4WOM+H8NRWw1VGI2pc+hN3ZT4U06y97jfehxXI/
	 uWb3RwCXu/TWHPXJKIJ3z3F2U6FJvVT7jyIbyv38j0V/kx4rGmO9K59ijtLUfM014I
	 aT4SilqqVNMZLcmKAdkYFnsd062iwonU4MFfPKaZZUEinIcNxkYYpWyf2VcesSnKrH
	 C26h9tZGj986BZ1+jpnF2TOghhZO43oUkLGU0RB+iDfEiMYQ+CoDhJw/BZ3hNvtRK4
	 +RPqKGMDcMBNzw5tJwsyJjl+DDLSaQik0mBHqEv5Ey3hehpzEFsnD6Zp3M9cWlqPCF
	 GAF24SQP8n+PQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@oss.nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Richard Zhu <hongxing.zhu@nxp.com>
In-Reply-To: <20260917063322.4102035-1-hongxing.zhu@oss.nxp.com>
References: <20260917063322.4102035-1-hongxing.zhu@oss.nxp.com>
Subject: Re: [PATCH v3] PCI: dwc: Add suspend_poweroff flag for platforms
 with RC power loss
Message-Id: <179198353098.69482.8422994318999244080.b4-ty@b4>
Date: Wed, 14 Oct 2026 18:42:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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


On Thu, 17 Sep 2026 14:33:22 +0800, hongxing.zhu@oss.nxp.com wrote:
> Some platforms like i.MX power off their PCIe RC controllers during
> system suspend, requiring full re-initialization on resume. These
> platforms need to enter L2 state to properly notify endpoints before
> power loss.
> 
> According to PCIe base spec r7.0, sec 5.2, the system software should
> transition the device into D3Hot before broadcasting the PME_Turn_Off
> message to initiate L2 entry. In practice, endpoint drivers properly
> put their devices into D3hot during the suspend flow. However, some
> wakeup-capable endpoint devices that don't support PME from D3cold
> fail the D3cold capability check in pci_host_common_d3cold_possible(),
> which currently prevents L2 entry even though the devices are already
> in the required D3hot state.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: Add suspend_poweroff flag for platforms with RC power loss
      commit: 21a3a262d8a4dbbd4516cf4065f70178a12a0517

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



