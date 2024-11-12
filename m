Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96076D32D97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19kL+yPDKYdJPy/Ps5/CpYlnCiQbXdTiYWnn6mrqU7Q=; b=HD6YYCb1Af+fD8fMvLnLlMMLDU
	OrzPlJjPFpbFrHVOOgXJ31WAVSTAjC7MkQW5b+Ze1oCVAURJK7c54iJ++qmoEgXDiumCN8atUCAOM
	yIPRR3ZQ9hGY4ljZrFMCQV9aqPYztXa3OI86J1Kn+wjGc2bxw3aGb8qMgjQiKOF9qNCkSJPE5Faj1
	ifDAvoNU2io/OurYyx6oJ7kHi6VNxf9GZ7NghhOfpqwocWcYu6ERiRMnM+Wgd1pkMnADpn9yRqNX1
	Gjob8diawefDbbciVbSkQJDh7hwYv96NkBTY0JFHkbGR3QUQFOFvdjNRbLJzWcSXLMrYIaj54nwoF
	yHJUPctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwhz-00000004k0q-2nMQ;
	Tue, 12 Nov 2024 19:37:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwcg-00000004isx-44Qp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:32:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso3971405a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 11:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731439942; x=1732044742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19kL+yPDKYdJPy/Ps5/CpYlnCiQbXdTiYWnn6mrqU7Q=;
        b=TeSkrNGcI6zfWpEBXkv3LRuPf1er0UTOYkm2F8rPfMIHBmRDKu1dF0U/XOVL5tpefF
         aId7cp6GhmtCn/KigIvaR5DIVppfakLVjIvgRsa2TV15hj8Z3DwjCVHASOise79jjxmq
         5Z0aTARAmmXd6bKyaEKcrgeM8KhEYGp17sd7MTci2J0O8NYl3Gwn0ijEf6kPhbkeO5wx
         47YTVpzkf3wevZm+wK/QehIpyO+GshizmZuCixH7vNUkEOVxDFCDZTRvfj0GkNUjeq4g
         fCEgeSNM6WCoGdNw7FEcpcHvCoMXQ5CqJu6MD4gBLj4WyTvO4lEaxIhNc/KLvXD4f4XE
         5aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439942; x=1732044742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19kL+yPDKYdJPy/Ps5/CpYlnCiQbXdTiYWnn6mrqU7Q=;
        b=ZUR0mMyP80o94TCHdfiwKJ2UV5bDjEHeDBQCkofassKUINNRiEhP6wYSZbchI7uDEr
         xNRlO4hYiLCOSpVzHc/tUW1j4H3yKM5RqrVl2FRlpP2UNNPCd0Q3AoslP1/qNEsBv/m9
         qA5J9YMhUKeCBpaeV4GuQBpgLVa/r7sqohZgZd3RbWboGj/CZis3I471HTX+5FEM3JMp
         POb1ygpNw5sHsUsBTI0t0ozDRO95Kz4epEkX5ZZ44dW+SiElFgLi0hDzaESRARnBecu/
         RBTw3ABk+4jCyEnFc/hCpNv1sMQtMJXjxRmiHj1UaIqFRxZHqdGlXuozNZjSFYwApWgI
         7fAw==
X-Gm-Message-State: AOJu0YxaMEja7TuEhJkgeyVtUGYP/doSdlE83Gyld/cqtiM3UabcauG9
	R5DsinRfwmO1d2fs5XHalLd+mMOh2yn1k6J6E8S46p8q7QkQIvUI
X-Google-Smtp-Source: AGHT+IFf79q5WRlc870dE1XfS8Cl2qWdeeJWxdyPIWkzC5LukXp5+Hkgc11rMLrKxmPlUnOKzi4/dw==
X-Received: by 2002:a17:90b:2651:b0:2da:8c28:6561 with SMTP id 98e67ed59e1d1-2e9e4bed741mr5162412a91.22.1731439941658;
        Tue, 12 Nov 2024 11:32:21 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd17d8sm10988958a91.41.2024.11.12.11.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 11:32:21 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
Date: Tue, 12 Nov 2024 19:31:48 +0000
Message-Id: <20241112193149.1262-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112193149.1262-1-wachiturroxd150@gmail.com>
References: <20241112193149.1262-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_113223_027263_8115ECE4 
X-CRM114-Status: GOOD (  10.84  )
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

Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
based on the Samsung Exynos990 SoC.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..168e77375 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,7 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.34.1


