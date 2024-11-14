Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F2AD68B2C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LamMmHrHoISVxlDkxrXlCn20NYqsihYLKICdj17wsng=; b=SYDwDN3zIxnlxs3R9H7MlBgFHD
	Pp9wZ/gWI8VBhEoJlh9dfOpR7Dpy452UTXKk0YtbLxunXwYrUgLeeQ80Af+khZJrfcfMlJ6nEaIe5
	JHTIKgm4hXb3IzaoHst4mr0AbauqSaaRoUb0Ywa+kBj7pBZz/Q2oLeTYMdJN/lNjRTKxcrYKYVuyU
	5AWb5AnObhvFcA2QbQFE7CpUUlZu/yLORFCBLNIG4HCyMQv6rMWx6Y84sYJY3LmoExkwXdQpMWvh1
	0dVpKYiGFovbQb/d5Pr8Jr6t1niwqvF4ydjEiRVDo10UwGHPjTtGfgY6MdjF2b82eJHpP+HZ16q6N
	cVYpXzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBb2v-0000000AEpw-2A4N;
	Thu, 14 Nov 2024 14:42:09 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaxy-0000000AE3P-321B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 14:37:05 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2884e7fadb8so319392fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731595020; x=1732199820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LamMmHrHoISVxlDkxrXlCn20NYqsihYLKICdj17wsng=;
        b=WJ4NfJAmxCcEkqpa8dIBzp+c2Pd4dOazqBo09hRuIVsfga1q2aA45FNJU0Yae+ZkIH
         jcMR0eRYAxUDIXDkgdsrZBIDbQHyTrB75bqwGO/Aiybi6Brr8nV4UmgzSOY9t1jaLyZ3
         Z19s5nkKkZjvVNot44TwLLCsm1f+JDzyqbxWN2MPWHt63Y0Ju9GsUYij5sx5Rwy/yxvR
         GFk70btlsRUmRyxkqVKbhoYKpxRifnVgdCDBYemn0U2R2tALgBnd+z2vtW+FnQzX6hmk
         MFTV85M/iCzp8D4mi0CvAHj3HrIJPrNwUFacquBfmZxkN63MA9so6+KjUd2BwomH9ILE
         5xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595020; x=1732199820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LamMmHrHoISVxlDkxrXlCn20NYqsihYLKICdj17wsng=;
        b=rrTzCm5vN5wvDUOiEbUTFojki5jCE89Etq+Kg8WNGLWtHHOgaExAEDRjN7HiniE8z4
         AvDu7q6PU6zxl4Oo6DMtquyQh0R7N4yiQlp0QWmjIvz/K4l3mT/OcK6UKSb4ep03zq33
         2YUOtzASCyG0K827zam/RlV0uSN8IPq51tAbCo1UBKvUtltI9K5P3qFL7C3GQfJF+Mm9
         gP1xZdsWV6w9iwzZsDK5N1tLk2Af/AuzxdjstaQNMEeR6NEHPhuy4dsqyi5lbBIS95SX
         P1WplP77p/+HkPTrjKSSlsGnnasHKM4HUC+g8qn85P2F7QSOdZ7Q8dveZw7EBo6otg4Z
         Ya2A==
X-Gm-Message-State: AOJu0Yz3L1TwiyVWCKNQkqp7zeMJsyv1YUbJ5iGb4YPU5lzHtkt1WFhV
	cfNYYqAvBaLpdnDqyDwHq2+mzC0mJksmz5Jr0xpMUuBWiaqG8d70
X-Google-Smtp-Source: AGHT+IFsQik4tjBSI2mRjcpS5ABfhYDsS9jNEFlH4iamdiDIl0ypAeAwQjngdw/0Rj4LrHF4boIDmw==
X-Received: by 2002:a05:6870:889e:b0:25e:1382:864d with SMTP id 586e51a60fabf-29610648008mr2874010fac.30.1731595020475;
        Thu, 14 Nov 2024 06:37:00 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a6eaeea60sm393294a34.43.2024.11.14.06.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:37:00 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
Date: Thu, 14 Nov 2024 14:36:35 +0000
Message-Id: <20241114143636.374-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114143636.374-1-wachiturroxd150@gmail.com>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_063702_841216_CE2F3363 
X-CRM114-Status: GOOD (  10.36  )
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

From: Denzeel Oliva <wachiturroxd150@gmail.com>

Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
based on the Samsung Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..168e77375 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,7 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.34.1


