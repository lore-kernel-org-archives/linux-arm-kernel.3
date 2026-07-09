Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtEKXt5Jfmcl2mAH5O82uFyic1vAKOctoaDaAIxBYA8=; b=qupReEbpqrV3d8ILFPOoQNavLU
	8rL5tsjX7Z1UOpCFF2qAi2M23VOC9jVUse5IIPK90FaQa5IkvBoh2SN8by0zr4CDs1sKVdyRxvTYp
	SBgXMklyPZ5i8wqfEkhDDPEhz20LNibye1/soG702wVuBn1fjIS4B2IxHCYG9UaVaHICMLasAp3ie
	3IucJm5Rr42lSkRjup+wQlEi4QSZYcrTT7v+g1FX8R8KjR3o9ZgjRuI647dPrwy/JYB+FqI962UGd
	5JKjNPNYuf/r6ANzzHHp1GU8puqomZg1q7rUHXye4lspVHWvmOSm4bUwtKtnAv8PE7iz7HnhmwynX
	Po0Clf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnp-000000028Ve-2Joe;
	Thu, 09 Jul 2026 11:20:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnj-000000028St-3Vmu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so8966325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596018; x=1784200818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtEKXt5Jfmcl2mAH5O82uFyic1vAKOctoaDaAIxBYA8=;
        b=CgNwtFAcMdmW8oM1HrWDI5eDDNhkYHoG/82d8m4w7dQM/Bdocmksk9jkAKXXB7XydH
         cQNoTlYzuE1TKR2PThMLGcyUAds79HmRg5G97F2WwHq98PrmzLH8qoK3x7JQZcDTNc/c
         /cgYed0R6W+/4D8LU2JthaSJcrOQb1T5VYmjwk/CZvbSkSJMXNnzRiLtVabS6DEtq+FY
         lAvcRw1HeItGaOCctN5yLvek57TPfpOjutANBJaAlLyddCDhSPpfjRlpteyW6fb9Z1nV
         giDh2fiQyC+A0dKQufVxEeI2ce274kO9o1135a8OybpM3tprM6EEJU/tR3xTUPa5a86Z
         gp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596018; x=1784200818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtEKXt5Jfmcl2mAH5O82uFyic1vAKOctoaDaAIxBYA8=;
        b=OKEtsKITbanSyRufOQQbPLVQV2WC43dQHozByQcHXGz9qoC6f11FF6/l4uNk/HtYGr
         t4NpzGxp78KZ9kVQgV3cSboBHZ0OqQ7b9lhOh2gfx54LTir4uL56hQHNkuCnZ79eQl1I
         UjKMn7LW1HcrEe+HlaLUoN/opVxldIPfqvGo/ep5qLkFlFvUcggzdTsYZSQXa9APhHK0
         KxqIBIGHTKU9RMyylZwWsPgo3XJGlZU1DqhuRBayGE8gbQZ49CGgMzGuGkbQSycQkWQU
         iafCLO2tg7L7gU3XoAcZj2CWZ9EIvgnunO4uzhcrKQzu01sV3N5E7L5eOxq611EkeO61
         kBHA==
X-Forwarded-Encrypted: i=1; AHgh+RqmbwOvnLwln3KA5FzVsrFDdkIiXPtcljEibrrgk4Kxr2dMPcuzSwVY1AXuh3x/QSjvduTPpcWwiSFAoD5jA7cP@lists.infradead.org
X-Gm-Message-State: AOJu0YwsDs68VhO+jigyU193adS0SjR70tDaXtjGKRCEOuExeyYin93s
	2PrdxK8pwBYE2/OOfRdsVhZArXzNY+0MMlSGB20v/JPhfb3F0vmPbGShwjEX9aQfouw=
X-Gm-Gg: AfdE7cnSNv25azms6rYp7YCHeZC1at6kKmM9Yfwr9Del4QZD3WU9CNpyfCmhGtfT+hE
	7br7LNBVEwGfQiONdSEU94xnTDhdxBZt2fAbw+wcrhGTlEraMHxl3HeT2aO1j1ULiXMPQHqNBnz
	K8ABfR5GyZsmWnHHUXFr6notS0dI6ksPdLp/FZ3Z7XPCzdT42hDwMDWI4BYgrTIdTA6LXdmOmVM
	0LXUFMdEtde6ZR37IOlGPWPdMv6fNaHqnzGF8YU7qtAnzVyG2gAcvh9KxHbJua47QLvc76JKguQ
	x2/YXpoFI4uDmOQ6hPx/JazurRf6mm59XZpfiCERK00RquFBrxSIo5FrOl+wSY4APpg9vTzPiZ/
	krgwakeDNAOkjeRnPTHh/SVVGZqkRHQAlLpq4TmBwgLTYApGQLwDjTHfSHnCYyTMtch49/3T85T
	JzPpJC92RHU9peKp82YXldyd59IfLunFdgeiPA3VtegTIAHD3GYxezW+RvSr142kNI9Rr2dOT5d
	7DOjaUH0SQotzbWgwa1QPvxk4YBRYz5yjvaMvh/Q3E=
X-Received: by 2002:a05:600c:3b26:b0:493:e3e9:85fb with SMTP id 5b1f17b1804b1-493e685f1f6mr67303175e9.20.1783596017884;
        Thu, 09 Jul 2026 04:20:17 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:17 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/5] dt-bindings: spi: Document LAN969x QSPI
Date: Thu,  9 Jul 2026 13:19:07 +0200
Message-ID: <20260709112006.390742-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042019_885005_12616235 
X-CRM114-Status: UNSURE (   8.68  )
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

LAN969x has 2 QSPI instances, so document their compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
index 30ab42c95c08..36c698ced99b 100644
--- a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
@@ -22,6 +22,7 @@ properties:
       - microchip,sama7d65-ospi
       - microchip,sama7g5-qspi
       - microchip,sama7g5-ospi
+      - microchip,lan9691-qspi
 
   reg:
     items:
-- 
2.55.0


