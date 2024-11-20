Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A9FD711C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iNi5/27yLXYkPi3ktDMgoQgu7LONT+bmPko1ZQSYR+8=; b=2l8gGNrOxCjT7zs2FFC+JjWXVt
	d/3YgF+IrJdN3jXHtldTqLI3FlkD7yH2hMLRHhsIQrgFwmIeS3l8WybEvuQIpYEuphTXhpX7UKeG0
	ob4M50tukuFilsEbrYdy6zPT0RnWz2BE1lWh3k7NZ8c8TsPriv7O5ndJXcxZo6oTe3+8RVDoVl3xe
	3JMAaUqAmu+ekd9BEUlvcWmucAnNghre3zc+6RQ0P773b5db0v+bq0/8M1stwhcRJwlYE+WrtcDvq
	VgE90d0LKZjh3SAigMLBVnZj0hCFyenMMggxv6hGNPn9rB+92U5NlFh3xRoivo2T69DxyVqSeNeR4
	CELSUU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnmP-0000000FpyF-32qA;
	Wed, 20 Nov 2024 16:42:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDnlR-0000000Fplz-2TKp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 16:41:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50A47A43267;
	Wed, 20 Nov 2024 16:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F790C4CECD;
	Wed, 20 Nov 2024 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732120872;
	bh=aUx8WmvWUdZe9uCMbeOk+jGccDxP0v/Ty901ThIZ4mw=;
	h=From:To:Cc:Subject:Date:From;
	b=Z9ZKrwdS9ZyEVCD6hk720/pVYqlXnt+g5p0RZARxQZHy8wN369KFm6kZkSFGBNCOT
	 9iVkdTsQxlzj8A8U8uHGGmLKerBOAzpuPtN6Yfn1QOsxPTILo/+J1rff5SDSL7uIQr
	 biPvRqhPR+yUi45Q7BUW0mHr1USfIS2lYIRKDyXYuY+eLuGPTDFY/1s3P6lSfRLV8x
	 iAO+88OL++YYqWiUyNAI9kpRs/48XF//reGdrx6FlRIpqDeSUC1TwZFASaCa10OVpM
	 3PyTtA2tyESB5y4+DzIi1CBDZ+4CU7kkrw2ZKsDizVq953LmXT9X0JQma/MXW5SsK2
	 OBr43+lRu0k4g==
From: Namhyung Kim <namhyung@kernel.org>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Stephane Eranian <eranian@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf/arm-cmn: Fix arm_cmn_node_to_xp()
Date: Wed, 20 Nov 2024 08:41:10 -0800
Message-ID: <20241120164110.266297-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_084113_693579_D9B33C05 
X-CRM114-Status: GOOD (  11.39  )
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

The portid_bits and deviceid_bits for XP type nodes are set in the
arm_cmn_discover() and it's copied to others in arm_cmn_init_dtcs().
But to get the XP from a node in the arm_cmn_init_dtcs(), it needs
the {port,device}id_bits.

This makes arm-cmn PMU failing to count events on my setup.  What we
need is the number of bits in total which is known by the cmn config.

Fixes: e79634b53e39 ("perf/arm-cmn: Refactor node ID handling. Again.")
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 drivers/perf/arm-cmn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 49bd811c6fd6efdd..0e0d2f5cfdaea890 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -386,7 +386,7 @@ static struct arm_cmn_nodeid arm_cmn_nid(const struct arm_cmn_node *dn)
 static struct arm_cmn_node *arm_cmn_node_to_xp(const struct arm_cmn *cmn,
 					       const struct arm_cmn_node *dn)
 {
-	int id = dn->id >> (dn->portid_bits + dn->deviceid_bits);
+	int id = dn->id >> (cmn->num_xps == 1 ? 5 : 3);
 	int bits = arm_cmn_xyidbits(cmn);
 	int x = id >> bits;
 	int y = id & ((1U << bits) - 1);

base-commit: bf9aa14fc523d2763fc9a10672a709224e8fcaf4
-- 
2.47.0.338.g60cca15819-goog


