Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7EBC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5xbRlmm2bg6X6lzMBn4zN/H76kLu4hf67UQ/35KC2So=; b=mRHLiTLPXKZD+N
	ODxuoFaqLN8kgQ5eWamKbHytVPNBIIwe213dBVXnc7dKvO9ghsum7iWxQn+RuoEBIIUQBPe2FG+df
	WwVEYqYwIKRP2B4dw1dJA6rm85Yw5GVPSRoAs2NWYsTqkW95mUnxAbnDLu3LIhi9jKrPhFGSnfEmo
	heBjs5FVKuAE6RMqOMsWRRHqpSWfNR5DfxMIS8ikm8zgOEzQMKYpYYJskpIMtMijTSjC8KqaowC08
	EgcQGq1BNwBRUjnko1y57BxUGucprvhpZO5WnzI0j5wAfJFf2IbWd8cCeFvUTOsSaQMzBEvnXeWhZ
	XG0mwatFuRflDjdrvbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zi-0000000F8PA-346D;
	Thu, 24 Apr 2025 19:12:22 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81gi-0000000F5FV-3cPn;
	Thu, 24 Apr 2025 18:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745520751; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nj0gHv9l+M8l+v+HmXeshUTdo1OdA7CMnRQy54oxYs8WP/6cFvf2K5sDgdqnDKHn3+LvQHZRS5SxAmR5ho1QTNP6I+POHrXSxlBSTfKRGZVsC7pGQZ8Of1YZUY1pbWgRFAfDF/osjlw+R9hHqmGRL5Nh40KVL+KdGgB264fxqAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745520751; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5xbRlmm2bg6X6lzMBn4zN/H76kLu4hf67UQ/35KC2So=; 
	b=MLsWHL9WC67oOHJu5wW/CMK6rOFCACQsG40HRV5cQoWYkB2u72jKyfPZF1iYz44hRf3lzrufiNHBBtZmbMRzjQOm0GRLWKbs+GTx2Vr2DeLga8rWNVYGnq0qJo1toosEjA12mLMrkfcguPMjVwOygom5kMMjOuC1Df3hkKCC7po=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745520751;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=5xbRlmm2bg6X6lzMBn4zN/H76kLu4hf67UQ/35KC2So=;
	b=AvPhEc7kVOXGVuSOHUoz4AK4k4vbRTiT6gmVRMq+MbhWMdLT80f2wr5DrS3RSATa
	JdetpN8KgmYtg2LHGpALTEHvgYQTvj4u3OgwUCLGoRICJziKAIYAnJur/bKRdN2DGO2
	AL2iEUsSqL+sYfmyvhp4OYr4mExw72TZwECPZpwc=
Received: by mx.zohomail.com with SMTPS id 1745520750292268.9096442049322;
	Thu, 24 Apr 2025 11:52:30 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] RK3576 SATA Enablement
Date: Thu, 24 Apr 2025 20:52:21 +0200
Message-Id: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWICmgC/yXMQQ7CIBCF4auQWTsGKGDsVUwXgKNOTFsdsDFpe
 neJXX4vef8KhYSpQK9WEFq48Dw1mIOC/IjTnZCvzWC19dpZh/Ls/ClgiTViMtoma8idY4D2eAn
 d+PuvXYbdQu9Pi9Z9hBQLYZ7HkWuvlnA0HiV3MGzbD5zvrIGKAAAA
X-Change-ID: 20250424-rk3576-sata-b102b21e49a6
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115244_998305_D5A71D6B 
X-CRM114-Status: UNSURE (   8.13  )
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

This is a tiny series to enable SATA on RK3576. It consists of a patch
to add the compatible to the bindings, and a second patch to add the
nodes to the SoC .dtsi.

I've only been able to test sata0 on my board (Sige5), but the
successful test gave me confidence that downstream's "dma-coherent"
property here is appropriate and true.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      dt-bindings: ata: rockchip-dwc-ahci: add RK3576 compatible
      arm64: dts: rockchip: add SATA nodes to RK3576

 .../devicetree/bindings/ata/rockchip,dwc-ahci.yaml |  3 +++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 30 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
---
base-commit: f34da179a4517854b2ffbe4bce8c3405bd9be04e
change-id: 20250424-rk3576-sata-b102b21e49a6

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


