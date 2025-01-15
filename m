Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966AFC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5TepKu0SZ93QxY0JjOwIhgH9C4Czywub5gafQUMdfE=; b=Wvrwrru94pDKER/6L68jTEnckY
	dXH6ySLJ1ePH63XaaTMCW6iocmu/F4xx6dizklNDjwfE7sLoZlEoWUpUnLCBby9hpswOrBRuOUarN
	er2r4q5Ngf8GjHfipxLqTw+Lf1milI0qSbyRqfW+g3oEiznkb44GCoXKUUCcFc/WRitZ7poaattFw
	XVSFGzlP2m3jnJJFIC2AZRpzyigJL6+DJh0FIHWK2O7dBtEZs6xwpQZPewNVTEsOQTn2mrnY3SK/1
	00mjjSaKoW+Jg+Bv6eGqEk7eg3m3zaBR8BB5N/cM40c6DTjiimUowUEQdKowUtgXC5f16W2C4SLlA
	OVc3y8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3m1-0000000C2ub-1N6Q;
	Wed, 15 Jan 2025 13:49:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3g5-0000000C1W3-1A3f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:43:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43622267b2eso69733935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948603; x=1737553403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5TepKu0SZ93QxY0JjOwIhgH9C4Czywub5gafQUMdfE=;
        b=uTsUa00GZSu+HSAxpDYux3k80PlCt46uxfE8dIx9nqg0s9hFyNyns45mV5TFLBEn0u
         03GTFvFZoD4NvfKDb9MnuLgY6BMCz6bnr0HYYX8t0Bwh5wcNyBEEIXSravpR/rxUhNb8
         5+k3HDmMYw1vBnADwHA4iqkJkthFJjF2FpTL1ncIr0JYtO6cr6blfOyvOSJUfZH80C+o
         RbP82G04AUwI6JE0yEUSwqWxYrVXhWxPh5IGwflWRg8nknQm+peJKZGWvSF+kinvb9Y7
         ks0Q05LNFe+UrIs5198Z/shw4aZF7PmmXCHw0xP7xqd3gRJswVQXXTeoFZj4AfXoPVjV
         wmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948603; x=1737553403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5TepKu0SZ93QxY0JjOwIhgH9C4Czywub5gafQUMdfE=;
        b=bkjblpayV7y46fXC3BkMu+m3cytSQFWCUC+6ONP8gUBl7FY024BmFSHfEqE2GUn7O/
         cphtLTG8ph002SaGX1nBxS/a3r8oAl9utufqqLHOjKJPYrVKGx+NtG7/J3/aP2T2smrB
         +JM0Y0VCDBwM/OpbEAaSt3lI2wFkx9+8arvqUOyeRth72zUJnLKRFS/hNGXEuKnm4BaJ
         Qt+ouuWQC8MsJfW28o9yC62qlgs5SuLz9IjS2kkU/HGvUuMiZ5slnIXZcOXBZBgwJBXo
         abJ8Wno1cVslC8zaiyooo0f/T3hRGy4Y+9F4Jrjj0tVQAdjYMTzYEu5tJEni5kdbe9fV
         lXkQ==
X-Gm-Message-State: AOJu0YzYn2UKYOgNJm34z4WBE7iEhDIWLlUx+IskUoLpR5zKstG0755S
	v0TPG0GEEDFpP+u70ZmUY3RKl1hEjG0broYUM/qhbu91rLmmItT87h8R1WgMCmvQ+/rR9rXnCHO
	/
X-Gm-Gg: ASbGncsVIwSD0UdP9iaJbRpYP2QbIbu78pMSV6NMa5ZRd8JVhYQP6tEn/qK2Q0jt1za
	krpqKSS1mpcnnMVIxR9ZbWdOMapyDQUiW5MfLJi83jBjfwHzWCqHfm6Zfp62CBoRYlRxFYaFDu0
	AhMwcBpu+kWUFyCVUaygU7/JiymSfZkBSE632QbKhcy5ag53QJxsWOILuAqu66Zlsj0BIbD+xUq
	F2/6xlYqTD0D4SFUXNHhDhceRrbwCS4YtQY3gjsnzhIM27xXoTnnWQ=
X-Google-Smtp-Source: AGHT+IEj/sp02gMiYcMbSKdFqRZ9B+zC0XUksSqhrae7T++LTIpXCTuOP/MfFgMnvX9PHTDGynGtYg==
X-Received: by 2002:a05:600c:1c84:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-436e26e2725mr234904455e9.26.1736948603484;
        Wed, 15 Jan 2025 05:43:23 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm24853825e9.3.2025.01.15.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:43:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64/sysreg: Sort sysreg by encoding
Date: Wed, 15 Jan 2025 13:42:56 +0000
Message-Id: <20250115134259.1864060-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115134259.1864060-1-james.clark@linaro.org>
References: <20250115134259.1864060-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054325_319497_12524A73 
X-CRM114-Status: GOOD (  13.43  )
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

It's mostly been sorted by sysreg encoding, but not 100%. Sort it so
new entries can be added without wondering where to put them.

The following python script was used to sort, keeping the top level
SysregFields and comments next to their current Sysreg entries by
splitting on "EndSysreg":

  # cat arch/arm64/tools/sysreg | python3 sort.py > sorted-sysreg
  import sys, re
  def key(block):
          reg = r"\w+\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)"
          match = re.search(reg, block)
          sort_val = ''.join(f"{int(n):02d}" for n in match.groups())
          return (sort_val, block)
  sysreg = sys.stdin.read().split("\nEndSysreg\n")[:-1]
  sysreg = sorted(sysreg, key=key)
  print("\nEndSysreg\n".join(sysreg) + "\nEndSysreg")

Tested by diffing sorted outputs:

  $ diff <(sort arch/arm64/include/generated/asm/sysreg-defs.h)  \
         <(sort before-sysreg-defs.h) -s

  Files /dev/fd/63 and /dev/fd/62 are identical

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 1006 +++++++++++++++++++--------------------
 1 file changed, 503 insertions(+), 503 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bbe7df69da9c..fe1c58367ceb 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -661,71 +661,71 @@ UnsignedEnum	3:0	SEVL
 EndEnum
 EndSysreg
 
-Sysreg ID_ISAR6_EL1	3	0	0	2	7
-Res0	63:28
-UnsignedEnum	27:24	I8MM
+Sysreg ID_MMFR4_EL1	3	0	0	2	6
+Res0	63:32
+UnsignedEnum	31:28	EVT
 	0b0000	NI
-	0b0001	IMP
+	0b0001	NO_TLBIS
+	0b0010	TLBIS
 EndEnum
-UnsignedEnum	23:20	BF16
+UnsignedEnum	27:24	CCIDX
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	19:16	SPECRES
+UnsignedEnum	23:20	LSM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	15:12	SB
+UnsignedEnum	19:16	HPDS
+	0b0000	NI
+	0b0001	AA32HPD
+	0b0010	HPDS2
+EndEnum
+UnsignedEnum	15:12	CnP
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	11:8	FHM
+UnsignedEnum	11:8	XNX
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	7:4	DP
+UnsignedEnum	7:4	AC2
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	3:0	JSCVT
+UnsignedEnum	3:0	SpecSEI
 	0b0000	NI
 	0b0001	IMP
 EndEnum
 EndSysreg
 
-Sysreg ID_MMFR4_EL1	3	0	0	2	6
-Res0	63:32
-UnsignedEnum	31:28	EVT
-	0b0000	NI
-	0b0001	NO_TLBIS
-	0b0010	TLBIS
-EndEnum
-UnsignedEnum	27:24	CCIDX
+Sysreg ID_ISAR6_EL1	3	0	0	2	7
+Res0	63:28
+UnsignedEnum	27:24	I8MM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	23:20	LSM
+UnsignedEnum	23:20	BF16
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	19:16	HPDS
+UnsignedEnum	19:16	SPECRES
 	0b0000	NI
-	0b0001	AA32HPD
-	0b0010	HPDS2
+	0b0001	IMP
 EndEnum
-UnsignedEnum	15:12	CnP
+UnsignedEnum	15:12	SB
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	11:8	XNX
+UnsignedEnum	11:8	FHM
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	7:4	AC2
+UnsignedEnum	7:4	DP
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	3:0	SpecSEI
+UnsignedEnum	3:0	JSCVT
 	0b0000	NI
 	0b0001	IMP
 EndEnum
@@ -2064,6 +2064,16 @@ Field	17:16	ZEN
 Res0	15:0
 EndSysreg
 
+SysregFields	ZCR_ELx
+Res0	63:9
+Raz	8:4
+Field	3:0	LEN
+EndSysregFields
+
+Sysreg ZCR_EL1	3	0	1	2	0
+Fields ZCR_ELx
+EndSysreg
+
 Sysreg	TRFCR_EL1	3	0	1	2	1
 Res0	63:7
 UnsignedEnum	6:5	TS
@@ -2081,16 +2091,6 @@ Res0	63:4
 Field	3:0	PRIORITY
 EndSysreg
 
-SysregFields	ZCR_ELx
-Res0	63:9
-Raz	8:4
-Field	3:0	LEN
-EndSysregFields
-
-Sysreg ZCR_EL1	3	0	1	2	0
-Fields ZCR_ELx
-EndSysreg
-
 SysregFields	SMCR_ELx
 Res0	63:32
 Field	31	FA64
@@ -2104,6 +2104,36 @@ Sysreg	SMCR_EL1	3	0	1	2	6
 Fields	SMCR_ELx
 EndSysreg
 
+SysregFields TTBRx_EL1
+Field	63:48	ASID
+Field	47:1	BADDR
+Field	0	CnP
+EndSysregFields
+
+Sysreg	TTBR0_EL1	3	0	2	0	0
+Fields	TTBRx_EL1
+EndSysreg
+
+Sysreg	TTBR1_EL1	3	0	2	0	1
+Fields	TTBRx_EL1
+EndSysreg
+
+Sysreg	TCR2_EL1	3	0	2	0	3
+Res0	63:16
+Field	15	DisCH1
+Field	14	DisCH0
+Res0	13:12
+Field	11	HAFT
+Field	10	PTTWI
+Res0	9:6
+Field	5	D128
+Field	4	AIE
+Field	3	POE
+Field	2	E0POE
+Field	1	PIE
+Field	0	PnCH
+EndSysreg
+
 SysregFields	GCSCR_ELx
 Res0	63:10
 Field	9	STREn
@@ -2149,31 +2179,6 @@ Sysreg	FAR_EL1	3	0	6	0	0
 Field	63:0	ADDR
 EndSysreg
 
-Sysreg	PMICNTR_EL0	3	3	9	4	0
-Field	63:0	ICNT
-EndSysreg
-
-Sysreg	PMICFILTR_EL0	3	3	9	6	0
-Res0	63:59
-Field	58	SYNC
-Field	57:56	VS
-Res0	55:32
-Field	31	P
-Field	30	U
-Field	29	NSK
-Field	28	NSU
-Field	27	NSH
-Field	26	M
-Res0	25
-Field	24	SH
-Field	23	T
-Field	22	RLK
-Field	21	RLU
-Field	20	RLH
-Res0	19:16
-Field	15:0	evtCount
-EndSysreg
-
 Sysreg	PMSCR_EL1	3	0	9	9	0
 Res0	63:8
 Field	7:6	PCT
@@ -2298,72 +2303,283 @@ Field	4	P
 Field	3:0	ALIGN
 EndSysreg
 
-Sysreg	PMUACR_EL1	3	0	9	14	4
-Res0	63:33
-Field	32	F0
-Field	31	C
-Field	30:0	P
+Sysreg	TRBLIMITR_EL1	3	0	9	11	0
+Field	63:12	LIMIT
+Res0	11:7
+Field	6	XE
+Field	5	nVM
+Enum	4:3	TM
+	0b00	STOP
+	0b01	IRQ
+	0b11	IGNR
+EndEnum
+Enum	2:1	FM
+	0b00	FILL
+	0b01	WRAP
+	0b11	CBUF
+EndEnum
+Field	0	E
 EndSysreg
 
-Sysreg	PMSELR_EL0	3	3	9	12	5
-Res0	63:5
-Field	4:0	SEL
+Sysreg	TRBPTR_EL1	3	0	9	11	1
+Field	63:0	PTR
 EndSysreg
 
-SysregFields	CONTEXTIDR_ELx
-Res0	63:32
-Field	31:0	PROCID
-EndSysregFields
-
-Sysreg	CONTEXTIDR_EL1	3	0	13	0	1
-Fields	CONTEXTIDR_ELx
+Sysreg	TRBBASER_EL1	3	0	9	11	2
+Field	63:12	BASE
+Res0	11:0
 EndSysreg
 
-Sysreg	RCWSMASK_EL1	3	0	13	0	3
-Field	63:0	RCWSMASK
+Sysreg	TRBSR_EL1	3	0	9	11	3
+Res0	63:56
+Field	55:32	MSS2
+Field	31:26	EC
+Res0	25:24
+Field	23	DAT
+Field	22	IRQ
+Field	21	TRG
+Field	20	WRAP
+Res0	19
+Field	18	EA
+Field	17	S
+Res0	16
+Field	15:0	MSS
 EndSysreg
 
-Sysreg	TPIDR_EL1	3	0	13	0	4
-Field	63:0	ThreadID
+Sysreg	TRBMAR_EL1	3	0	9	11	4
+Res0	63:12
+Enum	11:10	PAS
+	0b00	SECURE
+	0b01	NON_SECURE
+	0b10	ROOT
+	0b11	REALM
+EndEnum
+Enum	9:8	SH
+	0b00	NON_SHAREABLE
+	0b10	OUTER_SHAREABLE
+	0b11	INNER_SHAREABLE
+EndEnum
+Field	7:0	Attr
 EndSysreg
 
-Sysreg	RCWMASK_EL1	3	0	13	0	6
-Field	63:0	RCWMASK
+Sysreg	TRBTRG_EL1	3	0	9	11	6
+Res0	63:32
+Field	31:0	TRG
 EndSysreg
 
-Sysreg	SCXTNUM_EL1	3	0	13	0	7
-Field	63:0	SoftwareContextNumber
+Sysreg	TRBIDR_EL1	3	0	9	11	7
+Res0	63:12
+Enum	11:8	EA
+	0b0000	NON_DESC
+	0b0001	IGNORE
+	0b0010	SERROR
+EndEnum
+Res0	7:6
+Field	5	F
+Field	4	P
+Field	3:0	Align
 EndSysreg
 
-# The bit layout for CCSIDR_EL1 depends on whether FEAT_CCIDX is implemented.
-# The following is for case when FEAT_CCIDX is not implemented.
-Sysreg	CCSIDR_EL1	3	1	0	0	0
-Res0	63:32
-Unkn	31:28
-Field	27:13	NumSets
-Field	12:3	Associativity
-Field	2:0	LineSize
+Sysreg	PMUACR_EL1	3	0	9	14	4
+Res0	63:33
+Field	32	F0
+Field	31	C
+Field	30:0	P
 EndSysreg
 
-Sysreg	CLIDR_EL1	3	1	0	0	1
-Res0	63:47
-Field	46:33	Ttypen
-Field	32:30	ICB
-Field	29:27	LoUU
-Field	26:24	LoC
-Field	23:21	LoUIS
-Field	20:18	Ctype7
-Field	17:15	Ctype6
-Field	14:12	Ctype5
-Field	11:9	Ctype4
-Field	8:6	Ctype3
-Field	5:3	Ctype2
-Field	2:0	Ctype1
-EndSysreg
+SysregFields MAIR2_ELx
+Field	63:56	Attr7
+Field	55:48	Attr6
+Field	47:40	Attr5
+Field	39:32	Attr4
+Field	31:24	Attr3
+Field	23:16	Attr2
+Field	15:8	Attr1
+Field	7:0	Attr0
+EndSysregFields
 
-Sysreg	CCSIDR2_EL1	3	1	0	0	2
-Res0	63:24
-Field	23:0	NumSets
+Sysreg	MAIR2_EL1	3	0	10	2	1
+Fields	MAIR2_ELx
+EndSysreg
+
+SysregFields PIRx_ELx
+Field	63:60	Perm15
+Field	59:56	Perm14
+Field	55:52	Perm13
+Field	51:48	Perm12
+Field	47:44	Perm11
+Field	43:40	Perm10
+Field	39:36	Perm9
+Field	35:32	Perm8
+Field	31:28	Perm7
+Field	27:24	Perm6
+Field	23:20	Perm5
+Field	19:16	Perm4
+Field	15:12	Perm3
+Field	11:8	Perm2
+Field	7:4	Perm1
+Field	3:0	Perm0
+EndSysregFields
+
+Sysreg	PIRE0_EL1	3	0	10	2	2
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	PIR_EL1		3	0	10	2	3
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	POR_EL1		3	0	10	2	4
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	S2POR_EL1	3	0	10	2	5
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	AMAIR2_EL1	3	0	10	3	1
+Field	63:0	ImpDef
+EndSysreg
+
+Sysreg	LORSA_EL1	3	0	10	4	0
+Res0	63:52
+Field	51:16	SA
+Res0	15:1
+Field	0	Valid
+EndSysreg
+
+Sysreg	LOREA_EL1	3	0	10	4	1
+Res0	63:52
+Field	51:48	EA_51_48
+Field	47:16	EA_47_16
+Res0	15:0
+EndSysreg
+
+Sysreg	LORN_EL1	3	0	10	4	2
+Res0	63:8
+Field	7:0	Num
+EndSysreg
+
+Sysreg	LORC_EL1	3	0	10	4	3
+Res0	63:10
+Field	9:2	DS
+Res0	1
+Field	0	EN
+EndSysreg
+
+Sysreg	MPAMIDR_EL1	3	0	10	4	4
+Res0	63:62
+Field	61	HAS_SDEFLT
+Field	60	HAS_FORCE_NS
+Field	59	SP4
+Field	58	HAS_TIDR
+Field	57	HAS_ALTSP
+Res0	56:40
+Field	39:32	PMG_MAX
+Res0	31:21
+Field	20:18	VPMR_MAX
+Field	17	HAS_HCR
+Res0	16
+Field	15:0	PARTID_MAX
+EndSysreg
+
+Sysreg	LORID_EL1	3	0	10	4	7
+Res0	63:24
+Field	23:16	LD
+Res0	15:8
+Field	7:0	LR
+EndSysreg
+
+Sysreg	MPAM1_EL1	3	0	10	5	0
+Field	63	MPAMEN
+Res0	62:61
+Field	60 FORCED_NS
+Res0	59:55
+Field	54	ALTSP_FRCD
+Res0	53:48
+Field	47:40	PMG_D
+Field	39:32	PMG_I
+Field	31:16	PARTID_D
+Field	15:0	PARTID_I
+EndSysreg
+
+Sysreg	MPAM0_EL1	3	0	10	5	1
+Res0	63:48
+Field	47:40	PMG_D
+Field	39:32	PMG_I
+Field	31:16	PARTID_D
+Field	15:0	PARTID_I
+EndSysreg
+
+Sysreg	ISR_EL1	3	0	12	1	0
+Res0	63:11
+Field	10	IS
+Field	9	FS
+Field	8	A
+Field	7	I
+Field	6	F
+Res0	5:0
+EndSysreg
+
+Sysreg	ICC_NMIAR1_EL1	3	0	12	9	5
+Res0	63:24
+Field	23:0	INTID
+EndSysreg
+
+SysregFields	CONTEXTIDR_ELx
+Res0	63:32
+Field	31:0	PROCID
+EndSysregFields
+
+Sysreg	CONTEXTIDR_EL1	3	0	13	0	1
+Fields	CONTEXTIDR_ELx
+EndSysreg
+
+Sysreg	RCWSMASK_EL1	3	0	13	0	3
+Field	63:0	RCWSMASK
+EndSysreg
+
+Sysreg	TPIDR_EL1	3	0	13	0	4
+Field	63:0	ThreadID
+EndSysreg
+
+Sysreg	RCWMASK_EL1	3	0	13	0	6
+Field	63:0	RCWMASK
+EndSysreg
+
+Sysreg	SCXTNUM_EL1	3	0	13	0	7
+Field	63:0	SoftwareContextNumber
+EndSysreg
+
+# The bit layout for CCSIDR_EL1 depends on whether FEAT_CCIDX is implemented.
+# The following is for case when FEAT_CCIDX is not implemented.
+Sysreg	CCSIDR_EL1	3	1	0	0	0
+Res0	63:32
+Unkn	31:28
+Field	27:13	NumSets
+Field	12:3	Associativity
+Field	2:0	LineSize
+EndSysreg
+
+Sysreg	CLIDR_EL1	3	1	0	0	1
+Res0	63:47
+Field	46:33	Ttypen
+Field	32:30	ICB
+Field	29:27	LoUU
+Field	26:24	LoC
+Field	23:21	LoUIS
+Field	20:18	Ctype7
+Field	17:15	Ctype6
+Field	14:12	Ctype5
+Field	11:9	Ctype4
+Field	8:6	Ctype3
+Field	5:3	Ctype2
+Field	2:0	Ctype1
+EndSysreg
+
+Sysreg	CCSIDR2_EL1	3	1	0	0	2
+Res0	63:24
+Field	23:0	NumSets
 EndSysreg
 
 Sysreg	GMID_EL1	3	1	0	0	4
@@ -2448,6 +2664,40 @@ UnsignedEnum	2:0	F8S1
 EndEnum
 EndSysreg
 
+Sysreg	PMICNTR_EL0	3	3	9	4	0
+Field	63:0	ICNT
+EndSysreg
+
+Sysreg	PMICFILTR_EL0	3	3	9	6	0
+Res0	63:59
+Field	58	SYNC
+Field	57:56	VS
+Res0	55:32
+Field	31	P
+Field	30	U
+Field	29	NSK
+Field	28	NSU
+Field	27	NSH
+Field	26	M
+Res0	25
+Field	24	SH
+Field	23	T
+Field	22	RLK
+Field	21	RLU
+Field	20	RLH
+Res0	19:16
+Field	15:0	evtCount
+EndSysreg
+
+Sysreg	PMSELR_EL0	3	3	9	12	5
+Res0	63:5
+Field	4:0	SEL
+EndSysreg
+
+Sysreg	POR_EL0		3	3	10	2	4
+Fields	PIRx_ELx
+EndSysreg
+
 SysregFields	HFGxTR_EL2
 Field	63	nAMAIR2_EL1
 Field	62	nMAIR2_EL1
@@ -2625,6 +2875,10 @@ Field	1	ICIALLU
 Field	0	ICIALLUIS
 EndSysreg
 
+Sysreg	ZCR_EL2	3	4	1	2	0
+Fields	ZCR_ELx
+EndSysreg
+
 Sysreg TRFCR_EL2	3	4	1	2	1
 Res0	63:7
 UnsignedEnum	6:5	TS
@@ -2640,18 +2894,114 @@ Field	1	E2TRE
 Field	0	E0HTRE
 EndSysreg
 
+Sysreg	HCRX_EL2	3	4	1	2	2
+Res0	63:25
+Field	24	PACMEn
+Field	23	EnFPM
+Field	22	GCSEn
+Field	21	EnIDCP128
+Field	20	EnSDERR
+Field	19	TMEA
+Field	18	EnSNERR
+Field	17	D128En
+Field	16	PTTWI
+Field	15	SCTLR2En
+Field	14	TCR2En
+Res0	13:12
+Field	11	MSCEn
+Field	10	MCE2
+Field	9	CMOW
+Field	8	VFNMI
+Field	7	VINMI
+Field	6	TALLINT
+Field	5	SMPME
+Field	4	FGTnXS
+Field	3	FnXS
+Field	2	EnASR
+Field	1	EnALS
+Field	0	EnAS0
+EndSysreg
 
-Sysreg HDFGRTR_EL2	3	4	3	1	4
-Field	63	PMBIDR_EL1
-Field	62	nPMSNEVFR_EL1
-Field	61	nBRBDATA
-Field	60	nBRBCTL
-Field	59	nBRBIDR
-Field	58	PMCEIDn_EL0
-Field	57	PMUSERENR_EL0
-Field	56	TRBTRG_EL1
-Field	55	TRBSR_EL1
-Field	54	TRBPTR_EL1
+Sysreg	SMPRIMAP_EL2	3	4	1	2	5
+Field	63:60	P15
+Field	59:56	P14
+Field	55:52	P13
+Field	51:48	P12
+Field	47:44	P11
+Field	43:40	P10
+Field	39:36	F9
+Field	35:32	P8
+Field	31:28	P7
+Field	27:24	P6
+Field	23:20	P5
+Field	19:16	P4
+Field	15:12	P3
+Field	11:8	P2
+Field	7:4	P1
+Field	3:0	P0
+EndSysreg
+
+Sysreg	SMCR_EL2	3	4	1	2	6
+Fields	SMCR_ELx
+EndSysreg
+
+Sysreg	TCR2_EL2	3	4	2	0	3
+Res0	63:16
+Field	15	DisCH1
+Field	14	DisCH0
+Field	13	AMEC1
+Field	12	AMEC0
+Field	11	HAFT
+Field	10	PTTWI
+Res0	9:6
+Field	5	D128
+Field	4	AIE
+Field	3	POE
+Field	2	E0POE
+Field	1	PIE
+Field	0	PnCH
+EndSysreg
+
+Sysreg	GCSCR_EL2	3	4	2	5	0
+Fields	GCSCR_ELx
+EndSysreg
+
+Sysreg	GCSPR_EL2	3	4	2	5	1
+Fields	GCSPR_ELx
+EndSysreg
+
+Sysreg	DACR32_EL2	3	4	3	0	0
+Res0	63:32
+Field	31:30	D15
+Field	29:28	D14
+Field	27:26	D13
+Field	25:24	D12
+Field	23:22	D11
+Field	21:20	D10
+Field	19:18	D9
+Field	17:16	D8
+Field	15:14	D7
+Field	13:12	D6
+Field	11:10	D5
+Field	9:8	D4
+Field	7:6	D3
+Field	5:4	D2
+Field	3:2	D1
+Field	1:0	D0
+EndSysreg
+
+
+Sysreg HDFGRTR_EL2	3	4	3	1	4
+Field	63	PMBIDR_EL1
+Field	62	nPMSNEVFR_EL1
+Field	61	nBRBDATA
+Field	60	nBRBCTL
+Field	59	nBRBIDR
+Field	58	PMCEIDn_EL0
+Field	57	PMUSERENR_EL0
+Field	56	TRBTRG_EL1
+Field	55	TRBSR_EL1
+Field	54	TRBPTR_EL1
 Field	53	TRBMAR_EL1
 Field	52	TRBLIMITR_EL1
 Field	51	TRBIDR_EL1
@@ -2813,89 +3163,6 @@ Field	1	AMEVCNTR00_EL0
 Field	0	AMCNTEN0
 EndSysreg
 
-Sysreg	ZCR_EL2	3	4	1	2	0
-Fields	ZCR_ELx
-EndSysreg
-
-Sysreg	HCRX_EL2	3	4	1	2	2
-Res0	63:25
-Field	24	PACMEn
-Field	23	EnFPM
-Field	22	GCSEn
-Field	21	EnIDCP128
-Field	20	EnSDERR
-Field	19	TMEA
-Field	18	EnSNERR
-Field	17	D128En
-Field	16	PTTWI
-Field	15	SCTLR2En
-Field	14	TCR2En
-Res0	13:12
-Field	11	MSCEn
-Field	10	MCE2
-Field	9	CMOW
-Field	8	VFNMI
-Field	7	VINMI
-Field	6	TALLINT
-Field	5	SMPME
-Field	4	FGTnXS
-Field	3	FnXS
-Field	2	EnASR
-Field	1	EnALS
-Field	0	EnAS0
-EndSysreg
-
-Sysreg	SMPRIMAP_EL2	3	4	1	2	5
-Field	63:60	P15
-Field	59:56	P14
-Field	55:52	P13
-Field	51:48	P12
-Field	47:44	P11
-Field	43:40	P10
-Field	39:36	F9
-Field	35:32	P8
-Field	31:28	P7
-Field	27:24	P6
-Field	23:20	P5
-Field	19:16	P4
-Field	15:12	P3
-Field	11:8	P2
-Field	7:4	P1
-Field	3:0	P0
-EndSysreg
-
-Sysreg	SMCR_EL2	3	4	1	2	6
-Fields	SMCR_ELx
-EndSysreg
-
-Sysreg	GCSCR_EL2	3	4	2	5	0
-Fields	GCSCR_ELx
-EndSysreg
-
-Sysreg	GCSPR_EL2	3	4	2	5	1
-Fields	GCSPR_ELx
-EndSysreg
-
-Sysreg	DACR32_EL2	3	4	3	0	0
-Res0	63:32
-Field	31:30	D15
-Field	29:28	D14
-Field	27:26	D13
-Field	25:24	D12
-Field	23:22	D11
-Field	21:20	D10
-Field	19:18	D9
-Field	17:16	D8
-Field	15:14	D7
-Field	13:12	D6
-Field	11:10	D5
-Field	9:8	D4
-Field	7:6	D3
-Field	5:4	D2
-Field	3:2	D1
-Field	1:0	D0
-EndSysreg
-
 Sysreg	FAR_EL2	3	4	6	0	0
 Field	63:0	ADDR
 EndSysreg
@@ -2915,6 +3182,30 @@ Field	1	E2SPE
 Field	0	E0HSPE
 EndSysreg
 
+Sysreg	MAIR2_EL2	3	4	10	1	1
+Fields	MAIR2_ELx
+EndSysreg
+
+Sysreg	PIRE0_EL2	3	4	10	2	2
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	PIR_EL2		3	4	10	2	3
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	POR_EL2		3	4	10	2	4
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	S2PIR_EL2	3	4	10	2	5
+Fields	PIRx_ELx
+EndSysreg
+
+Sysreg	AMAIR2_EL2	3	4	10	3	1
+Field	63:0	ImpDef
+EndSysreg
+
 Sysreg	MPAMHCR_EL2	3	4	10	4	0
 Res0	63:32
 Field	31	TRAP_MPAMIDR_EL1
@@ -3059,6 +3350,10 @@ Sysreg	SMCR_EL12	3	5	1	2	6
 Mapping	SMCR_EL1
 EndSysreg
 
+Sysreg	TCR2_EL12	3	5	2	0	3
+Mapping	TCR2_EL1
+EndSysreg
+
 Sysreg	GCSCR_EL12	3	5	2	5	0
 Mapping	GCSCR_EL1
 EndSysreg
@@ -3071,317 +3366,22 @@ Sysreg	FAR_EL12	3	5	6	0	0
 Field	63:0	ADDR
 EndSysreg
 
-Sysreg	MPAM1_EL12	3	5	10	5	0
-Fields	MPAM1_ELx
-EndSysreg
-
-Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
-Mapping	CONTEXTIDR_EL1
-EndSysreg
-
-SysregFields TTBRx_EL1
-Field	63:48	ASID
-Field	47:1	BADDR
-Field	0	CnP
-EndSysregFields
-
-Sysreg	TTBR0_EL1	3	0	2	0	0
-Fields	TTBRx_EL1
-EndSysreg
-
-Sysreg	TTBR1_EL1	3	0	2	0	1
-Fields	TTBRx_EL1
-EndSysreg
-
-Sysreg	TCR2_EL1	3	0	2	0	3
-Res0	63:16
-Field	15	DisCH1
-Field	14	DisCH0
-Res0	13:12
-Field	11	HAFT
-Field	10	PTTWI
-Res0	9:6
-Field	5	D128
-Field	4	AIE
-Field	3	POE
-Field	2	E0POE
-Field	1	PIE
-Field	0	PnCH
-EndSysreg
-
-Sysreg	TCR2_EL12	3	5	2	0	3
-Mapping	TCR2_EL1
-EndSysreg
-
-Sysreg	TCR2_EL2	3	4	2	0	3
-Res0	63:16
-Field	15	DisCH1
-Field	14	DisCH0
-Field	13	AMEC1
-Field	12	AMEC0
-Field	11	HAFT
-Field	10	PTTWI
-Res0	9:6
-Field	5	D128
-Field	4	AIE
-Field	3	POE
-Field	2	E0POE
-Field	1	PIE
-Field	0	PnCH
-EndSysreg
-
-SysregFields MAIR2_ELx
-Field	63:56	Attr7
-Field	55:48	Attr6
-Field	47:40	Attr5
-Field	39:32	Attr4
-Field	31:24	Attr3
-Field	23:16	Attr2
-Field	15:8	Attr1
-Field	7:0	Attr0
-EndSysregFields
-
-Sysreg	MAIR2_EL1	3	0	10	2	1
-Fields	MAIR2_ELx
-EndSysreg
-
-Sysreg	MAIR2_EL2	3	4	10	1	1
-Fields	MAIR2_ELx
-EndSysreg
-
-Sysreg	AMAIR2_EL1	3	0	10	3	1
-Field	63:0	ImpDef
-EndSysreg
-
-Sysreg	AMAIR2_EL2	3	4	10	3	1
-Field	63:0	ImpDef
-EndSysreg
-
-SysregFields PIRx_ELx
-Field	63:60	Perm15
-Field	59:56	Perm14
-Field	55:52	Perm13
-Field	51:48	Perm12
-Field	47:44	Perm11
-Field	43:40	Perm10
-Field	39:36	Perm9
-Field	35:32	Perm8
-Field	31:28	Perm7
-Field	27:24	Perm6
-Field	23:20	Perm5
-Field	19:16	Perm4
-Field	15:12	Perm3
-Field	11:8	Perm2
-Field	7:4	Perm1
-Field	3:0	Perm0
-EndSysregFields
-
-Sysreg	PIRE0_EL1	3	0	10	2	2
-Fields	PIRx_ELx
-EndSysreg
-
 Sysreg	PIRE0_EL12	3	5	10	2	2
 Mapping	PIRE0_EL1
 EndSysreg
 
-Sysreg	PIRE0_EL2	3	4	10	2	2
-Fields	PIRx_ELx
-EndSysreg
-
-Sysreg	PIR_EL1		3	0	10	2	3
-Fields	PIRx_ELx
-EndSysreg
-
 Sysreg	PIR_EL12	3	5	10	2	3
 Mapping	PIR_EL1
 EndSysreg
 
-Sysreg	PIR_EL2		3	4	10	2	3
-Fields	PIRx_ELx
-EndSysreg
-
-Sysreg	POR_EL0		3	3	10	2	4
-Fields	PIRx_ELx
-EndSysreg
-
-Sysreg	POR_EL1		3	0	10	2	4
-Fields	PIRx_ELx
-EndSysreg
-
-Sysreg	POR_EL2		3	4	10	2	4
-Fields	PIRx_ELx
-EndSysreg
-
 Sysreg	POR_EL12	3	5	10	2	4
 Mapping	POR_EL1
 EndSysreg
 
-Sysreg	S2POR_EL1	3	0	10	2	5
-Fields	PIRx_ELx
-EndSysreg
-
-Sysreg	S2PIR_EL2	3	4	10	2	5
-Fields	PIRx_ELx
-EndSysreg
-
-Sysreg	LORSA_EL1	3	0	10	4	0
-Res0	63:52
-Field	51:16	SA
-Res0	15:1
-Field	0	Valid
-EndSysreg
-
-Sysreg	LOREA_EL1	3	0	10	4	1
-Res0	63:52
-Field	51:48	EA_51_48
-Field	47:16	EA_47_16
-Res0	15:0
-EndSysreg
-
-Sysreg	LORN_EL1	3	0	10	4	2
-Res0	63:8
-Field	7:0	Num
-EndSysreg
-
-Sysreg	LORC_EL1	3	0	10	4	3
-Res0	63:10
-Field	9:2	DS
-Res0	1
-Field	0	EN
-EndSysreg
-
-Sysreg	MPAMIDR_EL1	3	0	10	4	4
-Res0	63:62
-Field	61	HAS_SDEFLT
-Field	60	HAS_FORCE_NS
-Field	59	SP4
-Field	58	HAS_TIDR
-Field	57	HAS_ALTSP
-Res0	56:40
-Field	39:32	PMG_MAX
-Res0	31:21
-Field	20:18	VPMR_MAX
-Field	17	HAS_HCR
-Res0	16
-Field	15:0	PARTID_MAX
-EndSysreg
-
-Sysreg	LORID_EL1	3	0	10	4	7
-Res0	63:24
-Field	23:16	LD
-Res0	15:8
-Field	7:0	LR
-EndSysreg
-
-Sysreg	MPAM1_EL1	3	0	10	5	0
-Field	63	MPAMEN
-Res0	62:61
-Field	60 FORCED_NS
-Res0	59:55
-Field	54	ALTSP_FRCD
-Res0	53:48
-Field	47:40	PMG_D
-Field	39:32	PMG_I
-Field	31:16	PARTID_D
-Field	15:0	PARTID_I
-EndSysreg
-
-Sysreg	MPAM0_EL1	3	0	10	5	1
-Res0	63:48
-Field	47:40	PMG_D
-Field	39:32	PMG_I
-Field	31:16	PARTID_D
-Field	15:0	PARTID_I
-EndSysreg
-
-Sysreg	ISR_EL1	3	0	12	1	0
-Res0	63:11
-Field	10	IS
-Field	9	FS
-Field	8	A
-Field	7	I
-Field	6	F
-Res0	5:0
-EndSysreg
-
-Sysreg	ICC_NMIAR1_EL1	3	0	12	9	5
-Res0	63:24
-Field	23:0	INTID
-EndSysreg
-
-Sysreg	TRBLIMITR_EL1	3	0	9	11	0
-Field	63:12	LIMIT
-Res0	11:7
-Field	6	XE
-Field	5	nVM
-Enum	4:3	TM
-	0b00	STOP
-	0b01	IRQ
-	0b11	IGNR
-EndEnum
-Enum	2:1	FM
-	0b00	FILL
-	0b01	WRAP
-	0b11	CBUF
-EndEnum
-Field	0	E
-EndSysreg
-
-Sysreg	TRBPTR_EL1	3	0	9	11	1
-Field	63:0	PTR
-EndSysreg
-
-Sysreg	TRBBASER_EL1	3	0	9	11	2
-Field	63:12	BASE
-Res0	11:0
-EndSysreg
-
-Sysreg	TRBSR_EL1	3	0	9	11	3
-Res0	63:56
-Field	55:32	MSS2
-Field	31:26	EC
-Res0	25:24
-Field	23	DAT
-Field	22	IRQ
-Field	21	TRG
-Field	20	WRAP
-Res0	19
-Field	18	EA
-Field	17	S
-Res0	16
-Field	15:0	MSS
-EndSysreg
-
-Sysreg	TRBMAR_EL1	3	0	9	11	4
-Res0	63:12
-Enum	11:10	PAS
-	0b00	SECURE
-	0b01	NON_SECURE
-	0b10	ROOT
-	0b11	REALM
-EndEnum
-Enum	9:8	SH
-	0b00	NON_SHAREABLE
-	0b10	OUTER_SHAREABLE
-	0b11	INNER_SHAREABLE
-EndEnum
-Field	7:0	Attr
-EndSysreg
-
-Sysreg	TRBTRG_EL1	3	0	9	11	6
-Res0	63:32
-Field	31:0	TRG
+Sysreg	MPAM1_EL12	3	5	10	5	0
+Fields	MPAM1_ELx
 EndSysreg
 
-Sysreg	TRBIDR_EL1	3	0	9	11	7
-Res0	63:12
-Enum	11:8	EA
-	0b0000	NON_DESC
-	0b0001	IGNORE
-	0b0010	SERROR
-EndEnum
-Res0	7:6
-Field	5	F
-Field	4	P
-Field	3:0	Align
+Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
+Mapping	CONTEXTIDR_EL1
 EndSysreg
-- 
2.34.1


