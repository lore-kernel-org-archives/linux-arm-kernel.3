Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17003CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibSd1EIrnlf1T65R99x8NmkSqz8ymnGekDTIZaoFiU0=; b=0x2UIJGp2D5iHcH7TrEVuoG9nR
	EqCxod2+TiEEDPFTUer3MX38mlVdP4wj6R0czJU6cxvzIqWDnSS/dN8a+U6pe2erxM+OHHXkEvQHR
	rK04ybvAeBIvQJCyQ7C8yXYZijOENz+Puo35goDTTNkARSbGX5fcjBFBeYdbB/Okl6AXJF0oR8NwF
	crfbG+YaeCbAZ3XCx556Auyaw90shU+v/62hQl72qsEFn+vnlzcvmhHR3hJXF94UYANJnwpBWoTDa
	kLsKj+lpQsgcQyTOQKYbbju0HWQUCA8Cg/fMurmzf0fZoly03PCPw9FXL/oV41qJHlmTQ9MAPowz3
	29lzUymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEt-00000002hRe-3APD;
	Fri, 05 Sep 2025 15:20:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuV0N-00000001VIZ-1Prs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 11:53:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45dd0d53e04so2341285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757073201; x=1757678001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibSd1EIrnlf1T65R99x8NmkSqz8ymnGekDTIZaoFiU0=;
        b=IRICORii7xU71h8IERNkBoeDvb/QGgJ8o9SvMCch68ouLhoZxH7EgRykKD1If19S4H
         rYdPXv9pEeOR1bhSBFgwE63SxKoylkAXupEglU4lDWHijn/Tvf1XV9huzPFX1jqNwoij
         6MFHRB7OAFPLTOnvUXWQW5kFAIV3aRQfndXSGYhANgx+PAPm7LpUy5ErlBXzdSoTfmU7
         VigA2zFKcDlbpWggc2BFkkotEx5j+45Zp6EHFz/tbQGsoDDIdQW3gBVJf+fVYr9sWrCr
         oIPwlMllV+JA5ysCZZL/2Z7e6GHnRzvsUlFEIlMnkW4rXvhvkeB/SDKHSjmQLUg/gkHa
         90Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073201; x=1757678001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibSd1EIrnlf1T65R99x8NmkSqz8ymnGekDTIZaoFiU0=;
        b=KIpDFB37I1W/o7LeddL8Lf7ioFSttoZJ+H00jzvsuY6hmWOUXey8JA5f/Lz0PZ10cj
         Pr0QOmAu5Ze6SvaOtU/ohETl5F3HcpzYHbSkqTf0RI+PPTlOciZNVEWvG0Zhuvkw5Pir
         x+hKC99ON9udScxJClxikUN5G6y9eEqAgDNHi206q3Q5IQ9enSQ2oKNgjGYoDEOX04V2
         9cNSepdaJ1+cb58LdmkhEtR9zYebqBkbThZTCHoh0XhD5gSZ+vQg+Iqd1MAGxT8ZaUXE
         FT8LSJ6m6qYgU+Ic58KMwpuy8AyjqzhlmSL5XkaHlHY/A8MMP+Zv3NM9PqK/YzOOfpP6
         +Z3A==
X-Forwarded-Encrypted: i=1; AJvYcCXhv7QBWyzuYfSRGciBMFkS2ZGuuh4bwgnkY288e4wNSGrKsL95NED9FU8/bFDUqDtPOw1zAdo0/gZsROm2Br/S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8pRQEKNYq7XVutWnN4sWqHz6JJoi9KE1xwijNs2IyICmjaoE3
	AHqKqwkHxRGaMTkafiYcjiJCYw/wHRArAbCQUfhEgi43RNkQYthzX76S
X-Gm-Gg: ASbGncstFzhMklz2LepsSTG5UCprpbQkCvSB1ZiuwNLkxJbQT1GipeX3UeXxLJbd2ID
	fMHALpi50iKTbdqE17dgRUU29iAhe/0/0eg60wwD7Al30STJxOU6SoysRlKDTFCDlpQJU8EwO40
	uA5l7qN4tvntNbMDnp6uWnN6aYYW7bYifk88QtecOHACuYr1wWDGqXgP4KffSbj3thGovVykM3z
	EXzfjohuRAatcCC219ifWY6sAkENq82UYGIacZEPdkSHmUiChld2XMLr/mhF7ChssyMHvaOI9yz
	GRJjrJQ3WCiGGhOKXK5wm44ERKZQFRHP1XGQisR4HRyoYCF1xtSy4IgFgjaNODTfd32UaxrgRk0
	tv4PeoL+wYs+xXyHEioAcGcWvnv1/uB2M6+RT6Vu3+b1/GqKqRT94hbMN35Dr9ldtt2DqKZtD
X-Google-Smtp-Source: AGHT+IFgyUVRsNnagZ84Pf1RIyYo5EbfYhRyDK79C1hAlhHc/Tz4Dui23mAaHaZv4EihvJszPYZfqQ==
X-Received: by 2002:a05:600c:3110:b0:45c:b659:6fd8 with SMTP id 5b1f17b1804b1-45cb6597198mr40677645e9.3.1757073200933;
        Fri, 05 Sep 2025 04:53:20 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:999e:a0c8:e30c:983a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e411219ddfsm1903897f8f.57.2025.09.05.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:53:20 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Neal Liu <neal_liu@aspeedtech.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Dhananjay Phadke <dphadke@linux.microsoft.com>,
	Johnny Huang <johnny_huang@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: aspeed - Fix dma_unmap_sg() direction
Date: Fri,  5 Sep 2025 13:51:11 +0200
Message-ID: <20250905115112.26309-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_045323_399829_A2B49BC9 
X-CRM114-Status: GOOD (  13.06  )
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

It seems like everywhere in this file, when the request is not
bidirectional, req->src is mapped with DMA_TO_DEVICE and req->src is
mapped with DMA_FROM_DEVICE.

Fixes: 62f58b1637b7 ("crypto: aspeed - add HACE crypto driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/crypto/aspeed/aspeed-hace-crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace-crypto.c b/drivers/crypto/aspeed/aspeed-hace-crypto.c
index a72dfebc53ff..fa201dae1f81 100644
--- a/drivers/crypto/aspeed/aspeed-hace-crypto.c
+++ b/drivers/crypto/aspeed/aspeed-hace-crypto.c
@@ -346,7 +346,7 @@ static int aspeed_sk_start_sg(struct aspeed_hace_dev *hace_dev)
 
 	} else {
 		dma_unmap_sg(hace_dev->dev, req->dst, rctx->dst_nents,
-			     DMA_TO_DEVICE);
+			     DMA_FROM_DEVICE);
 		dma_unmap_sg(hace_dev->dev, req->src, rctx->src_nents,
 			     DMA_TO_DEVICE);
 	}
-- 
2.43.0


