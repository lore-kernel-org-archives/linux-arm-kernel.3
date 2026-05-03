Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA91FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UHe+LlrtosdhK09gGgG/VkpYFGnEvDBwqP4aIDrGEg=; b=VStkU07fI/fJdtmeI14GpNDBuH
	h7hzMXiL9rY7iACx3tDbN9wOkpMHjG+FTWHraB7jiazzAOEnNx/vRwXUMNrLqJRol3+xYLgnrXQAG
	KS6UAMaRqtERt1qlNy8pmvhxGQ2GpAfmcTcnx8vOekc7GTYa95VHlrmFYTgKi+/aHoWGZUUMj6PdY
	jK6kzQPnQ6U0+dkDb2q0xMVky7VuYty5NgVJBxMb9Uh3/saa7UACh1RdD7E5J4KdRowNPeoIFoCY+
	ktnF4EJbi+zADTq7XsAMnxN5MhhYWotFP/J19r3fDVWGCZQlznKkFSojVq/6B6ELBNXPcq7qxj8KQ
	jlOkOaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcLA-0000000BZa0-2xWu;
	Sun, 03 May 2026 19:18:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcL8-0000000BZYe-354S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 19:18:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso17524825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835933; x=1778440733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UHe+LlrtosdhK09gGgG/VkpYFGnEvDBwqP4aIDrGEg=;
        b=fzT8/txNyxU5aXYyF1bd0k9pR+y0e4OzwJco1jPAaaYw8QV3Qy4n9y4f9UUy5I9v4P
         hr+dUvPM0+i7GuArgbaaPs6hgLKK5+8RStKlafHNS7hPDY11CsvKsIigsTYmbLLhZr4t
         jdZ1WB3hH2/pvIGaOx+ERS/86N4aoKBJ/LDHxn7TEaaRwEaHf+kkKR/ylqN3QHyyzYoC
         6pDTLUZzci4I0hpJ8ErCt0t8GB4cAlcSkSlObzGRzYTGF2gjCuBLIaoaeVtkUj/YD9LF
         hoSJJNPup9HW/ZS8VjCO3cjKqnDbWSRv1ruvZcNsdXmKTS7a8ASjwcMO5FM0PsmbFSUq
         sX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835933; x=1778440733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UHe+LlrtosdhK09gGgG/VkpYFGnEvDBwqP4aIDrGEg=;
        b=NVNJAosPsi904xgh98y+Yid/bWfFI5BIruPbjjJ1P3FLcylFncUg+L18k8Q/6Jncx0
         vXMLB5e7lp6/sshBau6Yc3tNfR+uMZSVP/wPi9p2Ik5J+TtqH2Ac5zRrsVOJhUESjuHO
         xUs5jQ+pK9W1J2eqh6oZGDsaLvFrMrAeVHICi/fpIdUr7iwHk6O36NZRao+3NL5AvMpk
         plpLv+u4ph/JmRyPxDAE2iCcC/CCxBkZSydBbDtJU5VYOzaNXl5IDKUpq5Re33wpiJ5d
         xRLFZERTX3NTuXcCx9eEHy2yGziQ5FKEC3i/UOJaE1EqkpLQlCtVDL8cTy+HuIAsVNFc
         gHnA==
X-Forwarded-Encrypted: i=1; AFNElJ9RB+mhHgZflRmJDs+CkALXIORkRx4vioPN7kConSdTbilUVLAD8qMz+anYNJVQELWvVzqUcSB3YpV1AD0ES22h@lists.infradead.org
X-Gm-Message-State: AOJu0YzFT9ZAFRp0JtnbiGdzzhP8Sq+rTIdOWp+WwxPfGbtaUgnGEbhT
	ZOXw4z2oVXqiT1tUSdhQGnPveGAJGZs8YTIAJAAl7WRr69RuA5v0ALc3
X-Gm-Gg: AeBDiesawwZWOtGaJ6oRg6+YtNkZ3w+JQEl/485Q1epYBPUGUHQgARWqugL15j2bnZE
	lJrA8baMM8kleJXPFlxXXynVAlvHSlwPVI/YmhRvXslcVaC4sM1oYEYR/RUq34PjbOo8EHTw4j4
	NxDxYSg+GO9VswwfZZkJ/VuF17oh/Mx2q0WSzvonn7+qvENv4wjRT78iZDRc2ILu8Iu3b8RMuQL
	wvGMt7uoIpNy28s/d+vzHwmh6vVAZB8Ei2GgXkGF29RJFuClmLpw083gRrb7Z5ZC2PIYKv2nprq
	WDRDAT+y0G2xMXBpBf9Wr8j4tmuqolrfU6lmlln8AbQx+Lx492KDgjCwFR7+hwe6QPAxSraNHj4
	Swt3pPV2q1lxp7BkAmI4SuBAZKqhcd9XXpnAwfdUob7LS7TbqUQBb+0Lt0DQUSQRlJDdUMdJmTH
	jhXkFyO0rlhVJTNQSpr77hkLI9qHMbJtJ10lq4TFlHsuVzf0PTZpVoQWKMUz/0tRo6gdoygFySN
	Q==
X-Received: by 2002:a05:600c:a590:b0:48d:5e7:a5b4 with SMTP id 5b1f17b1804b1-48d05e7afb7mr22018905e9.23.1777835932707;
        Sun, 03 May 2026 12:18:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:52 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Sun,  3 May 2026 21:18:37 +0200
Message-ID: <20260503191842.2736130-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_121854_776691_FDEEF54C 
X-CRM114-Status: GOOD (  10.47  )
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

Baijie HelperBoard A133 is a development board around their A133 Core
board.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..52b42779a283 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,11 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.53.0


