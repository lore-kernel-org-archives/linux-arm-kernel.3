Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C735C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/YMYZ/ZLPHXITGBWlmd5D8EZ5M6klx5Cg4Wc6dV+NEs=; b=rK/RAaDJ2zfaL7udY2zp5ZGGui
	11aoe726eRxJ6GUrVt9cHC0OjGPEfLBSey7OT8mbFPTgkIWEo85UPDk2fg7IBD0xp53C3gOnLB3ab
	Zf+Zu6Bki7z1V23VahQpNzjaLEYhQhYoDJcXQEwwheR/68/TRtheyciM5ECe7ZCaiLmUYIMRmO5U7
	j3zBCUOM5clC5IlKtUt8aFjWVJJHitzIUEFen1t4WnYMmdThV182Mh8zRjRrrsZpvfeqcJEwrneU8
	TZDif005hZxo/EoOnEUJ64l2YrLBjM0dAOPCHUR4HXhtlWxowMuJENn3NGvUHJkc26VIHLHhYGWtL
	df/FYKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm6g-00000004gUR-3a2b;
	Thu, 06 Aug 2026 00:37:10 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrm6e-00000004gU3-2qjQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 00:37:09 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8ff20870ac7so10727066d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 17:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785976627; x=1786581427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/YMYZ/ZLPHXITGBWlmd5D8EZ5M6klx5Cg4Wc6dV+NEs=;
        b=dTz4DgPV9V08ieYx0wywDflw6lqKIAV549DuNQ5f+yPRdvea1ZDjkKB6YV0YmL/Klf
         Fv9qW7m5UsAKwe9UTYNpDrVbSFL5g/2Ew43nXMKf1ztqlxTPuhK/ZNEtSXz8L/I5/vTH
         RpHGy7OUnPyfnTU606tuo2VN0I7zI4oH4/VrZG3ofaPLLf6fPYtUeedPzYDuEy0jvmRK
         2dAfDstHsAzSw2hPaZviNJ6aZaBgpXoR7YVH0mWPJ6iQ35rtQ9HksknVjit07uKpOkJj
         E+gjHesDqZTwLpJtn8ceI3KNLnIzRtSXjmCSD6AkebfGaZgaP0bxoC2C37xu/pqjrhyb
         CMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785976627; x=1786581427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YMYZ/ZLPHXITGBWlmd5D8EZ5M6klx5Cg4Wc6dV+NEs=;
        b=Pgb38H1ozpoyyEpQzOZaYlnjo4yjmSsXehtPTt6VALZ2zslRmWhJBM2g8tAxjU6kTI
         VXHa/rM0+0FnP+wjjEX4pfnUZUWw1GXwDnINM0lO9RLGCPViCMfV4ayHxebyXSiVfzmd
         EnLBUYk0lgLqKF3jqCgT3KhPdn260MkU9Kx2Ttyo+rPSeh9oTbT9hTDI3+4R59i7BZLD
         V2TF7ITeGJAeSvQRpmJjbdfIvPVO5Fo78UiyHacrxiChiIFlv32OOYlNsrjoHn0Xo9C9
         zqzeGsD3Ng+gegqYtMbIFT4vNEMqYzTt7qApw5pZTn5XSjFAWXuXH4EqhhPGmZcSGWP5
         bsYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1GMahozVDOMq+3FdMRhsYpD4ZdiYxC/uUPpxQ8UkRep9rDSoIBSgmA3J7OOFjIAbN+aCYPpofI4ilTaEvUI0G@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw7J7VUXvWyZHck0M88QzzDklO9vH1rpRmkUpHXXczzkyq9TM6
	guq/07NGzde0vCPmOSllNgKHJs9CS8mbuWVSIT18OJyT48RK70xj1c5W
X-Gm-Gg: AR+sD12cnPTl0ycSYVahNu9dMl4g3onjuiKz1WjoirBNVTYsaDiJkZsI8cGwrYKc8pV
	qC1qHFzLKcn8wIOq97fHiHbbDbn5YWV8zLrI/4WpxTIufDLHSAaRkMloN7BKqmjp2l04kZt5MDL
	RajcIXwDBEstKgMbRE+thZ2THOY0w9TLggXMhbHprY5lnzqED5578r8ZrWJ+RzmSkN0GY9h+rVP
	6a+/0UF0/W/8bZer/tBd2OY+ZXHuTC8P0y+P5XjDihN1NGkF3I09NOI+dp/6c/7NLrsIBQ3UwvB
	5wGQ7IrtxqFK4zu3ZzYvnQNZHS51OaeTGMMkiGzZO9yjglhN8rYotJ47mWdmEhIFW6THxtc5UXo
	8zpsKfWB2Ud+esrENSPz6R8+29sYSpB8ArA0qXXrWZwRDsYHmZi3j/BEXOd64vzYuEcQWRRsaTW
	AWMwYNvGcmRm2QeCBZLM1/8XoESNyC9sqwHGmxHZSVz8znNE8bKu9ujJQlnaIHaxB2CFhcYLOoI
	/uxHrrrWIJAvn3Rb645pT1Heh+ql/2jUCBKesqHvOx+KPvefmBX1opv50Vi8mpVzO1D4D18w7P/
	746PhXjH6uropgcKY9D3YRWeP24FN/giV9m5PQ==
X-Received: by 2002:a05:6214:252d:b0:8ed:a980:6b2c with SMTP id 6a1803df08f44-908813bd801mr126643476d6.30.1785976626999;
        Wed, 05 Aug 2026 17:37:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9088008e9aasm38717096d6.28.2026.08.05.17.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 17:37:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM53573 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM53573: Rename mpcore node to mpcore-bus
Date: Wed,  5 Aug 2026 17:37:03 -0700
Message-ID: <20260806003703.5141-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_173708_718431_F5884875 
X-CRM114-Status: GOOD (  12.22  )
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

The 'mpcore' node name does not match the simple-bus node name pattern
'^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'.
Rename to 'mpcore-bus' to match the pattern, consistent with the
naming used in bcm-nsp.dtsi and bcm-ns.dtsi.

Assisted-by: OpenCode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm53573.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm53573.dtsi b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
index 1aaa05cd3693..2c43be98090b 100644
--- a/arch/arm/boot/dts/broadcom/bcm53573.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm53573.dtsi
@@ -32,7 +32,7 @@ cpu@0 {
 		};
 	};
 
-	mpcore@18310000 {
+	mpcore-bus@18310000 {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x18310000 0x00008000>;
 		#address-cells = <1>;
-- 
2.55.0


