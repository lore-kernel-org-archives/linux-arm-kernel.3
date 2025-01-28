Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37257C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ysqLj76yIXMmN0DuXp9ro2na+awhMKH5VmavOAjzvw=; b=p4qmjoOfdGtKKfiCyBvZBjcz4q
	2gHcTKqu+JqRS+79rFAWOyXkOVofGy6TcOdhe3vVro641PZyonl1+7spfD4aOtJqqnfqjByQTEobp
	/QVA0T0sxx9u2Z7jlzzmnAlf1lITZE8wj1LeqZl5uDN6eDSUk317K1wFLAcxX5QtoDSolSpUksdCr
	wKvSDxM5if1CDijUdDoDTv+bnLR32awbvfERhYWisYYJEKcgDZbJfCXNrmjD+NHcrK7dXqmvUsFir
	Xix4auY3PRK4lmEt840OUK9lye5WK+hl1ywPvsRU6d1TlHFV4LenzWx1nJIHQXl+WxMj6QynPnWLA
	CYU7XxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdtC-000000047dU-1wCX;
	Tue, 28 Jan 2025 05:11:54 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhi-000000044Ui-3QzY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso6941820a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 21:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040402; x=1738645202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ysqLj76yIXMmN0DuXp9ro2na+awhMKH5VmavOAjzvw=;
        b=VeyZSer4KuDZu8cM6gR/zPRyN6BQ2Ki8XjG9o5Tq2zOw1TBiO2UKZOo4tqnnooie4p
         zRropFMUP+eCjG6x3ZLIu+d9zZiQmpOoPdBDFU/Fi+JWyAkzLPD6lSB+kvymKWhYdDfe
         I0wPpEd7L3xI4eTTxpQfuFa7+anyUJ0PGWrGvvxkUa1aAP3+SwuKKq5W4y+WMiONcPjD
         YUVIVUKJtG5yZsGvZo/9iWwaEGYqjZkPVhr5zh7KtNBTHJxHZDGoBD+1hUUDwC0Sm7+V
         G1E2WpTuKjqVMYyGvmC+WpA5oJ7BYpGok3lqHDY7AulG/WfEDFC1grnRO2Bw3uaFVLXD
         oTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040402; x=1738645202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ysqLj76yIXMmN0DuXp9ro2na+awhMKH5VmavOAjzvw=;
        b=nn6adW2YTd6suxmhse8v0Hre3jEYZRn56i9tUAiGYKhJ/esUMPd6aZ/eV4RigpZooj
         22V0BzxVguttlqLJPrqswZw5Sj88F4+64V5rEe1ZXojEVUzGNnbsfvovE0KeUEb65H06
         uuzBWWsH0kkQk6xaQqcFXJdunK5uL3jnKKH0JnREOP8CqWPFU+rggVG6YoRMkYBL43M5
         i2hXIcZutBg6QRXexa+biQ6T4oTxJvVlhidFHKEkm0rjQtgm8s9NIC++CnAiYG7B1P8M
         ejtUtOIOW91DWHGswoEKOxdUUz+EsvKCHJkju3nkZYQ7PsJ/mguoYhE8TAzb1jWx1hNA
         wKBA==
X-Forwarded-Encrypted: i=1; AJvYcCVKiZgdbtqU/jLDfy+k12yEwpBhOFhzTqXmFlJvGLLzAbOKa2TWnA7jlNcmQQozBOpG40k0EJJQAEmUvKXTzv0S@lists.infradead.org
X-Gm-Message-State: AOJu0YzhECM8tUU1ESc4whGepewSidRgmYglqzia7m0eCDAWg4PFqp0G
	zy3e0NfIjei08HA98hYVhUf8xmXLmnNgj+gHdcftmccgCyR/qOduDoJhFVDBJNo=
X-Gm-Gg: ASbGncvD6Bpgjs6mI7TtBtqnMWNgXbku+jW6oYPX2I7JSumpOTTMrT/rcui0NEnbdlC
	naobd2GyjYZqAlkpu7pcbKaz3He22fkDRyfJSE5lAi/1s3XWMpiXi04oeOiLq/nJYe8HAdYeQsB
	tY/Q3tOal9Tcd59z4Ne4vpzOpprapnM6TDWh5U/RS+ljuJOLHIYv+/bEpcL7T1JwXPRGYxcmFXy
	MQmbicYUgyKl1ftyoRn2fdfIlkO0CJdp9/hl242h+WDf94C1r+D5ANQHSUtY+L8TO+fwrWfvrc1
	Pkv0w13bsI0XgvTxps3qB0/y30Nb
X-Google-Smtp-Source: AGHT+IFdfSM4LoL408uYEIffufa8tyqHYMXtXIXqsBrutmD1adLWVCNfMy18lpD4qkSPUrqnOkGRNw==
X-Received: by 2002:a17:90b:270d:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2f782ca5d86mr58401904a91.21.1738040402292;
        Mon, 27 Jan 2025 21:00:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:49 -0800
Subject: [PATCH v3 08/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-8-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210002_903792_7BA1C9BF 
X-CRM114-Status: GOOD (  12.69  )
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

Add description for the Smcdeleg/Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f47d829545db..1706a77729db 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcdeleg
+          description: |
+            The standard Smcdeleg supervisor-level extension for the machine mode
+            to delegate the hpmcounters to supvervisor mode so that they are
+            directlyi accessible in the supervisor mode as ratified in the
+            20240213 version of the privileged ISA specification. This extension
+            depends on Sscsrind, Zihpm, Zicntr extensions.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -169,6 +177,14 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccfg
+          description: |
+            The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode as ratified in the 20240213 version of the privileged ISA
+            specification. This extension depends on Sscsrind, Smcdeleg, Zihpm,
+            Zicntr extensions.
+
         - const: sscofpmf
           description: |
             The standard Sscofpmf supervisor-level extension for count overflow

-- 
2.34.1


