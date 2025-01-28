Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E49C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nwB5ijQXYUTHkLWAXohil6yVgl/NyKIaGqyFvphby4=; b=GKmhuYb+r/cdV7KAEHJvxpp7Xd
	AJ95I7tMV+uWZ7fS3vrqrN3cYc2R0RcRQ+McWGWVr9b0dEDDQTZ0Gv3Ol9uwlwMTZYE4bzwR2nM6+
	42qVGEJOlnKDx8/O9cih6m2TP4Lyj/jAupOr5RmztR8b6PBq+NC1NcjLCbaDjgoCyXxDjcrNbhQh8
	KI4SXReeAAj/BzLLwRqnSBCo/KV3YNAO9fbQPxFRZN+ciXIjX+g2ccDIVagATASPA4P6iXYZDgAXP
	GLPGeW+HhajeGa8wENaIqwY6cDQO8GTQh9g03lB1N7RprSJzeTd/q/j9Vjfg3xRpiFlBDnFTTzDzS
	MRTYuxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tce8v-00000004A4M-1bqI;
	Tue, 28 Jan 2025 05:28:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhl-000000044Xw-3xSa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:07 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso7986536a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 21:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040405; x=1738645205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nwB5ijQXYUTHkLWAXohil6yVgl/NyKIaGqyFvphby4=;
        b=vcIuZBy8zDTAtQ/fDnv4gkLnTLIaf7QS8Qu0m1JQcn64TMvCRcxB4IyBN8duevhAD9
         nBHds543sJHMxz7Ju7q8ihgsyFdFvL/zP5SqvmQkY5IGoonXfcvV8f0LYFlymKHbWO3N
         vtH+XUxNs9ydsMVNiI6HaTYS/7SUw5P0Ajn2GgFCr0kYDrKeIzFdhR4Budx0zrRIfwBX
         63mwGLANqQ08ERVjmfuByDq1wov/zqrfXh9ID647dQPjuW9NTih/ea1Fk3xDg9N+bv9q
         FnhKLqv2xI4c/BPgKp7Q9bz1Ul6Kid9TpwBazbmCLKamy3Nj2ym+IMD3rkkV7S1qwnZP
         KNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040405; x=1738645205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nwB5ijQXYUTHkLWAXohil6yVgl/NyKIaGqyFvphby4=;
        b=QC0dSXpJaI9AdFEGkWA5RJYjVBUhWuv5uPCMeWAtLSdRFxKLGVFSgTaA27Yr1uxmZJ
         bSbKNKXYn42KybIRk9yBEfzFkP45EVI1Eh7CWOsfPmF1whaPwdztiGPfPDuwY+m0sYaZ
         qxv4vtQ36daQ8ay5nJ6vE7SSmjY0GgDjv/KY+uLoPETGyr3J0z0Se4BI8Jfqk+y91IbW
         bRh7SFZiFVj0j7hN0G2ipnNW/ZS0kQSsMW9VpwNycH2cSii/TcQqy2zY+JvdnCKr2IbD
         2Yb5cnk9y0X5pUg7LwXBeBWPmVfkTCKlrp3jxCiXKmSzYrUlq/18ZO2uehXr2dGMwWvl
         Qvfg==
X-Forwarded-Encrypted: i=1; AJvYcCWp3Dhrdt+o6XV+jeAfDzKWD/L/JHte1W/t8FJQB5CjYWsHUpZBvMqyMpTPpgIbb9/tAm2STjhw1A869j6uW6rA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl78s7Wo+s7iRluNQUzaYsA4nKD3K8k8C/SvlGx6JgI9/gLwWb
	g7adiZv1aXQJP7INaXOko1GaJ4SeBqrciJgaIVVK+AodjocYbaS6jPYddJ77J1U=
X-Gm-Gg: ASbGncs2QJT7Ve9+3tQ9LEKEVndsVptVoap42pScHLi13aaBYgRTBH+LcIWIErK1tsx
	HWr71Wglra+IRufH3wO9xVVOyLMwV1CBKLSsK64VEoRr5UVdGZgrAG5eMBwvjuh80r56sE2Ewq2
	3ykFjGP+cnY2yOklJkQbb+lRcBNAB7BQid6ATe4AkVVgLLQhiUgoRNBvEsslsqZUCb8Dow9ovsr
	JlKBp0fddhElm2T9Bu26OtR41ky5tEALAgEIy6z7YU8vn2JgH4lZ6ySxHm4PJdpUPjSBrlyMDej
	K3IzE1wAiqFt8sC8x/HD9/2YuYjg
X-Google-Smtp-Source: AGHT+IFrXpURXC6IeRPpOGWg3/tFzqB6mJrEgvaEoQuFlLXK7BO3fm1YNKQtwAqXg3g7vbpjjvAXGA==
X-Received: by 2002:a17:90b:54c6:b0:2ef:949c:6f6b with SMTP id 98e67ed59e1d1-2f82c0d31e5mr3090153a91.13.1738040405414;
        Mon, 27 Jan 2025 21:00:05 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:51 -0800
Subject: [PATCH v3 10/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-10-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210005_999980_5BAACCB0 
X-CRM114-Status: GOOD (  12.10  )
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
 Documentation/devicetree/bindings/riscv/extensions.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 1706a77729db..0afe47259c55 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -136,6 +136,14 @@ properties:
             20240213 version of the privileged ISA specification. This extension
             depends on Sscsrind, Zihpm, Zicntr extensions.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf supervisor-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+            The Ssccfg extension depends on this as *cfg CSRs are available only
+            if smcntrpmf is present.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as

-- 
2.34.1


