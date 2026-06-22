Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D33ECDB471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+RY5vs8Ycg6LE30rSiyWAmudN3MbQny6JzyIGr7w5M=; b=L7v+6qAI/p1n0tk/zrTDbTzkNs
	78/Y2jl6Vwtd7pMxeUwKBfnssXS0DnSAYKMCMgcVdPF3WLbh1r7F/u9zLuWHvlR/1AkPO87Z1j8r3
	buFfPZix1N1oLA883C5uWnNnntOjLNW2MhYPzz/twvNi78myE7l1qQbuRrplhWNBh9fO0CoLTDPAg
	a54Pk13tJ5FrIlmFYYjgWH/EM2yMgRFHz0Dc1r4Go58tiCUrpGxDa8mm4NInZOqXEGiHlxYI94fC2
	Qtla3jippdp2/o0rVWEVz6oJpW+Ax6JaYEfI+FMHdJ6ovp6rG1toOgnnlcme7V1alQBZ2YblmxxEG
	7eCim5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZg8-00000004dRn-3U90;
	Mon, 22 Jun 2026 08:06:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZfo-00000004crr-3id1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D+RY5vs8Ycg6LE30rSiyWAmudN3MbQny6JzyIGr7w5M=; b=YD0K2+TnscTNzK+tRkc2UCywNb
	tahpUoYPsgxI0cN45j03ZTVViHvWHM6snkt0HPj8uNAt0L5Px8WivA/tdbpdUCfbgO10XicK1fQFd
	Iu1fyp0X5j5bWShVBTvjXbi97oCqFe0GuxXUnYvN4/lLkyjQhPpF5TfS58hVdKhSCiOoiotYBugx0
	Pc1TqqwezlWoAYn7eDt3X8v3EKTal4SWcWscH6Bugqk5hC6sIXXFhlmc1aaqoLo1EkuAEFZh9Tjwh
	5+ZNOl3UvlgxpjE2hVKvpdAEpXDcuszPHydljexrXne4PLgyCRsZ6s5Y/Pooquj5F4sSUOA4dgdME
	V2ID36hg==;
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wbZfj-0000000HALW-0cmx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 08:06:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782115579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+RY5vs8Ycg6LE30rSiyWAmudN3MbQny6JzyIGr7w5M=;
	b=fSdftwRcfvqQYJbPxvrjZfWISQCYpm4LvPGTH9Y597jpo7hXpj6buWHHayRSiLiaBUdejq
	vfQx7OCoSiubni8VWDj+cl4gPVEfTD91OQ4J8dKeCIy2AXCDuk0g8ubDZIlMRwesmJub37
	AnSNfKlIm6Ju+NOwssWmJMOvDPEV6nI=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 22 Jun 2026 01:04:31 -0700
Subject: [PATCH v7 19/22] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-counter_delegation-v7-19-0ba2fd34614e@meta.com>
References: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
In-Reply-To: <20260622-counter_delegation-v7-0-0ba2fd34614e@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Rob Herring <robh@kernel.org>, 
 Ian Rogers <irogers@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Namhyung Kim <namhyung@kernel.org>
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_090624_427220_478DA98B 
X-CRM114-Status: GOOD (  15.36  )
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

From: Atish Patra <atishp@rivosinc.com>

RISC-V relies on the event encoding from the json file. That includes
arch standard events. If event code is present, event is already updated
with correct encoding. No need to update it again which results in losing
the event encoding.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
 tools/perf/pmu-events/jevents.py                    |  6 +++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

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
index 3a1bcdcdc685..457fce7a5982 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -413,7 +413,11 @@ class JsonEvent:
         self.long_desc = None
     if arch_std:
       if arch_std.lower() in _arch_std_events:
-        event = _arch_std_events[arch_std.lower()].event
+        # If the JSON event already specified an event code, the encoding has
+        # been set above; don't overwrite it with the arch standard event or
+        # the event encoding would be lost.
+        if not eventcode:
+          event = _arch_std_events[arch_std.lower()].event
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):

-- 
2.53.0-Meta


