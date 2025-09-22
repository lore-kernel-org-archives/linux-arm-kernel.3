Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CA7CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=; b=nh6CSothsLFPTvsIKpB13c/8d6
	d1WtqmZv9ydpk1S9nENQZR2wpaXRoll3d0terEekerYoPqAUaPnJfCINnAOd0XjaBRGMY/T/7Yffk
	9Ai8gWmuKUzy+9YXCMgmKEPCboEUFn4HZ9tGjHD6KNsmYziHSMe0iSYDCHI1+XOyV8+htP9L3rFRZ
	9ZDgKBxMIDVRMyyBM2soVtMZ6c5fFs/QBczS/KiT3B59FBMX8Z/RatSeuxBvlWAHkstGbYXDDrzUw
	mmIMrZJUlLo4vcZOIFsJ6oNARTvZ9n+N6kShazcU4WZMO7tDZaL/R6wvxAUL1GH4pjbBgV2/HQN/0
	N8hzXZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRF-00000009ysr-3gYV;
	Mon, 22 Sep 2025 10:06:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRD-00000009ypo-050W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso31754055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535585; x=1759140385; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=kquBRSjIqHbR59y4Fg6+4mU9MGTIqS4dS8GNRRUchd8IrS9KQ/80i/+LyGK+VFYiXZ
         /qYAw1KosS7ev7zjUspwDpBmrUypiDreyzn0LzUWQlAMDGZWkJd0DwpX/LNvkjBHTIeG
         TgAw3Y++iKD+KLuBKY7eLnbdrGqiI5lPgQ6rLHqqkBE74XNPiWspcD9N0qT5lUh8Kl//
         w5y88NZNTAMAznj5pTkfqMC2oGFiXyAZuI9WTfGgKMuul3FpUxhh0BFIYz1PfWVL9nGv
         nqNJUWlD0yiBclE5LiuTC8yLh3ui79hBCQc3AtEnl/RjuXqHIVWgPRPgv9F41ZayKC6E
         6kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535585; x=1759140385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=PPjvji9qf6uoTxsQa41m/jRZXAjMjT2nP6gxK1av1DJYXZMg1BxtHlRvxkuA37iZfe
         /DS6aZbHOcJXEQ6WkaNDpvbQNWE2s7GBNGaviG9bRZqScuL1fS1NA8LlD/qUpXHoKn2B
         8y1OvVW0u78osVn9DzooNsMudJWS9XHi4Bi6Ngp9YRdWbcX5WoWzK2JxJzBsIXD56NYK
         XnS3slX058MCJ81dAwv8F0vSJKT3EbVGfORF3p1Ndh3p+9H3docwObEk7Z3lEuTeG3iI
         2OzzWUMfoqGSQhURYc3lVsn1ECH6IdrzBiPONQ7BhEaOu4ZXr2QbNEmL0VzTuIT7Qfed
         r7eg==
X-Forwarded-Encrypted: i=1; AJvYcCXMh+BraiNwhLMxTv+29oz8pFnAlsa78GfqoLJEydBdl/ym04bnEWYH7fdGMYtwFkqd3wgSAFtxDUchLpTRy0hE@lists.infradead.org
X-Gm-Message-State: AOJu0YwvqBTeJfjfvk7aYsGOtTf99XmaaITxkhWOf/xwRRXLrGIHNyBn
	/KEUcChcTHs7NFSzMdspPr7BgLonplA/MQpBMXXyYMwFcfMTsZNQGypA
X-Gm-Gg: ASbGncvpYslFZALzRh61P+u+0hlXh7j1csm8IRDAzfsVFcIDma9iYBMzQJsBKjZVqK3
	AQwY/pMX2pPPbDeTAk4C+WHVRvFqFn2k2cpPm8f3Ec8DrEuRHkBhQBFfkYL74Oq4bcpYNcxyIB2
	ck0oFxVBgJD7whoyBQ/AbW0u/ASa1AA06/B8mfxT5OISar8O7D+YJBdl57toI4szw7FKRZt7phy
	fXb6ONm+zvVG6G1BE3BM0beaywSSBTyVx9DJ+ZT4DLhbO527T/0y7G7IuMknAl7XxDJm/bjRPBY
	2ZdkZy+F9Q5o9mR3rtsBeo+oRX6phxjxMMPfE7zvZ98gYvBJASgHjySMIXU1lx/XXGou3cN/f2O
	ZHdQnjWWLr+owKogMb2LD8GEJ2PRi+zXWUCUspQL1b3k9KJkEaJJM172og8d8hLrx9E3JC0JTb2
	g2GNF8UV2zncB8a6UIBAbgrx9InGM=
X-Google-Smtp-Source: AGHT+IH/nuiP33vxdi6haBkztRav20FFYyckleFU6YyLjEkl9KoqVa24kjV3Z8p0lBzYdX5BRmqpMA==
X-Received: by 2002:a05:600c:3585:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-467efb044a8mr139254985e9.24.1758535585151;
        Mon, 22 Sep 2025 03:06:25 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-461391232e7sm233177835e9.6.2025.09.22.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:06:24 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:17 +0200
Subject: [PATCH v7 4/7] dt-binding: memory: add DDR4 channel compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-ddr-bindings-v7-4-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030627_075141_8787B29D 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add in the memory channel binding the DDR4 compatible to support DDR4
memory channel.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 9892da520fe4..866af40b654d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -19,6 +19,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - jedec,ddr4-channel
       - jedec,lpddr2-channel
       - jedec,lpddr3-channel
       - jedec,lpddr4-channel
@@ -61,6 +62,15 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: jedec,ddr4-channel
+    then:
+      patternProperties:
+        "^rank@[0-9]+$":
+          $ref: /schemas/memory-controllers/ddr/jedec,ddr4.yaml#
   - if:
       properties:
         compatible:

-- 
2.43.0


