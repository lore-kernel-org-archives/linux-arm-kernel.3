Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061E1CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZKSd5rMdo9tEwoYCoXUQVE6sJT0wmf8X0NATCF37Q4=; b=fZ7xzoXaQhu8NSKMk7VBD5BPPt
	mZ2VKdDSNbFb5X4ipEX+g256k2kYFrCTu8Zl62DgslGA2+VqWSH5LWoPgMW97Z5e158clQ324bSN8
	/QoBnx6DmAtKk0s340kSB92PzsDv5iM3Otk9HSwVB0tpvmoKp0I02bfv17Nc5okKyafepvfjx9nhm
	HkdxERYgwXQn66M8ZzkMac+Ri7AWcxZDdytSSye613P8l0r3iUTfcwrLteyhxaRrFT1onqvydUTON
	LmDXVGIotUNxSU7/aW8UcVAcTeM95/0tjeMYsY8JoXwOkR0mMNKbfqt94RSNH2xUcgsw1zo3uWmba
	T6l8zjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zm-00000008zMt-1OUd;
	Wed, 01 Oct 2025 21:04:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zk-00000008zCu-1eWB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UZKSd5rMdo9tEwoYCoXUQVE6sJT0wmf8X0NATCF37Q4=; b=pcZ35POW4Gn1hEA9luDBmKlIEr
	o9KjCen4bhGyQYSIjhXgz/XNJSSgsdsAFhSN62OQPicCpU48uBvt56WSGwRTPP9JUMV9rb0KmDfhs
	zzwI64tPtYjKQQAH7O5iDiQ1eFaszoSYKtNC938Y1xb/CqGZz3KAbiahnBm8fg50+AzMWXfK3+YI0
	wfJqJ6YlBKk0wjzs1dQaRkvk/yHY4tz7LtuXlBGgU7z2Ylnoy7Ch36sdfg0Aqdr8EfxfYHpbml6E7
	WEtl6q551J5ZdcNtXqwswXGFhZU5V7LA9qMqgR9tg1xeVggc5IANIeGl4lg1exF+l5CRvmsDAbuq5
	UuQAMSfw==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zc-0000000DoQl-3h0U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:10 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e4943d713so1254755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352647; x=1759957447; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZKSd5rMdo9tEwoYCoXUQVE6sJT0wmf8X0NATCF37Q4=;
        b=Egu8aqmwmYwzBX6kmdrLRgIsjcWjB4UDEz08oAj39KyQCuILXVxJ7bwMfJ8xsAD8Zc
         6i+w8S/Om4x471jTzdymk65QhmiEfP/0ktqtf8lPT0QNjY/zOIPUQ+YA/FBF47aBeonw
         +5b9H6UzV10NJH9L2hcjqBwx/1uJs1iap7Sx1GVZkHu05Yek7GlazWKVullOakpjW0Ho
         Bnir7mL575huEF6y/ofEE7+joYHS5LV2uBZQCZeBMSUs5xbnjjpwtNvFBDM3ZpUzDuc2
         Ucy7v+mc0kydhMnw3YzgCgtKWI949ulL52sGR+LuzLjErJzi2BqhB/WpQI1S87PlwnPH
         XLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352647; x=1759957447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZKSd5rMdo9tEwoYCoXUQVE6sJT0wmf8X0NATCF37Q4=;
        b=LcawmnNezG4VkA5PrPfKiukAfhcvBK+bhcNwlGl0x62541aDDaTKf1P1TBDnKLfP59
         ObtkSZWItPxv/u2Vn3f60oCs1QzL4qZofVBuO0QmYuGivmGljNkiVAblmzDY0i1dqdDJ
         Itq3XO5Btlci45NW5/NN0BoKh+a83SyjFp+nCc3shBRFyDPZaFISg+jqNhcoGdQb/yhM
         W893RC3eZoT4r943PaZle+eUVL04ta061rS2Y06+5TshLGMVhVLS8I85Y/LuUpyg+qiQ
         ywVmoTYyC65CWOA2a6mG2ReV4TAPfdwaN25pUV0AuGT7vmCO05kS6YTl8ONMYXDl+Nqk
         EJ5g==
X-Gm-Message-State: AOJu0YwsSwCXRXUL6fhJOdnZEL82yDg58e4lZ1ZGnDkG+tI/wVIvKUPx
	iHl7KGRDd3FRvucIYBH5jUdQLIwQRIeTYhVmkYhwxikeObdc7z36+HOqXFUAXnPQFrxbZyuMiQC
	+x/GrmkLpY7LYE974EcG7h7ZIDMG+PBwyN53xkq4zbBc1rOUfvMD4yR66vOxC/quiOvNWJYwfoP
	yXOJZ2lGp2VhIM0g7loCxPFoWy+ruUNvmzJDt+wpMge2pa
X-Google-Smtp-Source: AGHT+IEYxGxSDoioNYClblaAj4vxDm8fokdAPOdazIOTblzm8QXHXPeKE11+MRENrVgxIsmYT+ZQ2SYk
X-Received: from wmjs2.prod.google.com ([2002:a7b:c382:0:b0:46e:3422:1fcc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fc6:b0:46e:1a07:7bd5
 with SMTP id 5b1f17b1804b1-46e61285d7dmr38854685e9.29.1759352647355; Wed, 01
 Oct 2025 14:04:07 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:16 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=814; i=ardb@kernel.org;
 h=from:subject; bh=40tSyXfxoCO4pZAvlNOPxZCROdcuajmQXIsSsXG3TMo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePudNZjToIdV9WeFedtulX01C0kb9ZiTfM1ap1FWzetS
 rNz+Liho5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkSAsjw7scuSlTyt+Fs1z8
 9Tm6LUE4x8+7eQ0f03c1h6unY6tVFjD8FeRM44laGepRWKlwYnJBPce7w3/PGx652jDr06pfoou aeQE=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-36-ardb+git@google.com>
Subject: [PATCH v2 14/20] crypto/arm64: nhpoly1305 - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_220409_229777_3C297417 
X-CRM114-Status: GOOD (  11.88  )
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
2.51.0.618.g983fd99d29-goog


