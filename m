Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D2C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=; b=X8myK4cn++p6JDPo9yi9u3Tdqm
	CBn+RAKid3zRypVyFmPHTyJ8MHFPCg3n4qDOzGcdjO5ua/dcOQo4ph62scONfrzXIElR0dBdA6vUs
	SYUoERf2zdwsW7ZsaJXA5zUPVqJK8GtERnoU93UVWsbneBAn8l93aYoJidOBmkJrM96+b7hDhg6Ml
	xf0Qw6fa1ekaxV8/hEy5sE3B2vCkSG3G1eauLBFF+rCv13AiW9fwjgy+/90HAvLVTOc1BtqOZRRtO
	NldKnkYa7t7dAekvb29rVYi78Cvsu3EUymKi4gsqmXDPvm/jim6Cn6Coj6goyqW4cUs4UwtNRgm8k
	AtbF6zCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqFx-0000000A5lF-1HnM;
	Tue, 14 Jan 2025 23:23:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXps4-0000000A0Cu-1Epw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2167141dfa1so4673335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895532; x=1737500332; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=;
        b=JtdP3EMSxjdgE830+2na1pqRDrQutHtS2lztPd8QitmuJ0Kubn5dIdzFuoA8/h5L7F
         7aGQRsCVm+CzlXI8A6ubWSD1vJdltGy8+hU2OEm5gtYlra5qEwwE3GjSEqsCoI/xfwzK
         GrvG7rIi13mzs5T4YAGZ2ABM7/Rjtv+/7A+NgSTXEEe2FTRtbbtP7IXLmx/pWTDnfHG5
         q7nWHdNE/yUVH4goGGHYg8qcgKu2WRZPiQuLmHJXOgnvkjXpEZZT+0xLgqUs2BDVH0lJ
         8WVcUPMcsLG3jGWmlO1uK6qjbC3LOXSAC9xBeADdL22styzCrY5LoIii2KwsV3IHuyZT
         MW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895532; x=1737500332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=;
        b=boCi/smwpmxQXigjTbpraatDh+S0rRBOsLiby1QOR7LnCZ85KgxpMX2mt4QhaKCIRf
         Yv96zyRHnZOSyHyDcJjVpKXKwX3bOkdFS7H6nrLWUvNTY7kyh/HyLX3Keb3T5p5wLfyN
         Ef79alnknf31tztFMqXCXwTa2zovnxmLwp6WOYSkt9FR720KzIM1+sm+jXJaxsA9wk1P
         gtqzG1rSuHU4Nrs3IP/rxH/79fNxLPKGLEcuh4ohKtMOUGMrV0bMJEW6L/otj0LPF/1g
         87Q9h9zoMguXsJNMep+XQAx/NIOVXeukArjXjeRZEJCLRK9NErXsKCeMAy4BMJPHyRCY
         Tagg==
X-Forwarded-Encrypted: i=1; AJvYcCUiNHuQDqfjvv7fU+Y6KKQL0nqhqx2R2Zf2gec9Y3ONpi2PtQxB/ELKrWYnGZtt6AE8T15WxJOhfW1/zt/8mZZY@lists.infradead.org
X-Gm-Message-State: AOJu0YyRpLViD+5hRFZ43EZJa96CKvDJWZdqgOIlX8xcwtg4hUqct1TI
	+jSO1F21eIw5Nav3cBri9FS+kSkOImrN6wbQ4cfkpGJskTQAh/QlK2wo/g+07W8=
X-Gm-Gg: ASbGncujo5TF0Py4RA1Z8YcqyillDMOHu8kRiDvn5M1jc4dsk6V/R24wzrPFAu3BSf0
	hdH8cG4uYot9xqF8Ij+Q5w2bXF8LuoCkqyBFoEsgaqnqN0jHCyBwgO2+di1PEEFnEPWYLSzx/1j
	ih8PIDpekqkolwdrQyyIJsnGZi5kXX2hZ4cYatRbizSKwTwkguou6QB8/ViZIluGcUiwfNtTk9e
	Mthjm+q8YK1j8ZQiY8aEaG0wSb1vLfO8V4Ioj45BI6fH011nfVZDra22Iczgl2SJ7upZQ==
X-Google-Smtp-Source: AGHT+IGY7+84arGT8AswRpB+pqwECCjX/DmctkDVIPDIQHV61usZj0/p7BRGYknWv9dWJ1AzycUGOg==
X-Received: by 2002:a17:902:e892:b0:215:6c5f:d142 with SMTP id d9443c01a7336-21bf0d16349mr10455835ad.20.1736895531696;
        Tue, 14 Jan 2025 14:58:51 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:44 -0800
Subject: [PATCH v2 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-19-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145852_339761_6137772E 
X-CRM114-Status: GOOD (  17.72  )
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

RISC-V relies on the event encoding from the json file. That includes
arch standard events. If event code is present, event is already updated
with correct encoding. No need to update it again which results in losing
the event encoding.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
 tools/perf/pmu-events/jevents.py                    |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/perf/pmu-events/arch/riscv/arch-standard.json
new file mode 100644
index 000000000000..96e21f088558
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
@@ -0,0 +1,10 @@
+[
+  {
+    "EventName": "cycles",
+    "BriefDescription": "cycle executed"
+  },
+  {
+    "EventName": "instructions",
+    "BriefDescription": "instruction retired"
+  }
+]
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 5fd906ac6642..28acd598dd7c 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -417,7 +417,9 @@ class JsonEvent:
       self.long_desc += extra_desc
     if arch_std:
       if arch_std.lower() in _arch_std_events:
-        event = _arch_std_events[arch_std.lower()].event
+        # No need to replace as evencode would have updated the event before
+        if not eventcode:
+          event = _arch_std_events[arch_std.lower()].event
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):

-- 
2.34.1


