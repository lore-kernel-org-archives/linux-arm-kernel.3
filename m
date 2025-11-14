Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF46CE8D5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/H7GHzQdEVJHWL6IxnBg2c0IP7Sxxl00BJqFqnDMZQs=; b=IMRDUEPAP+oQUX
	fl4xywNXppzlnGMA4bLOKsArF2dgBtq18jj5jUOGBSpb9YLnUR4m5lmKRHOxXUqK4HzUM6HRRxvN9
	E8O1NgSl06bjCQOlI6Vq2xdWTyZWrswEceIZx8OX28N7jyvbKZ91cfMY/dbhC5ugYApOwXEq2qvIi
	22ryYrIUJAehZqBD3/jNKKrumzVLXze8KkBFbu/ZM34jjFXFcg5N49nci5qtRpPu6/0/5VGz9Hvx4
	EeMSz5tK4z1PdPzp8MMGCfrT+D3yvy/cYFl93rrr83OtF5/FTAGjxyAlpdtCWcvbkgt41Sd63vwkx
	sjKmRbuLPelmZWRZv8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxBl-0000000Cnsq-3K1M;
	Fri, 14 Nov 2025 17:02:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxBj-0000000Cnrk-09io;
	Fri, 14 Nov 2025 17:02:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763139246; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P1zbySLBMoTuYWFzBJXE0e3U9S9ADb62KIYeWDu/hnFXM/rhr8nqeSPeVlb4n6oD0iydHND9ZBg6Qvcy7mBNwpNIppqyBXmiRpKxcyMq2mpHIkUFhZ/mob1UwQZBhE9VTYTkEzT7EO76CMqAS59cAjG1EEj7Z+xHZ8KqsC5yUDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763139246; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/H7GHzQdEVJHWL6IxnBg2c0IP7Sxxl00BJqFqnDMZQs=; 
	b=n83DtCqhT9N/20fxJEKKf6WmBPorVU2gHXJBVnRLL1307/U0xu6Q6Kcpw7hzvbMXNGol2ZdtK8msFdmli9QPYTCqTDwBCbDMRlh7TOuhA25yREcmDeP98fl42xF+qJJwKNXHK8MkcVqUVtQlG1+Dhv3Wp0XZsv2ggh9aPV8UUpg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763139246;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=/H7GHzQdEVJHWL6IxnBg2c0IP7Sxxl00BJqFqnDMZQs=;
	b=YWhFOohSBAKRoxsUW21p5utSu/GZuw1B/PQeLZweWzonb8DZSyqcol1yKIoqASw8
	rq66EqlN00hohSvpAVQYg68kpoTsUYsh0CO95Xuz6o+Fg/cZ3hJsh49o0iOBlq5GzWu
	xqS+Ip85MTQdnd+iOfq2PjkcA9yERrHw9WL7XuI4=
Received: by mx.zohomail.com with SMTPS id 1763139243754487.4274112916788;
	Fri, 14 Nov 2025 08:54:03 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 00/13] MediaTek Interconnect Cleanup and MT8196 Enablement
Date: Fri, 14 Nov 2025 17:53:54 +0100
Message-Id: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJeF2kC/zXMQQqDMBCF4auEWXfAEa3GqxQXNk7aWSS2k1QE8
 e4NlS7/B+/bIbEKJxjMDsqrJFliCboYcM8pPhhlLg11VbdE1GDIPdkrzqtP6rC13vW2oq5rHJT
 PS9nL9vNu49nK709h8znCfUqMbglB8mAibxn/NIzH8QURFBY6kAAAAA==
X-Change-ID: 20251114-mt8196-dvfsrc-59fc8901774c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_090219_151084_5DC595A6 
X-CRM114-Status: GOOD (  10.54  )
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

This series is a combination of binding changes, driver cleanups and new
driver code to enable the interconnect on the MediaTek MT8196 SoC.

This series currently does not add any users of it (i.e., no bandwidth
requests being made in affected device drivers), as the only one I
quickly whippd up is in the UFS driver, which is undergoing some major
refactoring upstream in a different series of mine.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
AngeloGioacchino Del Regno (8):
      dt-bindings: soc: mediatek: dvfsrc: Add support for MT8196
      dt-bindings: interconnect: mt8183-emi: Add support for MT8196 EMI
      soc: mediatek: mtk-dvfsrc: Change error check for DVFSRCv4 START cmd
      soc: mediatek: mtk-dvfsrc: Add and propagate DVFSRC bandwidth type
      soc: mediatek: mtk-dvfsrc: Add a new callback for calc_dram_bw
      soc: mediatek: mtk-dvfsrc: Write bandwidth to EMI DDR if present
      soc: mediatek: mtk-dvfsrc: Add support for DVFSRCv4 and MT8196
      interconnect: mediatek: Add support for MediaTek MT8196 EMI ICC

Nicolas Frattaroli (5):
      dt-bindings: soc: mediatek: dvfsrc: Document clock
      soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC clock
      soc: mediatek: mtk-dvfsrc: Rework bandwidth calculations
      interconnect: mediatek: Don't hijack parent device
      interconnect: mediatek: Aggregate bandwidth with saturating add

 .../bindings/interconnect/mediatek,mt8183-emi.yaml |   1 +
 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml       |   7 +
 drivers/interconnect/mediatek/Kconfig              |   7 +
 drivers/interconnect/mediatek/Makefile             |   1 +
 drivers/interconnect/mediatek/icc-emi.c            |   9 +-
 drivers/interconnect/mediatek/mt8196.c             | 383 +++++++++++++++++++++
 drivers/soc/mediatek/mtk-dvfsrc.c                  | 364 ++++++++++++++++++--
 include/dt-bindings/interconnect/mediatek,mt8196.h |  48 +++
 8 files changed, 785 insertions(+), 35 deletions(-)
---
base-commit: d8a3d478ec9200b852095cb96d166ca7909f57e0
change-id: 20251114-mt8196-dvfsrc-59fc8901774c

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


