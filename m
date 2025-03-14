Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB66C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMYM/Y59VrWiEn+/FGX1UKrQNBbRBPg1viYvIvRGXN8=; b=KzIUGgMX3V3eqII/8GIdEtkJoC
	FpD4kfbRH2El/Vy7wIjtPh4jSwuomtmSogAP+brwk25TUqucQMjT4m4paGlEWPl0fhlqHargAQGpC
	Om5jokdI0KvZxTATj+Ppl4Hv1VJUij9gsbMO62Rt2LiOvu5uyjYCDW8zSD9ve+qg/7yHmgo+q9fp0
	okQ31eretlWMegH51zHx5b4gdIVQvIKCMOue8tf8jdUd2916XTEqwWNbRWSlMJoSGw0J6NhrljF6e
	XOyoXhB2NDcMtlhh0eBNkrQCZohrgjDKULXbJ5Fpp6hK08PmfSjUtY3JsnA+97b1Hjv02JlWuIk41
	peI+kcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Cx-0000000Ebrn-0QK6;
	Fri, 14 Mar 2025 15:44:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt775-0000000EawL-0tqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:38:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so21263795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741966698; x=1742571498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMYM/Y59VrWiEn+/FGX1UKrQNBbRBPg1viYvIvRGXN8=;
        b=hRvQ/zXTR4zlhSrewWTxP631S5idt7KVxG4JQrwLsLg8HmayngruT6F5lHUNSegjZV
         2pDLjLQgdHcFFnU5Rv4IC5WO+sn5rxwRUrwKzImCA3QMqBAPrpqVOGmZWPzhwZzEm3wg
         M+RRvUrLwDYRfTAsWtrkGXWO/Vgy0QUfLadK6+E3HjQyoHud6EfVX2V3Q2nIO00xOlsQ
         NY0P461LgPG38ogxREv7tiTOEsXqzNzwe3HTJSlJCAh9//LeKHFMZO+aqir8MR1XQHtJ
         Fs7rOJVRUYIgONy4nUnLg3YnzIYCOx2DzN52yiYkhxHX5vBSudd/VlZA7yZf22JSZNbj
         XXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966698; x=1742571498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMYM/Y59VrWiEn+/FGX1UKrQNBbRBPg1viYvIvRGXN8=;
        b=jQCvCb/ORyjTCUgcwRiWMpfGtzKVBoJL8OYzgbcblxTBRwraU1NIhUU75NMe3xU6Zm
         EymIQhYH+9Krtfm+dEEVEDpKqxC8GvgeqaS1JN2NajYf/Ec/6OY/jLViVW43wIxN1g9m
         lTLeANrRliKolRYutHS07OBNlqTrNsbZf0bxOLnIrsAGFNVvb4C5fFOAUTE0K/U8wmo5
         CgsRSPIyW6trDolAmOWtS6R7UMp4cRvjtM6YEYsZAQkPJLbWZg0jSWvYPuTGkRegeLS1
         GLjmSvh2eYJoMYw3g9br6gkL5GlEGEgDSgl5HlVuuOChmMCsF9x9h8ye0iMMqsc5gm/f
         dvhw==
X-Forwarded-Encrypted: i=1; AJvYcCUPJ1llowLow0pSd8lgWarIruze+hEgC2hbEMjPVzkXISsnta7wN3V8CoV2Mf7OuaLcqch0yunD3eGQODHBw43I@lists.infradead.org
X-Gm-Message-State: AOJu0YwTlQOAVy1wTA7l4UbpjODoZrS/xETTOq+4TRzf1XROzuTBV6oD
	mtJjgqqzGDg4MZKde/DO67gMYD3UP0QXAoRa37A6UsGYnMiLrEZLsqo1077KUq0=
X-Gm-Gg: ASbGncvssO/ayx14ZgV6pvHmjNiPrzcp5oZAeBShYxhLFfGPtAdymKO7//sEpzsWQ9f
	gZcGy2OUoRuDTVOIMdqgJoJVk3JPTZup1509C/3UdtXkYmBLpdOXGHYfUqpjmXV2/CPH6T0aQnB
	vesKGnEhJj93pJGkXPXZTTN+fcAO7NSefxEWHFU/nNNzzpqUwRztXfUCYxmjOKQPHPDyVneQOmp
	RQzsGc3bvF2We/cA7KVfb+X43AAWHFANr34SbhfbIvBviFwg0Zafc05GbYTEWyvanOb/futDR5v
	pDrzFn40ArNKHoQdA90dt5chf9zExbSNvJ3cinOtNWBcNf7HfHN9lGsHosWv3jniQArzh845K8O
	P
X-Google-Smtp-Source: AGHT+IF0c1R4A731Yp+i5adNCqzDyfMiv32JNj/6QGvQRIP7C/RfyrTNHmzLFbxoNZ8YFJMzjNoGcg==
X-Received: by 2002:a05:6000:1acd:b0:390:dec3:2780 with SMTP id ffacd0b85a97d-3971dae92ddmr4101987f8f.24.1741966697719;
        Fri, 14 Mar 2025 08:38:17 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm5944388f8f.62.2025.03.14.08.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:38:17 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Mar 2025 15:38:03 +0000
Subject: [PATCH 2/2] scsi: ufs: dt-bindings: exynos: add dma-coherent
 property for gs101
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-ufs-dma-coherent-v1-2-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
In-Reply-To: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=g4f90mwDJuR26wqS/1igJqcdIvIeUlPUF9yUW95/6IM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn1E1lrzk8wn/m7Z3q3ttJavIAK2e1eKNBbYLA5
 JQ2Q5NtdqiJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9RNZQAKCRDO6LjWAjRy
 utKED/4hPCY3Gp6xFZBVY2H08Ll2kfO1GsRnfO//B8bkd3czF2j30oImYeJvcg4bM7d1oc1Yr4V
 NGPH8Hk9EKbtDZSaYpRnRIP4rkb+QW/ni2ntZ6I9J1cKEDpb8KjUQaSVgz4ajIDGlbqGO6o7HF7
 0GwOjCQaEJ2c1rBTIzfat/7Zhz7sBKa5gxkLH5KGhejx0/kzvYm3PS+yOMnjEWNfg9ROeum5kPV
 HCWq/4Tt46gwj5WiwgHQB1MY+luGeAm72KnCHBfYqMVY0Ol/i55IhRcvT6oUUbbPUrhFRnAUTae
 V0HlLhfPlhSZiosyZB/Vk42oKcZOWUw/8aARs9r2YJbPbP+Tc69vfThTN/ixsCtNTPGSRjrNHV0
 nWyhBJGLiKC91dKYCYXFm4rv/1LDHvb8PXTkIMGYxpA8VLzr9QiwczgdTUKGR/4NF3mw7nRwjpj
 u4IAE3Es/t7lMP0Lay6/zsYvjzh/j6ucCXB/wPn42KWTu64Jb5fCdeHomQBuCXfNgRuthaKp6Qk
 1eyV/LwD7l4aAh/Wyso4tYsVALuREJEuE6Ilddr17L5PUmF7+C/Y3SkcYRtT0FcWBVRmfni5fte
 g1rLHY5w4qyb/3TF+CJfvYIIKPjLTfUkvQxNJ62Aj7hiDV5SPiTkAfjQknnzLuU4UAy/lNq9vvz
 vIv5kje8ghGwFPQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_083819_257914_44EA39AD 
X-CRM114-Status: UNSURE (   9.10  )
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

dma-coherent property is required for gs101 as ufs-exynos enables
sharability.

Fixes: 438e23b61cd4 ("scsi: ufs: dt-bindings: exynos: Add gs101 compatible")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index 720879820f6616a30cae2db3d4d2d22e847666c4..5dbb7f6a8c354b82685c521e70655e106f702a8d 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -96,6 +96,8 @@ allOf:
         clock-names:
           minItems: 6
 
+        dma-coherent: true
+
     else:
       properties:
         clocks:

-- 
2.49.0.rc1.451.g8f38331e32-goog


