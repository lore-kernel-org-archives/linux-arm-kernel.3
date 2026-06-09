Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24491CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+74FvUBZxlbST9+7oM0jYayJwnBAvv8czrcrU+bwgIY=; b=AdFulPyrA1lYdcQEjf10RLgPz8
	oyb5542guDpJuOi+aaaHciLAwGb2w+QI/LhdcbCwPyLk/ffL0hInygcmAJCEa97smku1iw8YF+oKm
	C0YGYsDEOGi4qXgn4klxwaaQHMeINc/tBm8u4gcgqvAHbIgz0Xq0eQTDEwZ6MjJ81bwX6NoLeYHlW
	Yuq2UHDIdwpqm5vOmKFkDtNHsRMTFgrDMQ+u4QKOc2c63IT5QawCvOKrAW+/2/pKri3xQASwfs+YB
	iYhXikQjXW1b+aeRmv+WDzJ/NnPcKBfh+CaO+wL8Y/GrSywNgX85JPgwkdrIFxvzdKtfoNTJ0vl3c
	16ggQINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYa-00000004oQ9-16ia;
	Tue, 09 Jun 2026 06:03:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYY-00000004oN1-2sSv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+74FvUBZxlbST9+7oM0jYayJwnBAvv8czrcrU+bwgIY=; b=XEYb1kxlByREY/y72kfrfznShI
	wGyXmXieDY08iyWni78GgwGCxZAd/0OyFoBc55lY8Odix+qBL4kQRPVYLKUCW1di8KdT3cQFmvTVo
	GwcrRThBOPAx3MkYfo/4Ddp/a8asSPYfopsSpPRAI5fxCg7tRhrjV5+EAupyztX8skhHmFXWCxvPQ
	WxH4c8LYJcBHRGKh8eIyRKc4vAkHxXQ7JZDb12mO+veqtq/ItS3wlPYXiotuhVHALkkVD/wmllr5y
	pk0g9grn90fBvhJVp2T73qHbYcgS2zTbIwEzBep15epxa8JEPpSfHUyg254wl6XCIlxxdeBc5gkx2
	WFVtLrpQ==;
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpYQ-000000020DO-3Npo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:03:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+74FvUBZxlbST9+7oM0jYayJwnBAvv8czrcrU+bwgIY=;
	b=vpM6FHFJf+/bhrb1nhFUxA9NhY0bKIHiu9hZC4M74ql0x/+s2OW8XYklNsJN2Wqjb+aDgm
	TuW+Rb6lccksKUK79R+bswVAVlucisHM3wAIY53BkTvXnckQhJh6EMm1O8xxg/xFzGUadQ
	pYOfEDg6bHiwaiIUlD7swclvmTkv7FQ=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:35 -0700
Subject: [PATCH v6 21/21] TEST(do-not-upstream): fake qemu vendor JSON +
 mapfile entry for CounterIDMask path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-counter_delegation-v6-21-285b72ed65a9@meta.com>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
In-Reply-To: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
To: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070315_146439_4BA2D2BF 
X-CRM114-Status: GOOD (  11.46  )
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

From: Atish Patra <atishp@meta.com>

arch/riscv/qemu/virt/events.json: fake-json-{any,ctr3,ctr34,ctr6} with EventCode
+ CounterIDMask; mapfile.csv: 0x0-0x0-0x0 -> qemu/virt. Exercises jevents
CounterIDMask -> counterid_mask= -> config2 -> cdeleg counter allocation.

Signed-off-by: Atish Patra <atishp@meta.com>
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv       |  1 +
 .../pmu-events/arch/riscv/qemu/virt/events.json    | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 87cfb0e0849f..3533a8c0253f 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -24,3 +24,4 @@
 0x602-0x3-0x0,v1,openhwgroup/cva6,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
+0x0-0x0-0x0,v1,qemu/virt,core
diff --git a/tools/perf/pmu-events/arch/riscv/qemu/virt/events.json b/tools/perf/pmu-events/arch/riscv/qemu/virt/events.json
new file mode 100644
index 000000000000..294c4ed645f6
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/qemu/virt/events.json
@@ -0,0 +1,26 @@
+[
+  {
+    "EventName": "fake-json-any",
+    "EventCode": "0xF10",
+    "CounterIDMask": "0xFFFFFFF8",
+    "BriefDescription": "FAKE json event (any hpmcounter 3-31) - QEMU does not model 0xF10"
+  },
+  {
+    "EventName": "fake-json-ctr3",
+    "EventCode": "0xF11",
+    "CounterIDMask": "0x8",
+    "BriefDescription": "FAKE json event constrained to hpmcounter3"
+  },
+  {
+    "EventName": "fake-json-ctr34",
+    "EventCode": "0xF12",
+    "CounterIDMask": "0x18",
+    "BriefDescription": "FAKE json event constrained to hpmcounter3,4"
+  },
+  {
+    "EventName": "fake-json-ctr6",
+    "EventCode": "0xF13",
+    "CounterIDMask": "0x40",
+    "BriefDescription": "FAKE json event constrained to hpmcounter6 (out of a small pmu-mask)"
+  }
+]

-- 
2.53.0-Meta


