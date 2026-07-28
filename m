Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AD5C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2OZn93lcUXhMlXo83zxXhDSCZPYVK33cbHbh70WqO4=; b=y8JI7rG3Vm6srNGSIBDpBeOni/
	p0+y5siy3JNPhihMKReM/jBfFot16J7wZsOQjNQNIXldUS7PhLzHq8BNWVtXGbsJ2JJmDOlyHG6J9
	977WyCFpcpm4697lgmxE0emjEEnvZEhFvzQDHsyXZzf5oTtj5P2xtSEKMwUUx0en1d7C6mdoQzoXi
	gzArBtFQsbXKPwfbpNplcCLuZZjMxF/ZeWRLoJkIntcyRIrxiQUmhG2G60TcgjNsn3pCFDPUYX1pM
	eQ+WDee18tP1IQClLI/NgRfl8ENXEofOAJP6EMyRv1e04OOvFtZ6Rz4NwsygtNm5pXZJtw2WqSidB
	2t3o5xZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBc-00000004IQ5-0FuQ;
	Tue, 28 Jul 2026 03:08:56 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBW-00000004IOU-12zC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:08:54 +0000
X-UUID: a0f04d188a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:17281866-73e3-4b1a-8f12-c116d1f007df,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f1b7a3b3752b4c97600e637bdbf25927,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a0f04d188a3111f1aa26b74ffac11d73-20260728
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 591202663; Tue, 28 Jul 2026 11:08:38 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 0/5] firmware/clk: arm_scpi hardening (leak, OPP bounds, cpufreq)
Date: Tue, 28 Jul 2026 09:04:02 +0800
Message-ID: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.1785118770.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_200850_593796_31FD3313 
X-CRM114-Status: UNSURE (   9.59  )
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

Hi Sudeep,

Thanks for reviewing v1.

This v2 hardens the OF SCPI firmware and clock paths against a few
real defects found while reviewing linux-next:

  1) device_node leak in scpi_dev_domain_id() after
     of_parse_phandle_with_args()
  2) DVFS OPP count from SCP trusted beyond MAX_DVFS_OPPS (OOB read /
     bad OPP table size)
  3) DVFS index used as clock rate without an upper bound check
  4) scpi-cpufreq registered once only, and cleared on register failure
     so remove() does not unregister an ERR_PTR
  5) use PLATFORM_DEVID_NONE instead of bare -1 for the scpi-cpufreq
     platform device id (readability; Fixes the original registration)

Changes since v1:
- 2/5: add Fixes: 8cb7cf56c9fe ("firmware: add support for ARM System
  Control and Power Interface(SCPI) protocol")
- 3/5: add Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by
  SCP(System Control Processor)")
- 4/5: correct commit message (scpi_clocks_probe; multi-DVFS child
  overwrites the first good cpufreq_dev with ERR_PTR(-EEXIST)) and
  add Fixes: 9490f01e2471 / 67bcc2c5f1da
  All per maintainer feedback; code unchanged.
- add 5/5: clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
  (readability; Fixes: 9490f01e2471)
- Rebased onto linux-next next-20260727 (0d33d21e47d9); 2/5 context
  updated for kmalloc_obj() (logic unchanged).

Please review.

Thanks,
Xixin Liu

---

Xixin Liu (5):
  firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
  firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
  clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
  clk: scpi: register scpi-cpufreq once and clear on failure
  clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq

 drivers/clk/clk-scpi.c      | 10 ++++++++--
 drivers/firmware/arm_scpi.c |  9 ++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.53.0


