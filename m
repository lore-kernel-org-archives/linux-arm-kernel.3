Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE729C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJkUcBGJ2XrtMHGjrGHFAv/qEFzrxk4oRJjkh26EYFY=; b=j4PfbS3NeCLAB6UCBWHNopVajB
	AXT6wZ73m7JLywnXjtv08RuwIODtfjjb+s9xs0/NDhKTcWHAiMiQekjXRmvk2PE0uf2AfFH/nGVBh
	BmBSWzh7ogYp3O0fKS2mjWGRjzyIiiRR3b00X8XuSbZQISfTtelHit//ZbBw9cHvPyv8EF9QbKFxv
	5Fy91K/nQoFIVT9q1xCzThnZ0KfPQLdEsGuwI3Lqm8jJDc2DLZ6/7REFPv5fBCPtcURGY7X73u1Ci
	Gzk8IB4RwrcKS2mJNbDOj48rx+gnUi8OBAIu0PQMB52AjVOerWCoDvvJAa+R7oCMZqz6vkJQcvkMv
	/cz7vTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHtu-000000007ND-0WMr;
	Sat, 15 Feb 2025 13:08:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHr4-000000006vx-1z6U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 13:05:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394036c0efso17883865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 05:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624709; x=1740229509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJkUcBGJ2XrtMHGjrGHFAv/qEFzrxk4oRJjkh26EYFY=;
        b=e7aqvPlXM/A6b932kEs/ijJSWwVIncy4BlFIfFAWh1AsFjOld4f+MdEmweEhrWVUN2
         0oHsrO6aQYi6D5idA6DdCHST8OpbpsORDOI/Frdxeel4MENEetv1uqdrf4PexV6lPEJO
         zGAVAOCU//coVw/J637i57wCTV3d/3yLlNSIrj3WEHCTCywt0+ID7KFOEU7ECyu/TBez
         tmTid5es871mIAlkQ62Id+2x6p5ccYxWkafcDfuX8Xh867uX7pBYRn/C4GfZgSd8aTPo
         rlggjYGTVJxDkF9ICfAhCNNBfH3xXldPp/OaVMIWxU9yxPGVDOZrBDK899FFNrvtnR4J
         9OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624709; x=1740229509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJkUcBGJ2XrtMHGjrGHFAv/qEFzrxk4oRJjkh26EYFY=;
        b=S9TeYe4ylWhC966lK6hLNIt/k+nVdygiibls7C1rhTPXk+1gH8RPAon6AJsNZZmcSe
         zTabC0dni8g6L9CaHhFgpUFlhWRd43gqNIRi/cTwsXpjFFEQfjp1bc2y7EGsxNhO4MRB
         tiGx7UnTAZB+j3c9qKy6nBuCgyxtdXfJ1RrT77MZfDA4AdIrBgkemPpc+KbVXtn99LYp
         oSJvGBaLJLtO0XI1d28krNWGU0bPLvaBXTUWKjtKj1Ieom+xtT6Hn8EMlw9z+jyWRZiq
         Y4x1RJg0r6VR3IrF9C0VSUYm+Uoiem9/vXcUXmsKC+z6K/kBSY9nbBAWal0k15xhFdL+
         QHRw==
X-Forwarded-Encrypted: i=1; AJvYcCWYBYW0CftX41mVvMLjBB7uWAHD4Uuhf05nlhZz+UPrZHSo2YM5InC3hfFbyCQozAVok1Ptu+3MyLQfnX/zBqBB@lists.infradead.org
X-Gm-Message-State: AOJu0YwQjCKuXCR2PDOdzHxgagSJmTfnDj4tEcenyEfAYLhqizRml4ra
	555j+5oQU9Q7QuzvL7t7foU3gNH69CzpT6w8hpWpJU0U46DiwAgr9dS30w==
X-Gm-Gg: ASbGncsJZmqV5ruzZ5XIrmwARLacRnxdXlJrXB/7f5Hsgf94e6CLr6xabwmYN0qxo2p
	BiT6YDw1naMloE2Qoz2zhgytLfxG3jqIqbND3Xkd81Gr/Kr2jGCG7GVMjuTx2Ah9I0p0jM0bRRK
	4uD2fUJtPCtd0LRo7QwNuRA3It3AXX1Q/drXc914jPDCyY2uumamgGLQH3SNVxP0oAIsKDByaQm
	wiPj44Blkv3mV96CCkvuaB646eSnilF0nTka3xJS52oEq/4ybepNHD68nW3tzUEnkKe+WoIPIFG
	1Uu7iY98fTRrn/ArOtji2ywx4W6JUQ0m7+m64x7GncdG5DT47L6bXTt6Y9hAecim9Go=
X-Google-Smtp-Source: AGHT+IEgflkKzAUCj8W5Z2pQjpOZ9PiAZlwT5wElROQ7KOpjT96Z/zQioxZ5pGDe++0gjBBqasmnaQ==
X-Received: by 2002:a5d:598d:0:b0:38f:28a1:5017 with SMTP id ffacd0b85a97d-38f33f1b7f7mr3137551f8f.9.1739624708720;
        Sat, 15 Feb 2025 05:05:08 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm7091418f8f.1.2025.02.15.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:05:07 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: arm: samsung: document g0s board binding
Date: Sat, 15 Feb 2025 15:04:58 +0200
Message-ID: <20250215130500.170738-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_050510_508280_65B0B5F7 
X-CRM114-Status: UNSURE (   9.56  )
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

Add binding for the Samsung Galaxy S22+ (SM-S906B) board, which is
based on the Samsung Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d..bb3f6a0e1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -45,6 +45,12 @@ properties:
           - const: samsung,aries
           - const: samsung,s5pv210
 
+      - description: Exynos2200 based boards
+        items:
+          - enum:
+              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
+          - const: samsung,exynos2200
+
       - description: Exynos3250 based boards
         items:
           - enum:
-- 
2.43.0


