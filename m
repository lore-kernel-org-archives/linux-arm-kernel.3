Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AA1C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5+vsDywURKto5J2uSvLDBbpGVTjH81pRFa24AxG5QI=; b=Reie59xeA+G1qPQGp+ac9NKr21
	2MsfU5WGRxdrodg0GN+nm3ORnxA9G9WJ9F3q3MA8F3O6600GoktZeuprS6sDIJ0FpyEQYrzFM5Rdq
	O0flWdHCX4eB5AeXM+C5Tv7m6w50+1BHe/lbqoMIcBlWhL0B4ohKYY6IqzSFLlSKNRlGScU+97qo/
	hhvPfQb+lxFR2IueUgxwxJcg65UyzllzRaPDgZZIG+nLDgLTjIt9qtRiCodtSwBabaP2n5nBOuW+z
	11RqOqO8wmqcgGVnFI9lG4/y6WbLrukODiObnujCXs4TU/6Z0mK7e+ybqRb3oKBBzZiD6xmaAXDA4
	kHJaPrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KW7-0000000HWQl-0ryt;
	Fri, 25 Apr 2025 14:59:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IRB-0000000H9zc-0t9i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:45:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abec8b750ebso407517966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585148; x=1746189948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5+vsDywURKto5J2uSvLDBbpGVTjH81pRFa24AxG5QI=;
        b=bq7lFb1kSTmg7i63PBijVMmWB+U2jZynpLuiAh7jR00mxXqyp3n7O32MmJcFzPKaZ2
         ofaPR3CK0Jda9T+zpA2oiKwBXXSohZ95Siiti/wl5kZ6hb7z8nNfF+0oMfFVMi3Z4TNO
         vj0/0ScO24CiC/4dul6gXY6hqE8DvS8gkTgZUhx9+nl05vXquybGM5Z7sssJqabt/lPN
         BSmIOGYOFwPy3CexA7qQKyOVX0j5P0i0c+iAmMZhVgBZy8JVxIetlCm+i+xskK8OlYN2
         b3RKItPwF/NCg5VBan8QccvWt9GuMBXmX250lugjamjUWZgD+VJmaNqX3geUW9Dr0hZ3
         ZPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585148; x=1746189948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5+vsDywURKto5J2uSvLDBbpGVTjH81pRFa24AxG5QI=;
        b=MOG0h/P/fdevXmB1TSgS2Hcs5hEMzF76g3efkWdkWezpQrKDE44zsLugBFyKBiSmsZ
         C9Shes6sZMPtmJcRL+9mxq66hS+FqU9yI10dpDnYKOD/SC9xcU8QxhoHIOwgH7rPPAqs
         muXFpx3iqtxHvmG+C/oJ9him+0qRZja+LoGF+TD+vSEVFVmUVC3Yy9f+Cf1fEPovZ3fJ
         J8dT9g7Kw5lF68m00WQM2tSJsrqFZoNMpUL1etv5XvJ1SlK7LHkLLIxz9JyJpl7U8+88
         8QsqIoduc86LiEXVm5OjqfesMp3PGfHrizCBxzyWtl4fzCWAvIBXDBbu+kVHcXtChnB/
         o2eA==
X-Forwarded-Encrypted: i=1; AJvYcCXYvkzV2soLrp3zZ0G1qHjfquvyCb/w/9PB5RKtdW5JE6nE5v2UHgYSiI0Zq2nAEjmeIb0g8ATVr+q4E2sg3YIc@lists.infradead.org
X-Gm-Message-State: AOJu0YyNrrczlw/E9b+wBouNAMxmzn0HErCRyI0qm7tttwPNWAA/IYHx
	m6E5pGI/nf73Ot3dhUOqc3ZCON8fpyR+fxAcnXDV2BDag9oiRVuz
X-Gm-Gg: ASbGnctLIMKNdMzJM4LeD6a9wT/uL0DG+BQYfsVneTQCMOdC1k0uG3hatST+yVvjdt4
	H8EirSRx6bDkSkdcInPeLJA1WI0BUdHCgIx+sGE66aufo/WHOW/3O6y1rf+TXVKRzTXCWpoFCyq
	fDXbYYUBPMLpVzUKpq3MJC+2bFCsO1mzoFJx0XtQXUkqpPIvtR9buHBi/GP3grOn5HeYQuGlHMX
	colElw33oDOqJ8LsnZ04/jgGtKuowEAdBuL2tn+rIib4hkE3PXGtrIB64qkkfEd8Kz+HPoLMGyH
	Blr+p+v/P2pMaqormcfr1YJ/xf5H3OLbsY6CbcyC5j/aYUaM5BXKTz+LevmaCrAB9tH9
X-Google-Smtp-Source: AGHT+IHslZla2YsavTI3FKWyUmmzSPKtVbN76hsEb/Nq6bQTRCWaVxHsrrr0xKG5Y0qcVDJqED8AMg==
X-Received: by 2002:a17:907:9485:b0:aca:c507:a4e8 with SMTP id a640c23a62f3a-ace71095212mr185275866b.21.1745585147374;
        Fri, 25 Apr 2025 05:45:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7094sm134641766b.56.2025.04.25.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:45:47 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/4] crypto: sun8i-ce-cipher - use crypto_skcipher_driver_name()
Date: Fri, 25 Apr 2025 15:45:15 +0300
Message-ID: <20250425124517.2225963-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_054549_247576_42EEDBA1 
X-CRM114-Status: GOOD (  10.98  )
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

Use crypto_skcipher_driver_name() helper from <crypto/skcipher.h>, instead
of accessing struct crypto_alg directly.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 05f67661553c..f03a8fa7bfa2 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
 #include <crypto/scatterwalk.h>
+#include <crypto/skcipher.h>
 #include <crypto/internal/des.h>
 #include <crypto/internal/skcipher.h>
 #include "sun8i-ce.h"
@@ -438,7 +439,7 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 				    crypto_skcipher_reqsize(op->fallback_tfm));
 
 	memcpy(algt->fbname,
-	       crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)),
+	       crypto_skcipher_driver_name(op->fallback_tfm),
 	       CRYPTO_MAX_ALG_NAME);
 
 	err = pm_runtime_get_sync(op->ce->dev);
-- 
2.48.1


