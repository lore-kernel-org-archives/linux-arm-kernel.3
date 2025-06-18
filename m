Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38727C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K14Zjx45VptjnJlFADtPYk5GNiP2VL8hYJdKZoLiH/M=; b=jEC+fQoyQH1jtPO2z8AtbOwJhC
	E/Cv0rJttiYncV2I4z8GfanEYa7xQtUH1tfqq4FT6qhSHdUezBKPt/7ELpAPvn7RFpxSmjAztjTAU
	JsJn3oF3HXEor+A7jhhsF2iQierYI9jQ4pDmtt7az5cHoPs54C+/Fbn9sYOJFLjItZlN3arvCbB68
	1DbBPz8lHoinjvj3jUz2MEKLd9AXoq8eLEqYLe0joydVnfI0WCWTRUMKptfVCTuwJg+BMEmnK5VtU
	b1SFdtq4+I/sbw498WLxrXS651sBItae5YI6a5J0DD6hJu4b8j+mUT6Aux2J88KtcDCnP04En9Ecy
	Onemtuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs8Z-0000000AAsJ-1Lth;
	Wed, 18 Jun 2025 12:43:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqD0-00000009ofF-0GNn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750243198; x=1781779198;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K+aq5iihv58ciWnJ3WgNPa2GI/6i665JhmCQdSA1G28=;
  b=VYEKaq6K21OpSc/ZGbbA+30f9c7oKCsaU6hSHxXwHlrQVTnLMNg0r1ef
   8NBWFYV3Mi7opLWfwCNkPqF8gCq/x1LHFcE/OEP8fCOM990ClFBVI9wRF
   wvfLDLdCm/Y02h/D+41VY8y5USAcLFtUuKAZY3mpjza4q8/fj8Nd0pQOX
   lfkyMYLfTXLSGHGfRqnY+erdkDc8qCI0+xktfS0lZeaQKJ4fixbkyKnAt
   dn4WpdtQWJZPgZbvfgTELxi7GPbSnjqV0fP9txj+YvBtHUrEu/v4U8Jl6
   zvITjDhymRovU9MWkCK1eMDYr8k57mfcjNZKGEAPqF5loveeC6EeFr0xq
   g==;
X-CSE-ConnectionGUID: 4uH6+ir5SsWi7jPBO6gg/A==
X-CSE-MsgGUID: Uoh+Bs9UR1qSERud6Gy6Pg==
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="274330070"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jun 2025 03:39:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Jun 2025 03:39:24 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 18 Jun 2025 03:39:22 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 0/2] Add cache configuration for Microchip SAMA7D and SAMA7G MPUs
Date: Wed, 18 Jun 2025 13:39:12 +0300
Message-ID: <20250618103914.2712-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_033958_276461_AC605B35 
X-CRM114-Status: UNSURE (   8.38  )
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

This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
The cache configuration is described in datasheet chapter 15.2.

Changelog:

v1 -> v2:
- Remove the cache-unified property from l1-cache node

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi  | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)


base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
-- 
2.50.0


