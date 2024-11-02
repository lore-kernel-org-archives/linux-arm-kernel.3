Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884C3E677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOkHw4o/DpBBAteKKHGiek6FnJvHtdDfQKLJ8jI641Y=; b=M0CLKMybSTqM8mXKMys3FmBJ5O
	Kt1fH06mpMQ6NR1kclEaoH3uD6Sx2mvuOghzMkItOx/Qzqz4HW/Mg/bRV4p1zao3ba4z3CS44d/6c
	wwL2RZ9O5NWKQkg+QspvHjr8VP+cQ/bV3n3XoCNRveJdpmBwviHCbAtDRsuAf/Lp98i9qpRIfGj3w
	3/ROHU0+PQnGdvliSlZijnELqpq6gm69rxG43Zmw021WStXV3H8d9+SXbT0jerXLN1XofYr/emRNk
	4BLaboalG2enJhUbvRyeDTpskX/BiRVJTlfoxHv9+TMTM/0551M5qxydkUgeb+H98jrM5f31TY7o2
	2sUcexyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Cdc-00000009cQz-0DVa;
	Sat, 02 Nov 2024 11:49:52 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CVd-00000009bLD-23Fq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:41:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a1e429b89so49877266b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730547696; x=1731152496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOkHw4o/DpBBAteKKHGiek6FnJvHtdDfQKLJ8jI641Y=;
        b=JgIwoXb3P9ZVyC5svvEZQcFQfS2egZBLSvVPvS5quDfLd/lyWohMJFdq/2BX+tZNkH
         7CiX67Fw0tBS45M8837Ci2mhnkXvPIc+tER1+Gf80yjKhF8rpZx5vtlZbkomCEO98NND
         JsEUMF+mfTq7CPd7UfVIRyw/03689LxikttDk9tXz0ZxHKE252ulhkWh2X9r6Y3YnxxZ
         n/E4fv2PtW4sYnJfkj537RhT9jPctbxonExBBrjvvJwLE3vS1LzFfOGV6zccfW4Jle7K
         6ZvDNTrSB9gQEQgMQiFS1FTRbf9M6471s4nlvxqMKBvW7QNnpk87Lsp68RJI4R+NR1gy
         ewsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547696; x=1731152496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOkHw4o/DpBBAteKKHGiek6FnJvHtdDfQKLJ8jI641Y=;
        b=v6xiJ0w6zps6xE4PnteXH1rK/qMdbLIEFDssIkF9e5vt2NGcMZIGE9p6WTErE8OEsu
         +vHahnqi6wWf/ymjT+odcO9DOjfVBNWAQPFhh0TGqYe4l6gci7f3uKrwS55izYKdOEIk
         2f/RB21tpujKqMS3WkJg/8aJG7e9nq91NIVmLuQZ7PWfVxMQ4UvrmEF1bgDCwC/fCCuG
         tzvBkJzfu66hcT+2HeUThHz0Homjpi+f3FWGunZb2E+xC3+0wBkVYV7xKh2STAHoiBmB
         faZhPBHiBaHrLkEv3RVmm9jZ0VKIQuu/pvhdOUS5oCJkZmEzvQ3KlxVk8uHbp8r/ZVs2
         AU2A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7l8rysCxTsJ1xUoHTYmyOmEoUzef9MKYtxw9B/Zx4TqKBdHEm7HjMKepKN7OYEfkZxkmh/fye2FqrZOmLoav@lists.infradead.org
X-Gm-Message-State: AOJu0YxPbWs8PYeIihhJuwxPqXETUv/mRHn8dS/XnthswvcpfgeqZ7jF
	14O/EJiS4nruHnPYzSxsnI6WL/Q3qYCvfI1XrMbjkdeVhCldFRJ1
X-Google-Smtp-Source: AGHT+IHjlFEbf282MF76qwHad6BykjaTigqFREVRHfAAOyoo0BQ9DtSIfDsLbquzvjN8C3vTjqzNpw==
X-Received: by 2002:a50:fb8b:0:b0:5ce:ccff:ac34 with SMTP id 4fb4d7f45d1cf-5ceccffaf12mr288807a12.6.1730547693808;
        Sat, 02 Nov 2024 04:41:33 -0700 (PDT)
Received: from 1bb4c87f881f.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceb11a7aaasm2224918a12.83.2024.11.02.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:41:32 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peppe.cavallaro@st.com,
	devicetree@vger.kernel.org,
	l.rubusch@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: net: snps,dwmac: add support for Arria10
Date: Sat,  2 Nov 2024 11:41:22 +0000
Message-Id: <20241102114122.4631-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241102114122.4631-1-l.rubusch@gmail.com>
References: <20241102114122.4631-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_044137_549465_2B303157 
X-CRM114-Status: GOOD (  10.60  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
2.39.2


