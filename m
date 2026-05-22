Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EC8CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=; b=OvfNOSkbMICDhIaQo+FLMYLnxx
	8aluniBGTuiqML1VieYnYFGWiQP7YXTey8iljesVcYATwn/iqSQ9WJwsHan27I81SKXrh/tsQIRCP
	+q5p9nSY0aI0nJgnICTOsZ18moDec0/sjR0VQAIB7y9GjhnK2ZTLNePPcKZ+ubrtwHiXZTjwm6ZTh
	IR4ZsCqtv1WVj4uwFGxuJWLWES2NQ5AL7HC4LOR+s2TumO3MUnZgvPj2FjZanjQGSvTMR8xmPMVS9
	TA0nLMfLYFvneiMWYJwX0RzwGYtT4fXbJ5tnHURUm7Si941gbc/GeTWZBN7yU4l9x9BAQ/SxRCsMc
	ogzIz45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoE-0000000AwVl-2UQV;
	Fri, 22 May 2026 13:21:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnu-0000000AwHv-1Xjd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49048e043e5so2187055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456040; x=1780060840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=gTPyg/huy1N7bzVkarzSSHJhx0mvQiVXmRHCisxcrDvwzuf7rM4vuhXTxgZVRzIIdX
         3CWuimYx/ivYeN7joSwuiDFTAdN7iKQa+ktYijkE7sWfp4HSkgD/w2TSXgZ2NdvOL9HM
         2R3EJCzaXNa/YYtOAUbwaIJKrWcgFAgk6/uJwVyPxXAwPW15r3nbukltTURt9NNSlioL
         ksJBV3gwUCbGFgkMYbQFYhV1R5BaM1xznxjX4Nye/PYsIDbnNOHa/9xP0P5MwgYV2Spg
         H1UChIeose2dqCkKzV5xyY5mqjOYMPr5r6lwUi4ejpyE+YSK5JZEeUI0+OqF5D6t6W6X
         +TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456040; x=1780060840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxhTRa0jJQh6ofFG9sXlZ7aauhKliKnMeyOlOjmQWhU=;
        b=kus9SjkGFRTj0FVTq3nWMa0U3OQ9Rm+ukQKAjp8xPw+EwfvmRx/h+jbui6VsUlWbNy
         tVq85VxJAQ7UVn/LjRQSSHHaFRF2EbLpXsTKjnDSmG078lsVA6IOtNqcA7oI2ZkSwhvG
         dEZ0piekj8r/YmbchSBaFiKxpRKjuso7/WNYjaTRK/F/NEL4gRLLQxoQCNkOQX1Lo0bf
         tlwavbavmrUmmX7XiPe/2j92CsmgHI3B5zdDw/eoSrRf/H74S0wTbA11MEI5fH42cXoz
         A81qGxk//16cStBICgKDMAMnQh0xPp5cbjeWge63eJsgIjME74qqgwaFZrWRozjz3Eix
         nKYw==
X-Forwarded-Encrypted: i=1; AFNElJ+tlQNIDW8uL9tyogXOE+Q13MbJKNAqXyQt4nT6xQbZkwVNEFXHhmwWvx26oaCE3fpl9ipAa/ywFt4rWmYWd4XJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4HwOugx4mUdkjE/N46/1TrW371fmx+ZmITC8orVQ0GnVECRoJ
	h3PzPGPUwq80nt7tQX/T4Ibvtknr90vYf3flzhqs57EhcjFy2OV5GHQX
X-Gm-Gg: Acq92OGZ0eACMh4thBnNfLbqoZy9WRHclKe5QogR138/f90I62ClZFpEFQZRHobSp/b
	tmPbQJ3juyHWvlQp50KAUknvHwTj8IIFfHm9IzDPnd3HETluriX8N4MB6pfspx824ek2hOmSReM
	4VxQqWY6fZrbMvqAn0SfbLSjVM77sm+Jcve2u/oLgtQp6yIm0eDMuzonAiiu5kb02A1Io8r5Tgj
	Qpd+5nv9OosyHVEKtPSJ7dpEYF4tGo6Pz9UYoSBnzx7fIZwsMXsyyeY9dqkc4Jp5CSYnsZH9Ewb
	jNLQgOoxQQTQlNCd4ckKGUsGzyqy6TKRgDRK61pxdwi5zwhuoMUm8YQ06JAJqHus0OEzcSsajQH
	rWQ+a5perUmcFfjPlux/pJduvlmh2SxITqvGoFs43SRwm/esIyALKvwflO24E7sKo/NOWNOQ6Bt
	1Jv6ggUTKwGfMPxxz7a0Xy50YeJXasOvth3b+ObIEyRg==
X-Received: by 2002:a05:600c:a402:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-490426adf66mr39371215e9.13.1779456040467;
        Fri, 22 May 2026 06:20:40 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:39 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 03/11] dt-bindings: vendor-prefixes: Add Riverdi
Date: Fri, 22 May 2026 14:20:16 +0100
Message-ID: <20260522132014.226721-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062042_421884_7E651F61 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add vendor prefix for Riverdi Sp. z o.o, a design and manufacturer
of TFT display solutions.

Link: https://riverdi.com
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..bac056d486e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1403,6 +1403,8 @@ patternProperties:
     description: Embest RIoT
   "^riscv,.*":
     description: RISC-V Foundation
+  "^riverdi,.*":
+    description: Riverdi Sp. z o.o
   "^rockchip,.*":
     description: Rockchip Electronics Co., Ltd.
   "^rocktech,.*":
-- 
2.54.0


