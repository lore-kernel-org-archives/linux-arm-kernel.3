Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8441076381
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n24sszBVzgPIC0kU6aw8yrDjc6YoHko/OXDuAL7iz6Q=; b=0I1Mm0wpcBotwzovFp2XMVPmdr
	iMfFqf4M/enVmZ+suIz44lRygD3naFlbDBok4fZ6tudVMSDTOd21Iy/3akGPFzM2sdxZlBi8rLGdF
	Ak2orTJslo45jBv5OdnDLSIfSTtxYLVEERfsmfjelY7pf9SGs8SaD9WBS02b5/q/IY/9sQMb9tZgR
	nNM5MI0fMZZiEU/GjacdV1IHqujpbwgCEerTst/gSF4glc/mv2T3/bAL0OVAN8RSapVhr6zWEK20o
	GRs3H+bGvuhYufjOrgzp+JcmYzLzCT/tVaPWmw8ubmwilbmgZD0ppb2ctreMElSK022B8GLOryu2C
	BKsDZQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWb-0000000FU9I-1xBK;
	Wed, 01 Apr 2026 14:26:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWZ-0000000FU8e-1JU4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 14:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=n24sszBVzgPIC0kU6aw8yrDjc6YoHko/OXDuAL7iz6Q=; b=PHE6J5Ep2tZsroE0xjsPKFPGKn
	eDw+0dHVukecjW5vFI/zpEPG2CBpwHUF/Fn5L8x72ITL0E+fvtURLJb/GimGatZahrAOrmLyqV21y
	NjhEZqBo1iL+Qn9N+pHqaODVIpNEYG8zyLAKayoBC587ug9lI2etCG5DLQ4MoG8TSJAAXqRAwb6my
	pC27aWW+gnB34AwpzZk+QApHOueJUOXxPxStt4Uxw3nXKhXr6cPDM77fWFG2BYpMzqZKmA5NKaySB
	BfpJjwcKnOLn/EABMEWYSuyyXTLcSETd1UbC1uOzgoHdvQ6OCHHlrSgZh9QsOlFv1g6wtxOT7Bu44
	JUq00hrw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWW-00000000bhn-1nC2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:26:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48541edecf9so83403605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775053583; x=1775658383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n24sszBVzgPIC0kU6aw8yrDjc6YoHko/OXDuAL7iz6Q=;
        b=ulB9K9ivoZIuUjQcs1ioMVbABTjTw+EsUkn0hnXGmapBs+JQTJNaTEt7jm+HAU4bSU
         o8FnDWPXfTMjky9DKgZbOuXvykk4e1wrx3UK3QsIETyMC1Yp+cpNec7ORnb0qQGLuy5D
         RkUCo6HnjCNX1/OoLPTT2VVLaVO06ZEZvbrhtD8+aBe8EiSMVqA5C9eW6FUlysQDCe67
         gGtH3GJW78voBw24Ssc4LcH/etxkp/BjZCtPtBtE9oRm6fQkyaysER93lGkNm9GRi73x
         eUzGQGr2Ti+TUFBhGhW86zJGLmB/NW7n+KjSvTbtQoSAIvFkgW1tGNP5M0uTC0ZfxOHK
         MUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053583; x=1775658383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n24sszBVzgPIC0kU6aw8yrDjc6YoHko/OXDuAL7iz6Q=;
        b=IjrJix4XT4HQRjGuNRAutt/D2XzEJwLbYDUm7PO79Q14XkRaemkQv8LcjbiLu4iiv/
         z2oo/vM1NyOLPUviDCOFsosJOkD0AibXb214fkTWyVLUlrXR2z2xIWlJva3FBqEiihWc
         hQDk/d0UelebgxVJuKFlOw5X53gQu3p+XL8J31UpQQNtt2XYo23Tvs/HbkVuBmcxrJ2n
         Jwy5Yu5bUb0+tzgVqY7jy+wKBy8NaVsyiT6Ijw0rRfCQjBmosYEKiolWCG0Li3SaqaeP
         FdkVM5jFyZHUJ8ltb8M/KxKXDYturfTUdYmcJ2lR/T8QZDEOGtxU2txhbYFUSLY79tJd
         PmfQ==
X-Gm-Message-State: AOJu0YyoPgvuw4tH/dEYLPhyVtSawE4LpecC8OzWpwtMlMt+ivI5tkE0
	r9ZvlBWecQduUwBr1rf8ZAmMA6JD150kEUMpnIuNVwvY5cydKCmuLdZPne6A8gISyDU=
X-Gm-Gg: ATEYQzzIyYKTJUnoto2mtH2G5UQn7V/JEmXdifUBKWfpHC68p0afEFtk717vfMApshY
	K6WDzijH2RAUqqZLpTWnaWejKM984kRLyeeQlPp1c3e9f5WkaoVOEkciW44Uuz6Vqo5ArFjNm+r
	HKlTSGnAYV+/FBDPxbcDlU18XsbOOTfdItdpnL9EleE3JMZRak97SSMKtCHmByXtIRsNVLIwtqn
	xuHP2byLj2ivhKv7ZqzP/eiZ9e/yRRX/NsryjzUREuyC/ed5sXAxLeRNrNAavVRVm+WnpdU+xiU
	uAOL558eBN5yacirMKtih+gxRdUmcIjcu2QojsIrUXTBfzN8bx4teYSQ10GQXie8AQ2KhI3/Xon
	lmeQlb6GM0IhcMNSoaCwtHjQ33wsrC9DZTIhdmfZ5K3CDMR/JP/06TIHS8YcfPq2fTI1Q+gY6+h
	fd1BP+DBMhdvZy1r1n+XA2xpRV1/lLXQCkxhyOGjAWaQ8=
X-Received: by 2002:a05:600c:828f:b0:485:4388:348b with SMTP id 5b1f17b1804b1-48883310809mr72258105e9.0.1775053582629;
        Wed, 01 Apr 2026 07:26:22 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c9b1sm2305595e9.5.2026.04.01.07.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:26:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 01 Apr 2026 15:25:50 +0100
Subject: [PATCH 2/4] perf arm_spe: Turn event name mappings into an array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-james-spe-impdef-decode-v1-2-ad0d372c220c@linaro.org>
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
In-Reply-To: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_152624_540832_68A5E446 
X-CRM114-Status: GOOD (  14.58  )
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

This is so we can have a single function that prints events and can be
used with multiple mappings from different CPUs. Remove any bit that was
printed so that later we can print out the remaining unknown impdef
bits.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 88 +++++++++++-----------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 5769ba2f4140..c880b0dec3a1 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -276,6 +276,48 @@ static int arm_spe_pkt_out_string(int *err, char **buf_p, size_t *blen,
 	return ret;
 }
 
+struct ev_string {
+	u8 event;
+	const char *desc;
+};
+
+static const struct ev_string common_ev_strings[] = {
+	{ .event = EV_EXCEPTION_GEN, .desc = "EXCEPTION-GEN" },
+	{ .event = EV_RETIRED, .desc = "RETIRED" },
+	{ .event = EV_L1D_ACCESS, .desc = "L1D-ACCESS" },
+	{ .event = EV_L1D_REFILL, .desc = "L1D-REFILL" },
+	{ .event = EV_TLB_ACCESS, .desc = "TLB-ACCESS" },
+	{ .event = EV_TLB_WALK, .desc = "TLB-REFILL" },
+	{ .event = EV_NOT_TAKEN, .desc = "NOT-TAKEN" },
+	{ .event = EV_MISPRED, .desc = "MISPRED" },
+	{ .event = EV_LLC_ACCESS, .desc = "LLC-ACCESS" },
+	{ .event = EV_LLC_MISS, .desc = "LLC-REFILL" },
+	{ .event = EV_REMOTE_ACCESS, .desc = "REMOTE-ACCESS" },
+	{ .event = EV_ALIGNMENT, .desc = "ALIGNMENT" },
+	{ .event = EV_TRANSACTIONAL, .desc = "TXN" },
+	{ .event = EV_PARTIAL_PREDICATE, .desc = "SVE-PARTIAL-PRED" },
+	{ .event = EV_EMPTY_PREDICATE, .desc = "SVE-EMPTY-PRED" },
+	{ .event = EV_L2D_ACCESS, .desc = "L2D-ACCESS" },
+	{ .event = EV_L2D_MISS, .desc = "L2D-MISS" },
+	{ .event = EV_CACHE_DATA_MODIFIED, .desc = "HITM" },
+	{ .event = EV_RECENTLY_FETCHED, .desc = "LFB" },
+	{ .event = EV_DATA_SNOOPED, .desc = "SNOOPED" },
+	{ .event = EV_STREAMING_SVE_MODE, .desc = "STREAMING-SVE" },
+	{ .event = EV_SMCU, .desc = "SMCU" },
+	{ .event = 0, .desc = NULL },
+};
+
+static u64 print_event_list(int *err, char **buf, size_t *buf_len,
+			    const struct ev_string *ev_strings, u64 payload)
+{
+	for (const struct ev_string *ev = ev_strings; ev->desc != NULL; ev++) {
+		if (payload & BIT(ev->event))
+			arm_spe_pkt_out_string(err, buf, buf_len, " %s", ev->desc);
+		payload &= ~BIT(ev->event);
+	}
+	return payload;
+}
+
 static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 				  char *buf, size_t buf_len)
 {
@@ -283,51 +325,7 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 	int err = 0;
 
 	arm_spe_pkt_out_string(&err, &buf, &buf_len, "EV");
-
-	if (payload & BIT(EV_EXCEPTION_GEN))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " EXCEPTION-GEN");
-	if (payload & BIT(EV_RETIRED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " RETIRED");
-	if (payload & BIT(EV_L1D_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-ACCESS");
-	if (payload & BIT(EV_L1D_REFILL))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L1D-REFILL");
-	if (payload & BIT(EV_TLB_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-ACCESS");
-	if (payload & BIT(EV_TLB_WALK))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TLB-REFILL");
-	if (payload & BIT(EV_NOT_TAKEN))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " NOT-TAKEN");
-	if (payload & BIT(EV_MISPRED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " MISPRED");
-	if (payload & BIT(EV_LLC_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-ACCESS");
-	if (payload & BIT(EV_LLC_MISS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LLC-REFILL");
-	if (payload & BIT(EV_REMOTE_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " REMOTE-ACCESS");
-	if (payload & BIT(EV_ALIGNMENT))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " ALIGNMENT");
-	if (payload & BIT(EV_TRANSACTIONAL))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " TXN");
-	if (payload & BIT(EV_PARTIAL_PREDICATE))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-PARTIAL-PRED");
-	if (payload & BIT(EV_EMPTY_PREDICATE))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SVE-EMPTY-PRED");
-	if (payload & BIT(EV_L2D_ACCESS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-ACCESS");
-	if (payload & BIT(EV_L2D_MISS))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " L2D-MISS");
-	if (payload & BIT(EV_CACHE_DATA_MODIFIED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " HITM");
-	if (payload & BIT(EV_RECENTLY_FETCHED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " LFB");
-	if (payload & BIT(EV_DATA_SNOOPED))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SNOOPED");
-	if (payload & BIT(EV_STREAMING_SVE_MODE))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " STREAMING-SVE");
-	if (payload & BIT(EV_SMCU))
-		arm_spe_pkt_out_string(&err, &buf, &buf_len, " SMCU");
+	print_event_list(&err, &buf, &buf_len, common_ev_strings, payload);
 
 	return err;
 }

-- 
2.34.1


