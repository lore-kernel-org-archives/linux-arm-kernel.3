Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6793CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwLm9ZOqkxP5nRd61gUy/JOG5+aVOeMLvrzzIiEulOE=; b=BuLeXWdH5jOq3CyPHd+oGUkPv4
	YeolzkYUo6tr5wWoNLHrawgJRk9UHhiD+xPJaqbnzDuPGi4cDChvKoNP2v23LOB0j0txhERanSOL3
	Q1ZPfMyfmUuwk9001fIDcaygVNHgcpr9huSvhQ65PrXjFglzvjlcUkozLQs1mD6rpap4sy3v8tkWs
	8uGNVnrJcUqlAHeBrnlKMxnfVFMC03v9lLy99nT5vzucXhqBCQ2u2FYcMSt2FwLL43g4wIyFBuBV7
	T8fuEZQET19UwTIVzlo480Cx9ELylngz90wuSGR7Vq6HB16eDnf+B3sq+S2z4OJUA9HtIbDZBziyx
	PCBMsQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uL-0000000Fw4c-36hx;
	Thu, 06 Nov 2025 16:32:21 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2uF-0000000Fvwi-2pBX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:32:18 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64124874e6dso131716a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762446734; x=1763051534; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwLm9ZOqkxP5nRd61gUy/JOG5+aVOeMLvrzzIiEulOE=;
        b=yY05d6KFgEoF0Q4kN64TIW6L87Y5dFgvmnuEAN7UhnFv8i6cz4N+h5Nrijd6/4OzPw
         tUGsuxqWLzPPv2k09tb/okofpMXHRFwEwucJ0Ct0yXLM4ZLpIoY5HCIqCZmf7waszvgN
         3FaaRNCkQ5epFFrg4sxcRzuwroaP5Yf+D9YxkSD6Juathxwso2S+rMUF+jqsjCUx8wOD
         hFIGeu38zEcvJ25jY4MmhH048U8e3n7kd7uwnDYeteqQPjkVJDs66w2t7Hp9T6Apl/1M
         +RkTgBgdZw1Oakhsg/lxP0Ua9BeS293duFOpm2AM0vYzaC20tQXGxMy35/eMXEK2KbDa
         iZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446734; x=1763051534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwLm9ZOqkxP5nRd61gUy/JOG5+aVOeMLvrzzIiEulOE=;
        b=qnc1mhZAnAaOFU8vGAMS++oFeY1Qz9ZC7f3330s75Iy7AKBTGMGXr+rauJba+7BxU5
         xeR6dSTFGpUiaOoyPL8+q5qZhNy4dDwcBoWG/GTg/xWgyaR/9jCIxud9ymP4JO2oCsLY
         sYe0A5BLj6bhJYj3kEnCwp69aAL8n3ADEdXa9J25iqUHtdvew5rWxevbgcx6YLVMfrZx
         bV63S571147olL8DmcCwvJJXThOenSnYTkVhUnDLZ5nJ2xuCEKo0I5XmdnofSs/NXrSH
         EiIdRWhuVZreKepYsrDzCWV6lvyVKC/EcmHISqc/MqLv9CdleGaMdZNesORsUgAUbPQS
         NQgA==
X-Forwarded-Encrypted: i=1; AJvYcCW8NvsNQqo5Hn6MvdXdxIp5NXNYuOyjS3KVa+LVdNaVjyVnftK60MeyG7gt6I0SZlmin7gdwpX+H2aFiOu2VS7J@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqks2J8r7tFEAamprOQ/A+OrH7NPu0zfSiDw7mY3UvRazpEOLm
	UcJmT3FgEVItGW1wVLEosZmmUwgfaL6ewx1AjtvsRThTH3AuZKPG0t/BdYhdS7Gz6KE=
X-Gm-Gg: ASbGncsg299G2/tesHEPDvLeI3LmKLT0TtrgRf8VLIRP4/J+04ftgSAkL54Dbf9w60+
	uxELvpCh6it0eHD/EPQFmCXp9rfrMun0QWig4b6iUOlQ9WmGd6wpYU3+Ien5nD5gKH7YwlMnsI5
	ArZrOc8NqF1Ysq7Rm/M85s75l96U4yX6Inqw9eG3nZ64VZpgawpdghTlrjMhFjayL8NRlVDABTR
	ZFbST88jNXhEXkBVidm3YjTbV2UNWrCG/MJW88xkllVUFwdpvLpHQB0BhIqFW3XeusNerUNCFC9
	KP58LJC9ppBZgzFoJvJ6PI5/MP569mS0/A9L8Y5a01FsX8KfUqXOIcVIgQrT2L9xQxE7kYJxWer
	1tAOqIR8tsOd2AHr8Vw3c0+xafEzeKcPOKrkxc0/qwwmCe2A11MrIzDQL4TaE4z5igiTfeCjN0r
	mMECUC8GpGP4/B+WuiEWfEQxgwJMc=
X-Google-Smtp-Source: AGHT+IHc3F+M/TvLrDrcLFQ9tW2dJiHfP7LuAF+5PCUj3SWO8aHpQIglRCyahcghJNa2WJYjzSTxpA==
X-Received: by 2002:a17:907:7ea4:b0:b70:be84:5ddf with SMTP id a640c23a62f3a-b728c18cf8amr200241166b.7.1762446733526;
        Thu, 06 Nov 2025 08:32:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289682544sm249625566b.53.2025.11.06.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:32:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 17:31:58 +0100
Subject: [PATCH 6/6] crypto: cesa - Simplify with
 of_device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-crypto-of-match-v1-6-36b26cd35cff@linaro.org>
References: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
In-Reply-To: <20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
 Srujana Challa <schalla@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>
Cc: linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@axis.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=m3Rw4RghvlJpNqwmX5RdKGrpt4N2kWtJe21s2ySaS+U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDM2AgBnenLurgSZhuu/V1NPBQsW01qTALo954
 zHx6Qd6Ku6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzNgAAKCRDBN2bmhouD
 1yjFD/0SXBjr3o5nVCXeb9CBDYjItP5g7f0LzGkhPBdzKq1eqM1T7O1jSX3hrX794tgPKdroXYo
 QrRDyQh7k+tp2d611N2Q6HZXoHQyybNtsimpOHvf5ptsmVPyynyhzfPUUr3Kpy8VqUahiO5fKE4
 EFriMSYfyNmnJDEZdsIQ+6ZwBjMu/JK3nj2yODqdq8x2Rbm16GcCZ9chcd6AevJZc74OUpPerFK
 itTLja9B+uHdYAml+qdB0bbglDPbJVY22DXqT6w7TC58Pxjt0En3ov3jdHdR0wVmKtlsL78VBUs
 7Q17yerdZ6SuEv0WkJNsL8L0Gfgi/X+MgRl7R2wmONVWRpeZtw7FahAaqukUBFUBq7jUdcyDudF
 lkvPbw+un3kjL9WYagYeYgT4g2eyVDIMjhDwZdbwQCic9UeUIzbRB3tELLUXOvMCvzYfgdhuAJ2
 aVS62BP7hHEtOHb/5/SZpS/8h9YPNH7nddQDjn+u7wQRokB2Ji9Nzi4TE/ApO48rZ+sjTaqGm6u
 xXEF31vkzrXOo9PbyJcztNZDtuQOXHkvCMwpKYFCrchH3QlDauE2E/6ZsGZuuaYPyuy11LcvjPU
 DhZQey10BF7vpWHGqAt1n3XNk03n2Cintxe2zQLgv8JZxE7DkdxCFws0I1ZW1LGy2zm4KA3NyPL
 nFMld+t4RPp23Dw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_083216_037679_C1EA7DA2 
X-CRM114-Status: GOOD (  13.99  )
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

Driver's probe function matches against driver's of_device_id table,
where each entry has non-NULL match data, so of_match_node() can be
simplified with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/marvell/cesa/cesa.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/marvell/cesa/cesa.c b/drivers/crypto/marvell/cesa/cesa.c
index 9c21f5d835d2..301bdf239e7d 100644
--- a/drivers/crypto/marvell/cesa/cesa.c
+++ b/drivers/crypto/marvell/cesa/cesa.c
@@ -420,7 +420,6 @@ static int mv_cesa_probe(struct platform_device *pdev)
 {
 	const struct mv_cesa_caps *caps = &orion_caps;
 	const struct mbus_dram_target_info *dram;
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct mv_cesa_dev *cesa;
 	struct mv_cesa_engine *engines;
@@ -433,11 +432,9 @@ static int mv_cesa_probe(struct platform_device *pdev)
 	}
 
 	if (dev->of_node) {
-		match = of_match_node(mv_cesa_of_match_table, dev->of_node);
-		if (!match || !match->data)
+		caps = of_device_get_match_data(dev);
+		if (!caps)
 			return -ENOTSUPP;
-
-		caps = match->data;
 	}
 
 	cesa = devm_kzalloc(dev, sizeof(*cesa), GFP_KERNEL);

-- 
2.48.1


