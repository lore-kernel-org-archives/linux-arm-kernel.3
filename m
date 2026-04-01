Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048A1107637F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7bKqETK+WJUp6t0jb6uev5MchsKdP3VnlpvBvvpKLY=; b=ssWWcnDph9NDPqR0xZ7sV/ZR9q
	BDsxHAW5V6imz51I5vobX1bjCbGu4fd32uItkQKkKb4kAEeGnwDkQbg1iMV3dxoKfSAgw/HpmPKA7
	9kNeQWwv6JX97wP5wa2om3bm1sC7KU61onfmJ3PHgSAR2rVbZ0WngADOYgjZbvweX/kpqu0/cvaaP
	rowM3q+0YWQQ4erC/tn/KMZDprqQ5aGHldYxyl68DGpu/kko+QqHHTmfro+WM+RIZZvL4Lur0Y6gU
	1IcPBvjxrb2Z8xb1UMcpLRdft3RHNN+W3JBY8980XyL9bL3M4XgO2XVLSWps/nB+HvtLSS9LNv1qL
	OUPRJflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWd-0000000FUAr-45bd;
	Wed, 01 Apr 2026 14:26:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWc-0000000FU9G-04SG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 14:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=m7bKqETK+WJUp6t0jb6uev5MchsKdP3VnlpvBvvpKLY=; b=dqknxTvk8+srlSc25WmZajwugn
	rL3gy59fzc7aqNxDOI2kbhiS7QsWnGudXZlRJYRlVQ6tSV073K/BuyDFbsczebNjABMgmyI/D6Gm7
	QMue1yNtdHTJ++/FPY1/ioKYjR29vwt6d+BmLfS7cxmuevj/uO5FZt9Y6TZbx0fvbCLVSIYJfquAl
	n1INLl4LcbbTqCZnLdA4EXg6SFJ4ea5LThFxwXz4J3xKwQUn1HkR/YNp1BTjgryZJT3SJExhgbHTT
	uO4mGONgwiQ9R89qUkNevEx+yi8Er1tw7UhhuY7eMAb4kj3ozHLErmFQYVuPKNTI0OMfm/oV7pnj6
	Y3vlPwOA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wWZ-00000000bj9-0Tde
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:26:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so64125465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775053585; x=1775658385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7bKqETK+WJUp6t0jb6uev5MchsKdP3VnlpvBvvpKLY=;
        b=u1ElADeCwCa5UIeX2gezoWy4AFb2LvqOK0R4r2qWS7nGSblEXWJpRz66tU6C1b1exv
         iAxnwMSbt26V3LIL922CrtnACbduFJK541ygqV7GsHARIsIc5Kmm9chLaomlr/11/IcY
         etBCAGv+FwjvYMbOyTgFbnc2n9Z93ZSzTi6Zdj6Y6Mm16m1d8bLwvOrfPuQ/diOUUhk6
         CK0qmXIUh4e4S/R4rTcIGw1eiWcvPmrnqnfx5ErCUGYealLj6WYMTxO3BP7Z0UDqTn17
         0Xr4wRFfMmjbMgfb88YLncq+lbva2eR40dTdwaIpd7Yb7iFARc23h75Fqe/y48qam/bl
         aHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053585; x=1775658385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m7bKqETK+WJUp6t0jb6uev5MchsKdP3VnlpvBvvpKLY=;
        b=MrJfzC3+F6ok0xp47v5YkIvFNxqli5ZDvzhNxDoCWidx1aohsceh+id3eNJpk83Onv
         xwzsU6bxJlVeWUdATWKRfm0QO5sZHhtCB8SUaydfRaupVhVmUvL5mJbhzc61WhE431Ou
         Rc6kBgt8iCw6/MPLXtsmYTczBHScZwkqDnTROK3jzlo2vLOvdVmLFVl2QfeJWVq5eVBr
         25fwRRjbwMZwXXGYXC8GGBNjGyjZRsU80uSYqXCgcXhw1z9PkTXngUCCT9HWhkOWLqVo
         Ay4V+bo4crdOiiT+59vUyt7Ly8vsTCtc1wliuPLrNcW1Tx3EDLMozahllnz0IaiHRlNi
         kOxA==
X-Gm-Message-State: AOJu0YxKK3izhf93Hmn3xDSbItxUVjV2MP+STIlr4RaI2Gj4KWbdgBr0
	9om0A/KiEwgNR87v5bmZ92ZXStVSjXajUJKQWOtQHntXHo+z/9PuYhBgYiHHjm898Ms=
X-Gm-Gg: ATEYQzyIphIpjDRie3BmW/ZgFxWZH26J9t47HlEnFLHVGZUCVSNNjDGF4sdNTq44+4m
	7l5jLKSd2UMRdVan6c2XZv4Ab7AI7LsqyyMVO7LDWSn+X+w30SdzA8SgdoPkZ+y+BMyzCavZqHX
	nVbjD/n2NwJIW35cje/GL86BpLM1YM7R9yMFk4WOvEvn4OWRU7pP1GDDQmzK+7hSJwkCfXwyeZq
	oNsSk+h3cURG8rLlvQDOhrihiGok4FmCalWE9XkqwEOvEP+RC7669v4RP9TO0k3E0KsxpU2+KqF
	FhRbkBMF41kIZ61SgMOpwU26iAJN7hrAHiqKE5T6P2iMZOZl0S710Yxl3DKH8UcramX9Bktr/GH
	GqKlp4CsFgOm+vuGtLtgY78xF+JhbT2HyLAAFfzVL/fgseW8/viEig/LYhOCtVgVxoF0JX2+/Q/
	ODdbi2NAZFvKxv/8z0qoPI4hsB+wL2eSrwQup4f4DOdVk=
X-Received: by 2002:a05:600c:a415:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-48883596671mr55626635e9.27.1775053585406;
        Wed, 01 Apr 2026 07:26:25 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c9b1sm2305595e9.5.2026.04.01.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:26:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 01 Apr 2026 15:25:52 +0100
Subject: [PATCH 4/4] perf arm_spe: Print remaining IMPDEF event numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-james-spe-impdef-decode-v1-4-ad0d372c220c@linaro.org>
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
X-CRM114-CacheID: sfid-20260401_152627_205267_ADF8ADE0 
X-CRM114-Status: GOOD (  13.74  )
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

Any IMPDEF events not printed out from a known core's IMPDEF list or for
a completely unknown core will still not be shown to the user. Fix this
by printing the remaining bits as comma separated raw numbers, e.g.
"IMPDEF:1,2,3,4".

Suggested-by: Al Grant <al.grant@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index 42a7501d4dfe..b93712ce0aca 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -364,6 +364,24 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 						   payload);
 	}
 
+	/*
+	 * Print remaining IMPDEF bits that weren't printed above as raw
+	 * "IMPDEF:1,2,3,4" etc.
+	 */
+	if (payload) {
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " IMPDEF:",
+				       payload);
+		for (int i = 0; i < 64; i++) {
+			const char *sep = payload & (payload - 1) ? "," : "";
+
+			if (payload & BIT(i)) {
+				arm_spe_pkt_out_string(&err, &buf, &buf_len,
+						       "%d%s", i, sep);
+				payload &= ~BIT(i);
+			}
+		}
+	}
+
 	return err;
 }
 

-- 
2.34.1


