Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA6BC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 05:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=; b=TIqOHS27TRN5Iu/Bxzsu68LZyZ
	iKnPGvE5TRM9QqVQK/8bxb7i8f9B5WzwkgUpoFda9rdGmaQtwUBz4gGFKSgkbCUSTo06QAJAiGUm/
	V4O+yEMAxKNH+KynM2hhaNz0i8rQrxoup5n8tKIs3DSGHWGkW2Yce3TlDrWMFCl/JtlagDS7hX44y
	YfZJlgtUh4fhjgy3rO6X2kVPUMTgCZO7TPnWeo2PLFnChEgz28xkEMSoV9I2gllGFBd1VvEFh7MHX
	uzk7PqNSZLROEWHsey8YXoRrD4nGuPBKwBfp/h01joDrLPOVyGebwKKxyjTgHJdhsDuw1aQOxuLgi
	0LkSWIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdmq-000000046EJ-3Brz;
	Tue, 28 Jan 2025 05:05:20 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhb-000000044LI-1mmf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 04:59:58 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so8917570a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 20:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040394; x=1738645194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=PmkeDGlOME7wgxtaBMxq5n2amg56RRG4c97oLuFR2oCfyToW1ixSgFMrdLR9z6mdUY
         geq639ASUKShvwP6qrJkj+W3vJGpI1lAqyOB9yTkHNfJREOvEGXvcXqnTl6BBrhYgzg9
         LJRX+5Q1rdmIAfuJlrpXqyYHJ1eNZv5nzMGZVKb+Xamr4XnJBw2fazRLf+1iaujQyoxR
         PjM8+tMXuTLWt8QgtROTmDR928WudIthKuUWgHoXYz8T5Z5Bzy7AEol0zsTo2BZC50WX
         hIlcgr0wGKGKlSeiIA7NqEZdrGHZ89M8dYgaaZYcCkAcgtCp58dZiIB21oZbvd0FQ+F5
         b2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040394; x=1738645194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdmJbLVNE72s4snJvlCZyY59rcdtG68osktCOOFf4IU=;
        b=BorWYjlYufpX0+s9ERbJqLohJRfg+CE2MibtQDef7sQULcBnPVh5X7YTZR5Spr75j3
         BP1hanGbTATu1lbdW+LvUnR4CQuosqXI5CwVqzi3rpyEKyqW/7GGdfnHOvMC6vNJDSKm
         GQT0Bvy8V2U524CQ+uWD41KEKj/ZR3CH15huXUtqsh/I4ixsmou685YLOy1aclHjuzYm
         qf98qzh1itc/LDF9EWKW4CBnvfIZRAOl+kBeq7D1oGKuO+JiHtF/nU2K0m0OHaE1jS43
         zidtz9LQs3mG5shBkUPIQuiUVvwIGAmoHkSGhAoUK9DgsMscjVVHcrUhcZTR2ZhBo126
         A/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiRIQ/DJOE96Y47AZf7kD2W/mfFRZcJIL9e/iMX+S12LP5JiYMi/rpmhDKpDCNzmyxJmhK3L6oJaaXE5OBV3xp@lists.infradead.org
X-Gm-Message-State: AOJu0YwFz2mCSQpf/838XKQcQxVTj4naXgarhO+Wa/XF/GSKJ3mp8b9d
	6Pn+//dKyIZtPB+6LsO38WuUzFuDC5S4B2qp6bhCsIA9ELZyQfmk3DmaCtpkp6A=
X-Gm-Gg: ASbGncsisAXYJw6SxsSSgoertT657u2R1OVhZh7PZDYeG1tbpiw3kkpEXDOFO0ARbtl
	G8dfQtCiWiYh6uRnmg43QU2EyXOn/rtwoUllhtItZtdkrDy7iYqnpoi2FsmwgB7ChuJ09zFgcNh
	5TlWUWIV6l1R3wViMCs718K50gBNkt02bj4dtSfgC1rjb8nN0qcxXbJ/ojklW+nFSQvTZhpV2VV
	9xPh6jy4DGPgapJMLs/dgGnI+k3F6WbV2boAHZUM6pHPWECZd7D/YoLRNl+aQU3Qjl+2e85XYuL
	gFZ4bZkmXf9lLPRLeolCUqjjBGsr
X-Google-Smtp-Source: AGHT+IHSyPvtuQcDcqt3ZNPeK0UBj94g96yzFH1G7FLZXdPg/qfAF4HitoyPnQvPmyX4Tw9btm7mhg==
X-Received: by 2002:a17:90b:258b:b0:2ee:48bf:7dc9 with SMTP id 98e67ed59e1d1-2f782cb092dmr65904028a91.15.1738040394340;
        Mon, 27 Jan 2025 20:59:54 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:44 -0800
Subject: [PATCH v3 03/21] RISC-V: Add Sxcsrind ISA extension definition and
 parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-3-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_205955_547055_359CE01A 
X-CRM114-Status: GOOD (  12.66  )
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

The S[m|s]csrind extension extends the indirect CSR access mechanism
defined in Smaia/Ssaia extensions.

This patch just enables the definition and parsing.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a..3d6e706fc5b2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,8 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_SSCSRIND		94
+#define RISCV_ISA_EXT_SMCSRIND		95
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -109,9 +111,12 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c2..d3259b640115 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -393,7 +393,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),

-- 
2.34.1


