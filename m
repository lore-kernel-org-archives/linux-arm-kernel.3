Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9220CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 02:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Stl5UPAf2smb4LSnxAfCM/t0N65XawN8s3YPJSRxSig=; b=mdw34kNGMAbR/5C2skKhYMiMD7
	Ob8oX6Q0PnEbKHY0aG6c/0FtlsHW6oNhKfz+PBV3XEug6Ffxz7YDqJcZHot0Us+dHfOyo7sESGKBb
	IQdsBPb3efZ2YpkpnhjiF/Z0f1b7ZPJyH145iC2K6JTDKjhxIoVjBO3pFjXr9fw12Im+u8LGVn722
	cgUjeSZ7CYHz/Dd/sc4aG4J2HkoT795kt7sMh+rgM3vrPonFSf4WTOAEP5TkkaFBYiUlxaRXQkSF1
	VvisYsXg8CPxGW/eO1n2ZjCZcAVenahpwBhpJgGCScHx4WvlIIfivh10uniID+7IS1XSwsBLyK5jb
	pOWEiwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur65C-0000000DjNw-21wI;
	Wed, 27 Aug 2025 02:40:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur62U-0000000Disq-2aeG;
	Wed, 27 Aug 2025 02:37:32 +0000
X-UUID: c4712ee282ee11f09f706fa2197c6ceb-20250826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Stl5UPAf2smb4LSnxAfCM/t0N65XawN8s3YPJSRxSig=;
	b=hadQIWNAZoXrJGc3m7yfk5SAihZT04I3SsH+TsoUgDEP7F7i+ndnno0d40OW+QT8+sRM+WcAsP/x1BaYQ+e9jbiNp+UQ4KRxD6172kbbl+JN4b16uEieiQmoaa7rtkW8toLpz2sCLNO3WeMwkio37+yK/uFzY9A1BkrAj8rzfF4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:ec6f92b5-79ca-4d2e-8893-0b08e3ed0950,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9f8ae744-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c4712ee282ee11f09f706fa2197c6ceb-20250826
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 147235616; Tue, 26 Aug 2025 19:37:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 27 Aug 2025 10:37:22 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 27 Aug 2025 10:37:22 +0800
From: <xion.wang@mediatek.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <huadian.liu@mediatek.com>, Xion Wang
	<xion.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] misc: remove ineffective WARN_ON() check from misc_deregister()
Date: Wed, 27 Aug 2025 10:40:59 +0800
Message-ID: <20250827024201.21407-1-xion.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_193730_662008_53FE2F01 
X-CRM114-Status: UNSURE (   8.54  )
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

From: Xion Wang <xion.wang@mediatek.com>

Hi All,

This patch removes the ineffective WARN_ON(list_empty(&misc->list)) 
check from misc_deregister(). Please see the commit message for details.

Xion Wang (1):
  misc: remove ineffective WARN_ON() check from misc_deregister()

 drivers/char/misc.c | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.45.2


