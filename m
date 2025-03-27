Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60BBC36011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=; b=gtbIHPpk1X70ISp3YI7sW0wlu0
	MEy+wEQhQocWe1q6Q+LPXeHVo1KyyIAXRWiFuHMZPNQTZEqgfOwUE6kWODQueZjXFfUOObwNJtr45
	aH3noVj4/UXBT1YtEkXHk1Udb+Y5KYBS3RT93OLHPW85pzjyirWPGNGpPAFUnUTm8ZFd9U7bzCXuv
	jgRn9A+P3LhJtE4uDrVJijV5uZARszMxGgBen128d5nZXOsTlVAA2mYEo0gX8f2iGo31M8G5lO3xb
	K8gUBUr+8cnEKF7JX1hsiJFwWCsVj13Z/R3DJvZrx9WDpGXXYD9RlZVW+nD/qKdPRlcIfiJAbcRo6
	F4Chg4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtYM-0000000BwAV-1buw;
	Thu, 27 Mar 2025 20:10:14 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1v-0000000Bpto-3Yfl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so2798568a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104203; x=1743709003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=sQgCXLjTEAE2+6HEm+4A28fu/v2yXiOunANhBXneopH/0tTx8gbKQDDdXbyDET5wZs
         KRWB6jwXgnpPjx1KYWGxaO4oU6bkCHKaCRGcjjKy4oyCJf0kTj0hBimzf4wWKLBbUqLs
         D+DR4uaB9lK97OhqZWPoXFKxzZORgKEGAQS+ZyfnKf7meHlen+Fb7yioSWtUQi8H3mn2
         amDWnmb0o9MVcG3nW99tJXgqGW4oU5xHi+wfLiR7kfk4nkMYAFBSRRxap46T+pnTHx0M
         DCMfDA76tE83M7pofxDdK8AuinpHWnMNqV4ciXLc4FFbhuwU14VwuNlGoCXeYOsMDS5t
         ERug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104203; x=1743709003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=ZTSEZhiLlGYWSOBnhUIOsvH/Z3oAD4trgORQS9qd0Evx9eKbeG6vqMV65hp0um+L06
         +a2TyXWFV4xIcOA/M4O+4W+k/S0I4E4lYbsrl2eFZQcgBh+aVNIs81mp6PAwNGts4kAu
         CGmGd60EA55/7b1h8nQsAmqfSkAF7RGR/IovBI3M7sgIz7kb2CFn5boNizO+QpkHvA6w
         Z0i+4ilhSCYrHdKAN7heeMfw/ktIdobXKE65qR6ArudHVQFGIxq2Dig9tjK435jMg8pq
         HKDSD0RE6FGdiZ607F+yG0gXW4dch+RfM14TZsL1ZKiwyqrRZpFqdQkJ/WwtH5yeK0Ri
         Qc8w==
X-Forwarded-Encrypted: i=1; AJvYcCW0bTv/ZTjmUTJw2OUEjteSmhJEUFL7kSiukyuCbQHibGpeX83e7zdGW7PGrs8y8sjDYA6PuBickBJ5bAKzzdjp@lists.infradead.org
X-Gm-Message-State: AOJu0Yws14dXyh0RK3tD8wKL9pi7dMgs3JDRyCF6uBco3oNT56hGBVeM
	i3J6KUd8/fbyxaEkmFzTVP8mZqJ5apiM//1yW5o3Yxr8LvUT0DFrUSr4jH6kKms=
X-Gm-Gg: ASbGncsJhdqDV0NniosiAU3EuBrrKZp5Nh0aj+XQKos/TBUTM7VptOsfsTNJd9rJJaH
	fLeOjHgfklEvv8sZN2mxsrE8Rf0VGasjRC5VC71T8BAz6UgWTN1m/HRpJ7qQBVeWjWkRmRRwQO/
	hinG3SP71lwAZKY2KuahArHHzHCwk6oGILG4L3efmvDBvJZ7bqE08JzoyplAvM+p6YujpiCmxqe
	mg/KM+nQ9yY9xE8zNJ2RzbfnYojbHN58vkxVFI84uCoy8Y5hN8/JkvqOPR5nmbOoq/GzvEuj9/x
	Cw6wgV/C4ZF5eAVwJgl035m+IwC9x0NZ+uhFHGKVUhFRyZG+vd5PczbqjA==
X-Google-Smtp-Source: AGHT+IHr9lkacen5G6bNal8x27vd0zlzKk1gXvQpJoZ6ZU4fSbwcKifIx6nJFU8JTt0ZbyyT81dbnQ==
X-Received: by 2002:a17:90b:4d05:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-303a7c5b9eemr7219789a91.2.1743104202835;
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:36:00 -0700
Subject: [PATCH v5 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-19-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123643_906851_7E2D866F 
X-CRM114-Status: GOOD (  17.27  )
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
index fa7c466a5ef3..fdb7ddf093d2 100755
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
2.43.0


