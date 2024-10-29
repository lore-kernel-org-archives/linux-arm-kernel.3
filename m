Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D51D3A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozG3F0d45Tc8g66cKQj6Gpf5cSc5WnMCj2YvzIalGjA=; b=gD8Bse3dmG4TR2vWN12LnsegVS
	dPGYZ8IDo9OU8+UX/N5F9rFWM6doDFjEy60KRbhDvQm+jL65RDcdrNbkjBeCMS4KcAxvkacLcNAQT
	go0aBrOlAExiQ9+UJDPo4yxJdFWwqqo2urPeqTvkNY5h9wLNefCIsd+5zEcw5tvA/u0cl6Fn8GSGy
	AwIHBhTlYsGiK+0jc8xQokHV6tZ+Er42z962GOi219xz+VoZte5sF3iOyigghadc/qCk3vPlF0gxw
	0BoijUWFag0dXlTnOjr//c1vvC2oJttQI77/vfk72jzWVqgMqQOHS0CEuLEdJAQkJkGQ12n4QOyI+
	OM6s7JrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5t6b-0000000Frd3-1qP5;
	Tue, 29 Oct 2024 20:46:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slD-0000000FlCZ-0Mwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43159555f29so4871715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233453; x=1730838253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozG3F0d45Tc8g66cKQj6Gpf5cSc5WnMCj2YvzIalGjA=;
        b=I70eixpBaMRyWoSyqX08Wwq//O5qa+83vzLCnjfdNAioyQUiNaCewXGj7N4RRmFqma
         2Bvvk0xhVhOzVzgw1wVIX4BLaAYHN8WjqzzzMmIdwM4gaTo+zudSGrYpTyzd2+8eWIYa
         yk+pBy+xZRg8SQlF9hUI7AfNC029R9RVywEjQZMhP9NTRZFZhy2DlIMqG0S/XtHtlQ6f
         PmCeQi0CEmGIPue0+tmiMu7YU6QDr18L4+bdi0ka8cHwh+76M0f245GbKAAINmBHcnPn
         Dxo/hzhSrAIOwB7ZAUnmLzJ0Byi59vMWMvU+RO2tcA9df1x3nxDZAuQ1EYO/+f2D2ruP
         x7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233453; x=1730838253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozG3F0d45Tc8g66cKQj6Gpf5cSc5WnMCj2YvzIalGjA=;
        b=Sc4tGWQj0wa23vVF6M7ks2GHXVH1iIjiVYoXwthE/d3bvVRVi6/6ZfK1dBRqPwkApZ
         jgY0fs+S7VVtFngsyZRa3tzqelpC+bccZGJcTa6/9w5UG8aL1NpFyValj0uBTw+jtmZz
         O7QJRZ8HUGjSTin+O7SVf4XVKDvRVvK4Ng5h17cI5J69zvpgsRgNZ8TnVBqSUzEMeLx3
         DP71YH8rjqSyHSczpnBri7J0FEi0kU60I+QA2Ys38V20zOJ8Qyl/Feqx0pX2v81PIrqN
         sAWOENrRRwCqSh9VoJXSHPHCgzAt4ecn/bV+tCCFQaAFV9iGOQ7Rbtmla3MQ8pO0VBI7
         6Y7A==
X-Forwarded-Encrypted: i=1; AJvYcCVVouXZRALI6cdE5vjG4XcLkHzusAqQ9fFqIrVKBuvdhdd0CFLPrHxDnQPMckmmWf5k86IqDhzr0DDVMrhOKDYB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1/45myEbRGFA8m14Q0X+26x6F/ZHMRJxoSRNIDKw/klWYTuvw
	6hGLkS28IChynjRYxdrTjRHD8i6C+ZptIq88Eq794UG22MTlnM1o
X-Google-Smtp-Source: AGHT+IGHbXNtpVeRkay6QoXYzvaEQf3MjkyLQHiS5jkm/oeLQ1Uj4ljCcnFMbwCNEC3ab9YAHsxiog==
X-Received: by 2002:a05:600c:468d:b0:42c:aeee:80c with SMTP id 5b1f17b1804b1-4319ad74341mr49011315e9.9.1730233453136;
        Tue, 29 Oct 2024 13:24:13 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:12 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/23] dt-bindings: net: snps,dwmac: add support for Arria10
Date: Tue, 29 Oct 2024 20:23:38 +0000
Message-Id: <20241029202349.69442-13-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132415_158531_248BDFE1 
X-CRM114-Status: GOOD (  10.46  )
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

The hard processor system (HPS) on the Intel/Altera Arria10 provides
three Ethernet Media Access Controller (EMAC) peripherals. Each EMAC
can be used to transmit and receive data at 10/100/1000 Mbps over
ethernet connections in compliance with the IEEE 802.3 specification.
The EMACs on the Arria10 are instances of the Synopsis DesignWare
Universal 10/100/1000 Ethernet MAC, version 3.72a.

Support the Synopsis DesignWare version 3.72a, which is used in Intel's
Arria10 SoC, since it was missing.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 15073627c..d26bb77eb 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -26,6 +26,7 @@ select:
           - snps,dwmac-3.610
           - snps,dwmac-3.70a
           - snps,dwmac-3.710
+          - snps,dwmac-3.72a
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
@@ -88,6 +89,7 @@ properties:
         - snps,dwmac-3.610
         - snps,dwmac-3.70a
         - snps,dwmac-3.710
+        - snps,dwmac-3.72a
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
-- 
2.25.1


