Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C5CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=aM+A5Ckx01DaOW7DIMfaiVzZQk
	lFq61JCIqPuuTXU8mCokMez3c0+xlWHLHdQFgbtOcoCsjvWO+/8NTfOOg+nSCAmEoctL1VUkLs415
	OJUay2LW+R/jKS/XIe86Uwf86/eASj1ffjixIK6sVtJNuCYCLqXgl+myT6gulhXGPyrZ0ivJ/BUQE
	LAzx7khvqicLo4kbUdiZjNRhcFQkBPY9RB/nt/Tak239PX2NH+scplb+R3hOYQn1RTrDFQ300R+g8
	eIFb5pKt/x4P+tIWZxaoLWcTC6mBrDdCiIN47ZAgxrCeUx94a0t/a5NVCddh87CYJwbNmVI+8m2nQ
	IFFUUXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkP-00000006ClB-3HKt;
	Fri, 03 Jul 2026 06:51:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkL-00000006Cjb-2qkL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c1274802697so19418066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061492; x=1783666292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=QSp66Pd0VT1/zqM0MG2j3K033NQZUUoouX6H722Um6qD8X1KNLSrmuswgYPBDIFOek
         o5wFpmf2DNKzyvPF+xxVGKED7lafDamNuqJedkNwhRXhbiMMnr88Lkx4i+IC1/hYiudh
         YWOFFhlWVXOcanOso/c5/LQ/fxoRCG0BBNc7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061492; x=1783666292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=qZfaH1iGNxf8mXK6W7xZZRT4QpoOqUkoDl2rJiM80gE+hXv/mfCCPIfZTS/B2sW2Bu
         ZkmZgt8fKhVzeww9X9p+ArVKBxxLud+k1Ba3WNBJlHqTWVMkVocZa+3ksYIONX39i3BB
         sD5yrHuCdFgtupGMqS2OzFjtwvOJVeNkjIDiOfbUmYolktuPzMjW/4GEW4YDQucbcz8n
         Z5Q166F8CW6m2jdUQvhLRp1L6b1Lh843dVJ8EBLlQAVqLYrur38sIlyMHIGunLzW3GoZ
         MwpN9Jh98Zq+r+BvHOt9uDTU1Oo2IfUG2WPHDSrBYYm+YvFNsYtJOpE4+8M6dsnocBtJ
         O2wA==
X-Forwarded-Encrypted: i=1; AHgh+RoygQRR+TrpSVGd7wQBBQ4j9XSe/X1ltwomeUXgVKgJz1h2gHExYYf8bL2cB3SzZ+k8uJVnP4x2yFIPRF6n8gdI@lists.infradead.org
X-Gm-Message-State: AOJu0YxKR7/0VrOlUdn8uDliHoTuPJmA9x+GbKx4E346xCqSVvU6ThJ2
	lrGp3pjR+izFXe+dnWS+OWhbe+W413dhm6NJYSMYA1QZAbpsEUzm2zxI2l+Tfx+Nneo=
X-Gm-Gg: AfdE7clxIZDJ7/NG36sI7iXjYUzXHgo3CQJt9GU9p22aQX74XIKfzx6cn9y2wMkWPOW
	PWB1BifN3G5RTomCmcPL6lmsvYCyucq+IMsgLJhicDthXRRz3AHg9HWFpg60MqJ9CC1eKoTLSuS
	hQTJuT1zP95lV/dnv3DVOKC877Lsq8F1VBGgmyk+0NmmPBzcok9bJF8UgKIlG/flYpH/tK7PfYw
	MVifvIrqqiir004nQgtDZd6QRmk18d5M17TSatQg9w3PKYy6azuq/82Rxu37wcbOLL0J5klKlb3
	yiDV0jmUqPEpGdv+KnWUnq2jiVNQmPgquA3NHu20qH2IbUPjqheWDCEeyQi6DMUj8AVJ0TB6SmB
	XeSOV9luog4cfUZqvmZLwqYBMV+t3I5epwxBJyrAOBd5rj89LHbLNa2P7KU2vBCvTi9XhBbtWEB
	ia/0Bm3tjTt9jmfRUKlyLMMAQxvo/MKRtvgDnp5RUQ5gQomsVl4tOmCLjyLNchhJrnaPhFldMpz
	YkrkwoESxA=
X-Received: by 2002:a17:907:c589:b0:c12:4988:f0ba with SMTP id a640c23a62f3a-c12a9d6ba2emr442460466b.11.1783061491651;
        Thu, 02 Jul 2026 23:51:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v7 01/16] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  3 Jul 2026 08:48:51 +0200
Message-ID: <20260703065110.1433283-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235133_754920_891E0B8A 
X-CRM114-Status: UNSURE (   9.52  )
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


