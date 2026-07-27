Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D6EC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oBEaaONyUNWyV7rtkI1TF+a8dnmSJE1UhFf9uxm6AOA=; b=h8PKokpWmoNG/wDvgjt11RFN7w
	6XgqgnUKOysok5ers/C4rscDJPWAPXvmc59gUyczD3/yj/T92K4ONH2aDfcCZq/p7v61Xt4P0cC8A
	180k94yZfPEhLAyp3XS2vfo1uR+CICht4pcqmvkwa4PfKV5FHBdrbbTSCHQNj1F3hhoymUV72btaT
	etHj1yce3zBZ74U0fxF8VFaalGz3ZNJ056nEfW3VbQYomO0oJ1CsiL5IhGmxBJte+UYV0zBGeubxU
	YkxMvsdV5TXT0ZcDoAUvsA1v1OEwJOKu+axZ861Qkwx0KgEnN/MAxs9SgvbpWmg9kVVkV12pSnpH6
	3Ve9NDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBCS-00000001pXu-43kN;
	Mon, 27 Jul 2026 02:36:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBCH-00000001pSp-338c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:36:09 +0000
X-UUID: defb1576896311f1aa26b74ffac11d73-20260727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:47e22d99-6cd9-4407-9870-263a0864548b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:e550ef9e2d6cbeca3e996a2c2d717109,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: defb1576896311f1aa26b74ffac11d73-20260727
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 326443258; Mon, 27 Jul 2026 10:35:46 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 0/4] firmware/clk: arm_scpi hardening (leak, OPP bounds, cpufreq)
Date: Mon, 27 Jul 2026 10:19:15 +0800
Message-ID: <cover.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_193608_855678_21A8D192 
X-CRM114-Status: UNSURE (   6.26  )
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

Hi,

This series hardens the OF SCPI firmware and clock paths against a few
real defects found while reviewing linux-next:

  1) device_node leak in scpi_dev_domain_id() after
     of_parse_phandle_with_args()
  2) DVFS OPP count from SCP trusted beyond MAX_DVFS_OPPS (OOB read /
     bad OPP table size)
  3) DVFS index used as clock rate without an upper bound check
  4) scpi-cpufreq registered once only, and cleared on register failure
     so remove() does not unregister an ERR_PTR

Please review.

Thanks,
Xixin Liu

---

Xixin Liu (4):
  firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
  firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
  clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
  clk: scpi: register scpi-cpufreq once and clear on failure

 drivers/clk/clk-scpi.c      | 8 ++++++--
 drivers/firmware/arm_scpi.c | 9 ++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.53.0


