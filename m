Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B9AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSUuZKac707LuCWRbpc/uEIITHPwqnfXyOde6qyF0KE=; b=ucisUyOoxvQWeu2foprPk6brog
	MDSOW5jtDx1QBDBTA5mMvyX6LpvAfksK+x+4AfqkxITG260KmhAo9X7mEYzlwRYWSV8L7796KwRKp
	FunX1rljRK4w9r1BWGkeA+cUpX2S4V9FNDZqR3EsVPmBxlfn5lVmrSS8MG4ydpY/VMnySmeKENB2u
	Ka2ZsLJbQikRUCF4ZZViqN7TbVUoh+LAt1qryooO8/Euc/FjFslRBYzl7Q6D60d6pqkyvgCA0zqZU
	6ckaPaom4neX1s89trf2x8gMv9c/Pz20weK6P5vIiewU1aJ7mUeYB5cMaJlQFYMw0KWX1nqa+ZFA9
	zG8ac5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq2e-0000000A3d8-0Q3L;
	Tue, 14 Jan 2025 23:09:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpro-00000009zxg-03oA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-215770613dbso73960255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895515; x=1737500315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSUuZKac707LuCWRbpc/uEIITHPwqnfXyOde6qyF0KE=;
        b=hIibI6Nlr1ur+7L7XHczZGwErHg1nYHltQGM21xf35ebQlwqgMVhyxGo89T5SDyi0O
         iEcQlU/YanYKjemorRGf0hfwLJOeKY6y90sN9hzVH95too4oklHfby2/g56naOdZ90IN
         VfY1A3jGUDwecodGu5TThoFZjVvHnOi7je50gzr+48tTvVUlW1r0TTtdHRJG5sPmG4Ee
         PvfbR4zrMVRh0rcpqJgl5onHZr7x7EFXhptzjdxm9yUHluvNBXY4eBrf/NbvTOTq2z9x
         aRp9i/9qHg0vh/GbUMbKnvFgP4WhVv+lOhOehaHPQfWDL1YNBLZGSko5QHy3SUyWedAp
         jcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895515; x=1737500315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSUuZKac707LuCWRbpc/uEIITHPwqnfXyOde6qyF0KE=;
        b=eP7frKHPKFyMN/2BzNje7xNDlVLPzaG3TgF3NneUJgLhK488O/639PJ7VEqxF2sxeB
         J0UfOlgNUPOodNwc8/sxZcyJQJAFlBjcx45FZyVAESXWkxGqQOHaTuALh9utJdlnXpOr
         d2RVp3U3+HauGVv4xhkef74/dYwVnqU1EYym1L/U5anxi8uSZX9BM/qQ7JGqsllOIXbD
         3m6QcqRAqbTB7aCm6jHYbIDV5AGE/7ismnMWRAvRkwVWfmjpGbKgBBMPSet6XkQVn6mg
         j1Snc4sIPuUPQeSnJvXyKnEKBDa4KkPfR6PHXfFUI8sEkoPL91xMh1vGqOJPJVnenhcU
         M4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIZpvUIiiwVowkDNhEZzJ99tidS3r8a7MMua6NWm22ra3PIitWaPDJTYoE5o0E7xuG1vkPnDMsja0+7sNiKYRD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq2fIx3C9bXyAha3A1WFAmxg0Epc7NZSX/dkMJUzznoGRkC+7g
	gMN+Ew96KZQTHSgkp8pj0utGNosuk+0WApooTLPP5mjoqF9LezHlE0JztCG72LI=
X-Gm-Gg: ASbGncu1tQlLsNgXrIjClaJXDFvtqnAFg+ONwanHokO/hddyPpNRgYzeXDAesliOE2M
	fuQggvxsDsO4/LqL4X5I3HOHT2SKAJy7nNt1/Utgt9poXjJK64gpy9Er99RZNJvr2GchcXk7FpJ
	Ba+dnxy824XyZBMlUpsbIrHCdbLCQ7CDuAdrIiv10//BocOTEd6B7Yz70/MYttUsnssuhmzcAbF
	yJML1Z0SzS1KH+//h6Z9mNbWHX/0LbO6tgMMl7fwO83mazRZg+j+zcpwZV022448r3hlg==
X-Google-Smtp-Source: AGHT+IEVXqMvOPJKvg7ygF7bUQZEZYrWqGn1DZ1M4rQTQIthH3shh5ppL8RzzhsKIbon/t/bsr22sw==
X-Received: by 2002:a17:903:41c3:b0:216:6590:d472 with SMTP id d9443c01a7336-21a83f4e4f8mr388644205ad.21.1736895515542;
        Tue, 14 Jan 2025 14:58:35 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:34 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:35 -0800
Subject: [PATCH v2 10/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-10-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145836_077047_4C56AC2B 
X-CRM114-Status: GOOD (  11.20  )
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

Add the description for Smcntrpmf ISA extension

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index c8685fb1fb42..848354e3048f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -135,6 +135,13 @@ properties:
 	    directlyi accessible in the supervisor mode. This extension depend
 	    on Sscsrind, Zihpm, Zicntr extensions.
 
+	- const: smcntrpmf
+	  description: |
+	    The standard Smcntrpmf supervisor-level extension for the machine mode
+	    to enable privilege mode filtering for cycle and instret counters.
+	    The Ssccfg extension depends on this as *cfg CSRs are available only
+	    if smcntrpmf is present.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as

-- 
2.34.1


