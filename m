Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBADD4A607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 06:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVAN2nV25GDIIQXzTcwEll/9LNN5n7+b8S2zrubJERA=; b=HWGStDYEr2Nd2eDJ2wMTIGgRVi
	OdkAXeHYVKiWG78dd6DwL6Er3wYgTF1BrvFZtJyIuEn3pv3hewH7gtQWwqfi1jlC94TH+yBOh2HlP
	QrxOmWjUqkg9HVGm3ITY0pD8JXR51GrciBP50NGhG9BU0TG7TSO09Ao2svE+7YaCSHTxS4EV/z9AM
	u9lX89gc+AGrytzUZ0/3iNFVg/L2xvSzbj40rmbvX68rOTwZ6NeoXsQZkbgBA7HZtJ3ktqV0jkXSc
	e/fqz12DaJLwlwHsR63IGu3uSSIa2mPrwONCYNUGjxMKe3+B+WXqPQ9axJGJ+GuEf21lri10R7i5f
	x6K01yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdHg-0000000Df6S-3Z9Y;
	Fri, 16 Jan 2026 06:26:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdHe-0000000Df61-0iZh;
	Fri, 16 Jan 2026 06:26:11 +0000
X-UUID: 3bd00b64f2a411f08b17dd397dc63300-20260115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MVAN2nV25GDIIQXzTcwEll/9LNN5n7+b8S2zrubJERA=;
	b=igI/hACLt66TPt7twCp1GxbSXTuRgT/VDD13jBmxn8J48Y3yhVIkWir7L5UvZE8fULyWK/tdoBUQv8+BXEcnU9TkQKX7gdslpieaHvNSY732GssKPHd2RRD5IxIjr2cK0anHi7Wfs+gg5AbGhaegoTdxjKwAtKZz83K99FpStXg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:5e686b2f-b889-4d38-907a-6cbe61626222,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:5047765,CLOUDID:f451db79-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3bd00b64f2a411f08b17dd397dc63300-20260115
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <robin.kuo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1981461107; Thu, 15 Jan 2026 23:26:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:26:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 14:26:01 +0800
From: <robin.kuo@mediatek.com>
To: <robin.kuo@mediatek.com>, <akpm@linux-foundation.org>, <ryncsn@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>,
	<chinwen.chang@mediatek.com>, <Andrew.Yang@mediatek.com>,
	<Qun-wei.Lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/1] mm, swap: Restore swap_space attr aviod krn panic
Date: Fri, 16 Jan 2026 14:24:59 +0800
Message-ID: <20260116062535.306453-1-robin.kuo@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <CAMgjq7Db38sNdsGe121oBFshiJz+vUrKWf5BjB3djAYUr40LLA@mail.gmail.com>
References: <CAMgjq7Db38sNdsGe121oBFshiJz+vUrKWf5BjB3djAYUr40LLA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_222610_244398_7E5459BE 
X-CRM114-Status: UNSURE (   9.89  )
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

From: "robin.kuo" <robin.kuo@mediatek.com>

Hi Kairui, Andrew, 

Thanks for your review and suggestions!
I update the patch summary to "mm, swap:" as suggested. 
Regarding the debug attribute, I will also try the version you suggested
locally (using __swap_space_attr). 

Thanks again for your help! 

Best regards, 
Robin

robin.kuo (1):
  mm, swap: Restore swap_space attr aviod krn panic

 mm/swap.h       | 2 +-
 mm/swap_state.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.45.2


