Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED17C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEHs3b5phPFn3BF7F+ULl9Hz6SGERFY3irR7WbMG6GA=; b=UUuw2sMrCGSNU39hFO0AN9yGYy
	VDkDSpoMJftz7lclFbPsQ2Wz3jZLPEgb1UMIT/6GUl3j+NmUS4No0T7UfE4hSa7qEDiz5f5vrBs0n
	GKrZGfCaSDcpPsgrYjuuXNRcFoRezt/1SE7FrbhLqAinfpdA2wrQOezstKdVsgV6ORT9MPJYn+bF/
	551gqN3gCy6e7hbwjdYH9HMkM4PUg+ltO3esum5nWwnO4HbZiyuVjnqiXsp4jRIhwxr6kNVkSbuJ6
	URX7pckEEZ4Y9UZbJH/drp6dqdOnAauIXvjXLbZInSOrXacaxVNrJZJt7zFaNx2M8YFZ9uHx93vto
	eZosHfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxl7-00000005m5t-2ZtN;
	Thu, 06 Feb 2025 09:01:17 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEm-00000005YPS-1BQQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f9c97af32eso749028a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826628; x=1739431428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEHs3b5phPFn3BF7F+ULl9Hz6SGERFY3irR7WbMG6GA=;
        b=f7/jHbAvKj0AJ7bnIUnvmip8pbymK1FCKAqeO030qoI5V5r/Y53DmAE+RVUgxp2cNX
         TGWsrdQ0FNpLnUfAPuAl/JG83MKoVcvjPkPbYFBQTenKO6UkzbC2Y6tupoZ8GvefhsHx
         R2y9oAwyL+hGkfgDbMMdA6qrym5UCnw89XJ03qOXac5U93Kzf8uCSr12bW8yTLtRlYyD
         xrpg9nAB2viERR4CQcJLMfRE9FpZfUeEg4aYstQVAQ8eKMBaJXndsX4ohoT6/nbIfvie
         HyqyVkloknqu7YduLiFTQhZzzy/2YYy+LEvzI3zGatU9mY1XoDViqROa+xcEUIS/UW1j
         hF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826628; x=1739431428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEHs3b5phPFn3BF7F+ULl9Hz6SGERFY3irR7WbMG6GA=;
        b=CKGbYehCjymvXnxevecVXP4Xq0jliC31+VDNCHH76EBbaHc4GBSG7qI0MSY57z2s1k
         LLWlCqT6HePmatUadTMyh1RqO/IE2ehFz+XCfWP04uEvIBrlrKHgIt6JsIG/v9EZvkkZ
         2ksq2TSlDVLY1/LEURIUiYdlS1wINoLO2YYlzVDTsqj7fEeUHhmcTBWSBLVK2Cdma0RV
         +ESuGyju37y3w5dZiTDSARZa7RwAHvAUWic5pOiNeTL09Wo9GLEWtMBe09BGBuBvb15x
         E6QXX7XcbZs8ENyR8tDozdxlael4IGzwuHV92J7V3O0U3yN8mURlPG68zxSQqr9wo/9o
         nIMA==
X-Forwarded-Encrypted: i=1; AJvYcCV8uncfkxoMDVXymjLtIEI6PhXDdFQ6OVxEEc3UZexyTxunRcpXJANzRj3s4ECxaUagTTMe+OOzDUgw5xzPHoIF@lists.infradead.org
X-Gm-Message-State: AOJu0YyBDN32E27CO4PbkJOK3ZX1L4qpDUj/lfflAzOgXvHvq/lfsq2g
	EuSi76IruWCmzE5/v+zl0JYPXdcvEO6lynKgLAmqf75S3xhf5p2hAxU6ra84CTM=
X-Gm-Gg: ASbGncsVyG+qNdGLHq0VqCevQ4EOQI6T50Aw+sPpufvzDbwuP+A9XSXBizAAXHVxS0e
	oOjr67GydPmwQkewf3G9PR88P2AH0d2p0HQCiJ8Sc2GfeEJXZHjQfpDCnc+UkpuxXz+8U1aB7Rp
	Ki80OJjxWJ1QFGjXv0Qevoyh3A2y8ClWXD+tFtf6v0yaFOqQoq3oLvzENUcfqy1TpRVcFHOAmuL
	y/bvQbu4Cdp0XLDH0X+Iw5CAMiFBntJOkhY5JMT1oCCP0DCrwVvtjsPK0UZgwFGLvT8qdZ+rUeA
	Dwj6pRjKBGNIlHxEWmoVy0VbJGeu
X-Google-Smtp-Source: AGHT+IEP7EfP8VYTZfd5HpBEgA2d9buHDVtURDszS/7//CqJNqgdAtdkSc3vqiKyaUdxMxfHiRPc5Q==
X-Received: by 2002:a17:90b:5108:b0:2ee:ba84:5cac with SMTP id 98e67ed59e1d1-2f9e0753cc2mr9646959a91.7.1738826627792;
        Wed, 05 Feb 2025 23:23:47 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:25 -0800
Subject: [PATCH v4 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-20-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232348_378793_A7FC4BEB 
X-CRM114-Status: GOOD (  13.45  )
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

RISC-V doesn't have any standard event to counter mapping discovery
mechanism in the ISA. The ISA defines 29 programmable counters and
platforms can choose to implement any number of them and map any
events to any counters. Thus, the perf tool need to inform the driver
about the counter mapping of each events.

The current perf infrastructure only parses the 'Counter' constraints
in metrics. This patch extends that to pass in the pmu events so that
any driver can retrieve those values via perf attributes if defined
accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 28acd598dd7c..c21945238469 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -274,6 +274,11 @@ class JsonEvent:
         return fixed[name.lower()]
       return event
 
+    def counter_list_to_bitmask(counterlist):
+      counter_ids = list(map(int, counterlist.split(',')))
+      bitmask = sum(1 << pos for pos in counter_ids)
+      return bitmask
+
     def unit_to_pmu(unit: str) -> Optional[str]:
       """Convert a JSON Unit to Linux PMU name."""
       if not unit or unit == "core":
@@ -427,6 +432,10 @@ class JsonEvent:
       else:
         raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
 
+    if self.counters['list']:
+      bitmask = counter_list_to_bitmask(self.counters['list'])
+      event += f',counterid_mask={bitmask:#x}'
+
     self.event = real_event(self.name, event)
 
   def __repr__(self) -> str:

-- 
2.43.0


