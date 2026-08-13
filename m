Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D71C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHtK6ZnzwEf/ipBzEmZ+Ey8tpxuxKg88KuJsAtOmL1k=; b=n1y1AMnrQC9i+vyuTd2U1KaqXk
	h6AguqBvLBwRlu7Rl2ehPBq2FSfS0KReIp1i27JxjODNqQua3HOLWOyeLgSzxKSws4A5EcGvy0vUc
	UVtsJvhGuSpGAEhOXAl3q39mLUCT/y/SV2l+hUoB2QRuK3M3cc/MwfL4ej5IYgpdEv2tS1P29xg/v
	BKZqRG7bbs4sPl6RIQ/2IZUxEd1Fkg+J5D+T+7VIExyEcK3p3JZygvjy5Bqzlrfal3+/VMXqzIGa5
	M4yPp6slVbcCaV77LWFwvC2JOXKbasxuBaf1nr28nTca6ZWUoLih6hlN14PbyaZgcjlDNe2l+Kxfi
	K6mBiIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRAz-00000000DOO-0RnS;
	Thu, 13 Aug 2026 08:52:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRAw-00000000DMx-3WjI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:52:36 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d049069377so19077745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786611154; x=1787215954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHtK6ZnzwEf/ipBzEmZ+Ey8tpxuxKg88KuJsAtOmL1k=;
        b=o4j+Vo3xLP4E255NnaB5WafWUGDK2snmI23hvJ7DDr8DpbSc45JYyW/sQ0uitSaFpQ
         jxL7EaMsOtNFBlD3zYTazBtkTQPAZd4YgQG7IwWZVyXUx9C9fiS/lSsKsia9wjpd9ZAo
         Jxzf/gPu14OiMGjSCey0c15amVH03RbaoypLdEfQSU17wSEmRaEEo0+xcxzMuxW/z7Fk
         ZL438GkPMMrWWWsfRHVFllxqjJiaT+MsxPiuVQfrejqzy5wflnn/wKVJ82ThzpmBT95/
         wvMWUwP41rYVWlISEd/xrGsuNLBqgfemDXRfhro/S1wK+4SdYeT1XgQay83zRCq0nRQu
         mghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611154; x=1787215954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHtK6ZnzwEf/ipBzEmZ+Ey8tpxuxKg88KuJsAtOmL1k=;
        b=ojVzxgYcCq7A8o8OT58Eq+Iy+UXlGmGBPJbOdwsHaWhXwy890IJ6EnPfCJux/fWVxH
         UGAKSUTNL8HSO52PS9pe7BP9ahphA4f3j9GxPrhnDs1wTrZHNfYtRuG8ZHFOj7utGOWP
         VCrUlaPk5b0srqMwOblLWvdTBNrECuAuJvPRbBwO3nzC85JC6C5BeOAZYsio/8UI9Bpy
         Y+g6T73KzI1En61BGjVbpdyjF4aej1POe7FCjK4YdSkz/F19yIJfMwVFNbtHpcspTkdd
         ZwTzTBJzhp7ahAh9jI5FEHrz3OrOlT9D6Nupk5BgOzUUq10RhOkuy+E9IXcXpZ1eljcr
         pBgg==
X-Forwarded-Encrypted: i=1; AHgh+RrgY1Ap8mVEnG3shng/kgH2UHB945SHxQzmgqcpgm5xXJWxLEhJaBL1F6SEYl47qgXbcUYaNeafqY3hpptHFzsk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs+iFW7mPOEl5e66TZ3y1oatXXGvDptFu+a5NZjuuwMiLEmYYF
	znQAhLxkvMl4y5PUu2OllMZeGI5LQ3EyjNA2RWVCqaepuyZJASONIq9Q
X-Gm-Gg: AR+sD13YWk3ntDOmuWjvripfrF9L8PpmoSHDms0bktlHN2aiVntjNyB7kaR8OaVXOaj
	zTbDl7ql3PVHJZBuKe3q/D6XP8PniKKui0zmmlb/N4ZsrxYI8hDjQaaY8VF+tcR/ZKV7gpSDJM9
	xgzxcVdyniaBFeox5GlbI3wC8+rL550GGuXt8ffBbBM0tnHCkvJRb+VklOKc8Lh9XBrmve3cNxq
	ya8+jwDbrxh4gByPDIkY+0AGdzzdCxChfNiNTiHFp4g/D93mtAYklc8mbM4ZvKoKTK1Spx73vvN
	FqZaCp9gPVYEq1zjhowuVc+muxC0Xl/XXSEq2Ku/voUhQC1puTLtcSQa/XCRnzft6q/aUCxPrJv
	UM0r+cwbPuLAVZxpJNN2Tr7Ujhky4GsiFJrWGmBpYOffzW1aio2xOJq+avxoy8Lxw/3x6hfKCq/
	1fJM5U7HV9DQzfTLu7mYdC8UQvTwAQeJUmaYIPKYZidjTddjxRTEMApnbsHAE4ulG0XDB8cRsAE
	MFmD4MnjRmgo8CY7RnL0ZOyXR9u8EahD79TTWl+G+u30+q0UzZILW0fS6WvOwE20pbbZ8wIm5PF
	RvFY
X-Received: by 2002:a17:90b:568d:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3931e02fb3amr5399769a91.7.1786611153889;
        Thu, 13 Aug 2026 01:52:33 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec0223e31sm5465372eec.25.2026.08.13.01.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:52:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] i2c: pca-platform: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 15:52:11 +0700
Message-ID: <20260813085213.44001-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813085213.44001-1-phucduc.bui@gmail.com>
References: <20260813085213.44001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015234_888670_49E9A85A 
X-CRM114-Status: GOOD (  14.79  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/i2c/busses/i2c-pca-platform.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i2c-pca-platform.c
index c0f35ebbe37d..63c8ca1f1870 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -139,8 +139,11 @@ static int i2c_pca_pf_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq_optional(pdev, 0);
 	/* If irq is 0, we do polling. */
-	if (irq < 0)
+	if (irq < 0) {
+		if (irq != -ENXIO)
+			return irq;
 		irq = 0;
+	}
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
-- 
2.43.0


