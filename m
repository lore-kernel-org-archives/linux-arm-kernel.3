Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC598C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qnkcrqEZZ2EzdS7FFRlXKuqzpa+542JwGGqoElF5Pm8=; b=TByNd5UDf0ym8uwmJpG4JM5axX
	XAGLaeleHLhPculDRF4QBNneX7Bdu8bGLnJfrbj7DbNcQKT4u5mdNNATt6VXj1JMVuqO4jnFbBv/Y
	QGfgOWk00bBg7lHoxboKVCYZQVXrb8dsHV/q0Qoc3lOTd8OiQFD5IDm62olxo4GG2xBdFpYMjY32w
	jnHdETo3tZjVBcnhKwfNcupsBELxV25UbYNIG+EBhmsdzrJM4TtjC86njswprU7yCnv8mKBlQVhsW
	paJlRt96bizSCLxV4yB277ASutEcZtDDJPcYCgacYzvwIVxjkrwoJV473x52nyand0RlC43TMqXAL
	1Vem6syQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqRX-0000000E0bS-20u2;
	Fri, 14 Feb 2025 07:48:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqMj-0000000Dzk3-1Lj0;
	Fri, 14 Feb 2025 07:44:05 +0000
X-UUID: 71e606c8eaa711ef82ff63e91e7eb18c-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qnkcrqEZZ2EzdS7FFRlXKuqzpa+542JwGGqoElF5Pm8=;
	b=Ecd7kKubJaXmx2p9h6OGB3azuIGoDI4uAv7AIFmRWwW3Fjf2mxwUxxkcXGhfG5kptGaXq5sZDSHQKZKT01ulk8xPjQ5Qe3XJytxwD8SMaFfrWagG07tMIgkE5obAUP7fUEWwCKBAh1CQiHq0YgS34tJQLqqLr0cLCZdGxT2/iEg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f9f47c66-fa3c-4c2e-b96b-32d439108f3a,IP:0,U
	RL:0,TC:0,Content:21,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:21
X-CID-META: VersionHash:60aa074,CLOUDID:9fbcbe24-96bd-4ac5-8f2e-15aa1ef9defa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 71e606c8eaa711ef82ff63e91e7eb18c-20250214
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1154846954; Fri, 14 Feb 2025 00:43:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 15:43:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 15:43:53 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v3 0/3] fixed mediatek-cpufreq has multi policy concurrency issue
Date: Fri, 14 Feb 2025 15:43:31 +0800
Message-ID: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_234401_363125_37E687CD 
X-CRM114-Status: UNSURE (   6.76  )
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

For multi cluster SoC, the cpufreq->target_index() is re-enter function
for each policy to change CPU frequency. In the cirtical session must
use glocal mutex lock to avoid get wrong OPP.

Changes since v2:
	  - seperate more patch for detail change.
	  - remove CCI transition_delay patch

Mark Tseng (3):
  cpufreq: mediatek: using global lock avoid race condition
  cpufreq: mediatek: Add CPUFREQ_ASYNC_NOTIFICATION flag
  cpufreq: mediatek: data safety protect

 drivers/cpufreq/mediatek-cpufreq.c | 63 ++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 17 deletions(-)

-- 
2.45.2


