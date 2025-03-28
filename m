Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04548C36011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=; b=zKVrtdZ/CJvWXXnkYIGzMogvke
	VAExwb31pxUnOIwLWr0m7yE0y+aHo8mLdBxpxlRjhpu/vO0OKdmosrEaSNlYDiPeSMm7Gz1Apu41J
	3EXoGFMbnbJ6/Nfm5XZhFN3HHQBdfoaaMosXOJiBgb0kCYUeUkZTwwxrDzSvrNkOXUUjufH/uYTR5
	VAWQRBSvGTnfjyVwshT47AIeu0/nzOzN5hHmrpRyKxPv0Zf1nxkeXgi7P7bB0r9KC7yOYuZPUjeWW
	bdi6jyn1U5TlIK7bUUcC7G5VQpEQWPu50LxkPrn1YGPu25aBnoco1BVjnPw/0hIn99UJWJ4qhK/81
	aEw1DfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9w6-0000000DSXY-05Yu;
	Fri, 28 Mar 2025 13:39:50 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nV-0000000DQcp-0nA7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:30:58 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso4149335a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168656; x=1743773456; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=NF364uoXngjBYYGgZnOb+1BV14R0tElVsKGCsXnriI572beUGq8onjY24LdmUWo5Sy
         ovwXTfk8/EV80XRJKWhd9sxFwJwF1NOmzXv+gzrL0/nN1AVp5TUKVq6Ybe/6AyltMsfy
         uPzBUaHXX05+x68Erm4zZUXe3lKxFv4Tyx2FzUZAThOg4nMOXDyR0tZKX3Tcr+xqacEJ
         de3b3QRARunkDZUHesZOzCHWearlqWW4PUF81A1pX8G63j+G0s5PnMIrc3DvdcGGAOqC
         mtATYyaWMZzQ8K5iVS3sCCIVKAmaQmCBFUGfVEsd99VR9gE0JS0ZvO+dv3UnWi3l2KoA
         D3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168656; x=1743773456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMxQ7UQKMt0+Oaxy9pEE80XpNTXV7CL+WPCOZ4uzjjQ=;
        b=fwiFlg6MYNaIqCorF1NfWbGBpqzRkA+0jbMP2Qhvgs1XSHNjYaZoFdBzMD+H1djVFR
         YZb/V4SE/CqhxONJ5oHngiWXdoN+rH6zaDYjm/JuPFoYldy5G1A7uB6R91M3kdozRrPr
         IRuPLIXbEzDcTpqIsYkvFZRoviXtqXsrYSq5GMl1aEaMIdDDgPTd3QUtV5ry8Ymaw1Y2
         I8rf6phQUuftcntXb/Wk9rZ6M5XimbEiSfZpE5glkfARmvC5JtMPZUNC9ND+aJgJUjnF
         2Bh6g6UwV3chWoygTzisUOmRN813hvPgtstehQhHclq4qFBTb1gJCYCzRCDvYzLrY3//
         BtSA==
X-Forwarded-Encrypted: i=1; AJvYcCWS15KLtRwG4//HYkWIocE1BmnpWbtpRnLlmqM6XVRV1AJlljloVgJAMv/AE+TCC8EvG20Nvv0MZs6V4Q98GqLe@lists.infradead.org
X-Gm-Message-State: AOJu0YxwxAb8Oxiy1lPW0uRIgjhXJ2oQYd2PhDGNm1z+uao76xOYMJEU
	+c6eiWGeVmBM4rmnRyIOOQ+uHUQhizQw2GjjtpcRrJCvfUV5ppxpvL9ZGmIjO3E=
X-Gm-Gg: ASbGncs301jc/Lgmc6g8JjV8F8805LJrnYjTtC+dswv+yz1sjhy+caoeZYztqMJ+ZIt
	10sTx1nTbFfc99B2fF8lr6ZFg0ZX6Ek+5z8JuBjU+foOw5zhFuN6VCYkz3COuTTxRBJ4ZupZoSw
	c9+bx+Ms1ywto5crCGd1DiQwYhV+YCa+KMtHq6zMvqH/p82BiTkUupu6TRJ6iJ2NiAOvPBat5dt
	+KVoVETDRJBg4o/BWk7D+CHPS1n2ofpKb0GbszcsbY0eaHGIT/rIjZcGwpeW8QQvjYKl2H3iWhi
	CUaoiXfBYAFIygvjs9xb+/yxM/EcSoTMpzxAXFq0Nw+baBZTeediBhRu2F5amYl4J3CGQQsgd9r
	Fuc9IWz5ZfsitRJQ2nSL0RqX6zY5VMvRj+f+Vl+s=
X-Google-Smtp-Source: AGHT+IH35FaKYo+gSI6anwiHIjdD3ef6MXj/ihpM/TgWINmZ8ShobAVb92+tkqSJyQ+wsMpl6rBS1A==
X-Received: by 2002:a05:6402:51ca:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5ed8f9027ffmr7884197a12.27.1743168655554;
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:50 +0000
Subject: [PATCH v2 04/32] mfd: sec: drop non-existing forward declarations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-4-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063057_232420_1F3873B9 
X-CRM114-Status: GOOD (  10.01  )
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

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.472.ge94155a9ec-goog


