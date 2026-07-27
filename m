Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B416CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9SUe3YgVQms8Mfqwt9m0ylQTCLjUd6H2eV8tKFqZQjg=; b=1Ao+KZyVMRD1FcCdKUa9qZT+Nt
	pev+wOIK/caqla+7f2jdkkJISmi+VLM04O7DQ1En6XsTBqziSw+G8ZtQKteb9VJv6FdcdVaUTIawo
	IjPbHvFOJUSGCCVvi/Ja5gRVCxw761NWIwWVIiKphAHT2DN09Rp1HdtPr8CaD7S+WtIyRKg9arnq4
	mFnkORWLB1w6zYMpgF4Cu8vdCiCGenBX1oGATpLwuBr1qcnbp2Bg1me+Z1eC7+j+OI2p896i6kypR
	HpzDu67PsXKBGo+aiIwUqiUs9wnZnkGIKW4ezF3Rs5ylN6SmDdddWj3opwU05h6bpmhXsWl7GAaRB
	1YIK8XmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTde-000000040Xd-1RqI;
	Mon, 27 Jul 2026 22:17:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTdc-000000040Wt-1lz9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:17:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc97653887so38233395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 15:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785190651; x=1785795451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SUe3YgVQms8Mfqwt9m0ylQTCLjUd6H2eV8tKFqZQjg=;
        b=mmKvu0GgiFExqZmBzf5WtJmBj0B1Das883BBNcLNH51FxfGgVhZoBCOv/17f9U0eTA
         87aJpxj5KFovxOApy/yzSGr3GRO5UMv9GfsIsjbkVtcSV5XdHDjJVSBvF9L8NOlwb24T
         F6H4fp1QJOE+IXtbW8WSrX0kAZMkJ+EljaMvNa8Dl5LNI1Ye1u+QrMOsJknPpTCatn/N
         dhEi+p40vxQNws+I/EaI+iUKgDvKWA/gj0nIOmO05laRL42o/HSsw6N41sBWs8O993l3
         uqVP65qY62eswPLozGEmNkPSKXVMyYnNksHXu3VwqV74/bDdwV2VpwDLDl54BD6rU+3y
         nKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785190651; x=1785795451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SUe3YgVQms8Mfqwt9m0ylQTCLjUd6H2eV8tKFqZQjg=;
        b=p3WUJtcCmRIdyCo1SgnGXfQFBoyqpvD1cz36fJagtPmjnm99Fp+AJSmI095PEc/kH/
         HzBtvJ8oeWG1JDRIn/SLUHcdvUv0/hcT78Bt/p9ByvXb1/C3PW958RqAk6StzDg9t6Lu
         j1P9DsmkVv8mHptAz1qskhUt4Va1y/clyanYbg1jNrfFh6WGAzEahmvQCkW+x63yWvcr
         HUOEF9Ow0Y4okQ7SYJFg8P2/0vSR0USQ4EwWH3G5J5B/CeJwHr16kSeSMGEcjIcV3rDR
         Uj0qFPFPWTcPdiOOr8Xs/u34frpfMa/asvrJSQ+S8Q9xTv1tX4lvc2Q93KkNjk1s/JUb
         CSIw==
X-Forwarded-Encrypted: i=1; AHgh+RqZHsHqnH2tx9ZEbVJQCpXRSkXwX65RirBfiwZ9vsri/WE5GubyBgVaB6stKtDxijTZTpkid6/2CdggWXC98CkC@lists.infradead.org
X-Gm-Message-State: AOJu0YwUslHFGAiREE9VymCEAuQmLnr4d+2OZ1wbVu+hAKXZs06rHHio
	SPudIC3SqBV/4qL+WjhGxw6xt2PGEjtOXY3zus7oUMBIptj7CSfIiFmL
X-Gm-Gg: AR+sD11xAqWc/Io//m09oIuioE2Q9JFjqQQJ9IjtYiOqzMeXX/6j+iN/lwIAc9ZR47T
	hWdotZK5v/hNlpUnxlz94eMavwwwvEjH3uEObBMmdaldMNWXmByZBm3tpJ1NRokSbLPJwYad2YY
	PrGxJIWmQ8ya1vAaH5EPsWyu1cyyPvq7LV1vr5PMD2hAcZM5d+Ux1gZbILubjS9RmCaNQpTGv0G
	clKKcWYVhXlPrzf+PRJtbKnJZ80mxhXF1H+0Lz4OBBZFMMgsqSMarUgmzW7w2mRAxUyg2HQxJex
	JJkbDDlwbuCuGZSxj7HkuOkFTMz/Wng//K1z5+L0LN5v/DDCOEnEI0POSqmsISMd9bejfI/a74W
	JUGdX2ukIPJwXfsPwrGK+KFfnQfPfPvcfb1pkXtglTNw702VdyaYAkrKlR3pd/ZhqJOYK0Isp0P
	yEqkJxQic9FwI/qU16xBN6Neo/djvNMW6RdBZA9NgL9d1sz0L9DszlYncZe8LU8hiHEaqgu7cet
	N6i+OKeUZAqPG00EMWEhKHgANyFi5NFv4Kxau4FhDnefwCBaOFoQlA=
X-Received: by 2002:a17:902:da4d:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2cfde8a52a7mr95829175ad.41.1785190651008;
        Mon, 27 Jul 2026 15:17:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2881sm41155645ad.25.2026.07.27.15.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:17:30 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: Add missing phy-mode and fixed-link to DSA switch ports
Date: Mon, 27 Jul 2026 15:17:28 -0700
Message-ID: <20260727221728.40811-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_151732_476241_8D7C4FA8 
X-CRM114-Status: GOOD (  10.65  )
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

Ports 5, 7 and 8 in the BCM5301x SRAB switch node carry an 'ethernet'
property linking them to GMACs, but lack the required 'phy-mode' and
'fixed-link' properties. The DSA port schema (dsa-port.yaml) mandates
that any port with an 'ethernet' property must also have 'phy-mode'
and one of 'fixed-link', 'phy-handle', or 'managed'.

Add phy-mode = "internal" and a fixed-link subnode to ports 5, 7
and 8, matching the properties already present on their respective
GMAC nodes (gmac0, gmac1, gmac2). This resolves dtbs_check schema
validation warnings for all BCM5301x-based board DTBs.

Assisted-by: Opencode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index 27a97c8122de..609f56ab936c 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -439,16 +439,29 @@ port@4 {
 			port@5 {
 				reg = <5>;
 				ethernet = <&gmac0>;
+				phy-mode = "internal";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			port@7 {
 				reg = <7>;
 				ethernet = <&gmac1>;
+				phy-mode = "internal";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			port@8 {
 				reg = <8>;
 				ethernet = <&gmac2>;
+				phy-mode = "internal";
 
 				fixed-link {
 					speed = <1000>;
-- 
2.55.0


