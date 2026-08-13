Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A8BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyGhfMJWOy5UX7QC+Pb+5kG1q/ulVWJkK1naSkffHGU=; b=dKe5a9Xr2NFJ03rDP1sb31IqcC
	SzeAdh0LTeM1VbZufZtjTNo7bSsDTpq7Y+fqTJVCbh5KIe7qzitsjKtS/UqExCvd4ayy9FZBxTP2M
	rlwqrTwIT8m+2FE1ZQWqFHILL9SMBvkZd2p9Mb1QL0GGx2PMj5qUnqZN/uvD/tGJcQwQsr99yHwZR
	iLgvOICtyZ0LkZ2goxd4A4V0v5yw3/tYZ3ITgcm/1X0uqtBdDz0NHIRjZ5pQmkLEdOF+1iiRpZ6o8
	tGwMvsxXuHBk8InFdlLvCTFSv09mIrpW7KJm7BKrd5YvZ+2YpjfG2ptSjKD0HUJ+Zs+qFdvylicyq
	ktF0rhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQNF-000000004MS-1daw;
	Thu, 13 Aug 2026 08:01:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQND-000000004Jk-2JAR;
	Thu, 13 Aug 2026 08:01:12 +0000
X-UUID: 22c6ef6e96ed11f1afed4741b24580c9-20260813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wyGhfMJWOy5UX7QC+Pb+5kG1q/ulVWJkK1naSkffHGU=;
	b=gZPixR7tMVwDQg5pG18au1/tT7K4N214zMVKyGdcP0RVACEc1SFdHDK+gHhpvgmnboImwHRaSOYnBJa+PyLEmxbrciECw4IrwOgUC2vzbwV7XfyN57uj08vqC3UyO62o7LnCP0IhAGLWc+gVVazSvGd73sjxtUvpH4dR6vMDdJM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5416a64e-5a15-4fd2-8002-3e7d0ac06dfe,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:337b6ee2-71f1-405e-92eb-6802d6af74fd,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|836|865|888|898,TC:-5,Content:0|1
	5|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 22c6ef6e96ed11f1afed4741b24580c9-20260813
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 725235099; Thu, 13 Aug 2026 01:01:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 13 Aug 2026 16:01:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 13 Aug 2026 16:01:02 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<Yt.Hsieh@mediatek.com>, Zexin Wang <ot_zexin.wang@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3] watchdog: sbsa_gwdt: add early_enable module parameter
Date: Thu, 13 Aug 2026 16:00:58 +0800
Message-ID: <20260813080102.2866-1-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <27ebd686-c5de-4abf-9683-6a700b7592bc@roeck-us.net>
References: <27ebd686-c5de-4abf-9683-6a700b7592bc@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_010111_610832_B0C37EE6 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi Guenter,

Apologies for the quick turnaround on v3. I received an automated AI review
pointing out the documentation indentation issue and wanted to fix it
immediately, but I should have waited for your feedback first.

I've seen your comments on v3 (same as v2) and will address them properly
before sending the next version.

Thanks for your patience and guidance!

Best regards,
Zexin

