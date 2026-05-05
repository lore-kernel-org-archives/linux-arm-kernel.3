Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D287EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJN4xgktXM6wJnQx9ssoJ0Unj4TTmMJ3sFePOxUzWmw=; b=f+Tx8LeyfTARF26BYgq/d9e2CS
	XsuAZYps9JKZ7a294nAJ0u/pMrzzo0xPg35frqMzLLnrT2wb7nwqIPZ2Gt3aALDOWeBzKBhbdE00U
	aTkioXGtHdCshSGX8dDm2PX2EP8Y84BewVqFwf9nJvodkJWQLm+TJ0KfnoKr/PwZQmuSg0EfDDpDN
	mOxQbFoQtGXK65ktN18iVNQVj6a857ttUz7WG5FHJjz602ILW6DZ5Ibc17MWPpZnoHliNANxjqAuE
	9p1wudosQVR5/YjV1oXKTnn4eqiH+vPvAxHjVJ6UfavK4cJdDXMWZN4zphOjTEPqYZGNIQIw8MtPp
	oW47AaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpI-0000000GAOX-0l8P;
	Tue, 05 May 2026 12:24:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpF-0000000GAMt-2QYn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:24:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48896199cbaso45880455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983871; x=1778588671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJN4xgktXM6wJnQx9ssoJ0Unj4TTmMJ3sFePOxUzWmw=;
        b=HsjBwTUmmy7TGj7K8QhqUy9Jso8RMsCPEYj+sdWfyboPpQ95RXLXqnACAnG5SnO1bI
         4F/sQa5w3Vd0nB9+oqA6o5HtS+sh7mYJps3C/AsJNRZD7rnWbBgpL52846qCo2TltB9N
         mdbKRZYMxJ73kQ3g7/YrMeb7yROieOqU0ZVx7FPHAHHWXpbS9igxu+3QXz4gUoYSBAAE
         w9Tzkcqdxhrois0M7RHHZCJgyaPFvFI56TC6wT1zT1g2N5LdlSkc/BKg9bJMDFlXOUAb
         Y+C9X3yPAm2N+w4jKQHJ2ai1QEinzyIL5rdqVA/IdxW3xGaOZLxNT3wBUXxltqvFQS5x
         KewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983871; x=1778588671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJN4xgktXM6wJnQx9ssoJ0Unj4TTmMJ3sFePOxUzWmw=;
        b=iMsZQTnShZXNp32+S+oue0luZOuMIqTcqAUvFJjVPkG3VViIAs36OOz+Bps436yYZq
         zTPKeXVksbwgp9p49WExHmCiyJXS/PJWWdRifZISLbR1Wj91TuMypvm6FZ0GVisxA1Yx
         kI9+GCxYhxAjNLmO6fj9v4KiKmEakUpaSalRukMqsnfU79zrOGJhftjD5GG0S1Ei8XCZ
         kIb2fX54ufXmTmxsNrVR8A1O+ddpC2idHZ90LxytHCojEWW3a1tmnzL6GRYGeoFjF/EF
         /CZ1JRe2Pz2SObOxBUyiPHGe5VC3p9I38UdTtjkt4li5mfiD+MxFh31ijXzID3+IVxE1
         U2Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+Ze4QRPBkRaETqb6CGNMm/2GNMNLquIXBZtplocanr4PAyKovc8rFvQHJdpUfuUza5o3hJByNiiB7pM5zLyYpe@lists.infradead.org
X-Gm-Message-State: AOJu0YwBkkY5UBilQEn+MgTvN5pDHOXnlSjGzowvgdyAQtk7kXtSjwbY
	VH+yMuwxtDqwh4rld3UYlla0BQD9815XcEzDJCyn0WLWbSNcvv3BVSI1
X-Gm-Gg: AeBDietDsud30W1ZS/cAjyk3uSUDO3hP7LpnAFxbLh7LqpCgQTwjI9RJXquzigPlfpB
	RJKpWHcDoTpDqcThO5P5Ff9L44PxZ8YgCiTkvFs4sBlMZa2QnMUOMuSSMd23B3DdZW1Le5znb8X
	jQYUUs6G1GZmQAUj7Qt1bIHGH0DtxpfH/i9y9clyQG3KGfLjZ6IMVlEHFs3JAFLSYn+7fVvRDZa
	ZqiFCdZ8C32CHBituwLOfIHibrVKuWQhi2KSYlMgPjSCMb8wKQUSN1yxX2MBeSGIWbMa38ySu/e
	XYJTpFX8MI0lHmhwb1YzqN8XOHX/qwIVAO7yAfJtNdgntfy3U+mssTU/ywgXwL49ElV8dWD68wn
	x5RItKZYhumUcwMHfkrt25RDHXL2tqymAnx+QLkuN0DYHIVQfLCjx3M9yhMW8xAyeLXXBd6ofId
	ZLfgsE2BwkNljh63BDu/vJPBwPNtUqsZue8UA8BistP4JBxI/yGKczK5Ct2xoNsXIqWnOKC9dJg
	fxFWwY=
X-Received: by 2002:a05:600c:4f05:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-48d188dcc95mr48291535e9.9.1777983871233;
        Tue, 05 May 2026 05:24:31 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45054b03df9sm4170411f8f.24.2026.05.05.05.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH] MAINTAINERS: add myself and Lorenzo Bianconi as Airoha SoC co-maintainers
Date: Tue,  5 May 2026 14:24:13 +0200
Message-ID: <20260505122416.2609-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052433_664328_897073B1 
X-CRM114-Status: GOOD (  14.86  )
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

The development and integration of patches for the Airoha SoC stalled a
bit lately with the result of some patches getting lost, not applied or
even flagged as accepted, archived but never merged. The Airoha SoC, given
the similarities with the Mediatek SoC, all goes through the mediatek tree
and it's understandable, given the amount of traffic, that some patch for
a different SoC are missed.

To help and improve the situation, add myself and Lorenzo Bianconi as
co-maintainers of the Airoha SoC.

While at it also change the status from "Odd fixes" to "Maintained" as
there is an active effort of maintaining this SoC.

Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..bd814f20213d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2385,9 +2385,11 @@ N:	owl
 ARM/AIROHA SOC SUPPORT
 M:	Matthias Brugger <matthias.bgg@gmail.com>
 M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+M:	Christian Marangi <ansuelsmth@gmail.com>
+M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
-S:	Odd Fixes
+S:	Maintained
 F:	arch/arm/boot/dts/airoha/
 F:	arch/arm64/boot/dts/airoha/
 
-- 
2.53.0


