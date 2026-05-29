Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0FCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQLACCGBPsrjgAEDYt5m8Cd843XaHx+Afo6vUVfkCjA=; b=j14OxyZbXgRgtbRXcTZWbRBbJY
	WEbDlQUatwGQSWewXN/CdPR8vyyLnxNvVVw5mTS4qtYQLLJQzpyHTofW9oA7k1k7XE7Mu+7AAJNLx
	FglnFKzmFO8e9t9uxp5Xfd+SAWJv27169fQ69v9vc6WYzONXOQPpRbVG0dFSLudqvbR4H0ApHrsZs
	0ZyegegdGMW1yhas2akhJrAFZPdG2UZDrZMaNIW3HSeObJHk/Jnk/zyD+u57e4BoB4uEbBAts4U82
	t6RhsABmFPoKm148wypArrN5hkutKsWR8IWMKItlgLfqMq57qDmP2IXulcHPeeFW3xjgGWptDj+1N
	+3AT0PsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUb-00000007YOZ-1f9K;
	Fri, 29 May 2026 14:47:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUZ-00000007YN9-1bGm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso63939835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066037; x=1780670837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQLACCGBPsrjgAEDYt5m8Cd843XaHx+Afo6vUVfkCjA=;
        b=H0vJlevRVOcqR7lQhjbHWSpV5mQHoMVmTKTErIsLbepPw1HdGwA4/8Ir49MZOConii
         yO5PJD3CwkJfdblskfQX+cGJ+SWKu4mUtA8+h/jRhp48PPqUjjynEipca4GbNyy7gTT3
         yEfJXfntBwZaPxm96fxleL/ssthOPk3je51fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066037; x=1780670837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PQLACCGBPsrjgAEDYt5m8Cd843XaHx+Afo6vUVfkCjA=;
        b=BTZvum8IEvpBVrKPLXSSbA9B/HuY6w2casQw65AYfJAcwUm3vKbZ6GrumuB2Ua2H48
         ZXbvhubKE18KBfS8RlJXPpCpG+7PBYKfbyFx86pefowz1Yd6pQft3B/j3UN4yWzqodRO
         SltCzePJz45+Hf4fFRwu2Ym8G/gkNRGhiD5IdXkZYtU4HYY0ojXj0ydTzAL34YpQzyRp
         /uMEJVdv8sYU6TBlH8nYo61uKOcOuKvrQEJMtX6FdvajpYZY5/B8A7MKcNc1xYdCC0Oa
         06N2XWDJgIGopmYgCucCLn7ZCencGakBMJgdNmmSHv9DJj8nTQGRlKZaUvSKVeVAk3He
         eaCA==
X-Forwarded-Encrypted: i=1; AFNElJ/fcmrTI1WywFVfq39INh/nFkEQCdfHXJO6Y6X/Wpxnf2pOmDQ0iw/rNwiPsysRS2EmxtBrX5j6QQKMxbCmrYG0@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ+z69NVNajqLjhy3PZ6tu4bJK1G/zHxcwVD0/fGPtG1Cs2Py3
	tnYlYNPIsATXNbVNqIdhZC2h9CibHq9tN6vC1PdXb0m0OfPcTQh1j7XamfgEN6mlKnQ=
X-Gm-Gg: Acq92OHNx9DVGx8XoM1032Qirth5+NJX1e3JHxx25ILOVLukL699lT/0+Nbb+x/A6kR
	MIpARNjfHUT/BpAuFAoR8dQfWkGFn647X4a2jHURHUi4RCshto04rpeNQb0ZmZN1X6fHIN5nTLD
	FSYu+QKHnO7XW2oujo6ylPkjeXQ4VbMMXlZUO7lIijVoiUOGoYZTcPSbT+c6LvTOKJOQR+LGgV6
	bj3NmG0DZ6yKuTPm8X/fuBW2xeLdITGO86oJxSBdD2CgbjAPsTqpU3tc6xRSd/ItpceqLAfmWI3
	JeaocNmJH9TaewKrVxxAKvDcBwsV86LgWnvpsE4QknbmIhIqdhl2hZIWb5VZuFgeBXbw+zqTZv7
	B0I/OY++LMviOrcAOC3fpz16Qdv7DODTs5CMiX3BkRJJfNM4vbCjNcH8/lTxFNiGl5MmudTPeF5
	Eu6G95C47TQXDmAf/R0YLtA7zE1yGAocQ4gMEgVj35zNVXeJWa8R/LrmXVv2XjGwiknkCimBEi5
	eJIVEPaxWTAzB9/JmpPdYJOFLuUD2ITNaTh67hs3tpG9T6Vqb5/j+BVHMIBogfyDv4C0Q==
X-Received: by 2002:a05:600c:6995:b0:490:8a16:fd49 with SMTP id 5b1f17b1804b1-4909c070100mr60190665e9.6.1780066037303;
        Fri, 29 May 2026 07:47:17 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v2 01/15] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri, 29 May 2026 16:46:15 +0200
Message-ID: <20260529144707.3931919-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074719_444676_3930FF55 
X-CRM114-Status: GOOD (  10.06  )
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


