Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08C0C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/ABHH261kAcEZtti2TzXUxz3ZAT2vqzNe1BRxM87S8=; b=sTktuEKbGmUByAAXuWa/IqCIvg
	sWUHefCiyj9DYtyodYTgwe5wY7pFI3+9XrEe/wAkiaqPSdLaRxiB3DwOUlvrrZ64fzAZOCuVtK2sP
	3Nak9TLxHPU7PRgbxBpvHh45FMBcGYZ06eMcmk63oS9PznJzSz7edwBRg16pKuuQ/CQLnRHhYXwIH
	LS2JbNSq+liCdzbkTaZKnraQ+hGIGeuvauU8g7VbJAKL017FV2roJ+ODEZzbk6dqnaRc543/D/GLt
	YYg+fOu4SlGUqR+/Z8cBsIHNjkbs2q4ndUlnYU1TNI6f3BT1wVan28eXZlbN6NDFOIoZ4cBdP2NSk
	djC6TTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51e-00000008Dlv-1RGu;
	Wed, 29 Jul 2026 14:12:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51U-00000008Dh3-1f4s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso920655f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334359; x=1785939159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e/ABHH261kAcEZtti2TzXUxz3ZAT2vqzNe1BRxM87S8=;
        b=fSKBuFJ7i79ItJv0Ut4c8ftrVXQveiDryMV/MlQS0s5AQQCFNL8q9LwyMv7CX8uJJV
         F1Nm7GDRihARyHCvzeiI6fmwxqqOjYpP/wpoQ/YL3a+BR/fHiy4FMIs0uzDB9PJQqadG
         YO6B4av6nplm2VRp8ZkIskh97Mkg/65+hIl4NXpj1NRhg8dKMEOtvzkcYau8uFEJxiX9
         J2MDZICFbdC2vIrfzuQw3c7dVOOn1aMLe0PUGBsvQXK4fxucpX54JfquRXUfxym7Vafk
         onjPNIizPEbCOYBsgqSCM+SFzcSd8DCmSW3yYc5fWdrjWpmQt3G68jymGPMMtVCGObqr
         gn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334359; x=1785939159;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ABHH261kAcEZtti2TzXUxz3ZAT2vqzNe1BRxM87S8=;
        b=pJaF9Twx282d8LDgV7YVINl6rC3tJCzYs0KSNu9D0NWBiveiOY8E0BgeRa6YIRKGVf
         BNqJQiIOgGtQ6F/SMO4w5kVyVgCNX5RNRD4elTQ43CVuBg5ZKE/z3g4tfRIYdNo6Px4Y
         ovgESE96PSeCB8FOY0EmR1PokqEuo6GhunKbfgyCazar01rEolr3QAC7dQskTekjwHwx
         fzsvJLca1EzN6tSlk8HbcrG8okvThE+MIqB83GeTqSo0Tr7ZCDe7qKI1pAMcJHAcSdVV
         pAApO+AYOvaRlyZnPjsnsIMmDpmDi35gH1kyx7GtpFqsJ4QwPNSpXLp8fSMZtgLKiqAP
         bNmA==
X-Forwarded-Encrypted: i=1; AHgh+Rqi/NWLy5lI66COZ6yJ1mXQLv/6Y96+VVcqczTOZ6/VKVpKr1cVBjI+hdLIfC7OAjGZR9Z72EzWNoaR2u0GgjMa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7IIBFKLjdBmtgF1pmR+915sSVM2wtes3dkJ0wR5gP1BjQeqSd
	fmvlcetzkBfs0E87s8C9vCCD2/IVaQP3d2gL+6dvBykAg6pRMaq1e5eY
X-Gm-Gg: AR+sD13X0UobkofVrRquQKG92T1s7tl6KEOzWKAm2wMfZsQgmORs2vQ0GX/k4hmECtj
	JaiJhQ7zNtW1biIGVsXkcc4Lff1tcIoFqpDY/wxRQq6FYs2dJEUEsDORReH1zP18iMRfJHtNBeK
	Np7rO9LJd0gI6xSHEsvw5rjEvttVEFvU1Z1ci/Xu4JO+kPKfPaf1J+vOATe0TKNzVowV5aDD3mo
	r14foZS3wyjOCVSDLzPSiWHevJIeiypI9M8gNw9FgEgFqWSzYmdPeM5gyJWIKt3jvDAL1WE6xTy
	MrjCApCMKwlPgcWwGlDgMGODv+4cEr3Ee2HBx2lcRYURNf0yD4dxEc33RKh0C2qPDlEfCchZGyI
	ALHfvk4Gt3u7KcxoxewAZzUMqN4wTzThp1wUexw1M9t8hDLvpJYyp72LAAnNLBDCGaoWjv82cHq
	4K3K3m9y3wuKVEs63pJ+h8OYbMxqnEIoCT9/7wqhfC2GAjTohUXQca9FZpxYulhkd0Zu6n4cyBt
	I9P2byxSwJKhI9NAxJ3dg==
X-Received: by 2002:a05:600c:1912:b0:495:3b8a:bf11 with SMTP id 5b1f17b1804b1-496c6577941mr78545775e9.26.1785334358491;
        Wed, 29 Jul 2026 07:12:38 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:38 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Wed, 29 Jul 2026 16:12:32 +0200
Message-ID: <20260729141234.65037-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071240_439168_21DDB2B3 
X-CRM114-Status: UNSURE (   8.29  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


