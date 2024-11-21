Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049E5D75BA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 02:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNks32tb/xOghmG+mNYQSKO0C3AuMd7n2d+nPZVJVl4=; b=HN7sPxBY+kLq+7w+79qox+1QEo
	JTQtxFr7aRMO0ERv+QNTVIFBYCttNCj+N5RqwgHhb1BubDB5ohqNNG/5nWJdHQ9eH3NQpsYaOMclX
	hc2Rag69qCnIYqCPz+D4XTBTx+tz6qx3dvkCA2dYl/vg2xB5GsDs1BPsFQIx8bw2w9uI+0gVPGtmq
	fF6JhV4fMKn/K8EUFAmIbt4wBSPS0PerXmwNdOY/86p1l4opTulhN5p+Giu05YaDtQ7kgdttyr3E1
	7/LZwd4yVeaHOFuj/GaQZMDwOYpFd8PngBoFz2qWcXFsVagFTgsu3tcJm7ldYEIKNKYBbNyFNcdyr
	EquJ3/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxPS-0000000Ge3D-33Va;
	Thu, 21 Nov 2024 02:59:10 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDxKD-0000000GdCK-0AkL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 02:53:46 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e382589e8fdso416755276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 18:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732157624; x=1732762424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNks32tb/xOghmG+mNYQSKO0C3AuMd7n2d+nPZVJVl4=;
        b=e47If3wMa28+h6jafQ/OcfDQEwhJIAKqRuaSpejgO9ZBYF+zvZW9gIV/RVPFSQg7cA
         dSVJ2lrBi2gCdQVBXgw6SRIv3msqSiwZ7sD9wcPkEkVuIpq67ShLajk3qhzPcH9B5Xpu
         5AN2MWCztA23Dly7Pm/d004ixIPcgxvX0QmyRyJfoTuNFDXpitsCbtKFbvPf0Bu0xzQi
         L2yzcvbSboBoMECj8naWflrK3hhUfvaEZQiE837DUHGNJD8oimw7WWeOI7Q/ZRuYVs/B
         8YZMqSgazivfO3oh0XYANZpEY2lpvhUeFdjl32236TyNjnBjh6JNu3GFRZKKD8OlKUna
         NsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732157624; x=1732762424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNks32tb/xOghmG+mNYQSKO0C3AuMd7n2d+nPZVJVl4=;
        b=p+45Bi2kHFA6OA3HqRO6AdMsvu2BG6v3IYiODIIxzV0qcxwei2sJmR34DA5z73r9ZB
         yFZXbxgx8E+SSfMcH6Re1eYyhnYH4VymPMc+wKEC3VY3qAsvzSo8V5xv07eSXC/MVfYS
         /st3zO0UEovFe5nwLkziHgGKnSzO0zgP4dRoJ+TwOXu1I7qwpHozWpLYzEIdU2dX1TUk
         ZlgPPCvfDxVNLwqDKERnkBLZVDrNd4tgU8i0iXTiUGNp/SNOqHtaP537Q/KCJXZ1fX2j
         4F/qczsDeyhjIsCxy0Kj13mUpnV25R5WcEy4RKFpV8/60aXv9pIHNXxp0WMb+j9gGA9c
         QVrw==
X-Forwarded-Encrypted: i=1; AJvYcCV4VULRcM36jEMwHyopG9mx0q9eYYjYILZzXdNMC0rhueS2OJHs+PIj6eMs5iD2L6Gw2sDp+1I6tw8gGYjoexcW@lists.infradead.org
X-Gm-Message-State: AOJu0YwSDcfISbvjc2hrvbCKjfuygPBJzz23AygB4bzn8GM4H8JZkh+1
	esmF3zMZEu+INwQ86f13vwVbOsQHjr+LHLDiRw0jOyBElfpAqJBd
X-Google-Smtp-Source: AGHT+IFMgccuI6rNZuzdmJfzJU0QMp14kZJiCMh2XqmUc3OoqgAkCbJZmDufzaxQBAaiW1nvsjTGRw==
X-Received: by 2002:a05:6902:2487:b0:e38:7d0d:d7df with SMTP id 3f1490d57ef6-e38cb7173ebmr4643665276.50.1732157623896;
        Wed, 20 Nov 2024 18:53:43 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e309-7a4e-e779-1177-8427-3602.emome-ip6.hinet.net. [2001:b400:e309:7a4e:e779:1177:8427:3602])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64f5514sm285513a12.34.2024.11.20.18.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:53:43 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] ARM: dts: aspeed: Harma: fan board io-expander
Date: Thu, 21 Nov 2024 10:53:22 +0800
Message-Id: <20241121025323.1403409-6-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
References: <20241121025323.1403409-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_185345_076529_9B05EB22 
X-CRM114-Status: UNSURE (   9.88  )
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

Add fan board gpio io-expander to check fan board status.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 9d7e7208562b..58eba5fb6262 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -218,6 +218,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <116 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb1-activate",
+		"","";
+	};
 };
 
 &i2c1 {
@@ -273,6 +292,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <114 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb0-activate",
+		"","";
+	};
 };
 
 &i2c3 {
-- 
2.25.1


