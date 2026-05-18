Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F55ACD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4cUQj60Trdc2wuppwGbIuirXnqBXKiyXXPxr6xW8J8=; b=hQ80qYgFqyGI07hgFWiN/8sRdq
	+8XRjG4SbGYI+CMBrWudR0hld6Agloj74m9hLGiqrlYWPrco+1WNDMtcRHN4xJaoheU+Q6XDqz8AE
	tqPLHMQvoegmZLmIREOUtAxxJ9cFBnJceZ/JUwRgqntHwNj0poIxDlIpeWsnal6i/HYg5WjFdLYf1
	CF07xSh9/bnyXgk6GaCfWRd7ZPKBgzQKJ+8jonMV/gJtXW7RH5pXLys5Q5A6xmfzDGV14KsrLRYXU
	I6Kz1J6xp3pkpd1d66x341QNJ9xnTY5da2jsMFHXZLBponZJko1bWZ1Doh9Lbs0YXpM9a9LhYqJNZ
	Q7r6Pn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0n-0000000Fz5f-47hP;
	Mon, 18 May 2026 14:32:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0j-0000000Fz2y-1ec8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1291866f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114720; x=1779719520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4cUQj60Trdc2wuppwGbIuirXnqBXKiyXXPxr6xW8J8=;
        b=ALmo1PkMur8AMuUHvd9xfslsZx3Jr5RbxccAIRyzTx3jgHI2WInCeZu2OcXMdniH/2
         skqHj9K7rCb5sHzhTMrk8XOoZWpZxFU7k9HZIVIcL1U5hs7bkjulI2CWRxxAXvHfFPRn
         qfveO2MJFLxiBO4Lmtxgjvvu8VB4KR67MrK2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114720; x=1779719520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4cUQj60Trdc2wuppwGbIuirXnqBXKiyXXPxr6xW8J8=;
        b=GpecogdjzyFLmpLMXxOLGTaC7O3kMSbdx4kWaUx1envH5jUYNSe2Rr21Dgi6AELtad
         oW+/D0S/QvWjxTxDXE7V1RF6QxVZ7RIK2B6YVOGfCtc9sWW0uUuFKR6lVqlJ9rO+GFh1
         1JKA3p3e0SizNv4hX/VAavkRNjE3yeCRZIuQI8/wVWfZPlT3aHGFU7YqmyFDAjmdt+cJ
         XeD6SpiuzpR0Q0ujGar+CQpdj84e6QBLKGao68uyMoF+8xAMNUo6za+3t3Qr4RGe7FV6
         edIpk7BTgcQle87vR09UD70gjblU4gjDkbBIoH0Pfflaf0YWz7ubZ63GID2VIQURcmFY
         VX3w==
X-Forwarded-Encrypted: i=1; AFNElJ9YbRyAuckKec//uck5rTtcvkTE6ehidbaj4jLFXX0nWZvOcVuW/54Bdhuq8DiainAbEHS2UyUPiH+usVEDRHtC@lists.infradead.org
X-Gm-Message-State: AOJu0YziZTeda53euLSY+h74eghIl934iqk+RDTKthARiFMp3u2UFnKO
	X3AaMpvVXKo1I/yjf/FWrtBZ3KFCdiX5Iso1gqk6ojfKaKhPHp5qgkNXUr0skOF+1QU=
X-Gm-Gg: Acq92OEqQqYujVYyBtUDkQ2yz7ez0Yeb0Pzyd8ySm2IdJPjaGMJgnLOHj6jeLbXLfgd
	vqVtwbdUkYVNZkSxMWGSnzJsThe6/pu3rj0ng9FnEn8ZdlphLMHx4WpYSxSBwDXlKPLfJmRWHWV
	1q1g+4UuTuYEVwvqYHsNqpCkYnlzOquyOdCuNwhqiefEFQepdoaNhDID8saUt2aBqOta/UePimm
	jr76gBl2uHolRtBx9qz6qfnNH2OKp/HtzyJYCCUPaWStXuhUrwPE6hHiJL+YnuVc4bfKGfl3V9F
	PGD4Sf1gIeKMprJuVXnn1bg64bSxZosBbFpLmIV9NMSutwhr/tUmt+vsi+0NncmAGe21pq/kCKi
	efNznDxeYyrRuhO+0RIOUsFr7v/hDj/MnKWQp1cDgb/e/AzAvcxKZnvUlJxZnXnbYia9K+0j/6d
	fahRo7n9eoRiMWyzRSh1J/satM2VadJhBCGRfXWA05ptl1Ms0SaXkcdi4xfKuX1L+1BqyiubTNu
	YhI0ki9OrN882OKOxUZ8BLwMYlTG+Dm+cTmFAsri6stcAYF
X-Received: by 2002:a05:6000:1869:b0:43d:7946:bae5 with SMTP id ffacd0b85a97d-45e5c60d6d8mr25547861f8f.42.1779114719561;
        Mon, 18 May 2026 07:31:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:31:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 01/15] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon, 18 May 2026 16:31:16 +0200
Message-ID: <20260518143150.3138712-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073201_447056_8F688AFB 
X-CRM114-Status: GOOD (  10.01  )
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
---

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


