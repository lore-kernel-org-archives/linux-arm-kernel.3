Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A29C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xuXRtMtsCrbKtroiJGCdttoDF3tRJIUhOu4EeJUBsWE=; b=VcDaTd6D8oy04SKjchGHMI2bDK
	imYGF4feXQg2no4jMDSpu8iq2rBgTN/f2lxQU7zBRHPQ7C+lQXqSmJ6tpthA0koJwwajsSqTA+XuN
	tXxWALijz6baavZA9wSyoELuMolHCZHPHZgzPKmdF7x3ayKFH8834GqTDjxe8InvUNa/7TSs3oEvA
	N0mn8E3YCH40gApv0iWGvqve3+gIxlCYbDOa2tWo0QtT/mSmxaHPpOXsyNbQ6pYUDbU8vsX/4NUVe
	v4rPB6axFmNPuQmO5UGSx5ZWaoLMZIdftWmzTHaZ4jJI0xM5yfr7YHPdO88WytVClBsvZExqNByUr
	qA4ZuEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjicc-0000000D1Lm-0Owg;
	Tue, 14 Jul 2026 19:16:50 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjicY-0000000D1Kf-3qNh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:16:48 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4a46a53abc9so953038b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784056605; x=1784661405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuXRtMtsCrbKtroiJGCdttoDF3tRJIUhOu4EeJUBsWE=;
        b=bzi/DBAIqnWYPgQb7mnXX18hTFu5x0ug5o5rvdORly6OKy3zZX3iXL2MtM7zupmS8p
         Eka3y90zRynvkTxV1R+rqPaI0yRofY4mPF9BckPc7f+SvzI4WBoivEdvU/wTNt2YrSfO
         SqEjBbrBYDs8F9PINzzvqm/l/CnFwZuLLC+0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056605; x=1784661405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuXRtMtsCrbKtroiJGCdttoDF3tRJIUhOu4EeJUBsWE=;
        b=FPSSD6fO3F8TVh+MlCq3xISNObtTrka5fVzrF5RTCANZdSju+1IP8GVctosZzMpvXh
         rnSkgWgo+tlCP7hl3/TdgOw/lhaTRswZ+vcJWGTk73k4ND54R3erIaIzYPQEOaFrJgYO
         tI6twiD8TUMwx1aqov9k/CqqKDob5eCnaSWnDbYY9AVzTXkQnxHBAJc4PNGZ7P8QJ1jQ
         /XEqCt3bPLohD1ElF8Q8vJcG9xh3XtNQ4FxRGvanrfQC2hv7HVmnqrebndyC81Bc/PcX
         0Gy+DhaNoIJ3ypxJfxDm911wy3HqJVnSlxN/+YkpVQuQpq0fwXaz8/FwFKhs35wyx9FY
         uSNA==
X-Forwarded-Encrypted: i=1; AFNElJ+/O6DEA9uP9xtE9PDlt+TxrZXEQ59f2DoQvyoXuZdJ2x9LTWy+6Wnzy31huaoDeyrv1hvqjJ4o+T4pDbS524b4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg3Ij4B6CdTh86dwKyurcPunLBw1zNVhe9qCrdbt5UbE5i7oBb
	n937SXdNz5xZlzNJfzq5Ecth9ICqdn1nczlzofhc8q/Jrlvxt2x3sPzHhnPe7jSUqA==
X-Gm-Gg: AfdE7cmoF6X7McXdL75fvHKl3Dyvz/Yx0KwNr7aWn4W24+oUtlOsgn8OyNo6vgif0+g
	HKGapiQpqBXw9dMgg1FsQJUdcPQMST0aauKyMrtoS0ZzP5vTly3GXZBvK1UydZgNWGWbwZj1+XF
	GAQ0VHln07rRgVYL84OyGBlItJqJdl4VmvPo8BoAyhUUPxj13noCynbjAUCCwDF+fGcJmj0NIGq
	zPb5zmfgHNsVkufQZu2scn0yyeGR3Wm9HjIA4KujWMcCcO9ie9K89e8a52kbGsASq+p7lBWYO6W
	/CdNUnIuyueQ7iLij91ptuAS9mdEJrJWHpM65a3e/xDgw0N6ErDh8XPY+/EQ3c3dt7n3guEXQmf
	O2xVQibh4IF/upnIB7avGDD3aMjFdz9xFH2MywM68XanYL0hIQPYmxXQXcx82dhwxfIXk89+ahI
	JI3DFopcI=
X-Received: by 2002:a05:6808:4f22:b0:4a3:26b5:7c3a with SMTP id 5614622812f47-4a42ae048e3mr10469731b6e.15.1784056605373;
        Tue, 14 Jul 2026 12:16:45 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm14767236b6e.3.2026.07.14.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:16:44 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:16:32 -0600
Message-ID: <20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_121647_094159_141C0147 
X-CRM114-Status: GOOD (  12.36  )
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

Add the compatible for the SARADC of the Rockchip RV1106, which is
compatible with the RK3588 variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Fold the compatible into an enum together with rk3576-saradc, since
  both fall back to rk3588-saradc

 .../devicetree/bindings/iio/adc/rockchip-saradc.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index 6769d679c907..f0551d665916 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -22,7 +22,9 @@ properties:
       - const: rockchip,rk3562-saradc
       - const: rockchip,rk3588-saradc
       - items:
-          - const: rockchip,rk3576-saradc
+          - enum:
+              - rockchip,rk3576-saradc
+              - rockchip,rv1106-saradc
           - const: rockchip,rk3588-saradc
       - items:
           - enum:
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106e2

-- 
2.43.0


