Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E6EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jQJntvtFNmhsJjBeprIa6dD80s/DsqB4EFJk8MMruo=; b=fO9YJlJSQF6bflbUMnNusckh8Y
	YkfW22pL7XSvjiwTxuTmS46c6wlzHGDcMf69yM1ycozTEm/Q90wAPgg2Z161E3Em7NV8hTcXYYwkc
	IHygDg9UPQWcY0c8e+/JzkxE62oQdFxJQeQgL/E9OM5L9nlZmDNanV/ZyiokZnDdDOtSN2uLZL1Gq
	NaIzFrQJwPOSymlf+SlZT4tFCsnHGB7kUAMkbsdXayxmaG884ClKoxRFvySGOE2NIedGSzlsCjHul
	bGLcY1A2E1qsVy+9bR2Oc8NYaMjmAiZHoJ6De8OZVApWMFSNxzGujGQ1/1mXUtMgMDClefYKDBaGJ
	ByPIrywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Vt-00000006695-2U3k;
	Tue, 24 Jun 2025 15:24:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45s-00000005nHV-35q8;
	Tue, 24 Jun 2025 13:53:49 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553dceb345eso5970581e87.1;
        Tue, 24 Jun 2025 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773227; x=1751378027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jQJntvtFNmhsJjBeprIa6dD80s/DsqB4EFJk8MMruo=;
        b=jORDghhv+v9PdrbtBgno/oq8XUesxQr3JydYw4hqG58/C67iUf0O8yX/T3KU6/nLhk
         tjez9hQkh4z9mMDV1+N/sYwwo2zw9P+cviPXoVbzHw9L5XDdia1kKJSCmgIqLqqjah6I
         3pPthVHdkwdylTM+LzJ5+fgpDwafHbd1fW/S3mLABwcWM773AfTX8MO6R21SiDM08Obf
         JOHGcjnXge+MTGOTO0gvGGuHBkSQPe2yzvdbUuhb6l9I0qboOlyzHCyaVPqMmcEiLGQS
         n9TiO3Nd+JcfF12s2gF7QJijllQlvABYzIiLQWzFw8kNiw2uQ1qg+g6vQHfH7rup1g3V
         WPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773227; x=1751378027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jQJntvtFNmhsJjBeprIa6dD80s/DsqB4EFJk8MMruo=;
        b=dAEPaHw44DIWtSpwY0liK1do6gJWpVlyrdwBOiHcv7q28GYT+zzDfjc63xtQ4Z51rA
         5qAHtZ7uL5gNXG5nkfxUC001i2oltSf7zgcUTAF3ncJEpjPmB9mq1rF6HPvxC6rsXrO6
         9MD0QoLWnFIjPJiL8eL5JGz5ab35K5ACNnqXQpieoneG2jnMO1g9AynYY211uT6nYzPf
         O4zh+ngeJ9vZFYQiO74NTTgN0tycZphBFAamglKmPhAwly9DlLObobWrEA+ojxRtqUmz
         CS5Fjo206+DqkFF27fGDKPgnvLSPy4wHJBtKGNaBCgy/Y1C6EH8xk18WpV/RDBfZNHLi
         WQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Etk7Y9U8SN+et4bGioW9pbAHpeMm6OqFS9NqysMtJMnUerbto11mq3gTEc4U6sS+XKr61x8r3fnSccG4rNgiow==@lists.infradead.org, AJvYcCWImFV64ewkqRbjxDzu+kyrfL3viLCVDyImYJf40oNd9RFxSGIJ05UCTPHYVMkVWdt1lD2bM2x0sr3QQo46@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2aaPTP2P30flTkshWUGyg8qFehE1p37d7y8oVhCNDWjNVKNfo
	Livi0vQYqtcA8EnSktjKX8G/gJNr5Ucu/riwVsIMcxT/aJKYwD/NxAtm
X-Gm-Gg: ASbGnctIy5U8aUZ2ld3bSGHe9/NGx9kFxaZS2Ka1x4BgpzF0+2ucpRXWEPYeejpoG+L
	zpCloEP1NqTkO3RbStmSjC6HK7jozetZ9FXM/e+EXOW0bqjMAyJ98YcZ9EOBWw8eQwam27daAZ2
	1LWhWnNUr3MambBpPW2FhPp8WYnYpADvH7JAWpTezmuN6nuwDfVQYWepJixTZd1AM/8PQeekzMK
	0PdGDY+mxE4ep4tJ/AbaLY45U52/S8ybATJFacoTVStTzEykhkndpk2XrbV0T2KqzhyK5lCwvEb
	IaE9BlI1IafjI7ubawQlCNaCvpP3cgztcQeuMuxc9UcxF8dldfmCYKmySincx4OhF7O9NPCnLV9
	Bxg6gnBSuKqRNCJMufyKrwTq/neMj1x9gNUZfCVinidp4Lu1EzuCqmRCb5AHHgw==
X-Google-Smtp-Source: AGHT+IFf2/S2YwjUMKEFcRmp45CHy3/r/DAg440cRi8qGGyTc2TTxQABrRcN2lyeM/hW/FQn99VBog==
X-Received: by 2002:ac2:5692:0:b0:553:d573:cd6d with SMTP id 2adb3069b0e04-553e3b990f6mr5756759e87.6.1750773227044;
        Tue, 24 Jun 2025 06:53:47 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:46 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 21/22] arm64: dts: amlogic: g12: add crypto node
Date: Tue, 24 Jun 2025 16:52:13 +0300
Message-Id: <20250624135214.1355051-22-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065348_772325_BB317285 
X-CRM114-Status: UNSURE (   8.51  )
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

This patch adds a crypto node declaration for Amlogic G12-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index dcc927a9da80..d9aaca9f9598 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1733,6 +1733,13 @@ internal_ephy: ethernet-phy@8 {
 					};
 				};
 			};
+
+			crypto: crypto@3e000 {
+				compatible = "amlogic,g12a-crypto";
+				reg = <0x0 0x3e000 0x0 0x48>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_CLK81>;
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.34.1


