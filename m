Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B9AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rRs3uWiyY/mmy9tnZPMQQhl+KBtI48hCPbm64UgfZtU=; b=BfQvYpB3slxqQg
	BSiRxWt3ElpvAYIAhUF+7sQE3P6MqdRx3mMQLS3pidx3dxZGEay8kwoEjf5iX75op/wu48co4JwtL
	MqNdPE4SjDweZ/vMeEeLZCD6OsEeHusZa9klPXtrDP6ExCRPndDE1iTX0KLxlDOb8kvDcuoODgT48
	cCDrHIVtTDgysVjxlF3EB7JzKfESRdHhhPiQ7tO3QB5LyxEdJqdMGQ74qKl++ukJzsybQnSfzt0tg
	mq9F1oQGys9kFnU35Z5SLrKc9SmlH0NNqCyxVMMBqZcQGHd73qUzDVWDHHZtGBc/5JSANS5jo0KFz
	qSf3MLC/4/FhgMfKMqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt79f-0000000EbRe-2msp;
	Fri, 14 Mar 2025 15:40:59 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt773-0000000EavW-0bF9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:38:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1894016f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741966695; x=1742571495; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRs3uWiyY/mmy9tnZPMQQhl+KBtI48hCPbm64UgfZtU=;
        b=Ou4SNYjWy8pzfy2R6UY4QL7QNgrdkIaG/rN28/jd6yLXwQYkRQNKMByAquQmYyca0X
         BMDFkd+0koL0d3mT2neLTgQ3/x1SAUJEZbvVtADIgEiEIGmKLlsXlksM8qTA7N8JdBBh
         oRuOyqRyuO4XlEDzEpwpS1PyojJAuT6vTNOHT6fnXp2s4zx52XoDcUCgsAJw9JCQf6uG
         Y3RVZXGTQymdvsLiy7GNWsQNTLkyq6RYDx0HVYeKnvpKGn0vyn6odVTlj8Oc+zi6Pg+D
         Piq1GNTrUjpHif10G69kxesPYHFOol6Pr5dJdQ4HrG+Wxxg+TsEOjYYQBXIUBubtBYiq
         CqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966695; x=1742571495;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRs3uWiyY/mmy9tnZPMQQhl+KBtI48hCPbm64UgfZtU=;
        b=U+XXeE/lg8JPFtngu71DWWRcOw2HmtKFschhyqbh+lhL6sOpxnMl9z77oxtTjWK8k/
         3WwH4aT7j1N2HELxX6AS210OTHXiRdpjUEmG8uSZfFLfIKY1uGBtLrY7RqCbIVnHAlby
         Llw676q8/uhPelJc8duTnKbe7D5aA656W0cTMWqZ2LhGqswAjFYCyc5vOxdGhYm/fipA
         hy7J+DguHLI9O6ngTX7CjRnrjU2FzKaFzDQhN5idLXkWICEgWaLWr9spraqSsrvWJG2T
         K8xdrEbBB1qaGux2ZrxaNeqkaN+gLTgKO7FFHfOiB6Pel3uV8A065fE/IjUNQxtZ8Jsx
         26sw==
X-Forwarded-Encrypted: i=1; AJvYcCUp6hO4PVt4T0cREMvF71N+DY++tyGHAIjimurpWZVhVUu6k+xsjABVjd+GIbgEfScYGrefHA9a3w/7aQC0d/Ee@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn+lJCUPqlGzfRsiShobBZqEpmsvErm1s23AbMqF9jW8+x0d/t
	Kklgmv+27/mjZu2sbKJltGTM4yIyhkANawx9nZ+T/6Nresir7VBQJbwszU29gO0=
X-Gm-Gg: ASbGnctucMKYS6FvEcPzBRknRE4TsRgT2Rr2njBhoItZb50Cu7pO07dkEbGZwApN5CC
	xfDZksAfsiMfszdsJm5EadFT3G1SnHD18qGADBdEFWJS7I2GZYLhpNxGC+L+SrElmj7XJi/l5hT
	LA8CtryeMMoaCHf+/ROjE86F5UMfsJwRCmM6ol584LiQ0b5ZrsQuZGTU4/RoZ4fUNlaZszpjp37
	xisTiM5hWK7ESqxUFmWLpl1L8qUkCOue5tp1ht8Dxzp/x7bbkHO6JYZk+mjQ1DkuTYBqebf/w7l
	d9FgUBtSXjhbs2/gmxTXzduEkXKtElt52OE/ZgEwNxOq3dNH1s9P3O7am7i4XLvm13SXk65phRk
	lsKYwnA2/I8w=
X-Google-Smtp-Source: AGHT+IFwuWplOyRsVTnwWP9hDzjpPB2Fz832AbMy5akm4Qo/B37yxprGTMiWIsI8eBrUb37930ldcw==
X-Received: by 2002:a05:6000:1a85:b0:390:f902:f961 with SMTP id ffacd0b85a97d-3971ef3a523mr3576489f8f.45.1741966695091;
        Fri, 14 Mar 2025 08:38:15 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm5944388f8f.62.2025.03.14.08.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:38:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Add dma-coherent for gs101 UFS dt node
Date: Fri, 14 Mar 2025 15:38:01 +0000
Message-Id: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFlN1GcC/x3MTQqAIBBA4avErBsws9+rRAvRsWaRhVYE0t2Tl
 t/ivQSRAlOEsUgQ6ObIu8+oygLMqv1CyDYbpJCNqCuFl4toN41mXymQP3HohZOq7dpBWMjZEcj
 x8y+n+X0/4DkMHmIAAAA=
X-Change-ID: 20250314-ufs-dma-coherent-980f2467690d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, kernel-team@android.com, 
 willmcvicker@google.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=o5lWvEifxc0qjQ0Mf/yS+nQ6Yi9AnPndoKFhVA2M9Yw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn1E1kE5cKvQLvj5p+5qVAv9trKYfZ8ei16ff+B
 z9YeJd+wl+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9RNZAAKCRDO6LjWAjRy
 uq9UD/47wDnkd+uHDPcz0khALhZQzKJVJn2IE2m2IexznRG9WHqTq0nvONALdAhgP6iOR95GzTk
 buhR+wkbwEMJCLy4Xu21/WQFe08H40eZtljBwKUa6pKYaMUyLWqk2D+J5tEE5Z5qeaHSFvgfl0I
 /VXX1NW+3uOnew10YZk1QuVJ7UtmIdESlUCL3VhcrMgi1IZR8BWB6e6MZ/ekOnsIwCX9nMUD5wk
 t6lBCkuDGVaXdkIbsQDsu541pAokWIm+96oMohVbZ3EU0BtGZk4CbKfauP73p3POtRatLI8qbUN
 vuKpMwVWaAZ2vtA07o9GDE9XnhBqsR9Aj2KeHcLapVHRZEAQW+FCEu1zbtDzN/l2YJ1UM1avBGp
 ANxs0cjpKjmpJXStyNKEOODbUwJgvHqrzIEAxGZz/nPP4+KqHcYutR4b3nkRgmv2Cr7BoZk1xF1
 XDyOJ3URvPRl66sqSx3fgQ8bMsH+gfSipoq2O09wr1ePpX+xU2aKTRkTh4TralInxmN0xDOyPUy
 M3sTmxXKXmvLZSkWGgC1+t9YmrGE0BhwlLRP7ZFZHYRT4FDGgeaPn4/N32S5YfddBHVxsHZHx+B
 lF84ISrushp9Fktak/z0TwJ6y//hZwsKDARvxSYb8LkhQ6VKF44q7NTSlMwJegIs9ZxjVHwKF1M
 hDyrOsEFbKuKWjw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_083817_188990_9B3A0455 
X-CRM114-Status: GOOD (  11.33  )
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

ufs-exynos driver enables the shareability option for gs101 which
means the descriptors need to be allocated as cacheable.

Fix the DT node and update bindings to add the dma-coherent property.

This fixes the UFS stability issues we have seen with the upstream
UFS driver.

Note this DT fix can go in independently of the other UFS fixes series
I sent recently [1], as the bootloader already leaves the sharability
bits enabled.

regards,

Peter

[1] https://lore.kernel.org/linux-scsi/20250226220414.343659-1-peter.griffin@linaro.org/

To: André Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Avri Altman <avri.altman@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>
To: Martin K. Petersen <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: kernel-team@android.com
Cc: willmcvicker@google.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (2):
      arm64: dts: exynos: gs101: ufs: add dma-coherent property
      scsi: ufs: dt-bindings: exynos: add dma-coherent property for gs101

 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 2 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                  | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: b323d8e7bc03d27dec646bfdccb7d1a92411f189
change-id: 20250314-ufs-dma-coherent-980f2467690d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


