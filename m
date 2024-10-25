Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C041CD0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUZOa5hl/T3Pl+BeXyK/ffE7ZyF2QZVwBqJ2aLOAhZA=; b=2XWPQK/JieTr6RbgpgYM829OUQ
	zcQsSIETLgTlHI+u+WAshEQYyTaBcRhy8X+OC4Hi5sF4cjND3gy4DvdNWhNJFAR8UvA29/nSp3Q0g
	EAt9q+FCSGU0DVFa1lTGV7NpmHcj4gKWc9R3Dw4XvPXd7gknQqG7sK4Ccbua//RmaEqi6D7WZHiz7
	V2qkMBgoW925diq2rRF9DYrgpBv5J1aohfg0GX6oWn89P+nr09wh8qOvsZtXwUyml/H04QZwOwPaw
	wD+gwqokI/Ui/8p8NuCjhJpjwjDyyWdmGP8mCUF/xW+BnGquvaULnj4zftXi+6LSS0bjLNRQNLiCv
	HdXn+A9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LkU-0000000475x-3pMV;
	Fri, 25 Oct 2024 14:57:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LL4-000000041MI-09Po
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:30:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68830497;
	Fri, 25 Oct 2024 07:31:23 -0700 (PDT)
Received: from VDW30FN91H.arm.com (unknown [10.57.79.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 632793F73B;
	Fri, 25 Oct 2024 07:30:51 -0700 (PDT)
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
Subject: [PATCH v1 1/4] perf arm-spe: Set sample.addr to target address for instruction sample
Date: Fri, 25 Oct 2024 15:30:06 +0100
Message-Id: <20241025143009.25419-2-graham.woodward@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241025143009.25419-1-graham.woodward@arm.com>
References: <20241025143009.25419-1-graham.woodward@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073054_255685_2CDFBE54 
X-CRM114-Status: UNSURE (   9.27  )
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
index 856cc36f33d7..49b763807360 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -418,7 +418,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 
 	sample.id = spe_events_id;
 	sample.stream_id = spe_events_id;
-	sample.addr = record->virt_addr;
+	sample.addr = record->to_ip;
 	sample.phys_addr = record->phys_addr;
 	sample.data_src = data_src;
 	sample.period = spe->instructions_sample_period;
-- 
2.40.1


