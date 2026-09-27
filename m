Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22A4C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 02:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=; b=OF3iqxPRNEvrYCrlHwjclkz8Vr
	pMANeMiM28C/IOX+mtL17ivQHqEJFgW7X+oYcKhUX5hqFB67hcWMbDkVjEzcJr92h8c0dsGs2wPPt
	0ilHl5wbKOv5kSyjepFXa38iJLUenA3QsnKHrWYvI88/KdEZrJh7rBtIrTdFq6M9+KgUR+iwYPJMX
	/mkm+wgY6vu0mmUj1dmCy66eThc1R0CmOe6yO+F79aYzjAmyILY47n8tZpIq6DjcXKvqJc4/7VbKe
	/+jGkiTH/jgRG6aftWRL5UouhKCl4VEgJfDdA2UtB4eKB483s5OfGTz2sgY9Ke2LwRNYQgk6UG1BQ
	2agm4fDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4L-0000000FxWo-3hSa;
	Sun, 27 Sep 2026 02:56:49 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4E-0000000FxUW-2yGe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:44 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2df908f4bccso13673005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477802; x=1791082602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=rdx7XSEMYn55E8kJZnU9tTzV8cF+jrPycAzD4KLWNfEHhr7Tf5UbbCHHg+mgSircyU
         exBO5zwHcoW6YTzXFvGkQXaGV/HPZkmtPu4ZKjfoTvupgva0ZnIGaZiNO0FOOGcbUtio
         uhzjc7i00anhh+xH9lPW5U2Qcnrt5zSeUsegTu+hxEmJN0LKwKEJD1cBpWod2FAY7fBh
         48IZsgHJ/l9Icj0vvRwDx288fToxANXNo9ezlKAkK+/vsv4hXTjfGPqWDGNhq6GlaKpE
         SPNQI5whNnZV11iLRyM9qpv7z5FAFJAffZ9oxUp5t3SABbfcf8QmB2Cf5KHWlAt2GSzs
         cXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477802; x=1791082602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=py/mvKfos20IMICEao5YVLGE2L+LJCwO2D7iFv0FLSHqgKOdOonB9mJs1ZV8G8uuFx
         vJGB2GxrA2djP9yg5YDmkSCLVwzdkFiO7fYO/PZq8TVUhSSxuFcHQM8m04/SAd1Kpviw
         fEybTLZJLZPgynPNrq7FywnmzPvKLKvOwptimweg94u7pd1RuU4xbbNs4o9B/yfef1hy
         lhtvlkLepeKdT2IoKDkCUdx/UgliR5HkCh4nZGiQGA2n54AW+Emy/b3Wb8WfmlR11P6r
         mnxnCCEhk4eLuHsUdaVGH9TPeYjq5DjJxeO6/fZFt3Gcs4+Vnv/kfkVkIEAcnTTcCoJ0
         wcEQ==
X-Forwarded-Encrypted: i=1; AKwUvByYyoUKeNQTnWcRnQtzeJRvvQCQ92F8js1e8xutc7GQxwDRuDBWKKfbaEsMY20urM36SIbYzKoTiId76YRiDK5N@lists.infradead.org
X-Gm-Message-State: AFq9FYK/CMhMG7Oeg13li0F95LhoVMyWn8nZ2swHxfUn7UPCxTBi0jpa
	2p6N2ySvvlfVv4QLljnGenXKJUf0ToPGrXEeF7n7Tk8DcGD+izTE32Q++qscP1V9T1Wm
X-Gm-Gg: AYBFou0dSi0ZjTQ9mPQSlAGxGzBNwzbKtHYpar9sOyi3lglk0DlRrWH64gcz9yi5LBU
	6NYJ8m4pWBlg/cEdb7ZAohI/fOWYWkgEgc4siiwJHyO3g8dh0VeZ7vWx0VtSOITaq85uy8jWYjq
	KvZGCR/oMmf+J/i/qZmXXxIfy5ihN1y+8f2ddMr/uV+Ol+698m9qhBdl3qpBWJmTfgeCcWzcOvZ
	3Ygi8Ng8BKPmg3Lcc09+vgTzwudxLNEKEcEH2C89Ecq0SkWL4n2WlUGExjTl5KNYjKPU7XbPq5Z
	EUU49eRp/fqKcCnVBrLegjkHq3FemFgIZ4WoleLvNPYXB14bql57cIrs+JKjGI1JL2Cz24s/lwN
	KiZ7ZxGtTkyNGKvhGvqNr+39mNJ6HkmrDauiht0RniWgWJHg5mNIvmCMwrGIt4SAW/a2x82GF9P
	KnX1UmIRCg8neyz4UevG2sfnInGRgBL/YMre/MPTrimiS+2k7SUlWU2+G2+yFpSwz6xg==
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr31921045ad.13.1790477801815;
        Sat, 26 Sep 2026 19:56:41 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:40 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 1/3] hwspinlock: sun6i: Get the clock and the reset without names
Date: Sun, 27 Sep 2026 09:56:24 +0700
Message-Id: <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195642_781023_9621C066 
X-CRM114-Status: GOOD (  14.03  )
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

The driver looks up its clock and reset by the name "ahb", but the
binding doesn't define clock-names or reset-names, so a node that
follows the binding fails to probe:

  sun6i_hwspinlock 3005000.hwlock: unable to get AHB clock (-2)

There is only one of each, so get them without a name. That is what
was asked for when the names were added to an A64 node, and nodes that
do set "ahb" keep working. For the reset, call the explicit
devm_reset_control_get_exclusive(), which devm_reset_control_get()
only wraps.

Fixes: 3c881e05c814 ("hwspinlock: add sun6i hardware spinlock support")
Link: https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d3145880..e7cc121310 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -104,14 +104,14 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	priv->ahb_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->ahb_clk)) {
 		err = PTR_ERR(priv->ahb_clk);
 		dev_err(&pdev->dev, "unable to get AHB clock (%d)\n", err);
 		return err;
 	}
 
-	priv->reset = devm_reset_control_get(&pdev->dev, "ahb");
+	priv->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->reset))
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
 				     "unable to get reset control\n");
-- 
2.34.1


