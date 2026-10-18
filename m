Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C59CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL0E/vt9sxXlhTRMpInaKfEm9NwJYqDZiQ8jv73u6U8=; b=YAt4v/HwXka9msET8nL2uIhqWM
	6wH6Kk9NeTuMZsEG0p/zs0p9ViBtjT9+boL3R6efBbAIPPV83XZiLQPX5471IsS6g394vLB3HzXVM
	GM3bYr7cwQYYaf6OefPtIGmVwP0aMsJBlKX2aSmjg+TfmRv+ySnLzG0ffX0uLc3rULzVlHu4GJbbD
	oOv3WO55EIzlWU0/wHRkTo0zo5kV4pSQFSAHojAOmM0LROwyaRe4o6lEpkzJyVpLErfxrh61u7x+F
	SLWZPtz7g/K+rFV4SxUBM7PMbB1+o0i+qwS8/uCADkXbY1C0alW1TOVYWSNxjKDZu7Lf7BDDyRuj+
	vM0QuzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISXX-00000005yhk-0xQu;
	Sun, 18 Oct 2026 15:11:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISXN-00000005ydL-2OR4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 15:11:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e011d370dso1098017f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792336259; x=1792941059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL0E/vt9sxXlhTRMpInaKfEm9NwJYqDZiQ8jv73u6U8=;
        b=GXpPvP6EldW4KzbtdwPFPq8XKC7dzwydI4nGwqbVVFeDUgtWd/cJNXdOzg9ZOLG6PF
         hpqEE/7YyiVwupNZAzdgfvDFlulrIsc6OAckrv5rBm2dt0zdZLY1vMQWc03qyyuWxZhZ
         ChRdqnRh54kpHstnYLDKlyk14yxo+stGf3mGwdD7iIinnbyTVZW/exHN0JOmr0WuZEvT
         7EhGIw2EFFp+eg35P8p2wXc4NqcYtsPj8NPqUo/qFo1uSwsFrrN9Lc4LEL1Uf/yzAjry
         r1YoJH6w4kW9fM5CVBiapwwpMMMvKJPasApWYpEwZdnvzvsX78Jzab9sBS5/HRKk3eEz
         uEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336259; x=1792941059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IL0E/vt9sxXlhTRMpInaKfEm9NwJYqDZiQ8jv73u6U8=;
        b=NlIF2yivFAoIGZuGlDv9HbUkFTzqVlvqu2BkCZJqgwXBJzjlkFiPMP4wHlv0Qgga03
         0R1oSY5eayeX4hzVIP+hdoZFeNHQXo/m0pEAmyEGmJgltnYaS8AbxF4cDWIL2XGaHii1
         DgqFsLt2RYbQeP46IvpRlI0GB65MxellpnpydjosJz/E0VS6u+gfRCBd83iWdCvTkkGp
         a1UOXcB5jTTwh+7KR4CY3qVCJPLVlaoFWezys+8eBCM6Q+TjTQPmDTkXimbGlptN71uH
         MudLcUdgHpIp3zxNPhz63H6RJE8VSJt3OedrcQf1xijSahgR1cwcjiz83tUuaVF/qBhB
         qDFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2RqO8Cv/kU2ZB/OR5yRm8PVtrUHu38R4J2ZmP9Z7ZjBpa9uS4RWZK+yaDI+hh4tO3lZHBMtdUYPKMUwF4fLPa@lists.infradead.org
X-Gm-Message-State: AFq9FYIAii82WVSovdIquB6i3cBpLfHPylknvD8dIsG+J/UWm1oT10cU
	YsW50nNYmBlFnQ9uPzRaR3uGffPqv7ke23eBXc1JzMdx9xfzZiyza2rXNJRGOVFM
X-Gm-Gg: AYBFou3VP2lpmR8IuxBiG0vxzB5s/7Q82fWo6ITJLVZ/wTTlwQEqwo/i4YGB5WrvyeF
	nSSYcecCi2w2W40ZluKKF4MXprrF5tWS1wiS3tu9XAVrgWZBAmFHJ2iDP1hHbayDm1p266aMtsc
	PZMtXwAHm28eBpmMn+d+FzdNrd0BSEOhhFfmIMKnoBlVqVdYW7RTqDjYYtjHCGrMQWW5IeaQ0SG
	fwiy4UqXksXHKT6MC0wFm9tMGz0HmXZa0Ay2fjzve0RZxASm+UgrfwdnPn+6z79ux6j3ZGWYD3X
	cAfiP1moWHZtHML/XvUx6aDVuGXMVCBdfP+OkIwRtmr/IWlsG22FugYzcFV49KTENOcN4bbixPf
	+9CmNtBN1/e5ET1yLrGkBqMJOvhS/RvMZ0zDDPqB0y8oS77OScK9AWtOiE7mAZJgz+HcUUOYsyu
	2Rthzj/E4epxBvHPAsp20iUsGBYLcogjVy1skpdWHdohEaQM+nkLQG71RCMWLieidRWcvnCaG7X
	VFHL++RflN9t9jrD5eSr1hQgdgPKU7A6aNfHrzuMmg9YA==
X-Received: by 2002:a05:6000:24c3:b0:488:57ad:d5c8 with SMTP id ffacd0b85a97d-48e079759cbmr9621680f8f.3.1792336259484;
        Sun, 18 Oct 2026 08:10:59 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm17743957f8f.47.2026.10.18.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:10:58 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v14 1/3] dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
Date: Sun, 18 Oct 2026 17:10:54 +0200
Message-ID: <20261018151056.1051330-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018151056.1051330-1-sander.speetjens@gmail.com>
References: <20261018151056.1051330-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_081101_633265_6135EDA1 
X-CRM114-Status: GOOD (  10.44  )
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

The trickle-voltage-millivolt property had no associated type.
-millivolt is not a default property unit suffix, so the schema does
not automatically infer uint32. Explicitly reference the uint32
definition so the type is correctly declared.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V13 -> V14: No changes

V13: https://lore.kernel.org/linux-rtc/20261018150028.1047172-1-sander.speetjens@gmail.com

 Documentation/devicetree/bindings/rtc/rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index efb66df82782..e46d50b1063e 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -51,6 +51,7 @@ properties:
       if trickle charger should be enabled.
 
   trickle-voltage-millivolt:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Selected voltage for trickle charger. Should be given
       if trickle charger should be enabled and the trickle voltage is different
-- 
2.56.0


