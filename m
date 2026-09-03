Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD900C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gzpf1OJ3Rg0tl/VwErP7akFjhIt41l87hgHFrPCCF7Y=; b=v2Et8hhRSabgOPQfqkzE9dOEVu
	OdRzTzR8f1xMhS2Wy8C2d24kiy83nPvQJyWGD5039Lrh+nF4uqUpnA+1StFhPDgsXdfQ/9pWo5cZ4
	t1daB7F1XpsoWDAeEkECewJb26l307bVk7FKWTEqQBNpteL41wZXsNu+nKaFvphF9ZvkpXDwqc5JX
	EPoyDm5SwzvDvrEsaiWBmm874D3FU73AeRIQgVRiSCrSNc6nMtTsPmIPXNCKUWExbYjX8eyDPxpuF
	Zz8NWyYFIXi7Z+HKzn7+VJPDDifG8SG8Guov+jzLraPqstt3ZMo/NuoMYzXI84Mppv+cz/UpomjEo
	pK2ZFYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24l8-0000000H6Qx-0j7g;
	Thu, 03 Sep 2026 10:33:30 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24l3-0000000H6QH-1xiv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:33:29 +0000
X-UUID: de4f0758a78211f19a56ed5b684f684d-20260903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8894f43c-2d59-48e3-9529-0f9be7bbfd96,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:a7b6a4cc6a1ce0a7371aea852b224a30,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: de4f0758a78211f19a56ed5b684f684d-20260903
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 418386978; Thu, 03 Sep 2026 18:33:14 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: maz@kernel.org
Cc: 13667453960@163.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	radu@rendec.net,
	tglx@kernel.org,
	yijiangshan@kylinos.cn
Subject: Re: Re: [PATCH] irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()
Date: Thu,  3 Sep 2026 18:33:11 +0800
Message-Id: <20260903103311.580671-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87fqzrmywu.wl-maz@kernel.org>
References: <87fqzrmywu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_033325_806722_F4F1FC22 
X-CRM114-Status: UNSURE (   9.09  )
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

On Wed, 02 Sep 2026 16:54:41 +0100, Marc Zyngier wrote:
> I don't think that's a massive problem. If you can't enable the IRS,
> you can't do much at all. Your system is already completely dead.

Fair enough, I'll drop the Fixes tag and reword the commit log.

> Under which circumstance can this fail? There should be none. So if
> this ever returns an error, we should immediately stop with a panic.
> No need to clean anything up, just die on the spot.

OK, v2 will panic() on failure and drop the out_handle label along
with the no-op set_handle_irq(NULL).

Thanks for the review.

Jiangshan

