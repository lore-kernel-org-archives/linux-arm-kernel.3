Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F46C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxcMHEKMN0k1o6vOkcWOO4z96etmbwK9XpxIauqtEzg=; b=fIDaNeol/SpNcWAZ74YIx2Yvx8
	NQLm+7sm+UXXKnJ5oPf3GB4f0Kxq4wko6LJwIHx3AuLxIdVUwM4tnVZhXgJgdEv7R2YpeGQ03Axyv
	fLvrCOUUYYXfmY9sRkjeZaU7Cvq89WoObixvIYej9j6LFP1Y8Q/KFVw9r/WnGaBjQUadcJQuMa+3S
	7nIe+aMtJcVDzgDuhtnuzSRjbhk4geMPnkTG3BWapuRDq0hGUKdzKZR/bjsEpMLffD6YUtCmFMW3/
	ZUJ2EJaAGXkJWHWEwH/gWUtFe4tWME0eZsgzf8pq08zKEHXdavA1QqyRLUTfgEwUJFARfurVH3+AF
	+oCaHF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRui-00000009LbV-0xqj;
	Wed, 12 Mar 2025 19:38:48 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRt2-00000009LPz-1xNf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 19:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741808199; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bZTM+TpNLvX2TTB1x5D6nVm6z3UwFgMWiNrpQs3N9yxuoKqt+C2OsafUxoMUxcNvv+
    6S7vy+rlJ4cLs9mgc9X2cKmG4MFPLfnemMypjdrmy1zzV0dtVo1KS0ggGdswLcV4dZjm
    Pm/34Xw5+//hUhdMINtRAkHLoRcN6YS2mWbIxUo7IP3wnTYVYhAG1//WC5jFDGej76Ea
    rE0Ti/CQDgYtgMDE5YOq/C9DPvBHfVrZEBG5nW65zRiNE7Qd5W7ioQQYBWFHU7ryqaPl
    WhtGczY05021riCyXNXTJrlzEGb9x3bVGUl4XrwBQnb3yAh4zQF3LdG1CMMcUDtCVZga
    h28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1741808199;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lxcMHEKMN0k1o6vOkcWOO4z96etmbwK9XpxIauqtEzg=;
    b=P1GfOOwvi1B3JVUQyFFdHAYDNy9n41E4PEttx23NEaO9+OU3aA0HO+GrIxi9IF9cDP
    OVkvp8Y59XpGnDMvgVEgdNtWeDIsO5rhQ+XuhG77rM5PQOcmJJS8OLFKVCbAU8eHdOkO
    RaSASdQAyj2YcqwKb402KS3agLPFlgrO405H4Q59pZI6kwwUo4h42AsoewzIeKnXonLv
    Cj8xCAXiCPsjJP12JdrHbyy3eRjBZRo2m/2dfnlDIxtr9eSyQWGWezGPMCvm1DcQF8wt
    wskJYhnn2psGKiDRye0oCg/MqdmsGhaW+BU0NnTeWwMuJkK17EoXNlN84IPduhdOi/I0
    1C4g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1741808199;
    s=strato-dkim-0002; d=fossekall.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lxcMHEKMN0k1o6vOkcWOO4z96etmbwK9XpxIauqtEzg=;
    b=gt7FamQ25ZzxZ9sFrcg90bxaAuhAk3yFKTmHvQpXB7PGw0AWpXTRaG+VsrWAqE4N8T
    IiXeuHlnfLQ0pIakXdNHDK/Wlv3NNFhUlL07lSENxJFHEa16TTTIy7g4RYF55gAwOXyL
    Wmkt0I0aWVFw7TuQP9wkE9w6oNSswAwRrufUefDM3RRA2c1oDP3nOotH0j+nYHNMhHGq
    qFoXTJ/+gCMvpu5xoWqc76bEaNVryl0G8XX+X6y3zAzPmbTaUPCFj3TEEt/hlj2dUYqR
    x3UXFdl2AhKHz96xTvLqhDPHrx8xQwUTBC0zy+hHkF9Ol4NFCKKgQi4tsWf3SXxq9HtN
    Pmgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1741808199;
    s=strato-dkim-0003; d=fossekall.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=lxcMHEKMN0k1o6vOkcWOO4z96etmbwK9XpxIauqtEzg=;
    b=QXCgkYUdfs/CwX/mn9IEzU6DJkDIHTl1S+jLKvYoa9PAtq9eHaOt99/9NnnAVjfTVR
    P1TuhcYisDn2Thgo0WAQ==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b3512CJackg5
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 12 Mar 2025 20:36:38 +0100 (CET)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with smtp (Exim 4.96)
	(envelope-from <michael@a98shuttle.de>)
	id 1tsRsb-00058E-1Q;
	Wed, 12 Mar 2025 20:36:37 +0100
Received: (nullmailer pid 85457 invoked by uid 502);
	Wed, 12 Mar 2025 19:36:37 -0000
From: Michael Klein <michael@fossekall.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: bananapi: add support for PHY LEDs
Date: Wed, 12 Mar 2025 20:36:28 +0100
Message-Id: <20250312193629.85417-2-michael@fossekall.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312193629.85417-1-michael@fossekall.de>
References: <20250312193629.85417-1-michael@fossekall.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_123704_642720_0B71D90D 
X-CRM114-Status: GOOD (  12.75  )
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

The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
Add the corresponding nodes to the device tree.

Signed-off-by: Michael Klein <michael@fossekall.de>
---
 .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
index 46ecf9db2324..4976453ed192 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
@@ -48,6 +48,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "LeMaker Banana Pi";
@@ -169,6 +170,32 @@ &ir0 {
 &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				default-state = "keep";
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				default-state = "keep";
+				linux,default-trigger = "netdev";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+				default-state = "keep";
+				linux,default-trigger = "netdev";
+			};
+		};
 	};
 };
 
-- 
2.39.5


