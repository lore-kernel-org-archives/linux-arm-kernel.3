Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4E3CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 12:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLW4o8TqjSoRJfpkzpJagxw2FMUA9RfZJvxZztgDSlU=; b=iVfGEKC20FOHxNqToix/uSo72a
	0L61u93oh8y5R/9vdvtC7e+Cf9VcMyIwtSms1g4IRRbEgLWc4u7++UNP+Ewr4EQuTeWy9hSO/xxEh
	+U/uLibtNQ68halpNeM942a70N59agYHXRw6+xiJQ7ydULfGX+zlrRAalGH35/oBJ5qmkctMYhDNI
	cidw/pXllMnjNrUyyW+ptefQ0Lycs3d5SzSuKqGufcRctWQE85DeGCIWYC288dobBty1pNCAKbFdv
	sBYrq3gWMyqbPmcSi2a285tOqp1bs27K4Bah2758/Up5HsEekBxp5rE5Sd1Fac9LKeTGHrcBd3lKl
	cPYrvtZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ush1E-0000000A9Cj-1cnE;
	Sun, 31 Aug 2025 12:18:48 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgvt-0000000A8lS-40LH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 12:13:19 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-70deaa19d3cso32347026d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642396; x=1757247196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLW4o8TqjSoRJfpkzpJagxw2FMUA9RfZJvxZztgDSlU=;
        b=E2SgMqQ/cQMgaf8z9BdNirCZ09ZwOLXgbV/JKvbw5/OvqnrM+IecmTtbSd6DNaJn8l
         1SvOTjPPGfWqf1iNuiPFwyc4W5wNFRHV36+0mOkArhVsZwzrjFM9EoGR7Gp4j64jLpEp
         csaHxEGRFbsL0S6aKHId/kQaexXkPdGunWpEWql+fSry1JckCbcxYiCu0kLrYeerGatt
         6B2RQ7twvu81VdZY6N3thlcfmkguZZO3HZkF7Z7CHEdnkhO3ybnWVhFr0/Zd1I93aDnM
         k85G4zs6JO0icysaIl3D942JRD3BFxTmQ0X5nHMjGd7iL0AmQ9diYSm7/neNQVhdqnBr
         bdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642396; x=1757247196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLW4o8TqjSoRJfpkzpJagxw2FMUA9RfZJvxZztgDSlU=;
        b=hd7TDDGh5UygpzHGn4Y6HkcM6s2i4L9xO0ud/HqqPsXFP8qud1UJKucxnKMVTTnbdJ
         jfyqgxr3pNDBdlSiADgPJIrEUYHdRyGhugzRbN+JuMBt49rhfh9FIRhwnbY5jJo/t4NC
         UekGXtguQvpYts60mIVkpviyujPHLnkzbrV+6DS4S6UKUhZbRr0fqeV6quBy+OcywFN1
         RFpXwTCv6APJ0788b63bVnPT5H3LqTGlQKuQx0S9W5G6WberCQn9wkrrEichj2HK40nS
         VR5zG+Oee46bwvYxA+X2X5FXYZbNRmOOkwBrL/2fxjdoyLlcbl/lIKx8tb+RJ8tDB68s
         l+aw==
X-Forwarded-Encrypted: i=1; AJvYcCXfJJCIqtbT8FiYMWPxj7BWMNw3erHPuq2krDZEIfAmcFfbCl7heM3+sgs5mYHTvoNOKcH1HLkJQhXL3QtYD+nG@lists.infradead.org
X-Gm-Message-State: AOJu0YzTx+wJxpxWc9pIV68ZqOYazE+ieV+xM2Kknhc6El1X0PQYuE61
	4BeqIr1JYcOvsRS2VfD+E7OICmS7UEy6tx6BKbkx/MwLmhrYRFtqsPKlfl6IvHEoV6s=
X-Gm-Gg: ASbGncuHFoObXu7XOZogQSxvMPZPNqwflnKFDGG7THQ9DxMlKoA/TmI8Tx3tYHOgXkS
	0ehP/VrpNAwiVnWFO1yhkvVm3RFXd+mNLA1XHdlhJ6vPTROJroxDgSDxoJRnL0wPPA14w58CTcI
	VMHU1Tx06sTq3HZ/fSBClhnCcmbVnZYTyw6m5jBFXrQa3I0z3QzoqlHEBkvNtYoHI24KpdigNSu
	VVGN1u88kBcArfmEXOuvhKGd3JiJwik4KUOpl31x6lmPFQ2xvnzL3Nt5DKFk752YTjALz5UDB8S
	GXf+RvG4wpFi4hq6aoKdWaWpbTK2ElxthG8/rG0nwYSAAhOZzk9T/awdkkiMQX8bU42vctfw579
	vR+Ymb279BD3wQAzOhdWgof/qVdmDyHIBS6NfHFhLqA==
X-Google-Smtp-Source: AGHT+IFq/g3TQ+XqqlFDsxHEBxwygx3QkvDCpE4NZLqCGV+ZN7ZX0rbuA35IX+mulLiCxO9MFziuXA==
X-Received: by 2002:ad4:5ce7:0:b0:70d:dfac:f191 with SMTP id 6a1803df08f44-70fac73fb82mr54801356d6.16.1756642396475;
        Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 12:13:14 +0000
Subject: [PATCH v2 1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock
 ID for HSI0 block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v2-1-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=964;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=Y5ib2A821TGtO7Tso5IrBl4dNZg/AkkxdznejeB74+c=;
 b=zSaXZeYe/Hz8dpMJY0IGGqiUCvUC9X2v++PPU2nt4T5/ax+RG8q9r6kmZogQmtrX3FG5f5dc0
 FFrIl9UZnP7DuVn2PRKFg5/aeGZkRf76GZgDJZSiH5F5p7uZCxgGKbx
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_051317_995610_4988E39A 
X-CRM114-Status: GOOD (  11.27  )
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

Add the missing LHS_ACEL clock ID for the HSI0 block. This clock is
required for proper USB operation, as without it, USB connections fail
with errors like device descriptor read timeouts and address response
issues.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index c5c79e078f2f60fdb2c0f61ba6e7f3c6f2fbe9f2..c60f15503d5b18b11ca9bdce86466512dc933901 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -236,6 +236,7 @@
 #define CLK_GOUT_HSI0_VGEN_LITE_HSI0_CLK		20
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
+#define CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK		23
 
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER			1

-- 
2.50.1


