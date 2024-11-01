Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E5BE6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=; b=HNUVCyF+RbUSbnj3fi6mxNZUpA
	Z+VzE3AUnILKM9l4azVspkevwlyKLrmWhgxcoRdUzSZUXrZz2ELsNZ8MpUX0bxBS1CSZWuobnGAFw
	aKMzaoCbHZduzVdp3d/wEQiBU4OcQ0tAWxq84z31oojQVln/ZsDphBrny9tnCB7SVqxjUw8SZEF/a
	PzuWyYF1SjfFU2czSM9xIs9QtPl+/Y+4KH416iJg7wPEAJYZqWAMol9MpQWQuAXv88iLt2qnz7Es5
	5+/KDEk5YVNfTFbzRF7FlP7u9Igrwi/WHbfziu/PaRBeOUL9QzahE2PFc8SlwVdUNgPMOJU5oBFBv
	aBkSkoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sPz-00000007IKR-20Mi;
	Fri, 01 Nov 2024 14:14:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s6o-00000007FIk-1kG6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=; b=JpRlFy/iOzoJ3M6be7CbxfbhUj
	aK6+Z3VV0jvPWMY8gHFy5tlnWpE7gPL0Xgq3S+WEWfzKXUzwi+4WOckCZkrQjh0KpJsLyJTaii6EP
	IVLep3OzJxzc9WxEkIiTP471TuCPLQyDKND1Z3fFJfPg+d/ptUUEaCptjxfnvgME89NvkSEAf4NPH
	LI0+Hp3VSyIBhZebJ+BiL3HY0Z1nlFuEuKl8YdXa2s9MUnmGlVAfc/gyhrxWdQqSZ8NLRtyiv/wNU
	15UT0esheMYKC4Zc7+jCx8OL6ZK1M2lcW0KVyMyCFM0lD1dZZWZXnnGYDUQgYO2x1p5RjhiczcHmC
	CVRqMGcw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s6l-0000000Ai5P-1sBm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:54:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-720b2d8bb8dso1561366b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730469274; x=1731074074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=;
        b=EJKalSSWGfW+tmBUpQU9/hlBFn+n+nnC4I3H9cf8scvWISpS7EBPyJx54YNkWPkjWr
         xeHfShJEeLCBfMgHDj+6VmfdN8EBOzFJGsbwGfDoXVibEpszMSMi0i6DpTPm8iaYEE8A
         1kBTmjrzFLF+oRgwqeIepkfHmPrvXAmfqjFUvC38Z7zKGhBIIEOxhTcaJIt1npVEEj6w
         5iNWIIEA7Uz0rSFyBnu5Du7wP6NmRHS7dGQJiGcYdALjo/4otiPULrvgkWaN8364b89J
         Fix3+KRdY6WXsYK2mwT62bjYSGvxeYah3Un5vu6J/etb6ZErYeUoFbpV4Q7Cid/EXhQN
         Mbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469274; x=1731074074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=;
        b=nnet2Z+NBXuU7QWqTl5qftGSlXfMtmmVlFhT960I2Jl45+vvkPN1YdVSDtY+VSu5nu
         hCBHtXeANex/8+ANxyzOUiLEaxnTX95+ljbIsLGCRlJ+tDcP1yugI0818HeubULfjckW
         95RVPN052duCcsikCM0f0r3y5s47XO81jBtJm6lB287RvRw0M3mQKZcNiLqukKfOfjlm
         ObxEGAbn0SK9terTG2kflqJt2bbYPBoqNCFQUEsQdPhYYovrSK6t6jFgDUPiKOJOmnKd
         sRiMpDSyHgRUBk/1ViKKOT1Vl6jFVGTHLzGuA1BJHDAUJ81J9BykgHwTl2f9UVOyRVVc
         OmiA==
X-Forwarded-Encrypted: i=1; AJvYcCXC2lTnmr2pz1zeOpQHBPkXfUmmVvIIkZtghdv5utUpHW2GeCOJX0Qr/u72FCwrg5V3G5+i6nlp0qt4MWZFzpGU@lists.infradead.org
X-Gm-Message-State: AOJu0YyCHRva9acEhgBRVsePFOaDr339SjHVCeUcnQXwKPrz5yPSGbXb
	fP6ebQYJ4l/qUy321yGmuIeHSRvDrSZToX3jj7EiW/xhlQSLnS+p
X-Google-Smtp-Source: AGHT+IH8W2eCY65X0S8AQbE9o3p5Q3zI8rq+GaKzoJeNimr8oXqT3hybKf0PinVDefFIyOyprLWsVg==
X-Received: by 2002:a05:6a20:c797:b0:1d4:fcd0:5bea with SMTP id adf61e73a8af0-1d9a83ab7f2mr30193095637.6.1730469273852;
        Fri, 01 Nov 2024 06:54:33 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:54:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Fri,  1 Nov 2024 10:54:06 -0300
Message-Id: <20241101135406.47836-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
References: <20241101135406.47836-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135435_754544_EECCA4C0 
X-CRM114-Status: GOOD (  11.64  )
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

From: Fabio Estevam <festevam@denx.de>

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- None.

 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..840e19b2ca0f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -773,7 +773,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..eff83f5e5535 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -648,7 +648,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1


