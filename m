Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E8FC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaAxKK1RdiX9Q5Rykt2k9FAZMFKWbpXqOP1fRVyJN0c=; b=XEjMBhg28lpeQah2UvUVdsq13W
	jkxigYBofAX/goPHziTQE1umM5Jzic30EArFrbOlXPelQMm8sbEcxhJNnj9Lj65QrQ2PJQ2cXeqZl
	/lhrw/VhvCpC3/nGlta47UTc9byy25rmFr0qKhXgn/SsqX8vhQqHAiW795wyRHgCuhALmR1yrY6xc
	R3JkYQH0gS/jRYaoW9PZSXboRT8M2ipYoogg3ob5ESbFMegKUSH+hb0GJGz93RRL1zYr/nIuK+eyd
	0MFSAUuKO4Ltz8JKvlCjgISPvnHHQjSXg74Pbx7Kk/1mVvSCCVdgn2fOG7q4P3+blmNNZkDy9SGJc
	vY8m/gow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUZd-00000001tco-27Io;
	Sun, 23 Mar 2025 23:17:45 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyk-00000001pAt-2nRA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:39 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac289147833so457751666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769577; x=1743374377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaAxKK1RdiX9Q5Rykt2k9FAZMFKWbpXqOP1fRVyJN0c=;
        b=jt1w1a7Ta5PAWkjxSggUn0kb9YVQqn7coKY9BJjBl4ya5SBrOAvDkZUV2AerSfj38H
         sWvKCT2stR6nb9jZGqRf/qqQp2GTUpQ+FIoYeJt9hSpviTCYQv90j6Ae85lSiVEIWKFY
         qGKkxUGZpbVDEOU0Hx8LHwA2/k6baEEzfyuEVxFkmsH+mLLGNKqSphjhuT0wWkCN8BGM
         61ONIcbHkLzA9p91vcyxmYl1qo4ZbCnxfCWpd7bYkaG5wjNshuyCFwsFg8piXcyq/cm1
         bbgNTbjRbmkZsslsVzHxGPkqz8TCSY39KTp8/EMgDTFSJ2yny5S655U+tbDLb9tF6NUL
         4CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769577; x=1743374377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaAxKK1RdiX9Q5Rykt2k9FAZMFKWbpXqOP1fRVyJN0c=;
        b=r4SJiagaPyFi9en+lBJXhRQ+LQJW1NPw+d4Ysy6zVk/QZnKaAJ0WZi5/Umgahc8B/1
         php9Io9i0xeElb1Ec4OVNxoX92neuUmv0boLmbj524q6kHKWa0htYgw98KB1JR5gw112
         9FuXDrmPH9L1IXnfA3wLpDIOy6yrttrpItZJPw4e81gebCzfLUycrdKflGZhEh5Bbtcg
         buXJKtcGIpU6xNKlxSXxKcoZ5G7WVhehCcMb9tr9ys5sBE07wWWvV0wUvWnnJ+JFcgip
         4zRKM7ak1Q2iNTYTda9BoIPde7Aae9PbekdqWhpnAG19kaKsGVaGc1xuf66XBA6Usuj1
         Po2g==
X-Forwarded-Encrypted: i=1; AJvYcCX1AXkuRVngItmMz5Mz/MWaChb1AtbS0TCUTFWUBalFv8np9QKklY+PA1GWPwaSPxyMYhVpMS2k0mMTdWN9brx2@lists.infradead.org
X-Gm-Message-State: AOJu0YxncWMVutOI5PCuezvIuxSji2XEJrhMEYOQugDiWDGyEpaP9HM5
	11kU2FLdQexlnEbRYl9X+dcYczlVekaS+O9Dm+ImjNz4FqIJuTQTVSR41VO4/wM=
X-Gm-Gg: ASbGnctPEmiPlEMdG53WKw+cxoXS3theRmSmoAqKX7g4+PCqBPqK8ev1a/d80TzbqZ4
	jQtSW+2brE5G88Lx1tLXn/SEKSrqx9+NWsJ9SphpTaXKYiSBgyuev4rUOux5plqpItKO0Cs0H0g
	WlSJtT+8ZT1djnKTEGVgjjWmjrFpT7So/Eoh0Dg4ia1xYg0WJ92KPoKJwbfxGcyFOky4tumTiPi
	ezDVCbUYcbl4riPubhwknxy0PlHTZLweuQsQ8evRT8x8iAo+Doa+PNWV26rpOlFY5PnrNmBJLRb
	/zG6I88Su+7TWxycIjRCFnc8H8Xhbh9yUqsL81VBD+7YdPnPjXPVcTuTnUqwd6o8tMHfuqMtFQq
	BN2r16Z1nz5UP1AudrqHGhJz7VSag
X-Google-Smtp-Source: AGHT+IEHAfiBfUB/nsPtj6YObLClfT3lIBDTn7g2B2otGsQqhwkiW+Sr35dDHIHATiseMaWDI7emPQ==
X-Received: by 2002:a17:906:d7cb:b0:ac4:5fd:6e29 with SMTP id a640c23a62f3a-ac405fd6eaamr641943466b.26.1742769577350;
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:39 +0000
Subject: [PATCH 23/34] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-23-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153938_736190_A4654C88 
X-CRM114-Status: GOOD (  12.66  )
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 90225b683fa083d4df7a20dfaa4f47084051e250..5ebc77d7edacbc1b7a3debb9069bb489109d57d7 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -139,7 +139,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.395.g12beb8f557-goog


