Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3E9CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcJUAK6wYbUnIItcXuhAD3+TuliFkqmiKq4znCgSGF0=; b=l76zDrtVqZnuTGTkPnl/6Ctzri
	4W3sSOt9Qc6legAJiDSL0RDEDu8u+nMNuH6/hevDUdqGQccxYlXmYNqKsMxvcPc1oCcz4WkeDZL4z
	ldhhfcEMZxkd/CfIpVPNiw476Fxb925nc5uZhVUo1iepRHk4DEZMWle9flQGFShP5qeY12oY9tTWL
	iPfNeMfxjyz3l68am/PXG8NrlHk0N8qC+DQud6uFx/KQ21iim6GQq5bxZmDPefZMSMMPmBjt24Uzy
	9ZPtwpGzRwOxzYjN2XR5sxhV1hF/Th86YJebXUKxmD20Ejjo2vktkvyFen/sngq/Wii4KMl/62OpN
	CHYFR9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY0-00000005v96-3z9a;
	Fri, 31 Oct 2025 10:39:57 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXt-00000005v4g-2zMz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:50 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b479e43ad46so223150366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907187; x=1762511987; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YcJUAK6wYbUnIItcXuhAD3+TuliFkqmiKq4znCgSGF0=;
        b=ia865/kD7/xknEBpNLXtTJmWJClwZtDMJZAyzrSYPZh+F8eVzT0JLp5dJwTID6HLBL
         Vrl45kxfEn6QX90wNviseeYpNxrbqNioqaknWmW3STogxx0hr/eGX3c0cetEQht2/sxF
         Mb7hw9CtChS7VK+dcQMT2y4NohPA8nZYv0Ujt14C2HLb4pFVFht7XNHEgw515I1Yp7Y2
         y5SG4UAjNUnSJJCx83flhzAKYlsO2KrQ6jHnhIIxQhcd9MF2n/wFEAaMuhS55+4Zbc49
         vorYgQAW5EBujCH5zzJtw1ChM0eSZivC/GORBTI8Ou2nscRjcTx9ETbws44NM3CuwyXq
         DgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907187; x=1762511987;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcJUAK6wYbUnIItcXuhAD3+TuliFkqmiKq4znCgSGF0=;
        b=X+vS+xOmPVOKaTCs8SWeZrmWhrMhNlquNd3vEUG5yeYc+iAe9U07ytz8NCCcdTwHuJ
         OtfGagOyTyirQ0blYZEGrBBMkuAJSCtAy7EnbD3wGJ+Hy3dsfyvCU/jmr6bPGxz3rEgQ
         oa8ONybMs2SNcC0sebBp5sTdRiL7Xs6KDodPKUqZ4UDWmwWdwTQraxS0Bq62/63sWuA8
         vm9OyR5iYJRUOFHomXKgsRpTzgVL/hc6ofAxkRtfduP+n1boroQxfrNVOwtb8NKX2JjZ
         zIc2wBIZxh3Dq3lXhQzYxS2r2vYW0u8zA9VGJmEiAnYDH5POh69tbU5XltzB7U/jF39f
         jJQw==
X-Gm-Message-State: AOJu0YwmBrU2gMPa2t063DdfKd/RNJdIUB2ptfI/9oMQa31p+ocgLlZd
	sS2XCbzXHWR/VHW83Da21VNguwFQcR4XWhsOSUeRxsLE9bSnSMeVlZxb/adXoUu5WVg3Z81/YCX
	f+muIv2kBzmdfJDjcxJ6EcyXf+J1jTIWOg+VkqgCgRmBqzZh/3L/cUXQppePOdkpMcfOJ1f4s7h
	ptkj7pM/ZpBbEKxIVa9zfz+CPyCGyk8gFTsph4OeYLvQHL
X-Google-Smtp-Source: AGHT+IGZh2XVfTLLj0zhjt1BICvTQf4H+YXy15GPZEDU6T61fPt/5oBnkxDlk7NOR3Q1+6PHRVp+5rAW
X-Received: from ejdao14.prod.google.com ([2002:a17:907:f48e:b0:b6d:5f6f:f88d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:4fd3:b0:b2d:d7ba:8e7b
 with SMTP id a640c23a62f3a-b70701b183cmr329375466b.23.1761907187206; Fri, 31
 Oct 2025 03:39:47 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:00 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=ardb@kernel.org;
 h=from:subject; bh=dO4a5jlY66z9w+gPMMFWeTG7Ku3rgSUkr2hPJWOMIU0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4pHD/75JiC/9K2vH/lbtRfh3+QvnpDrMDjge27JVP
 HOJ/5G3HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAihQEM/zSie2ONrfwLXk3+
 t1VdNqr2RUzhcYsZcfEmO5qeTnM7/IXhn8H7NtmnN3p+XXt/sq5gYUf1EqtZvT3e2uK8kaf+XVX dzwAA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-24-ardb+git@google.com>
Subject: [PATCH v4 01/21] crypto/arm64: aes-ce-ccm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033949_758470_32675AF2 
X-CRM114-Status: GOOD (  11.70  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Kernel mode NEON sections are now preemptible on arm64, and so there is
no need to yield it explicitly in order to prevent scheduling latency
spikes.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/aes-ce-ccm-glue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index 2d791d51891b..2eb4e76cabc3 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -114,11 +114,8 @@ static u32 ce_aes_ccm_auth_data(u8 mac[], u8 const in[], u32 abytes,
 			in += adv;
 			abytes -= adv;
 
-			if (unlikely(rem)) {
-				kernel_neon_end();
-				kernel_neon_begin();
+			if (unlikely(rem))
 				macp = 0;
-			}
 		} else {
 			u32 l = min(AES_BLOCK_SIZE - macp, abytes);
 
-- 
2.51.1.930.gacf6e81ea2-goog


