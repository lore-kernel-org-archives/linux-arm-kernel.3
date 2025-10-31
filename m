Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B545CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hrqrHmQlBw4QJPx8h9w/0Rntf7sgvlCyYtGGSssQKQ=; b=zojMmcTT2eMFn+nc1UViM4gtHk
	h/FqLXc/rzVr7VddkVeNXpf85ldGCjI8Tpd1u/z7+SETaRMMoj/pFg4/FY0rU7MICXa2IIoTxWGug
	c+S1VJgpwxgZmkhrgStSyInhpfmkPpqPOo7zplkNxdcls99o1SBXGPYZ9GWs+rxcWUmiYlW0dH5dQ
	bdY8EpCXNyzFMwP79MWpMHTD+OgoUUtOa5nBQaVl/SsJwmv8L6i9INTsXdL+Q9ICbQdmzLLptNdQa
	5fuZHuzQmdpMIv55bFfQ1GtSUmCFlucIH1y5ZGawfsKEvrPJBYeJJcIe/3v37q5+VCr4a9iUJf28r
	Fdrj1r+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkhh-00000005fsF-14HB;
	Fri, 31 Oct 2025 08:41:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkhc-00000005frJ-3DOa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:41:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-295351ad2f5so228465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761900104; x=1762504904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hrqrHmQlBw4QJPx8h9w/0Rntf7sgvlCyYtGGSssQKQ=;
        b=TZezgYUzusrCHfaJGdMr0OXLdbRn1CdSZXCfW59o6QagqBvKGLpeWaiMOTXpYDkQAQ
         AxdzfU+ULYCm9TXooQLiYiNeRX+tn6tPHo0qONH0pTC90lIi3m6xgQB1tjknCSZpB+1s
         30mzUpq1WHZpVxCxUgY8UFOWXTkiGW9VYEebjAOpoXPuiiXVvTJ8i+uOfWzhFzFj61uD
         w8C/ZkfmuA9hKsy21Prc+KQTQu0lfKnhTis+AVBztS+sJVYr+YkTExkbvxtzxm9iErnI
         wcUieGcJUbXWAfyJS8nW+zDKBLj+lQQ1rQZ2tPbJ9XAD6IMLJhgXRuChHB+WnLvRLETF
         av8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900104; x=1762504904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hrqrHmQlBw4QJPx8h9w/0Rntf7sgvlCyYtGGSssQKQ=;
        b=j+0A1zxoclavx27LzB1lX9hL6dnDq7r88pAA6dUsJQTt+59mSKvamPNcXXMRP295/5
         LVdZD/c8ZlMte3t0JYqdrf0sHYydkuokYxr/R5nWjDaqnI2+wACEmiZOxSEA3onpGfCW
         S2Ff8w102pv+esgOF66A9smkZlcMgJok7Z8HN4e+PKaZEgRNvX/1Bpta8Kk4fHq71e3/
         3MB46oqKr/wL76CXgWuy0lcme2KK0xsyM8GQX538EJLm41DmNkR/YHCR6Oqu8HFwi+xC
         7GgI/UYlolT+n8GC+qxACGjv1XhOxAEOTPIFPwjB14Qpb11kZ8QEppHzj/JmSEF5NrR9
         8qSg==
X-Forwarded-Encrypted: i=1; AJvYcCW8NCZqqC9BAfqRW6Xdbzv9BexqoqCmSQX6eXyhVTPXP8B1C10Y7QOmZvID0BgrqA8sU1ixPt6f0ijshhDRZRRs@lists.infradead.org
X-Gm-Message-State: AOJu0YxHzLeEeWqxYMLIAO0iwHndxVGGjBE2F5U2nohU9okTTdxYrhQy
	SlM3EcVdwiysdpmEXbhYOsEB/U4PaFXpbsF8LgcibcYoeOOHBU8NKDvnN3X/Yk4cnw==
X-Gm-Gg: ASbGncvqUS61GCMUcCFa33P3dqwXOOn582JXJwYPNQWxLH33lej/MiDyZw0SmYQyNo2
	9pvXh11MlXV72VGqWmiA26JD0FD32JercBLqXqhqpT+LWlzIdXwxZEU2GYgzAb8U95Ak43jDqJp
	Yus1MhWWiLUHRv07SbOnGBAHB1K2pdwslKt2xwpJzSSruORclN/MjYzBEQn54/u0Rp8CfBRDLbx
	+xgcyfj+/OmcO2siAddHxKYYpyeXgHsHiqUzrVPbNqJKt68oABWhZ6FRlrxbsL4xYuko9/l+htl
	czhAIhrj9z0kHfgoh+7rBFOCwdgVFaoleyHeIuwpgZQ7asNbyJFjK9rKObCvowQ/E4v9fgXUmZL
	XngVugZEgEp575tNTnf74dvXn33syvRHw9lBes/p/Ov/gn6ahIS0VwJGrWFfR6FikuIUpY5+/mh
	/iMVjgW6kHOO31fHyI/DBVq6S8zxncQ11npJJl1yAy29iT1rQ=
X-Google-Smtp-Source: AGHT+IHV+akqMcvywb+3Zt1mSlS+9NiogDpHMm8+bQv2d+CTnogKsWMGLQBpDjl5fxPEL0XtSkMFeA==
X-Received: by 2002:a17:902:c412:b0:264:cda8:7fd3 with SMTP id d9443c01a7336-2951a46d112mr24811375ad.6.1761900103678;
        Fri, 31 Oct 2025 01:41:43 -0700 (PDT)
Received: from adriana-dmi-upstream.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c9dbsm15333505ad.84.2025.10.31.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 01:41:43 -0700 (PDT)
From: adriana <adriana@arista.com>
To: ilias.apalodimas@linaro.org,
	ardb@kernel.org,
	trini@konsulko.com
Cc: robh@kernel.org,
	krzk@kernel.org,
	jdelvare@suse.com,
	frowand.list@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	vasilykh@arista.com,
	arm.ebbr-discuss@arm.com,
	boot-architecture@lists.linaro.org,
	linux-efi@vger.kernel.org,
	uefi-discuss@lists.uefi.org,
	linux-arm-kernel@lists.infradead.org,
	Adriana Nicolae <adriana@arista.com>
Subject: [PATCH v3 1/2] dt-bindings: firmware: Add binding for SMBIOS /chosen properties
Date: Fri, 31 Oct 2025 01:41:00 -0700
Message-ID: <20251031084101.701159-2-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031084101.701159-1-adriana@arista.com>
References: <20251022114527.618908-1-adriana@arista.com>
 <20251031084101.701159-1-adriana@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_014144_846962_794A7763 
X-CRM114-Status: GOOD (  13.07  )
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

From: Adriana Nicolae <adriana@arista.com>

Signed-off-by: Adriana Nicolae <adriana@arista.com>
---
 .../bindings/firmware/linux,smbios-table.yaml | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml

diff --git a/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml b/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
new file mode 100644
index 000000000000..b78d8ec6025f
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 Arista Networks
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/linux,smbios-table.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Memory location for SMBIOS table 
+
+description: |
+  This property is used in the /chosen node to pass the physical address
+  of SMBIOS (System Management BIOS) or DMI (Desktop Management Interface)
+  tables from firmware to the kernel. This is typically used on non-EFI
+  platforms like ARM/ARM64.
+  
+maintainers:
+  - Adriana Nicolae <adriana@arista.com>
+  - Rob Herring <robh+dt@kernel.org>
+
+properties:
+  linux,smbios3-table:
+    $ref: /schemas/types.yaml#/definitions/uint64
+    description:
+      The 64-bit physical address of the SMBIOSv3 entry point structure.
+
+additionalProperties: true
-- 
2.51.0


