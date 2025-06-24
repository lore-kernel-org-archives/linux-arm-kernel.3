Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F99BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pEN8gXZgdAsFBjyK1sPhSnwBV3mYYXNO1YIRz4tk4A=; b=mHdCvu0fWtp0PxFTNUwtQeg3Ti
	j+N59q3pA1wNwqJYi09jAQ/VAQD23WCxssLM1/8ow4qTAmG/Pwz0/t8EhpNNCXosgoiAHoXjet+wN
	QzuT7jVX5iHoGZOuojL9FG7DyExYKJl6vIRRh30ziOU02ZB2i8VbKzkNd1xEYZMfKmi1kW1lm37jc
	64vIp+iVVUfsI3ZUdLJehij0OB8QGNHGKCSztSnmYed03jNO/bY1WS375WCMzglyOx6XzV75N28Ji
	C5cOv31QewBuQpS4NRHqqSPYU6jplg2yPMCUHssKNTUQsQBdbrD1enJ+iGvWjgMRPKUlfZcvqc4gn
	FAkQN5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2x2-00000005btQ-0Lyb;
	Tue, 24 Jun 2025 12:40:36 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2fl-00000005YjL-1sfH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:22:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ad89dc2d8b4so77700766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 05:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767764; x=1751372564; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pEN8gXZgdAsFBjyK1sPhSnwBV3mYYXNO1YIRz4tk4A=;
        b=L8hX6gEvDldy5rw8/SBOzQlT0Qo4X8kxgjK05AEKkvrplV9pCe5+sDg7PyFR/f2GAN
         JbqgKmXHbtjoilNuhN2fgMTf8W2FLpSl5Qu4wQUS62Ig2g8o8MLQ1/KP1Nx3yNI3PmIn
         jDnecbLqGcmmdu0PABprvTaUAhsYqAbltNlRp04o4sqwon61S0yxFxKPAyEc4iQbanXG
         Ks8yaNe7JCMobd2YLHusPX76PMaArEgw5D3yebHDbJrqJ4EWyx0WPI3ZAnLgWSGg3c+z
         bGpNxxlkVmhioUUu0mxXdLfyJFXRdb17Va5UxemcZDwoaUWwz16+5DWA4U8vnv1lZd6S
         ZsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767764; x=1751372564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pEN8gXZgdAsFBjyK1sPhSnwBV3mYYXNO1YIRz4tk4A=;
        b=QTR7Y5rjGHklwEp6MG61ZVhHrWcSbJR+4adGdSVBkBvNJwOuQR0HsBjXI7N2E5Jymz
         VEJ2RpmGBPzZ6SyEqTgKTku7fS/QIYetlK0k/92tr8Az31ojuxNQAEQFWU5x98XFLMZX
         otEGRQUH7nFbF/ScamEhAHyTU/hk1GL0nocqFRY/Vhq6XI9YYO8B0z8ASrkVcjWSNm1M
         JBTZzQGds/kpsPUNSOnQmLYuGZBNygWHn6tfCwoZUEVW4kh79fHpSRSwJzivAIS4wtwm
         VHJnKwH3fIe2aTno7rw9kj3d5SalPC8L7u/0txF7ilat6vBZ3HISYX/Y11kitTR9fwgn
         +2+A==
X-Forwarded-Encrypted: i=1; AJvYcCXHPsQ5KvKntcMzMC0Y3VnOCzBK3NmDiAvQYphgetWidPxb7hrMCldTfj4WjEi0JV0QpD0nT43/tDdbG374sE/O@lists.infradead.org
X-Gm-Message-State: AOJu0YzbGsmQu/MgO/NwEeO78gLTYH6QrqsyXeAhoH8qrpJszNjBzf6i
	T1WkG2fngcXdWGEddbsOOJsBxVz+j2fPVhJGfK5HNDrKxeEIYr+UIQGiiKJaB1MPc4U=
X-Gm-Gg: ASbGncvDm0XwkIxAAHJUiOLsyAGyTo2GV0b0nAlqoyHb5xzf7eKXvJa3gbNQEd7pKMd
	f/UN0STl10xrj4moipxectg3CViS7ueB9lzrGH9yZyxy+TMnsFbEhDER2qY4CMLEK9NrHcAcOZm
	kR0yuFW9panQio/F+zCbtGR9Asjf8yEIkS0e3YjxJVvBhcLQQ/NTRPXiDrpIJakFVxyHx6J05+f
	Kyk3+t6x4gwanHjJSBgzAFBTeJf2UiRfgYiqhjXJ0dHsdHnkQv+7JvhxO7U860ZjvIAlOOHfm4E
	Kvc/4gB7DzExs2h5WErKja5s+/Th3ykv+ej9X+AwLN0gB5QyV8jlwFgR6SK9qUJwe98ZUPWi/kJ
	GWgdG9f2ffW3kPo9I
X-Google-Smtp-Source: AGHT+IHClClHU8Au2E96p3VcVy/ff0krSWCye8OOGPLD9aP9mvkIHbrhp24LtglbjPmIGsJ5dSea2w==
X-Received: by 2002:a17:907:d91:b0:ade:3094:d70d with SMTP id a640c23a62f3a-ae057b2c11bmr476040266b.16.1750767763870;
        Tue, 24 Jun 2025 05:22:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:31 +0200
Subject: [PATCH v3 2/3] iommu: omap: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-2-1a36487d69b8@linaro.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Y2CybwO5O92qFRzmf6MiBBMqXPDVGxgZvsyOnSjjQXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpiNSYzTl+2MUxaNx8XvXO4QwkWAl2BTxp+79
 MVamFK8qjeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqYjQAKCRDBN2bmhouD
 15sLEACByAyjNTvE5aoZpmaIOtqtDYxUQAJh1mOrJv0pfkE1rBoG8yp6pAowtxtJEEwgfEcU5F5
 BKuN1dDYXM226/q2h2cDfS/EB/wYD4OcdC04BGpnhGrAn8l7z/p0QLoA+R8rahrL6Kmeurej1wp
 3I6MHQW/6mc7byXrEdjooXdl8zoK82GRQTm+GYSPL9dWxCNA9Jp4dfwdapw1V7KM4Xn+OzyIEZE
 0HyZOFfz72MCMXNBN6QiHMf62AZVoXMpu5HXzTiC+sQ4XNNngE6aeYz/99QuCkOpX+bsjAi+V3q
 8VPQeqkwbN+HaQZL7AGa0bGDViT8s0G6hY3w5hReKey6o/obX5VaBgcJn8dShzJ9N4VW64MvEkE
 JzWuwnYmRHZZicPdB9a7usUhHnBeMThAqBOQx/VXoZOAvcLwPuFDbv5x73BbZ03KMs27+Fi9vgO
 ScfFSK6YRA3sCBneffseNwpdbLsFFRITJN1pZSn8o4HqFTmRsS3HPCOtqnQEMRLEb2mnJISWcw9
 1lOOtBpQWZH0fgynm+mJGTl4ATeMTvpeW9RH7OyfWKnbrZ2Fr8zwWyhgeex1AeJJcL4QMibillA
 WwrzuSgeLfN2UbX/ORvzOUZMmnQw6xlla3/5O8TpYG8PAa+ElTtlYy2c7EtwCcwfzfV2igtykwS
 pDPqxuoBKGaKq/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_052245_497296_DC5AC3D5 
X-CRM114-Status: GOOD (  11.87  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 4448c0a512137c79195112eea25d762266c77bc3..30fdbabbc9c652990e6cd31d3c0a1a06633df9e6 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1127,18 +1127,12 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	obj->syscfg =
-		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
+	obj->syscfg = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-mmuconfig",
+							   1, &obj->id);
 	if (IS_ERR(obj->syscfg))
 		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
 				     "ti,syscon-mmuconfig property is missing\n");
 
-	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
-				       &obj->id)) {
-		dev_err(&pdev->dev, "couldn't get the IOMMU instance id within subsystem\n");
-		return -EINVAL;
-	}
-
 	if (obj->id != 0 && obj->id != 1) {
 		dev_err(&pdev->dev, "invalid IOMMU instance id\n");
 		return -EINVAL;

-- 
2.48.1


