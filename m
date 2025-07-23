Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5K02vRBKVj8wq0NKRnvdxQguSOVUkuGvT7a/bET5K5M=; b=kE4CMbPkr7WG6mzV+lZG+X3UkR
	pv9pCEwSUx4VnkX+BS1FNC3xFtooN8i6NXL3LfHGhPCzlzyJGEGsu9dsOSYoFeXQoI6mXcaTHm3Ke
	MnXu5IN8Fmpcrqt02hPDxn3IEBI4+U23zNyIfNloh8iTMQZuYdu4g6IDDw/+qa9prkq3OlFSk5nOO
	hccE2dfVgQszE/1RemsbieCC1/SrEMOBkV+jzzgrQrjtgJoj0zsruHkjz0lr3oA3O6RVIjROT4J4k
	fn4t6oEJKZ7Q+yhwvkbcktWtNelokQMbLN3EfsLaYFtG4t9w6aVdoIB6H0Uwu2JpP7klFezZPZmgn
	vZ8pmUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejQ4-00000006CQS-2rM7;
	Thu, 24 Jul 2025 00:02:44 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiv2-000000069OY-2dda
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b3220c39cffso492794a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313440; x=1753918240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K02vRBKVj8wq0NKRnvdxQguSOVUkuGvT7a/bET5K5M=;
        b=h2qsHl/DniVK4HOdLzuHxOWkof6lFjuMnnBWa15oWbxSUT6kCv1SrVDA4g09v/t78/
         74rYWHXN/lFvQA/VbFjV/lvDPyjdiCKExg4ya3IcB3/J7n7NDldf5ekDvoRDgaME9IRG
         P2YisrMdt92AZ8pcc8wd8PxeDuzAlGr43DKh2nwPD1zoZgEZxbtMMhADckEqgJ0jM3VX
         vm+7qhqg0SSmRakS62WpTuc5bapF/WqiXyHyGw1zu/F8csflZ+lOWElEZgzd+q9g+8fc
         g8rsFItwd7/GWIyAR+kF6KafqSe/H2yAf8jS3IzmapNqbx6FUdTvfEpNZPDqSNMbgJUM
         8uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313440; x=1753918240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K02vRBKVj8wq0NKRnvdxQguSOVUkuGvT7a/bET5K5M=;
        b=E2itwhBkVxc+a5L/sCcCsM0vxvWpY7Q3PIAExktsibDqx6PZp8ouFloRsRhjhF1wvX
         EvO49Xh8oXQfsZHMpe72SIt0jBqBZBQjR6KEZlIlHwIyL5fcu70lfaEYinqHtuooP1AR
         dHl1Hkk3M2uJjjJSYMgjDp7u04Fa6/+LTBc19rerET91IN1sFw1wQCrof7EOtjwCi5Rw
         FrzwVMjoiN9TsDxNT8N1Ze7+v8PpNGmYQQDxUDpmNUVi/OWTa7eJ1/FuWea8cCH84CAd
         oYOQg08E4P/L9fpuNBEvRx8FwmEifvWgn4YrC+soC3Z3bE7z1dRxgPThOljXehU5tKQm
         eQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXoKex224HDPBQJIlGdFNM7f3da1PY5RlYAf6xJRjEfZs0EDHcvxRWh1DGeroQ4Aql8DMMXTCoB+IeFfwDCekf@lists.infradead.org
X-Gm-Message-State: AOJu0YyseCQcsYazrz0GSh8HN0WUUCMbGvj5ro1krfPLDhZy2vKlvH8F
	GXmoK+GKMUpbN0HjAruHtIWKs/wQ2BbD4tGq97MuETZatqWFNmW7WJhy
X-Gm-Gg: ASbGnctlZzjrQRFCjjIjVy406IsxqvtcsbPWeqsVP8a+edHJBmINclOz6V3uOlQaFJN
	o8vLm7U5BC/v7cCj3KH2uqI8d5v8jof0Pi8U68AXGzY3Z881La842xvGtvMiTm2eOe81TGRAAkF
	W0dNWJW1KoU8QjNkSAfVXGqrGsqxIPvuyWi3aYzcbdKuzo+6QswW6v634aiN3md1GqPue8eZVdc
	RG3dM8ahIa+81y9NHj9fPs9/PavYxBaSOJJnO74fwMg43vkwHR0sF2W/VKG09K5pkVbXefJuRyV
	E/mL/hyohS1MxKdAxFAb8q/qZ7tTbOf20iyOFfsMhFMwSxquOw3i6kiz6i49HAs7oUbZwT+Tfg5
	5TK2i4OVpfT/uLWTlZdG90510Z23BS4LtF8Thfrj4Y4PXfqpHyV2yZQlRjjdCR1kcifHChh+dvS
	U=
X-Google-Smtp-Source: AGHT+IEfXmpoT/g11peUW8tGwEpWWd7xfm3Gjm7afI5NZ6J1PV8ldBFo8A9SNCO/4qqrkdgMsklxew==
X-Received: by 2002:a17:903:198c:b0:234:d292:be83 with SMTP id d9443c01a7336-23f9812b3ddmr68866145ad.10.1753313439872;
        Wed, 23 Jul 2025 16:30:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:39 -0700 (PDT)
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
Cc: Tao Ren <rentao.bupt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 12/13] dt-bindings: arm: aspeed: add Facebook Darwin board
Date: Wed, 23 Jul 2025 16:30:08 -0700
Message-ID: <20250723233013.142337-13-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163040_666168_BE6849AD 
X-CRM114-Status: GOOD (  10.09  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2).

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 3cc6e62ae5f3..2887565d4170 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -83,6 +83,7 @@ properties:
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
               - facebook,cloudripper-bmc
+              - facebook,darwin-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,fuji-data64-bmc
-- 
2.47.3


