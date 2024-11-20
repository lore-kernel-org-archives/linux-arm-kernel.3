Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BAD6E2B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nr9bDWpFW06TWsiAwkTdInEtC48T7Y3ALsBXGGbhmbY=; b=zzEj2jtU9JBTIAolJX1ZuGx7nP
	5m2dd1byx5C8SJOBIuepNam+uh+vuBW3fSzoB/XHjEk/kAJNjHXUvMT5Z1HdIXmKrarClsM0zyfBj
	4FKk4P0I9jmmkb0ciaU0BQZ4esFmpSXHKZI40y+kq9zcYCkdqgpm2Bvxj03PYefAqnfsWphlwUEGe
	pgNlHhxJxLNAbhAphi4zn7ULP3rMJ1TzGGHcTItNmqtKc0ALUgwkGymiQoQp9mPKR5ASFmbiu/kLf
	NqvzPmH6v29NS+MTLOweN943KA/TMS9Gozx7F4+advbVpNXZ5PuRb17g0gkyLwhm/ovZ3zMgMTHTZ
	/m0muGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDckC-0000000EOV5-2jbY;
	Wed, 20 Nov 2024 04:55:12 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcjG-0000000EOKd-1j11
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 04:54:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e9ff7a778cso367028a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 20:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732078453; x=1732683253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr9bDWpFW06TWsiAwkTdInEtC48T7Y3ALsBXGGbhmbY=;
        b=T+URq0CgwCK7lb89DPelbNal3DjySTnmWkIk0hcwFZm3jqsX1P0ARTKj8ofYqJ0r20
         7bJTaY8rSd9KxhG9GjGtSmk6iu4MZn0EIdh/he5UWH/Frvs5q/95XFyyDZsr/ycL+Ir0
         ckioPuQuWNrtuJOQ6lyPwQoz5u7IAx4raXVgQ/8QV4/xecS5H+owXkogu8yUDbIgPnOh
         e7at+fJKss8SyviXiUyKamieJR5RvlIrPBTZZsu24HV390r2LsECzLSCJZINKMAAdoh9
         crb0Z/Jakn/ZZW7xEw8MLr8u5cDTFLEpBQ0nB1dazcV8dutRSziurCh+KOfV/ZOZw4/1
         gAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732078453; x=1732683253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nr9bDWpFW06TWsiAwkTdInEtC48T7Y3ALsBXGGbhmbY=;
        b=Jq/8LtvkFkw1NzeLglm1Cj+xjlnGXUgmKzR9vZ23bH/aQWyerhfsFjEjvGZ8/pUTZu
         DeUOhmFyvdAYMAG7TehqTQjaLMUxaEAxmXnra2c2JL9YIuKxXI8KiAyMZgQn2+4zH9B8
         AI/iXvZDcEuKmskAnDyDanJg5Wbl9X9T2ZZWGQB5LKj20YXAkzeu3l1CdarWyoGqkv5P
         y+oySGajS8G0KTeMlV4ir77WTjeeyST7or/7U8BV73RM/Ue3+G1nN89BSG1w795/ZS8C
         a9s473ArmUFkV5+FujYYjsHJCzWwt8xWxa4dGndBNYeirMWMbbEeCiO6AlIabOIo89oX
         uV3g==
X-Forwarded-Encrypted: i=1; AJvYcCU1IJsJhLyM9xou5QLB/TSKBP5mzYU6EJB5JEoYg1t9uysl8dD6pCmOHlxIZ0yNK1Htn2deFnYWU8kZ3IT70itE@lists.infradead.org
X-Gm-Message-State: AOJu0YwgI+FYCWOkIOVsBfGwiCtVEpFrSQCsHw+b/jnVGEMcwMN8JB1k
	rOhh864coIbEW0TGRu4hcANHdigV0ditRwXQONbwFVDyUV/q7A/b
X-Google-Smtp-Source: AGHT+IHcXpG4JC6BlYjXdB2KJFxOFKlbKLdS2H6Lq/TlBRndmGYk/bd8MqYjQjQSxSLDifqguTxRug==
X-Received: by 2002:a17:90b:3ec8:b0:2ea:9f3a:7d9 with SMTP id 98e67ed59e1d1-2eaaa73c00amr8834300a91.3.1732078453533;
        Tue, 19 Nov 2024 20:54:13 -0800 (PST)
Received: from localhost.localdomain ([175.112.156.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0dc305dsm83194625ad.44.2024.11.19.20.54.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 Nov 2024 20:54:13 -0800 (PST)
From: Ruffalo Lavoisier <ruffalolavoisier@gmail.com>
X-Google-Original-From: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: remove duplicate word
Date: Wed, 20 Nov 2024 13:54:04 +0900
Message-ID: <20241120045406.21537-1-RuffaloLavoisier@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_205414_449389_B3398E5F 
X-CRM114-Status: GOOD (  13.26  )
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

- Remove duplicate word, 'to'.
---
 arch/arm64/include/asm/pgtable-prot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 9f9cf13bbd95..1d6970efeb6d 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -131,7 +131,7 @@ static inline bool __pure lpa2_is_enabled(void)
 
 /*
  * Page types used via Permission Indirection Extension (PIE). PIE uses
- * the USER, DBM, PXN and UXN bits to to generate an index which is used
+ * the USER, DBM, PXN and UXN bits to generate an index which is used
  * to look up the actual permission in PIR_ELx and PIRE0_EL1. We define
  * combinations we use on non-PIE systems with the same encoding, for
  * convenience these are listed here as comments as are the unallocated
-- 
2.46.1


