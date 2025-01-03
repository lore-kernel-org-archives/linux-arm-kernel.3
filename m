Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 00:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=; b=agbUkdU38dCPVzLSbU3J1HfnkF
	Wjp6pDyx7fSD1565rwKXAsXPANppNEltofk1scgOUmcjhZG6hjIcPkZdhoSd6LFkT8yjH0hw84Yek
	7YhXJIITEFz4ENS1EBHaU+IRQ0SIKnyHBnHTmi2ySot4ZcI+eEn5a2T7RxY5a4N6H6ilRNldQuMyy
	plv/BayD6Kv+bJXYOOQSeFjWp7GCep2B3SM2j5Q9ghASVrImNefQiF6yRs3rPpdddb6dn5HlEAgE+
	LpBb4CF/6DA3vGwDif4qHaYS0qiJkHZcuYj1y4Vrw81EB37DQS1hT2ciAHhArkuZiCeTdE3sEVZ3a
	T5PcPH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVoh-0000000BmgJ-2TGu;
	Fri, 03 Jan 2025 00:45:31 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVl7-0000000BmAB-3wsP;
	Fri, 03 Jan 2025 00:41:51 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3eb7f3b1342so5028271b6e.1;
        Thu, 02 Jan 2025 16:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735864909; x=1736469709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=XdPalaloEdoEAzA4wSOmuTUkHa+co+WKKjQEjsbOq9jG3B9wfmE52Mbnk4ybFi1iu4
         Ug8avrRwa8y1WuzHKzGB2DhRcDSwpqKmSC7QSIwQ7WxO7s93jPVOZmqgZyF5ay14zT2C
         EsuPXZRu+wT4Xi5Z+fIqZFD/64swmdGQfHl5720C/NDKF7B0Ec3udaf73oaa6GOS/yi3
         U8h4Lq3eNzM9uRgoW9WCCi8TrZ0lAuDT7nc8xY+Y94aMSDS7CoVuuiEeDILvmQIJcusL
         ngCxVwsmAAv4A0emHa4Mn0JyNlSvA0478MaDyFgI+I07BmbHYZhYDT4xelGSXUVzCttq
         1JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735864909; x=1736469709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zcYlsUzO0vGDNcLCnF4KdwOB7P4WtjzUTN//CHxhAU=;
        b=FVKS0kuWKbab1MkocR0BCWNQgkWAEjIB+6sycPS5YQiW+xiM76dvalLdyjIe+WNsm/
         I0tE9deJ/YW979f9r8JftxQmO6rvOc3gU9mjSKnsXrZKLmdvoaxFAPtteLE8tdx+YkaM
         RdHNfvNz6qnVJ1B2yzaH49DnTs1bZ+OkGqmXkiPzfaflNHqSTD6n1ImIagiPLYlWRg7W
         0uGpqQR8l1Zhp17BrZmRdQOIqjYTVTIKSMtV+r6rez3sIO7ckjJrBv4pX/0IZnXo1Ct3
         VNDcHW1ZdFuHyHOlUQW3O6c/VOpLiSvjeFuULjpD4fMJATU3E1UGUfmiu1qmTK31IpHg
         FBzw==
X-Forwarded-Encrypted: i=1; AJvYcCV3s7w8AQYMdb195uHxCJKqIyAq7T5Y25/+RiP8IH2umdPBXKsRXAJN+gXMlcr5SLdBp6MKXjA1LMqexzUrfGU=@lists.infradead.org, AJvYcCX6OmbA+299TLczKwxrzdluefvnxvAMmLn+cbNNVKF5bnKwlGrAcMRJH6srn2vOKvpM9dD8PSN1xAMytPKWbrDK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8s+2l2T5Q6UA4ztHHHRkAt/ZA+x7zxpebbCW+6qqwoI1UFIcd
	m3u8dYp2fPrUxZgLWl9QSPJ0DhVXRhIoyQoJ0ScB62e1bl+mC4Zt
X-Gm-Gg: ASbGncvrXj+5dBFEViieaKZBZtGmMBxe+/HnmAEBSrEO9g5A31ITZKl+ZvgwHsKZInB
	mQg2tg3DhmpHC481riCOEIOQzHXDErqV+4D2dY50cBQtea60Q7orwzkfK5772klAVp4OCcOwq5w
	5oYLJnHZT1FSD/gkI/dSgW7oOoxK2ZqNMgU8ie8/JaVMCBQ3lz75DZzGjPxDFEPxJqDB7611we/
	uAgz9qVfjZ5H9utyGvjETRE12CtTEsLWW8gp34LJncyZ8Ee6YtMFIwEWnNaxMbG9g==
X-Google-Smtp-Source: AGHT+IFtQp/jVG0/huyhpVJeDXZ91IwLp+MBtb2GIhwvtDv8CqZDax9GO8dkN1aCVvu7z1at7XR+gA==
X-Received: by 2002:a05:6808:23d6:b0:3e5:f9ee:a2b3 with SMTP id 5614622812f47-3ed88eb62dcmr34524574b6e.4.1735864908831;
        Thu, 02 Jan 2025 16:41:48 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:19f2:4f54:d97c:af6e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece2549542sm8087778b6e.32.2025.01.02.16.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 16:41:47 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/4] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
Date: Thu,  2 Jan 2025 18:41:11 -0600
Message-ID: <20250103004114.1902-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103004114.1902-1-honyuenkwun@gmail.com>
References: <20250103004114.1902-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_164149_976064_E61F0965 
X-CRM114-Status: UNSURE (   9.37  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Max board.

The Orange Pi 5 Max is a single board computer powered by the Rockchip
RK3588 similar to the Orange Pi 5 Plus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923..2a141d99c533 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1075,9 +1075,11 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Plus
+      - description: Xunlong Orange Pi 5 Max/Plus
         items:
-          - const: xunlong,orangepi-5-plus
+          - enum:
+              - xunlong,orangepi-5-max
+              - xunlong,orangepi-5-plus
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.47.1


