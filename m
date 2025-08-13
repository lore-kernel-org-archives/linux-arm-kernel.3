Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AAACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBQsfHg/ZyhTgkDWvIhH6lJQIV/CSzF6SBf+6h9QT90=; b=wj3J33lGRFqLvdl+MwD3d12sMh
	e+cTWoAmeRNwRIRzNZiPoz0GlgLqL+V1NmarySsOMj8K7gM3LFoG7z2i852LctUWv3pJwbC3K24my
	hGTwbQyvIcWu4Rh19tI7/t7kTxIariGTTkJXV32PYbUZ1siUOYC6DLkEKgHkvTQ6sP1fUWEAnFFA8
	KFMkSmhg2YP14n6mrCP4qLkWjKUrLbOcpcAIHHJmhgxrDJ34SHhLoM5dEQXMjMXax/Mp+1F6b6fH/
	mNum+XUvjvzYzO6PZnsHCyC4iwpL8OGcfvGR/qegKdRj0QtJLZIpp91FBA68oCqW+6to9xQzFBufr
	QhQrOjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrB-0000000EeVg-0jYD;
	Wed, 13 Aug 2025 18:05:49 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEb9-0000000ESl0-3QbQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:45:13 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b9dc566cb4so11639f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755103509; x=1755708309; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBQsfHg/ZyhTgkDWvIhH6lJQIV/CSzF6SBf+6h9QT90=;
        b=CC8/o+MXqhvFtnD93Ft1Frdt4xwAeDyYGG/qt0PSNGwpNe8je+wU81fEX7WEDKWxM/
         3M7+OV7jBPpnDaq44tTLUa42tvwZYYQer77Js1rTcETWy4QRPzq2RotopxjNVLmA1WVv
         Zern4C7A7mviHxPJgzQtcPYh7CnQh6tdeaQG9oU9w73ok3eF8TdC8jejssqWWF9gRwKD
         PLvAhjWxNetEHLqflikCVVI+u4KFN4mCnx0tHQHxxlm+TlvfukFvnXceK1uvAKzp0MVs
         3v+PKOXjoxMk5eddKcaa2FJ50fsvseBgL1UoK7/v9UJU706Ys+D4yUgLpPmwDvO/YuDQ
         Soxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755103509; x=1755708309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GBQsfHg/ZyhTgkDWvIhH6lJQIV/CSzF6SBf+6h9QT90=;
        b=XGD8VRwmJ8BFzO0G4sLBNt9WxwoM/+q5hCFmAcZL8qGuoqfAqD23n76v89S4+OtSfE
         NC3MllUNHDmOhcAmbx1/BIjze5MgQHDQ3nfpQ6cWZI5jxN7wrRXGdPDXZ+IGkPO3XMcO
         Hubu3vJtv9xLKgNS3qfdqeIbx0FH8o92CU7G9AFNWYCJEpCrEwd4jPY/zqMy5lcMkdSm
         mta2RhzZ1dKvZl6EMKMigtOLqGNKj48mXYACUNi5uksK6C8AjXB/7Id/TdaPzRlyk6w7
         nAfpCk3FJCQVYmjwr8RwnZhe2K5ImR/zRx+9EsKWdbi1ULcluWWPTvZI8gSvdPZWpieQ
         Rstg==
X-Forwarded-Encrypted: i=1; AJvYcCUTRJiUlt61v5U5nLGymsCZEwxazNY2Tk0FlvdLsWHsu7AKJ6VqJwU/3/ZT7e4qfzivY/sLd+hPGYK3FckECHKs@lists.infradead.org
X-Gm-Message-State: AOJu0YwlxhUZ6dN9mYzaIRKxPKIkTG4wo25/iCwElgLBiBEdUAj44UeY
	fjJObPmiCZMtS8c65eeZL6tkSK2+Btp0gjV0H3cNvP3nB5qtbmjIdnGkoTkRe8HD5uLiDLaZCEV
	y2g==
X-Google-Smtp-Source: AGHT+IE2tdJBgqq+pKrYLNZS8C9leJxwEsJViWMuTQXg/qqAAeOo3ObjGJvwtxU1QDM6fT8EA1U6GYZxrw==
X-Received: from wre18.prod.google.com ([2002:a05:6000:4b12:b0:3b9:95c:a591])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1789:b0:3b7:994b:8438
 with SMTP id ffacd0b85a97d-3b9edf4433amr12720f8f.46.1755103508884; Wed, 13
 Aug 2025 09:45:08 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:45:05 +0100
In-Reply-To: <20250813164506.1203851-1-tabba@google.com>
Mime-Version: 1.0
References: <20250813164506.1203851-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
Message-ID: <20250813164506.1203851-2-tabba@google.com>
Subject: [PATCH v2 1/2] arm64: sysreg: Fix and tidyup sysreg field definitions
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_094511_855768_CE9A9721 
X-CRM114-Status: GOOD (  14.81  )
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

Fix the value of ID_PFR1_EL1.Security NSACR_RFR to be 0b0010, as per
DDI0601/2025-06, which wasn't correctly set when introduced in commit
1224308075f1 ("arm64/sysreg: Convert ID_PFR1_EL1 to automatic generation").

While at it, remove redundant definitions of CPACR_EL12 and
RCWSMASK_EL1, fix typos, and convert the only instance of spacing with
spaces to tabs (in SPMZR_EL0).

Signed-off-by: Fuad Tabba <tabba@google.com>
---
Note that NSACR_RFR isn't used in the kernel as far as I could tell, so
I didn't add a 'Fixes' tag.
---
 arch/arm64/tools/sysreg | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 696ab1f32a67..975dcfacbfe6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -31,7 +31,7 @@
 # Mapping	<name_EL1>
 # EndSysreg
 
-# Where multiple system regsiters are not VHE aliases but share a
+# Where multiple system registers are not VHE aliases but share a
 # common layout, a SysregFields block can be used to describe the
 # shared layout:
 
@@ -54,7 +54,7 @@
 #
 # In general it is recommended that new enumeration items be named for the
 # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
-# item ACCDATA) though it may be more taseful to do something else.
+# item ACCDATA) though it may be more tasteful to do something else.
 
 Sysreg	OSDTRRX_EL1	2	0	0	0	2
 Res0	63:32
@@ -377,8 +377,8 @@ Sysreg	SPMOVSCLR_EL0	2	3	9	12	3
 Field	63:0	P
 EndSysreg
 
-Sysreg	SPMZR_EL0       2	3	9	12	4
-Field   63:0      P
+Sysreg	SPMZR_EL0	2	3	9	12	4
+Field   63:0	P
 EndSysreg
 
 Sysreg	SPMSELR_EL0	2	3	9	12	5
@@ -474,7 +474,7 @@ EndEnum
 Enum	7:4	Security
 	0b0000	NI
 	0b0001	EL3
-	0b0001	NSACR_RFR
+	0b0010	NSACR_RFR
 EndEnum
 UnsignedEnum	3:0	ProgMod
 	0b0000	NI
@@ -2528,10 +2528,6 @@ Field	17:16	ZEN
 Res0	15:0
 EndSysreg
 
-Sysreg	CPACR_EL12      3	5	1	0	2
-Mapping	CPACR_EL1
-EndSysreg
-
 Sysreg	CPACRALIAS_EL1  3	0	1	4	4
 Mapping	CPACR_EL1
 EndSysreg
@@ -2576,10 +2572,6 @@ Sysreg	PFAR_EL12	3	5	6	0	5
 Mapping	PFAR_EL1
 EndSysreg
 
-Sysreg	RCWSMASK_EL1	3	0	13	0	3
-Field	63:0	RCWSMASK
-EndSysreg
-
 Sysreg	SCTLR2_EL1      3	0	1	0	3
 Res0    63:13
 Field   12      CPTM0
-- 
2.51.0.rc0.215.g125493bb4a-goog


