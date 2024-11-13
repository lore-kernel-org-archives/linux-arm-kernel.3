Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9DAD41C22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pePq91fMf5htVRE/fsTzHK2L3qy0wyzwWaV988CadX0=; b=hpjJr+hZNWuKLFY4pA6SSBxKOf
	+c21IbMNG8RKwCZLqO8kWOc33gYyZK3OSl131BmWetsTIQOLi7yx2QFaphUKva5myKEw6HwtGakic
	vCZprEKowul09dAKivA9uC8F0sWx3IZVjwGagxpx64UdEkk9bhaj2c1hFjJdDWDMjeln6s2krXFlE
	BAfFhm46UWhrALNChCfYha0YhY3OGj+yxXWOg3mVhq1f7qLnTJgPmmNM+iwjJTFkwewoavhIJYbqd
	+YUAdoL0cesRNswlPtqWT8VBqYoqgcGIza5ZAjmS4PWkAVayv7c5cVArpOjjcVr3SqhKwI2aRDhd2
	5sQ423jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Yz-00000006E1x-0Z3k;
	Wed, 13 Nov 2024 09:21:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Th-00000006DHQ-3ga1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 09:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731489357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pePq91fMf5htVRE/fsTzHK2L3qy0wyzwWaV988CadX0=;
	b=YScggIdPaXDizXiI/L3Ic1xPJkRmMuhUdK4ebtfA7tgCwds60mdw5V8KjJm+ybZp64k3S0
	jZlXI71OKkN7FXBIbKMbYTh7G4YkHRjefrX6cUGjDN5plLZMpDTkw8lgRdcou7bvTOZqRZ
	jak5IfxCLGl9Vm+VIwq+56D1jHuVIDQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-X8Xr4SyQNj-tBssZVyQlUA-1; Wed, 13 Nov 2024 04:15:55 -0500
X-MC-Unique: X8Xr4SyQNj-tBssZVyQlUA-1
X-Mimecast-MFC-AGG-ID: X8Xr4SyQNj-tBssZVyQlUA
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso12326926d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 01:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731489355; x=1732094155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pePq91fMf5htVRE/fsTzHK2L3qy0wyzwWaV988CadX0=;
        b=s+tp107O3+xmiwfd2mTdcUwNnRQD24M/DTQ3Joyy7gx+C4rqw3tm8hMY40sbP3y0n9
         usdxTEUoY6mRlhyTd30z+uxSWRVLJL9+rPAZEMV6dLbrYKUZaFA3xnmUN6o5ypGcZTG1
         Ulz8axK8f1rA+O+qw2VBTnd5LpIn+PWyEXl6srQ9iH7tkSHMA/576T87Ei6+gMjzdBwC
         p4q5UZN1sjtbIbMnJyoQ+iz5LM3GjbTK0f1Yvihw0cj6ezKRKNW+cLdchoGO2tl5JquF
         lrIGGdMvoMceiMAkBi/dZ3f4/SFBeyYQEv/u5Yi8PAvFADyT6Pft3y1trFWfTdVggcMi
         3vpA==
X-Gm-Message-State: AOJu0YyVsxoP1eGekJGtoJeGsRaJNR2l4FB8K9e4CsC4GDtSTvv+0/2e
	BLiKiC/H/Cojlgfhovrkozv9yRrVPND6Q/V82JbkBMqoLOyyf0M+1sQW3T9JlNujM2URtR/jekE
	ULYk9QvhPUqZH4KkAvKfuVKbxTZP1qZ/8WU2Mk1yHGQUPFNL71t1AWxtdufHlhkIaIzHROhUi
X-Received: by 2002:a05:6214:1bca:b0:6cc:1827:5750 with SMTP id 6a1803df08f44-6d39e117943mr116376506d6.6.1731489355100;
        Wed, 13 Nov 2024 01:15:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXkduxutfFmovavdzvpkZColmr0+85g14otssbj3k1m3rxX8IZRUy9FgLZXbOcskqZ5EdCIg==
X-Received: by 2002:a05:6214:1bca:b0:6cc:1827:5750 with SMTP id 6a1803df08f44-6d39e117943mr116376266d6.6.1731489354775;
        Wed, 13 Nov 2024 01:15:54 -0800 (PST)
Received: from [192.168.1.51] (207.red-83-46-1.dynamicip.rima-tde.net. [83.46.1.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396630ec5sm81599036d6.101.2024.11.13.01.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 01:15:54 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 13 Nov 2024 10:15:17 +0100
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-am69-sk: Mark tps659413
 regulators as bootph-all
MIME-Version: 1.0
Message-Id: <20241113-b4-j784s4-tps6594-bootph-v4-2-102ddaa1bdc6@redhat.com>
References: <20241113-b4-j784s4-tps6594-bootph-v4-0-102ddaa1bdc6@redhat.com>
In-Reply-To: <20241113-b4-j784s4-tps6594-bootph-v4-0-102ddaa1bdc6@redhat.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andrew Halaney <ajhalaney@gmail.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Enric Balletbo i Serra <eballetb@redhat.com>, Udit Kumar <u-kumar1@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731489348; l=2349;
 i=eballetb@redhat.com; s=20241113; h=from:subject:message-id;
 bh=BCtRel6q2GhIghcOmJUAkR2/nR6+u2ZqHw8UA5ZGnE4=;
 b=WxCC1gigyKvqi4EPSikNJ0eWI6e3xd+/wYjiBy6LpTVreKIzonG/vp/Lk08HG1tb8vu8O+M7y
 OFvp/8EKH4zCiXg9c1IMAawbuqbHWG+lvLxJAtQfZdOaXd4h0sOZ78e
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=xAM6APjLnjm98JkE7JdP1GytrxFUrcDLr+fvzW1Dlyw=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hgZsIuoCWGUSrUmDv6jyiTJUbdJTeGoDMDQhXXyM430_1731489355
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_011558_029683_6A0F0360 
X-CRM114-Status: GOOD (  11.58  )
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

From: Andrew Halaney <ahalaney@redhat.com>

In order for the MCU domain to access this PMIC, a regulator
needs to be marked appropriately otherwise it is not seen by SPL and
therefore not configured.

This is necessary if the MCU domain is to program the TPS6594 MCU ESM
state machine, which is required to wire up the watchdog in a manner
that will reset the board.

Tested-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index 1e36965a14032ca07143230855e04b9549f1d0d1..5f24a1608bdc4fef0610e2ba9a210264e3c4917e 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -755,6 +755,7 @@ bucka12: buck12 {
 				regulator-max-microvolt = <1100000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			bucka3: buck3 {
@@ -763,6 +764,7 @@ bucka3: buck3 {
 				regulator-max-microvolt = <850000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			bucka4: buck4 {
@@ -771,6 +773,7 @@ bucka4: buck4 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			bucka5: buck5 {
@@ -779,6 +782,7 @@ bucka5: buck5 {
 				regulator-max-microvolt = <850000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa1: ldo1 {
@@ -787,6 +791,7 @@ ldoa1: ldo1 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa2: ldo2 {
@@ -795,6 +800,7 @@ ldoa2: ldo2 {
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa3: ldo3 {
@@ -803,6 +809,7 @@ ldoa3: ldo3 {
 				regulator-max-microvolt = <800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa4: ldo4 {
@@ -811,6 +818,7 @@ ldoa4: ldo4 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 		};
 	};

-- 
2.47.0


