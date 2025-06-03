Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C87C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wjyJrRUuW1LpeCdpHQttH7ahDvI3cW9wjiYLJGOiDHE=; b=NG94FNtjSVW9so+h5nMa1ecay8
	nSs95tSj0pUB/OhfjiDuMCYalRuZ49L53bXFtCjiCw7w6riIU0ULXAwWyFWnn63O8FEFDUtvhNEcj
	8EA8KSUECNBLv7P6+0wumFTwbaUzbYHrS7CB56jdv67gyh1LqW38t9zbV+SpO4QiHt5sSLhtKdiir
	qFyn4N8NemAyhV/fDhiWe5qTKK7do734BdTl0+B2z5Y6WF72svuJ3x4auWQDq/B0LCz09Evk4qWwg
	NhSodW8mnX7vCRbikoGc1r3D3rxL2pRINZ6STQEsCkLaiwnabOvBDlzw7w1qBp0n9wFreWafwodJ+
	xWCFEjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMKar-00000009ruh-0ULW;
	Tue, 03 Jun 2025 05:53:49 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMKYe-00000009rTU-3CWf;
	Tue, 03 Jun 2025 05:51:34 +0000
X-UUID: c44b1a9c403e11f0b29709d653e92f7d-20250603
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:36da481d-9628-499b-b408-b3ee3ad83ee2,IP:0,U
	RL:0,TC:0,Content:32,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:32
X-CID-META: VersionHash:6493067,CLOUDID:fc49a494d89cd9d5410e466ec1068e3b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c44b1a9c403e11f0b29709d653e92f7d-20250603
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 576421780; Tue, 03 Jun 2025 13:51:17 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 0A62516001A03;
	Tue,  3 Jun 2025 13:51:17 +0800 (CST)
X-ns-mid: postfix-683E8D54-83035764
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 070CF16001CC7;
	Tue,  3 Jun 2025 05:51:12 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v4 0/4] Use helper function for_each_child_of_node_scoped()
Date: Tue,  3 Jun 2025 13:51:05 +0800
Message-ID: <20250603055109.3154061-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_225133_144966_6FA70553 
X-CRM114-Status: UNSURE (   6.33  )
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

This patch series introduces wrapper functions for_each_child_of_node_sco=
ped().

The for_each_child_of_node_scoped() helper provides a scope-based clean-u=
p
functionality to put the device_node automatically, and as such, there is
no need to call of_node_put() directly.

Summary:

 - Patch 1 ALSA: ppc: Use helper function for_each_child_of_node_scoped()

 - Patch 2 ASoC: renesas: Use helper function for_each_child_of_node_scop=
ed()

 - Patch 3 ASoC: meson: Use helper function for_each_child_of_node_scoped=
()

 - Patch 4 ASoC: imx-card: Use helper function for_each_child_of_node_sco=
ped()

---
Changes in V4:
 - Remove patch ALSA: aoa: Use helper function for_each_child_of_node_sco=
ped()
 - Remove Patch ASoC: qcom: Use helper function for_each_child_of_node_sc=
oped()

Changes in v3:
 - Change Patch name ASoC to ALSA for patch 1,2.
 - Change commit message information.
 - for_each_child_of_node_scoped() instead of
   for_each_child_of_node() in i2cbus_add_dev().

Changes in v2:
 - Fix error reported by kernel test rebot
 - Keep "node"
---

 sound/ppc/tumbler.c                |  5 ++---
 sound/soc/fsl/imx-card.c           | 13 +++++------
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 16 +++++---------
 sound/soc/renesas/rcar/core.c      | 35 ++++++++++--------------------
 sound/soc/renesas/rcar/ctu.c       |  8 ++-----
 sound/soc/renesas/rcar/dma.c       |  4 +---
 sound/soc/renesas/rcar/dvc.c       |  8 ++-----
 sound/soc/renesas/rcar/mix.c       |  8 ++-----
 sound/soc/renesas/rcar/src.c       | 10 ++-------
 sound/soc/renesas/rcar/ssi.c       | 18 +++++----------
 sound/soc/renesas/rcar/ssiu.c      |  7 ++----
 12 files changed, 40 insertions(+), 95 deletions(-)

--=20
2.47.1


