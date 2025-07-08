Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79486C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SmnDLQMvlZ5p5M7y6ywDYdMNOlGcOTiBdLsaKeylsC4=; b=SsGxWEV4sJEEbnW2DQ84L0HTxn
	cAD1tY6dQ4QBzEJ8wYmAxnkDxAVPG2E+W9LBA4ekD3BBJ8JbKQDsN1m9quJNSsjj7jriJO1G7Zk01
	GyaP3EQtJ8v0N4bETFN+Rjcgh1aDuMEhPUB2IHGT1/fdRmEPI/WoDS86WwFTOwGmvHOD0NqRh7rPJ
	FuQJdWNpEVAjU8aH+pUJbJVnElewTazTns89q8505srokOckOpmlhv9XK/n+5exZs9J9Wl872MZZO
	S8P+Sbsy19C4d8eIh8JYeZHXhsfPWwcT/8qjgHFFEpKKwFsDfN0StinQS8qXpFMlQ8NX2aTjg9yW2
	QWQeHfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1Rb-00000004Nrm-2NNy;
	Tue, 08 Jul 2025 06:04:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1PF-00000004NYk-2vNF;
	Tue, 08 Jul 2025 06:02:19 +0000
X-UUID: 14f786225bc111f09f706fa2197c6ceb-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SmnDLQMvlZ5p5M7y6ywDYdMNOlGcOTiBdLsaKeylsC4=;
	b=geoNyks+i8qD7f3U50D7AdEQidRFcDS6V5+Fg8oWMRfajdG13CIZ82n4ziYha0knhLeBvf0d61ZYtjb9ML+u4I1AY6KwtL0QC8f4mCsfp2sGxxCeXyxf7QO9SypOZpO1Uyh630geSljAyo5SSMvQ8lgMC+6d0RS2POppZ9rhE9E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:9295e5ed-ee8e-4f69-b891-707a28402744,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:9572a518-744b-4ed9-9ccc-90bf001fb3bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14f786225bc111f09f706fa2197c6ceb-20250707
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ot_zhangchao.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 416137905; Mon, 07 Jul 2025 23:02:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 14:02:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Jul 2025 14:02:04 +0800
From: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Hao Qin
	<Hao.qin@mediatek.com>, Wallace Yu <Wallace.Yu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, devicetree
	<devicetree@vger.kernel.org>, Zhangchao Zhang
	<ot_zhangchao.zhang@mediatek.com>
Subject: [PATCH v6 0/1] Bluetooth: mediatek: add gpio pin to reset bt
Date: Tue, 8 Jul 2025 14:01:47 +0800
Message-ID: <20250708060150.27375-1-ot_zhangchao.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_230218_098338_5FDDC426 
X-CRM114-Status: UNSURE (   9.70  )
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

Reset Bluetooth using hardware pin via dts

Compared with the previously submitted version, the following
information are some specific revision histories

V5-->V6 modifications:
-Add specific revisions in the changes from v4 to v5.
-Add hardware pin title and descriptions to dt-binding submission
   information.
-Modify the title descriptions in the dt-binding file.
-Add 7925 what is it.
-Wrap the descriptions of MT7925 chip uses the USB bus appropriately.
-Change the compatible string to mediatek,mt7925-bluetooth in
   the dt-binding file and driver code.
-Drop gpio-controlelr properties in the dt-binding file.
-Modify the descriptions of the reset-gpios
   properties in the dt-binding file.
-Change the node information of reset-gpios in bluetooth
   from high level valid to low level valid.

V4-->V5 modifications:
-Correct the spelling error of word provides mentioned in V1.
-Drop the xhci0 node and status property in the dt-binding file.
-Modify the bt_reset tag node to bluetooth in the dt-binding file.
-Add #gpio-cell descriptions to properties, nodes and requests.
-Make a separate patch for the changes to dt-binding.

V3-->V4 modifications:
-Modify submission information why use hardware pin to reset Bluetooth.
-Write historical commit information into the cover letter.
-Modify dt binding format information and
   the explanation text in the dt-binding file.

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
-Modify gpio to GPIO, SW to software,
   and fix other obvious spelling errors.

-- 
2.46.0


