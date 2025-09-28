Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB92CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgVWXjR1Zhdhc8zSxyjv4F7O/U9nUQzi18MFLMfjOGs=; b=ok1LIoOKnmF1eC2noSjP1ki0Dj
	NAf2zccJwEg46nTS/86fbSIObT4klSHc0cAUYnJf5jLACpa4AOiI0hJznfnGauOLHZIKfC6gtYDb2
	ADKSrcuD/H1K8v5290FgkofdWh1Jm6Q78/dZjXoOr8whSGvdjPE/v3A7eRR/R7ibuPz7nvzmMrNNh
	1IYok/AnJ/PvT1pQZ2PUEEOV1EP1MQeXVLSosCrH5w0FTcTAOfHF9vImZGQ/enYUrGLI5p0foT6Gy
	zBEOIrhg+YGoVbO4mg8nc8mypmZ6sNlr2GgnKb/DzCaA2ULZpkZxX7mePEeDxPDyJZNt5GfLCVnfE
	ju7CStmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nHm-0000000EWA8-1Slv;
	Sun, 28 Sep 2025 09:01:38 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nHj-0000000EW6U-1Y4P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 09:01:37 +0000
X-UUID: b565383e9c4911f08b9f7d2eb6caa7cf-20250928
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:6fcacf06-c994-44eb-8f48-428af6de175c,IP:0,U
	RL:0,TC:0,Content:22,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:47
X-CID-META: VersionHash:6493067,CLOUDID:f2b2493ad5f001821c876600443eafe6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850,TC:nil,Content:4|50,EDM
	:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b565383e9c4911f08b9f7d2eb6caa7cf-20250928
X-User: liqiang01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liqiang01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 581257618; Sun, 28 Sep 2025 17:01:23 +0800
From: Li Qiang <liqiang01@kylinos.cn>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: add unlikely hint to MTE async fault check in el0_svc_common
Date: Sun, 28 Sep 2025 17:01:21 +0800
Message-Id: <20250928090121.3068976-1-liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aNEsDswLSpBkf-5S@willie-the-truck>
References: <aNEsDswLSpBkf-5S@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_020135_762036_CBE8F5FA 
X-CRM114-Status: UNSURE (   6.03  )
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

> Does this result in a measurable performance difference?
> Will

Hi,

I did not observe a measurable performance difference in micro-benchmarks 
(e.g. syscall latency tests), since asynchronous MTE faults are extremely 
rare and the branch is almost never taken.

However, `el0_svc_common()` is a very hot path. Without the `unlikely()` 
hint, the compiler may not optimize for the common case, and after an 
I-cache eviction or branch predictor state reset the fault check can 
be mispredicted. Marking it as `unlikely()` makes the fast path layout 
clearer and reduces the chance of branch misprediction in cold-start 
situations, consistent with how other rare-condition checks are annotated.

Thanks,
Li Qiang

