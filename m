Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0593CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIHXHkF/8pZLgK+rwXO3tbSWnw+8GWfU/CEp6SLN7PM=; b=D7FpIhRQShM8Ijdw/xPu0dYji+
	geGAZofvxJbrPeMhZck4YKx2nXE6J0G4nOTALrmWK+7JT4nbpIug79mic6vKgcqZ8MkfJahvHdVYX
	1mcEQvV8t9NoFR0z5KisS/6H+g7vkiWaKbWZ6AFDWn7g8Pa23fG8QmG1FQ/7s0OJ+ooLaL5CDj1j9
	QKuWoOvjj3/rrqpLvUmJHv5tv6LHN0zWubmTdyJ5sxlmuz0PAtukwIqeXjops+btyGfE1J5DJ9P/b
	WUAuCGa/Cg9SwR7RdEN/okUdaL9sR74Fujmr/4nDZ91lpg5igNepyp6oJOerEN54h1aMtKGUlLQlC
	cGS4shgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTbC-0000000918z-1htp;
	Wed, 26 Mar 2025 16:27:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTXl-000000090Kr-0EHS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:23:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac25520a289so1244625166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1743006231; x=1743611031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIHXHkF/8pZLgK+rwXO3tbSWnw+8GWfU/CEp6SLN7PM=;
        b=JwISJZdGKZuq89ceoYDz6WN3qSUPay1sZj5HD3wVLytIAdLl/63QsxRXGd2B77YPfo
         /Hj2fYr+m7lEq3t0FAd6RR/CMWgViJJ8T3HPfOaEs/xalunFOrP6ba4eqeCdkAYlT/+Z
         vch0sN4UoFXQCTPEqHF9RjQ/Q4nb3oii9SBjUusKdALJCtA8srAy8yBvZOi7QEL1clOp
         OdcTjW9t+KDarxwofGgEbxyzGgDBenGroxJex7ZjRaJK3AwwFsfQEMk/NtOScaYoWLNG
         5ct9Ftkd2P/gCXaGTh+4r+DH6oGiYkj1M0+Ptm/Ac3GcMy69/sezbnYlitVda2LK2X16
         Ov3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006231; x=1743611031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIHXHkF/8pZLgK+rwXO3tbSWnw+8GWfU/CEp6SLN7PM=;
        b=YWlJJYg06H6iXXL0cwzV/4z0zbPoeH4rlibS+ed+VLlCKngoSbU16OO31MdwAoCVic
         nb/sdUHTAvbf9xPypQAB8lJPpD1J1WM6qop7OUnxt52oUZRjTWt3M8UA0WM8+eKWdRdU
         V63cs3gO2TSymrzxeyy6Y9tfEtpdeqtudsA/HLWqsQIKT9IZP/hacQ9NLl03CNN9Ao9e
         wtC0jnQqHgZiamTigO1kCgWdMyqFRtznt5FA9d/tzzbCqmk2bEtK/cQFzx9a5Prd8YWS
         WwbFByg8KG54kqZuelsEqMgrGZNWqUYtfZN39HT7J//GsUoZwhfL4geVX1QWYlbsUyJd
         ww1A==
X-Forwarded-Encrypted: i=1; AJvYcCXJwOqIeCllBzoLbrUoLHuI5wp8FkwjpLULUH+RlcGGBhvv0SnTAhCGscWALrU6iYqBL4qnF+JSjtEv3lIjP7hJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzs1icSRSClrWIFHDq/bNd6ifgEyx1am9d/XCDAtI6McS6ytZJ
	8R4f8WCNIIvtm5C7mMygE9IHnNNmVmpyMWcpxVDbggL2Ck+gGsbbylrl8AIAcq8=
X-Gm-Gg: ASbGncsjNoSyWDx577/+Zgw8APqRnOeq3/mNYUxctcFbjefuLTKZDTcG0Un5BC4YSj3
	lhGwyRUyZbCjQ1cl9DmelifeyTkpGgLMI/IjuomaAQYpJuRllsBdhUByBNVlmKfXXOZ0E4yfl/h
	sNul/K0y3g/Fs2vP6sUfieNSwqEPUxs0u+8MuCo/LZxw4QIMAwdSGnE0ZM2zoM3B0E3lCWJq/1p
	khm0q8b/ssV69/rpHUNiqQvRVTfESt4LBDTgwThMrk0DH9IRJBTNXaEaYl3cV+LkRqwb76WcmzN
	adgH97vrNSReD/hTDcDCGkhBcu+hA69JC34Z+OclUTpIbqDeWfGjLOKbHA==
X-Google-Smtp-Source: AGHT+IGX6YIZqj3EMmg9fstP7Tv4f5XMwVql68RmQX1PGbQYAIwS++PJhhjAX5oAjP1/BAdfxlVIAA==
X-Received: by 2002:a17:907:968b:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-ac6fae5fc76mr5632266b.8.1743006231199;
        Wed, 26 Mar 2025 09:23:51 -0700 (PDT)
Received: from [127.0.1.1] ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6f0f498ecsm76678866b.135.2025.03.26.09.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:23:50 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Wed, 26 Mar 2025 17:22:57 +0100
Subject: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
In-Reply-To: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 quentin.schulz@cherry.de, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_092353_096429_A1C024E8 
X-CRM114-Status: GOOD (  10.67  )
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

The Cypress HX3 hubs use different default PID value depending
on the variant. Update compatibles list.

Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3.0 family")
Cc: stable@vger.kernel.org # 6.6
Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb/misc/onboard_usb_dev.{c,h} driver
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index 1033b7a4b8f9..f0b93002bd02 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -15,8 +15,14 @@ allOf:
 properties:
   compatible:
     enum:
+      - usb4b4,6500
+      - usb4b4,6502
+      - usb4b4,6503
       - usb4b4,6504
       - usb4b4,6506
+      - usb4b4,6507
+      - usb4b4,6508
+      - usb4b4,650a
 
   reg: true
 

-- 
2.43.0


