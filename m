Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824ADC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KO2pL/LPzAk6bW0DPdWAZBSTIMWvqbQFEPPgH78ikCE=; b=0JV7hGN5qKZCsWJa2aRTUuCnTj
	BDqmvFqNnrYKECw2eNbPaXhWoPDRo9WE3B3sK1JLSRJXMjOBx7d8ihSfmmvcmLfA2ywURV87YHUbn
	mna+wz+DROIe1m31qCkBY9odSwOS1qvG4i4hUge/Fd7eHDGQdT/lWSqlhlQ+snbE6TGVuYsdI4zhB
	6KcykKy5aAiw/ZZ/Suy7SVFs+VDJB5zfP1AHnDb8fN6w7mn5vYwc6Ngx4WwJ11GI2hSCVwMP5J5dm
	Btq9vBlYjMi5jmFL6c5H463e+i1rBV9oaBd+ZrombUMAQOZOzUmVglkewkGPR50ieo9OEuw3L/N8D
	uBcHPWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjigR-0000000D1xa-0c68;
	Tue, 14 Jul 2026 19:20:47 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjigO-0000000D1w6-36Qg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:20:45 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7eb64371a2aso852390a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784056844; x=1784661644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO2pL/LPzAk6bW0DPdWAZBSTIMWvqbQFEPPgH78ikCE=;
        b=aVy3LdlJlsBVYOBEegaGA+BNivHksMVnIkuZ8QoUazETDNsqSu49SgRoMY3VK+354W
         HSeXeQcicZFAYFpHGKA5gL1ef4bpCDc0Su4GRBbnYQF8RUYlRf5wx9a+iEZGAkCMcpKB
         PQ/nuUV0GcRjxyIxNNUHOz8EQ+ZBzt0TR9B/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056844; x=1784661644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO2pL/LPzAk6bW0DPdWAZBSTIMWvqbQFEPPgH78ikCE=;
        b=kjy9q7OBZNb5OYHW/YCglDGh2/PReyP6wEtZ9IWB8GUAepa3JlEMw3fKky+Z988VjS
         3dJ5fmOC6+4iUYrcKYY6nsy/a71Fw3Zj7DgaKYF5F/NbtCnJ/vFioteKRvsS0qAH/KFN
         7xW2P+WrAzjBmxToU94uoYWpG4+uqDdif98p96smokr3m7AUDazafnf0N10pGgQrmW+A
         K1FOwniyK2WnhCpAl6rSdu9VF9x/Dg3U7j1XwhTJxPV/ymUaXwpcJaneEsldB3y7kLp1
         g1BnS5CMq7f79bNsuT3FwqcEtDwL5Csnxfub6NUA4ErKjFzyokY0XhErT1eDXw8fNbxT
         uwUg==
X-Forwarded-Encrypted: i=1; AFNElJ8v/twbdEARwHRDyTUtz6j8bfwzikX4m5qy1v7pPojxGJDTkO8qYKDllQJ6qTvqP+fPeWovLy9iRgdYbVlpYEnU@lists.infradead.org
X-Gm-Message-State: AOJu0YxG3wl3owRsZ2ZF/1L9dyUjC/NuNFlwk9/rBWRoRbaovDgB9oog
	vcPtPfBAPYOSe+ekK1CYzF9vJJWThtzbKCYg8t9ufyW5mTKCjZP4/izU13lUOoxjyg==
X-Gm-Gg: AfdE7cl3AxHd9IJHqbVhF8nEO09twZJk+WpuQFssApcUCV4CPgUx35WxhsPATn71TMe
	cuCt/NxYQQi0pB6xBA5zGzCCkjL7ITTh3nKXe8jYuJM521thgqzTCtPaxs9fhN8rAItIR1LcEdw
	59HXPbElqAiqqma8dsldxLNIXex42RV0lA1Wkov0pp5f9oF/NZ8P5WU/Be+qL+5kmnc40CygPFx
	SLZZTU5vMx/v8hfgs+b8ZwITj/eTlUOf3tLkSNfQoVFQ/Ys+fwAwTJUbEPZBBdhcnRXdJk9n8XR
	0fdiHNIPmWNuq2vedQko5ThIIoyBA5uExnkcqyAA9seowkewCqiO7RQ/KuUyDiGu7rT3wdgBn+9
	U7cfmr+av0f0/9mMHpY5O10TWTwbyjVE3zDWTfBnqdUut7tvUKZn/MBI8Cr+iv6DiuqEP+hGIkv
	bY96Tjldc=
X-Received: by 2002:a05:6830:4490:b0:7eb:d848:c867 with SMTP id 46e09a7af769-7ec095dba6emr9656696a34.6.1784056843773;
        Tue, 14 Jul 2026 12:20:43 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f27besm15476081a34.25.2026.07.14.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:20:43 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: serial: snps-dw-apb-uart: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:20:36 -0600
Message-ID: <20260714132035.v2.1.c1d92213393f49330ec14d0c670a802181b4fcbf@changeid>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122044_784796_B24480AF 
X-CRM114-Status: GOOD (  10.51  )
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

Add the compatible for the UARTs of the Rockchip RV1106, which are
compatible with the Synopsys DesignWare APB UART.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Split out into its own patch

 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 49f51b002879..c0d0524458c1 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -72,6 +72,7 @@ properties:
               - rockchip,rk3576-uart
               - rockchip,rk3588-uart
               - rockchip,rv1103b-uart
+              - rockchip,rv1106-uart
               - rockchip,rv1108-uart
               - rockchip,rv1126-uart
               - sophgo,sg2044-uart
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106c2

-- 
2.43.0


