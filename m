Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560DCCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ez+4eKtd+5d+DlN9/UyWopIVxOEbKik+aYqVxPQpTVQ=; b=GweP1VIBWBahZ6tPiw19R2jftv
	z0fbzMzxeaJX6qZoLoWPQhP0waEPTqNT2C4Xp93Nkp6gYh7APPxgfkTV/RoTYd5lOm3fxyX8N2b43
	U6ZpkEBnRQl3qmf2WCH/EV0Zk9ITtTPQkl26f9TbI8+acLeu/LD+Z5M9usQwUidsMg6YQmp8OC5/J
	STVHGS9TM/z652IR4X648lRsIgkMY5A/3hhsNWdOoNbRfsBVdWgxgheVSznE2Cd6EiIHVwvDe5t6d
	IJRPSi/cu49xLPI2F1KiXLSsro0dSwqvI2mOG6FPmZ5RX6oGfKWJbFQse0d9VydWDcM/gQODSTLXn
	Qv+ABKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNf-00000004Bb6-1IL0;
	Wed, 08 Oct 2025 15:47:07 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNZ-00000004BQu-31z6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:02 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e46486972so29725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938420; x=1760543220; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez+4eKtd+5d+DlN9/UyWopIVxOEbKik+aYqVxPQpTVQ=;
        b=c9psUt6xErFRTRN1wamDPVgzKH5R1brN7UhxeQBKEzQTKK4Fm5J0cn14Y9oGW6PZlA
         mA0345N4aNPppXP9EBEgpePMFgGyeEeqLNfXx1Ifnh2NV7gKA5PH0F7g2y6+LLrudask
         4mP0JsHpLPfCpQpSWyhCLv1aZp4FmMVvG6wffPuCpF+XOLY8zTe3ZmqJD8Tz1/9PC3Ht
         R6z6brbL2EtmiBVvmg8HNAAC4+E4+sPGDkqzA4e93U+KW+rITZzE643pszzeWMwSFYfn
         QVmWCqegfvWk+bWO8s9Krb49p7YM/XwgVGjQxN20pQcR0f2sS0+2+I1+yubUxjW7KTLC
         vy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938420; x=1760543220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez+4eKtd+5d+DlN9/UyWopIVxOEbKik+aYqVxPQpTVQ=;
        b=El8MOcEVeudBjKMWnqPK7vXDDJJS397ufxYajOyET2wId77hYyHGxCOTV6mUP74vfn
         qo8gQzTsaoVCA7bpzjqPUVUuw4Or9hXY5avyiGWT3ykJ5NUFI0ifS77Ohtr7FhVa3Mkc
         fxdQT3NJlr2Ic8U4iDFEVlGuSgm7NFpc8KKr3cboJIZjb/nAZgZPtWxKfX3yDS+eQ57C
         +jSjBek4yt1PyBXx+jL7zgXxuArnjFLr5PImLTUBDDDxBED60gSb8JVBQoI3PGStwtiq
         mt67LD8NPmlfA4E6JzDTH0iMugBxAh0+L9JltNHM1jyhAiBRR4gZriVsQZ7Z/ynzxvFJ
         j7pA==
X-Gm-Message-State: AOJu0Yw0OfSl+3+wNAAmh77qzNurTpebgjW4f9UkWKTZVIhh/g5CF66v
	e6BVAcnsccFyTriT0sr7hgwsoJ6eH7jQvo6od8rjxB/H6fn57oRmCAtkcF42SWCxPE3Ts8tHGgk
	+WKrGDHS6t+3DnDpre+PPKec+M0oeIZU/MxCoCx5zRWQE9Xd0PWh46Y7y0R3omqxiPSKR4K0teY
	51CQUupMyfe55HbOcEBGfpnKuuaEJmuTaR4WSlC4zBbuQx
X-Google-Smtp-Source: AGHT+IGTYM4Pf/38/W7UXSGOfa/Cz0TebUDvS0+woKJDjAs0iBAdrVv8aCM0ALs/qJZsRftZYcTgSa7a
X-Received: from wmvx6.prod.google.com ([2002:a05:600d:42e6:b0:46e:6a75:2910])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c162:b0:46e:4a60:ea2c
 with SMTP id 5b1f17b1804b1-46fa9b17e57mr26033895e9.37.1759938419976; Wed, 08
 Oct 2025 08:46:59 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:47 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189; i=ardb@kernel.org;
 h=from:subject; bh=8sN9JxLWvPrUJL2U51Eh+5qEYXWcAYa7eZ5mEETt20c=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu/PzMHauZxLCKuERrRdfzF5wf7kDA39FxuHFVmtm5
 k9ZGbCyo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkiCIjw9wiF2ODjCNqLeKT
 1y57HJa2ecbP6MIlHaFB7NPv73o48RIjw6d9u7u+haqfKfBVlgpP4bO+/M9SaGnMwn/JDUovz4U dZAIA
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-36-ardb+git@google.com>
Subject: [PATCH v3 13/21] crypto/arm64: nhpoly1305 - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084701_792101_CE1F3EA2 
X-CRM114-Status: GOOD (  11.47  )
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

Switch to the more abstract 'scoped_ksimd()' API, which will be modified
in a future patch to transparently allocate a kernel mode FP/SIMD state
buffer on the stack, so that kernel mode FP/SIMD code remains
preemptible in principe, but without the memory overhead that adds 528
bytes to the size of struct task_struct.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/nhpoly1305-neon-glue.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/crypto/nhpoly1305-neon-glue.c b/arch/arm64/crypto/nhpoly1305-neon-glue.c
index e4a0b463f080..013de6ac569a 100644
--- a/arch/arm64/crypto/nhpoly1305-neon-glue.c
+++ b/arch/arm64/crypto/nhpoly1305-neon-glue.c
@@ -25,9 +25,8 @@ static int nhpoly1305_neon_update(struct shash_desc *desc,
 	do {
 		unsigned int n = min_t(unsigned int, srclen, SZ_4K);
 
-		kernel_neon_begin();
-		crypto_nhpoly1305_update_helper(desc, src, n, nh_neon);
-		kernel_neon_end();
+		scoped_ksimd()
+			crypto_nhpoly1305_update_helper(desc, src, n, nh_neon);
 		src += n;
 		srclen -= n;
 	} while (srclen);
-- 
2.51.0.710.ga91ca5db03-goog


