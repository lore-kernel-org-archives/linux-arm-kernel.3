Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091D4CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A65cYPv11pCdvjhm4cuJJ2Gej2mfQEB4+QFEOqiU9Ug=; b=qy3Wp4RC3uzRiMXyc1xjrVQ7s4
	tVCEKzv2uvpswbxa712tReE0KEFZVA6DH4JKU8tSxH3U7T4FDt+j5cD9LzKMwKgmk1mDkTuec2PFw
	Y9r7/ZAI7FhJgcoITdanwHf1cNnj1Isv1nLozpSpyWbr1iUTnEk4g1qBg/iTEEboT/UGosuYi7KzV
	V4EteanL7hl+6T2pOuKw/M5452P67G8XM1vZQ/WBmgrw9bHa7EXvSx681eobjBXbpwKMaKsf6sKDV
	GBX2eu4SVJfX3zPGh8+8PzXFY8F90KMA+ZcnsQXoVVL7ZuZJhYmAKr0/AQP34A4Zkev5o2fatCwgB
	488ljU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLU-00000001Rn6-0Qtx;
	Mon, 19 Jan 2026 07:06:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLP-00000001RlQ-21AF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49BD94035A;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2180DC16AAE;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768806394;
	bh=tpnfYEEUGGCcAt473upHUWl8HqVkQmGsCrvb4CiklBI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=n3dFhBK4rAnsMU8QW5/B1/mluc329pUD+nH+7GdZqz5Bui/GG3sMWdYUeC/qjNeUA
	 ASF3jbcDrA8aLy010xZuZz2fED+ieZuVq2OLIomiC444VWqk73VZ4+SMWFUxzsQYf+
	 1uzxsLCe+7v+eUXaL6qatYn4WjHPg7FnG4DoOMTpCfdfGcBLJTjaMfDlOoRsJzYrFb
	 LEqTeYTzgW99xrRqgMYWqEi9gaRcoKSTztqRTVlrNJewdeEa3MOfYh2x0V1h4FTCt9
	 jHh0yOY4L5UwnkDCRZHI4/oHRGeDOAT5zLnzXbDHbBYO8ByC+0GiJ5Fb2M36UkhR/G
	 1Q7t3KBiwMVhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B81CA5FE4;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Subject: [PATCH v3 0/3] spi: xilinx: switch to device properties and make
 IRQs optional
Date: Mon, 19 Jan 2026 07:06:21 +0000
Message-Id: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3XbWkC/03MQQ6CMBBA0auQWTukU6SiK+9hXBQZ7CRSyBRNE
 8LdbVy5fIv/N0iswgku1QbKH0kyx4LmUMEj+PhklKEYrLHOEHWYFsEsL4kZqe+649D2rqUzlGB
 RHiX/Zrd78ajzhGtQ9v+LkyFLjauta601SOj74a3qw+TjNXJew7zUXmDfv27egTSdAAAA
X-Change-ID: 20260118-spi-xilinx-1b884d5b6519
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768806393; l=1190;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=tpnfYEEUGGCcAt473upHUWl8HqVkQmGsCrvb4CiklBI=;
 b=YHnrC+P6MuDz85zvTkEdBwOIu0gWm/BLsiWVugyfCbkuGtF2+tNjvrjF4b2AXibOgorGlYwPo
 CCRNsI8TXKmBOhUslCDbZIkLbruGmnpr1r+tXRbtA+X0vDTpRR7CdX/
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_230635_547246_21BD4870 
X-CRM114-Status: UNSURE (   9.31  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Transition the driver to use the generic device property API.

Additionally, make interrupts optional to allow the driver to fall back
to its existing polling mode on systems where interrupts are either missing
or broken.

Abdurrahman Hussain (3):
  spi: xilinx: use device property accessors.
  spi: xilinx: make irq optional
  spi: dt-bindings: xilinx: make interrupts optional

 .../devicetree/bindings/spi/spi-xilinx.yaml          |  1 -
 drivers/spi/spi-xilinx.c                             | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

--
2.52.0

base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
---
Abdurrahman Hussain (3):
      spi: dt-bindings: xilinx: make interrupts optional
      spi: xilinx: make irq optional
      spi: xilinx: use device property accessors.

 Documentation/devicetree/bindings/spi/spi-xilinx.yaml |  1 -
 drivers/spi/spi-xilinx.c                              | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)
---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20260118-spi-xilinx-1b884d5b6519

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



