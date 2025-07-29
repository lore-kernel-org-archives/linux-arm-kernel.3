Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F78C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4od4AUhUIJ9k4ABCwmJJPjKIu1r4CKovbv8tn3vh+5w=; b=yCYRcLcWkztdB7MhOyApnvqP8N
	w35mg8HjyzBBgzNoMwvJqGMfsYQ2tDsYO4UnIRHlV2INRIXETDahfacmnQr2TXgmYAhaoX1qb6Rf/
	ulcI6DOoAEArA4Kcz5unTBihiYcPrMR543Ws4vmsMi1C1bEbQgzjkptVF5oPAuKFXOyXkOp+EqMZd
	zQmd528C8uWFm6F6KNGonT03YsXAOItIGj+FzUdDd0llOF8/bc3ptwxJfG6LrpE9jtPQEN0DQWYHh
	BBOhq9ZFTEb9hwK1nZj+nSSs+2QnKhEriEOsK4OlmBN43SPvQG4C3m9CrGlSyhWEWNALuuUNjfy3S
	pSI9EMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjkM-0000000Gkn8-0aYR;
	Tue, 29 Jul 2025 12:47:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjbU-0000000GjvL-1DFP;
	Tue, 29 Jul 2025 12:38:49 +0000
X-UUID: f50f37f66c7811f09eb0dd999d3936bf-20250729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4od4AUhUIJ9k4ABCwmJJPjKIu1r4CKovbv8tn3vh+5w=;
	b=qbE5D2XdyLNDczPmYh2YidkP5mp4jHowmclyhsVB8WN4oUW6g56KvPF0ZfDg3grfT5qAawGbVmRoSL4mVM/LthSHptTW3zzCfGmK63uKlna3/qE3QGkeTgYfo8/cvfrlTy0MK8ThVP2egqI+B2d9FO1uxxCb03QH8g3KuJ5QPDI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:0460c782-9602-4915-85b2-d14337220ef3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:cd6f5e50-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f50f37f66c7811f09eb0dd999d3936bf-20250729
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <akash.tyagi@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1946173411; Tue, 29 Jul 2025 05:38:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 20:38:37 +0800
Received: from mtisdccf01.mediatek.inc (10.18.1.155) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 20:38:35 +0800
From: akash.tyagi <akash.tyagi@mediatek.com>
To: <ziy@nvidia.com>, <david@redhat.com>, <surenb@google.com>
CC: <akash.tyagi@mediatek.com>, <akpm@linux-foundation.org>, <vbabka@suse.cz>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<mhocko@suse.com>, <jackmanb@google.com>, <hannes@cmpxchg.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <chinwen.chang@mediatek.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
Date: Tue, 29 Jul 2025 18:00:28 +0530
Message-ID: <20250729123028.1224786-1-akash.tyagi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <E70C1648-DDAB-4027-AB07-1C19B10C6AEF@nvidia.com>
References: <E70C1648-DDAB-4027-AB07-1C19B10C6AEF@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_053848_337458_71990EB9 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, 25 Jul 2025 at 10:27, Zi Yan <ziy@nvidia.com> wrote:
> But there is this known problem that CMA can fail temporarily due to
> short-term pinnings. See the "reliable CMA" work (don't remember the exact name).
> I think you mean Guaranteed CMA[1].
>
> [1] https://lore.kernel.org/linux-mm/CAJuCfpEWVEqsivd7oTvp4foEho_HaD1XNP8KTeKWzG_X2skfGQ@mail.gmail.com/
>
> Best Regards,
> Yan, Zi


Hi,

Yes, the issue I described is actually related to Guaranteed CMA[1].

I have rewritten our problem statement to address concerns more specifically related to the Android common kernels.

Problem statement:
Android Common kernels usually have an out-of-tree patch to prevent file-backed page allocated from CMA.
It allows some allocations which have lower chance of being pinned to use CMA to improve CMA utilization controlled by a flag __GFP_CMA.
https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora.org/


Additionally, android kernels create cma pcp list for pages less than PAGE_ALLOC_COSTLY_ORDER, but not for THP pages.

This way we noticed some UNMOVABLE allocation also occured from CMA via pcplist as for THP there is pcp either for movable or UNMOVABLE/RECLAIMABLE but not for CMA.
so we moved CMA pages to movable for THP.

		movable = migratetype == MIGRATE_MOVABLE;
#ifdef CONFIG_CMA
		movable |= migratetype == MIGRATE_CMA;
#endif

		return NR_LOWORDER_PCP_LISTS + movable;
		
		

Now, this way we fixes the issue where CMA pages wrongly placed in UNMOVABLE PCP. 
But now if there is a GFP_MOVABLE allocation (even without __GFP_CMA) (which android kernel maintains out-of-tree patch as share above), might pull that CMA page from the PCP.
This breaks the intended use case of the above patch, which is to allow only allocations that use the __GFP_CMA flag.

To address this, we have proposed introducing a CMA PCP for THP pages as well.

I would appreciate your review and feedback on whether this is a feasible approach for adding a new PCP in Android common kernel perspective becuase Because having many MIGRATE_CMA pages 
in the THP lists could cause several performance issues.


Best Regards,
Akash Tyagi

