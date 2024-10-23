Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01642D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bO/K5p2U79DXHc4kK88A/9gpCaRB2v4NPByU1GBG/GA=; b=fCY/VNsfwdN+6r7AI9Jm31Rejk
	GC4UUF3EVf0jLOlBWx6CdPPaX/P256dtmmdZyxlyvO9Y/GH8S0FC8VgB+NJJg93oKpI2l9RQgFGeZ
	GVnl4d5naxgYOUxfChqdLxSZQJynmFQwTM7cwXEXj4Rb2iCnIIKN10BB9Y6Ckv6x/ssQpbbSRK3Hf
	izamFIXuuXuJvRdPOUrPKwLQg5q6DTF+ddYdG72MNhHskm8PFZjdyphJvt4crWIDzgQ+/zmW6jbFj
	rRAolqh4N3+5pf4qhn9At4xkugpsX7RZXHceybthoISo64rlMOUKpbmXJ83yBDUywWO+vAw9ZJ6JT
	UpROPznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k2V-0000000G7yY-3Rra;
	Wed, 23 Oct 2024 22:41:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jya-0000000G6vN-2WSX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:14 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so305834a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723031; x=1730327831; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO/K5p2U79DXHc4kK88A/9gpCaRB2v4NPByU1GBG/GA=;
        b=BEiD/JD9Kuakk329xUcwTXgB/NJ4fSJAIHtIazjYP2S3ucJcotmAO7+MG027bvDuFO
         qrZzZvlAgBqmMZERN9O6TC+RyfMRER7/AusdemU60cSzugsTfuCasnZYSu4ClX5lGTXw
         r67OU3jMUSN9Iye1GlCxn2r93YpNGdCctcfxcXVODrb/pD1Uj+9jc0fkqCxkhQ2shTc/
         74kqyMkAvuBiBLyUg0O6VLksZu/+USfZEp1VgnTa4uIKMgd8lClDcM+fjBdGCajI2TAW
         CtktOqQG9gbV+B1krPEzZYrDVTY6Of5M+DPwipEAToEUdoKY6ytfgErT1KvakZdkjpVK
         TXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723031; x=1730327831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bO/K5p2U79DXHc4kK88A/9gpCaRB2v4NPByU1GBG/GA=;
        b=LghESnjwmnkbvhvzCQa6lWu5tMobFxLE4BNm0bPSC28jJmgUdXrqMIU61TNIYcrWdi
         I63edR5q2mayNsamoWLl7OSiQFpw15OKbiKUxrsgBymAGZ8MZ4+V6AhGtW7WH2ULPTT8
         lTqYOj7Bic/6O584gzzyCRkx/GFOWJ4n/J0lDJEWtdi0IExqR/pVgyrbuDUR6bQ1qV9q
         mxGxdmW2AK03upWsU1SIbhlYor4LScued5ykQ3kLCN3NEsfHzUmSo/05n927n2mukFvb
         AvKWTALrzxd1eveiDzdTn4EJivqeCFnHw/L6eTP9Wmerr4zWDiYN9CRRdCPl1bWM7MMk
         n7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXCEe0V3QweRHmCwfcavgIlCsmH8TLN/hJu9skGypGY633PvLnf3eD50jhhVkVMZLQmUJ5l39ON8k6QtkwbFRB5@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFwuKiARwdfhsY+rwZMXSp7as4oj/AhNL3gFgL8VBdq9Rza76
	7PoxbWu0PCQtK9bb/cOFsCvNMmDh7J9lzIvQDa9H+pI1rtXAqiI9KXuRi9heFec=
X-Google-Smtp-Source: AGHT+IHZ+CYrvvrmQ3EnjgCZuEiiFDsrR82CvffNC6GtUW3LFHdSI6lk1bq+RP4M7Wm7F7Ps69Xeow==
X-Received: by 2002:a05:6402:1d54:b0:5c2:1910:8e9 with SMTP id 4fb4d7f45d1cf-5cb8b1d4805mr3609100a12.36.1729723030569;
        Wed, 23 Oct 2024 15:37:10 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:10 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:32 +0300
Subject: [PATCH 01/12] dt-bindings: arm: cpus: Add Samsung Mongoose M3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-1-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=802;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=cpG1Nx29J0gY4AO1qRA6fivGN9PyoSNxFoCRX2mvL9M=;
 b=m5ysXeGvP3WFcvSyvufc5GtOAnXmpcUQhaI+zq4ak1zxFK7mGCZlwPuAqgREGIBz9XATuLsvs
 YLA1xWVCU0yCGIxbYyFJDit4Mi82TVZOPXKQXwpSMMVtI24cnw4/+jI
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153712_704618_36EE2238 
X-CRM114-Status: UNSURE (   9.95  )
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

Add the compatible for Samsung Mongoose M3 CPU core to the schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7efcbbfe73e5a63fd2f61d1e010d29..2fa7d3513da839ddfb2844628b1249567226a025 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m3
       - samsung,mongoose-m5
 
   enable-method:

-- 
2.46.2


