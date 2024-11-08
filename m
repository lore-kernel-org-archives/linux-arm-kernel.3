Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEF4D5E140
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7HqclB1EjyymZaIs5NdapuhMiQdBA7440+mZymKrGw=; b=mJXGFIg03waRjM3gOXEBuRhMJu
	HZpaGVemn3oeNLWjJgu47qNL03+T+yCAvRdLAtmY8agwuqwy6LofjPkhA+/Tncla31zALu1oVMDC6
	kq2VopjMUhJ9ls+Zgm3FpFaPjgTwD4E2YJPfXlM7bft6Opcmo4rxJbq8jQUUZF8l839+WkHYnBmnR
	CldC8IgDPl1HMKr+SKfh+GOBADMh95Cb+1lfHiRVgLfSGMyqrIVCZdSJ22NfmD92OBMXrWo+PW/Xc
	FPG3YlsH391SU8xkJfB2EdJd5awFTG4vw+x81dLH8LHkCLucYmGbiKVHqPnvdx/1FwkBdk7GKPTV9
	QxmDoPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9IiT-00000009WYR-2cCz;
	Fri, 08 Nov 2024 06:43:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Iez-00000009Vuj-1Ujv;
	Fri, 08 Nov 2024 06:39:58 +0000
X-UUID: 419959fa9d9c11ef82ff63e91e7eb18c-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=H7HqclB1EjyymZaIs5NdapuhMiQdBA7440+mZymKrGw=;
	b=SFKN9PILuj6x0mTzrjvzbjhlD8L+4s8tG1q7/2CegJdy7IxLdCzgxmOLUtSvgxR8xpcdkN1LKXcnxZ3q1r+cJdxxoq/HTTpQvBljSaxJqXUy0irE/eI+Ju/tqMxhQ/roO5sjA3RuanOg9z0t7Wb8sXFEVNYZtqdGDzGwyHSGLcc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:65837ad2-e5e7-4f25-94e3-f2316c34902d,IP:0,U
	RL:0,TC:0,Content:18,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:18
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c566d31b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 419959fa9d9c11ef82ff63e91e7eb18c-20241107
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 416663485; Thu, 07 Nov 2024 23:39:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 14:39:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 14:39:48 +0800
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
Subject: [PATCH v2 1/4] cpufreq: mediatek: CCI support SoC , the transition_delay set to 10 ms
Date: Fri, 8 Nov 2024 14:39:39 +0800
Message-ID: <20241108063942.19744-2-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
References: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_223957_424535_04430C8E 
X-CRM114-Status: GOOD (  11.18  )
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

SoC with CCI architecture should set transition_delay to 10 ms because
cpufreq need to call devfreq notifier in async mode. if delay less than
10 ms, it may get wrong OPP-level in devfreq passive governor.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 663f61565cf7..f63183154e9a 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -597,6 +597,9 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
 
+	if (info->soc_data->ccifreq_supported)
+		policy->transition_delay_us = 10000;
+
 	return 0;
 }
 
-- 
2.45.2


