Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CA2D609D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EX57ICOKMzOs0eby+nVmHR92z2ekmaeMdJuyR8QQpCo=; b=gdrgacFdxkSJ1lVf9yyRzL/CzL
	Z5TjWmaVoQECFGPDWgDmUeyT1hhDJTMwWhAQQirvuv9SLsorVZDewnd+dKq+RSsrrVPbcOVl73IWX
	FnU+k7bw+H+/MfdXRlVStvypTx5F923QHZmq7OPqSDkjh6n00mesegw/s+KefTJHREu+Ps1T077b+
	KzLFv/25S+KwhMb5LWhY/DJTcW5ahJ054kx0wliPtJF+KEagL/FjWGt62l5VwK5T7YJtax/ctXZvl
	BQq8EcuWjQV7zwDeTfHXKFzG4P2yYPjbtrZRixPq3HmhpTUEWOwYts6nRVXlJTvVFMOUI1tS+yOBa
	0PmZ8iXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnG-0000000Cvt8-2GGx;
	Wed, 27 Nov 2024 11:01:14 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFkN-0000000CvBe-0TPj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:58:17 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53df1e0641fso374565e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705093; x=1733309893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX57ICOKMzOs0eby+nVmHR92z2ekmaeMdJuyR8QQpCo=;
        b=sq4rbvKR5XtGl/OUuCcj1G761sK4rIQzGLaOrWSA996qGe/OyycWHtTBv6/6K/F2Tt
         bYAit0XJjZEZHPNdFK026RJ7m5MXR43HjFn8lpKcI81VvyGylkiichuk7ERkIloa/q27
         wYgc0j9Qd6hSo6vUE4mbi3FafqeJlccFIDjQ7f4tw+vWOnThSDnkQJB+prtaf08kBxP/
         HIj44ato4q9KJw4giJ1rcIb6cWQGQyX+p9UKlBYOr9JgqwVrF+Au7xbg6CfATiW/IT/W
         e5RY7xn3PfPNmHAbkC3WO7lNhsCRP9d3Rp+i834ppZ5mPQdvkus5yu+VkGDSnYGs1wqf
         6sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705093; x=1733309893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EX57ICOKMzOs0eby+nVmHR92z2ekmaeMdJuyR8QQpCo=;
        b=Pgm+wuyPYHgRlfwZMd9uHOOuyR32XfS93R0tU0tK99bVvP9MCHWRY22wMXipxxC8Dh
         3KLIlznXDmdxIei9ZVwdiXHjzI/UnU+qQyqi72h70edengkygeuHKABWRQSa9defSb32
         VitwhBZtTxwhznfsepCu3KQRGJMHJ+NmYFpL15kMNr/8kznuJQLVu0gDGoQ8pFISjeDW
         V5RLPwBlDibvKgH7G53uGXGnqvSRrDBJs/OsquP7fPAaH5twiLE3I2KujOa812YiWf+k
         ADMWqoEr9QWSITH+6D/LWwJJ4cTE0l4DaBEcjSJqSg4EphODw6RhJ5dB6qqf2RSz/T1H
         PDOA==
X-Forwarded-Encrypted: i=1; AJvYcCUejpupdK6SqOYszhKCfjYz5LbF1eYXLupWVm3Lz+NGsnYdN4kMTvhQAmhkZJYfOnpcH4K9XBTKK2v0B18VkYVF@lists.infradead.org
X-Gm-Message-State: AOJu0YzhQuZpOf326EqIRhAtZf97sEFuOn2mfWPN7beyNql51oNONNYH
	RJns8jmIM3D4iNSPT5q7Vt6kZ4Qp4fa4T2jU7+SXAvqjNDmo94Jr1zUbpLuGZzQ=
X-Gm-Gg: ASbGnctpwM0PfJzx5BIpCNh5Kl1aDQdSLxlQZ5k6TaQYzTG0woBfqg/q++Y19wkws+A
	T8fuEX7S8vm4HgQ9wCI4N1rpSmwFpI31c7z+ieR7/WxlOGNIA5XFmCW1FFZf8XD4+vD25MlkIjn
	8zViWHbQBnzctG0lQkwVADZ18UcK8058hJvJ7Zb+O6RfsbV+nC37Fdc8Oez8PUO06UFk6KJ9doW
	qZFR6UhbK/OnFqfpgW7mCnmCQXhCMjn3zxdQOvl325fRgHuyj/UKKHfWvg6j0CGO6siHlm2wUbN
	EzmS7ounW48JmSTXcJckThq1biimZw66tQ==
X-Google-Smtp-Source: AGHT+IEDZQbqWW03yw4ZJpKkkOp6D2uswnTAhfUmoQ8ZqjktXEwpbL7Kj9opKFu91DPbwMPyQP7BRw==
X-Received: by 2002:a05:6512:3b06:b0:53d:ab04:54ee with SMTP id 2adb3069b0e04-53df0107235mr1294962e87.41.1732705093247;
        Wed, 27 Nov 2024 02:58:13 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6db906sm412183566b.41.2024.11.27.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:58:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 10:58:12 +0000
Subject: [PATCH 2/9] dt-bindings: phy: samsung,usb3-drd-phy: add optional
 orientation-switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025815_147930_A7ED62E5 
X-CRM114-Status: UNSURE (   9.57  )
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

orientation-switch is the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation
change messages.

Add as an optional since not all versions of this phy currently support
or even need the orientation-switch.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1f8b35917b11..6c17a44718aa 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -51,6 +51,9 @@ properties:
   "#phy-cells":
     const: 1
 
+  orientation-switch:
+    $ref: /schemas/usb/usb-switch.yaml#/properties/orientation-switch
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:

-- 
2.47.0.338.g60cca15819-goog


