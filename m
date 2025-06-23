Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3626FC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DbcDc+IG7ceB1l/HrbT7G6y1r/C3Gz6KlGFgQb3W2cs=; b=mPCt/gL7btck/f7Pg3jtWKsu4h
	8t/UgmPHevBfKVpZvxOwTsaSznYK46caEA/InWMmmPulTL96hBR8bsvHgLCHB+Czgv8OMrRIJ+GaB
	uNmXiVlciPhvV1o1QKdpARmWlZjZJ6yHMY6V8lPlDrthZEBJZ5RqgoF1pcNAWc7dsnNG3uwlNxFAb
	794s2R9z6Pkqe4efJMju4ScpRwRlerohaUA+OtGPQhdSz5Ad7BvtE+GaAKlAfcHWe5qyV8AHOCcB4
	Yt8Sj+61VTCoaxmhDRrzipuIhOBSL4L+PpuRcYJ5IW/3GMGmL5d02SdAFEPWfyjlILnG7IU8w7mBg
	vyHeDiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThYW-00000002vXL-34h1;
	Mon, 23 Jun 2025 13:49:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqu-00000002ahI-00Jp;
	Mon, 23 Jun 2025 12:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680042;
	bh=L64oS5oGbehf+YNHePJC72/WhERGwszDWnrm0/Z0chc=;
	h=From:To:Cc:Subject:Date:From;
	b=lTm5xWynSZKYnhz7zmnQU+M7KgR1b+Bc4nXJOS5JE359ichLEZdUmDWIafdtqu8oQ
	 qqGxgkKMBE6iDQXLZ4Y165hzRDpgaEN/n4JpF4zSN5ZBq8m3McMM6HBs32iMVms0R4
	 9Gnyec/KgshslQ7sptRxwdm8B48Lmdhrh4pL/2yIKtQ1c4NAgEM5JNgdhUm6TaHXU8
	 IPSZeeREuLU+g/UxtbGW8Dr4TcP6mgjpF3CcbiZ4/N+77SLTr8tGGbZlTejXTVS+ox
	 azc1dwWgjMIHGvwatEIC01OteKliqKnxRyZWRAqUHB6lJLFSHizYr9Xm88q1hz2ED0
	 fEjdxLgUNUGxA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 196ED17E090E;
	Mon, 23 Jun 2025 14:00:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] mfd: Add driver for multifunction MediaTek SPMI PMICs
Date: Mon, 23 Jun 2025 14:00:36 +0200
Message-ID: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050044_187825_F627D284 
X-CRM114-Status: UNSURE (   9.68  )
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

Some MediaTek SPMI PMICs, like MT6363 and MT6373, are multi-function
devices, as they have and expose multiple sub-devices; moreover, some
of those also contain an interrupt controller, managing internal IPs
interrupts: for those, a chained interrupt handler is registered, which
parent is the SPMI controller itself.

This series adds support for the MT6363, MT6373 SPMI PMICs and their
interrupt controller.

AngeloGioacchino Del Regno (2):
  dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
  drivers: mfd: Add support for MediaTek SPMI PMICs and MT6363/73

 .../bindings/mfd/mediatek,mt6363.yaml         |  98 +++++
 drivers/mfd/Kconfig                           |  17 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/mtk-spmi-pmic.c                   | 410 ++++++++++++++++++
 include/linux/mfd/mt6363.h                    |  26 ++
 include/linux/mfd/mt6373.h                    |  21 +
 6 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
 create mode 100644 drivers/mfd/mtk-spmi-pmic.c
 create mode 100644 include/linux/mfd/mt6363.h
 create mode 100644 include/linux/mfd/mt6373.h

-- 
2.49.0


