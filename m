Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014E0C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 00:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gwNE+OBSnQyLjeDU8H4XDoiVsytL2D9V4t/U5WKHu8=; b=NtxsyO7EbvMpJv5lM7COPNV+Ub
	h653DT9XTIW1aWqof2RLTvEijlXrOlkKhifwUeIccanUgnLM+/ZyEoWXca0YQrzufKL/iq+YLkBcy
	VK4hzeozFSonhHOL3ATKq9l89r+/w27MPjtmA13/J8IVd436n5umOBUq/DzCC4kgvPmPLVxKjdjRq
	bB45qZdQzBYti5iNw1D+dTv8gJuV83ptlyExo96nx//O+IodxFpm6fSit0t2k5BTQ7W3kx+OLP49+
	bFfRR45ouqaIr67YxRamW8XvVxfhf2OjyzQALXPPIp7PHTsf3MtuKSfe0TQxSi8AzAfJqdnrjGfKZ
	nWRQLN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Mbf-0000000D2ye-03pP;
	Fri, 18 Sep 2026 00:37:35 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Mbc-0000000D2xK-2WHL;
	Fri, 18 Sep 2026 00:37:33 +0000
X-UUID: 1e47e1dcb2f911f1acbe4559397dec65-20260917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1gwNE+OBSnQyLjeDU8H4XDoiVsytL2D9V4t/U5WKHu8=;
	b=O0rVwSh5F81ot508m8Q9fWpIAAVAoohpA7b5k1r4x/V/sS7Mi6IUlDU06ZKrF9cD39KJUy/d3PfqIa2E5oFmP/v+QqnH9PN5dvAx3zSn3ZIewn3JkIrdF45Gn3KmlI8F9hJ+TxABrcF2IpmJiO9RI9EQyP7jluNyKwRmTd9v9DA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2f5f3de0-7277-4169-b533-789f4b46c75a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:37a17428-9ebf-4787-bb42-3cd26eee85aa,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|836|865|888|898,TC:-5,Content:0|1
	5|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e47e1dcb2f911f1acbe4559397dec65-20260917
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 822324489; Thu, 17 Sep 2026 17:37:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 18 Sep 2026 08:37:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 18 Sep 2026 08:37:22 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/2] Allow mtk-regulator-coupler to be built as a module
Date: Fri, 18 Sep 2026 08:37:22 +0800
Message-ID: <20260918003722.2764284-1-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_173732_643180_FB429BA1 
X-CRM114-Status: UNSURE (   9.39  )
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

Hi Mark, Liam, Matthias, Angelo,

Gentle ping on this series, sent two weeks ago:
https://lore.kernel.org/all/20260903062056.1024263-1-justin.yeh@mediatek.com/

Is it OK to pick up as it is, or is there something you would like me to
change first?

One note on the routing: patch 2/2 (soc/mediatek Kconfig) depends on the
exports added by patch 1/2 (regulator core), so the two have to land in
that order - ideally via the same tree.

Thanks,
Justin

