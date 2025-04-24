Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A0BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=; b=UZ3Q7aNO6PAXwPF/ufLdoYPP3g
	VxeVlHwF43ds+LHTXw/QWJQqhN0bzDmcEQHZUdLhicTaMu+ZkmutmvFbuXHXuWw1HXf2yd5CtFtRK
	CwTgoVEccXlkoGKNm3+rtNxjgU3+e1EUfWReNV0VF7bLoJ8C5tQtEvRKh+MM1mhwx1g/zxVEwzQ5I
	PR0X50vwpK6iHiaqbSDFKWWk6gyEI29YNh38n4uLbMYDwpR3jeSLVqIt+8e8KN38sMGxY0SXGSpwW
	I9ZMYIaZuTY1lYsv+2hkJAnhEAtY+mjGNKOYR8m+8ACvnWcybsTt8srdXs2439SZKI+DGYkmVpWyX
	GCP3xUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qHx-0000000D2MW-0Rtk;
	Thu, 24 Apr 2025 06:42:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyS-0000000CyXQ-3P0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so5557085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475735; x=1746080535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=Ly4QCDHVCNNA54V3LxfvV0mbzAXzbVsuFzgQbgvnDe3Ee0giqgdZ3kJmoquKBjaYlC
         HvtHbVtc0cmi/61afkfOS3v0KVT3+kmOCbPVzmYiLUMy7BqXFiq5byetMcYqieg31M+B
         G8V20gL2mSb3ewqNaPlcFNf/Q8VAsn3UiCm/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475735; x=1746080535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=NgXgvOu8832koJ0E2nvxgrlSlTTR0BoBe1+ujrldj60hPsRL3JbKqGR7VlOTYu3Cxb
         0UU8n+gM0lYfhix/SiU0F9egS0QIfueabjcELNW7R2yqYgdn09iUTx4LbKNTCUKu6Ebp
         8MqNRmQxHtTKLDtZD+xAd/HX84ibXm8npP2dRa+HUnXeyh8uxMLFVpARbx/fa7kKhISu
         inTxSRLM0r0lQzferqPU133GJ7GYZH8IJI1rg7E8hZStgGBjyZSX2JnXL/JirSERf2NJ
         i2s67QTvRE15cX1G/94UnWuqSd/x/kov1PUVW7rQpRqOIn6TFdxIjol7faMXYhsOY5vE
         smvw==
X-Forwarded-Encrypted: i=1; AJvYcCXSnjRvqzmNDWRwKdU+uDC0nibAONqmm6NhBSwSO9rtyZNCRMOVM9xhJ8Ci3KIgVpThnsrUXwDWQBJ5tiaLKLwN@lists.infradead.org
X-Gm-Message-State: AOJu0YwBmx+yuVUXlvPLb7e75Damo1G7wtT4lGwXj1mkwwP3GEGnXLFt
	/ECluNkQ1GFL3zta4Za8wfGCDEninbTyqDpKoX6xVgHOcpqNcGUh9KB/fPnUmXg=
X-Gm-Gg: ASbGncvNTBLLIaK2mP9LtfOh7WbQWm72/fxBdfYfOLbEeTIbAaJkG487O5t+0BzQnM0
	Dp9r+9G8oFFbZDOTPUarNdUyCW67mOm2S2a+pvkengUcTAwbajMXYEiBUlpLShCg4S4j+b6/QWF
	8EeQ6u3r4d4660HwF/uiMyxfBUf5Tw89Yd92s1cnjTZAsEazL9FJjsB6rwThab7vEYYPg+EAIBk
	J3yB7oUza7fSQUY8vWW2KJjEPj0e4R3+yXvyqhMr1XamG1neCyZxgaM5rQOrakwiveX5xOzOg+c
	jX4JDY+JEClrpmpgDtPaBATEICpj1XNUJhZpGghT3kAB1WXMZ3FfR3GtuaeMeyNQvZp+EWanNCU
	y0ipv
X-Google-Smtp-Source: AGHT+IFfEKxdwofjLbOX41KrgGZVFzC2ffJ2xkKI3k+BOtUiPjGXL5Rc03EhcJrNDo7yGHkwvRfbrQ==
X-Received: by 2002:a05:600c:1e8c:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-4409bd236ddmr9097865e9.1.1745475735057;
        Wed, 23 Apr 2025 23:22:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 09/19] arm64: dts: imx8mq: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:39 +0200
Message-ID: <20250424062154.2999219-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232216_845973_4BB97B67 
X-CRM114-Status: UNSURE (   8.49  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


