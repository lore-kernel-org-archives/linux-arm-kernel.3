Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3158FC98312
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8VWM3B8ZR2suQS0fAZFWbkbtS6he0VILtB/lGED1UXs=; b=C5EjQLN3XBdlZZ6wKEQGMHGmFv
	Ft6m0EkTjPJBCkOV2fl/lO629jNKuEyniO1cbd1YKmbjRNWAWvSiCUqSNBdyxI01xGJWir+gK1rwt
	0RFUaIEm3KV2L65A9yLIhfogcKPHJaTgDKPlLe1vb8HWk3ZLeLAA1flaYp8+wh9+H/AiBaty/L48e
	H4ngL3CWw0F7ZfdaAOTX6naDaxehrRU2/MGp2Q1Ji5w9O46VwW3rQ9XNCLjS3pLE3EnQQ9g1MAU19
	zS8dXsUVZkMKnRIYkBYGXmW8fs0LY0qq5MwuA7deskHQpUalU/6qmMhNwNZr5qRvP3Jcn9AJjV2vq
	3o9KNmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rti-00000009Ey1-46ke;
	Wed, 23 Sep 2026 18:40:51 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RsC-00000009EjA-2J1v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:39:18 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ec6188so6315805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188755; x=1790793555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VWM3B8ZR2suQS0fAZFWbkbtS6he0VILtB/lGED1UXs=;
        b=GTbvemTiUAlZ5atkzflOIUag7DPtCVI0wl1ZZodcY7SAIqXBae5LxhXZCHtdC1ghKA
         J3u5JlehiMUzEbUlcXy9h3T2HiM6BBMChNqcY+kQm5IGlh96bEb589sbPw1TMnS8swqs
         5r6iOmj8KKm/J6aJS3fZBv+ZGm/i0WcOXxBIhhMOKekYXwNgNrt+rQXhrktqGax3PFbq
         y7ij95ZUk/EfVvtK61Y+YBBaQoPkoPVLtc2i2R7Ql2H5TUvPBWkXyrD6FbTjFb5PoQhQ
         Ym/pdmJf77TKPDlQ5fvLkg7f7eP/tYK8T30/YfrXahktl4usqcXau1/yfAGVmDLHqt0p
         sXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188755; x=1790793555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VWM3B8ZR2suQS0fAZFWbkbtS6he0VILtB/lGED1UXs=;
        b=vKMhV6Sal30qmssQU0nT10A0/iekBBx33N1MkNzy+D2cv7L7mPwG2oTUd94DhXpuyd
         Hu/YUPG+dm8rvRVaFQI40Dls0LctCQZqy9ViJXVKd4cyhJBlTFHZJSQhiCfBvgl08StU
         lJ/cPrATSecuwu1Nyth6skTy70lCHY5QnQ/dHIgce8zG1nnqBncK/SyITjca7tSUFg7Q
         TSgoj4DflPhN71Zt9pJY1iIN5982DNcGFp4NvA4SvoUtpUpHx/vk/1rG8V4GoyEEcc0r
         bkT7nKC6c4LfIfYb9w+T4uFcTq9WaRXt8dl2ScL278zcHkk0VDUIj0JKJ4BDSOIKR6YU
         UU3w==
X-Forwarded-Encrypted: i=1; AKwUvBzOZ/ysHoekal9BmtKV1hdiM+e8Mom2br3pi7cqm0t2nbAWmKZqGmQnyG0TXh7glZG/P4VXzXtgCuOM/8FsqYcJ@lists.infradead.org
X-Gm-Message-State: AFuF++nMUvP2yL14kZil0Q6+s3abmVlr6qRMHtmhGMmdUCkjIKfNnbIq
	JVLv4hiMDzFNl0OtccXpJVxu6Ayh9HDbaaaUE9VI67sku8raDxFpCkpO
X-Gm-Gg: AYBFou13F7Kh2CurP+7AoXk4zfiLTkEpASvK+K184jwD7S+i4QFdEeHrRbNc+o0IvdI
	bHCMRhw7dLnaxmkDxiQUyXJUTWweojj8jM3YRIvN4P1mUTVxtDUuBvMH+83aAND9oduXKE+LNsm
	kOV0U1/AnL9oOaewhphQFjk1DOu0IXpO6+4dvsE8wn7PDYF4biO+YrJduS/eUpBqk1un8/kFs8d
	qFf+CLMYq5ZNX0bWAEB47qiMob+GHrNmTSArOTwVTjtKOYIuogGLhshreaezinEQEWbTcBLRDrq
	W2AqRobk9bm3mIMdWb6W54A3P0YIME48r0eBesj/uLp3kxRcIQesNVHG06wyn+1YcjeDdLrlk6+
	UCXLkXScnJVEWWa0qE1AyoZmxnTLgCkg8DpAqNADzDG5wzRZkYip2hO+bVmnn1HSbvzuScjaJ6M
	JNferVJ+gAxXVdmgo2MpgPH6Imu9U4x6pWQcDkPrAZ7s0SdxuPzvcqAQnhhE0je8Q8KsjPtt0VE
	Tt4cdm3QkTIj6uHsGx/dU65YS9Q8JwYn93ndBUeHh9k8jSHvsvCIwwL3m0NNUvXSUFD6FpjcL96
	8KleykWkzQYsEb5ESz+mrmbPX8KmaFoMeY65qaD0SbtiU3wO
X-Received: by 2002:a17:902:db05:b0:2df:556c:1581 with SMTP id d9443c01a7336-2df7e11a469mr224415ad.31.1790188754814;
        Wed, 23 Sep 2026 11:39:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dc32csm15528625ad.53.2026.09.23.11.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:39:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: alamo: use qca8337 internal PHYs
Date: Wed, 23 Sep 2026 11:39:12 -0700
Message-ID: <20260923183912.13389-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_113916_602041_E2F218D7 
X-CRM114-Status: GOOD (  11.34  )
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

The QCA8337 switch has a managed internal MDIO bus for its built-in
PHYs.  Move the PHY nodes from the external mdio@0 bus into a
subnode of the switch, and mark the connected switch ports with
phy-mode = "internal", so the ports are linked to the correct PHYs.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm958625-meraki-alamo.dtsi  | 100 +++++++++++-------
 1 file changed, 60 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi b/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi
index c54451dde6dd..d0199c07707c 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm958625-meraki-alamo.dtsi
@@ -85,26 +85,6 @@ mdio@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			phy_port6: phy@0 {
-				reg = <0>;
-			};
-
-			phy_port7: phy@1 {
-				reg = <1>;
-			};
-
-			phy_port8: phy@2 {
-				reg = <2>;
-			};
-
-			phy_port9: phy@3 {
-				reg = <3>;
-			};
-
-			phy_port10: phy@4 {
-				reg = <4>;
-			};
-
 			switch@10 {
 				compatible = "qca,qca8337";
 				reg = <0x10>;
@@ -128,60 +108,70 @@ fixed-link {
 					port@1 {
 						reg = <1>;
 						label = "lan8";
+						phy-mode = "internal";
 						phy-handle = <&phy_port6>;
 					};
 
 					port@2 {
 						reg = <2>;
 						label = "lan9";
+						phy-mode = "internal";
 						phy-handle = <&phy_port7>;
 					};
 
 					port@3 {
 						reg = <3>;
 						label = "lan10";
+						phy-mode = "internal";
 						phy-handle = <&phy_port8>;
 					};
 
 					port@4 {
 						reg = <4>;
 						label = "lan11";
+						phy-mode = "internal";
 						phy-handle = <&phy_port9>;
 					};
 
 					port@5 {
 						reg = <5>;
 						label = "lan12";
+						phy-mode = "internal";
 						phy-handle = <&phy_port10>;
 					};
 				};
-			};
-		};
 
-		mdio-mii@2000 {
-			reg = <0x2000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-			phy_port1: phy@0 {
-				reg = <0>;
-			};
+					phy_port6: ethernet-phy@0 {
+						reg = <0>;
+					};
 
-			phy_port2: phy@1 {
-				reg = <1>;
-			};
+					phy_port7: ethernet-phy@1 {
+						reg = <1>;
+					};
 
-			phy_port3: phy@2 {
-				reg = <2>;
-			};
+					phy_port8: ethernet-phy@2 {
+						reg = <2>;
+					};
 
-			phy_port4: phy@3 {
-				reg = <3>;
-			};
+					phy_port9: ethernet-phy@3 {
+						reg = <3>;
+					};
 
-			phy_port5: phy@4 {
-				reg = <4>;
+					phy_port10: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
 			};
+		};
+
+		mdio-mii@2000 {
+			reg = <0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 
 			switch@10 {
 				compatible = "qca,qca8337";
@@ -206,33 +196,63 @@ fixed-link {
 					port@1 {
 						reg = <1>;
 						label = "lan3";
+						phy-mode = "internal";
 						phy-handle = <&phy_port1>;
 					};
 
 					port@2 {
 						reg = <2>;
 						label = "lan4";
+						phy-mode = "internal";
 						phy-handle = <&phy_port2>;
 					};
 
 					port@3 {
 						reg = <3>;
 						label = "lan5";
+						phy-mode = "internal";
 						phy-handle = <&phy_port3>;
 					};
 
 					port@4 {
 						reg = <4>;
 						label = "lan6";
+						phy-mode = "internal";
 						phy-handle = <&phy_port4>;
 					};
 
 					port@5 {
 						reg = <5>;
 						label = "lan7";
+						phy-mode = "internal";
 						phy-handle = <&phy_port5>;
 					};
 				};
+
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					phy_port1: ethernet-phy@0 {
+						reg = <0>;
+					};
+
+					phy_port2: ethernet-phy@1 {
+						reg = <1>;
+					};
+
+					phy_port3: ethernet-phy@2 {
+						reg = <2>;
+					};
+
+					phy_port4: ethernet-phy@3 {
+						reg = <3>;
+					};
+
+					phy_port5: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
 			};
 		};
 	};
-- 
2.55.0


