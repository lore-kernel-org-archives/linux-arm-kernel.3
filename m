Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86FFC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=; b=T3dIM0s23viOtPCpyQj+ZHTsjU
	mayGfY2EPO8hKCPAFPq4HwGE9T+IjatS3gAE4VnSO3rpmax8cuhXLM88OeIV3iCxueRSkwTq4mWK4
	0Ml+5cALXcbAwfXTGjxw076xkL2aZmw4Wkd2YvFlkSmoWbbEeVXZ11Fp0FianHtdlIlYhrBilxHz8
	rgI7Zg2Eg/DaGaXXbaRMIrWpvnzvBgiOAzCUv0GxqeGHpP7Nbw7AkQIWlk9s9r840XuSr0L0FMpTq
	yypDODR5CqpOg/e850sw39/DpXGHjl8fI3HZjoCa8AU2I9/mLmXg+mJZ02sErTFFVS7Fi9WIablZO
	9CrpP/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCQ-00000004DjD-3LW8;
	Tue, 28 Jan 2025 06:35:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdi2-000000044rf-2eFV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f441904a42so9161443a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 21:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040422; x=1738645222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=Fd6RRH35xTMwRghRyCqklr2bdaACnJ+g0/XiolIzCe6XGySH1WGWS+MRF0AXmBm+v2
         CdDbOxBC7cSQGR28Kdf7UUJl2EUibpmXrmKdtBGJo3VMmk/tD2vuoafDQgMf9o8amQym
         3Ul2NFm3pp7LwMHelpmpXRipEbl6ooQabjlPOda7EhYvDVEIIG24Y1ZI8Sfh8oNyAW3x
         dGXZamyuzRafbw8+xA0q+k2F3V+HPFJHexfAdGfk0lK1P5Uzjj89T+9O65rBHJNKy1Lf
         wSD1xrZwr3mnlEghY2Hw2Mu+ikU/wwdqFw5DaAkiOOJd3UnL0EN5+cn77MMTMtfgJVaV
         cg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040422; x=1738645222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=N9TQ0ZPBDOu3hyHaq9o9kvW/ss6rnxD007PDgLQGrkVqmtYZM6qlHKMCa9imm1DlLJ
         wSDF5o36Ku9og4ILDI/iBQ/umk1l1U84/IwLoCAXrCVTb8EqyATmvOEjAEJKkB3aonB3
         3xCPvQnbN6A97iu9Wcu1vx/onBQuO/jkcPpW6xf7EfLkNjCfbhyUb/nDlJ8tyCM6tbbf
         Ny9MCC6bn9h6YkMQiynWkPe/8PcIMSYDimDBJHL7WctCX1yLEYFnEEyeZpybIVIuUQzb
         UNkqKwXGelUANyhsHTlmN13qpHvimgVsbz560hYZD786dgxbh2r4KNsCF07Rg4J1KW4o
         g9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/HUX7GV9L15P7J51z04RNVIf9x7/3vCd1iDnD/mNWb0hp5vj+L/pOyPeiN5itXArmzVAdp53whZEGEXTbbGO/@lists.infradead.org
X-Gm-Message-State: AOJu0YzfeCElWJh7b0A9SFNgjhqBAlllwNejbcSj6SONlvSgCa5UMGXZ
	3K9V1yfH0Kd5qXmjgtibwU8Ko0zAjWQW0laHEVC1DgRLx9mm93g8d1MheermE94=
X-Gm-Gg: ASbGncunRK2yeFWoexnG2WH0i3v32Poj4D5tWaCQNZcCzEjicRotAXvbkPLTk+q2qER
	jXZHU2+0QGaGI0JaqP23fSVYL5AMd1qXVGYQKM1r7n53iFKUNpnkXP63Zci9VEFX5WyaavbQoaa
	QrBvsUWMBT+8BH0jlvL4Z/L8Q6oeEFzHD+skp2rBHnIyojzvXh1GPS/unWd6xMCIDZRaPeLxKmy
	KFJn2VW4/ywASXVNJMN9EWF7S6pckTyb2ZbFHIz1XoTFTsrrVSF0StLb0UtMZmQJNk5Zo+FW5qR
	4h+/fM2eQHFxPJW7SUblkE94koX5
X-Google-Smtp-Source: AGHT+IELryn7Li8G6uRsK1ux9a/8YArLklBlMT1VjVPaGUmGZLNmSMTAlEJHZzc25zLYxiYqH+BJ4A==
X-Received: by 2002:a17:90b:1f8a:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2f782c94b50mr63592948a91.13.1738040422123;
        Mon, 27 Jan 2025 21:00:22 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 21:00:01 -0800
Subject: [PATCH v3 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-counter_delegation-v3-20-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210022_693734_797A8A58 
X-CRM114-Status: GOOD (  13.87  )
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

RISC-V doesn't have any standard event to counter mapping discovery
mechanism in the ISA. The ISA defines 29 programmable counters and
platforms can choose to implement any number of them and map any
events to any counters. Thus, the perf tool need to inform the driver
about the counter mapping of each events.

The current perf infrastructure only parses the 'Counter' constraints
in metrics. This patch extends that to pass in the pmu events so that
any driver can retrieve those values via perf attributes if defined
accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 28acd598dd7c..c21945238469 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -274,6 +274,11 @@ class JsonEvent:
         return fixed[name.lower()]
       return event
 
+    def counter_list_to_bitmask(counterlist):
+      counter_ids = list(map(int, counterlist.split(',')))
+      bitmask = sum(1 << pos for pos in counter_ids)
+      return bitmask
+
     def unit_to_pmu(unit: str) -> Optional[str]:
       """Convert a JSON Unit to Linux PMU name."""
       if not unit or unit == "core":
@@ -427,6 +432,10 @@ class JsonEvent:
       else:
         raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
 
+    if self.counters['list']:
+      bitmask = counter_list_to_bitmask(self.counters['list'])
+      event += f',counterid_mask={bitmask:#x}'
+
     self.event = real_event(self.name, event)
 
   def __repr__(self) -> str:

-- 
2.34.1


