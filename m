Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp+Ban9UqcPtxcekhEzEgx0H42XNY1XoD8n/tlKqBKQ=; b=WTbPcTQPCrLXInQrq3Z2NitcK6
	IYOQ41fx/mxheVyGb2ztCmwvOooQeS18FCrEc5+v5QaZ26rXOOal5ejBtdtKDHGBHqGIALLSnuGJg
	3rJ6YMvdaSRsbogsXhAKVRs5mhpd+gS8PSRBfLRc3A3xlGbo7MaZJ5u36CbaWZTRoeXucctVuxyrf
	0DIA7mMFbT0e6DesUMB2ElRNn/kt0yM830uPmt/+LS1sUiIBn6ADCRwXSYQKh7n0XAL7v2hEjcDie
	aBMyrR/yUwGsC5swc348F6iIIrqy2ZMoJhnfolA0igu5haoYoRPLzwfCrzQUAC5XHdClbB6WdnoYs
	d//wZRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq6F-0000000A40b-2dXe;
	Tue, 14 Jan 2025 23:13:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprs-0000000A01v-3akw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 22:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Zp+Ban9UqcPtxcekhEzEgx0H42XNY1XoD8n/tlKqBKQ=; b=dwGNdXuksCdEm/dEAfbgi4L+OA
	pBVG6McEwZKFOvE6fcRcINy9ga4CafGoAkJCIhGwZ723sesnb/mDeDvrVy3ZgBZfQDnyxsaSqKNGE
	czuVguhF3eAHuS7R8/31ypra4I4nm16EuCQZtnqm5YLvLrE3iKw5GTWvau5RGwJw/KdH6nkrtokoY
	lS2c4E7oaSegL/Q1rnTRM+EmloAuu9QCwXBVxWIy5ZzOgH8lIMUUUe9I4yO6ZOl3Bvi6INfwm5X8S
	3HPuyJXjjoDhd2hqWBzHH7Ngf92GOjfj6IYZL8BMR4b5exH6BkLoN8liuuxj3guTn5ncLKF4C2oSF
	/XvT5pCg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprl-0000000Afph-09oB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2166f1e589cso129911155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895511; x=1737500311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp+Ban9UqcPtxcekhEzEgx0H42XNY1XoD8n/tlKqBKQ=;
        b=MWjMAqs597lTfa866kir08rNQRJggDW9ayz98Q+PO9Bnei/iiUeheatDCY9DWRO9IZ
         NYplY+0NT4f3cWYLiU86mQpoELl0/PWnBJai+7pxWVr45XGIKwbCWE0QAhtssk0C/ZbZ
         kuc6otg73HuWnko6hpPvmBjFP39ErXqKGecezD7EWYOfWz7t0yDbdXEftfxHmTpBe9ch
         Wm5FgM/yf0cio2clsSBJPxcvLAlRYyT84+bSbaSWdczAyl5913P4XC2MBYvBTVH/3mwp
         iknL8ZOoa41rzhCTf3AD4lAQZMteIuqYKgKsW6Mbm1UaTCnzYS00RVJxPpqQuV7B+4ne
         /pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895511; x=1737500311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp+Ban9UqcPtxcekhEzEgx0H42XNY1XoD8n/tlKqBKQ=;
        b=w+Rat4eRlez1ww2+K6BgvbsBrA5iwq7xSmCxyweXFMczTKsJy4VdwVThgGFuX3SmpL
         0rsJMebdE8h33HN1wUw75v6f8cOqv57qqaR4fHOvZT+KdU/M2DDVmuJbTk3VRgjtjpBo
         r3aZVR1ZrRQWGIIAU6ORvLMMbdKMAxkzmrW7yqdU+miX49Wo9++VHx6V6m1c8sYxa1Vu
         bnBy4FqRBLiTOBSBLh4JGNMbREgK2tEz+k36WPRRLkkEmN1dk//MDN1WZ0Yyj2Ekwbr8
         ygsvFkWhuF91IxAlSKJlMeTBLS7RILubGpd9/ZuItPcIoKdE1UQfTV40z4vvhonrkje7
         ewOA==
X-Forwarded-Encrypted: i=1; AJvYcCW0KsNBKGQmi/0Vg5RxUef1AAaKRoVzDnvAemKWCl2vrLOUMGJyEQZqLIyxrqSoVDZVo1iAAYeS1uxyIfXeke2H@lists.infradead.org
X-Gm-Message-State: AOJu0YxKBR2QRiPCqaKSuzn54igpxQGDx5Ul1B+2a/VR6/TH1NmCcKYF
	5QlXsOElT62KNN8MyCKD25p/qp0/Bbtg2FwPpPCiREAjNX/FZGxsnswKL2reQJ4=
X-Gm-Gg: ASbGncujk5LOjIPCOqLfuilyKqjJMh5F8S8hKfWIZqn8BR17QPfmIgRmIMbQtRYJ7ad
	MHUI2PwIcjK0Zmy7048D3BFDFBO1jl5NbTF4Lqvhse2SwZMAlpVDqfZYn45WcGZm4fL7ghcVtd1
	aeUgfUWLBQ3yVrHTaIYC9vhNRZBtkFtPi41Ye1DdxlOWc8jZzxw0QBZRATCd8sl1era0a38FZPM
	QBi+s8TRV+DnATP468+wwzbamTHHgW86rVXwO+Rvj+0wNPcoPLMNtrGLKfE6jH5A+/rgw==
X-Google-Smtp-Source: AGHT+IFw2aOxa/RiLQrRWKk2z3D3w1uFmOOWORKNifbT2/MJ7FdclBZ5ykBjK1s8a/t6cnrYBG/h2Q==
X-Received: by 2002:a17:902:fc8f:b0:216:48dd:d15c with SMTP id d9443c01a7336-21a83f65a79mr399235235ad.27.1736895511537;
        Tue, 14 Jan 2025 14:58:31 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:33 -0800
Subject: [PATCH v2 08/21] dt-bindings: riscv: add Ssccfg ISA extension
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-counter_delegation-v2-8-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_225837_665755_52D8D61B 
X-CRM114-Status: GOOD (  12.39  )
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

Add description for the Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 0cfdaa4552a6..c8685fb1fb42 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,13 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+	- const: smcdeleg
+	  description: |
+	    The standard Smcdeleg supervisor-level extension for the machine mode
+	    to delegate the hpmcounters to supvervisor mode so that they are
+	    directlyi accessible in the supervisor mode. This extension depend
+	    on Sscsrind, Zihpm, Zicntr extensions.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -166,6 +173,12 @@ properties:
             interrupt architecture for supervisor-mode-visible csr and
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
+	- const: ssccfg
+	  description: |
+	    The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode. This extension depend on Sscsrind, Smcdeleg, Zihpm, Zicntr
+            extensions.
 
         - const: sscofpmf
           description: |

-- 
2.34.1


