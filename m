Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1EBCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRUWZKJz8QXcL7JDWXMsqyjuK/+v8dxv2RUaG2Er49I=; b=q4cB2aDBfdgyh2OaGpLx6SnCJ1
	f/q9FFkdumc1nWqiMTXeoqWX4/Gk/sp2ScyhKwc6E/y2uH3Bgm8Fm2PRAPRVTTAR2aiwi84h1Uek6
	wWHa3SzI6Of1oM/XDjJ7yOZjoMU9f7puL72DkZkc1AsFEIJd2z+h8Lwh+uBU/Q4putBqFLnXSn81U
	g6l743UCB48Zg25ZqqbKkkASS6Slv5qjiwRd8h/SsF3lfLmQTBnfGyY15yEtWlJaAUk/SgUrd+Lo0
	wWM5a0yekC6XzdUsDQN9vb0C1cYnS2haV6AoZQNBwNc7Ta97adb1gBgfGcpj0NGM6ZjCv2ZoNFOp0
	sGAfw4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECc-0000000HTz8-2dK7;
	Tue, 21 Oct 2025 15:23:10 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECY-0000000HTwW-45f4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:23:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b3ee18913c0so1096320666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761060185; x=1761664985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRUWZKJz8QXcL7JDWXMsqyjuK/+v8dxv2RUaG2Er49I=;
        b=XPDSPPaEUROALMNpfUPHgVznXrCcvKeCIa/ldJwWIEheUXederVmVTCzAGMFTLxrTI
         coOB86kqNLCByv/7SsQyqxun/hfFhIqYm5WThkPUSKV7l2SQ9ra/EFynMnmxN+QWFy6T
         NFiHM7s13xB1IOP2Ar3/2n87AdaFRGQcJwmx2n72th2r9PnGmIGsVi4C9kADhvsuBdO0
         /3f3jjEp92Flaio9Jghung46pz8B3xicOo6hvmIem85CAqoVWZuBMjIMZAaDW2hWVNqQ
         8DelTUr0LR7LOTWGABu66s3GFNHq9u/N4Oy1f/4pVYw1VyVc3nTAXb9PU9GLDYhTDsDC
         vGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060185; x=1761664985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRUWZKJz8QXcL7JDWXMsqyjuK/+v8dxv2RUaG2Er49I=;
        b=N/FO/JaPwkHta8O3v73sUX/XnF+gWg3GUzq65Mc5B9uhAp+521rjrHpvQUbnPlsAiK
         1bm6vNThBpCjsIj9lT8voT5I0ZEum47L5wAvAMbz95d/xhkztNBG5G62f4BJoVy5qkbD
         lJ8DFeU1BUMpYVqlvF8HBqOVZ6Z2TIBYbpG5eZaxI4qHhOl0DR0qvpoWbzLLjHBcD1IC
         sSe+PVhbVxDLtx2vXQ12h+oooW8ZQa4sqssNeLMSDm7lc9IM+SvQVplfYOszhfpmdXLX
         cnLZecIsBPhVIjzgcevqEWKBzSB6wrjMqXcEnqnm4zL7waCf1QBv32jOuXAkiMUxYAeX
         Bhgg==
X-Forwarded-Encrypted: i=1; AJvYcCWI9Zc/1KHBs0Ym8xxLtC9ugxGMnd/xr1RuBepk27dZV6GxY1m21WRLt67Ob5Z6ipHO3Dni3Pm/DNBewyqDHraj@lists.infradead.org
X-Gm-Message-State: AOJu0YwUaRC4Wm8FEzkXzKpklX7HcnWVr+ZY2RsASbZaQvfvSQeIQB8N
	04eCQHaskpTPpJMiOcXVANKrZzGbu9K9KOQJPeCI8a7n7rmkmOSPVUO7
X-Gm-Gg: ASbGnctMisb3euH0gVGsKvi81WDM9fYbKUOp8jm5uaGKnjTv7c/zl6fpDZdrVLohzTV
	/E/B+2Ampvi1uglyfD2kdPazwVUVoz3n2eyVgdg4n61D6M1dQIVZ7/LOW61g+UcaV0tvvVrto5K
	PaY0uwcYYkuClA6awteU5FA+31lAL//VHrTLil8qzyB7Im95M1eqfXq25SJzUXuVlU90yhFXcFX
	vo1UnTZqWOS7rqAbZv4edHBcj/qIP3tza+AhI+KfrimG2tO/DlgTq+fLgeVNxZYLvSAgt581Js2
	XDvNl2GKJEWK+8t1hqZzBGjgBT6EDPmGN8OPiJjKCc3TtNKwjiPJ9/tU0Wv2utj1b7+sxXYAPAa
	zDmjojC4mGZO2bBedtEnbUDBjYSLvLoIVEjb7Fd25ZCfHfnk6Kmznggyjr3/W9XZ6zBWzgilEw9
	dPlY7rbCypCZbLiV8T0hiBIFbxO8Y=
X-Google-Smtp-Source: AGHT+IE+grqHyHjvdfn/+GTlut2T9pN+smpWyR3Zmo3k/imM3uqNFy7DYPHxH9YOxjwJjGQsNYol+A==
X-Received: by 2002:a17:907:1b15:b0:b48:4966:91a5 with SMTP id a640c23a62f3a-b6474439497mr2369303966b.30.1761060185029;
        Tue, 21 Oct 2025 08:23:05 -0700 (PDT)
Received: from tearch (pc142.ds2-s.us.edu.pl. [155.158.56.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm1082737866b.31.2025.10.21.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:23:04 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v3 1/5] dt-bindings: mfd: khadas-mcu: add new compatible for Khadas Edge 2
Date: Tue, 21 Oct 2025 17:22:41 +0200
Message-ID: <0e604eca9ad9ce71f74b6f3aae60bbb949697590.1761059314.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <cover.1761059314.git.efectn@protonmail.com>
References: <cover.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_082307_032269_18DD8D31 
X-CRM114-Status: GOOD (  11.35  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add new khadas,mcu-edge2 compatible which is going to be used with Khadas
Edge 2.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
index 084960fd5a1fd..c0f91eedfa8ab 100644
--- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -11,13 +11,14 @@ maintainers:
 
 description: |
   Khadas embeds a microcontroller on their VIM and Edge boards adding some
-  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
+  system feature as PWM Fan control (for VIM2 rev14, VIM3, Edge2), User memory
   storage, IR/Key resume control, system power LED control and more.
 
 properties:
   compatible:
     enum:
-      - khadas,mcu # MCU revision is discoverable
+      - khadas,mcu    # Used by VIM2 rev14, VIM3
+      - khadas,mcu-edge2 # Used by Edge2
 
   "#cooling-cells": # Only needed for boards having FAN control feature
     const: 2
-- 
2.51.1.dirty


