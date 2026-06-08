Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CA6CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOAhsbik0AVMh4szXNhMifsdGs/22DvtJLvQBea9fqI=; b=cuZ7RotW4b+Wx4PlejPUhV7FCx
	WZjzoxwqZ5vvu48C/xIu0nw4BmrFLo2jJMK37XuMbplTeisnAm9dRo5IVSJ1/NladRPWuMNadke3M
	qR9O/CKB6zyZm8RoDK6hav37uU58n7pTxNsVj6gY9yTyk8v4tyFlidmWW7nfjw30s57PwHlup7am5
	v58zB8qhUQr7tnaBVw5ryfM6wKWdxjrNOyhuBIv84OXBOsSjgWIvps45cGQnigiTlwgHxutV7ANGh
	+zgCUVzoWIMQN8ep/TJGzA1VmeH0H/94OEDsOJva03U9EjFrXYXYm9WE5N2CWH2fRjyA4ELVgKJUz
	ljAViJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas7-00000003jMV-0POD;
	Mon, 08 Jun 2026 14:22:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas3-00000003jHs-0t8q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:32 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bdb3fd39045so587115666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928550; x=1781533350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOAhsbik0AVMh4szXNhMifsdGs/22DvtJLvQBea9fqI=;
        b=lF81o3imM4P3kTQfE+0NhqKSpKdoU+svJGpr1r0yoTGueQXCvSLXm9A1cJRjfKfceL
         0httaVc17gntdM2COhaP7d050XGTkYlmMMm8T4BKTHEg1ndb3GZ92CKbcTPO+lMMdKnD
         vh0aP500UnwcXXIhH04o+w7mmsetBssKqdoYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928550; x=1781533350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOAhsbik0AVMh4szXNhMifsdGs/22DvtJLvQBea9fqI=;
        b=rEUH51Rd3svQ1/oCrJqG7vCkWy0BKRla9efbxqan4g5p3ZbiYDd5Y1Ugpf+2ew8Cy5
         CLidkX9AJ8euDkzaZBY/x7B9TJYn6jG1Tdbvq0wB2JaLJKQBr20iauMaMQtfK73ZOo5c
         qFHIGhGHpqjDj1SDHsRiUIbKNSj3xTuHODapbbaZTqdAr6vI7QDHFUXLybf6ARslqloY
         f8e3nh+Nbn6YmmSf+9HdutZLEpT99RLR7jj3H8XtFEdyX7i46k6jxtdjTGVQUzks4U8E
         sqlQHryWjvdZmxsh7JP8c9zFZFGXaZPNuDg2Kn2/7dVHRm5AIvTs25H6zBUiUlA/sLKI
         GMLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9m0pP/q1gPxatweBlP05RkQvkg9fy7qJWmDDxjyjJRIqYQE+qT6VJazC/Rtv5XF7LQxBhJzYGf9yKY46M2efQ5@lists.infradead.org
X-Gm-Message-State: AOJu0YxXC8UCmj3e+L2gCPt7nQHCqqC3W/zfryqfYz3zG0xSeCF53yJO
	u+CVtyuSQk0gUTJuGogBRj1GG8CBm5L1vwOZotlnaGIMmKgbijs4aa9sLwK2GYIqqrc=
X-Gm-Gg: Acq92OFH7kGy5FymS1amlW3kTJDp+NgfhhhNj0gEtXl6Fb7jEE1ZzJBLzUpDjJBZOy3
	MNDFbv+18/+LMSbrXQE+IMeerha/YqK6G8ym/BEyxZRTsiSqLjpNvz8fZo1gpQ6TQNZna+6aZbb
	f+CGEeb+an7HuEjDhgZxhDuZSJRz9Gdgtcfpt7Va9jm+MSNtlecFZsB61Vx+dqX8MMkdX8BTonL
	nZ+fhSerSSxxJwocVkpVTjsR0sdtovAQK2flYFfgNN2WrarLsgwMCi9UOL5neQjF4PxID4ADm1e
	JScFiNK2nZ5PS8UZzmtYqppydk6d33SnNb1B66k2nzk3BTUtKJXHUWJpr3bIbgS/voEdOfgs1jc
	VK+K7ujXQYxIR4lEPQXJs3urKr2xHn4GoFSguF02ziCs2aLGwcsv+UGd0mwrHE7qaBk3rpO9eHl
	O4rOJYq9AjIhZLFcwrePY4DCiU+yV+sloDMOyclJel9HWYYZlBAOlJ34p15sobpegClv4c/Otr8
	jQplJ+FQAHSKb+zKUVbydNh4rJrMxdFum+O2cOONwQ/ZeDJdm2VD8MgWMk=
X-Received: by 2002:a17:907:6eac:b0:bee:e2a2:bdbf with SMTP id a640c23a62f3a-bf37234cfe1mr764589466b.29.1780928549603;
        Mon, 08 Jun 2026 07:22:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 02/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Mon,  8 Jun 2026 16:20:19 +0200
Message-ID: <20260608142221.952245-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072231_276020_FA3E1521 
X-CRM114-Status: UNSURE (   9.95  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0


