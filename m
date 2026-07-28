Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0035C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqykeiPyItITDq8dizKGiAEUcaUhExCzA8hoyRG+lzI=; b=c+QyM3JmyVjLZXW+sIzxHwcHrj
	Dsl6oUFi08XRwg8+lxcthdf6okoqA+UuHMzNzsWUoOb9JvEP6yYOvIhYdJwIxcdr0XJvy4ku3KWbV
	r4ffznhwTLlefurvbkuC1HK1uwDa5w36pZDbJfjUICtGvRvTAMUCzzlNdmw+8HxW0KeZCKB48Od9W
	9+1xHD5dp3yi2Vz5otCPAkWdRAvqW6MImW0SHfxMlVdKHJYVsYQqViFXbQ9Gjceg/49hVx8CpSLQT
	rRpY12xXjOF4DbqwNcJ9+4Npwd/sxm8SVA6bkiw4Wstt7HnbdiquCVz54Ochys8KcXuRRK/2UijAc
	s9MmduHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBk-00000004IRI-0k2j;
	Tue, 28 Jul 2026 03:09:04 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYBX-00000004IOZ-0FjX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:08:55 +0000
X-UUID: a3ec672c8a3111f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d755d011-c631-4541-afb5-3ba07bb5851c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:7459a9f6fd1bf47d80d90b332cc50c1d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a3ec672c8a3111f1aa26b74ffac11d73-20260728
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1336185155; Tue, 28 Jul 2026 11:08:43 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 2/5] firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
Date: Tue, 28 Jul 2026 08:50:00 +0800
Message-ID: <022802f0b38f.v2.1785200642.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
References: <cover.1785118770.git.liuxixin@kylinos.cn> <cover.v2.1785200642.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_200851_394303_A64D8785 
X-CRM114-Status: GOOD (  11.03  )
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

scpi_dvfs_get_info() already rejected a zero opp_count, but still trusted
any larger value from the SCP firmware. The shared-memory reply only holds
MAX_DVFS_OPPS entries in buf.opps[]; a bigger count over-reads that array
and then sizes the allocated OPP table incorrectly (garbage OPPs / OOB).
The missing upper bound dates back to the original SCPI DVFS support.

Reject zero and out-of-range counts in one check and return -EINVAL.

Fixes: 8cb7cf56c9fe ("firmware: add support for ARM System Control and Power Interface(SCPI) protocol")
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/firmware/arm_scpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 43d6d9bbc7a9..68a730d22037 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -631,8 +631,8 @@ static struct scpi_dvfs_info *scpi_dvfs_get_info(u8 domain)
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (!buf.opp_count)
-		return ERR_PTR(-ENOENT);
+	if (!buf.opp_count || buf.opp_count > MAX_DVFS_OPPS)
+		return ERR_PTR(-EINVAL);
 
 	info = kmalloc_obj(*info);
 	if (!info)
-- 
2.53.0


