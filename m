Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F303C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZobxgcZ+YVZN96iUsdOvfuDrktODLENSWxYutDPxrjU=; b=Ys5kQMKVi/Nqk+KHaRXxScuz7g
	sXGHA/ccL1DoQtY/9oN37NKnKW9tdwn7YAr5QZyxXVzCG12jzsQzDJtGXYeRu8DeC4jMxeikPbAuS
	tX1Lk+ph4UwUXv6SMkK68pg0/wepws6KbKWPrBy87I0Rt50u7Fo6EsHAOxMfP7JRxICK6bdd3r6b3
	OxF8YXo1VO6hsfdzxJelkkO1VpX7ENSIZJ/po7SKYXrGCbBSK6mrgCgtzA2so41PRPOTL8app5hGG
	dbwJ03L++6On8CQ2hPDCcuSSQ5w6x0GNPSZIi59wEdkQ58XNt481fiRBecA3ecQQ08qOooQ9fsQ2N
	UbMMkp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cPQ-0000000E7Bm-1yTo;
	Thu, 10 Sep 2026 10:53:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cPO-0000000E7BM-2KmF;
	Thu, 10 Sep 2026 10:53:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AECB415CD;
	Thu, 10 Sep 2026 10:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC271F000FF;
	Thu, 10 Sep 2026 10:53:28 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 aquapinn@qq.com
Cc: zhengping.zhang@airoha.com, lei.dong@airoha.com, hui.ma@airoha.com, 
 upstream@airoha.com
In-Reply-To: <tencent_5E7D6E7FB25B4CD732F08547C11F5DA24808@qq.com>
References: <tencent_5E7D6E7FB25B4CD732F08547C11F5DA24808@qq.com>
Subject: Re: [PATCH] PCI: mediatek: Find INTx controller by property
Message-Id: <178903760879.9481.17080662701221363046.b4-ty@b4>
Date: Thu, 10 Sep 2026 12:53:28 +0200
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


On Wed, 05 Aug 2026 14:05:07 +0800, aquapinn@qq.com wrote:
> All existing DTS users already name the INTx child node
> "interrupt-controller". Use of_get_child_by_name() to find it instead
> of assuming it is the first child node.

Applied, thanks!

[1/1] PCI: mediatek: Find INTx controller by property
      commit: 52cbf88730b743745404b3fa5a3fc8b480768276

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



