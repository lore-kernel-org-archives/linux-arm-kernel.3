Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C005CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqo1+7mglImJW3/ESP2sAU0K/vghCbEUc7ur867asyY=; b=LauhHVbO+xDtN0pi24WT9OzQA4
	deTygEtusjg+a3Cg2Ews6vwzF02oG2iJm5abhBEH3GkC6kBuYBuVWFgvl7lU73YQaRWg2qHVaJ6QI
	avrP1EcYMDbYOOZNa2ZAxRs7kExfDUGkzlVffVYv65ZX1A5wRGanNXrVHfiymmvTmlk8sRml+tVRm
	Z9BOKpNpn2d3RqL8Dmz5ob87QMdBQ6KQgcf9tjpj87/1Gm53BcB/ZczHBmm69TNBBHiVDEIFUFDUu
	LQV5fQ0xSVzDbafwXMj2t4M6dj8fLCwYZI/mi9c72hdSqsCnm3vjpIur7LO58ML/mKJL2VlswGh1s
	BDYn4yOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfLW-000000010QV-3D7h;
	Mon, 08 Sep 2025 17:08:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvahq-0000000GvDL-0e1g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:10:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3e2055ce973so2268186f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757333445; x=1757938245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqo1+7mglImJW3/ESP2sAU0K/vghCbEUc7ur867asyY=;
        b=epChbiyXTKDTgCLtmN1tQ9Qcrh4XOhJyulF57mPTw7kAOP8dsxDiCDB2xp2FAx40yg
         wC7ykMSsxYYEKwO6ONeZz9XQYfsbqx+atg7dpAMwqfs9ingV8wUER9R1OpCN+i18EY9j
         E6C2VYHxUwzirvwbupNjfUVDbDpQo95oNw68hgReArmjKkJX/LmyQh7dFyznzjGnB0mv
         abOSGiC3ES4bcFMJhKqtTBqb/KEElNN/UQu10ad6Xrny8CXKPqBn1tU6OIFBB8d7MU4F
         +Boy4k8HsI1HsTZzrFEb5H5zo173PPUCBmKF2AlgPcQ/9HsK4rq0CerI1GFHUwmmhPxe
         rU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333445; x=1757938245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqo1+7mglImJW3/ESP2sAU0K/vghCbEUc7ur867asyY=;
        b=IAcO75LD4hNByib93z3RQBtI0FKWIA0TT1AFkNDINOAHHz1IJ+AH35UmV90PCMLPxg
         m36XJ+Rgqob5jV46qzRv8upCCFqpj7s4SY9Gv6975YZ27VaoV5n4jCwKC6Vu0z/gOowi
         okTp+E7++DvTGm0TA1qdxiM3+/sOfG/4sliQP6VTAPVirG8QXHH0maCC7nhDwv8Tq0dc
         hTPIAGqPMNh+CLYAlMC8wOvH7qEiNLHBtNbHh2o5QoMHwaAQ7oNBWyHUjQkvxYCBXxKD
         l+s1jMCfet9tTbeHjFFHn7nB41FTAdNy1RxQnTY9OyLZa3OhydsyBnZ2v+2gtbEWUOlK
         /oMA==
X-Gm-Message-State: AOJu0YwwCRAQxJkQfW1sZ5trPlDU3uGUqqWx7OO5UfsWhA0uR2Jsh6gm
	9SLQFlbvW6BDn9xSLYLzC3BleXPI+g3c9VHYvxmom/LVI9Yb3ApeySxJ2Od80HYN/9A=
X-Gm-Gg: ASbGnctayZZ2eLfvu7jAbw1rRjzi7h3jAlRX641L4n72icmTUbmynnCACtWAabCCwTC
	+oL8fKBocBIF6+zgzqwixBobfjHRjLge8UUlGEu1wA3lgeEw2Wcc+gLOIRsK4P1JEkWiTv5gBFz
	yurfuAanKVt1x2cWwkN5TlsBk6zaMBwXaV0e0HcTGMvQ6odpJMV7UsELOJf9RjApPxHNm5CQHIk
	r3fDaiE8KPIriE22K9pyACCb+NQrFPJB4BL2SReNRPNR5JiEMBcFfvNEXVwdX2ivR0B1PjmevU7
	xlVgDq43rB1TFEQ4FzYmEzKi66yCxMQAm8vPyBUivPMF3F04ChHsZy9/gDNMh4GEoSZX1fsioBB
	LwuOhTV4CRp7+VS3TUHBFzmgkx5oJq5U=
X-Google-Smtp-Source: AGHT+IGBWxzyRFeeGevfk44/JfpKxel/pd+hKUi5ugftmEIb0KfQdxCQwGM4PG30BiUOferaK3FuAg==
X-Received: by 2002:a5d:5848:0:b0:3e2:5d59:4868 with SMTP id ffacd0b85a97d-3e643e07d6amr5074970f8f.46.1757333444701;
        Mon, 08 Sep 2025 05:10:44 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fba9fbsm41397825f8f.50.2025.09.08.05.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:10:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 08 Sep 2025 13:10:21 +0100
Subject: [PATCH 4/4] perf docs: Update SPE doc to include default
 instructions group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-james-perf-spe-period-v1-4-7ccd805af461@linaro.org>
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
In-Reply-To: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, George Wort <George.Wort@arm.com>, 
 Graham Woodward <Graham.Woodward@arm.com>, Ben Gainey <Ben.Gainey@arm.com>, 
 Michael Williams <Michael.Williams@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_051046_198239_7CE7AC9A 
X-CRM114-Status: GOOD (  14.24  )
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

The instructions group is now generated by default so update the doc to
reflect this. Also explain the period/downsampling mechanism in more
detail.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-arm-spe.txt | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
index 37afade4f1b2..cda8dd47fc4d 100644
--- a/tools/perf/Documentation/perf-arm-spe.txt
+++ b/tools/perf/Documentation/perf-arm-spe.txt
@@ -191,14 +191,20 @@ groups:
   36 branch
   0 remote-access
   900 memory
+  1800 instructions
 
 The arm_spe// and dummy:u events are implementation details and are expected to be empty.
 
-To get a full list of unique samples that are not sorted into groups, set the itrace option to
-generate 'instruction' samples. The period option is also taken into account, so set it to 1
-instruction unless you want to further downsample the already sampled SPE data:
+The instructions group contains the full list of unique samples that are not
+sorted into other groups. To generate only this group use --itrace=i1i.
 
-  perf report --itrace=i1i
+1i (1 instruction interval) signifies no further downsampling. Rather than an
+instruction interval, this generates a sample every n SPE samples. For example
+to generate the default set of events for every 100 SPE samples:
+
+  perf report --itrace==bxofmtMai100i
+
+Other period types, for example nanoseconds (ns) are not currently supported.
 
 Memory access details are also stored on the samples and this can be viewed with:
 

-- 
2.34.1


