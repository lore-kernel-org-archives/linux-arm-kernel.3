Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31EFD743F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 00:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=brt75ZxzSXCqVS1xSJ/WmACQvwCQPmsuOW04lBnqVj8=; b=s5CgHq1nSPPM7xyqEel4lTEwnS
	5UB/6NvYOsXMfjt6Lc7/12QZ3w78mksr5ZZuT2jV7L7NYAPWxJvsknHJYqG9pTqhdLdawMGBCRq20
	zZ4ha6vQZqrJ/ucvwRmYfGzifBWBazmXYBl8EOlCtX5fEiLcgO5hYxbWpiOT2fNCacp19vQbB3jKy
	9JrIRoAMhghj261orP2UmVYpU4Zl/H5HTwruy0lZAspZffoadDrDsMG8Vb35HazJGGjXrFfXnBnHz
	lbzG9lR1RO9pE1QP0DoClVBvG8fBS1BBwB9rwKYFNNr9oxa9iqbIOtD9lbpFNJmeG9iZvCRk5/RHQ
	iGB3qQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuqB-0000000GTQ1-3Vf4;
	Thu, 21 Nov 2024 00:14:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDupF-0000000GTJS-2J0q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 00:13:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B79ABA434D1;
	Thu, 21 Nov 2024 00:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9908AC4CED1;
	Thu, 21 Nov 2024 00:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732148015;
	bh=PCr1mtbsU4whEOP/4sRtwf9oHyJnRJYmHVmRK5noXAU=;
	h=From:To:Cc:Subject:Date:From;
	b=mWRh8QWx11qIK576H8qsAyfgMcRhz8vmthJcqiGFFdPLuCDyVeyh8/qi72dGpU4dB
	 GG+/pCzA40XHaz1Mf38e+5dz8NaNx0Xa/vAnnZDv08BUETqaRZnw2HpBmb52AoyovN
	 zCW4HHambK2FJpXHB29s2PaFODMg9zO4z8IMZjpQHEBymWKhIxG1KFtyGs+JSYWi4S
	 afSUNZ3DgEt5FcyaelXMrmk5u5DMtknKrpp0Gw7IUVWmcUSw5g2UGxAYrxXruw4HX1
	 v43U3JS8UdY0PV0R1qGmgA3UcjjGJtIOUEtaqjU1vQSDLEigR2VIl+fxGmD9xk9L7M
	 0Haw4dCjKedNg==
From: Namhyung Kim <namhyung@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Stephane Eranian <eranian@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] perf/arm-cmn: Ensure port and device id bits are set properly
Date: Wed, 20 Nov 2024 16:13:34 -0800
Message-ID: <20241121001334.331334-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_161337_659128_3D30EF23 
X-CRM114-Status: GOOD (  10.80  )
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

The portid_bits and deviceid_bits were set only for XP type nodes in
the arm_cmn_discover() and it confused other nodes to find XP nodes.
Copy the both bits from the XP nodes directly when it sets up a new
node.

Fixes: e79634b53e39 ("perf/arm-cmn: Refactor node ID handling. Again.")
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 drivers/perf/arm-cmn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 49bd811c6fd6efdd..b20fa600e510c54f 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2178,8 +2178,6 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
 			continue;
 
 		xp = arm_cmn_node_to_xp(cmn, dn);
-		dn->portid_bits = xp->portid_bits;
-		dn->deviceid_bits = xp->deviceid_bits;
 		dn->dtc = xp->dtc;
 		dn->dtm = xp->dtm;
 		if (cmn->multi_dtm)
@@ -2420,6 +2418,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 			}
 
 			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
+			dn->portid_bits = xp->portid_bits;
+			dn->deviceid_bits = xp->deviceid_bits;
 
 			switch (dn->type) {
 			case CMN_TYPE_DTC:

base-commit: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
-- 
2.47.0.338.g60cca15819-goog


