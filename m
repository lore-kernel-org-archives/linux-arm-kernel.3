Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128BDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T64IvUv2v2ctLBX091YAC+zdH2GYdiIMlzETmbUeq5o=; b=2dfoKByLPeuytt3iOEMPk4jJbz
	+0uIFEHYpxrsryqN95zE+24Q9m78Q31uFOX+YziRFwc8xhFWojCeoDQnbhNShn60C/iyu6iCck00Z
	KwLLhORHHZvb3wQ9RBBV5WTAWWw+fCGDibtt5LQfYFeKWUsLwxdwvBbQ/jQB/GoPqROAgC8YQI98y
	8SjTRbQzNxjhUXoIHin02D5ef/hbwY5qfWBYoALURYKn1sBw7LOZLASuIkcVnegKyeFuGItEBerii
	RQLUSU3hxM/t5ZhTZB6O2swiWa2T6M2T2X/9KaVLZXwbkfdir3y/MXSEIRHO9N9tkK36qUNLMFvCS
	JvoL49zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTIU-0000000H3xg-3y0O;
	Sun, 05 Jan 2025 16:16:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTGB-0000000H3Tb-35IR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:13:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43690d4605dso56876245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093630; x=1736698430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T64IvUv2v2ctLBX091YAC+zdH2GYdiIMlzETmbUeq5o=;
        b=Ib2we+W3ZK42G53ExVV3arFcwMqo/+emDj/yYQDL9TmjHooF8CgUygiRORY24XJjDY
         5pyJetFd0EL8kUhmwqcITYfy9Tu+ImkbYObEgRinmnkxUgRoNIhNa6UimSZG4GX6ip+I
         Z8Suzeptq9O8rZvw1J22UubHnrGcqz76Hw15SdH5Ajy+1mIbEYXZlKhb2qOJi6BvSd2J
         wGPC10aUqjFokaeEcDbJntC3LmWz83y+U8GUj+5cL5a62hGa8sxPNiPpDaMuesfYg0M0
         cLbYvsAj59114xBAlYqxBBTlFymeKvGc9QF7mnXFGArPwB50yO8Goer0lY6KzsSQ3gFb
         oSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093630; x=1736698430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T64IvUv2v2ctLBX091YAC+zdH2GYdiIMlzETmbUeq5o=;
        b=k3mporakPUAzfqiNFMdwU9j+e6QpzIE9eOOkuM9HnFH0plRmGpzQf02DFE8b79TVV7
         ZFQK1hlPlxZw5GmHtG7zfNZA/PaWmC0Zx8rYmHsrLAmbEMOR0yOOLQwc/ezDY6wtLFjP
         hvNE2yc4dMj85xQofghwhDzd9zGGLblRWsObQeVjwPzJ/vbj5XfkQwX3iDtwSxSMGimL
         Kc38tWAJPaR5iK7mugWvK+3RQaDGv0pdzRRsutw0lX7hBOU1VttpS+aVDhA18E1CtzO/
         UgNs0sulZHJcBuNEsB3SGkbM+2lELVFiX18SZPrEjP33U00rnWjGRrXHbcsk0vnR63DY
         O9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWNi07C+XT33cpAkMykkPqmEa7ADGliDsl830Wj6J67p9kWW3PXXqNM8K+H+GXZArjRxa6fUl9UdLUT0P8axcdb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/zNTl9BtXwOAzd7FMkeWvLHpf+myJy7XITnV8ou9GOkhG+MI
	XzIdgeOAOwNICDgqZuodPsNnBm4VGFwDkFQzDU4jlvr2mL+LwFNaZNdqog==
X-Gm-Gg: ASbGncvlvmw67PcvcdEstVqlUuMLt1HrGEnJkKEBuKp3bfYPTjWfw9hz/Uh0nm4g40u
	brtwMlGoyBjBClSp5TRYvhRw+SVtJx0XC4SZJn0yA6coNj7DCzIE3VRd2zLysj0eKUSb9Hc1aj8
	KNXBQVS3CqDxeZkALrLaWiyTyCGNtsI5nduJ+6GTjvvP4sberWGhp5DeHu3ZRg/hv4jjfGsCYR2
	WteiefFjWoWFm7Ch9yk8uFie3VQpPJrTFn7kKHger2uMYZDhhsCxVoJocJy2BwTJTDcjFg=
X-Google-Smtp-Source: AGHT+IGYEUv6t4l2l4U84ZaLAmR9bjEsT9ICGKfsb4L61QXf0dhxU7S0Y+nrRYmb/VzwneK6WaOL5A==
X-Received: by 2002:a05:600c:3b23:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-43668b49a05mr413168025e9.21.1736093629968;
        Sun, 05 Jan 2025 08:13:49 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm578250565e9.38.2025.01.05.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:13:49 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for exynos8895
Date: Sun,  5 Jan 2025 18:13:39 +0200
Message-ID: <20250105161344.420749-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_081351_856680_CBBE2725 
X-CRM114-Status: GOOD (  10.42  )
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

Add samsung,exynos8895-dw-mshc-smu specific compatible to the bindings
documentation. Since Samsung, as usual, likes reusing devices from older
designs, use the samsung,exynos7-dw-mshc-smu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index 5fe65795f..ef2d1d7c9 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -29,6 +29,7 @@ properties:
               - samsung,exynos5433-dw-mshc-smu
               - samsung,exynos7885-dw-mshc-smu
               - samsung,exynos850-dw-mshc-smu
+              - samsung,exynos8895-dw-mshc-smu
           - const: samsung,exynos7-dw-mshc-smu
 
   reg:
-- 
2.43.0


