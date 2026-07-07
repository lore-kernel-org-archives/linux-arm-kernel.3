Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9D0C44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Hg/UtyOFE2XM0kVP7XbzUzpvw8tF4yZt/+RLGcUafU=; b=j9UqJT/5VMT1rz1CJpLiqNu2DM
	sS2JY/3UG6mnVNCHkZ8gIU4vD9mj3Q18kGciHZa64eWUNvFqRYqRNZkvFEWe3+gqcQxs3EGZ88c6I
	luLu0mVAc5f/t9w9B5cEFix4Je+eEsKeX1ZKQX8UhlO+9p1XJG+qY2H11z4Ekm91dJnSmugE1ehM9
	3K1JEDn6DppRWcZ2/sdADkK9ppdkyLR4shGjTLSc7cXcS3P2u6vex/ew19XZRLNuObw0AnmJnfwoT
	y46gPz3TeMlrPgulbnmJDnyTgbHgAL+dk+wKufltU9GuPnjc4gMHX4/R7KD+Vb33/aX82QQGGJcRP
	ptIUhmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SI-0000000EfMj-0KJy;
	Tue, 07 Jul 2026 09:51:06 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SF-0000000EfJv-0Enc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=3Hg/UtyOFE2XM0kVP7XbzUzpvw8tF4yZt/+RLGcUafU=; b=Dm7aVc3us4GiTs9GzwS8SuMAGV
	7X9v84iFU58/HIQ0LeBgJ+BAhZeXanwQW7dNchk7SMPRlgiAsIVrFH+Vf3N2qahdVByDOWK59xEMS
	WfPaxchi2V7yDV1PiIuZWG1xiGt/tVI8sl6R023YIFSl+mxc2TME8pL2+SvLD/ePuGsOwhoP7LCrJ
	OuQXa6rKMj0kXgvoBq3M7uXcv4aJt2kSf5CKN0uLLZDkRYorcqtDGXa8SKMYDWS0LB4fevemRwuUr
	q5Mun1xikNq3WyRID4hZwe17BCNmoq00x0IdzhrdnaDbY4lMzRoCz5FGA026oYwhq0RCmpc2zAeOk
	zC6TPfxw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SC-000PUk-2d;
	Tue, 07 Jul 2026 11:51:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SC-000Ck1-0b;
	Tue, 07 Jul 2026 11:51:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 0/8] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Tue,  7 Jul 2026 11:50:47 +0200
Message-ID: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_025103_100302_7DE1B7D1 
X-CRM114-Status: UNSURE (   7.97  )
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

Hi,

this series adds small fixes and improvements for TQMLX2160A DTs.
The DT overlays address specific hardware behaviour when serdes is
configured differently.

Best regards,
Alexander

Changes in v2:
* Updated recipient list
* Added patch 8 to the series

Alexander Stein (2):
  arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties
  arm64: dts: fsl-lx2160a: Add vcc-supply for SPI-NOR flashes

Nora Schiffer (6):
  arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
  arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for
    SGMII in SERDES2 configs 7 and 11
  arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC
    instances
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and
    pcs_mdio18 in appropriate overlays
  arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY
    reset GPIOs

 .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 306 +++++++++++++++++-
 ...l-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso |  20 ++
 ...sl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso |  20 ++
 .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  33 +-
 4 files changed, 367 insertions(+), 12 deletions(-)

-- 
2.54.0


