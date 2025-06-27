Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572EFC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 06:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/K+osIkO7d6Wgo0/BDUoDEQxbCQtNaMJbw5veeEUgyY=; b=jRevVWjYZ9enZXAldqSofEO3AF
	+0gkYl5UndFouK1XU7/ikrQyHOp3hvpoLVczMJMduS3k4WTu9qunvFo3gXaeJz4t8mw33PeHdtlOn
	JA0aQ5j2m90s15DbXyY806W32mXDIUwtzCpv7KmLl0kaz3cTh7SQ6b7buu6tjfBg/9L9D/FtFpT05
	gUZLJ6LFijlf9K8GStOpsolMyJ/f9pkvGRXhQ42wTcCgrduZ9rde0Anm26r9v9K6WuaZEDnHVZDSD
	L8wp0wsyba7CFiL6vcobrTBcQ8teB1L9rpwdGyQCqQo9QPgcQhT3sCICtFrOPdtAoKHGUWGJhLexN
	5KXOv1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2CA-0000000Deod-1eoH;
	Fri, 27 Jun 2025 06:04:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV28c-0000000DeO6-3gPU;
	Fri, 27 Jun 2025 06:00:39 +0000
X-UUID: 08092040531c11f09f706fa2197c6ceb-20250626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/K+osIkO7d6Wgo0/BDUoDEQxbCQtNaMJbw5veeEUgyY=;
	b=H/gj53fU3JtwqjEuMQoKMNRfWDU2Sd7vPdw7WuauRCLKvPcVK2QhKAlAD9Zi4iJN5BgNqoCyFisaWYDxfv23xWLHXJpP4Ns78a1Y66F++IYGkc8Gk+DgNQI/BGxOymmeeLn/LhCSs1/J1EtOyxMwMA/2RUcYwfwVSDsEXSCPoGg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:f948265f-2603-49e3-bf89-4ed6170d90ea,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:0e7b4282-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 08092040531c11f09f706fa2197c6ceb-20250626
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ot_zhangchao.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1973420240; Thu, 26 Jun 2025 23:00:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 14:00:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 14:00:25 +0800
From: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk=dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Hao Qin
	<Hao.qin@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, devicetree
	<devicetree@vger.kernel.org>, Zhangchao Zhang
	<ot_zhangchao.zhang@mediatek.com>
Subject: [PATCH v5 0/2] Bluetooth: mediatek: add gpio pin to reset bt
Date: Fri, 27 Jun 2025 13:59:22 +0800
Message-ID: <20250627055924.7716-1-ot_zhangchao.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_230038_930276_9D0D9757 
X-CRM114-Status: UNSURE (   8.93  )
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

The enhanced BT reset feature builds upon the previous software-based
BT reset by adding support for hardware pin resets.
To maintain compatibility with existing projects that
still use the software BT reset, both methods are supported.

When performing a BT reset, the system first checks whether the
Device Tree Source (DTS) is configured with the appropriate settings.
If the specified compatible and BT reset GPIO are defined in the DTS,
the system will pull the designated GPIO pin low for at least 200ms,
then pull it high to trigger the BT reset. If these settings are not
configured, the system will fall back to the original software
BT reset methods.

Compared with the previously submitted version, the following
information are some specific revision histories

V4-->V5 modifications:
-Modify the comments mentioned in v1.
-Modify dt_binding files and 
   make dt binding a separate patch.

V3-->V4 modifications:
Modify dt binding format information and
   the explanation text in the patch

V2-->V3 modifications:
-Changed the capitalization of co-developer names,
   using the correct capitalization of abbreviations and full
   name, and corrected obvious spelling errors.
-Add a revision history.
-Remove the "BT Driver" in the prefix.
-Add the bt-binding document, include inforamtion related to reset
   pin and compatibility matching.
-Add a comment before the schedule_delayed_work function call,
   although schedule_delayed_work is asynchronous, there is no risk.
   Even if it is not completed within 200ms, it will only postpone
   the subsequent probe and will not have any impact.
-Add a comment before the btmtk_reset_by_gpio function call,
   if the compatibility filed or pin cannot be found in the dts
   files, it can still reset bluetooth using software reset.

V2 modifications:
Modify gpio to GPIO, SW to software,
and fix other obvious spelling errors.

-- 
2.46.0


