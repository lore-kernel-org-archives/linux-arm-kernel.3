Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9812C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skcFgrDrxZ6+DyRGwONJh0xEp2yNo2u6zqgzqw3g46I=; b=gP9r/jAEDhVbTcS+WKglvbk5np
	4qaaZM5ASIS0Cq2WWoN0z51pD+Nt3rbaZmqdN22O9yylx5McLbDnhSx2eoHUoOhL/4dA4nnlCIlIv
	iSgk7h16EorqqUvbhDkg+pzhppyDolLehPTQ/H5Uuw+Lfdz/9QeBkKjfCxxBNflzpVnDq9q3vnuJj
	6d4QZqcvE2Hqnia3yof08rt1R3GYUyx3eiGMfal/Ny6Q1UdSsNuyuKWUNcTtjN+PZy3g3ZlpdBpT4
	Wnh4VrFbauBq/OpRsm//UK7kthU++5b3FPHEb7CdD48YSwzHxdAiDIG/gE70la8gD/Aq2uzIMRgwH
	JVO5c8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFfY-00000007NMx-14QI;
	Fri, 07 Aug 2026 08:11:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFfW-00000007NKR-1g3F
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=skcFgrDrxZ6+DyRGwONJh0xEp2yNo2u6zqgzqw3g46I=; b=pRi9EkIsW+KyM/p5cPIsQWcBrf
	TBzaZARHa2evsXGYJneXBQUxWsnHsNrbklSaAIghRfpgUi63C9I44lyY7SrL+tu3w9nAUG0JCryvi
	MEC20NFsiarkIn3rseL/CI1LroU+gkkq2a/u1QBYnk+cX+8jftOqGFLjOPYO1F7x26hy+LeCRvgPo
	tLq5bAxTBbkw/GYaHUUhMTR/3Jbw34RovzccD+YsUFTj3R2sEKybqEievom+ZveWJGTmGBVHsZhRm
	nRuSJL4neA5Zo8VTlPmF7uQjhA2J2MVwLvw2HMVsPBzcRPPHDxLS5tc+6hdOH/L9U2qfvIV2iGkR2
	YLvG7VBw==;
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFfQ-0000000CB5P-2LLA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:11:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skcFgrDrxZ6+DyRGwONJh0xEp2yNo2u6zqgzqw3g46I=;
	b=qdJLcQ2pXzogTF+VR1RyTUzTCLAs7XYMlH2k5MGk9344bDSEaNI57LbwiNFIq0zmXEXHlG
	zjSjGj8On+F8bGyVEVDtHHowtnQVfmTQRtVLg/6PZfasW7FutJHEyPqILPJSkJwVGIL2No
	9hIxarCbnD6ejV2sjqlDPygNW7lf6+M=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:15 -0700
Subject: [PATCH v9 20/20] tools/perf: Add RISC-V CounterIDMask event field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-counter_delegation-v9-20-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091103_257940_91A760C0 
X-CRM114-Status: GOOD (  11.51  )
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

Counter delegation lets supervisor mode choose the hpmcounter for an event,
but the hardware may only allow a given event on a subset of counters. Add
a RISC-V specific "CounterIDMask" json event field, handled like the other
arch-specific entries in event_fields[], that carries the allowed-counter
bitmask through to the driver's existing counterid_mask (config2:0-31)
format.

The value is the bitmask directly so no counter-list to bitmask
conversion is needed, and because the field is RISC-V specific it is a
no-op for every other architecture's events (unlike the shared "Counter"
field).

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index e9c6b7990880..e79143af6aa0 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -396,6 +396,7 @@ class JsonEvent:
         ('EnAllSlices', 'enallslices='),
         ('SliceId', 'sliceid='),
         ('ThreadMask', 'threadmask='),
+        ('CounterIDMask', 'counterid_mask='),
     ]
     for key, value in event_fields:
       if key in jd and not is_zero(jd[key]):

-- 
2.53.0-Meta


