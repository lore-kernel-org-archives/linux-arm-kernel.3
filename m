Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED00C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3zXV3HirDfRP3PUl3pFBh1c941K94R2FUpG7ljIx/I=; b=x+TjouVmF8+hT4cNS57/efMe2U
	DqecxxUAjV2qLpYoFNpnx0jRPPmks29+9HDqoO8YqNQAdhhSa1h4Yw0KTPjsyUrEiVkGhIxa/BRSY
	U07hEA7EKY+08M5oGFcHVz4aX6L9lyMFvLHgO84Dvni+r2yrAXW76iJC4CYkNFZCRKQoGp3ei1KHr
	JKIHf9GV0hLTyHgrnjgi6vB5pZ7PBYMC0o6rE4lWzJTpN7du8jjjFYalsmslls7yxxC4biyv6F7wY
	RH3WH2vSj79L30AFC1pSDhRguiZclw9dL2GI5p16IaRi6dwhtpIApr7vNyJ/iBblpZjElqGdMq3DQ
	1h0rGdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLmQ-0000000Cnp7-34Bn;
	Tue, 06 May 2025 17:08:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOT-0000000C89X-0tYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfe574976so36078315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538291; x=1747143091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3zXV3HirDfRP3PUl3pFBh1c941K94R2FUpG7ljIx/I=;
        b=Ktg6HpFAdUwYcQ1YZlGASdf76T8/XLXw5rPEATFewCLFiWs8Jafujy7wQuyBhaMf8Y
         sSRy4GZwCXRDx0Rjwjl2nIXfd8gNy05Rd/CMY8BWb2wAXMaQbrwwHBfqyh1Gll7QWmDb
         nhqSrW0FAjTgECNQA3ZeqlGBJ9kIqXUOyevsy41H2npvtHWW/B5aomNJPU0Ej4PvhVGG
         ioIe0C59K7Uag6X+fc8suYT4Q2A5m3oUlfF8YRNuPGIK87Q6zlsADsJRH5tItcFzFKTE
         FG93WtBSb7U/6ZS14qrSachBot6W8jq+n+ibTyoE/UNlbVHJeWLNTAKpmPjEZQAc6H9c
         R+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538291; x=1747143091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3zXV3HirDfRP3PUl3pFBh1c941K94R2FUpG7ljIx/I=;
        b=AkbQ/2shctZyFtmJmKwF/K7uqxdrs6Qbw+X8RLFXUxW/gmWC1nhviLt5HrbqhVp3cJ
         3QHko/+CX9KHiff7/5U/CHkgrll3Kv/fdt0q2dYqaEq1u/CFSk+UgBJjXIVHSubE5Wsp
         yuInpd0zS610nEsVw5q02kD3e2OHQuE1a0lmoMSmQFV6ZPwpu8LcNIjZ56Xbzw1Rj8Mm
         DtFJzT4r2tCdX0a4RvYvhFxUsfs3YvSivJunAvdRaB++kalslZLt7uaAeXVVV8NmtQyN
         TeN61qLFqpoeHbrFwo4Dx9NQii0Bm0E5jEyisE1OrX8X1gPMrCze1/Qma/qEPB40OTX9
         R3/g==
X-Forwarded-Encrypted: i=1; AJvYcCUSiORWmKQ9Am0lwRJB46VXflqWWo5tCfOWH8P9TnrvLqqS1h4HPhFI4jNCwjwH3ENlpZkKlK2Af4KPAu4ZmWSD@lists.infradead.org
X-Gm-Message-State: AOJu0YxI09Kt1768icR+j2D4h3ULMf0JqDKu2s5pkpMB7MwX/P6vh3ix
	FeXV7wWeJYREhoWG96uRUzNqPw8qHhCa4LlXJfyrwmPfIZswWvkq
X-Gm-Gg: ASbGnctvloFueTV2hYqb8QBrNE4TNO6dxEZ3CKLQ7azcz1h3doqLjOIKg5fBQFoFQSy
	qUkVmviteKqDtva6goYN2CRS9T2i1ombYntrSYFhgCj5Z3qeXAhcmYZakCeERWwKcHyGniBrJqL
	lY3d5uun60W5UIchAyLfmA2TRXA+07/h/8gD2Gj9fdIY41SPud/mYDOEavHvzxD5sBMlo5I13u7
	QwS/v1t2SVXqzmPEhx8IHDksa4xFyK/h/XKHPFQ/p0NMU8mgg20IpLdN282v4l0OY5M8F/PzumZ
	bMRRMC8gR61vgqg/C2aGie1dVTKz5NM/N77HjE536/3/c40Ov5EqZIgUhBWMLaMz45znwauugyT
	E1iBa+hDSQcq0nbBqmSrZKaSEi44orgaF
X-Google-Smtp-Source: AGHT+IFt+jAnp/1dorIrV5VN5se27tfdem9U33x4ONTBw1owAU8hcuV6CYu3Dsp/mq6lfYo+/yCW4w==
X-Received: by 2002:a05:600c:4710:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-441bbeda9d2mr172755895e9.17.1746538291112;
        Tue, 06 May 2025 06:31:31 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b28718sm217245765e9.36.2025.05.06.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/11] dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
Date: Tue,  6 May 2025 15:31:10 +0200
Message-ID: <20250506133118.1011777-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063133_249965_75FC55B2 
X-CRM114-Status: GOOD (  11.33  )
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

From: Thierry Reding <treding@nvidia.com>

We want these strings to be sorted in order of release date of the
chips, so the Tegra264 entry should go after the Tegra234 entry.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index df6784a7c96a..cbc02b2a156a 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -66,10 +66,10 @@ properties:
     oneOf:
       - const: nvidia,tegra186-hsp
       - const: nvidia,tegra194-hsp
-      - const: nvidia,tegra264-hsp
       - items:
           - const: nvidia,tegra234-hsp
           - const: nvidia,tegra194-hsp
+      - const: nvidia,tegra264-hsp
 
   reg:
     maxItems: 1
-- 
2.49.0


