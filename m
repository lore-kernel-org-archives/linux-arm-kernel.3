Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163DDC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We79xSATZryd3PrxaJd1l/KZAbqX/U4R8F+x+ZK497k=; b=HIrU5TQd5294cQkPOlWVYObeFp
	/v+xzCXJ0skLo7uSHB5JF3AXxfj6QR4bXQgP0WHPciPtZnTEVoMgtaGPtwTLpL5V8hzABSsSiLzev
	eGzM8Ockb2lwOyxzTrKxa8N1gi32d3JSblEwHjXBVnRLk0aD//qGXdhtaEh0+J+E2m+MHT11Pw0nA
	QOOOD8qYG7o/A2iSB+lkfBmTPezPSYJfmpJUau7GpYGffDHlpgoRlgL531zE1xT/A9hA3R+UeIUuz
	BmQ8xvIKU2rqq5pEhuL7Pf6tLrhdUkRldQ0/kzVk3lL0m+j1JaZtkqXBQ+1kRPl0GN3ky0aI6ocjd
	MGjPJH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeL1-00000004Vin-40Qn;
	Mon, 09 Jun 2025 15:23:03 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdyk-00000004RRe-2asG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:00:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7426c44e014so3706781b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481202; x=1750086002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=We79xSATZryd3PrxaJd1l/KZAbqX/U4R8F+x+ZK497k=;
        b=aftUsTxmFEGUCifCGLMOA4TNc0a/hT5xxy8hh8XquNOFU5Ccvf8k+OtnB+7OJzgLom
         QMFekO0lEYp0YPHiAC2XCPf/lSIM3PNNNmXokvf09uaR7BkorbtE78WfqYq8aQPsAdb/
         ItxCW9I3zqVi2zO0vqe1PSGUS6G4lWBoNDgasvFhV9hGrh1UQKW7Q5ORu0HG0VGYLNlZ
         w+UVSGe9ETVnrZoTisw7iQUrAAOljGeevAngQCDsYRRsA9FdSPDTYyo5orO6BYmKxPjs
         NVIqCL6QvV/G+0PCAR1YgfMrZZKZYb1pfmXSKOm7aOtBLpMj+t0yY8MYM/Cg86MS9DjZ
         /GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481202; x=1750086002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We79xSATZryd3PrxaJd1l/KZAbqX/U4R8F+x+ZK497k=;
        b=gX+IzeN6lAGwBXh0h/BF3ltxVnL/a9dCeqiUocMQZCiZj69AGyqfx/kqf+9KU5eT9P
         AsFzS4znau+neQztxWo1PcqBstPveAhVchQLtn2BGutTIJsbyVtwOqMP1K9E/+bE7Bm9
         wzvfEhGnPX0uPH9GepBoInu0uqaQ/Fk8KYPLNtkuNJdk5HCJCR95r0vuRrlxMeKUNJAO
         GOOgFNoh317aiX3c2uZXTpv6rP/d/WUslYkTKCvmpqU5DZZHrOboa7e7CVsNN5AUtq/K
         GoejVa+9A8XlxJxULM9yqapwY7aQFuG5pKvEVu0AW+JPXUX/WWAILvpVaFzJDghMhk2R
         EPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH9dspOvT7YddeEv1xaUcBTIG5swdfbsLmAX0BOXgRDgqmCgVRnXBUfXUz5P1JLO7BN21JXMWC3AZKLaJBU2KU@lists.infradead.org
X-Gm-Message-State: AOJu0YyiSoAe4c6r3nwdFRfBL6i3lP8MQngy4EWsi83ehSn+apbEyXBt
	9xporYRxLXNmwLr50bmjzGO4ykbkakZ9KLqae0xagOSDcxz23Glcj8zM
X-Gm-Gg: ASbGncufTND9kpGh24+L+LSzJ+AgE4cZjHgi34FS9MnH159HU9KDzJ1R7/dFesLYOLq
	hoELmmCdNAgxrdfVU+1MrVQOk4irByqIE/LjA69STSfZicJPVdkizFKgfh/TSohcrlyW2yM266R
	m6JLvBeneb8gP+p0H3WJWkqoKS0Ua0TTahEoq6Rly/gfHU7eYs8Rd9+mKj/X3pIQyf0C8iCPCVs
	1UwtC8ChS0fEDJJY5Lf8VocTmcYGD16UCyZhuKmZJWh00mZmWXJ9FJZT5tXmvuJ3bRRl1Su/9XL
	SOYOTWi4Os0ezDAk5e9lZj/mHP2VjSX6Ui8MGqKGyuxsLVw3r8EKrm69JZwCuS4+
X-Google-Smtp-Source: AGHT+IGV2BGzzy6R/WMt4MsmQhW4tg+O2U+Kfqh52ETZGaR5pStKS0SKC3g3z0CgKS7hq4xQjozMAg==
X-Received: by 2002:a05:6a00:4605:b0:748:3a1a:ba86 with SMTP id d2e1a72fcca58-7483a1ad217mr10125395b3a.11.1749481202023;
        Mon, 09 Jun 2025 08:00:02 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:01 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:40 +0800
Subject: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=PV7pE5dMBWkFx+09DLMIQbO1nXOreHSRyJXi4QVzwpg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbrSXzpPSc4U1Y/S7t3cPsOVs/amNx26hwSC
 75fHAZry1mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb26wAKCRABygi3psUI
 JIDMEACtoNdBzyO/GML08ZRArDDdSgEyneMLwlJDBB8tfUOL8HgSVn0uDhK8i2+T3FtlNaKLCr+
 98Yevr4qNVc1xGwqjlbu08du5erfEiO8hPxiYob9zpbWr0RBekkKyGTj9ZHL1sd33xZKqEXGIJm
 oaV4B8L94MTsr2LHCqiY1yzY7EFjlLbgkfS9I3apVSst/9xdg9Y4+myUMPD00tO7Ca8NiM1XZ7W
 t35Z1vGSM2BsAlh/p6UJ3fQMqlE0+OnAEC1c4EGqo7oKYeQQDGqT7P8R65nQsVK5rt3yZJYnrmf
 6SodzMx0yiTPYx6ag3Xzo6kEsS211aDSZbeUp5Xo3KBjKogz3jngtz9hs6ZJGcF+KHUscdvpwPJ
 tEPklT4+Xl6sfDE/VZMSnkGXjGzNmTp76NIBgcPmsUrI4P6u5XkgvtTe5RL3QwqgeFTkkS3VLVp
 pB6Ua5eDtEGc1V3Syj9w1F0qeIXg6sEEcVK6lEp1wlkIemlHE92zJAmcZwDLaytBAxxa/fe0O0B
 chCB+X9P9u9dCnXXH6wkVX8k2zDVOxbOuVZxZf79fdlBzWdGrnVgu6dsQFaPBqj/5ZY2pcQVrTX
 KbpL1Hzadb5WV7oNSt5O7z2NOvrHCCFDPEem5oIhDBOspPXvHitN6Cxmh0HB8+SPaWd1c8kAUh+
 7QPNvOF3YH1z2cw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_080002_664757_94ACA603 
X-CRM114-Status: GOOD (  10.60  )
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

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver so add their compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 16bd7eb2b7af2c0b176f0e5b1970f4670af691da..e3aa248c0326c36bb0307e8aad4025b1bc05540a 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,6 +18,8 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,t8012-spmi
+          - apple,t8015-spmi
           - apple,t8103-spmi
           - apple,t6000-spmi
           - apple,t8112-spmi

-- 
2.49.0


