Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8390D277CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 01:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN6MSURqxWOvIBN2xDV0KAizo7981QvoO4K7apHW68Y=; b=HoHnoQY4hfXqqoYpaVYy/1iH2d
	FtLmLcFg/yNHn6eYXxl0jKM5NZuiqaDBQZx430zAhspn+CM/31bKy91gfwbAbShCxLEhxhzrxOrTY
	AZTvbMYl5+Rf608BL2eCAjeCdQ56UoYJqi6IBlvOjQ0Bm97BX0H7F21pV7+AlHOAzN1vR0uL0GkQe
	rTjtpBaHSoLmlg/o+2vXbB4FqDF2N4726FarrmwbQYHhrPVtqaB3Y4NjG8w8UyPsCr2LxX2WLeshB
	eJc/gxSxdCKJKYoH6xUGR/jnpl1iq1ohQuaMH2Tq2QsekuDJDgiw3t+xV0dwp2BrakqSsob1p/KXl
	UCBzlh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNS4-0000000393T-2ZI9;
	Sat, 10 Jan 2026 01:07:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNS1-0000000390r-3Gw2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 01:07:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso34837115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 17:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768007252; x=1768612052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DN6MSURqxWOvIBN2xDV0KAizo7981QvoO4K7apHW68Y=;
        b=mK6GtGw/3Nky5l8bTvkZj4XzPxg3+CJ+mfVwq7DB5CLlYMx3SQu4MDck+tRS0pXqxV
         ILbjGXDcdKcvAeai8cCt26vJ1qRxlzYiF4zmrPWd0OV+mArEuQj3SD8PYibTjRgltyyA
         aPC7WffYSaWE2JRaNhIdKnbnRsk8CkLdpDzRmmylegGzFpVfR9YpEnwWmtP8YUL+bDN2
         3O04BfO/5SIAtEYPULsJpcqllK3JEL94UDBriOnEihqOyiLxMDvix7qjPK10cwge058E
         p1W/JH1w8m+1t913HR+FvcJQXkxLkB7gUp/Avyy79mrz+Q4aCXqH1seFfD0J+10rNMir
         7lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768007252; x=1768612052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DN6MSURqxWOvIBN2xDV0KAizo7981QvoO4K7apHW68Y=;
        b=ekBrpgnwkBD5CMtllrGkQR6pMZH4hILoIyvMlRQ6SZ0Dj7ttIFVKQthlEHTZIeEKTx
         74ZCcOGX+q+09sHvwgQXtc0cYBq95532si7ZdsHeNU5PJFlk7pVpIG1jtNnZH3l77i0p
         FY3pb05BDMnoBV+v2/PEH6gqbm4r5XBxlZPLHI/HHjaQ25HsnonmzMRB/hK8uwWGosML
         iOAL4ivKjIIb4rtKfuEG+fZpjYfbQ9qTKu32dHj+n4wwuvqAc3598vzN7+AwzDkVINXr
         e3RbzLLPZf+x3uzFQRCP3JCPByIiU2m9zEnWbTnnZ7aG37fqo9yNBTcIdPixYXn1eH3Q
         LqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcTQDYMKGTaFRBS+F/HIVwbTFZZvKlNbKOBRDA7RK9O3NI9lwASU9HbU0kVvChZor8t2LE9vZMsw3y+nZC6woH@lists.infradead.org
X-Gm-Message-State: AOJu0YwUH8/v5q6mYjDnxLoCrdXopheaLggYprrVAGOB1dXbuHNunBK9
	uusVHObDXaCEU3Pk+crRDIcgFiPfVHfsbOhDCf6hfrujTpaBIYDXbNe5
X-Gm-Gg: AY/fxX7xxqPgaFAG6OsqcYuSSDa/Yp69VEuHIfrw77F9y09638D1VmcsDWNVZ0lJ8+p
	1yEvm5dmr5fDkG8M9sCLP1vDBpvde8urPk68utSbVXEeZBOG+CZmdYkNLHzeaLCzoMFk5glXBCE
	XFHMUwzHIzcUDoOF+LYEbqU56wE3aJejuT+Jo2XrjHSzH9MzWY8RD2RgwkYAB96EZW0P7wVG19u
	xkLbAKLhuGdFxcirFwUutf8Xb3EG1JDvW6qqwIx48/Bp6V8epXBZABq6gksVkrRDGCXXAhcrHHL
	PjnUaOQD/OrzbWg1T/79BLEYJCwG1hWOgzJ+Xml4YpgjOw6YEWZsnRQ2qKLkY/707UkE2/+qJuG
	c+VTts1F7MYcOiQxrqbUIMXse2LVnqrzyoWyrNpMFeaI+xN4eIiK4ARd9P6UOdm7cvSfXzZqone
	XS3ZidSEd1CKJkRVeX7T017dX2sJL0E8ryeVdL7nuCc8+2305p8nmp6BAnP/cf30tAIYK8LyoAg
	6xrBvM=
X-Google-Smtp-Source: AGHT+IHUUZ/4ZQNhh9IvF2WBWql7HyWhiFdLiU8Xz+XMhgJCU3OwR9PNJC6uNnx3kZs51See/jVZpw==
X-Received: by 2002:a05:600c:4fc6:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-47d84b0a902mr114638605e9.5.1768007252116;
        Fri, 09 Jan 2026 17:07:32 -0800 (PST)
Received: from stor1.home.marco.cx (ip-178-202-227-016.um47.pools.vodafone-ip.de. [178.202.227.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8717d9e7sm71779475e9.8.2026.01.09.17.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 17:07:31 -0800 (PST)
From: Marco Schirrmeister <mschirrmeister@gmail.com>
To: heiko@sntech.de,
	ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marco Schirrmeister <mschirrmeister@gmail.com>
Subject: [PATCH v1 3/3] arm64: dts: rockchip: add stability quirk to NanoPi R76S
Date: Sat, 10 Jan 2026 02:07:15 +0100
Message-ID: <20260110010715.1610159-4-mschirrmeister@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110010715.1610159-1-mschirrmeister@gmail.com>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_170733_822885_1941318A 
X-CRM114-Status: UNSURE (   9.96  )
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

Enable the 'rockchip,disable-runtime-pm' quirk for the SDMMC node on the 
NanoPi R76S to prevent bus instability and retraining loops during 
idle periods.

Signed-off-by: Marco Schirrmeister <mschirrmeister@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 31fbefaeceab..90a798ee9e68 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -754,6 +754,7 @@ &sdmmc {
 	disable-wp;
 	no-mmc;
 	no-sdio;
+	rockchip,disable-runtime-pm;
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc_3v3_s3>;
 	vqmmc-supply = <&vccio_sd_s0>;
-- 
2.52.0


