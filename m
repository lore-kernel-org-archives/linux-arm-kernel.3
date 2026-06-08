Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3B0CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=LPQ5qV8MfUHjAZk4XLEys+GY3F
	C0fJbpkGkwNWO3ORtbgnwWmohrjhe9bDihH1xxMXmdmXhLPSL976R14cLpMrMjG+v77xUr+8XO1M/
	Z1KL1WQENvpDeHO/c2CvNOURxLYoAKDWTj/APqvbz25NztKbPCX4TMX25tRvPwYqbKmVDuMMZnAOk
	ANG+GhWLPzA12uQtqg0QT51awrmpydjchYD/HHZl+g9p+uOq5RAKhQXQnKrFmFyRrke+pmKTa9i9h
	XZxgHJlpZhMx98mEk+gBT84385eqFGXQO1AMT+ytsiS2eL1g+qVQqiyqgc2sABiaCyVc1S/gPrKOi
	DBfs/UOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas4-00000003jK6-3MqY;
	Mon, 08 Jun 2026 14:22:32 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas1-00000003jHF-498V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bed2195323cso634782966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928548; x=1781533348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=paJDKIRpPZYNuW1RK3JsK4285A6Xgsp6xScIcpywlcBSud0gc3gGFz0cYT7/7RMZKg
         nphZB0RfhIVQ1o8nPSSppxOLfLoyEoK0lo7f0v7NjjaLtDxUL6fNqOAfPyTOgjrZTShb
         k0qZoqOqunyiDWQXzplBDvUuRZJ6enMDjvArU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928548; x=1781533348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=FhN61EkPxfws9g1GF204izdJ3qu0S3DDjv+7nbrfpBvofhdH95QyDRrnmCKTOHnIAv
         8PxrzleKFaySdqs2gMyFPkxT8qNj97p/m5N1G8Zh/tGyItFwecZ8Ksjy1etGKax5qNXP
         dS2/0CPT/G5KS/AbcUv6eCpeMctuoFmcYX78iO0dAGRTyeIeNPeF4OGGBZE6c4pbk4nm
         fl6yDQD8P5JfnbkILiBjRW6Ij8nzS7eSNyFz/IIbvK8oYwt2vgVEFVpRHhIlHFz/IJ5X
         rpa2LK10hmPgM/4jX5/LjXFK5itvWc3+sZLu/FGf4zLNEmhrU/5RXmh4IpI2AiwiYt5k
         sNDA==
X-Forwarded-Encrypted: i=1; AFNElJ+izC5OnHLiuwQDNYhP97BhRm7tfaGctMFzAr0avJWJ06gpO+ybrFB5RvLNMGVjPcND0CA4JVykAQm0oiWNh7jc@lists.infradead.org
X-Gm-Message-State: AOJu0YzxWzVBy/eahZlXAzB9GF4ss2wCh41G6uBp+L3rxoKsVIP6l89+
	Of8dc4m8FvfkHE2mMwHr0m+79aRGY5JqJMec4Za1rx/OtNxXkJW3kwCTt0Z2R5GUGb0=
X-Gm-Gg: Acq92OE/8eQuKWCosvraVLXv3AopDolXUYYhZHhAAm3It7pcwhemyNrUu2k9yEwpRWj
	54swXRI5iMD4bbQZszzNi+EflL+frVBc1qxJ8FQstF3W1oxrauy3zZ8SmStRjKyYGB207COWVGz
	rku0e4pMHr+xvoxukSuAcDRNRJiHlUMtM0L3Vd2Cz6OdjQJz181nsA3WbfuZzMIOyPDVwz0+XM/
	CR4eil3xaX/2UeXB3qVucrvou1VNcQAE/tvTffMSwfGWsbEgaOL4g10QyFtpUcYk/gdoz7cpaw4
	F1RfrWO/xNk7cyc5qLIKsPqRw3Dn5uTktszZpHklZBS7Bqy3Qe//zF9C/i737vaMzmRsIiZT7Oc
	XUTM1cFrBGAjbv+upPxrV7ZwnRUNuPHObCi7eo0+8GASKuKwSUpKP5EbYsAhkCv3q91VtHva5Dy
	VIzfuaY6SRbBPSwrq4dSKlEbWjDv97GKM733FPxLvn0axpwaZshkA5YDOSsAkVEUxmayxCpEjOJ
	VjUp386EO1nrGNZtzT9HRB/LxS2uyrwX9Ph3NyIhdcZqjXCYyeYAbYoUBtytXbr0jx+2Q==
X-Received: by 2002:a17:907:75f2:b0:bec:2ad0:cba5 with SMTP id a640c23a62f3a-bf372159cbemr438523966b.29.1780928547685;
        Mon, 08 Jun 2026 07:22:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon,  8 Jun 2026 16:20:18 +0200
Message-ID: <20260608142221.952245-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072230_037565_00E36389 
X-CRM114-Status: UNSURE (   9.73  )
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

Add devicetree bindings for Engicam MicroGEA-STM32MP257-RMM board based
on the Engicam MicroGEA-STM32MP257 SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364f..c5ce81e3ce45 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -203,6 +203,13 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: Engicam MicroGEA STM32MP257 SoM based Boards
+        items:
+          - enum:
+              - engicam,microgea-stm32mp257-rmm
+          - const: engicam,microgea-stm32mp257
+          - const: st,stm32mp257
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.43.0


