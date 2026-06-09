Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D079CD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=; b=v3+41HAn0YB2881X2bA+ts08Tz
	5nlFYgIVLfQJAmLgC60FqKu1ZS8o0BePv5Odgn9i+nZr62NtEilPaKu/ejOzo/kW8AIJG83cV1SWV
	xs3rJY5oiVTzs9SMKtnFn67NkGUTKq3qsBXMvbdmWmM7GEk5Um2aXXrlQq1vc9cQHWvPBhewCVGw+
	ztnkLPP40Jh5D4Q30GNlKfZHm/W5tva9a0gKp+NYWugFTIuI7RSrSHsAjF5InkPsDKuASqDaIdmgO
	2N4BKeXIktxuZFlYSB6HWjRtAKTg2GjKc/0Z2x5uJgK8jv/RsWOoS1vOZ6VGnlbWu1T7FNwheqseL
	3KBAWhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QR-000000068P5-1eD5;
	Tue, 09 Jun 2026 17:39:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0QN-000000068LN-1tqM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:39:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b3e03939so48870735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026777; x=1781631577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=OGnmgPngsyatCnya1unxLAFVN+AVGKyT3TaIt1INlaM/qAW+zPdt4LX8E3M16gbCSX
         7KZo3e6FXb+Nm+RZrZWoyOjeRIiP58W8XlFbUmKu+at2zwSrTdeQla0HXgGqB72yAB6h
         xqAMwZs7QCxFbPme3XeaEsDKm5xewhpARdtK7F+4HV6/KBGLIfgEy8G1TM6XTYzLoTO3
         +jlaFTAlNO2DpayMcOlkmHYgVjK574Muf2fab59UHLjs3q1TU0S4wxvJRD6jCdiNvQ2l
         GjU+aHMnfTZEnA2VkEkb4UTZOLWwqTexg9qv8Ku5heBRX7+VdQwHm9azmCx7vwxEXRIB
         0QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026777; x=1781631577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYtiwDmtrVbl/hGmqfQch4eP6KggQ9xHSeI/NuJ3fwM=;
        b=NZbgaTBuADulIU+raMI3dJgTZpKelYCliXMYEZ0TvVJlmUaqtR4VOllqemyfVa46p7
         +8WzTiOMnlKGd6xqwKUIkVROp7UYrUzIi5cen6IzwJOrET/Q9zaVeJMbzo85Kr9VKJkZ
         PuXBSg2lYODm2aBftETUB2nCPZVwuQxSCkqeVY525wMLHPdLBNs+8ZIQiwoiDFfTbkY7
         perOgASxf09m4l9tCHXUVfbRXAXAeabSHoLr5MKXItxgFIGniSuPXh3UOKOk+i9QX6GS
         Cqq3y/Po41F7V0f7XXFIWUyTL20mm36ss1jHs0RHuOQhi2iZku8HfC3lhreAwpcbqXBf
         R+og==
X-Forwarded-Encrypted: i=1; AFNElJ8TwDhgBZnzcehZB15bmFYfRik4EN02bu0ObOJAjdwEwG7yeLMZGfK7Ipn5I4wx2FTK+dYZ4ZB4P356g0cYrtQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YwLtb5cTXPbRxyVB0AOwUtWjIIa4gRBGVz6J/d3MXyuvxI68aRM
	Nh3s96e304hRbHERaB+C7UmPuDWv+1QsoVqxwXq8IFOZGvdwXQm7PXFyUJodXRXIQ4Y=
X-Gm-Gg: Acq92OErxtVScnMET/3hWEhzW3f3eRD3+i1urgWbcxem618kZok8YUtwY+hDlyawxhh
	ozs3qfTqH+Sq+etxTApSm6q5sG6iq7FJyajUReUUYko36yN0UuDU5GHgrUQAddBlTJDl7eO/kz9
	LC7t1ABb/9OnV6xCZrSguYv/hLcWsxZvCtx3Iy+mj+0AqF2E33XfhBnGBQqtvDe4na4iyxtvotI
	CdurBo81wAdSSVSLbmeH9XKRLSSa6vraZSwbuSaLan/7B5gn2GenjSeDcrkCSJNBLLgNrzDQfRp
	qf7RWP+ehwGeazxzYatsEHiLjZo67qKQ3OKZyCtnq/AZsLCXY5FMs04gvWJBF09CDaUQ885jizV
	CRneVybGB9/49BpGiFPKhsDS7MDf5vruE1vLOQrT973o6idUhvF1f6BsNer+w+ykZLhj7RRLap0
	+2Xhotb5WpC/T0+dLMtjiG3LNOCM2TfTv+o8L/FSUIkEaCpJToLWwPSsNSQNmn9Nnb371b9UBT7
	oOmpIOier8YoNLvN7keuNKemfjMvcNFDFaKQA==
X-Received: by 2002:a05:600c:1c29:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490c2ceb6f6mr309457655e9.8.1781026777516;
        Tue, 09 Jun 2026 10:39:37 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:37 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:27 +0100
Subject: [PATCH v5 5/6] MAINTAINERS: add Exynos850 PMU entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-5-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103939_652549_41D589B2 
X-CRM114-Status: UNSURE (   8.69  )
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

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 498ca30a00c5..60c25fed8ffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0


