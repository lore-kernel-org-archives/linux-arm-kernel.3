Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04E9C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=; b=c3MwMPUnSA6PFtaYiwL/DQHrh9
	xTU2J4yjB9WCuc/lWQly4zGUjCPYgMFp9tUe+bmnxitVmNciGaL/7IgGBCIUwG54NPpLvqJYK8HMF
	NkUXVvu5aiUQLLqdYSf6U1fwqZ6G99I70/7VqZlStTAuMakmyISByvoTheUJISy++5TU9kHN837KZ
	UGDYxKCtfJ+SSxiD6l9Fizai35c0lsQ0R7qAa+9UWm19H+6PXhxr5TtdzhCtQIXIgjI4d2H+SfCf9
	0F0vcNeoXrPJK1A8IR+UNhw8siHcF/N6eXMapeLSEv009rUpMJgApeTQgBKtp1EPWQOFUr8TT67mK
	VEvIKCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCP-00000004Dj4-2FXA;
	Tue, 28 Jan 2025 06:35:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdi0-000000044pw-3ByK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:22 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso7986928a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 21:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040420; x=1738645220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=;
        b=PM1SpJ20WGBSheAJyJi03XOIA6udLcYPoaRslOzA/wYG2QXlJjOD9D7Ioli61ZRi8Z
         kn573l1VhpiqNX2D9Lrd4rPuCGOOC+NcFho0mOZMIGOKYItT4aFr2YZLeiuRVWXJRi8B
         6HIr2cbr+sG/xbnkRuQ1rlIgzPF6VX21rwJC8cpqP1XH5bICMUF9i7QTIAF7aT0QCj2d
         Rdk8X2s9P5ctYup2YRsirTBtbwlMpIegE9A77wi7tsH85pSb8LTfi7vifP/ibcbHWjp2
         nRAUjXDMq0tmOslGgkBnBkDN6W2rw5bTIb2AV35n9Cu3Chga/1VOt6UWkBZJsn8jpz7X
         B5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040420; x=1738645220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=;
        b=LHIq24XSLGzpd20WvlB572Q5M2yv+ThXGUGfmglXITxiN8yy76mA9RRKNZfELkyDot
         kVOHsBoQ2+r9yx/SDG428g/Sx9JImophnb1BOw+ylEm0xntoUGtkxNnqohVCcsFymUMB
         l5bpefZOGYRKyi8ndaRJedOhjhzY9M5mRFhKXo1b9D89y51Vef2tAlm+hXpXKFMx4Ta/
         eQp+PtwzqN56KTqCP4aF4cfVcFZopXNkKSuTICa16hpgF4A0wLUWXB3RTwv4ZoNoXSja
         4KUfhaDwRMI3CKXZH4PocEk9Zbq/ymFxaWnwwWIQLB50AXHh5Q0H2rZ3vjLA7X6gLWjd
         TiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYvakqM3h+Eu4llE/IAk1JUhdmsqRXdviWD0JtKkLNBGoQJGuKtUq0MfG0vnJvHGBH3LKLxPK8CGPiQ937/2zn@lists.infradead.org
X-Gm-Message-State: AOJu0YyiMI/zF1U3g9O1QkFYeY4LNlryWwVSGWVl70p+9Tkqj8cyTe31
	l6MRdJux9z91LAENmX04NYOV7sLeA8G+ub0A2/TK80h4SHhAt3WvSxlM4WfHK4s=
X-Gm-Gg: ASbGncuiLrMSIwHxczk6odRRZVNmbcgTNTseUO1pluSGh0gldx6M5Cs+6SDutbb3PMB
	c8kVAcwObd5bXfKWB09BcB6vb6DMVDuFD7x6jGKxFCLDe6DWI9IgNy97Z9iGcv/78JNajc0nKjF
	jquQJKrydnWh6035JzAyn7f0Ws2GLNrQrMMc9nZLVbyZeQpSrdeG+I0bNNAHl3SDhWFvDhF17e3
	m1u1h8AommHvDtDHglOWNVj+6PZRcmAaz8R/x6rCpZX2IWMDPu9mE1QWT0cbtZ5Nc7x4uL7c3pV
	agqFTcCsVHBw/5TEbtDFZqFGxaua
X-Google-Smtp-Source: AGHT+IHlFzD2fu330ZMELwraV6ApNuAJVZ8yRk70aKuZKIqzynWDWx6XkmlUYZuDD9VCxD1qqsAaLQ==
X-Received: by 2002:a17:90b:6c6:b0:2f2:a974:1e45 with SMTP id 98e67ed59e1d1-2f82c0775e4mr3067861a91.16.1738040420191;
        Mon, 27 Jan 2025 21:00:20 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:19 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 21:00:00 -0800
Subject: [PATCH v3 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-19-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210020_871304_297BFA05 
X-CRM114-Status: GOOD (  18.02  )
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


