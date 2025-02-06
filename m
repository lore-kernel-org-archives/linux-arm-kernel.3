Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C52C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 07:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=; b=Md7vsCoEMMCS80uHWOS+X95nID
	I5E3wBQPVp0YXWvHmdYCcd1l7aUx+YAOGsL6BnWhEPhsAOaq4yiyHsQtARqCo9iVe+HRcCMQrHdf0
	TcPAONMBSpfgiuF5XlCmoCj2vgYGKfDYNcD9E+JyJ7xA3pQolgNbbnQxRm2tcLdgHFlZWxGz5R6ak
	EVEYlfJhFMN1uUls5YGhaNTkowVvuyxMI9FNAbV3cNOjCfZSPuBvXuoPLiyESjZORWyBRvq2nx9GW
	0+zSeMr72g8+z49zqwvBPZ6G/USw78GvSvYbrANQf0f0ft0nYER+rh5xIx69YPi9ssDCKI5B4C3ML
	O5X+8SLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwNl-00000005bPd-0w89;
	Thu, 06 Feb 2025 07:33:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwER-00000005Y2O-2yDC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f441791e40so770612a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826607; x=1739431407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=ox2hM89X/h2Q7gAIvwpIenb6JJX5gJwZJPK2rjhnMlfNNrR8z1ab1XIcxjE8MltzIL
         YddkLF2u3Zz8ZLKfCxa7gv6A6LUV6HNtHUBP8VYGdf3a7B9dpmv1J6Sk7K80Bb7QPSS1
         BA6nSsokEKc9oGDyK/AYa+04LMJnXEaI6y7sBJ2FTRzfgQE8SU7cBAxCfeLUUV6Lwh+N
         nH6SH1uwsr+uOgO3BZ0uUYOW/xWTvAPT8XBm+6uJldMCDwKSoQrqRy2iptrLAhUquCyW
         07SA3JMfzlDbN8Ixx7xEZGELPhnjMz9DUbUJQ3adj+7q1lkEP0RGoC+mjLqZkubyfPXV
         tGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826607; x=1739431407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=U8aPVy3nPV5s4TcgJMcOCdeDfrIfRGtnvm7HLasMwnyIOIhcATFEe/D8IBJVQufiF6
         JGN4DWWEsnz4ZxJjhI6W/jucBDsp7ZLu+ewKXjxBBw6+OMKb/SmF0cbDB5Y3sPvb7bWl
         e7eyCp64GOhJPU663PBpi9wHEIIZEK64B/4ELCfbb70qgOxc/2Cq1876HZkNdWuK8oRa
         +KvG5h6R2JFz/wYTdGVxVlCe4RnQxvQKKan9Myo+Y3TkOv8Nzw/ZJWGxVT7KXiwKf6bq
         Jh1idajBgFNw6im77HGpOwW+R7vsOaAGNEPkQiudzpIx9UbTRgB6EvAAQ94U3kHeP/FE
         An/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8RwdLBhti5oyNjOFbyy6lXU0NDN4HdTd3Pue7U1BNYYuF03GAJmDtPuntSM7NHbOge5HC8GxMQWp0qel8VrC2@lists.infradead.org
X-Gm-Message-State: AOJu0YwjASPXFqxNwu06BSBDY3ISl25Eopf1kDFN2Ky6jeFNeJMl0kYP
	BuU6aGOTGt4VRJmNkxF30MMbiCVIXPCCeVnA3MV5lqFL7IEUIp53ud8F3pupYGw=
X-Gm-Gg: ASbGncvS4Ko0whfoY+3dKbTZp3wVRXJo3Jt2M52mpEV3noTo2wGb+rmR3z/TBbGdcUJ
	F2p76uj6O1y+gtu4qDe14c+A83WtAV3E5bc3UCLa6oLH1DYsiNbnr+A5OmlmF4N0DnlouompvId
	df2pwAPWgeQ+p8QT8HQ3l7jfhxRmojqcA9SxNOGqqEydlbiyZA+KJ7esLacJQAa5KiHemF3aB64
	uSS5ipw6LuAuxr+ex+lRr8OriQz3A959jC1mG95104pfMql2F6zf6w/MD6YxRmr4hg/lVf63gws
	+G1IIfxYIEGWVYJV16Eucl84MFA2
X-Google-Smtp-Source: AGHT+IFKe2kQczxclY80PslHuvYzWPmjNnKAp1q2ypYQZ9arePKPx5YXWSLFOApkuW37i5EznoN6cQ==
X-Received: by 2002:a17:90a:d410:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f9e08682a8mr9427110a91.35.1738826606814;
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:12 -0800
Subject: [PATCH v4 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-counter_delegation-v4-7-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232327_779554_7BBF58A4 
X-CRM114-Status: GOOD (  10.56  )
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
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 42e2494b126d..be9ebe927a64 100644
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


