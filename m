Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88623C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2CXRkSzd4LW5IV8mtGWOkMlVaZyNScQT8kSGB+ZHxc=; b=JuipVbkg/lLgmLFxUeTPy+dFUi
	WP5lgzHU2j2Ind8UMT4qu2bUUTkTrpaX1OsCzaC43fxSqsYunVBOjsaUoGvlUDD+MxmS9+lVKC2EW
	BFsur121oLnsivQDxotVwyYoeiZ7UJHoGcGytbV+NyNxfSLDL/LOV/nVcPfnPf27f1NMd+5ZoZRbV
	qNGRK5W/2gwXLICVGh0Mw8wxALFv/CTVEtCx/JK0zCJBT2ERNrKTsIE8NSfLTPK1inW7UcX2Ezqh6
	kBUUhDgnfi8Mo+n2a1UPzi4//v1mkMjksvEiBS3SRSQjmMfngBkblwo0t0k2N08GQyNeB2wDmBF+j
	kQGJTx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwhv-00000005egp-2sUK;
	Thu, 06 Feb 2025 07:53:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwFB-00000005YYB-2P7S
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 07:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p2CXRkSzd4LW5IV8mtGWOkMlVaZyNScQT8kSGB+ZHxc=; b=kLOX4u3eiuPS5I89Uw0Q8d7N3i
	BH93Pu1rJ58z9YGeUCGPQuTJ7ZvOgx8+Dxu9gwhftfenEMZdrkoBQuV7leM9NnOseibaT+3n3pGB3
	JlSdZ5vmsFni0ZCkHWgzmcWggBS+OXiqV2L/SVxnV9gW8dPuS77vjCWmoe+UTKfiDYE1qGZ6fCPnS
	jwHDGPXk3hmv6kcWMn3I3WyMxnejlhmXINhm33J1cEPcoJhE0Rnsffiy7+BAmQxwrCNx3SvT1o9mM
	Xfc6sihoAVtA2Vq9ZzGI+dGV1B7Y9LbKB46iJwK0iVoCrmYx3kV/KkMiM4agF8lH6fDeqkzvbIfsa
	PC12h25A==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwES-0000000GqmY-335T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:24:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so988162a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826602; x=1739431402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2CXRkSzd4LW5IV8mtGWOkMlVaZyNScQT8kSGB+ZHxc=;
        b=BrPiFDy76FGI+TDP/fj/cJv/czjB6vwGe7i3zMfTEWSz4F6ryDOQOhJo5t+p3D1QJh
         OQNYh/lDLwsPZ7vVFTXiAU5t4SQaCCYUa8Q44ISRsn/Uv4OcFWF6+OMEr6TFA0B4tGly
         coU4VaJNxo+G8JDxu+m8/FdHlewcGQH87hNEhXCQ25xHvarSFUTEXIdkWSXtTE2gpAXM
         ksO4vLabA0vBIJpieOCrW28T2uQq5nJYEHuAmZ4jUVgtA7PVlx8rFdIBNPbZk99QJwZF
         lum3icJB8LVp5ceJhYL3OOeS9z1h5Tt3cpnN/kDaj+KjUZs8bOEs++7AxJ7CZ/auMtj9
         OELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826602; x=1739431402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2CXRkSzd4LW5IV8mtGWOkMlVaZyNScQT8kSGB+ZHxc=;
        b=EYi38eRaKt8nccgT24RawSqKhh2QQqbcYjIbq/ZjFDzWHyJpeWu1aqjOI3ps77D4GA
         wIZ+wSxntl9c8JxuNffa4Pnbq8ibr4ST4leussATSTVXqIdUp7en3goBoh4dwMuO6vgN
         KhS48EUXVf1vbA/u8Y1IpWtovPFM7xi+VMzt/JY6Ut20Y7s4e40kU25brUama6IDRBdF
         WnWK32YDZWK7HAjo5go1hYHbzRli7LJBRABMGuteVj6Eo+yMBtVm2gaYYVTCT+TvX73q
         vYZXrir1dGXDtrEzfLCKCD1wssqmn4pDBq1yO2nRV6lJbddQZJ3ToJwkzOB1hYXiQn03
         BK+g==
X-Forwarded-Encrypted: i=1; AJvYcCWTGGHknFOcUd7+hFXajnUPqlG6+8zq3g6jy10tKsNrSNxUqKx+cYWGxHLYFIjnNgJ3fTxLFSYi9RYK4xa5beHw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmz4ksxnUEnVtUcH8G//+Ic/eoDbBr7qlZIjDO4eU5mLlGYhEi
	zuZOJp6/cmOI1kGf1vqhJ+d0RH3XPHREGCijMiFFUFhkOfTsjTRKaIaDriMPelg=
X-Gm-Gg: ASbGncvRfUV+gnZ/pbA+oHSrAPNa9sx9RrXPoME8dH7qDI/bqYygLRAYgeZUVEzYL72
	mp73WZnzbktcn9NGjd9Dx3ajNH5JWRUHel9NLGLcd4BX7577AFqwk8+wY5qOCvBfehCVJaFnZyJ
	xVgzkU0gpG0IhBcjE1Qoy35bgiIYpixA24jxNK5C1MJwgsSWftsWZhT22pMTx4pw8vyEpAGHIjL
	pMmLQGHeGuHLrEzqjnjn9+ZbptGib12AwaunNW/Mm/nr51ypr9bDDN7VfBqIH5jHBA6GAInahiF
	e0+Q6N2Blcd6UxzVJeftyB5oDlCM
X-Google-Smtp-Source: AGHT+IEsdW7e0nnU+hOuQNSvBNjT6hUmPYli2IAeU6lmXJs5V7j20UKpuutlBvTAACwmkO+Xy8ldvg==
X-Received: by 2002:a17:90b:17d1:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2f9e06a1b1dmr11330512a91.0.1738826601990;
        Wed, 05 Feb 2025 23:23:21 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:09 -0800
Subject: [PATCH v4 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-4-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250206_072338_238383_5D1926F6 
X-CRM114-Status: GOOD (  10.53  )
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

Add the S[m|s]csrind ISA extension description.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 9c7dd7e75e0c..42e2494b126d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -146,6 +154,14 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Ssaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in S-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced

-- 
2.43.0


