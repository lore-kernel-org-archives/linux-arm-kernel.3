Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71A9C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=; b=v1k8vcbSBnkcm2e8ySMJI8xUL8
	h4uQHuXnzng7fL868W0aIAIiPC7nuZkgh+EEkr33gpctaMlSXolE7x63+CJeGCYf4inRJluufaxOD
	Ij2bESgsuh5t6FU/UHJrP6QhKcuQ0ohpvoz4e24n8cn6fXKldaI6wMsOq2hzxrt7VPkLlmci3JnTz
	P3Iff7SW+rbvemX63kYg+dfFrud8Wr4QvxueXKkIB6ekU3OdvPf27nsEsYw2bc07+RGdTPeh9A6Ev
	CQHYc+0qU+FzTzYQXKjqlNHoIRcYmZVDXcIhs057RVK6Ctss1ojCKnV7u5qRmaIQPB/jsQF+mcdoF
	zmgh0i3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtAO-0000000BsFR-2Esy;
	Thu, 27 Mar 2025 19:45:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1b-0000000BpZA-2xJd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:25 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso2449653a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104183; x=1743708983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=YT5dUm6WNQ0YcXw1O0GoDkkawjtB5NTI9OJ16GNh0MSa8shr7otHQKhUvfpGht7W25
         mtIdmHQqp3xbG1n07qlUwTHB6w2dif1l0udOxEt6u4qWTaGHVWVugCQAWUkmzK+YutOa
         87Kv0cLD37NoriWrLTQpQ1mku5ASeUjc8Yl4FFjgjRD74a7a7WV0o4wov5jx/cNsh/tA
         ljiwilB+i5L9kIWULzC75+z2oFuITbeAAqiGeWzUopgyYiWfc2pGt2UpqQ87tiDFCX1K
         1hqo3pWQnkBrF4vFzD+yfI1PTC/n4DcXDc/CR6fmmK2R5yhqWahJyV1BcYRUxziYQ5t4
         Y9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104183; x=1743708983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=RqCyMYHZsHbT6mw1/76Y6XVBGREXpY5EcDwtRxVskKB6rLAFxJJ0vybisGy28GUfI5
         k9DFC5z3vZLJJahGUVDQKrzgIstcvz1JZ5ZDRgwF1NrURSr7QFpTaUt6T6sFMm8RvU3w
         H4B0YyjUG5o+oOfMYSvKvxOheT/Yz9jCzScMMGhf43s4PBU6p/5BusxyHyvtseRJvOeZ
         dyJvg73rmTViGbN0/zg7HCAAfejbNRSZR+bI2ZF75veyKra5yabfojeZUypChLke1uDi
         AACBBvDKWtCKtUFbHkFCYw0Gv0exwvmSyIHV46gW6Asc1c1RkVf5zXGSryqevD9F8ESL
         MHmg==
X-Forwarded-Encrypted: i=1; AJvYcCUf3PmQsReQjDwxmRVeNMmywEZSkSX7vIr4mcF4SlSV3hskJrv6cFIt0mGUl4sxcMOL1BUfotV23o5pQjws6vae@lists.infradead.org
X-Gm-Message-State: AOJu0YwGA4A6gGMDhakFPS3uQkmVJqrq8Y5YiHgXzzDR7AtCtNh0abam
	sMwKA7FHj8f4b98UMIFDJfvHK/PS485X4xJwyxWIcWLl856AE6Wyvaikcr+F3Fk=
X-Gm-Gg: ASbGncuCznVg0DQ0eYDl6GKNedqJ+3CAduk17/Op+8sGQ6wcBNBLsDdBgcguGWs5t+5
	0nz8Y1Szk27L8DOssqjlux1l/41gwHxSzct5uxebMnY5PsRPBrzb13iEZhLcYqnHC5/YHGwD4R4
	ZyeaIFuXdOBUA4mWhtcIfa+7B4S/yUgy5NdfqX2o1WEGwxHspK9b2A/bZteLE/YrX9CGFqSQmcv
	OssbGr6r/IQJl9PBMRsGcOMRJ+exUKZYtVZ3eL+cZCcFKnKG2qqbbpNovKxhq8mtC3kEHMa/PZC
	r1Np85ni782kYAWCf+xF6GmqWyS7aqx36XwUcdlBJN2VdpFiEz0jzDbHRQ==
X-Google-Smtp-Source: AGHT+IELdinWh4rp6i4iXWGA5H/t+4IAyyZGzK+iwJMmKFoXazqziiKFSDj1cayIDmLBdm814eH0Qg==
X-Received: by 2002:a17:90b:5686:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-303a906c678mr7028440a91.27.1743104183029;
        Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:48 -0700
Subject: [PATCH v5 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-7-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123623_782867_3E0CAAE0 
X-CRM114-Status: GOOD (  10.36  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 0520a9d8b1cd..c2025949295f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -136,6 +136,12 @@ properties:
             mechanism in M-mode as ratified in the 20240326 version of the
             privileged ISA specification.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf supervisor-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as

-- 
2.43.0


