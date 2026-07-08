Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17FBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=; b=eg2DmlA4/Dkxyvf5rK7iZwSCEa
	tWVdJUZhHNdDyxnGaZiiDcvoES3FxRkmOPPYBjSBCboSw5nrk/bYbZuLEt25CmXoBCZ/xacslVsRB
	c4BxbGVCvRxsXDoBwxUycF7jsqxKJFNXtDHnmFCaoHRXckt1HSSYHTx14BmRcbTyxDUQiAFS8yfSO
	Fs9PFqN1lNISDZ10UnoouT0AUbC7iR+21mEz+5PQ2YJebPmXFgLoI89yN+HqKwXY+AHgmnHgWaNvh
	kyr7AC/qbD8mNvL4p44fa1EjFqbNhWC5qgSXhqzYvgbhbMJqJameGMCdYjHpFQ5NLeUtWueAwI7sm
	jv+5FMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGk-0000000Gyaq-1uK9;
	Wed, 08 Jul 2026 11:16:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQGe-0000000GyWj-3mYW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:16:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47db714766aso863716f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509399; x=1784114199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=QlftuTtWv04Fga3t4SfA8qiIi5bv+bSvuVIU8Yw9ant4vHP7pJbkmlYlFgMqS3csn+
         zIYUVLvRqbn2Vy5UTSoyMLeyunK4Aknj0iVZtrjnI5F9Jhbip2vX/FgScp9OdLjM6ozM
         MbvMI7oknunucia+GUMspuOYObpnYOflGpd2DUkLBtBkcgZ69U0HGcwPEQtUNwEm6oyC
         7XORAfje1BhqejBOgTjcL8ARqpcwAVc4crKH5DzweEFvxZ8s2vkjkEz3W/GfFpd4LeZc
         BEMOMjjr1EiHXv+PJyyVzJ6Vb4WAt+pCzvUgXgVAbcZQ48l87kMal5eHzNROiXEleeuS
         ly5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509399; x=1784114199;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=ICEBhqijYNfKoYlIpQsxuI1ylbiK2nye9+PQMVD+oCExH6yPggtdJpDX+qNW/rbERe
         kDt4aAIliRo6C2DUnHFVfbV9e4Emftqd7h2giElmz+vGk8f/t15KHdf1gnrvU2snr/om
         2UbYADJ3bB/FCGSTxYAhUA/RdcPVsRYB5sp5Qs0hQ9UEBzPwOFUSxeCEm2+J+XIaTXLE
         QuI1jhHvatduhLrxLIbkwVd9Zt0MADtenFpKF8B7Rnk7oz30yhd37VcvUMPZnvM+709r
         sRzl4RlNHgtUsZ7Fll/iFUeL2MeDbUxa9iG6Y3KCEF1e3FBV9GfrRuEKtZcn4G1fxrDt
         4vlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrsy8+U9m9GFWQ86VVzkxmGLAz+8Cd0/YXT3JcRYKPHQX0EJdBYN4nHcs6UsDZXwiyrUfGO6jRAs6SsMaKKXVIy@lists.infradead.org
X-Gm-Message-State: AOJu0YxwGT7nZNhr1N8Sg15Qv0xx8v0nl2O9KGz1dC7L1fOk2OKEwCng
	TnJzfVJlyufiB4WJ32+/7xIdzhatKbUSDPjoINTmVhZO8gt2O3plFOoUYxEeU89rZm4=
X-Gm-Gg: AfdE7cnItSPWfzXJKFhK9/fLmOi3XbghK9Er8m5f/JFrlzXuuWy5yeGShlSXwDf224b
	+SHqrd/wUWNcbisq7AO/4xAPa/PbBeXBOWbAAnkeAhqJUS87meZoUt3Qu0dMcBNkeLXZpSU0Amr
	KiWpT7vyClvDP5qkpCUSzVbFp+/bfD/fUYfy1IuJAjJsag7cy1ED9YQiHU44j8w5cex9hWppD0I
	aLAuFJvUAk+MeAk2Nr2N/JPDSrvdy6cRuu93GVETQJNN0Z/9za4dH+fcIdYJXtFKESHQOxa7P6C
	GgRL91FpjLNNPK/R/94V/5PXIYMR2vpkJpNa/le7dnfLW9gc9EABCqxuEMyHc81vKgJ/MJdYvUU
	+8oY0wX/DcbNMDbFMKE2c2+XDiqz83586doB8bQBKfRw9024tCVLPKeoxQiM2BQD+f0Hxj4kBBg
	fE6bFstG6H3TicBuAtRnruKhK5TrNtaOKknJ19yEP3WaMqptDEodZHM7dYXY8Vju7HrxBc9EFjW
	Gkc
X-Received: by 2002:a05:6000:4916:b0:474:88ef:cdec with SMTP id ffacd0b85a97d-47df0245d73mr2621597f8f.6.1783509398941;
        Wed, 08 Jul 2026 04:16:38 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039ae4fsm43122869f8f.18.2026.07.08.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/23] mfd: bcm2835-pm: Drop unused header
Date: Wed,  8 Jul 2026 13:15:09 +0200
Message-ID: <d31a5092ef0e9f1ef9f53979f2c5b22a83e9f697.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=duMJOMhRMJ7vzwyjzXHRpzbNOKXgwFM5i7qlyVVPaOw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFCTv0TFdgVKMIjyLAKa+ZhG9Uj6OIm1KDV4 xVdwvHzvCaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xQgAKCRCPgPtYfRL+ TtQBB/9yw2y+rrwbKmgisWs8vAKTeVbqbDnz5sBNUasP4KfNNYNy+8h5AiJO3Rw2PWgynngOxgQ i0lcjPjKQ4dCNt8OhhlkEP4h32gCDQqYTK8CLdgs/HSPrk+khDLKnFACXrBjR6eMlNsQQk/NxmB 9KFevHmHVA3/cn4jxFdYWXDjBvR2JhfmlHc+PQMW7FWYg886C8GqagvNHaq6xza7hiGAWrYvq82 CANOM/YBLjqHdQgh2AClmSbFnCxSDPt7o6qgXKf6Q7tZAIwyvljqEkS+zM/JLCAqLVoJXlBu1nr O0aTkfSzIKmMLU+thKJoqgg7W95CIiiNz0J4nD0IkFak4Zog
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041640_981927_AE6102F5 
X-CRM114-Status: GOOD (  11.47  )
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

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.55.0.11.g153666a7d9bb


