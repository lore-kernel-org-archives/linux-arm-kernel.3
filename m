Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831DDC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LOHlOpw+rL9bZwLX0L5IiavSSvBSY8N55kRnztDci4c=; b=t8psxxEpeI4nbYuHZnNQGBCjH8
	gO0GsWQ6XNnkbxNrgP7UsVfRErvl2gvx0RlFgMR96B15ywJWkUXi8cG0eg5SOSNAQr7hPiWznhc1k
	O0WTeHrmUE/be99omB5EmLKSGqcjX0nn119qV1WgdAlU7FDAuHjTzBPC2Jl98ASdV4E2Ey47WE9RE
	DhA+rbVhacYbRtX3yvWc17eFd6nOcNLZI/vFI0U+v06JvylT2XFaDt46nnLY24Tqje+WLXidY42da
	0OyXGg59k20aPr4v5r78uTn2gQccrAX9WlnRDHZrjnJdNOoe/YQE9CGC03YivxhVeENBriScAWycv
	mx7k6RHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EvE-000000085x2-2dnq;
	Thu, 03 Apr 2025 07:23:32 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Erw-000000085Fr-1vhz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:20:09 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso2838735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743664806; x=1744269606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LOHlOpw+rL9bZwLX0L5IiavSSvBSY8N55kRnztDci4c=;
        b=tEwnUPeS3G/DsTAiz6/3xKRWooZS1nK7LE6m/RB/oV4aDKDLxMYMb4G7/5Id2fqH0J
         lTZOo9939VPZlc+RfJ62wqu8ySpspWd4rokVZaQKRpG4lbwmFLI9uSDM8OFEVtB0hr67
         8bU446pKjIdlzPIGP2ce+gvd3lscDNEJV8AAgvHmePQIdgh3Mal+vk7RNfP7RxzW3Xf3
         Gh5pVB3TySgf5VNjJ/T4wlOayKiG3njGNAtBfaRgywHF0pjhiL7RKAOa5iDKzhAD00U6
         wmu+AAC8eVYReFh4Xr12xI4Kt7jP4iI6bX5u6Lb2b6iNeFuV62hwpUyy0qjoaaMT4Oxx
         cFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664806; x=1744269606;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOHlOpw+rL9bZwLX0L5IiavSSvBSY8N55kRnztDci4c=;
        b=h6gubS/LHvtQYF1oxpkEBWnuXbwTOSqPxRuGkGaDoV5t5q2UvUFiCNT1pwlNXb4bJQ
         8LhCtAtQpEI8XdfyKWX4Lo6AkaZNcTlwns4kbYUwEmWtHqOeXdb2o9xEMyXvlaDKzxUZ
         YCw4Q/iI5ei3YjBxKuahknU754X93Tdzmcspp5kkY2FZ1+quOTqy9wQWtkriDMEXu6gL
         QvBdgNN5dy2yvOiefLDzVhWdMDg8LpDtxI4hngGdG0JgDJBaeaorZHHv3Migy2zPnUYe
         WXULpPXPBaeZJs7Dz8uHDL+OuHEn7BPXSPaOxKfO509rOqoM2+CX0hKhH16toLjuIvXl
         iP7g==
X-Gm-Message-State: AOJu0YwLfnrMYmFXOFOKWKFbJlDlnriWaC2JAhwWxW29NeTv/O7b6xhd
	YGnquYBfhRSRdhInv3kDwcxdMoxCoPzuZa/aRVElEKnmWzO7MuIuJqI6azR7l2daJd5CpA==
X-Google-Smtp-Source: AGHT+IGgQHKv5K3Neyjj9hSorIlAQ3SrWqYgb4Kq33sUT6FbB41Tm3x9PIBtlBI/d/0+J99BsWG2qUg1
X-Received: from wmbfl12.prod.google.com ([2002:a05:600c:b8c:b0:43d:9035:df36])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:458b:b0:43c:efed:732c
 with SMTP id 5b1f17b1804b1-43ec1531fe6mr9872975e9.28.1743664806328; Thu, 03
 Apr 2025 00:20:06 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:19:54 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=ardb@kernel.org;
 h=from:subject; bh=3QDcI3nC/0x8BzLQP6lJAcdrRaI58t4VCtI8q2lKKtk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2d2SwufV7PP5z1d3scvE4eYTZvWt3xeMXTh2vXn+e6s
 eLsB5fVHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAikSsYGS7XfFo9eRX7Nu5H
 KrzXJ8+K6QiaOzln6XSN5lvtJr9cbnMz/A9ImqfB4Z6syPQl1vGQzJbKWcvW537MOJx45sSujX/ 3LOUBAA==
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403071953.2296514-5-ardb+git@google.com>
Subject: [PATCH v2 0/3] crypto: arm - drop dependency on SIMD helper
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_002008_516358_EEE8B4BA 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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

The non-SIMD fallbacks in the ARM skcipher implementations have become
dead code now that SIMD is always allowed in the contexts where
skciphers may be used. So remove them.

While at it, remove the sync CTR helper function now that its last
users have been dropped.

v2:
- drop unnecessary includes
- add patch #3

Ard Biesheuvel (3):
  crypto: arm/aes-ce - stop using the SIMD helper
  crypto: arm/aes-neonbs - stop using the SIMD helper
  crypto: ctr - remove unused crypto_ctr_encrypt_walk()

 arch/arm/crypto/Kconfig           |   2 -
 arch/arm/crypto/aes-ce-glue.c     | 104 ++----------------
 arch/arm/crypto/aes-neonbs-glue.c | 116 ++------------------
 include/crypto/ctr.h              |  47 --------
 4 files changed, 20 insertions(+), 249 deletions(-)


base-commit: 99585c2192cb1ce212876e82ef01d1c98c7f4699
-- 
2.49.0.472.ge94155a9ec-goog


