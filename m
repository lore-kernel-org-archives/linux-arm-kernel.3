Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=; b=KdO8ZMIcdKBnTob8LHTTRgZS3V
	3RiEWu46bRPvPiueizOU/YDrTZOfF4N8Qj+JFf0eNJI23afyRPZF6gVsU5Q5ngOEdY0E6FDBR9JW0
	bjmU0Vas9zqCP7ZRPz9Yu0lw8DBCm/vMCJH7uLZ476P0L+84AIinM3LglioU3hW8fudEcpTs42nCF
	IBSEHou9KAy2c+/d+E33+lSffSr5GWXpDq/gATryt/aDAI/LOkDKpHyKrV8pe3GhBVGjSUN05p64k
	jfKzineAq2XHqqIfS2TMzkPza4rUJ1MsCvvmcat2UkT8mEXEOO6IaxVmfxd7eY6YfLaxYrqSZY9kf
	U/UEubCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmbh-00000001InZ-3m9o;
	Mon, 06 Jan 2025 12:53:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmDa-00000001Dq0-1U8R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:28:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-21675fd60feso4294855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 04:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166506; x=1736771306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=a+66/PBThdrIG1EDHqi/fWThZDOu4IzxgGjv7fEnbcCvkS0CcsM/4A7Cm5+pxyg1F7
         z1VU7X1pvphK/HTMtwNfb+Zm4XcB23YppLTiPWAVl/K7KzLg2MfWhHfoPWz4ZPLRBTcv
         Qu0wd849Eu/IfSo+APbwDvm42k+uc4Zxnhgv23OW8835o34+aUtRFX6k912a1QYpyPKh
         Qohr132dpK6gJgfpD8zMvJSaZzksdoWgw3/O7dSR91da05rJZmmj0D6TgpZ4ybwWU9pl
         EsrT6tJACzQ+cL71wIajDlEFMA4p6nOQQebAIQ7XIc9mxDtLPt/+DW4JbekqQ/XjBPrV
         xPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166506; x=1736771306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyr6yNUD2cI7FDLN2P5orlGmGipVdT5OT8foTnjmml8=;
        b=Iu7OVKR3KgA7AAwUr375UHl6BZgrzSD77PxC3vl7rpzp7VEAI2vaJGbRRdd7DA4mR4
         Y+X8pC/915MOGSDeUu3TKWGJ2XoSekPzMMtybgvPMc5qxVrdS+t/E+CtGAq1LwXR65ec
         s8t4aqJVZz46qaTH8P63T4Tdq+dk6oIZ/ZVZJDf01Tb6DmdQy4GppgKooS6vTdgOIadO
         ehU0cgs8JlbR1V3BSwBgUDE9GqRKPYN4spbhNZkQ7CFU0guB0SAeNb+QepQtO8WmCv4c
         PFhlVaM2agY8SEcsbcaovNb8nGYaoqEBscUxoFj1eIe2c/rEcNcjG+gEnE4vJsa7IAxV
         Zo/w==
X-Forwarded-Encrypted: i=1; AJvYcCUL4CoFUmdQnevyjdGp1pQcSUOA7cuUgLaljg0T1ZxpWCu7+NSxsnAxwnIegFI37QJwO9We/T6LNNrlG0UW22Gw@lists.infradead.org
X-Gm-Message-State: AOJu0YwPml7iGRn63y282eaOEro4BWk6WkHqhNVqANUj/gxqRmUNODI8
	XTJMp6yIIodU7OnaE7mjKm3jW4tH0KMQS4M+CYPPauRScLSahsYK
X-Gm-Gg: ASbGncu3aAYA+6PE/SKYV8CFrd/nEphRdSWx7S7cWgoT+ECfbaocgEuj55jAKbM2cVv
	4E0FPlda6pmtwCN3WtCPW80dCdvqXLdMHP4u2gqtngfJWrtcZk6KihIsSRX0PZKSpJ1/2aqjDJM
	ZqQUkmURjZkqbyvwAMujIV0EllfBZxx12s6zMES11pzxBSm3zWkWwwCASW9pSNm0Oir64y523H1
	olOLR5H0pNlQsTUL1dglXwbATjVc2xY7Z1+Se+871S9AKr/+MuW0zzEtg==
X-Google-Smtp-Source: AGHT+IFf+AEJ7fqHxRfEDQ5692eQG5nVRbgR+HyTlqQ9ay8KL4zXj99jnd9/Z0cp+LSzenKZljEDLQ==
X-Received: by 2002:a17:902:da81:b0:216:61d2:46b8 with SMTP id d9443c01a7336-219e6ea1c0cmr855329215ad.23.1736166505667;
        Mon, 06 Jan 2025 04:28:25 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm292678655ad.39.2025.01.06.04.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:28:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
Date: Mon,  6 Jan 2025 20:26:18 +0800
Message-ID: <20250106122805.31688-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106122805.31688-1-towinchenmi@gmail.com>
References: <20250106122805.31688-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042826_392268_E2216793 
X-CRM114-Status: UNSURE (   9.42  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.1


