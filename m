Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC840E64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKz/6LOX+Qb687N6TewJgIJoPVXxUJjOmnFbpocgz8Q=; b=MK9pOVdbDukbl/TlD28roHzxAC
	QAQ8IPXnEfCSZgyToIAQOCbbVUaBytP0wB68fskjeGyTLk350g+kcsFP2vXwqaJb4pu4W+UtaaEC9
	omPdVeTbE/ha65YTZzFBMuL84JGngkbbmn3L/vtMxPJCeBKrEHjuQ0TxHVH60hpJOI5s75qtvSorJ
	FNuRwnm5xmd2GHByFghijiFw63DwAgpP7ufw8Pe5ifDSIu0srplYvbqEPLex/novsznZFDjjN8wTw
	9QWRAYZyeMDOEGm6aay9YToi2D48yVswJ97Wt5gOmO+LLodtF+cwFGQS1GnytX9oe6qWSZof89HpH
	H4zy9E0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISEX-00000009Sl9-3RKi;
	Tue, 03 Dec 2024 12:42:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISCZ-00000009SIK-2Jto
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:40:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa549f2fa32so831620066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229626; x=1733834426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKz/6LOX+Qb687N6TewJgIJoPVXxUJjOmnFbpocgz8Q=;
        b=o4WumyFHrShuQlxpB2Yc4rVThSjwDoirV9T92i91sI1DqcYIWNZcnet6pPg7DhmGeY
         lRmDbNK6InTnQjrMWosSfA5LKhn4Dl8CsCGeJbuROJUn54I/b3ptXcemldy3r04OY5ku
         j5QWZCH07HR3SyfnL+V3eJTFZe6L5QwIXAfPwwYTdM4KjdaJihRGoL5sOCY930LQ19Vh
         Tnv9gTXNQLEHGU0jdPRFlnocGYn4iQo8lzO3bmnEP1WOH3TNxXQx/7d8wE6qEi3GJVk9
         eZuRGiujWJkYXhxt1CgLLEeZk6SQgWzOZ+SHdY6nzPbO/qj7z9QvW0vhQBtnvBpUCeGw
         X8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229626; x=1733834426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKz/6LOX+Qb687N6TewJgIJoPVXxUJjOmnFbpocgz8Q=;
        b=U+dBazup2+UtSmDKziS+4tIJCsbeJi1ZDIG9RVvcY4tOiIw9t4hCDAwEimEUiXTf3s
         oKmAEiRX0mjRmpjF8ef6P6rb/nyFnF3qEw8J0qdd/QyGxVVARj0iLDf64IHahZoDgWgn
         igHNpfMUFiEvVZ94lo1M62JSXvLTxTplpOixQP5rCjkz2d7gIhpzPayYmmnJsIe9Pi+v
         cNpz34gNbz+L/rNQ+QVLBElqgQJqmMAz6cW9fi8Bl9VNxYz3uNPYehuIa7o3wOKGQ6LU
         jA7A+9kkRsPlW1ssxGNk4X7jcUIEuzOngf2/cHub8l8KCUVhv5kGF8aK932FaM/y+RjC
         FWtA==
X-Forwarded-Encrypted: i=1; AJvYcCU4QU6axvKqrTrssbQU87yJe2RNrtrzJ6PuD5pxHEdXAJQQ3kURLI3bVN1w9KvAzfUcRPphfPfcg+YWi/XBa/6j@lists.infradead.org
X-Gm-Message-State: AOJu0YwdSKU2YYj5rDAkO5PIbw9BcPH8qnafhWUFIxJLYIxbCI3pvA0A
	WF/QUBE2kVURnXgIH2bv6sGqp+T8PTAfjaBI8hqyU2QWdNT+UUXI7bHywXxuDDM=
X-Gm-Gg: ASbGncuKkmUlSImgbRgdKe/JpFKNmCTgvITVAhGJNHhBW8hyZ2Qlzy+jPvJ9+4O1Hyt
	Jq+RGvbjmdS6vtAGGjJ/9TJg3r6oQV7gXieBg++UnGIuI/K95/Dr/u74dOQEzcJ832jK5W74OPb
	mlgZ4+6uCiZPyV+HRNBNm3D2Od/RsXVw8lhC0MYjHqPcHiy1qOicGoUcOtIsTXJ0gCTKIijmFPK
	/pTUMKCrpu0tBp1yDNzNV8aD8MYCESb+NnIEdf+RPX/BPQYCWkUMkf6EbcNQTFUJHnjAP20e82T
	keDUwUQXVPWEbywms7Au5L5oIV7CnJJTDA==
X-Google-Smtp-Source: AGHT+IHQO6w8q/8y2vmYj3AwKDx8/AcSW1egkdyxl/hQEjDRsUnB02G5MYsyfeveHXAuRhqJX5unqQ==
X-Received: by 2002:a17:906:6a18:b0:a9e:c267:78c5 with SMTP id a640c23a62f3a-aa5f7f19e62mr225441066b.55.1733229626045;
        Tue, 03 Dec 2024 04:40:26 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:24 +0000
Subject: [PATCH v2 1/5] arm64: defconfig: enable Maxim TCPCI driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-1-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044027_591370_D9146D51 
X-CRM114-Status: UNSURE (   8.72  )
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

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..5080fe2ce776 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1121,6 +1121,7 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m

-- 
2.47.0.338.g60cca15819-goog


