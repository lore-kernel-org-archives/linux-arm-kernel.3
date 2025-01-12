Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BB3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=; b=J0V/+sjfugwZew
	QRJvG48v0eO97L2b6/Q4NDEz8jBjDPVcR7OTxrxOj4XXC0wYWkcoSBZdsG+fC0HsMAN4ccMLw7bRW
	OvCuCgxOl+9YeBxNYbUqp/FAN7HT7Wqu1iaRUrL8bGVRj1/GUPWoATXvsqPYIetp5atRXo2SyNFjJ
	LLMxzfj+5kEGSqdmuuZjBWBqLBM2Dm9aL1dvTy/Zy19bgybGmLm8F9qqTPNmHT8KVmGQ094bvcnhc
	HdCWwxucj4xBnbjcFQ421knqBGlrSlJwcu9ZekBmB6VuflmsCK1fMYnvrM2rze8oW9833aoOFgIbT
	89aJlWVOx8KeAv1k6bmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyFB-00000002nWv-1vAj;
	Sun, 12 Jan 2025 13:43:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyBL-00000002mkq-2qZa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:39:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361f09be37so4509865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689150; x=1737293950; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=;
        b=fu/W1rxm30BrmG/65iAC8Rsc1ydrZJMc7kSBN/eRFvze0M3mLfuGot6ZOluBt8iF+e
         EVERdAp5j10Gi4od5LMgwS0/gEU9tDIjL9tHbq159oro7v4dHnCY+ocT23Z9IQBtucrI
         eDyg/bEs0Nk3qTz/8f+XVyg/hARzlXuVkx8ipTEyp3GsT/76tR4YDo1BJl7HPxhUvl9+
         qPCaRXX7uDUi6OGVXaAl2X4YEXBE5eRp37IrhxDGioG7RPURAevb8dN4oWpR744pq8wu
         75ZyVf3FWDGD77Zc29cAvpsruYsKjwmPCeJqviPz0jV0Vl6vZ6fXZKgu9z4qnl+LzW+f
         2Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689150; x=1737293950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=;
        b=ezgWsXf7bjxmv9HKYvfIPmU++28l2JjCNsYV8clUyOOGGFOA0BaEwjlh9uhBjro9OX
         PQPdNDwtsZ10wiqp5igMV6tmFErH6HGsScq4zKX5YW06LYtW+piLEQYEOx7h6qBwSkEU
         m0vcdU2f0gPlHpsxF1Vee6j9awobBj+jgECAWS1WQmmcSozFVww+OZmoL/5FNeEF2e0u
         M0JDT4wKLsxcdrIzp3uNaewsu7UmRXGynvsFvGPTjS2QxmzhyXWrxR2UsOR2YPvSVF+M
         pQPWUHoedmnlu+fS+04I1NkF4SR2b+jP5HKPX4IFxOrbZi32EDZWMuuQ1ehAwn7ctpfe
         KAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlkArbJQOZL6LeFlw2emgeh9Fne24rnL1lQKj/hWDJjG0DfEcKN6n2ZSM4SGu/HoJqfd0NCFdg5TXzjtXR9dsO@lists.infradead.org
X-Gm-Message-State: AOJu0YzIIqWd8sJOJjMqLbanFyjczB+YA64z/vGx1mPKq/dCdUMAVzKA
	Tqh+jtSxbUmLCWB2LNa5N0IPNaEhUdMOBOSv0pNHkmET4xlPYTg3Ze03WYs8Qb4=
X-Gm-Gg: ASbGncteJPcz4NYnmhHvJxWIQKrvCOvWDAvMOIyMwvlwOCYRWOV/v+tei5FuDCyu2pK
	noARD/VtsAvZbiLYPEKBKbSQIP8HDnS9V2t1Q/N+Myyf29prz7ZsAllMeJ/iSQPerOIo01MerjL
	DM8iMtcBRqXUARJeIoG/5srxasSyFkFZgNLopSZkKbP/L/y2ViGl+wypOBfXDzBDC1DH4VqXI2K
	/qvCoqyLwxksrTEiYkQGxs06bQnn9+YK3uULYqt9KCMNdWWcZHLM3j/YWIqZl6xBWBeeQar
X-Google-Smtp-Source: AGHT+IHhfop11bEN74u0ET9V0abdMLDcSBys+gSbyZcc1Oyi50RffMGbjeAYxlnbPrRkwqyrU0ID3Q==
X-Received: by 2002:a05:600c:a09:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-436e2557087mr63456395e9.0.1736689150005;
        Sun, 12 Jan 2025 05:39:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] PCI: Simplify few things
Date: Sun, 12 Jan 2025 14:39:01 +0100
Message-Id: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXFg2cC/x2MQQqAMAzAviI9W3AVEf2KeJC1akHmWEEU2d8dH
 kNIXjBJKgZj9UKSS03PUMDVFfh9CZugcmGghrrGOUJ7zJ8BY5F8CC5pM4xekYe+a/uBiJmh1DH
 Jqvd/nuacP7HF0+1pAAAA
X-Change-ID: 20250112-syscon-phandle-args-pci-d97537922ddd
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=666;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x+i17n32J9BE3xJWGZWzaweD1AZbhL+oqQjbrPfkdJw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X3fpKo9Fo2SJTRBmFQDvDSbyoSOE5+H61jh
 WVIyJ+vkH2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF9wAKCRDBN2bmhouD
 1wnKD/4gxTfv+tXPYb5SNsiZrYl54aARJsvzHavNU/1Oep+K0WSyRw+jj2XwM3C+OYsw4RhApPR
 2OoXL0k+JjPCwoDdX5E3hGTdIpJR3TrixOEteHnc3xs2lxeeHh3nt9iRGa2ZjMlE+5p12BDy8K4
 hnhqOE8qIT5+j7vsJwTJt/7nQqwgCvBRY9JvlaKfc1TRRIY7Y4dOzvSSKhjA/KQrO18YaybJ3qq
 Bnace1Td91tf1hDQwMy6d/pmermVgtYHqtY84HNY7Rcqyul7VtiTmoXXPSqruEIKxupAoJie3T8
 hHv1Lj0AeEV3geNQ8/CviDs5+fHAt9ybjCdLevrdhunHcEic2U9dlpx0+Dn1rthZJj3oeXMdMno
 iWT6sI7VL+wUD7SrQBWQlst3HfwCKkQqj03Leh90PKuvyIeRaqgp+ZokavbtdyO4Mpd0gMgrL7Y
 gNBtIAMICO559+r6VpoXytH7OdIJKJ0Z7Ohn+sKk7PBh8kHMkC3+JTjNtSWQhyDNOcmh7Tu42DV
 2njcZXMQksL97QcbGfAcgi8U+WsG3HeITLzJVuNq8e8YHOuyjLNHhmeJ/axSTjMc0n5uiT61P4p
 6Il0Pk1UozPnyoc+VNNbPIYwGwkJ3S//dY8kkyV+srFvKF8rARseRo4CqNKvnnfVky4ozzDmdXA
 lSYkUsupahUkEmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053911_761131_D61AEB34 
X-CRM114-Status: UNSURE (   6.60  )
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

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      PCI: dwc: dra7xx: Use syscon_regmap_lookup_by_phandle_args
      PCI: dwc: layerscape: Use syscon_regmap_lookup_by_phandle_args

 drivers/pci/controller/dwc/pci-dra7xx.c     | 27 ++++++---------------------
 drivers/pci/controller/dwc/pci-layerscape.c | 10 ++++------
 2 files changed, 10 insertions(+), 27 deletions(-)
---
base-commit: 2ddfbff29a2d45551e8c3e4f0c6b7c4618de24b7
change-id: 20250112-syscon-phandle-args-pci-d97537922ddd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


