Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CA7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=; b=0hkLjhSyVlUuEF0cVyQG4diTxo
	e3c2ho4dy8tENjlIgKfHmR6xUAXk+2o9exRxJVfp57EZxXg+nD7ZJDn/620DiWtxCRH+WVsBZjdDu
	nu8lkaKzhDPTcd8p+gWaJ5Bu71pxOv+P2qpZ4aN/y3SYbHiC1vmSk6iMxl6gfuZLbOrCTcYxYFoDZ
	KkgKI1ToouibqonhMSN0QM3+Ji6TqUQraY7nS8mfo2xoiB/NvhjmsMgoveQnL0ujdp6qi6IR5JEUh
	XRXSUIvRfhkk9EOxzBPsurMEjcusJFbXMy0m77Ym3a86ETb9xYsqERFebABxRWjaMF7pMCH29m+5t
	1n+dP8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNCW-00000005N6M-08Ma;
	Thu, 02 Jul 2026 19:35:56 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNCS-00000005N4h-1WM3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:35:55 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c888c2cff99so949437a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020952; x=1783625752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=daRf+O431mVOki8FYYyTXi0WV/9IHsmQ4TxaQVClT02WNT1fXUde+mHRs7nw0FpHVN
         /aTNGgp3AxCVrfpsj0cpzNzQc477Oep6dWAa2KZf95eZNoIe3+yjFQGz+gLIkztehi8n
         AqzcNPKPaoy0CDgy1xuOUJcOgfG8IFrQMeuHGnIhzBqMat33KhBZBcOZIHGe7mNZzcSp
         cAYgpzx/EKUOtokVh3gBXcpGuAbCKMLa6I7lJW6QwOeWU9O8VyQYvqe7CjT+lj1+izWu
         jcJVArTBi4AMtUchpX03jWIei8kY+2Gj1TXFv3cIRtjhCxX+oEe2T/tWV8ZmmX1NN9Zu
         KcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020952; x=1783625752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=saPA1qRFW9LO6kD28FWZwRGpvI0HMt1Oc3PY4a2050eCddmrP6QzhwegOk6l+b4nYN
         LAIxk4sC6Nf6FIOoSqyJzRvuuSf1ccax+k6NT5g3GcQQJYGkFiqVh5z4yDIm89+37lhV
         YcLwiQYOSHApzeOMmCj+oZVcJxiQCqumm+Cn7uuBGw8/TezHIDn44yFKCxd9dqtotfws
         zyR3VLSZ7IOlwARHh+HnLyi9KlUANHmiZq3EEhsynDPxdAqmCSbjO2ceIcd1x+YJOX2J
         TgA5pr4ro0WIIOL5/ecMZUasEjbcCLsequMom5pWXEcnomr8pYDvTHxssB+K/ONpLxlM
         Wagg==
X-Forwarded-Encrypted: i=1; AHgh+Rof8NZ+BjAYzDxdVrCZdUNoUE6wAWAGt/k976p10LUWBc+cvqWIeH3XqcJeb5O371Rg5xcVIV7tOR/rZDpeilN9@lists.infradead.org
X-Gm-Message-State: AOJu0YyP2Pf2EQ8YpS5xNdfUKpWiwWGjLhzOtdeoILcPezn+4fqGFizs
	BtWTe0QXkiTbz7kL51p4ULAy1ZRZa1zYDxDuWKp5mTQE0gJQ60Ot8zl0
X-Gm-Gg: AfdE7cmQGoJN/49Sx20qUehM2ZKQjM0e8wG7JFPBWsP/z7CieKrEGhNcBjd31k/Zwno
	Z/IzBkPA3KjZlS/Byd1YyOis/iKm0OUdl9H/h6spoKYlTMbay+ox3YKO7ycmTw11i3DpMf7ZEKR
	iGMlkEr2ZmxkgZymReKgs7z7ZV3QCEIntLdNDMeLBSNOFE3CoUM/9E8TgolOb9l/KbNYewRbyQR
	bvPQ9FUT7uJ1ThABH47+9tTwJJOwZyBa27XYbFoYkMtJLfWpHEDn919rYUrkfgLm8+UlCZXjRTG
	IUTh/IJXgI+EFEdY5t2BJRaF1ZoEkq/wCbkj/C2IGcg8sSlANdze7jJSdZ6jaa/k6UvtsBVnjfT
	g8oOoO3GwaQnRrgl7VhMn9+NDHnpHqWgnDuuONX6fAkdPRe2ca0WorRYS8XSl7U/h2rHx6mcPoj
	hBs/7rmYNBJm4=
X-Received: by 2002:a05:6a00:4f95:b0:847:9745:2f91 with SMTP id d2e1a72fcca58-847c5105275mr6728052b3a.28.1783020951613;
        Thu, 02 Jul 2026 12:35:51 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc188sm1844249b3a.4.2026.07.02.12.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:35:51 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Fri,  3 Jul 2026 03:35:36 +0800
Message-ID: <20260702193538.2195973-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702193538.2195973-1-coiaprant@gmail.com>
References: <20260702193538.2195973-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_123553_291353_47951F65 
X-CRM114-Status: UNSURE (   9.14  )
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

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3


