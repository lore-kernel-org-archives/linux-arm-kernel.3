Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B13D3A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcSzd2hHGzMI1nKPL5Zq2z/Pr8ApxfIMOQ8qhhepbX8=; b=AvfGfjYVYRO8guEGAnSz/rezrV
	r3K3G0n6xeUr6O/t3Y3bNFYn/kNk5aARVIGHYRkMVPBs4gOzw8wB3AvtAA+j+YdE3NxM2cm6Lv5ws
	6qxl7UYtGx2Cm1IWLntwc/+JrOzx/ZjnrDtcQ4G1/qESvmVHTmpjuZwarmIPSbsFPSrAkxzW7sQh2
	22fIaRs4GROOi/V6blllT4TLGkP2URLaSNV2oJc1WhJceco/DWN72k7CJQvHnsyFrmhPRdsLZYFPU
	A1bRj//zFepYnTg0MDnI1jcjykoMAPmOyY8YAP9gKinkMX6yBxmW1iwOX0+zvn7y/0CaurRtrLL6C
	YQDmC83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tD2-0000000FsrD-2fdf;
	Tue, 29 Oct 2024 20:53:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slK-0000000FlG3-1fS3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315ce4d250so7107725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233460; x=1730838260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcSzd2hHGzMI1nKPL5Zq2z/Pr8ApxfIMOQ8qhhepbX8=;
        b=jzCZRO6y8mzO4oofI7VkTtZOE223YkVf27LPOMOATdhCFzjn+0bvLKr+vOJN5o5QGK
         8LbdVqmeI3veFv2heUtfdxbZ3IexotvMNL7Jxebf0XirT/Z8/KXfn9S/Un9XB5yvoSOP
         apgtF+6K5linu2CRb1al2HREVbu3zOyx7Bq3/80JtyNINNoWW/SJXHPRL4F7za1fGmR0
         cNV+hYw0eoXm8WOeIrgT+rZNbJGI7nkW8QkcCSBBonmIZ+/l72PZKfUaKvBcSANsIdRW
         P14qccRGpdUz6FvLLLLHtV43SRzvCJpKZAKjr/ijIFWMZbRp7bodY3DWl0+fFyAewFfN
         ab8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233460; x=1730838260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcSzd2hHGzMI1nKPL5Zq2z/Pr8ApxfIMOQ8qhhepbX8=;
        b=jFc8oCCd1xxnOucc+CyiqbhAqGNZ58QdljREoboicOAXSFtToK8jIuhzDMS1hORXlH
         PI27uMJXJX5caRnmlNxA5jbqvrk2UVJI8LjM2i8+T5VsM4BWM0mctYYzRE5XSpHM16bF
         KLpSlfQuOHVhKgQa4e3BJjGwaDDNAeLJ/VfQJ9ZwahncMdIpgh3fAkSNcg6MS4bh36wk
         MZv5TP87723j8nhgcF7eyD6bHQz2l9I5qUQ7MAQVe0xfLr6NqyIWBmG5W8AMgpOn7O83
         6HGGYAQz5yJWBOj2yiF8xBQIeRVIE9oT0MTV0ShKeh9GGpq2YJT/MhEDPY+SN02LGUen
         El9w==
X-Forwarded-Encrypted: i=1; AJvYcCV0OShZshX8rQyVv/dnAWSLWUKNeId6uxUiLbyO4JONpmyFCz+VjQAClxxOoG9/J2BdIO2/v9zAgVwITIYFZ83t@lists.infradead.org
X-Gm-Message-State: AOJu0YySjuBbNJ+8fW4JrppjbeGhqEAwdBPvmgy+CpkORvZZzjZ2GYyd
	AXyxIYu/06GZo+b0T8vWz7Z0FlQmSCvOd/oZgwo4BJiQ9EEKaSSF
X-Google-Smtp-Source: AGHT+IFthbx5sF59M7JPXFTbmXBHaYzdi4tE1rj9Q7V6VVETB6DSTEN3Pzofg+o0yDuJbijtUURebA==
X-Received: by 2002:a05:600c:4fd4:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-4319ad41ba8mr47526965e9.8.1730233460330;
        Tue, 29 Oct 2024 13:24:20 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:19 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 16/23] dt-bindings: altera: add Enclustra Mercury SA1
Date: Tue, 29 Oct 2024 20:23:42 +0000
Message-Id: <20241029202349.69442-17-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132422_451512_A0AA46FE 
X-CRM114-Status: UNSURE (   9.02  )
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

Update the DT binding for the Enclustra Mercury+ SA1 SoM

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 8c7575455..87a22d2a4 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -51,6 +51,16 @@ properties:
           - const: altr,socfpga-cyclone5
           - const: altr,socfpga
 
+      - description: Mercury SA1 boards
+        items:
+          - enum:
+              - enclustra,mercury-sa1-pe1
+              - enclustra,mercury-sa1-pe3
+              - enclustra,mercury-sa1-st1
+          - const: enclustra,mercury-sa1
+          - const: altr,socfpga-cyclone5
+          - const: altr,socfpga
+
       - description: Stratix 10 boards
         items:
           - enum:
-- 
2.25.1


