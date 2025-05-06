Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B77C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIL4aNRUdWRX+MJw2hpcNbVT2cq828UqZbzjcrK230s=; b=Vl+M0yGXJU7yKZVMdu/16HUcGK
	QujA+7l/2gz+ZkqAxoIRsiZQjfSIQPIs6mOfifpe6xU8KVVH+w3tYjxIIRBpPWEokHXu80J4JDWu6
	wp80BY5S2crbcwj++2wioVP2o3RNM3tSxAtqxGx+42vyKyBJIiIToq+2GtRfvd8uZj69NIXoXeI/z
	eRnxbGCLx8JekbIhg6zrzwVDtc/aceSyvyJ0KLgtRVeM9UKnagAbUrv9rb6DeKJdqnSxuMj/YOUvK
	FHEd3t8uC0/Di149CdyGLgXWYWa+9M/4Ntl1T3L1NUNEwYf6ceO5aOkGfsVfxqJKpEaLWbC5L7kje
	NRzqbtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJ0u-0000000CGV7-2pZY;
	Tue, 06 May 2025 14:11:16 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGfr-0000000BmAe-3AqO;
	Tue, 06 May 2025 11:41:24 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c55500cf80so512039585a.1;
        Tue, 06 May 2025 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746531682; x=1747136482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIL4aNRUdWRX+MJw2hpcNbVT2cq828UqZbzjcrK230s=;
        b=UUyQQbD40ftgkAvuplzZZWZi0WQ73kr8CYBpn//DcjYkLkMT2vjN/YeaKOkYEBW4HI
         bQ8SZwkBOrQTR2nOK14prqelODervOzOXiO3FM0Gr3XYjZmXyAV5TpI+PJ52NdNNqrpt
         OH9Puc46onXQmJFuvmCWaz6Ai7ZQl0ldxdzBtDLzqe/gkFHeu3lzIvhJxy+jc100jhXF
         XCZRK/F81kynlr7YgO/iGrfQYh5Js4rFZ/h9JHZxZ717+Ajwt0SEosOHVNP8Cm65PXiS
         HjUQigBTfGCNGpHUAmDyZb7dTsDhXC0VoPtuQtbwkbwds7fjqTvgFytIGquszJTkNEv0
         +/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531682; x=1747136482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIL4aNRUdWRX+MJw2hpcNbVT2cq828UqZbzjcrK230s=;
        b=GUOfaCQwN5AEc8lh1+HTQPCRC6p+n970nCFoZTXBVSAP1ZQimwcJvYP6qiBbKyELc6
         27mCp9H0VdZqbQ2dRmbvDFqNUuQF3a2b2811rJRTZpgGT3RCVkbkM5F51iJGqY28I88F
         Tdvl1Fj6vGnQWi92CkSpgIpK9DVcxclSipVnwyXRWeMlNPyX+if59Ft94eVb7US1B9+U
         3Y3pMWAl3UbFnr835eC20aeK13E4nOrHLa3IvwObsh38h53EZBSOzGLmTpBzuWxxQNeW
         hQ9YvPloNrKLExz+bXZmYh9C1mxet8sYHuGQoDiPB3XNh5LeNdiCMVQ5SHPbo53zyP9V
         ae8A==
X-Forwarded-Encrypted: i=1; AJvYcCUK2A6+fGmEI5dut6cyHQy1RpilgCMybjzqburoxOjPQtNyY2y394cYB9ez4FpJWkXhLTwnaIS2rdPaV8zJyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGALoNN68WPinSy7PtXVz4JZ6wplV0tKQ3BSnjh/PJR507GLNC
	5yNdhC2XO++/Qae/jOy5Ja65SjSLpnk+Skr1bONgPgML3iAyhki+
X-Gm-Gg: ASbGncutfRi73BD73rgARfyieiUmb6j+lrMVd+lmOVIjypWLRiAwGhOGdB8fn0IqWHB
	cCzKUTmsy0TbRgPHvAV45yMOpk0xz69GKWRmhpMoesWrZqhBd1arTtRyD3tCp94DawQUeDHtlJT
	vNdi5pnuPiMMcb3XN3OiLqiT57rv/1vQG+JCBdptdH7QtFWxzHRL+64F/g/kc7SR6ymm0Y924d7
	dbxrFz7+OEI1ro7cjNNbtP8GsShMj+lDmUQiWLJO7wL0mvpEweIe6wbs0ncOxjh+wHdOMhwuDt9
	IZjTr5Nb6y8STgV/Y0Es+vQ4eyHky+ABEyI7w7wgHtLpfOD78Irr
X-Google-Smtp-Source: AGHT+IFh+mu0OwMiF9TCuV5bDfMlun+Cy6GZ+EYO1JetDvC5+gP6HEabwF/9M7uubHy5hTOthsdwbQ==
X-Received: by 2002:a05:620a:4512:b0:7c5:4348:183e with SMTP id af79cd13be357-7cae3a9a0f5mr1260489985a.20.1746531682631;
        Tue, 06 May 2025 04:41:22 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b51f9sm697408485a.21.2025.05.06.04.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:41:22 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	jonas@kwiboo.se,
	frattaroli.nicolas@gmail.com,
	andrew@lunn.ch,
	John Clark <inindev@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Date: Tue,  6 May 2025 07:41:13 -0400
Message-Id: <20250506114115.613616-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506114115.613616-1-inindev@gmail.com>
References: <20250506114115.613616-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044123_793123_0E5225A7 
X-CRM114-Status: UNSURE (   9.14  )
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

Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
produces development boards like the Luckfox Omni3576.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..9391e0c31bb8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -892,6 +892,8 @@ patternProperties:
     description: Liebherr-Werk Nenzing GmbH
   "^lxa,.*":
     description: Linux Automation GmbH
+  "^luckfox,.*":
+    description: Shenzhen Luckfox Technology Co., Ltd.
   "^m5stack,.*":
     description: M5Stack
   "^macnica,.*":
-- 
2.39.5


