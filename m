Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DBCCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=; b=rkl5fj1l3eyJcH40P7vx3XBDSb
	PZL4rT6Gvl1AjrCuKBnrfzPSWc2T25HK0qJKLkhtjuaG80BO/ZTOVWdLH7I/6VRe9UoX+xwUYMsCu
	gakAbxzVcYRw39ruGKHMJiltIN7sh4nCYQp04VYZL8I38QTmThl1rMlb6eT9TAO/BRKtI142QFIyO
	sCZojWbr79UnuwNyBlLNQfcrUxi1n5a5gmZWe2Thp4tze/tq3v6NRb9sQ5dcQ9uO7jm8NpoRMSqBs
	89FJ4dxLMKXeM3RKGdtf8x8gW1lbAPvSuVquvr8c0swPUC5FXywoqoboq5sxGH17ayOYy0axjZcSx
	anNLMciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1ec-00000008gnF-0rB1;
	Tue, 09 Sep 2025 16:57:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKt-00000006Hb3-0ZsK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 10:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=; b=AdohnLlOExG3oZL2Lct1Jju2PK
	OY52BZAxvXxG5O1jg7D5PLRvIqh0GHfs5LYalp+VpHYuhcA+0pXEmvea+IdH7thv/cOxF99JakqsB
	D4H1SsAHpK9g3rCMSlR+UrEjH1YmqNrFQHw0s8vN54Y7YlZZ8kdu0IsfxXATJ1LEvVKQ+K8fz2upj
	s9c8c6P7D1lf1z9ailhPC2kjRZuEMvYUNu5/oRp1YxbK3d0g7hE72fZTafu+gB2efa7ge+wnAJ0HF
	5JdsnZ5vNx2MbtahCgIbg9W8R2Ru0CsLij/afw6cX4Zk/TDTpXBPCWqJbmh0Ot/Lisksh+hz0mlhX
	i9DjOzzA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKq-00000005HUj-1Ovo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3e751508f21so426587f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412743; x=1758017543; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=FL5gOzSO8rp7ghlCLqLyyNADpHs+TeAlWCrtdTKjXIemcRyEyEsvu2t9vQB2v/DrLM
         aT4Me78ES/i3bQkZ7IK1G/R/udzmqFjUl+DXaf2ypZw6M7pi6y54HIeGMqYd5jwHC1Wi
         ZvJz6/2jDc0HqmAUeE0o3QAq4pk1R4JVMASRxEdQ5KgZZvOhSBx1f3LJRsxU6k4/BHhN
         qb3McahsVpQJCBl+Ffc76IqCbBYHvQI29Sf3xGpHhggljHHClGO+lvSne1q/6H/0XkPS
         FAemZok2+kaXvK/xfSC8M1jey58ogz4T226ZWzFGrmMxbKtct6X1ltmid7LHIJHnbLAa
         WIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412743; x=1758017543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8htGACZZYE1dIEbtDAUA+3P97IrmED7ZD9WcIPqTfx4=;
        b=Aw6/wAXar7nOy5wf+8Vi4OwtXwRADFpWUXDYl0s87KvzlEiOktHP3Do6jdRKoPm21S
         NLQJsoAsaSSqJVXuKI5Mo1brjW/pPENdS0KeL0DmCmtjY0KuILUC2YxdNTBTQ/IwdVVW
         H3TEjcFUXIkvk2+jz2iNmSoOMURIy0JMAd2m66z/Vw2jwD4DWZMDG7BoLUuBhmfC2pvM
         eoZXUhbYupVqz36h+sPDGwRItQ66nYJwE6zggRefj79+PQtlB1p8lWPTdOldOqKYY8hV
         BhzVMEyhVAZeAiGVeHzFZzZeA0Ekt3kJltpjGJNiEsWdda6idkh9MKNG3/7SOzUspsOo
         ltwg==
X-Forwarded-Encrypted: i=1; AJvYcCV8nXj4RI5B4V9SHHM0/v2xHDqJBiW9nvNQerMNCsRUiT+mMTR2dddf/PrswU8wuAAWVbZf2kBwach7kHgnM2U5@lists.infradead.org
X-Gm-Message-State: AOJu0YxRENXjHU5mBQFdnkvyWLP1rxp50veeLX0p+XkUsenU0Ka09HSI
	6ZYeK1HeM/Br0ZvofZaKJGdcLeMIWWO6o8rqwhUB2N9P+ScfsAN4hCRZ
X-Gm-Gg: ASbGncslwWG/vQ+UjqTve5zPF+nykQzT0YloVw+zCwYs1ehcVc70bbwzm/FKE4Ga9jb
	z36HJNshqZRYnMAN08gFPCrzGFQalSr4d+J/UKxPvGzMzpsecfSNCYZyLQXMngFOWVnZdPyY1X5
	uFpL4QhdM2NB5sTdkb27k248lC/XKD/rK4oXhadIypFKouqaNFs39UWhR8VXrIzMbklhPCBAePZ
	7taMYac+CpLQLmk74gIH2W/QJ3IRaRnHmudsRQM3NTfLb6/M8F+jEPB1FxBDAQ8ePLhlU7nGGxB
	pvY0U/3diRw+Zr/QK01Ag1bcCiRJXE1kUpM0kw+GnkoJOVp9r+EB3PNBw1QBhzhcW6kvR5ptucC
	GsiNy8SR/xzyOOCxWYPerO3mVDmWzUW952Du4x87MX3u9yIEmLdwRoDjW8OJiWjxDEf7PtmwWRR
	npFn8CNzVZgYCtqMZmGq6VpTFSCg==
X-Google-Smtp-Source: AGHT+IFNpcDqm5syw25D09i7ExBBWVEcooFgL+UUg7LLOjlL1pEopNlXuqGDOd1C5bTyB3d6ZXQWuA==
X-Received: by 2002:a5d:5f46:0:b0:3d8:e1de:7e4f with SMTP id ffacd0b85a97d-3e642da5119mr7865674f8f.21.1757412742627;
        Tue, 09 Sep 2025 03:12:22 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd2304e16sm229761215e9.7.2025.09.09.03.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:22 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:09 +0200
Subject: [PATCH v6 02/20] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111224_565259_C307E3A3 
X-CRM114-Status: GOOD (  10.81  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC is able to check the availability of a clock.
Allow to query the RCC with a firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 88e52f10d1ec..4d471e3d89bc 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -31,6 +31,11 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#access-controller-cells':
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
   clocks:
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
@@ -123,6 +128,7 @@ required:
   - reg
   - '#clock-cells'
   - '#reset-cells'
+  - '#access-controller-cells'
   - clocks
 
 additionalProperties: false
@@ -136,6 +142,7 @@ examples:
         reg = <0x44200000 0x10000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+        #access-controller-cells = <1>;
         clocks =  <&scmi_clk CK_SCMI_HSE>,
                   <&scmi_clk CK_SCMI_HSI>,
                   <&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0


