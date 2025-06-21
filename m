Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965F3C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 12:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=; b=p5wvK3OhITmGUXSO8qG85Og5xd
	EjXj2B2IUOy3HOniPFg9f0s7r+yFk9Jes7O5FtSgsk2QCVFALu0LZaYmu1JaggKMNZh64/4o7UEJy
	YlcolmcXNqLoRlqKKauZgCm5jbL3YxOe0xMjDuICCnj3TVdlBd8c3ALRJngCT0qXiIQhiL323Tc8l
	Dmq7Psv7bN4ynQy5LcCbVlditguHfSp6u9eg6WsjDmCPJI5YjJsMIUwIGXsN4tYVfWGQt8HDI18sc
	CKTI7x9GNUBpYPyD4iG4pSQp8tE/pzLOLoN7uChOLmAQdXUsgCmn10G/OxovAA1uZ7rJbNx3lGdqj
	hsZutSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSxjD-0000000HS2A-0Wir;
	Sat, 21 Jun 2025 12:53:51 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSxef-0000000HRmT-41kp;
	Sat, 21 Jun 2025 12:49:10 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-712be7e034cso22753637b3.0;
        Sat, 21 Jun 2025 05:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750510149; x=1751114949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=DEo2Iz3bK49/Cxy5gBVVoO2nTJf3eRnzJMKeaX8bwQn1QDMY5G+icb+4CUpu4wOTIx
         tcdLCzesiGN3rkzbF533F9YIG8Ra1B2Ro5zyaz4dgCu8KdtvklJtF4pR0yJJQAX/9z7H
         s7meUsmwMgtlxcjrmDYGOsqzHCMVWB6ZPXcy+AYzNrwKU9cBAGr4wLY4ByXaKYGig8MO
         JNgwpHJnWJFsHjh8FfXwYxzSnX/tbEKCGAXxDIPJGLBTtHtlwyv+O0+oxBA/fvSwGnx9
         GMD6EtGgrx7wYdHBQAybuowdwpj86N0ZsI4G43w2G1dI99xCg5yjLuPh7YSJVl4ajPPv
         98Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750510149; x=1751114949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=Ed5WNdCKOSGcC2wObe0X90mJ/CWgbgLxy7s0BVx9Uegsk4RCjPUOh4UeUFT4cWrXgv
         ijLwnG05ICKAyvmh/sHNB8uYrOPImhhmc05bWA0/b+8Lp+m9G/mBpHhuvr/nc3m3MT6Y
         lGPJ7a9sGZYJ+ti1uuAHzeHLl8BIhXUWWIlQvEwUBjGTfWZuQX1YjB9Bh36jDeBmCqRB
         4TwDh1g8bYtYyQkfPoZqBsjtX5tWCKtJaMVuHj0SMjDrzvA2iNuAtvPkm1FVVfPsye5Q
         Em9ExAYBtWNuPTAgCQQBQf1iawPcJQYgDmbJSxGzaCTrlI624Eg2GkbvtrAr8cnibHHS
         KIbg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ezPigKBiywquq3trFfArr1lJAdbIVArL1I7f35qcvFoiirOe4ElHUssVqjoe8zZwq2MhhjHE80Sec+7tDFU=@lists.infradead.org, AJvYcCWTIkgU3fvowT93EUCTUG6zCtCSQaYaqvM/N8gMWrHQiFSmZKfgu/a0EIAAvPjE6XgbXsuXCyX2vLDh5OvAck32@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9xF2hg0ARYtCElgryTC+fE0bA7h6pM0yr3kh9TM+Dm6NmpeYZ
	Uk1wXQ6nV5ir+z1Fwkve1C0t5IeqbcXC6Fab/6IqcRj8SkuP30QcmACL
X-Gm-Gg: ASbGncsNbmRyl5JMZKtLB0nxb3Yr5Dps7SUiwUUjPK6D2aMZKguci6UB3IX+fdrB9Tp
	xfPkxzIh7LS0aP83GcNxvNu+EZstBgBx3lbyz7Wz/1DPtrgSgP9OzPiwwsvu+neUap6MeEIB7Cw
	WwidP61RQXf/zaEKb3yEMqDh9EFSTaghu45ccivVZ3Xs3MN+lvKB7qM3zE0MpTlPcZv5ankZIJr
	9eKFEf3CFvDtsZ80+/HQSJV1rvPLH5LCIn7xiJ7wXj14r1j1vEx1uO5KFPWxSaeLfWYU8gZDjmg
	w5c/h+klsHyDmc1Dl5b8NzAEfVrovGTQb0JyCfHFyAk/noqmtCHhUXvWOER/YFHxF5C7YCo=
X-Google-Smtp-Source: AGHT+IGb4QBZwlRaOnmhbLYGlHYFCszSZWOAsqOUSTLFSK+Gp9tDIZx+sf5NecxM1UlD8NEgaiMx8A==
X-Received: by 2002:a05:690c:3608:b0:70c:d322:8587 with SMTP id 00721157ae682-712c639d769mr89059217b3.6.1750510148901;
        Sat, 21 Jun 2025 05:49:08 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a1625fsm8357727b3.27.2025.06.21.05.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 05:49:08 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Sat, 21 Jun 2025 08:48:59 -0400
Message-Id: <20250621124900.214098-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250621124900.214098-1-inindev@gmail.com>
References: <20250621124900.214098-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_054909_991428_7B2DD111 
X-CRM114-Status: UNSURE (   8.66  )
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

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 59b69c4741c5..10de9b7bdfcc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -295,6 +295,12 @@ properties:
               - friendlyarm,nanopi-r4s-enterprise
           - const: rockchip,rk3399
 
+      - description: FriendlyElec NanoPi M5 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-m5
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi R5 series boards
         items:
           - enum:
-- 
2.39.5


