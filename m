Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC8EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBu5PO50COeanzLU9hRHdGtnyMlkKFNMWpi+El+MyHI=; b=t3zFUXAlBZoMWR/Q/HltI3vzd+
	3QT1PyzQqU9X22D7/BOQfP+X1qcv+bcz5PBCcZIX5SR8kYFf0b+GXrAflz7t54ykAWiz+30ukvlLY
	BJYtDM9pOPGwsMYnVRj7HFJ35FzHuqjStFco5xh06GAwyBHdpfKBq4XY85+XZ7HZYlaSLFczw1vgG
	SRsF3Nm9oWS9x06BOZdecpNUrZAgZAsC5l3nuy4kb5uJqhvVBExARRnMXfXmve4apuTyeqCvR8qcw
	4RDL6JaX4E7i22E1Si8AO7rxMt62Sq92ag38GSzW0sGiQtMOf+UeVWF5kIO7blOj3Kg1+pYDa2Vpi
	7TNwdq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwW-0000000D8CG-3vLf;
	Tue, 14 Jul 2026 19:37:24 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwQ-0000000D85i-2QyF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:37:19 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7eb64371a2aso861426a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057837; x=1784662637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBu5PO50COeanzLU9hRHdGtnyMlkKFNMWpi+El+MyHI=;
        b=Yx3cSedLi2Mes4e4bVlSwwAA4VnHWzdLnEEQMeBKQCvxghtqcArPNTa5SELKdlOmoY
         TRcSY6GM5QZb5TZMIRlBKpthpyZYRcXqakjFj5TFzxHf5cSswX38cbXzV4lVBTbKIi4H
         dp5kX7BdNpE+D1N+tU2qe5f4lkZGEOD6zRQNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057837; x=1784662637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBu5PO50COeanzLU9hRHdGtnyMlkKFNMWpi+El+MyHI=;
        b=CVn75kbWrUjyTGaYMYcXfET3gEH1WKdk85MlvbeVVtJAC1RkLMXEWCvb1xKqGs9P2d
         00LUUggGs/JNjjnLLm+Q+m5e3yaHQJsLS917YdIssnR8S5GfazvguKq6j2po3KSFLINc
         lnTn3PvXWCN+MqUZ+5MqhYz87vmTCMzqsqVwZjLo5i8tNQmDo7W51eyRlcisHlyA8zrg
         kY1gcKnXH6qJCAmfFCm7v+pKfQk59Bq7Yftlt3TO1IHarASSwkBln6Ae4bq1GaJ6UAJG
         eSb91JMRuvk+PvfazNG5b9CrUtLJEj7ApIvx92HHVVbM0Tbv2bdtHFT5r4EMeaVklDP9
         Gp8g==
X-Forwarded-Encrypted: i=1; AFNElJ/a1zgh4xry45Qd9h6T4YlF6ZLk83p7YcmVFM1rtFArpdtOO1iicz8lterJQoVj74+gKEKb3rQsgbnYm6LzTyjm@lists.infradead.org
X-Gm-Message-State: AOJu0YygIGW/WRwN4dTCiYD2/x4H24cB82rS0RL/k0AtkoPsnw0dR8tM
	o4u3FoXPUZpD3EI1sFqW+/FuVM2dEf7J/HDuBeFSTt56B1alBlVrRAMHIJt2M5dMYw==
X-Gm-Gg: AfdE7cnfg8+6LzS0pIiJne8UBhR8k2Cq3OZ9b7jejQQnQueQuoCXHyxHTlWE0jaN92M
	VPx+QpzZA+MUz6I72K522i40Bx1m8XzlE5PcIKLAhlKLnNY2RNAXVLVRaexnw1+/I1rE3G1TeYD
	mkJ3DCmbiuOYTq3Y4dpJ80vuC7gSxKJH+4+XRbu0kfOIkNKukIzcjxbuIbDZKQTqEcGzpjdkNOC
	jvvSxjgBZqvfSH/RMXkydeRpINi3gYS+gPXtJPdrx5k1VJJ6WosTU654vz6gBuPTx9mqN+LASJd
	bJbeUrJE8SIupj0e8UfOGOt/hQFneiu9TDyBF5ysyweFAZ3tD2kJatr5j3CgmNQF3XBbX65vj/e
	zu3Rfz36VaEQ4Vr08tywDGveDWHeTs/qnW3GeZtWNXhv19OX6bOeM0q1pzrNdPIpVEp+KHssbYa
	qxeebQkv5z/SyEtud3eQ==
X-Received: by 2002:a05:6830:2b25:b0:7dc:db3c:1d82 with SMTP id 46e09a7af769-7ec0963a968mr8895929a34.10.1784057837546;
        Tue, 14 Jul 2026 12:37:17 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:16 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
Date: Tue, 14 Jul 2026 13:36:42 -0600
Message-ID: <20260714193656.2196447-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714193656.2196447-1-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_123718_641549_9171A037 
X-CRM114-Status: GOOD (  10.57  )
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

Add the compatible for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..711029ee78af 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,11 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Luckfox Pico Mini B
+        items:
+          - const: luckfox,pico-mini-b
+          - const: rockchip,rv1103
+
       - description: Onion Omega4 Evaluation board
         items:
           - const: onion,omega4-evb
-- 
2.43.0


