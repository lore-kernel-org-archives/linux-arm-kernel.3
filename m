Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD722CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=; b=MnfgH8Cnw/Ns00zGlna09Zz9Bn
	posBirfBQ10xj1dkwgY8KzXpfaqCWPMJMG2KNCluZkRgUneSufe7m9ZA+JtqvAKzu2zNfRRrd/S21
	LxMhhLOJOI5Co5MfDu2SEB7Q4t1qeFmj5UMVfPB/te55r1Aljbzx9SwX6uWcwlhTY0O3B2Lne1vOc
	ZsH3AK1NA3gmXqNrWRgXpQo0hCTHmJO+gWebscLPrtwd8rN2NOQKJ1vzw8cAkhuWfBz7VsXHmZ+eI
	ras3frVwHCwbcS6Gip/zPs2sDfxFD4bg7L4AwsnliIMma/4IFYNsqIx67PBDHIxDrtxVBTUTJElES
	+8wzttpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3M-000000009V0-0BXg;
	Fri, 05 Jun 2026 06:29:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3J-000000009Tf-1i49
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45ef372c58aso872505f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640948; x=1781245748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=iOquoVFK7lBkuOZktR/Aafsuju2T2c5aUzyNE2/JDNV0AlYoOMKSie595+f8xZD/Oe
         cw+8XsQ8KtbYcVv0ZrgmW9Np2W+RR4mnsRMXeHjC9rqIz2kzV6/gzYda+16kbptOhC0e
         OxxXYXK+pXpSImvdtRmaHi8qIrXF7ZDPDLl2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640948; x=1781245748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XAn+sgOJ//YpFHFCj3wQ7fJwCRmUnKUhDxx0gbmShJo=;
        b=J9tI6gYv+ThQ6ID7fQDndCADbOgCUpvY+xC/XLwuxKmhJscQIt9l8G755Wc09ICogG
         +T8YqHHZqOLZcLL6mNutXamn7YAejSzoQrNavaTyvCbMj1AGlRBR5y0gzglnCyOiudKT
         jAFuBvkFVq+6CZweYG5M1N8T4UYMwCSvBxcRvLcVwzv4/4EgfyLQ0E1vXTfaUQOsp8z6
         /d40ueemYNDHXCpJdH0z+lzErlMm7Bhh7E/cBTL9H/LTJAgCY32hpVZe/i1ldrARVofc
         2IdfVYEuA/6l4ggQnFuqY5E+lV/5LyjFJwnd7n2/ETCvNAnJdIyYx3/IzKyrjdmUZ2aE
         FT1w==
X-Forwarded-Encrypted: i=1; AFNElJ87BHvvogza5j1DjKBcyES/lj4gzZ6kyh3Xg3cZRpCeQzV3TkZYwq8RlVYNifZg4HBsIEEzKoyw3mWC1bgMMe8a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3YzMqxXG1RWwgMYP/pjov/1MoMyIU6qRu3cfzPuICu1Ob55Sf
	IBtmjmQSzIGfiJzWn+ZNliyLaU2kazgDxg8lrLtcuA1K2G/W+o0U9QLohb8cxw3y5Jb+fL2UaUM
	zwXlc
X-Gm-Gg: Acq92OGsgByGp8MoTT4naCYptcdszy7W5CIqMrAwRr/eLy4b5cXX0pwQ6LSbeRk8Fzm
	lF4P7aY8+Mf4rE3B+o4S0Zb53iTu0So2EMpRgvwp0+9ItTgAK3cOHZIZglg5zLkWulqGiSF7//p
	BcL40x+kmvmh7uSyY0pxumn8ItaBHNRKrMI2KanqjfaVKpNt75qpRxjmk23/o/JootcpH5R/xu8
	2ZBkLqjpaD57nFu9dS2/zAbaL9W06Rp7Iw/ViNIgDxVm4xrX+lBucXl+avVBSJya5XUyYs3GmNP
	zt2AuC0ymaW5AgXcR3AxTQe1lwtnji0C+nO1VOxPpq8bKooyfVdHkZCoth3iOo3pkT12SyFmiuK
	H/yi0xxWtf89q0AHT0oe7w2jXa/oF8O3qS+30qLsfEDWJiT2i+n+lP2vIWEq/2utWZSlW20IO6g
	VPkpmvaI+/Pbh1BJ4TpbVNUuxcnqNZg2DuTZMrCwn2np1HiZULDLzDleVG2DOoaRjNn+d5hH43F
	GcPljdLUhoCsqGmHv+yCahMX8FdTBA+IDLWQRMY5D9VGmOFFZFwN+E5PRdVUpv64t838bw48BxF
	apiJDTUjhcesmxqVX5c2JCmRbwzOPgmYTXo=
X-Received: by 2002:a05:600c:3f0e:b0:490:b3e7:4614 with SMTP id 5b1f17b1804b1-490c25f9e55mr28705485e9.25.1780640947625;
        Thu, 04 Jun 2026 23:29:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:07 -0700 (PDT)
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
Subject: [PATCH v3 01/14] dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 08:27:29 +0200
Message-ID: <20260605062900.368376-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232909_464874_9F923970 
X-CRM114-Status: UNSURE (   9.78  )
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


