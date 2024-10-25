Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9E0D0C5FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Byp+PjWRYn6GO1JC0ss9FiWTFeXk+otd8z4kS2/JCSI=; b=j1YN3OEvYCxMw6kZaJ8ripAOnC
	hbTR/bgr0Tet4Qzn4JOXiZeI6+hkzFgWeNc+7/B7s39DNwvM9CGkqdavuzHdCXQa8hKXj4BJWtZDO
	vwweZMD2vVSYmbfGRSnT82o2vYCBAzOGsUpooj+cVSn/5x9Bpnx0CvyqQwEu65HOIeF2JVPkf2HeD
	L2rCds/WpVvJKD3fOO2T2cNMu/BWlRdY0fE7jhBEFa/SUgA5MUPozYi5BFgQp/CxLbRA4WMv4ACz1
	Pcp+TDBvlNqgjKL4EdUcK7fa9GF5dfvn1xbCSb2t5g7/t4FRk5CUD0yQ9Ss2N/gzKsub14TyaTn8+
	YxGxRICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I5n-00000003Rzc-1zH5;
	Fri, 25 Oct 2024 11:02:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hvh-00000003PrY-12Vb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:52:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12B6E497;
	Fri, 25 Oct 2024 03:52:56 -0700 (PDT)
Received: from VDW30FN91H.arm.com (unknown [10.57.79.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 144843F73B;
	Fri, 25 Oct 2024 03:52:23 -0700 (PDT)
From: Graham Woodward <graham.woodward@arm.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	Graham Woodward <graham.woodward@arm.com>
Subject: [PATCH v10 1/4] perf arm-spe: Set sample.addr to target address for instruction sample
Date: Fri, 25 Oct 2024 11:52:09 +0100
Message-Id: <20241025105212.51779-2-graham.woodward@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241025105212.51779-1-graham.woodward@arm.com>
References: <20241025105212.51779-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_035229_358897_AF24848E 
X-CRM114-Status: UNSURE (   9.17  )
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

For an instruction sample, assign the target address to the field
'to_ip'.
If it is a non-branch record, to_ip will be 0, presenting a non-valid
target address.

Signed-off-by: Graham Woodward <graham.woodward@arm.com>
---
 tools/perf/util/arm-spe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 138ffc71b..76d41c91f 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -400,7 +400,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 
 	sample.id = spe_events_id;
 	sample.stream_id = spe_events_id;
-	sample.addr = record->virt_addr;
+	sample.addr = record->to_ip;
 	sample.phys_addr = record->phys_addr;
 	sample.data_src = data_src;
 	sample.period = spe->instructions_sample_period;
-- 
2.40.1


