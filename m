Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4DDC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rihT5LklrtpR0kzEsT66cm8MSESBfy35sRA2IEprsPg=; b=ZeD3tWQ558trJJccjF6Id+Kzxh
	Ld0ePhrWPThjfHxLtKiuwCtX8I9MsacvgBZkN3d/ksZZ2GXyg8se+gpX8HcLhH0/38itzNxQoXE+s
	72GtmtRd1z/MRNRmKiGoPz/N11Qhk+t6cpHAKPADKq8JiMxCO2L2JJcL86EWr9bWa4Vgh3mpzfoOi
	97mG5ceicPpzajrdqK1fXeMIqc246KHp4F7Cg+6v7yGTiWv9b96KjCjBzlqaRHs4Za9dzyR4OQAmW
	jvrckSapBzVrqUpHbuHuax/mquMRBlIN3CSTa6IknPR+tAcJ2Ic5WeyoM2JAYBdpFL7iM82WmInga
	/o5emyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLty-0000000CyBk-3RCv;
	Fri, 21 Aug 2026 09:51:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLtb-0000000Cxwb-2v79
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:50:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47fe377a217so461727f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305842; x=1787910642; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rihT5LklrtpR0kzEsT66cm8MSESBfy35sRA2IEprsPg=;
        b=IKrs6Zwiq0i4N4Ay9qLLWcg8rHawvudEl310YLjLojfpn1l6AlLu6M8DmdNnq3IQn7
         PynovoXZfeY7ry17JPwjpYH3mZ2nk7lfrQ6eF8dtxNEdGz+yFbqan5OQifbgKR9HDM4m
         s35zBYJGoHhcGe4zpiSojX4KZ1hwV0b1nz6VkjmQ8YJTp5fP+iyfQL9hglUse4S8IxSQ
         UU5LsYmEebr+wLpglLMU8w+636coRnXKSmfl9bDWKT2Ya0v+9hen6ZbDFRZeuRLKCW1u
         UNg2Uffn3oxx0oSegsCvW3mGHZWKyzZY8QFQroOXEmzhcboigPfhQ77IzlDHE/Kpg6po
         O3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305842; x=1787910642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rihT5LklrtpR0kzEsT66cm8MSESBfy35sRA2IEprsPg=;
        b=ETDbaTLNvHme0X43AzLH2BLKGUuOJwKPYqV//pcwbfcpMmKHjs0+ZN+3N7LThd8aN+
         fjAw7y7/Ez+Jvb0n9Es1WDOXPsa2BDccZBpieUoRnN5DL8dTWiotXmEcREeWqFZW8b/+
         wcqjkn8GZZ1A0QTryYbLsnhv8HUqJFlQsL2D1ZwROpoLioJbnmVbD4gwWerOoy7JmY8l
         DcJQ1Z0Pklgvf0aaL/SdTKc1wukk/0+ieocDTTGy6EHbnKbNtcRw62X9gIf7b28iQcKk
         Djn+M47LwoVwAMRz1dlgOjZdZPluW6Dvv2qAhO37yYxiJpH88SzlyRITxl0sJvE/2TYn
         3txw==
X-Forwarded-Encrypted: i=1; AHgh+RrlTcyIw1KQJvFTZcVP5+OWB1i8IxGUoIPGtuXug03oiFgNVUTGB8WmV+yrBoaNmrjuwMwDW/N2EcAcEg6Sa6uq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+hB6/vpNYbE02yq52WHckao7rxQFDZRMNAcZKniBeolA2R22f
	ekv++dXiroTQzBWJpicIa9iXmFzP1knPA8Q3m66dcoqMZRT6uQaFODdo3vINkLACCak=
X-Gm-Gg: AR+sD123lfK4NJifNmhEn5ILVhqpSNZHZyNtXNQu8RDStc7X918bUoXawBTXXC89wJY
	O4a4HCXKHbhxswe3CxHMDKqSg50z6qXBvfX9J+iqSoiIlPqNDQSPdQI7w+B14pS5/qxqNOrKE7+
	BVVka0f2cV10y1IUfnKEFGqa80SdI0fT7wml7aIluu+SFNWwBjDF04FR7WhWvq9DW60c15UfZQ5
	oDMdRZg1Vg+QfKA/nbDRgImsGRKU9LohOnsynABBB8HB/IegafofpoLZzi3IY6LtIcMi74kW3hI
	WZAFl4fGY289fXDaAFasrPaJOK/pVg+XuSoa3nsbgtkkvHsjW7ueonR6yd5eyFNJFhqm66vdRth
	sfpcRAdR8yKuRvacyGhnvCyZkkfR2Ibby+MgsAckGbpDivgn3M0QxdfUYFxFdD/IOF+kcTHNjBX
	UXFuGCaE3E9gGnYVQ02ZHtoesFrIzAn2Pf/F3wwRs1rhkU+z966Znx08Bta8JJfg5V
X-Received: by 2002:a05:600c:1384:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-499b84618f0mr55399775e9.14.1787305841820;
        Fri, 21 Aug 2026 02:50:41 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm14474284f8f.26.2026.08.21.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:50:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:50:29 +0100
Subject: [PATCH 1/6] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-hw_id-output-failure-v1-1-9d532ddabcc3@linaro.org>
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
In-Reply-To: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_025049_174710_0711191C 
X-CRM114-Status: GOOD (  16.55  )
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

In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
fallback, formatted queues will write their HW_IDs to unformatted
queues. This will result in an assert because of multiple decoders on an
unformatted queue.

Fix it by not inserting trace ID nodes on other unformatted queues. This
isn't an issue for v0.1 HW_IDs because they aren't global so will only
add to their own queue.

Fixes: 19c3e4db38c5 ("perf: cs-etm: Create decoders based on the trace ID mappings")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 6e04602ec204..8dfafd389066 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -306,27 +306,27 @@ static int cs_etm__map_trace_id_v0(struct cs_etm_auxtrace *etm, u8 trace_chan_id
 {
 	struct cs_etm_queue *etmq;
 
-	/*
-	 * If the queue is unformatted then only save one mapping in the
-	 * queue associated with that CPU so only one decoder is made.
-	 */
 	etmq = cs_etm__get_queue(etm, cpu_metadata[CS_ETM_CPU]);
 	if (!etmq)
 		return -EINVAL;
 
+	/*
+	 * If the queue is unformatted then only save one mapping in the
+	 * queue associated with that CPU so only one decoder is made.
+	 */
 	if (etmq->format == UNFORMATTED)
 		return cs_etm__insert_trace_id_node(etmq, trace_chan_id,
 						    cpu_metadata);
 
 	/*
 	 * Otherwise, version 0 trace IDs are global so save them into every
-	 * queue.
+	 * formatted queue.
 	 */
 	for (unsigned int i = 0; i < etm->queues.nr_queues; ++i) {
 		int ret;
 
 		etmq = etm->queues.queue_array[i].priv;
-		if (!etmq)
+		if (!etmq || etmq->format == UNFORMATTED)
 			continue;
 
 		ret = cs_etm__insert_trace_id_node(etmq, trace_chan_id,

-- 
2.43.0


