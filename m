Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D420CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O57Z9kXdDW9ZvhXzAN1RTvICh19sqqK2KSZkn2nN/4o=; b=bpIxJk6XB843BSWzjsWkGhZ6J4
	IYZoCJjN/nvqvI4abHs+PixGJ2QIQxFjdr2oYwPuUMUFaDR1I7mBHLui89NRwjMUpB5ROXtVoJFYF
	xFdzGaJHaNLyfcX4NY2bTRZX/q19kydBiHKZxyVNPaqemfU2fvg/Yxz+oyG2EbsaeyJGuEoxKMeJf
	Hvpe+FQUEVSMM24RDRSccmLrcA1qJIVNLce57kTZn/TaTeeIyYVZcP4r918yK9ZijrPgQCDweQ7ri
	XDEvr+MwqycBlEh0S5NRMpP4R0jydK7ceSzMnvxSAIk01x3lkeb4ahRKwZbIuEnMXlFqAXQLZVu9H
	xKkdqHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrAf-00000005bfb-13d3;
	Tue, 23 Jun 2026 02:47:29 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrAc-00000005beQ-1Ya8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 02:47:28 +0000
X-UUID: d71f2ee46ead11f1aa26b74ffac11d73-20260623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:57e4046d-e2fe-4921-88a0-35e3f2cdd9ca,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:b120238e1bb89aa4ce6b6f1014414011,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d71f2ee46ead11f1aa26b74ffac11d73-20260623
Received: from localhost [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengyu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1455545477; Tue, 23 Jun 2026 10:47:14 +0800
From: Yu Peng <pengyu@kylinos.cn>
To: lpieralisi@kernel.org
Cc: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	guohanjun@huawei.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	pengyu@kylinos.cn,
	rafael@kernel.org,
	sudeep.holla@kernel.org,
	will@kernel.org
Subject: Re: [RFC] arm64: early_ioremap fails to map ACPI MADT on 64K pages
Date: Tue, 23 Jun 2026 10:47:12 +0800
Message-Id: <20260623024712.3480399-1-pengyu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ajkFE6TmwW6B/huP@lpieralisi>
References: <ajkFE6TmwW6B/huP@lpieralisi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_194726_731050_A6193F70 
X-CRM114-Status: UNSURE (   6.30  )
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

Hi Lorenzo, Hanjun, Will,

Thanks for confirming.

I will send a proper patch for this. The change I plan to post is along
these lines:

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index ... .. ...
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -79,7 +79,11 @@ enum fixed_addresses {
 	 * Temporary boot-time mappings, used by early_ioremap(),
 	 * before ioremap() is functional.
 	 */
+#ifdef CONFIG_ARM64_64K_PAGES
+#define NR_FIX_BTMAPS		(SZ_512K / PAGE_SIZE)
+#else
 #define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
+#endif
 #define FIX_BTMAPS_SLOTS	7
 #define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)

Thanks,
Yu Peng

