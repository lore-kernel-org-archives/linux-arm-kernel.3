Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8452CD49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7YU9L/ihohCgSGV7XFCQCDHEXAXKVeCUTFSk43kuSs=; b=0CoDeDY3WaSqiENhIOjYn2Tm9M
	Xqas57DH1SCXeYYh/L+YduACuAmBsUdzhOWFcxSYDuXSPSzapp9fV4wD6vhC/FpzCaxK6LKqEqFh5
	HcYVw85kt89YYossxfjLkRgv3vLBfUk1NHkWnMdLfuTNJXhp+rvGMX25eyXEm1wY7kLJCcrBWoD5Q
	xlDgbI9g2npw11lLytuc8OILGRK9ML27/XXh2q1yEm7KCiHpn5y76PF+10XEUKPuPPOoPH6Ro4EF4
	5yvNQX9mIDq77rIcQZaCjjWCTbSbFqgqaxmyKQ5TnzIOQAxYC8VBQSjwHvxFnSAGvRhBsmbCj7KHv
	/VWCKaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz8J-000000096wI-3jYl;
	Mon, 18 Nov 2024 10:37:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz5a-000000096LF-2T8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:34:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3822b77da55so1410687f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731926077; x=1732530877; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7YU9L/ihohCgSGV7XFCQCDHEXAXKVeCUTFSk43kuSs=;
        b=d/mabAiKYnUpelcSWOAH6WeaDyoFbF2AGeiL9bCZRrY3wWRlsWTLHO64F8rzI34LUx
         G7Jb4F8xc/G0iOf+TaeHLhUV+l5gDLm7O/V+6Dyb6ZBfV7sNEzpeHdNsOafq93A9ep6n
         cmxJhcqPzxT5CsbSw6CNGPYbfsysn60JImDhYsjBS8Xwnl4ljBTa1BGVYE8JR7NidCcq
         X2bjDgQuDKOoONd3DRDSlOL8YJSqQfckCEFLc18FlMd1mhcpvlsrcZmdySIq0ogYWjer
         P8n13hgZiewKaZsbJWp0cu5iZKoUyOqYWmMk08ujJTg32FS/9ZUHGDjZZoDvObDC4m9f
         x9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926077; x=1732530877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7YU9L/ihohCgSGV7XFCQCDHEXAXKVeCUTFSk43kuSs=;
        b=V2UEk/1nKnAkK2QrSABbLa0d5JhYnbhm43XcNdED4z00NnIBysbQ5jrFdkMEuUD5RI
         dd+LrODf8PBAjTVLj1nq40B8w/WYGKMNsTHPMNMrWRxoRE4ZzbdKWMV+dAteSnrbcPJA
         tydL71f1QUPwRxQZ8vt0QdWfLOiKF4fen+fBP7vObqW5YhLjJlqPJpnSt1Yvs1eeLOdg
         DZgDBnDLPEB/iXoU1RzmbRfo6sa2VyYrHCircSEyKK7O1D1E4Z5he4KV/vVRsqGQ5Bd9
         kQtouzxytNO/VDMBDKkVIqzUZaxgVtbTcpmQvW8IApcPa1mKErWRSw1oj9nUYu37AWu7
         G3wg==
X-Forwarded-Encrypted: i=1; AJvYcCVr0tbNeFxRO09O9P8zyyeNMl7zRj5SNGY6aKjFqKWq6Oifo3LSnrXtKX+d/s6j4mWVkokuVKRKn+kKiVX2m+0r@lists.infradead.org
X-Gm-Message-State: AOJu0YyRMpZ51y0wCQfla2bDMh3HB9DFAEFcoRKlYIJfZyBrNcsWE4Jy
	pmLeyju8NEXEG9LxIs7xoT2mFspyp2GhTEokWne7WuhrWOp0exC+nH2C4ndwMk/Xk+PG0HK+sVi
	q
X-Google-Smtp-Source: AGHT+IGwcJJL68jiIs4CpOJY91QszYJvr1I5b9vVKUwSfS1kEIk0ygwL6xoo18htvJHm4mOKTYcF8g==
X-Received: by 2002:a5d:6d8a:0:b0:382:484d:45da with SMTP id ffacd0b85a97d-382484d4782mr2179017f8f.6.1731926076817;
        Mon, 18 Nov 2024 02:34:36 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:5b7a:75b3:1e72:6e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38245e95925sm3162979f8f.111.2024.11.18.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:34:36 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 18 Nov 2024 11:34:30 +0100
Subject: [PATCH 2/2] arm64: defconfig: enable NXP PTN3222 eUSB2 to USB2
 redriver driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-x1e80100-crd-fp-v1-2-ec6b553a2e53@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
In-Reply-To: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_023438_628564_3A828C69 
X-CRM114-Status: UNSURE (   9.35  )
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

It is used in many of the Qualcomm X1 Elite laptops for additional USB-A
ports, USB fingerprint readers or similar peripherals.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0b8303eb498d..8b17d70b3b58 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1530,6 +1530,7 @@ CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
+CONFIG_PHY_NXP_PTN3222=m
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_CADENCE_TORRENT=m
 CONFIG_PHY_CADENCE_DPHY_RX=m

-- 
2.44.2


