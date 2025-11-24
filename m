Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854AACFD35A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5Inq94WidM1IzPMPQL+vlU5Af/EQE0R1rM2YRtli+8=; b=1pR9qixwgS1Wt0J8DIWAWgI/Dl
	22s2/H1PP9gpDY6NYC7DJcuIKqFuesbzg2x0wpgU8zAR4dI4uoyouQVtoZpJpS3MMH7SSRWTFHlG7
	YDiuuEXfvDK/7z9+CMLoGV/q+F0ZRgYGAa7yNWgoLU8XHAScxu73cRsb4wC5wPaCSKltlQYnWt8/2
	bu3AM2IscacJ1A6oDrp7nhKYtcvGMmuaTOigVRklD2pxst9OrJZXQqoOtm+41C+vSl+MxO0EjOGF/
	edbMBMvu2X8/zfTxqecUJ2navLdZaqdjZeSz7ICb6i3FzCvMOTPmxRh72KZMDi2Cc8gKOewuHVA+N
	3psNQ1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdzu-0000000CKjp-3gQ3;
	Mon, 24 Nov 2025 21:21:22 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNdzq-0000000CKiE-1Pic
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 21:21:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-343d73d08faso2472677a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 13:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764019277; x=1764624077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5Inq94WidM1IzPMPQL+vlU5Af/EQE0R1rM2YRtli+8=;
        b=BM7xF73atzi8HpT/tdarKmsvGUG83QgTwvP+BzmLigP+L75YhH41obAP2gdlt83b2k
         DD/ydliWgc7JqccFrx9MyFR7zjsNRLUvN/8NHxV1vnVkUbWnBNJspOyGrvfPXAKCGN3t
         +Bkr+Dnvb2Cd68Hoag7DS3hmDa8LhUle38zTE9HVYcyChWjCge5T7ZpDsAtIJ3WWSfiv
         YAr+reAZpIKRP9V4VumqIljsSOAQXf754BVDTRg7b5yeD5CKArKxFG0SGLZ3xQJ1ukwg
         TNtlIU+80l3y6knELfDunRPVgAAuiWs3tOR3VNd9ZmOBIQ1s2kbOZLnPLQd5zNbDDcQL
         g6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019277; x=1764624077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+5Inq94WidM1IzPMPQL+vlU5Af/EQE0R1rM2YRtli+8=;
        b=d2amOLWcPNnFYpzl2UFrSacppqsLREbpL15ybhxprGEw3d9TZYzGWf+3TRhNekGu+x
         sXxApliwTkh0zzDkkufuYYnhvFlziesGNqsA5PnEIPSzd4ul3t0AnvyhvW+8RltGb0Ss
         gK9HhbMZv4bEw2oru08mKN5CCO6ziA8QHuxDAiqq2F4bcqFQHao6IobHKWlpj0nSNP2T
         DES7IEL43BskTW3s7QwikdbYywA9Wy5GD7+RLk/MBHcLafeuSGcYOIBYnm87pahleGj4
         6NCUp6wQzuU9J+xRxqW/1QwZNE08GlxOlxOBcxyPxF5QHYR4yT8sWivf73w8E/MyF0OC
         sHlw==
X-Gm-Message-State: AOJu0YwpHjiISIUMQUXlls8hB7x9VfC1/zqRMNTyZKisuR5Zq/9q07U9
	WpJ+WwiNQ2VwFPwg60LcR8gKUiYRSMH9d51pAF+4H+ZXVpVIGLFGy9EI
X-Gm-Gg: ASbGncuteb7xxjdYKaO4aP8ecTol8NyDrtJyA7UPDrdJUt5ynPfuTv8N9nJxE2gPkKu
	fZuzEre9lhlPnRWz0o8Z0izZq1NWRdenHXVgWfJVs9cr5Oyu3662DJ3kG5aJdkbn8xCOeWhB39h
	nQdRhUt4jpwfPcBArSWEWeg0swSMGsXIZdYasWgXHJM2muf4hR3B2sG43fq7qUzaJz3qQt6Fzpj
	P7+QBHxz99BxkuDm1DTSuluXwUmBTyZQJQf8Js4Pb7GIrZze6ajUbs7h70W0/ynystOMyZ8+unb
	tAffEZDewDuEwX5NDO2jFl4QHXOQd+pF7s3CPXLzEhWxK+uRJiYnFp2E/dnX+DN8zIQvM6Q+KVx
	vXYUfbVxW5frCbGLKjaIcHykUfD910liBpSTgxCMNuvsijl3CStxX6Q+5d5Kh51sYJfYSzMdZHl
	FFbQ==
X-Google-Smtp-Source: AGHT+IGt9JaxSdMIg/K82kDNkha5T5JfwKM7sCcz1zE6ZPRoDIHpa7dMxg/PxPkD6VTRBOZIK9jBFA==
X-Received: by 2002:a17:90b:1d47:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-347331cb3e2mr11359605a91.8.1764019277550;
        Mon, 24 Nov 2025 13:21:17 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed076eb3sm15702319b3a.1.2025.11.24.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:21:17 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	peter.shen@amd.com,
	colin.huang2@amd.com,
	Peter Shen <sjg168@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: Add compatible for Facebook Anacapa BMC
Date: Tue, 25 Nov 2025 05:21:05 +0800
Message-Id: <20251124212106.2068069-2-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251124212106.2068069-1-sjg168@gmail.com>
References: <20251124212106.2068069-1-sjg168@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_132118_399689_EA8206F8 
X-CRM114-Status: GOOD (  11.12  )
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

This patch adds the compatible string for the Facebook Anacapa BMC
which uses an Aspeed AST2600 SoC. This is required before adding
the board's device tree source file.

Signed-off-by: Peter Shen <sjg168@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..bcb874ebd9d2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -80,6 +80,7 @@ properties:
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,x4tf-bmc
+              - facebook,anacapa-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,clemente-bmc
-- 
2.34.1


