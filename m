Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94D1C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+TNVR+2IFzAtjBiWC0iEjjaf81G6DZHJX+L9O53iPU=; b=AEWe4p4SHqYlpFOQRVmysgquw4
	5z4IG+BggBlNdQf3JqpoHK+NI3N0Q96XAJQj5AhVno2HeRqKpk1Wk8coWeWgnj4VEnhMguTNXSVSf
	x0g1RkbzHkB+E0/e8/n4KVPQqknC7WG4ClXIoZSrX6hI1FHh1Y1z9WoiitSpoHmqa80eUgaw3SBkC
	4zLpsQCge0+n1GwQ5zcEuD8H3ZwF2z7PAvUm+x/2osiwd/n1l4UZTdTQFOBfGXNvamSzCtNd35hP1
	13TsG8Z06aujzB2xnJDrEL9JtFolMcWR7a8P/+DVhRCW4D3rmLdNRgkQjMPCn5xMqLHVCfZwGY5XH
	zxHu0znw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYHG1-0000000HNyI-3R8C;
	Sun, 06 Jul 2025 04:45:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvP-0000000HLka-0HyR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1834625b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775862; x=1752380662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+TNVR+2IFzAtjBiWC0iEjjaf81G6DZHJX+L9O53iPU=;
        b=Sam9p9fY8sPVfLEWeBgSK/nNrkfFGeoTRiVfuaAjlTGSOeOwCiGQMzxvDKDtzSAVu4
         qcs9PlZuD9ZIm7AKza6DWQRa0eGjerxxnTVetoaLpOqtVTVdKOGmQoRbv27SznO23tS5
         GtS4Hd2MAgxhPv1M40gNOFuogdF8z8hIFu6PxDWVMjjkRiwrOX9E8KbCSTR6InyG7g/g
         dEevoSXzV5wrvvFeGA2iJTn72v/AwEnQrv6DmGOsTbFxsIpNmM28SwxeeRLU3N3bDP38
         EkU3nMnglOE/PwJDHTV7yQFVXvbH/8LquZokDqzjHF1ZCtBWWoYBsbsvtDLmwAVw6Cw0
         XcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775862; x=1752380662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+TNVR+2IFzAtjBiWC0iEjjaf81G6DZHJX+L9O53iPU=;
        b=X3KAtJ8qe0nF9oFQ1ZtZoA7Is1LgOq53cMT/gEXOP1p8GuAABnTWJss7x5TY7YoSDe
         TI8yY6plVPj4Q5xMP53iJRpKDJZCsLal8HttclatlIXTLYCQZ571yO7EI4Ypb/gmZUQV
         koop4aoT7lv+R76OOCgBmWWbldAy77CrJ8To3oCtPnO6N431yB18PTvhqKp2ph/mAsyn
         YFjZ4yGZcPPT79nZ0OzKz1uxf1AwMQAKQW1K2o7Lyjj2HX/e50NTsv909haqKHT7cLM2
         4HSBk3PPutUDGk2By2+PTCJKr+heixEbn8/6EmZ7E6xQ5EB5nwdATvyppW47Ael0i3og
         GzgA==
X-Forwarded-Encrypted: i=1; AJvYcCVHAy2qBsqFt/YbNZ/5YbyRFkUtJcNpEVh0HO+EGnsqO8W22+onPug6T7v6izseoL5Srwf1NLu6Mr3TAMDF7tnX@lists.infradead.org
X-Gm-Message-State: AOJu0YzIgLa4h2YeWillvOlDkmZo0W74p2N6IT49yj+T5PF5A6x/e//L
	e5S5MLgETQUUfvHjlfwTJEu3QNH5NozAbRpFR9yWuvjlbH2t3VZte0Ur
X-Gm-Gg: ASbGnctqt9KAT2msa7E6EPPA6sjk/wrfG3ZjctTx/7aBAI6aZV1FDjMfVD1v7ZDPtPo
	NvbSj0N6ZNttdA4GbtRxWeCYHS0UGjFbXrOWpMLRnJ0+q8GbnbAO/7x2CYbqA8XHRIQ3/KM6221
	SA6THJlypD5DweAaJycKcP301+TOhqU5pXhLvMiTYj+voTuyAmLmJyA/NRyYYrKL4UgbbX7ttW+
	xcUKmzaHSLRSm5SGTQU/OVEZENhqx4b1fmf1Yy2Z/aul2h4T3Mas20gDSxdyQmyoZnatEOP1QBL
	JaEzGfsNeobxlezdFgapoLVNYTvVjICFMyjVZWebk3+URua0Xo74qte42vxCEz0kYBEmWXNFezD
	Onemx0Rq0dRcNtGOwF9j0bo3IqIXWIMW1Zmmwsbs=
X-Google-Smtp-Source: AGHT+IFzXt71OuScjjUFMjwAfrt7v/tObafbS0wRGH2aMUUWpXXz1uiF0tdrfgd10hdbuTwWyxGqEA==
X-Received: by 2002:a05:6a00:6ca1:b0:74c:efae:ffae with SMTP id d2e1a72fcca58-74cefaf0042mr7755377b3a.5.1751775862296;
        Sat, 05 Jul 2025 21:24:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:21 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 8/9] dt-bindings: arm: aspeed: add Facebook Darwin board
Date: Sat,  5 Jul 2025 21:23:58 -0700
Message-ID: <20250706042404.138128-9-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212423_107973_0F7A8D55 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Document the new compatibles used on Meta/Facebook Darwin board.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..dba3d07cba84 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -82,6 +82,7 @@ properties:
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,cloudripper-bmc
+              - facebook,darwin-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
-- 
2.47.1


