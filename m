Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE07C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=; b=h4htj5zaZmJJBLWSiU9NP2pumo
	hIw+w2AOF5rWaHlxsQ53IakdMHVD1YyE5p3DLYRksJ5TwQu0khmy3oE9dxSnz4xbJnOAmiAoLtLbo
	bq+200RDxGPtbDjsfp3NLmz7QEvRQc2m7We8yvp+ntFvYIPAYCkjLnX3dfd99y4nIZXca/mlgDIjb
	pg/8tBuQ5M1F+0Gwp9rT3+suFBF1t51T8iUkDAEQKYQI4xZY803iGO5G3PiFrO341pQYktrBrAu3x
	frPzuSjeR7LfmMUefZQ4SMfWTNUi3CIdjNrLQ2JNmuH/ESehoeigz2BlqKfXWE4jzG+BkEIMDWqUy
	amPzr8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdk-0000000B2jE-3CZZ;
	Tue, 14 Jul 2026 06:29:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdh-0000000B2gQ-2ags
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:29:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ceae1ed204so7010085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010549; x=1784615349; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=noKkbMDXUJconwUuzBXu/kGIy404r1M522+VpxINVYjCscevA+JJbyQw2Nl4oXrKqn
         5W/Aackcn1Ol4tItiyyDprexyf2oFmPaPYXigQtAgb8dtIG3tbCKz5oayPY3CyUvw7uL
         N0JvVA/qGXp61r5GOJRMWJco91Pq+bE234oMv6ADnB+7bWmPN1phtX+55Nz7sslBJA6T
         A+iq2l35QjteQCvfdP86Dza7n9PH4y4A04a/6nThHIHnl44s0DzbeSo9VH164qrHRQwS
         S4wmVsd6baCFlP9935h/o5dtbYh6iRznCJgqasdqSlMhy7q0CfkVDYtm6uVVPeWK9DZV
         U7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010549; x=1784615349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=izuzIYftnRIhH6+ao4xLehSkZ5sBs0VJevesVSJDr1Clje+bXCP9uyzLkuvJNoYhY3
         tjvtpi76p5tHswCoUt3n0qnkHAkZxz7sWjAktjgowJFKANN29ICNIXry4GMJ8KTMHXxn
         2JNSvfxzdzF+yOrpiNd2+RyfXbuXF+qobuS2Im9+OBALaPm7BiZ2qdzoddO6hU4je09Y
         BvnLOZNRdYz8p2LRjxu1rAcpRCug5hlkQYpJwe9yBKcq3BGtZj481Cg8D/7xVniGsg+K
         uD0I/UyZY1AaGYUt3/HEus4uD1ZT5SlHKG0AVWt+FtwDocdCnswX7RuWP9oViV/AkwrL
         7reg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9ge65ZiEc3yZicKgnV3H0o8Oyhq7EZ8f66JuOfi0jLBJ71ofqqC/0/lsr4M9neQf14rWKuRPeO0vxs8O4q4yV@lists.infradead.org
X-Gm-Message-State: AOJu0YwfwigJRsTLy+Iy/qHC38DoM2jQK+xhbiDjZc/lu5Mrxpd/+8uA
	7RSTvnw1GtLXios4PjV0WOOGY7WWxQzymwPFkYlBhpRn7tM2tpSo88si
X-Gm-Gg: AfdE7cl9dJ9GXJ9J2KfYpKRLOwT6abzwgg+8rgq5lnc5AoYCD3aQg9Qcv53ifXwZ2hk
	LfjRaSJ1D8pI+19Q1xebrMViE2BN7RSkI3rfAhEklvRtU0AHVu3WNErXJbLh3vIl9vgfOcBH1oe
	XWfgJemJjYL/v/jxmNmY6jh+wz7ue/mjE0/2B2hNsyusDr1HayzaJBwodEG3NY/wr7cIMxlltQ9
	XN+JE/3a0Y/T8GDdSV49qKgZNJHoyiIhllcyjhZPlq420ONX+nWY15U+aYtVDenXKr7XoYqWhik
	ydNzcPT4dCgEhqs0UBXrN9mqHW6oJW13TZ7pJSx9ZSf7mTbDUQBKfrL/LZjp8r1AKZU9NcAXCCH
	/XiwHfQpYwA73nFz70WXcZWmKVJp2lLlrYAaNv50gp6L46TAdWQ0I5FtjFdPfbiOKpONgG4o0Bo
	9bByiDiKo0zwgHu211vkbK3c2e7m5dFJtVpGFJaDdIDLM9pyagvr8W/vjCgblPPuGsqowLcOwJJ
	b+WUJK/ODAk3KzfAeI3pCQlmKI7ln2RsVoOkXtNnp7B3iZ7atfj68YoTuURawK7
X-Received: by 2002:a17:902:e743:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2ce9e99c383mr117865695ad.14.1784010548658;
        Mon, 13 Jul 2026 23:29:08 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:18 +1000
Subject: [PATCH v2 11/12] arm64: dts: apple: t8112: jxxx: Add
 device-specific SMC hwmon sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-11-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xkjXfecdvyid23BZS7LGF3Wp2uLg6W7yj79/efnf
 FFxrUBQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKojvBn+5+QzTDB5PLFblzHyzVrh59q/RKIE3yXJHZSu2rJo/xXfHIb/HuX75cx
 32d/lnrpzX/9Sp2Nul9Y98z9zJMohefu261c38AMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232909_661409_C3D2CD6A 
X-CRM114-Status: GOOD (  10.08  )
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

Add the device-specific hwmon sensors for select T8112-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 1a08a41f369b..7ccfceb08093 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index e37c56d9fb4d..fdc3409d2e07 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 438f972546b8..105a9d118980 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -84,3 +84,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Back-right";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index ec116da3e4dd..7cea5c594810 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -146,3 +146,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"

-- 
2.55.0


