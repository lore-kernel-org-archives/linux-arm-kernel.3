Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F293ECCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPmKs28lkpvHoRqiGTUvXenyc4ndbMqG/sODnZUvqnA=; b=zBq3PTW8nkzzUwme4NA+R6glY1
	q2kqHoawkFHoIZy1W9WUfcDH26SuCd5zFenKEdwqc9jKvB0pk04U6QmKFtf8MnZuRo/iFbTXyqSfe
	sFcO+a1N0K16znRxRb2QBt5H/4pprlVabsQxLK6U4FSeQHh9z9xzXMkI5/VdOeqW+zXNE+UV2z3L3
	93yiEj0YQ8gsl+h8wreN9W8xPUn2v/P+rc4pn3TMpDPK1rX6nr2dpG0n5QzfCAOQ7tpQfHj919rFh
	LJ9vNLLLuaHoQz9W7Y05J1KJwYZvSxn/qJ3mh7R4CmchtqFki/NeeqEDDhlJh9zU6aiBgKK2chqU5
	O9qUxVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEog1-000000067Y6-3Loh;
	Fri, 31 Oct 2025 12:56:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofu-000000067Qp-30t7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47112a73785so16237415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915373; x=1762520173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPmKs28lkpvHoRqiGTUvXenyc4ndbMqG/sODnZUvqnA=;
        b=tXOoPP2xe94tnTTlttsGXPo4XGpxgnSRH3E878pPMPRzMRlmgvYgVLMar55hTh3sVC
         2+7eXjcmQf2pR11XOWpqLSElHEGkOMjyJbpavawIMjuwMD8LTEYGFefCAdwFUSd4Rm9N
         sqXf366MIVfYoZEBeBYomqFxztspEyPahuhHMrcGbbcJcXvb1PORpQUvqigOnwrDkUc5
         kTSia74P1B+/AJsmgAElORuRpq73K6P+t5AaI3p49HtGy6QjgZmehQWMo4i+Z7v//CyQ
         oNIN1jL41DGIDXnxBnf9Gh7pysNp40UV6PsO+PN3YLUkXuv6RyBOjBtsfccHkkwNScxg
         PsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915373; x=1762520173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPmKs28lkpvHoRqiGTUvXenyc4ndbMqG/sODnZUvqnA=;
        b=KZaFhuvvSXvFkYOxqJdcP1emfmXdiL3PBzvGZIWJxifuO6IGfYthdMtmya8OeKCC1X
         EQCJAj9YJuuMBuqd9m/ysf3t1/0XEf67ciLy8rUXALYK4xdMsMw3d4Aa9ejo91SiJ7nl
         3jin0MtZyXbKALe/52HPDj93G5JDVfHbI8ol9epevvb7bkvDbc/5700xCqzdI8WtogUH
         Q62GiaMc1DG3GT2O8spVmCxhrcRMHOLMJPGMygmP9U4Fg7Gyzcc9g628ovhy2hfCekAh
         dGwrQWqM1hXAbh1IRrXSAdN5tpX9O5aOXo3dXRr0v5SFHjzf6hMw9HW0bfLvGYQTPO+y
         ZtuA==
X-Forwarded-Encrypted: i=1; AJvYcCVSPzDAjE5RgcO1oRC3VLTgQJAxLz2JEfkXeI7yXymYlNskaRQIHBUF6HKu0Ib9Z29dOZBuDlbX7dp6drJIP2Sx@lists.infradead.org
X-Gm-Message-State: AOJu0YxaT1l/hbAaQFZSCMc7hwGb80IQnP3IlMRt7ldDh4beb9u9hzT5
	swynqA7cODJFKR4IWe9OoQdWptMqG+j7D3Jg6FGoOu/j/hDvgve4Qdm9x8bstXPRDjk=
X-Gm-Gg: ASbGncvRAWe9Si1VyxQUUsL4oyA4kefZ9BDLKHTprzeIhFh1Xxcs1e+DsFiyel89Rze
	samZu1/qFfMnjdvS22n1AKY2jQTmoU6xJJnVA1PEqEvDeETMr+670LRmMt4XnyI9tCPfvA/1a/j
	i54pUraAgOnNzG6qV3Id8bIESPE2776U/GhPJgZ37JGIwnvbQPH0cejWaj3rhRgaTPcPo1nK+el
	BXPO8mGI7Fg2lcEsdNJ8aUVWhwd13AKoz9Y5txdcFRTkeeiw718UouseZoHL7uLUME2uQqN2z5P
	hMfHgSKKIVzYcZVJE+jDgzfU2fOLWGbLvNxmst6FhFdAiaVuv5E2TeSMhKHI6kL6lF2JbGP6+Pn
	YNyrhVvTTC/vkM8UMiV0nGp08BBV/K2gKiZ/SVeyGaqZsMjJdGANuHu4si82gqbbjV9RidcTko9
	xM3BWroC2yqBIwM4DDCZbpF+H6wNXZDU/YfPTSjGTc5x/QHYTZlSPQxXkwMGh/U0g=
X-Google-Smtp-Source: AGHT+IEgFt2drlICBdE8c15ZSdRAo3YhHP301vNjyBeBb0HaK8c5JkyxDlcHps+bf8XyCx+ZBmNPVQ==
X-Received: by 2002:a05:600c:538e:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47730890e99mr33964965e9.32.1761915372724;
        Fri, 31 Oct 2025 05:56:12 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:12 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:10 +0000
Subject: [PATCH 11/11] arm64: defconfig: enable Samsung Exynos chipid
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-11-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=829;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=SNitQ6iR1OrWkD+1kTT2otCfVrWRB5Aki2fWLfOjKbs=;
 b=tiltm92a6lWnlNHMGe7UFecCrk/97yelVtT3Nd5y3c3b6toA4eFvJ9l/AoAY69Wscue1C6ZYq
 vOAuVToq/TGCmsCXChXNd7/Jjdxd10s8Y2Ky3SlZlKDxTR1t/jGCqZq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055614_780885_513F6FCE 
X-CRM114-Status: UNSURE (   9.06  )
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

The Samsung Exynos chipid driver provides SoC information to userspace
using the standard soc interface. Enable this to allow certain user
space tools to acquire this information.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 646097e94efe7f1a18fb59d5b6dfc6268be91383..cf1a548034d28db201bab0d48b838b4136dbb59c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1530,6 +1530,7 @@ CONFIG_QCOM_APR=m
 CONFIG_QCOM_ICC_BWMON=m
 CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
+CONFIG_EXYNOS_CHIPID=m
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y

-- 
2.51.1.930.gacf6e81ea2-goog


