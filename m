Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8DBCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AhbZPensuqKG/yW0Qj7LE8IaoQDaRVlqpZyE8QDARA=; b=kJciDzaf2/b9WZ+1qWRzE4Q+L2
	dP6USkOwmX76MkWdpKZx/bmoBiLrbgqn+GpW7+vgp3wMdxSHzD8yC2CfES3TT0tJzSC03iNuG4wVD
	YA3F1541qUv+dbrxmxpmHUzi2b64EIjdSmjNJvCGgfUnnazatieMJt5VQohKBZkCBaplwuup57sFn
	IrOR6XeOsEV01sNpW3GXf19OXZAm3SUZZO+Dl8d6Zu0FhZStMfI7Rf38ie36Vk0u0Z1Wak5yQUwfV
	zGS/hNJprkT79SFY4MBOOA7utCA9u9/POTv+qMhwJfi/LCiNU0akACE1kUExbAeoPUDRyiVJIGGW3
	0rn4UsAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNQ-00000004BHd-1BXk;
	Wed, 08 Oct 2025 15:46:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNM-00000004BFJ-0Pm4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:49 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e39567579so22995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938406; x=1760543206; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0AhbZPensuqKG/yW0Qj7LE8IaoQDaRVlqpZyE8QDARA=;
        b=4rN+Ip5fFsdM/egIXTvUvz3LvKmpueGaOXvjzHMa87uJ6CAJUyjYqFqa+9JOaFyTC3
         7G+2OQ7MFV6f+p1cfDm+pg+/C7X7HKGKqnIf/1SwXtCg7R3Q90TOXvszs0VkbwaHC8nF
         s7MFaOaySyB51uFFLXoGlwUoRmBOieKq3aydEPNDt14auHChv9+BVxcZD85M/Wt+c23s
         W+D/qL2W4L6GddhvFzAshDt5uAg68QfMYDtI8TjZoed/RLwrBmat9sc2hdKsV2MZsawR
         9LxYh2fpquc+TB5EYqiAlcesKFrjSoeTWqZeAZ6kZwHEmEdyZDuqs+dygy6SdMTaCv+D
         rjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938406; x=1760543206;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AhbZPensuqKG/yW0Qj7LE8IaoQDaRVlqpZyE8QDARA=;
        b=j6dwhx7X0//UPmPz2HYrSmI9dfLLfADy+xlLvYAHKAbKZxzMhe7UlutdumjOjzc7g8
         WAdWy4777ywoC63WKFxxru2BksyWAXRR76E6wGejS8AJbWJM+aSGD4YZaI6LzF83szEy
         BfLFrdYhDg6OMzyvAzV4Pd4xwvjx1akGZRncX6IHVqurgcsPlPhInfhxnrS/JiRcApeP
         VvRo3Iukp1Jdz6FAarhUbY2OCOiiXSZwzw8LRvgckUGvNjJyc2Y3V7WAcpyW7BYheP1A
         mFW4crprspiEXEbVj13lT5T5jtXv7AgaS1UXKxUCAdwujnHLWbICYGB6mzKwCzV6VlGH
         JfgA==
X-Gm-Message-State: AOJu0YxaJiwhL+O+mFZKW3psZt2DTJBBcLCSC8B573bTNoxsMYel+WV/
	PvcLsBlQjdoRjFLXT1MTfTn3nUA4mOdmHdY8TgdJNMk0SXc9ZymckU+shFKtIwFeU5eC8h/4DE6
	ssRULxnxR4nIjlPXGYniiKthcyOQ/Cu0IlkhoSjzKnxBPPzX7QCANqct8SWGRGiVjE4W+ZSMaqB
	9QiAZTlSEa0FXqJhoqzhmxR/8cerlc2fBp+H+ZmQHqzAbv
X-Google-Smtp-Source: AGHT+IFGiSWygFLP8i64IlU/Ujr5WlDyO+2EV/4Cl8eQXXpZQ1evYrz2O0ebGMwfs5ylyK1bfixkdj8Z
X-Received: from wmbgx7.prod.google.com ([2002:a05:600c:8587:b0:46f:aa50:d70a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f08:b0:46e:3dcb:35b0
 with SMTP id 5b1f17b1804b1-46fa9a94553mr27472645e9.2.1759938405883; Wed, 08
 Oct 2025 08:46:45 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:35 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=ardb@kernel.org;
 h=from:subject; bh=dFhPhM339lpxbecIP5ywrFTMp3sezPQKRMrRY5eAeY4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu1Lfp9XzPjod2dxh3FPPsqyyScbs3OtNeYcfX7Y+w
 Fm+oNm2o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzE6QEjwxpeIaV+vccGIcs9
 Dyc+unbs7fSJWqcyfXV2LPXdKGaT9ZmRYVXe3vsMtX7S1jcOe/o0fpbfGaJcmHeg7Mq7F+7nFwd d5gEA
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-24-ardb+git@google.com>
Subject: [PATCH v3 01/21] crypto/arm64: aes-ce-ccm - Avoid pointless yield of
 the NEON unit
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084648_145142_AE48EDBA 
X-CRM114-Status: GOOD (  12.38  )
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
2.51.0.710.ga91ca5db03-goog


