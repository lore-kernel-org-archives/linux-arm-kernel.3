Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC00C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBuJnAWVhO28mlOCOrO1xk7g+eWQaeRbOJaWHDeNHoM=; b=kjFqz2E4OaW2dQSMDMIbiEOxYI
	pHtV07Oq/MYty6Y13PlyGJ4e479swdZAYBT0xnpAoAe0QDzr1fC/67ZeLzTG3koE4dn+or5zc10ld
	vVgbGq7+PA1USVjumBg4/bKDlqhfUUxcvFJAJwkB+qmX2MPR2pq2VLMWySheGwIvD7aH6+gSx+iu4
	Pz+YZh0r2K7xjhVyGYZk2gjqv6+WBHng7Im8XNajOuE22BrjI7ifsq+wfvWBZDRm91XNxuXxZQNpy
	Lyn1OR35Pw0fKrjo+JIv50uV6gDXnFhpspc44ZQcLjOmDl7JCxieN0kTMzHDVNe4GQMbbDMZBfXhB
	Ps/ca9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5uz-00000000rl0-1leS;
	Thu, 20 Feb 2025 12:44:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5Zb-00000000lbK-1lvh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:22:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220f4dd756eso15071505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054154; x=1740658954; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBuJnAWVhO28mlOCOrO1xk7g+eWQaeRbOJaWHDeNHoM=;
        b=JFfedBYYaVrow2iY/HmM5LH/gWB1WDVhJv6CwX4m1AfnqxevM1In1guInR4CziaOMG
         HlrJarHjEX9MRJHY4/COkCMvmZp54h+gE6lYaj4T3F+GPU+jouV3x1kLGTQkNIussx4W
         vnCykT9nCmp8JYLq/A0xsSFkchAH14OZ/Gnlbr3LGDncZYLAhg5RFZQELFS/Wrqq0mwO
         W7L7YPJtv0IfufdNavvR1VJ5sultcSN2UKAWQUm+HQahFH0aRbrPCiRoM4AxNKptEgLw
         8Ev+5G8DetA9Nb7yTKXkDJoWHEekh6qhUjt2hN5yKLZp0DVgUAFoiZi4eHWlE87nj/IB
         8RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054154; x=1740658954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBuJnAWVhO28mlOCOrO1xk7g+eWQaeRbOJaWHDeNHoM=;
        b=twJ9xMEMjDP9KuFhp3l12WDO1KVYjWv1jDVAqa+aQV/6OnDy7bFbhN92/+Wx4uo/mz
         vzCZHLsrOjjnwdssH9F29PHoqpp1WKyhz5ktOnve4z+NiNZ5J/d17bbdQqT6Ou6TtIF4
         h2tbvFdPXtKrlbGYJEClMmdQJuURhT2E73/wD3dlh+jhKTpOVjbxDblWOUSYyaGCjb+I
         H8dYWMeb4MTJvbmUxgh4QJZUzZm2ztgKlR6qOHtXnSysaUBtDiizanZJpLmbREbMrU5l
         P56UeP1FaA9cCw06fhrLXEgHawQ60Au722x8EgRz/3uMIENwgCxR6mK+JK0tQPmRsEzW
         em9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVia8W2nHbDf3WB27FkI4LWRxnW3FoqoRiZxMr9oanDv57DyB/sDiWBoKP5vNyiw6ZLypZXNWzcAvKHu4lAUMll@lists.infradead.org
X-Gm-Message-State: AOJu0YwCBA5+Tc/UL5DgOi9iIrAOT+vHhGi+oxIFnXOoDouEOHmM65yb
	nTCNDLj7QkUIL9PgJ7M2Xv425B6LxSPXcObmX1mKzsN3WnaZ0IIb
X-Gm-Gg: ASbGncubT9nXDECbOFx4Pli+gUTTQWT8Lebueamj/5ShR/iRBnAODq6fdKkn4BCluBo
	yGfUQYM8/VTXJfZQmVhrvkFSfUyFTqAJnq4Kh0XDnrzbbvGnWAyZMYqRntMl0ZKKwPIkddfIs81
	OIOs08ZdVr82B8NrvrGQ4t93+jAdHfNFguogeAfrRAmXROlJbcF/lk4MW5DkvZ2/fV4y6OCgTkF
	w+xuoNbmCNqiNre5pqFSTtNjQi4CCinUUAeXKRUw/cVE+RwJ5MOuJfflzvY40by8JySRCN+1ekE
	xiMLtTiklekLSqm8Bw==
X-Google-Smtp-Source: AGHT+IH65NfsjOzwTpqmb7nGlYrkljWx2zuSmpAI4ns0SFN1VCagsWWVvimBp2kuvzzwPZxNgSongA==
X-Received: by 2002:a05:6a00:3e0c:b0:730:75b1:7218 with SMTP id d2e1a72fcca58-732618c1ec6mr35494739b3a.16.1740054154443;
        Thu, 20 Feb 2025 04:22:34 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:44 +0800
Subject: [PATCH 3/9] arm64: dts: apple: t7001: Add CPU caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-3-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3dP0oDAIN/InBoJgIEEqaYRol8BwNynu3ip0BA5Xbxw=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+6R8kl4XjwXno6F3R1YST47PDcS75fBq9D
 rJWwg4NDTyJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JH6bD/4+Uuk91oX9dOv7aKSCauwvonXydDd98FtccI7OIe68dRR3+FUfJTG8uyXR+pYU/mNKFzR
 ZZUoH0VGqFto509TYITNK/SpkOdFyiXL6HeAwk7qJOfsPMRc3sigral9s7lvLIbUdtUiz6HnDCf
 fBBBbikZwjRa+DD+uJaQlRC1w1anizTEWrGL6t64YZfOSj2AbeJL7Zstv6NQPVhGPkcYfTZdtwL
 81ZYUXPCHpSPuqWPS4QOYAsJUQU42XHCq/bti9nI3Tck9VSZ1nKy+re7Qn6os6ONPaZB78/FNHS
 5e3wazbFon98qhpKB9zaR386r5uHoVcCidjHi2FW3s/zL/3XFOifV7QNwf0EpJRJFGrh7unBGsY
 21iPBE1hav7RAnWirgmnQJELJ2Wb0M54976wFqtSC/DLGK8+v4Ly//P7s2z8tWESSKshNVpqNzi
 l6V1S2D3hp5E6xIh9l9Z3YuOPdqotRyTUZmjoAnJpl4zG97rdRDqpynbdwTyGmNncZGeo4ipggQ
 COriGrhTb6WgOIDPzd2Uu+uesy0JCbkMnrTyc8npg7Xo86G/lCxfhS/8BT03so0KmwrYgr4OcSW
 sKQGasFL7wwrZv3Ru2IDH9jP+tpRlD1CVdwZLJWbPXioIlq2obTiTytTwZ+4bG9TdjEYKMzoCva
 HsyzDzgsE+iB+/Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042235_464663_8603FDE7 
X-CRM114-Status: UNSURE (   9.57  )
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

Add information about CPU caches in Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..a2efa81305df47bdfea6bc2a4d6749719a6ee619 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -39,6 +39,9 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -49,6 +52,9 @@ cpu1: cpu@1 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu2: cpu@2 {
@@ -59,6 +65,16 @@ cpu2: cpu@2 {
 			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x200000>;
 		};
 	};
 

-- 
2.48.1


