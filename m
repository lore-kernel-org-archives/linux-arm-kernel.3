Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFB2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NxuxqWbvyXC7ugR8MRCNznILz1F4+G4M9w5UTCg9J3I=; b=lFZ8HKxeK8Kl36WJvCiyGijtNC
	cP43CxPOVLuPngzTAdq/uQ3CwI9oSVDnd9biecNB5p7Y2QW+DTafRBTD8NzKVM9zm2aD0Gu24uKlu
	OWRuSsKvWegrqf3n1R0UpTe+ncqYvxS6TRE3It9dpdmmYNTmW96xe8u+zl8iNBBh7cP62WMA5O1sB
	qIA+8dawdHtECiI/7DoVO4swN2ddaQ/TdmODcYfSWw29Yf4xAoRsaUwdxl75yAdv17umLp1+T2yAj
	a57tkOvSouV1etOE1Ww/eyBlG8QOxfFRKWvlQ45FKeM+WtHW6vPORREqnkuxJUYniQuc1Ik+E48zJ
	W6l3tEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySTz-0000000GRtM-0EvA;
	Mon, 24 Aug 2026 11:04:51 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySTw-0000000GRrl-0fqW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:04:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so4538906a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569485; x=1788174285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NxuxqWbvyXC7ugR8MRCNznILz1F4+G4M9w5UTCg9J3I=;
        b=tceo5s2OmckRCQ+/0AGCk4UKplS55JU9N719TuoYLaxe8O8BXRPpq5OhKSG1D3Iydr
         B2P2vllWZZkZ6Cy0ZfmW6eJP0zemq+QjaE7/eJ1xiDtWOcQopISLseMNkgE9uDimPBo1
         M0h5EIRUBRC7vbM68HD5q4lmHpzwX+glPoQDkvZZTiaSpfeL1HaK7ABjLwSgFl8RIm7H
         iZqhIKJJR9glb9ujJu+OToMSKYLo8Enqb9AqDyNLCIEmjeY7T1/Yqh8j58oktNP6Bi7x
         aKXChXAgLnrLt/O0NlX5Qbu8G5R9qai6RJ3HX20mjoJKbI+r+UeIFpiaChhzL/VCiz2h
         y7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569485; x=1788174285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxuxqWbvyXC7ugR8MRCNznILz1F4+G4M9w5UTCg9J3I=;
        b=PsBPu5iFkkc/B1cYIQYl0vznjcWJ2mGJ9hVTUZODNqH/0vJyfihw/txiMKYm7koN0C
         bpmcGSz99mpR+NRPfWXS+bOYcVo726ugjn9j/rd3lfPW5IEQbAk+OJN47kZ8B56Tc8JY
         AxavnVVK4hXW/aSEMDbw80VCK/TS966Sg4/hgQxPX3TA9vpuLtlTKY5ikj2NYypQNYQ0
         4i1tpRW7uDvZdPaVyR2uaOmNCq9cK7DuvkanSJcZofW2dFUC5rb6Ds0Mx6juuKheSkdZ
         T60ZpWCnM7PKb2Y/61XgE6OGYLKn9VEFpGeUWwRLFW2qkNtcf68zhM0hIQbrf1rrxDv6
         2CCg==
X-Forwarded-Encrypted: i=1; AHgh+Rop4vIqM5N3ETajregkUkB5yr9Yq2n6U3qKkZItRqMmiHv/HKnNKQUxc6daYD0kdZCG5c2gqMFIRRHDhF0HKaNs@lists.infradead.org
X-Gm-Message-State: AFuF++k+tK6u90P5BEo9aiGATl3iOq9zHC28XSOp+pEOWR3Czi/1pTL6
	HFcpN5bDG0Bxr7B6FZSFgWzlJhDMkPZw/oV+Yf2z0Zra8BGwOxE+Z7v4T2IAqmawSDs=
X-Gm-Gg: AR+sD13rhjjRZEVFzPX8PlO9SuWGxfo3P9n+7z4hJLUWRBVfq3RKvtpXkNlrH0WchgZ
	uQMiYdJltrXkqAWL+fXc8SddUNQl07P/VFydbqeOooKjl/Q/lyIqrwjx3dVLdhrsbqR4y6cwLjB
	aSGpkOe5rGjIcZivsTm3BhbfrRgHIuOMebv7aW0EkIzCgQftya4+efBGabAtWGPSB9I7/Mk50hF
	DLscA9Yoo7MqgGDO9W1wFRNZI2q8NmvTEvSuk9mDHiRGOxAXbPrBH45Uktgvvm5WIs79DgTeN+k
	jl4sSX3i0uq7dan+JSkGOcNdilLn6FiYiakElyfqYg0C0QqCAQEHzyIXs9fqwfHvkhgDaBVggYY
	J/fFoH5DixAFO8uilz3X7WFHIkzKMKwpdBMxob6AvbyDSG/D35gQZKkPi1qTYE/8D+6hnTX4JRt
	zxRDCP/3xDBe9j9rVJLVNR+hLmXj7aYMGLfnkw/LrfpsoezngorjRA+jXN1rfg4kQXMob0/muX8
	rzvC/jRQvK7w7Jri/aOHa9K8pOvUCCET/kZNiLo6b24Jd6qISAeL6bWfrAl6pjDEPSvM5Ry9QtZ
	z1e1FP2QlKPvFzDY7nz/R8bVMJAO5eB0tMfAMw==
X-Received: by 2002:a17:906:9c93:b0:c24:6687:bf6a with SMTP id a640c23a62f3a-c2492663ee3mr1888041866b.21.1787569484828;
        Mon, 24 Aug 2026 04:04:44 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:43 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/4] dt-bindings: mmc: atmel,sama5d2-sdhci: add LAN969x compatible
Date: Mon, 24 Aug 2026 12:56:49 +0200
Message-ID: <20260824110432.1074136-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_040448_464058_F143EE6C 
X-CRM114-Status: UNSURE (   8.84  )
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

The SDHCI controller in the LAN969x family is compatible with the
SAM9X60 implementation. Add the microchip,lan9691-sdhci compatible
with microchip,sam9x60-sdhci as its fallback.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
index ba75623b7778..af1c66a1f882 100644
--- a/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/atmel,sama5d2-sdhci.yaml
@@ -21,6 +21,7 @@ properties:
           - microchip,sam9x60-sdhci
       - items:
           - enum:
+              - microchip,lan9691-sdhci
               - microchip,sam9x7-sdhci
               - microchip,sama7d65-sdhci
               - microchip,sama7g5-sdhci
-- 
2.55.0


