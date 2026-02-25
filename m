Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F06FD45F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 23:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCIXs1vSaUaDxK9yFo1NvbBeWhizv7ThfTjSuMfqmMw=; b=MxEvZOHJ5Y0vSgCIOZ2hqSceOe
	7hJLN+P2lymztu81sqTD0Pnby72nlBQO5xSPJ1OxniQZtOPjpmHshaaiaApoWNz4Ley87KxGLrEeh
	hFzSYi+w+w/QAywFQSs4DPD2PvJ9Zv0Jju4/ApK30MbgC/6+yn/yGf8RJXLqUgAzF0//jdldr3vcv
	Xg348UlZ7fyh5V0+0Yn4h7v7FcfeOL8tV44aqXqWVAXV6Jt5dPOx+yIFrglSS4/ctPUGsbcwsPtB2
	TDZkqAVt0H2B6QNLX82tbX1mVYLPKeC76s5CDY+KgCWtW2dXH4t+WG5+mFxDDdvpY8/ElS50NPOud
	7xk0GvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzz-000000052Sa-08Mr;
	Wed, 25 Feb 2026 23:08:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvNzv-000000052Qw-1qxy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 23:08:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a7d98c1879so1164525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 15:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772060930; x=1772665730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCIXs1vSaUaDxK9yFo1NvbBeWhizv7ThfTjSuMfqmMw=;
        b=N0nU6TQNujYEFxhjh7B6kbZ1coCVv4/WZKDHeE175TxE5m/FpwqH0Mcn06xEuEGqI2
         3jlCeEMblkSseIg0t9eOoZ1YxBZQ0Oi9WI9RybCpiD9c+ORD6B/YHJ7Renp8aewUgxWK
         FjBLcgYM7EHluUvPpbHFCVEMzo859R7EAt1PK4rzWR9T9iZ+sAoctctR/T0JLGhaQBWF
         Ed3TgvAAk7iCmiU8hczz9W7XqH1OT9+4rAcoiZ6fODYGnGtwVGy+sMzTU7LQxsRuaPrw
         FzKvBW47JcSla5ZyeS0jR8X2UrG4+xW7lpzrmfnnFlUiF4fzrJDrj2TAjopazqmviHkw
         z4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060930; x=1772665730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCIXs1vSaUaDxK9yFo1NvbBeWhizv7ThfTjSuMfqmMw=;
        b=mYTFD1hwf+CVKLog8kofjOV+P21SCKvUCmbX5/83iIOmwOshEdqSovFyU5Yp/1NFzM
         uBM4HDO/mf2zlErfTol2R+eRANGm4qjZy9Iso18ORyhp6DkkrYRSkvVEe+Vn0GyueV+I
         ghpL2qw+Zv5vQcQqgMlUvMdtbuB2Q8lA5FSc12oeY7nIoiZqmOGiUaDkxso6Wn/QW8hf
         AGFxOy9shllu+lU5reSOEqngnB/yK3sKWNx61nW0zFCygAvKZfvCy959C5pC/iKWqBAk
         F6S4JP+gF7k2YyTTcdYzPgK3dOdskl8JOxB0HHooxGwAJCRvpaihzy2pKBWOYCRQVdYd
         YCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoFOenZCPLtsTx0WY3hqLyhWDTDSA9RahBhWdHdsejSL0isadNFrEPE1QcT/EuruG0K84MRNHiFUeX0K2Dgujc@lists.infradead.org
X-Gm-Message-State: AOJu0YzQIdLe/QNFm/lHHV4rxmpLIIxae1cHFiXZxY4roEkm+4z1nNQB
	CP9rTBVPVWPZZ0Kaz03LxHnMl0JtlGfA/ywQMAQpeBIM8AXzHV5IzAbu
X-Gm-Gg: ATEYQzxgZ17ccRbT3f4+dDCOzrB0T9J9A/ps1vNOF+tDZHaFCdL7u+Mz6AdeGakwE/m
	Y9z1Djbx/JExAfFG3X5a4UEFPFUW/16nZp9lwu7wS7GES+HJQ81THUdFodgXooM+uuz4G3Whfpj
	7iT8gG72uCpm9df5kead0M1aMXy62C8vfpDQVM1XY08szZfubQax+1JJaZPIlQiLsnOhvfxng/3
	1bJaxVr4je6rLCJ2ZZsGdqEKmIfHFO6SlNXuf9ayINBVdN9OnHV8dsq6yVZdO44IwuZ8sa4kCjE
	i2rwac0SmaCnWeyfTvrEvd+Zvyp65BSlDE7A7lClX2ollAH2mBTVfltR6Qo3Yrmn7TY5MfT1lWs
	35Ab8U357m8QBns0KGtib/S77pRp33984s/6dVrOgkvRWAV76XYUHuMfQUTo5SDmBSgKzuQF5QU
	tx4I+ehpRgfe7C8gQJwnXzEZXcQQJpCX7E6L/JVRdBaYakblMHjYFMkQ==
X-Received: by 2002:a17:903:9ce:b0:2aa:e3c2:f920 with SMTP id d9443c01a7336-2ad74516871mr182432005ad.36.1772060930632;
        Wed, 25 Feb 2026 15:08:50 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2309sm3378285ad.19.2026.02.25.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:08:50 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 3/4] ARM: dts: BCM5301X: AC3100: set WAN MAC from nvram
Date: Wed, 25 Feb 2026 15:08:26 -0800
Message-ID: <20260225230827.21715-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225230827.21715-1-rosenp@gmail.com>
References: <20260225230827.21715-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_150851_478011_4ACC2385 
X-CRM114-Status: UNSURE (   9.77  )
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

The WAN MAC is offset by 1. Set it to avoid having to do so in
userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
index 2cfaaabc7a6a..2d2e7e581291 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm47094-asus-rt-ac3100.dtsi
@@ -18,6 +18,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x00180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -143,6 +147,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.53.0


