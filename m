Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6C3D609D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwFISXzC5YdjT7nYyo3FK0ynEMcXmWD+620yv0Db3ss=; b=RmQ89UpU8QrAxe7e1f2Nw7u6qp
	61FBzq9kmjSnmcE67SicAJwSRhv6kGl6ZoxQRY5jeMNCZZSiGKOM/mBtJOA4jbaaX4PVcsawXRoMQ
	4l7mcpp8ztaCkdowLo59GdpQLby3zNBh9nOXGoG1louoNQmAtxo1SCBa5VRJmiB+3/64MyeupFqx4
	3WEa51V6PTukbHPHJ86CNYWDFVtRwk2e3k4mo9F0Ht9AzValXe447Qnf4vQP98Uso4BMOuBV/hkmc
	+1A1ezDt/aHR4/2z2M5XNDloAgahGOsBWmR50ANCw5Noh6bXCE7zwut+qXIg0ZHobY+R+4j1RWVa4
	2cpSiZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFxh-0000000CxrC-0ujD;
	Wed, 27 Nov 2024 11:12:01 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnj-0000000Cw1Q-1ZAD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:44 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so7919245a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705301; x=1733310101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwFISXzC5YdjT7nYyo3FK0ynEMcXmWD+620yv0Db3ss=;
        b=eLpRbu1t5VGGRccDVSKVPlipxHjabqvVjil5vCpGaIkbahff2DJeWgaBj0euqA2cdb
         PglnCip1hS90ZWrxftag7W3S91GBajR4vB2FFamMUNfCo191TUSvvuyD1mqXe8Vuzt/f
         JWXeuNA6ppD67f/5l4AFTDrvpfvlyCuotldMQRzMSoj/ar01Ufio2mTPoVQ1hoPibFUu
         /jg/Gxn9hlr3MxZHTW3EnZCVkkTY3oCFQp5nP3sGkoMn8bauYJlvNeoKBEafRh+WihnT
         FB93m2bMUDUMdScbrZ2QrOmcv/4g4Bk679YKar/dHlvtpj1AjVX6sdTF3nbVcgLpGx49
         VYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705301; x=1733310101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwFISXzC5YdjT7nYyo3FK0ynEMcXmWD+620yv0Db3ss=;
        b=S6UJWMux45ipOHDE+0FtZOVKkLYDnIBq5DMqEPahWXOLL0OWPaiiRgvoNYMUQSwpx/
         H5Qs9JdhdPSc16UA8ZL0Ay9gvNB+ON1ZF0RxnSUnJX/3hdAH1XqK2EsDvxlssnd2zWtt
         se3VCMNHp0pvDOz/iPKjWBCDTREKAiHHjtuP7KgiKRkAMpKHhVqrdhSAhS55h18JnZzz
         v6NII8+W8BUhaSKjUfqj+fWNsEywOgc21pTHzq5KpSMd6pc4zDN931mseUGvQKqKwcQq
         o2PtTc+899eLeVpQ01J5lnLXlBtEtQeotoxr8YT2FTjBJK9fyyzOGI3RljaQp++lQt5Q
         LtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAyhdlZsrjkO2z/XRVmBLWDDi934nD965Lj/djh4WtnNwBijN7hp1legUf2ARjI11MvNaA0b+oEUZiZpCLW6E1@lists.infradead.org
X-Gm-Message-State: AOJu0YwEpfFS/y7ruHxAH01rZaEdi/76jzVdfYXMy2+9aAWcLHdGv/9h
	1hB4ptd05UV+wOoNYbCdxBACY0xHJTsSCQ5fi7FwVxzvGmE4ZM/R0Qb7f7JlhMc=
X-Gm-Gg: ASbGnctc0Ivgsi/7VhqsJLtg5WmrKUIxaVdJMSMYC5Vdl+HEsHDjdwBEbdS8txLCeXX
	XbWMTIX9bquNEBjLjrGwPACEPU7DTjhpkhYf0xHE/HiovDE8MpJIVEX0n2fbcPYWf1nc/AW8bDx
	ddlEEzhLfi0TJtvTv6Yk1bRamavc9q7IrStuI4T2ZVV5nWzDZ73yPwAe0SeeQoxI8IlWy9UKOgy
	TnKNRXJ7qJk7Z2uJ1WRVZ0Ek5rY4AWIu4AKhpfumuMhRof3ZMtO+vre7VkDVssiI94MYt3SJSLw
	18dmSt1iXKwylNw6kCfjwnw11StBw0IQCw==
X-Google-Smtp-Source: AGHT+IE4cyy/cDmo8WquVmKFdo7zSy462eB6By+Kdq+zP9Q+Ss+y6AajJ7PIBc5sONgo2uDxTZPy4A==
X-Received: by 2002:a17:906:2922:b0:aa5:639d:7cdb with SMTP id a640c23a62f3a-aa580f0ddfcmr151648066b.22.1732705301452;
        Wed, 27 Nov 2024 03:01:41 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:40 +0000
Subject: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030143_407843_9E6451B7 
X-CRM114-Status: GOOD (  10.94  )
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

On the surface, Maxim's max77759 appears identical to max33359. It
should still have a dedicated compatible, though, as it is a different
IC. This will allow for handling differences in case they are
discovered in the future.

max77759 is used on Google Pixel 6 and Pixel 6 Pro.

Add a dedicated compatible to allow for potential differences in the
future.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 20b62228371b..e11ede3684d4 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -13,8 +13,12 @@ description: Maxim TCPCI Type-C PD controller
 
 properties:
   compatible:
-    enum:
-      - maxim,max33359
+    oneOf:
+      - enum:
+          - maxim,max33359
+      - items:
+          - const: maxim,max77759
+          - const: maxim,max33359
 
   reg:
     maxItems: 1

-- 
2.47.0.338.g60cca15819-goog


