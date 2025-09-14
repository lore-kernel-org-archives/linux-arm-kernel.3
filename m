Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2A2CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8EG6l//2RPlmpS9c/r6hvNChHCCIsYeYKWB2oaD0rvg=; b=ulnaNhuTQkhgnyTXWl9mRhXAO+
	/x3LgbfCAWLTvkKFeUxapSBvbk5nBShjlmXy77eGEpOT82WhtktMgvb8FfHSH6yRg2qa42zhyU6Gc
	XcaBDx2iDwal9oIrEDQz16M8TVBMb36nEb0YJ5TvA9FOG9pEo3p6BrKxZRkX/T6wBn2zY2EYpf2Tp
	ZLib1e8Xr4Eqfp20ih9QgLfLar4V/dgaovjcILUjmJd1KHv2psDUvTl80yKkX4VWgFrvazfm7oqzz
	+4x+y2O0irJgDNXuhaQPzhrFSwhMQ78xXGVpr/gvcmaxLs3rcZfdKmlD83LfPh3TcRRai/UzDsp3L
	bAqGCb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlsB-000000018VE-1O7t;
	Sun, 14 Sep 2025 12:30:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxls8-000000018UW-2cpd;
	Sun, 14 Sep 2025 12:30:25 +0000
X-UUID: 931ab850916611f09f706fa2197c6ceb-20250914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8EG6l//2RPlmpS9c/r6hvNChHCCIsYeYKWB2oaD0rvg=;
	b=lxZsVIyJPGc2u1FsNpdnSBW81wqvPAkhjwCwUK5WAK4FyuKwmgshYVtGYsFPUNkeRhhiKaVh46+OS66RGg5QsqLYnX6J8Om5ysiyS7WedistLECO/hcBKW+edgf5IpX90SLlfF7TmP9at/CG8BZukF18fZwMdLr6kxNDme+tnA4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:1642eba5-0d01-4af0-9dc1-e1ef0fcd6076,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:4b1b886c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102,TC:-5,Content:0|15|50,EDM:-3,
	IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 931ab850916611f09f706fa2197c6ceb-20250914
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 120753748; Sun, 14 Sep 2025 05:30:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 14 Sep 2025 20:30:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 14 Sep 2025 20:30:12 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jjian Zhou <Jjian.Zhou@mediatek.com>,
	Hailong Fan <Hailong.Fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: Add support of VCP on Mediatek mt8196 SoC.
Date: Sun, 14 Sep 2025 20:29:23 +0800
Message-ID: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_053024_674584_26E4F191 
X-CRM114-Status: GOOD (  11.65  )
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

Add support MediaTek's Video Companion Processor(VCP) host driver to
control the MediaTek VCP Risc-V coprocessor.

> This series is based on linux-next, tag: next-20250912.
> 
> Changes in v2:
> - Refactor: split vcp driver patch to mult diff
> - Fix reviewer's comments
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250623120154.109429-2-angelogioacchino.delregno@collabora.com/
> [2]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250822021217.1598-3-jjian.zhou@mediatek.com/

Xiangzhi Tang (4):
  dt-bindings: remoteproc: Add VCP support for mt8196
  remoterpoc: mediatek: vcp: Add vcp remoteproc driver
  remoterpoc: mediatek: vcp: Add ipi-mbox communication
  remoterpoc: mediatek: vcp: Add vcp suspned and resume feature

 .../remoteproc/mediatek,mt8196-vcp.yaml       |  165 +++
 drivers/remoteproc/Kconfig                    |   12 +
 drivers/remoteproc/Makefile                   |    3 +
 drivers/remoteproc/mtk_vcp_common.c           | 1015 +++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h           |  284 +++++
 drivers/remoteproc/mtk_vcp_rproc.c            |  544 +++++++++
 drivers/remoteproc/mtk_vcp_rproc.h            |   93 ++
 include/linux/remoteproc/mtk_vcp_public.h     |  141 +++
 include/linux/soc/mediatek/mtk_sip_svc.h      |    3 +
 9 files changed, 2260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
 create mode 100644 drivers/remoteproc/mtk_vcp_common.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.h
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
 create mode 100644 include/linux/remoteproc/mtk_vcp_public.h

-- 
2.46.0


