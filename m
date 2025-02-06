Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDA4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0m90EFTzPOvQUeRyWgUOuFclvonVx+b+5YG0+Kl+Is=; b=3cB6fx5SmZa+Vph2XNtgx3XkFi
	NXcKexa/ySaIav+sQVuGpFHZ9AZtenkRvM5WYXz9NtuYZ4MdgOLl4dE5/hjR+HMQgZFLLykuft0aq
	8M60bJhW+p2Q8T4S14Q25AcKDuCWZC3+pjFPZZV6SQ4w95NEgKQ4GWD4BvAk7niY9YPH10kuDhIfI
	6+mncfj3LrdM9qMZsajFjJjJRD7pGDiNsev0jQNzbH5pb1YU+3/yn5Gb42bRJaHgcl0RtS6cahi5H
	QrO4Ab/Vnv6dBuYgoWFJfdkGU8I6LT1O76765Vq2wyo3I0/fWs8r1NpDh+7cY7uvadNiCjp6HV4FP
	TUtCKknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwdv-00000005eBq-1JsL;
	Thu, 06 Feb 2025 07:49:47 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEk-00000005YNj-39I5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f9bed1f521so785614a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826626; x=1739431426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0m90EFTzPOvQUeRyWgUOuFclvonVx+b+5YG0+Kl+Is=;
        b=25mAzrR6G6+LR9cot68yLUitPle0Lr9Oi67+cZSAQEQp5wvOtMg2HfuxNj/rc01F/i
         Jrpwz7Uk+8tWFRvMCiz91MuGosP7aGrTbwDocXBUUMetw1tEp9WdV+UNfG6Na5EYtxKP
         x9tDM8VaBdy4LVTjbeK/8GCCHP7PWULP4XcVxUfYKn2A9Ww367XmQO5ozUexaZvZFxAV
         xs0xUGi5m9/kPjGYXIau+EvkR+HU86HhqX/GgB30Eo9D1gBXZRH6va4sEWINT5M7HHF1
         6tqwCGRvD9ieaJald3Z60cDJBH/lkRoDUevZ348Qjhf4cI4WLrzVRa3pkSy2nangNWOm
         pKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826626; x=1739431426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0m90EFTzPOvQUeRyWgUOuFclvonVx+b+5YG0+Kl+Is=;
        b=oMu0/+T6BtBdzttes0D7Tyxk8CfqiVW3CCwpa/DTfh1PWGpiy/+XM7vCCk7R2vs5gY
         UQ8WjRJJcRpUGSh+4patGEfhS+jl4q60KUpOjQnI1HpxnhXJS8exEF56reo7FT/Gjyfi
         SE6/x4WEzSzbcg+Ra+KLO1GjRD8F1S8xU5tDQEKQs2mnstZH7qBuaLrlcftLE0g7uaGD
         wxY35AxSRFu/FvwBpQ0G5WiQ09N7zJTq9qCB8+63zoINLnJjMlkEMlKZeEvK/WfQMbQA
         4MBQ16H9jfr3V9MOUSnpLLuE7dtb2j5zLRXgaIvbuJx/+OqtxGASIcT+MikQuB8UUfeI
         DCDw==
X-Forwarded-Encrypted: i=1; AJvYcCW+vrYm1uhz19Y/h1QIugQ988Z/3ZKRdtehTG5x4hxJCMALy6+JmgYJsR1HBfd17W2bFx8oGrFx6IMDZeUIZ7AM@lists.infradead.org
X-Gm-Message-State: AOJu0YxVsHo5wE9VIAAZEbn2Wlrh9cIryPUyuSocevBi/b6GeL221tW5
	aRAR67uy56uZrM7ZSzgZ/AwP79ik3cRwERq60X6OEa7ufxM1T6fhgi+DPIndLkcNVHcySWVXfoz
	+A2A=
X-Gm-Gg: ASbGncvMWnEVe3mn1lBXdYvlAg8qDeVVyoNWOXW5ldylI05ROwdzHtx65uTJUmoUSXu
	Sw6lJHzGP0J/uWwm7VP7pPnOBEUP3vBCvd/yqDP+FOwXMVbhKtTTdKMMCQziWaIDPKe2Na2BH7J
	6gXf/kYcY2HGcPVYPkyZdcanxYFVOI2u8SAZcoIk3ho/w1Z9FYPFJQzd4jPW1uaWTMEb336Mqeo
	karEW4CqWqmHcZNDUoMigX7WSJSB56yfS30gPlQxgzY2G44S8k+pV5uk9rimz32GSHX7rQ1eE8S
	QvgcyGAqMd1540cFpJKW51AqfdJR
X-Google-Smtp-Source: AGHT+IEr4tlm3eTboE2LI3UyhaNgjHemEhg+pKT/VKS7IwKjrB4u5O4IbJdLoprF/7S1D0FzPib5Yg==
X-Received: by 2002:a17:90b:1e4d:b0:2f6:be57:49cd with SMTP id 98e67ed59e1d1-2f9e080012dmr8950112a91.25.1738826626207;
        Wed, 05 Feb 2025 23:23:46 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:24 -0800
Subject: [PATCH v4 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-19-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232346_832783_1D391E6A 
X-CRM114-Status: GOOD (  17.50  )
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
2.43.0


