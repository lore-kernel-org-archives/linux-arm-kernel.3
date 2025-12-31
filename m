Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20445EE57C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H6KXg9o2QtM55dEd8AiNf+pVaQWGHEPICjIkw8m5C0=; b=V5RXREn+z2rlB6OiU005kM/2yC
	BWzzinwsr9+poRF7oYGKNSaIys7J1OqhPMTcUfOoGbzu2hs/ivWZ/XTxIeH4xtCRmtmFq6j6F5K7D
	Jb25myYEwBNFZmoallFYiNRBDx1cPhTCVXurHKLmhjF96jq+VmgcrNHqxVtq9vHWcfGa/dodknF7o
	ioZk1HVuzyEoKRAnXX1p0/qn3U6+YnRRVZ7cQ+ehYblYNez4uD+DtX1XI2cmY+xrrFZzWBB9r0ri5
	GXMTyDSJsXZSc8o63D2nmqRSlzzeXBG3Ex/ubwx050kE1u/tNhdGvwj3jlNVVt6CsUPJrsOtfkLE0
	m/fnFs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamNH-00000005bUW-01Bt;
	Wed, 31 Dec 2025 02:55:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN9-00000005bQ3-2AnB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:55:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0ac29fca1so88758115ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767149739; x=1767754539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5H6KXg9o2QtM55dEd8AiNf+pVaQWGHEPICjIkw8m5C0=;
        b=fvB3nsPkuFBpvPHFt0kfoukvxWFheBpD1SR2WzfD0MgzRMSeO6ir2u5hlI44Qg6iFW
         B1QcNw9Yi7P30lSqB7eQB9tKvIDxg9tY/MUa17UA+o9pkUjA821GlsNTPTuZ5qEXRuN4
         tbNoYCUeg4EY5cIdpJolesQfYi4qcxemLYPyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149739; x=1767754539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5H6KXg9o2QtM55dEd8AiNf+pVaQWGHEPICjIkw8m5C0=;
        b=faoxy8nIuuu96uuzzq8SZ7KLtarI6aBStN9P6CIc0Qz5WLAepPTTaXUFCulAYpYVPI
         MRL2wMHK7GgidgMmQQT+Zw7eSXeGfTsAAIRc704T/tGiLPzWh8dCmbRZZoTb9Un/2+mZ
         s2uk+i1G4qdw0gFMvTjua6/qcOWCx9oveUxuS0JGcuVgu1tHHbc3RKkz8xE3KG9FJrCf
         tJEg+ySuTjPVYdJqvEtVSNOr+3YyblzMf74YKCQpHZo2XWrgZsDKpCwL1wn5v575CWlc
         YhSlql9TMUIm7VAS+hmxwPdRmvQNRtvQP2pizx9KMUdR+hMEPD0rThfWxZrjm8O8oJL6
         7RdA==
X-Forwarded-Encrypted: i=1; AJvYcCVp7rhf1eIP0dFD1+vR/EkOqFW9Dt9tzBQ7Ho6EXY6uaHImkFbj5u32yBqrJx6phrqF3taad21yU6V4FjJDBCOR@lists.infradead.org
X-Gm-Message-State: AOJu0YwZDUOQJsRMNrlyBQpz2d8qXQWar2sDvi88HkyuJoMcUY71QS28
	z8er9P5r72RZqLTzBY0isr64S1YQEu29VGXldbY65rrNXErsgfZjfuIMxpTYXoiitR8=
X-Gm-Gg: AY/fxX4rKeiN0YE2l9bbaB0SgItZJC3Q9jE1KbW8hbO8YkRA+trp3qXS/ihGDyc9X2b
	QjVF4ka5wKAaQdyZOIqachcpHl0DqyI2+1SHDbj+qzfg1ubX/FuVhlYd/G7rQLAltioApm7Hw+D
	zg3CrIj8DFgDUNfnN3Ag+k8qBLYcX8QuLLcuGq73B+BE1Nhun3HGbRVfC2AARaWicxrYMvU3liv
	ULrI8MGrg+X1/OItGzaRcmy3qCsndofbbgBg/iAM7lJ8KHnQHl2/Y9RoSCXcqgz/MkTF88Nql6t
	jwbiuX4iNgNupRErIHvC/ovl9Pv+srlrjT6OxrKhXV0ctzV2Ff3hglnusGaizIr9NLwko4NE3ih
	bSBz4vg14l5G7Qdje54OqIpiyDXMIuLqSEI5rc+E64mIaLA46E0L1gTvf3I0jJREPW5hthRZdjp
	xOWcVLrnpWASNjJJ88lDpJTeIacAc7vQDilCAOXHYevPHt4MGstX4a
X-Google-Smtp-Source: AGHT+IGNZWmQD+37d10BuOX8nsQ+wmTlSI5nVUSJjKMPtoRhSKCQeiaZCOWCDQHE5uljxYAncU1GZA==
X-Received: by 2002:a17:902:f60e:b0:2a0:9028:11af with SMTP id d9443c01a7336-2a2f2a41622mr349634425ad.59.1767149738625;
        Tue, 30 Dec 2025 18:55:38 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm307762945ad.76.2025.12.30.18.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:55:38 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 4/5] arm: dts: mstar: v7: Move the reboot node
Date: Wed, 31 Dec 2025 11:55:01 +0900
Message-ID: <20251231025502.1139168-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251231025502.1139168-1-daniel@0x0f.com>
References: <20251231025502.1139168-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185539_569476_1658B4D4 
X-CRM114-Status: GOOD (  12.14  )
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

The reboot node is currently inside of soc and that makes
the dt validation stuff complain that it wants some properties
that don't exist for reboot which is just some glue and not
a real device.

Move the node out of soc to fix the warnings.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/sigmastar/mstar-v7.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi b/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
index 3eeafd8c7121..db661e189eec 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-v7.dtsi
@@ -73,6 +73,13 @@ xtal_div2: xtal_div2 {
 		};
 	};
 
+	reboot {
+		compatible = "syscon-reboot";
+		regmap = <&pmsleep>;
+		offset = <0xb8>;
+		mask = <0x79>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -105,13 +112,6 @@ pmsleep: syscon@1c00 {
 				reg = <0x1c00 0x100>;
 			};
 
-			reboot {
-				compatible = "syscon-reboot";
-				regmap = <&pmsleep>;
-				offset = <0xb8>;
-				mask = <0x79>;
-			};
-
 			rtc@2400 {
 				compatible = "mstar,msc313-rtc";
 				reg = <0x2400 0x40>;
-- 
2.51.0


