Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED20EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 06:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=; b=Pd9ItoUaIVHIk2/xalSKTpPHW6
	A/l5/4PZC3UDuWrT73CQj6G79lknBASPsYkrEBdlkzEYdwh7t6YXEzCH2QufuQipDBuQbwVzyGGir
	pzg07BEZ8Hl9m3FjMppI5ObLrLecZgk0n+oUpKn8ke4lKG73RguviwqY8zCov+IahYp46lE5Sp30T
	cJll30BI+xDiD/KxBjVT+ZMtAr5/uQR1pEALdO1BPqQ64X+fneFaEiSEEj9tBCYB7EIWM+tdzyBV1
	+K60Zwp9LfDOgBf8w8/dCzrU+4HGJd9vPA1Cn9wtbIpURY9f/6Gk8TKpMBhVLnmbyvekBGno4wOLB
	L7B6FY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5tE-0000000EDKg-1V2Z;
	Wed, 14 May 2025 06:46:52 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5rD-0000000ED8v-1uCu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 06:44:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3873400b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747205086; x=1747809886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=nMkqTHiDgqG+kpEo7keVsKM7yyrS38W874oQEnsuFd3YyL9BG4iQNrgdgZzgYfsbt3
         nYq+Bsj2YSIji81B0FwEXip+k0oji67MXXKRQayNxjNJYR1+JKS6oiVosPAvGT4qsEUS
         UGuvVtLhl0cHXrVcY0pgTd7SfDjVVem+/ef1I+chwo/1Dnnw1BGtvXmsxlc6/CTaTt/I
         xjlR3TlXM9arnLkmGgV2EGHFjistIGTlgHrkWaFpSDcdPzSdxIWxeR/UFF+n4aqukSSC
         1UqYg4f0Tw34VNc9Cw4e6iDjL/PRZESYWVEt6YKCn1lrSOTq+BZygPt01VpIK5SzBstS
         a0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205086; x=1747809886;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=R5wF5yQuO30p51hl/dAniNLmQVbdgrPuhfIivgoTbcuSbcBAM0Lm6hZJjDjFN1ZT2H
         od6fP6ZC0lbeqzu6iRc+xtWHlYz2i3kFN9J4liY6V0pjL3+HBNrCAOXnVAP/RJN7/0cf
         JBPdhKBYlAggpjiolFhNPQMCIdOwYHIIZI7BhtJJp3XwJ0kp3L9bguUoN0BPSZTHk7hy
         Qj2HRtMeo89sOqC9HurUnwyw/JBzsLBHGwnSqE2tk/ijArKo6sA9P6F4nEzFhCU5gkuT
         Msq6DS5hdi6/6kexjZ8ZX1JaC8j9EMtYj0zMNuScZ1zgDu1OavanLjEjk1yFgbJZGZhA
         RMmw==
X-Forwarded-Encrypted: i=1; AJvYcCUCiTDzCAxUuHg2+Dakxo6vyDHUARcbGvDQE5i8krXRkQ3Ys8boTTa+oOSrl4rKJxq/Cu3iF6Hj02uJjw8/Pglu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf6K5zXYxAcGLUXkyNonWH5WHlaUY7BsmSvMCGtKexpIE+giJS
	g+1BbOrsmVDUuv3wmZDs6fyWeT1DMGzwVlX+9EAs8UQhVDG0SvcX9vg53A==
X-Gm-Gg: ASbGncusNcZasLIqiNqoPCkI5xJte/rILxHCLHUePHGspsVRhBNpsCyl4ZX8xgL+Xa2
	JWmMjhvfOUrA16/eFWtDRH/35oao4C0EVNmDd+OrUfy/CXZblxSHF9ASrauNuTJurH6nGo/GmZp
	G5eSEhpaI3ioorbKG8BZSJVYTyBR8RLT37i0tq7VqvNuTbvdWMk1w0oyxuqQPHWkoKdaRH39yno
	DkqrwYeIaGYTlbMczdV0bnodshhuvrEpBNqSz9KksHnEDxBpD28qvGNje9c6YjFkGrpj/CmB579
	Yj8VWlM8bhjSndwDiUPMq/72O6GwvZ4q9o/GEGLUz6rkML1tbphJZxtxE4MVqEDQn1cRxquN
X-Google-Smtp-Source: AGHT+IFwIZrYPD3WbXFDRklDUuXUJrldwY/u0s/EqxIvE+gIjhV/Huxd9CKq/cSzMKDp1d6ZGWTLgw==
X-Received: by 2002:a05:6a20:729f:b0:1f5:9024:3246 with SMTP id adf61e73a8af0-215ff0eba21mr2915171637.17.1747205086397;
        Tue, 13 May 2025 23:44:46 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742d13sm92517375ad.90.2025.05.13.23.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:44:46 -0700 (PDT)
Message-ID: <68243bde.170a0220.12d995.13f9@mx.google.com>
X-Google-Original-Message-ID: <20250514064430.284576-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Wed, 14 May 2025 14:44:30 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6822b830.050a0220.27a24d.d064@mx.google.com>
References: <6822b830.050a0220.27a24d.d064@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_234447_483700_516F5816 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0


