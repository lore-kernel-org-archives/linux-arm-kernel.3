Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2EBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fZSTUHnpCdIkoln/SmuVNeKT4swv6cpg6DfKi1SYao=; b=GWQ2I9spj7J0fXo4veRI5mzoEh
	yEczusCEfW4sK1YkOXanuWHeR5az8mrxp7v6Qrn8SiJLgVw6OWJsrtI1rMX/EVE71nKEPeQG9zjTA
	nqZ1dMH6ziXLvDLXBCi96Lt3TnVdXnrNkkKumX+RJ21j3mnGWHnMe41/uAnXTHJ3dfU6YCIed+c+W
	szkZ1OwbGx7OvZ9pDglcY4bHhEz1SFdv8Jb9ylGlN6PbV9wDUnCQ5Bb6CSUSzbkNUXXfIKMbULoqm
	QERZaL20dXylYPeKh8poH9kkePt7T/IPRUECBfyPUQh4Xr5WPn6JAzTrgW/En6OF2PImMZOoQhumx
	0zN6vrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYNR-0000000C30R-448P;
	Thu, 12 Jun 2025 03:13:17 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVyd-0000000BndL-2ZzL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:39:32 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7d21f21baf7so43626785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688770; x=1750293570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fZSTUHnpCdIkoln/SmuVNeKT4swv6cpg6DfKi1SYao=;
        b=kcDxYZu5mlPTCtR4Lk19RRgpo7Qs+nv2qOYP5ALWBCKkaAguNKJVo4EbgqmxG6wvh/
         0O36hND9+bUhREVVsvqJybOMfY4Lk4sl7pDvikvZVx3sLvp5F6bPpqSHTLKGLQ4wEbWt
         WM0xNB5/AEK2CN4cuS2dPmnynDSd5B34EwGMaMr6ibtgNyalYSV1k/bcnmg45rZwZEUb
         kjVGpXTNRSRYrK8ECyxPBNsBR5+ZIT6lGqTneH0SW9NNVnrpSWEIucDLb/TzVCNs8eqc
         KGdTX/0tIbu1DSuWf2iFwmYBMtp09g1P9M47G7+FRlIc3ud5CREYjW8McuIE8E4d6fDD
         IGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688770; x=1750293570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fZSTUHnpCdIkoln/SmuVNeKT4swv6cpg6DfKi1SYao=;
        b=PrmVe9gbeyVk0Zj/4mVQJboPj7asXqFpkKAMB/arOm4eImt0lsZTNOf+m0vwM84kGd
         RRTlkyUlSjXjyW3jPTA+wXOwNLTDbWZdeESQ5kV0QfOQ11A62OiY/LdhT+gA0e0wEnzy
         ypwDanbn2d1ojXDz/gFUksrc0anYwnij8FNeQLkeVQhUoLwBL//eSr16PxIdiuQwnZ1+
         Yg+LllJFoEGn16RWk02KOIauCKdMTte0fatctfG1julgExr+fSVZQqvQbyzvRMKFfIgm
         GVyhGX61MyzlF5KYlRd+UccUTzhlii+qlob0TsSRjZnHpOIylxhta0NoSm6Sdh31hrjG
         CtbQ==
X-Gm-Message-State: AOJu0YyTUe/iZMojRdK704VfGwUu0nJD5XEUeos02Wtn3qAM8/Jb5A2l
	L2LbHyf97jUFYUpQL1sKKmkHZYaDVHUWSQx3qe3dLIIR76vh4kOrl2wtY6g8tQ==
X-Gm-Gg: ASbGncsCtUDhMdsY6ovrx0GPR5aonv5tNfV6Z9VKwk58c/EfiVuabhvMmYP1B3rvVW2
	vXRScxRFByJPpiXtnZjXu9wr7B50n9B3EdjX8mj6h2xvuuGYTfnkcSe2Wk4MXNnWHy0HUgTZnjp
	HMJOr2abDYBHd3AfP8pnNGmEuUW2tLjWB3KvJYfNm5gJ0u7GyWjonXfAFWsosuj/hv0+CH6AkGO
	eg32tl1dha8il5ZjGnP0bBLj4Lds4Ts/7kjHmJVIenN7CF5Rnwhsi78HjQqE3U0qeP/unk8JgNM
	j5fPF+7ZE0e+Tl2e03nLz9LxK4xTqyRlgDLDmo3jkle3fwlT3hYyR9vN+K1zdgSeBXqvEf9/h+B
	dky44iJABoHhqsh7Ac2AWfNX+uhi8poMkc90BB54wMXcd6PU=
X-Google-Smtp-Source: AGHT+IE0T4IWYcc2xUgd7VquqVdTsmUZWXLcctw/Eb+M2rfGp4uWepFmDd7rs2MYip49/yRfcZCKug==
X-Received: by 2002:a05:620a:1a21:b0:7cd:2857:331c with SMTP id af79cd13be357-7d3a893a2demr669978285a.42.1749688770447;
        Wed, 11 Jun 2025 17:39:30 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:30 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/4] arm64: dts: imx8mp: fix VPU_BUS clock setting
Date: Wed, 11 Jun 2025 19:39:20 -0500
Message-ID: <20250612003924.178251-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173931_652454_423BFE2D 
X-CRM114-Status: UNSURE (   8.27  )
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

From: Marco Felsch <m.felsch@pengutronix.de>

The VPU_PLL clock must be set before the VPU_BUS clock which is derived
from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bf15c502280..909555a5da4b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2283,8 +2283,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
 			assigned-clock-rates = <600000000>, <600000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
-- 
2.48.1


