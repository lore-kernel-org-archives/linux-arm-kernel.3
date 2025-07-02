Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D07C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIMFKP9o9HCYgCUtge56j7nt4ExnHtWvQ7QUrOurhM8=; b=kOV2Xv9MW01UuZlBdyGj7Pp72K
	nvfCMDdGTcvyuGqtlhW7sUQTQFysmYHcqVu6KAlTeTxQ2cNBlmtDJJm0S33Fk4PTQm7U5tXZFTnjd
	fa0gYCQvtafx6tOsIIVAUXNVGG4eSnycCbp9N3xbvDFpHLlygnu5+V+md5n4wZ20Ma+MY1g0WngIu
	+/mjwZNe56aGPzksbyPDLOLjUFxg2dtQFOrU1unr7KCPpExE1yB1q/No4V/gbi4oOtoVcOqdIJBVi
	L8rqxbXpBeOt7V5O70WtwUnpPv18DjI979S9iuKB3FD9w1AMP1LEzrO1yLPOv/a5aJAH/VrQCHR05
	Yyb1lmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppW-00000007GGE-1vJo;
	Wed, 02 Jul 2025 05:16:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpe4-00000007ESR-375U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:04:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234d3261631so46183105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432672; x=1752037472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIMFKP9o9HCYgCUtge56j7nt4ExnHtWvQ7QUrOurhM8=;
        b=XR7KXqLyPXYiCFSwOwaf/67rWhhqmwMMl9UkmqOBESOZYGI6XZVAAXJvQiFNpjlGxg
         R/krQ9ZH3lzegKlSXK8ixW336Bqtr1W0OQNHxaG/XlrOwTpSHnW3tll+0snxdHDpc+3t
         wqi4Ptkgn4/WhXjzLMHYE9Ib3QhSW/83QIm2mXf14a5sMBAvwSWEuUU3sMHg58ATffaH
         TdV1wfb0F+aVni9P3ZPqjHaW+L8M87qM5pNgyL8IU2kb0avXkvuHjf7htiXHWu7PTf7R
         jYqeO3kHjG1f/n6uSN0H2aoPECXy9s4ia1adgPW/1Dv20POKOYE6GQUhUXjpGDkYmJns
         QZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432672; x=1752037472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIMFKP9o9HCYgCUtge56j7nt4ExnHtWvQ7QUrOurhM8=;
        b=RIRi3BWiX+rYZanK52Gu78/fuDHc1JUUo7xSm6F1XfWz/xJpRe6PQQ3S5tfgx+swyM
         jF/naN5oKBeAvtxtnpB5g1Li1BZoTsB6IsknCYxCxxdPes6bV5bC+lJ/qAPe6ssH+N0w
         lIaCpiNP5LGrZxR2h+3z6oPoJcqIHBy6ezKvFVJkGZGWWwlcVpknHVKAx1pM0kF5aw9b
         UWzHPjackZuX60b3UW5EH1bZdzrQmaSPOT6sCN1jPKrRxav59Mnl2DRc+ow/mahFcKaU
         X0wpiPiHPsArDSt91qAUaWb/RQBJrKs7lNuEt0rRV3d1uZvH9dkY477Kk4KIm7p3FHrG
         685g==
X-Forwarded-Encrypted: i=1; AJvYcCUKcY2ZJKJvwzMKDfPV5wY0ENmsCR83UtLC5bD4l3T2B1aETV9dRQTfoXEIX5uOUuKrzplSA70GSyGBr12+7jwA@lists.infradead.org
X-Gm-Message-State: AOJu0YzSU9G4dQnzbEoStwfVqSTdtHKfVSgfyTm4qbPWAKqVF4jUD47r
	9A52yh+CnA8svaZPFldAxdhJt0kWfBYSbODX5RHoRlsCuetxajBM63i/
X-Gm-Gg: ASbGncv8DidFrebZJrm1EmlVAgFOp2g3I3h/YijFUaCpot1nsZ3AiVDbjCY5zOBKIN8
	0mFc2aLC/kHPazsW8QAZAfOoXKJf8g6O6IhmNAoxK7stupILNqoSEkFRGxIOHxPDTt+s/kc5BKj
	9tRgaR+2shF4exs7aVjz4FYmihx01ogyit06cIRtNOQBXwsMIt7I4zry5GY0tBTITp6bs1OulhR
	hTTUolzpL7ZL+QxgDMXYYK00h6NBu/nG16dsG2jeKVu6OSUjIE5HvGjXuPg3G/glcTHtM4E0WK+
	IbsTRKKWqw4f1Edz1o7R7SsM/QPdq3yNTnTCZps2boKf+yvqkQswZSa9H3NocqmAyc2Voyw4POm
	3ds/NwJxOjD8ZU9n0oDadsl53aVRHFOJLbsYDvp4=
X-Google-Smtp-Source: AGHT+IEQ3S87fa9ZqPvK0q7rgVUNEWS84VK96kAXRXHNuFvPbQyf8Vjt0suBBc0zAlqL2fFCZPSi+w==
X-Received: by 2002:a17:90b:4c0a:b0:311:e8cc:425e with SMTP id 98e67ed59e1d1-31a90c0e00fmr2518373a91.31.1751432671900;
        Tue, 01 Jul 2025 22:04:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:31 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 4/5] ARM: dts: aspeed: fuji: Enable eMMC device
Date: Tue,  1 Jul 2025 22:04:15 -0700
Message-ID: <20250702050421.13729-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220432_779761_4C35BBAE 
X-CRM114-Status: GOOD (  11.57  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Enable eMMC device in Fuji dts because the eMMC entries were removed
from ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index f23c26a3441d..8602ede3ec7e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -1249,3 +1249,15 @@ &mac3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.1


