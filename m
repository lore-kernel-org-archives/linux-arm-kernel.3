Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33701C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dB6M/qa8E/LqUAyzo7cAKot20skT1kqM90AWopBSmro=; b=a0g5liR+49GTNQHf6nKsNU4te/
	PYTJtM27H2LEQbXO2SOvyXODyXx9zyI+4hiiSrSNv8ODwnIjt3EAMsLndQehn/lMIuXpFf36l+6kD
	KuK9s+sNloD6RES4CYXFBSWaDxH5Kr8pwnuKrPYprSowJLhRVT/VxsFZsYGrPhnptz4p0q5ilPAPp
	xeFF2ZHmC9bAetqp/zDQcbdp/eVLPnd3m3GNtuvlYi/W1tossuWm0lelVCJpOTDFsuPhRDjDqBg36
	dIDOeCHi5o4RO4cGO+h0ry/KfsOspcU56qvs7aDd3N+EI7JpcH2b7e/bWYsPb7WAibpuTFW9QDr6G
	FplUi59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey5s-00000002Zvd-15ML;
	Wed, 01 Jul 2026 16:47:24 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey5m-00000002Zt1-36wA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:47:22 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so15454345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924438; x=1783529238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB6M/qa8E/LqUAyzo7cAKot20skT1kqM90AWopBSmro=;
        b=C9JIRvfS1Wekxp220+jHMdWAt2ADY+c42FcGdpCI1EptuYT+3x2nqttw8zd5LfL084
         gC+4STxgr34SV6s+RCNp8i5lA4+JUvA9M4XvFX3D6p4L+ojhb/sk2ccQbOVEjFyIt+py
         GgBm9lssTxmidTKfWRLxnT3Asv8iGZnL7fsggJx8q8zpSeHD4qFI0BfcID9OEKAtsZt+
         yc3/3K+1bfP0aHojZaw3WCpMoOnosWIyql0aGuxNkQb/h4d94UGm593GKQc4xGxEHtHH
         whwnMhzUm3neZzeF2Hc9TZsNSgIj/ltUbw5kPzQakB5Nl1kYW76diarSszf9JJ/8YB0B
         Gcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924438; x=1783529238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dB6M/qa8E/LqUAyzo7cAKot20skT1kqM90AWopBSmro=;
        b=FpLl8JdRt+oUS8WhgjO6cdJ2d9FLcIpWwWFWblQjI3JuCFV4a3xFoI8S+aQg7LzCeV
         azN4KqyXBVJrCaUbP+UGqyVr15DNVbUAv9+VXrqWvdHFI+zWl0dR/TUd4zRDuBSNohXR
         V+7lgv4NcsKd5a64S7+rqQD3pDqDOE5yn3inNuhQvF5eP7ltXmQX10Y9aDLgwJueNC9/
         MRs0spmy1wUTVqGiZ8WcbT27RZKRKv1TPI0jKQ6bEwQzNDgCwsOaWVKVJ8koezSyF8BW
         wpsCzLmhTXfBRLFdTrNYCUmjjLpQlWnBbEsGnUdSGQ5vJqBvZKcVqCm5QLFMdwG+Tz8A
         5xzA==
X-Forwarded-Encrypted: i=1; AHgh+RoW3Sll7JM9OR+d9+9VNK5YtCPqLG8l7ccbA4bjU/jeORq51hPdMa6o/XepBnIqDcbOLOCg1CykZeg+z2o1sGk+@lists.infradead.org
X-Gm-Message-State: AOJu0YyNyVhZtPLIspP8Swp37NTDRqE3ADv49OEnqZvoLDRBqE2caIVr
	9kMiYG1zo3iKgQI8LD4c15cIilKZYL8BLeouHCnYyStVygRG+BpVum9Y
X-Gm-Gg: AfdE7clTxk33X5RirhNWPaxt1WYcyjG/PmEbJevGY8xwnREf1P0gO8wJIJTFPVmTG8w
	DyUMg458Z5SpRCtHp6FHxoW5eW9dCn1/yewEzRuibyk1GSuUItDebexJo8I4FkeYICG6lUspg6d
	KClE5MWmatErwwBJFBqprn30k8CRV6AQY3EouLKOiZXk4ClISnesyDWSQslvzmsVA+ggnzrfvBM
	Dv9dqB1KLnBNYGlFC57lW0ixkFtCyrueQCvbUH7CQ5MAZIc1/8t6UQU04UQrnKzH7tjiN9/iiVu
	YrRYjc9Tb4EzvVmck394CkBpDj+8lKnJlMZR1DllQOxSnJwGYtj1g9LahRUHzkZIrfsUG7k/XBU
	pbokqmCGTgwC4Nbu+lCR3g08v27PrdoOUpB0+wkrXCsJQ8ZkWLOOf++7CH3mtOsLYo8rVMuqp0I
	4uCBFtgsV8TRw=
X-Received: by 2002:a17:902:d482:b0:2ca:883b:3608 with SMTP id d9443c01a7336-2ca883b37e8mr16422805ad.28.1782924437695;
        Wed, 01 Jul 2026 09:47:17 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a911f4csm985015ad.29.2026.07.01.09.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:47:17 -0700 (PDT)
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
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Graperain G3568 series
Date: Thu,  2 Jul 2026 00:45:45 +0800
Message-ID: <20260701164543.3967388-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260701164543.3967388-3-coiaprant@gmail.com>
References: <20260701164543.3967388-3-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094718_782278_A7529A62 
X-CRM114-Status: GOOD (  10.72  )
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

Document the Graperain G3568 v2, which is a development board based on
the Rockchip RK3568 SoC.

Graperain G3568 series also have an SBC series with the suffix "box".

Graperain G3568 v2 belongs to development board series, not SBC series.

Link: https://www.graperain.cn/RK3568/RK3568-Development/ (China)
Link: https://www.graperain.com/ARM-Embedded-RK3568-Development-Board/ (Global)
Link: https://image.chukouplus.com/upload/C_153/product_file/20211022/6daddec9e400458816dd4c57ba807fc3.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d0..9eb2f66ba3856 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -684,6 +684,12 @@ properties:
           - const: google,veyron
           - const: rockchip,rk3288
 
+      - description: Graperain G3568 series board
+        items:
+          - enum:
+              - graperain,g3568-v2
+          - const: rockchip,rk3568
+
       - description: H96 Max V58 TV Box
         items:
           - const: haochuangyi,h96-max-v58
-- 
2.47.3


