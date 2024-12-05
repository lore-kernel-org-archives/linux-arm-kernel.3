Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E22EE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=; b=fYw9cyOdkvxw5Veq6WGTY+/ZG9
	CDfh9ZpSU0m/50lPa0orKm/Umb8i74/r5UsrDx5H2qDERxLVwVdhin4TW1Mv4ZvJs7fK1fSrjcLHo
	NpanVmzLIo3/TVcjRIayf8gZZ8zPw7tijBkDKx3EKjyt69rPtPBMudrFro1nF4e3lwOmHuIh8Q+h0
	6eSVhIDV/hbS+MjNncnsJczwljqETPbp5ydOseUCFPI89y798D7jc7ulKzFjr/CaFS7pAn0COdiwB
	tc4KhcCwpl2xUF2qjvTS/lf3iudv+eZ1wJXtK/cSxP0izuq0261oWFV4rTS4P3AlOwcEAIYXOZnRI
	qBv0f6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJA2V-0000000Fiwu-14Mm;
	Thu, 05 Dec 2024 11:28:59 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tk-0000000FgdW-0Jrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa549d9dffdso109897466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397594; x=1734002394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=ON3Q5vdg+NiyetA8TvnOIPWc73oBwao5rU05gCX/p9Lz0PYgT5hKAZumjjZgtOXAey
         6cq5PjVj+BNQzjPGCAc9GDeCEzfBVT4p3Vp2Idfia1m6o5hFdbIStaznQANHSBqO6n/q
         RNfBghrF0IGctfWMUfZ/+n2jMfQWhwmrSH1Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397594; x=1734002394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=Yd9wufg1q3/Nu1HsGQO6soAU8q6rta0DCEAPFSygutd+gQeK28ChM0lSBh1vk6Yslb
         osG7gq+SSjO+aOsQpavQcSnKyC9VX11tHCcfpMeNHLi/0miyoAYOAxVe5WxopolvTq0X
         tXKRyjGQRAEqHlh0wYZd/itiFUdtfJwuov2NTyRMMq/WHoh9AG2A0Ll85+a8hCzIZ8Lo
         84rb70nT/PC32/R89ui9entZ3WtYgmoRLgkhoPZh6the3QnigZ09YIkmToMEBng6iY8i
         HqF/OUlZ6xSWcqa+GwzgpFr/QbRkqDbLnq36fXwXL23cIsOmNDrgcLs8xRg12MK3zzL4
         tsFg==
X-Forwarded-Encrypted: i=1; AJvYcCUAW54bIg9pA/QHitJB33+lF14AuxaMW3sbRXWJgGhiduJK77hWBSBfTd6iAYSZSwhmjAMKuGKKCmcFBYAj4CmH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy51BTUL81LAeAOV2jmDF3GnZyDbtPHvjVUBgY34CVPXLrMHRII
	DVUCOTNEPNz1p7lN9NzvJSBSoE8icNv1MKnZlzLSy42eweiAyPXbgBgg/XRNZgU=
X-Gm-Gg: ASbGnctKsctKq3oAf92g5Lw/nX8n8j50mheY831QwfBm6DfUsmxnxYW4h+LZHsiRIl8
	DATu8k25bYn50o/RFy0dVtjO/EHlSXCZZcT5AGAUs36WIiUvvZDsTJ8IYqzFKo1z6XBZ+6A5cJw
	lqqvcDqXQM8CvFbPaY8x+Yn/rrgGc1yjoub4F4Ho33IBmCUWewOuiE9cQkpfLTykID6TozM638x
	8J4SR8BiU1OWGSwe8LtjVIiefg5A9Li0nNBqIlQmMGJ/qrQZPNyn56PD9w/GHq1ieKmBdVJNxgp
	Rcadg2Wlxq5zQgWhk4xsQv/fPeBi5rDCaZyp4Zug/Dlwqg==
X-Google-Smtp-Source: AGHT+IHjGH80PYnwy6f3N1dyTyMHBVS5+YcXkhAFmpCzIZW/6EjpsfvTuvDL5MsErchIS1MKSD73VQ==
X-Received: by 2002:a17:906:3097:b0:aa6:1c4b:9c5b with SMTP id a640c23a62f3a-aa61c4ba102mr240616066b.7.1733397594442;
        Thu, 05 Dec 2024 03:19:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:54 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 08/20] arm64: dts: imx8mp: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:43 +0100
Message-ID: <20241205111939.1796244-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031956_109616_87EF6435 
X-CRM114-Status: UNSURE (   8.88  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


