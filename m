Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B23C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UbGqpJvwRJ9GfDpWeOaMkyTXSbyt9PZnsONmsCrVWDU=; b=ZGkBctHMCQcAXWmH/7KsFP1arG
	O+j2stvNF0R4yqjkE3fV7ccEXwiqUXL1w3koaYMwiDMd6ggfpF02ojvpEFLxqI/sGhXrJGxH2/bCm
	9jI3wMbkSyDAF5TLtxaJoQ6ZcSfJm13Ip5+Jp/ay8762SJ3MpVpp/jh/RNq++aKg8HQbcSlHxuO1k
	ucIlt3hDYB3clMzGNp7i+6/hoqFbJFPV0v5F1wdzxCG5PJwDo56f6EDOS41UjtRTVm1EsInwJ4Oci
	4RsvY8QxSFVBjGzJTIvrfAwF8vCD7YL8eGRus3p9PPhm5SRaaCIwfR/l1aV2jNmCJc8gP8rBVUQJd
	MqiDq5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89D-0000000FOxn-0LvS;
	Tue, 07 Jul 2026 15:55:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89A-0000000FOwZ-1X8E;
	Tue, 07 Jul 2026 15:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439742;
	bh=Z8JIPwRXolEslet6JDKoYmFL7Uvymg9O2cw3pmF30s8=;
	h=From:To:Cc:Subject:Date:From;
	b=Lqg56XAKyadVaTucKg2HZOcJoPceOjM5lxj1wEBajCpXa0R3qAynnipWI769qk70x
	 uCyycrVpFUqESlrDAxBJv2p4TdBTjB4YwJNmPDWpFvlisxsLiNghkypCh/18AZDVoF
	 KIL6vPWKaWgXw8OE6TLgKZ1QBViL4u5oPzgmveknwThccebLjqcAGKuJ9aZxc/1zve
	 iC+Xm/dddGXVsNCR0Z0Nd3oZuegY4fdixWDg2YdfnkqnusLlgfqRR2VSmHAxGg9ar1
	 SuiNRkYsL6foTdLWidZCnd8rWOJd474fWs8tuSXvbnrdTBRuqvw7M3WO79eZrHAcMD
	 ZsgdSQe0tPqfQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A73FC17E05E8;
	Tue, 07 Jul 2026 17:55:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulfh@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	irving-ch.lin@mediatek.com,
	macpaul.lin@mediatek.com,
	aford173@gmail.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	justin.yeh@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 0/4] pmdomains: Fixes and add support for HFRP Direct
Date: Tue,  7 Jul 2026 17:55:31 +0200
Message-ID: <20260707155535.199383-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_085544_558895_5900684A 
X-CRM114-Status: GOOD (  11.38  )
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

Changes in v2:
 - Fixed return value checking in power off path

This series adds support for the DirectCTL HFRPSYS power domains found
on the MT8196 SoC (the ones without HW Voter support) and also adds a
fix to respect the power domain relationships during error cleanup,
which avoids HW lockups in case probe deferrals in the specific case
of "almost fully probed" power domains (where most of them probed and
got set up but a probe deferral happened almost at the end), behavior
seen on the MT8189 SoC during bringup (but honestly I have no idea how
are the current ones working fine without this fix...!).

This was tested on MT8173, MT8186, MT8188, MT8189, MT8192, MT8195 and
also on MT8196, over months of development, both manually and over CI,
with no regressions detected.

AngeloGioacchino Del Regno (4):
  dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
  pmdomain: mediatek: Respect PD relationships during error cleanup
  pmdomain: mediatek: Add support for Direct CTL simple power sequence
  pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains

 .../power/mediatek,power-controller.yaml      |   1 +
 drivers/pmdomain/mediatek/mt8196-pm-domains.h |  27 ++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 140 ++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |   1 +
 .../dt-bindings/power/mediatek,mt8196-power.h |   4 +
 5 files changed, 147 insertions(+), 26 deletions(-)

-- 
2.54.0


