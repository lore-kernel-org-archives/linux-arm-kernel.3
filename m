Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95009E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=Ig/sfF9rcmVMulsARQN77ItapC
	V2JE7Lcsob+3aCUKxh+rZF2qQtWFdRlLm1I2a/rjiHX9wIGVtGRxTL1xmh/M6m0Lby/dEp30HOtcD
	cxtTFa4am+A8kjiEA1DXmzUcXdm3sTFn+H7J5cg45K9yF9KU0JjnNEbvqoYayNX3DgMOr8ArEJJgj
	IAwcS6m20zVrn896silBdh6tiTgdksT+9ZHMEhzdSFXgqyF1i3vKxiX2nkybMBdKmut2bdcG1s9iO
	GPfzjzUEt575nb3dW5HDsgClz6tTUujtwKxCu7EwyRQnsoXR0rdd0Y4tSADkK/DKAXWQAPFVnpxGd
	YbrA0Fhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJA0X-0000000FiZY-0KE4;
	Thu, 05 Dec 2024 11:26:57 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9th-0000000FgcT-36Md
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa549d9dffdso109892966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397592; x=1734002392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=cYN2bIoCDhA3EOinDwNkZzaf2FqathPVOpaKCM205V5ENmoxGpK+voO7xgWc2+dxUo
         Va78tSeTzxJz8HAE31Xjy3w5eksYoC7C/fZcrXrVbMzCd7sROtFnL6qfmDb1nkMR20od
         5S0zQq/BdJz+DAQPxwPJqAkAMRM4nllp436wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397592; x=1734002392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=qrL3pvH1mL6U6/3brrrMl0u4D+orjZMUaKTWvyMM6e0f7jen/FKSbXCRIwc8h5yC2J
         BuJGv6Iid3WmfbqNX7y4wIpFG/iC+wt9bFGDLm72hFw/XIuocQhrQ7yOOarBkSkLxCCH
         JiJ8RReSR3f14fWZLMMpctIrGv76Dk+6aq/VFTiGqnqYgs17hQV9mMxgce6gG0EXfMxf
         HWsx5k2uzThA1khLlxQ3nLg5Ndem8BIjfcteN2LSvDglodbx4+Y9OQK+F0vbyWo5k2lT
         ZMvyJz4bYLGbeT7o/wbEW8IKVlcescQiSsi0DZZitlgpjL2BCN12l32FVHaX858Xp2SP
         ylHw==
X-Forwarded-Encrypted: i=1; AJvYcCVM5CDSAEEZDdvZx4A7yIqK62MmOzVnwH/VJ2mbdcaEyH8ktTPJ7kjET7AI5nNHTEvEWor/w7Ac91pcH7gn7Smy@lists.infradead.org
X-Gm-Message-State: AOJu0YyKHNdcSW0PyIX38Rh4j19FnF6VLvLYufz/MFrBniouHzpHK9rY
	RtbAKwY/eIf/TjXgxoSI/xev1mzcDV/ah+XHc1U4lUIsznOfHe6rS3gbTr1ZyUg=
X-Gm-Gg: ASbGncvFyRJMtcOYCCNPYSB51wNxhXuUTdjm2kxoXKN6EfnwbAJ6wr0EKipkk3O92FG
	zvPZdhAoKAzh5lReXOcZKdKLc8AyD6aDmMNxugUmMGYu4ujolfz0Lp4P+8ng1IHR7MIkOtV/j3o
	58Ldl6IKfa3/zygBEiNYhwqZwV5b+VIyx57niUTOg/pJJWrjQMfi9derbDRsLD1y/e7FiEd6Wlj
	IxPTdCCeBzLHGEBh7JiYCrvuaj+rq+ybINOQ3R3ZCM8PoRv7eWz8i3hIQ2ujnQm36e7XAwBBtYR
	oEaOlmhMYaA/GCv7IwP/5NW/qLUOfVL3AATk1xAEOC2b+g==
X-Google-Smtp-Source: AGHT+IEKdcdUCceUHogmpJQSkfQi7gvSkiGqFxS5Oof8+cN49W1U5s4xMeC1Lw+OiTYCvRjxODLcuQ==
X-Received: by 2002:a17:907:7758:b0:aa5:3f53:ad53 with SMTP id a640c23a62f3a-aa5f7d8d1dfmr756999466b.26.1733397592064;
        Thu, 05 Dec 2024 03:19:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:51 -0800 (PST)
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
Subject: [PATCH v5 06/20] arm64: dts: imx8mm: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:41 +0100
Message-ID: <20241205111939.1796244-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031953_773157_BF3E03A6 
X-CRM114-Status: UNSURE (   9.67  )
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

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


