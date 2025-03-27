Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z/jDuhjhyd1JpWgs6WS+2WUmAmbmIAQ7hooBmpGTW8=; b=A9ojeSG75FOzr6d1f4K63TDsl8
	/A+PBjOxOtb15TAFpWmO1nviw1UkmvjH9LJTfTu1FjJUO26FYn5FTXXDijude02BweOjqzAS6pMbW
	fcgx3nB6EcY8ofH10ixS/Wfddja86uY/snNez+ehe1Lb+G9kCNN6h8CIB0strEpFGt3smLNA9NreU
	38V6JDLl/6cM6SOW+cpLY1C5/j2txvzQLng9qMEeOqAVHivUajFEn12CCV24VbJybJSnPXk6iv65w
	FRzpEqhpHH+whpzGpWLeJi5eSu/w4jZ3LAfy8ekX/jNSL3jFD4xGBiVybyq6g8KWCR0SmvrSTpHfp
	ccopXBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmo7-0000000AzhY-3tXu;
	Thu, 27 Mar 2025 12:58:03 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txmkh-0000000Ayzb-1W2s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 12:54:32 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so1775804a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743080069; x=1743684869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Z/jDuhjhyd1JpWgs6WS+2WUmAmbmIAQ7hooBmpGTW8=;
        b=wvFedb72arQCgCbpi4zAWnQA5NQgewcfhx1mcQffItWAnBv8d+zHh8jS23DIJNBEtW
         adf3+3BgM9E379MkkvM9GgSnmtEnJcXHwZt6AGpKxPSp2khK/aGcUc+yt+xb9LkgpO8x
         lImOOIko+zBxdoz3grdzaag0c/9kOYlQ9I7BNMMAqC32YxtNrY50p021yKUgzyfW2y4C
         xesmuwotKN9ikNqkQWcnMb8isytzKhHL2y2Qlow4751BkpYLZA/ZwfZbQYCheuLRrbeI
         YeujG73X44ASdxkDxfCR0/tCjaciqWLbzC1TNEjMpZd5p9Xw0UTXQ03ULqrbMKSw28L3
         +B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080069; x=1743684869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Z/jDuhjhyd1JpWgs6WS+2WUmAmbmIAQ7hooBmpGTW8=;
        b=L4VOmaEkNDjz9JKjUSBUaa/aam1wPXpN7VzBnShojpeckCPPpIJbxyzLtMvs59sHCZ
         i4x7O+CKT9LpmJXloVDmz7ACknskvGF0p0tqNc5Rn1nySLe6bPjUwhXn6xrB9A6+5J64
         XQvRMrf/AvlTjjV+gSnVs6k4BrHypFP03VpFwM54VCO8pohbC7NqVvN8wdi1IKn6bIvC
         b5uXEh5Pd4shUBX/6MhhwtojKWbT64dg1AXBf7roXLJFaNLm62bDwQWmCoVdv437cuvy
         ZZvtm+Xrv/PH33egSnnmgYjB6AenrMaFuvI8nYv16xMuFYAPM5Dncq1Y9HiZVuHM+BOE
         iAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYcDM5MA9eoo4DO8++OvKF7mi64a26XBG7hdK2S0hCBq9LSRUwQXFt7zouy05tPdCSmA/PSZXHa3EV+TlHoIwh@lists.infradead.org
X-Gm-Message-State: AOJu0YxWBWRY82MNuVFIpM9q8Bf250V83FEYpIsYR1XT00z2qs1Jt7Pa
	UqTafDlskSwvsTbvGwrCtWAa6Pph2wZDPnqjJ/cIsrt+Bpdy0Nh6MqUkHh6sfbo=
X-Gm-Gg: ASbGnctNJzD3Ivv+QlKhYleQf9XY6KZq3pOvNKH9LlEWiPqEsfceieVJI/vApBuSE4M
	7Ak1DO69uQbTj/E7//sEbS/jNGrCksLzfvChFUZmL5k2AIoOyr/pUYR9rskZqgB7Ha5ndNgTxHt
	td/MnexRuSYfpaq0rSnQNvBa9PWIuVKX4+SNxEEetQX8fj+l2Bh6I7rO1IW4FAiW+827CwqkMJM
	uD2BGYkxJG49G5bw2X/cI+TifQuiUvbqBrRV0wFoxuO65CmEeFfIaI+mcCLIQNESTza77ogi4ez
	NbcHYW6+eRDjEA7QjzvCjlnAtoj/iLW6WmVo1uJaCrpEftXQyGbdxKgQ4yn1e5i+VlmPSgq+q6l
	ePbSKsxCy77DLpQ4CKUI2CwL54DVD
X-Google-Smtp-Source: AGHT+IEXg6o4yUFie+ryQdY3mXcS5e/X89zhbbzwruTHODYlp1URcLQKOWy0BfUyFCsrxe3Lm/Qyhg==
X-Received: by 2002:a17:907:9446:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ac6fb1444e7mr264757666b.48.1743080069187;
        Thu, 27 Mar 2025 05:54:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47e9dsm1205410266b.167.2025.03.27.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:54:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 27 Mar 2025 12:54:27 +0000
Subject: [PATCH 1/2] firmware: exynos-acpm: populate devices from device
 tree data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-acpm-children-v1-1-0afe15ee2ff7@linaro.org>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
In-Reply-To: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_055431_399009_41B0EFF6 
X-CRM114-Status: GOOD (  11.48  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>

ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
ACPM interface. Populate children platform_devices from device tree.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 04c73692383b17ace33e95ce9534101bc68f089e..7873cdda127e4f1b6b2febccd054ba27aeaf9b28 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -633,7 +633,7 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
-	return 0;
+	return devm_of_platform_populate(dev);
 }
 
 /**

-- 
2.49.0.472.ge94155a9ec-goog


