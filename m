Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C906EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=; b=tb9pJgjkryirk37M/bqa/mu1Kx
	qHLtJM4FJRndwcTsNt+/ytZivq30eq3qUr7WrDo561rwBixwHn4A2JTkj3oz5HvreSZ0eXZG8K9RK
	5cfYkFj1uJ3/fW3OfAaCAgK19/zTlDF5yM+kauKzCKIxovdqVDzMe310v3Gk9L+e1ACRrjWvqC9Gm
	4DZAwjyrsHWz6D+Z+15OMsUKkNRvkSrUNDKwgNsN5vY6jthBOMfltqbAjIZik0VMRKkHrnAAVfvxj
	H2siWZFtrq/iKhZrjv3h0IvQ2k1E8Qiomjh/ANRKh3LiC6cmqMCrLHSsy0neLfJoIh4goAp6eyE3B
	HCsPUiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyA9p-0000000DVQV-05sD;
	Fri, 28 Mar 2025 13:54:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nY-0000000DQgQ-3OUj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:03 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so3460711a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=PzXQaRAuVISTG6PAmxOS+daYCqdBSsr+ZgjOwJ05SlTtfh5ErqQQMPQK/+utWQxClH
         C+tXIcE1ADDFwdQ7Y4ckyS/PeDZjIiGPa9UTqurjwiIHA2MA4uJ2Dv2DgmcigIGf5epa
         pNYBgxCeiUCxDmpseH1PJxjfJB3X3j+loVOz1iyOJVn6Vck5lfKXqOSmhjb7Vt4j8BMX
         SETGoyBQCN2r6WdV7ics5JZ/4uVLL8siYqqJl2NLIMJaRk0jLAOHzqR9vIG3cEj5mrpI
         5tXNjvHpsrG8eBq3KLkX377e9wef7UhAEilE1HDvZzeb32LDKaH4smpK+pSLjGAfxxbl
         I3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=K6NvJuREV99bBc7rylRRNNH+/rjdhdZ8FxXRjHTBh59vtnO7IIhvN9gFCifcdPHRgN
         hK01NjAMQfOiB9dmzaUz39pA7tDCmczITDvqTzOKrhd9NqXJkbpP6WQ/dKqL2VnX6kz3
         eDBUk9v2/9rmbiVwbcZ9V3Kp+2QpFFSs0g6HxZP/VCZqKPPF/xwFsbzHsw5+Ld7bQI/E
         mJhS5r0cN4CTrEK6YS7oQQWsvEmhFU7kk0u0x40HJyZ+JsybbUkkqA3u9vgleIsnsaIx
         tMzXgLKW8c1jcOMVaVBeyGRhejf5ADW9vUFSZL0D+LcB1qyAjaoGNiqPFs4Q9AHn6zx8
         x8fg==
X-Forwarded-Encrypted: i=1; AJvYcCX+uM1Jp0PVpOLcUnn5A6fQ//8DCIDcVwWCDidjPX0+2dW3b7aB7Iej3Sz3XUJIzfwV3e/XC5ok07/HrjUOyv4p@lists.infradead.org
X-Gm-Message-State: AOJu0YwNhRRdgbFeOjo2fxthm7ambR53XbLNcVJZ3ggKQnGr6DHLRPQ0
	MSPQpxvpjt4omWY6Ea2WIfuRHuQpJHP7JRW6CGLfpymc4pdTFDdlk4QGRlWYsoM=
X-Gm-Gg: ASbGnctLEoPpCyJmDgN1WG/QhH9vFH6YX65V1DyLm0jGmlW0yclp8aHDeD5sQOIvP7Y
	Br/gS2JftKCr6C9aEiWstyNn+UOfHYGKwptrxA/oFTvTjmSj/9JBxclN0/EI8kzuktVRaAN1p6C
	TKbl+IMxaXByWZHJFWVQ5IPaqyEBO6Y65lFQAiBLB0UbgF7zYroZt9XxnyXHmkC1r8OgiCbJ5m5
	BycbZNSfZMTPdQYfrSTbZ6sPP91aMKpWM+HcQGh9U+3mpu34vMx6LaS6sCeRVzs3A3R8Phn1UjO
	a29B5G+54GZpIlycY+vPo3M6FIq9pLXsgCuB24ScrzbP7N/rWmHtfMzSBEDP4dP1Jv/fdgmfrdW
	PfVERPoEt1EnhJWSwhk1qou7q9zNz
X-Google-Smtp-Source: AGHT+IHY77zJB2+ZvJcaGKZHiHxoVE2X4zdszR83ffWy9ORQ0cPQA29Aq9xL4S7dGRJozxmx6Qfd9w==
X-Received: by 2002:a05:6402:3554:b0:5ec:96a6:e1cd with SMTP id 4fb4d7f45d1cf-5ed8e061508mr6757044a12.2.1743168659356;
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:57 +0000
Subject: [PATCH v2 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-11-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063100_847640_6FDAD86C 
X-CRM114-Status: GOOD (  11.67  )
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

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog


