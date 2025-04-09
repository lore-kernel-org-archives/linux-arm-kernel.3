Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF6DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=; b=VLZ8nWDO2kOoIsEVlEfPz3q2t0
	cljk5+lZDTIMleXQjhwdp7VzVf+TnL2mMWD79/xccO0V+0zC1BiXkx0lOSschKboFcJWgEMPUrWWS
	8Sh+Wl/CcUhoZ9pcdd3utcGWXuCXp578NfG1c+l3fUAG/K1K9rx0GFIKQ6jnTZRIY//Kp5OAunsXG
	N64vjkR5d4UmWGf0vPw7octpAB+venT9/RPMnlDU9iLuG+tdXlmjuBfcLhiUEdjwsWCxU7hdAZU8r
	DLHKErI1Ud54Y7Wso1QxkYJ1z1EptDjd4LNW8/oXIBgPCSlfGqXfbVS6SFfZkbX5HJ9HxZA5JEFi5
	bfJhkhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ce4-00000008Wzz-1Vk4;
	Wed, 09 Apr 2025 21:07:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB1-00000008Sde-26ui
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac7bd86f637so230715466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231058; x=1744835858; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=jfeGhxQ2wimp9IrRb0Tv0X+ckkVneRi3pa8VFiX3v2yZ2JHB8ERzT+4/mlHv6Iwb2v
         yaPVs6OgcziuEKlPuPqDajcAGvRRWssDRG7JNVIx4wHTS+F9gQlOeaynU7odNa19GJOy
         WtGLRgLOtNUotgc6Cc2d82udFI6sUc4pzzmEYuDmJ0EU+P5anCQgXU2UpHg3IAj7VaP/
         jfR2isc0Kw29CWEJj9NyolSyPrIeh2gzu87BIAIVlggGLWuNdTrwL2DEEfbXk6lqtg1L
         nayJtABNr06XDQkb5p9QSDe84dq5L+59sLdeMquvsPNMamqb3kmQ8G2EknYsb1rAiLCz
         P8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231058; x=1744835858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=pgXTiVlvjUjZLPXNnjO/4p4sxDSKRnToLhg+u7x+ma7HfxMSS7OQX5EtKzuOz9u0Ff
         Q4bza64s235utmGPoPWkvOeYcmBRkD+4pRKzhEVUCKOChs4AQK3ODmORYxERnUd6qaU8
         bxPXwiJMkyzeYXdt5HFtg9zNMoNY1kMzI81XFJG2p2lQAC/gGp/krST6JyFytJ0imVAv
         OgPAOh+dWCTFxqNAUw3d47Jfps5UPqnUZssyBA4K1nQJ/Azv9IG3rcE/zWWDoyAJP+xi
         ChPRnwDh0s0Rn2AVvUAVW7yTxWVrfLw9mqPoq43EC7AVliGejXJpuKedHHCZvSEsSN/h
         luCA==
X-Forwarded-Encrypted: i=1; AJvYcCW314sUYEkkNIyEmXWjIW2bhCsIQV05ZhKUla1ydDqi4KArgU8/23aOa5xJGmGtk0nwQKiop/bJIXqQSV12n5mR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs/mnFKau/OnADoKlnTD6lYQ+geu+eVMUF75hc+YcpbuRQ5+aM
	XbpbtY+PpnhNVVZIrSpqAVSe83lP2HrxZY4qIlZh6qf9tVsTd9DlWGITSTkeUo0=
X-Gm-Gg: ASbGnctBH3tslpE8hV3JYOAeNjnvV4zwqZUo92w5Y6FQ5MLAsSeYmc6+unEbisC23D9
	eZ9dsz6LC2BBW9NwEwB5BauwuslR5k51IlHWDLW8LszTHwcRSHe6UyQfPQoC3tTFiA2AWwruoCH
	UBBV+/KKmbzhY0NGw/kv+tBGu5K/6Pgz3+P7wKKlULZz7OyOCR4P/dYIgOD4VMcfqIT2aqPmBTM
	T1mic2hM3RLHezzKxuofPsqwyLfFZbpZvZh3h43V/eQ84h5SdCa1mhRbjZCIyB6cdtGP0aNGalM
	FVD4VAbelejIEgbp9EHK2uAjD+4zoEmR8PNjVm8gmtFJgiQwf1Ph6ouJvEmqtv8IQXgI92d+z4I
	DfwfHDBsBmepNqOdScAl4bTE2yew=
X-Google-Smtp-Source: AGHT+IFs5jQKKi9PBtsfwcpWP0uR3pXLFKhxM09QGSN5rk/PWUonr2doF0wyNuXkGit6lSL1qy8RxA==
X-Received: by 2002:a17:907:1ca3:b0:ac6:d368:aa97 with SMTP id a640c23a62f3a-acabbee8c8emr16347466b.10.1744231057853;
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:37 +0100
Subject: [PATCH v4 16/32] mfd: sec-common: Don't ignore errors from
 sec_irq_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-16-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133739_541742_E35D2661 
X-CRM114-Status: GOOD (  11.84  )
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

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.604.gff1f9ca942-goog


