Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C19C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=; b=pamGDgmOyEzJ3dhwnFuOwrvCsj
	xdDh4Ry/6Jvtn863tbC55oYFfK7XX0JVp5ECmqUMFqs94X0YtaaDk+zr9YdXQX9sl/5kX35LwNhZ7
	xmqXYYw3U7KNBfOjNLj+gHc4vsNl6i7lIUtiPPYd7k+70pD5pIymeSKWM1C7hA0+fsyCLhnZsU/ye
	zYuaajfjogkCHCXHw+96UIRPeWeImGlWXZnh4BbogXSNXt8LHN8tdJnaaoayZ49sPoPW+2oIk93dp
	zIO3a0MF2E/tNqpFavJvbgfpJWmkx5elZxSPDjAi4XVEg5WDykG8EKrKCdm7GHd26GyeOE30+ENyG
	Ntdq4v1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtDo-0000000Bt1r-2Gam;
	Thu, 27 Mar 2025 19:49:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1h-0000000BpdY-0B03
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Mar 2025 19:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=; b=lgReFCbBx+Sxvr46NM8n+s3Q5x
	fY0Oy/07lQthFkiGmRmWxYGBRCX/BsFJtoTlFsFzm5RmJg3MZuS7xFJzYhEGqnd2Z8YkO/o8Xp7Lm
	KxCM+gLQCT/M3TDmCpxO5hm1cgruLQme+8gsG3D/wPqo4aGzVVW4e/RGUPB9uedfYXJof+vYeZn3S
	atFhSTKV0ruNOuYE2PJZDm6l4iyOc3BRUQyUbkH+xqCw0chN+Uu9OFeMeGxhl9qgGQ4n4oxouNrFX
	QZDKDpVivbxJDZuBP3DwuvILulvTk9cUyb0QbtIFcUBblNlj1XxgJ8B0hMHCSULSPOml8mAPQXs+m
	gOztxhTg==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1c-000000061Z4-3VVu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:27 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-301c4850194so1888709a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104178; x=1743708978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=PwVBWpSGX0jD0UwvozDu0KqNWDPI0iWH8jEEUx0AdQufkmZtOD9VJIWkNL80S+h3LV
         liPxuHKVKUx9Ji/nzhtmaUfExxhp6z6xwwQAH/JMmgFpwqfjsTLZzcuq3FGOmGpSKuti
         mrUaOSOpmvE+areIbpjF2AA7bDImMWWYW5KtcB/DekOtTCCWoSokqbicnAoRBs3SaegB
         37qzt/+AUFxNLG0ePZHClDHP9Z66c1yZJYQfhSGj6dECWDtH9exc5onpi4SYelFmkF0n
         s796QysiCLAb87+hUs1ublyKx+m/KcBpHIE9sPjvPmmSh4dMBXdmQEIYLe0iJXnOyJEN
         2y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104178; x=1743708978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=ctdI4csW1bDKQA4qRNPcuiwucOA4r/2z6mkb2p5YAQLLBl3NE6DHJzq5XMSQwTSZI6
         COF+29shMXOymzRhCkviMIFZlw+a1vYT1RA2Bhrj3Nu+iXO2tf1vIyej0NK9Cyd1MnpG
         TN/E4PrgZZRFB2fB9+Xx/egGPhk0CsVJ+LXSVPTXeM72i4X6bPYnCPyk9NWKxZQQ82yh
         j3VxhzFHRrP92WXn4JR4OnjjKWDIoV5fkK7L/1J5BMniFaJqugvFxChokceYC1DkviVQ
         lpZpjEYNWmR1LLqahPrEaga+1t27Qq6qKBLZMn6SSi6y2yAmiG+276JQnzlkmGOnMz59
         K5fw==
X-Forwarded-Encrypted: i=1; AJvYcCUd2c5UmLTEyqxTv753Pt9z82C3fSpWwXXoEVeTt/vc3HV8HjIC3+XMeduVp1wLOt2IBrZJH24r4pBo0XCxdguB@lists.infradead.org
X-Gm-Message-State: AOJu0YzJTEi0VDs2eLJN+opOkIO19kwRovIbTvG1zqgW0gR6rrzCmK5a
	GxGzzenLGPHek5ek8dC9Y4J7sb3uIkL3kYUFFTCL0AqdERTY15zHlIBoUI+/D38=
X-Gm-Gg: ASbGncu+E4gMdfGWdBnA2ynIqAbK4hyPzC7ibAI7ys6CT9qeMiRI9VPiVB9mFezh2o3
	Nmh05RHamWyHP/MRgZXEPoV8hedUQkj4rXZfPeIvoX/4J7o9e6goNZEWpAvDP7F2XN1eeeYuoZX
	Lk2/c5hpxy1j0qz106dLApATSKfhECp1Nz2YpirofFopio2DhOtB09X8mUesq0PD5kApdwckluB
	Qk22BOw0QshqgoNY+NNylkaOYHK4ZU8C1NC5kMELvtvSGGQU4AMJgGcD6qLTZLwMpHPv2uHpPs7
	t2EMyypTYlglmkSG6cw+EeNGTooKS1R0xKgJfYoNJNhVYPHDAmrEmZ5w7ICzhXRl8VyS
X-Google-Smtp-Source: AGHT+IFOxM4SmbXuuTZ7zfbjNBSt3NF5qSX8XxUdDdxMSJ9Gbp2tgCBb+BZDCQPwqEBKt7x+Gq+pcQ==
X-Received: by 2002:a17:90b:2801:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-303a7d5b724mr6622802a91.5.1743104178125;
        Thu, 27 Mar 2025 12:36:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:45 -0700
Subject: [PATCH v5 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-counter_delegation-v5-4-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_193625_080988_3071F577 
X-CRM114-Status: GOOD (  10.30  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..0520a9d8b1cd 100644
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


