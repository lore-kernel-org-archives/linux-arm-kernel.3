Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BFDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=SK2MuhcwwM/ZwnqxizzGWfkOgZ
	ZdO5sylwaqcG2MU4sNzZ5l20D3Wka4hbZkKWCwnv6JF1TB7XoGNckhQFS8b4sK8eHGXtnlcA8M1t/
	Yl2Hh9cHHuRdhrjupSH2NKD15kiHtbtO6QLrlrsWg6JxbdWz40jJgt8CjG70zpae5x5wjP1UqKYag
	7DSZZBy20spbiS59FJbdWQbpHYo4mzpmpyoEYiyZ5AWYSR/CKrSyR2sxqKuMCBCXHkPm27ITUPHW9
	IBWCAbYzCb3aa4ZFoa3UGGxu97cceJ0h6tdGwyqq2r5Ec0MhfTeSV/Ht0vjepmgNa/YW5G2ZOhacI
	+xwBV+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRumB-00000003Xap-3vas;
	Sun, 29 Dec 2024 15:00:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRucu-00000003VxD-3c7M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:46 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1221572466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483843; x=1736088643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=b3w3CH7GlEIAuYvyj00tNv4Nna1VTZknsSjlJ7C60A5EU0coCtirbgo3KTAC0Ja4cB
         mSZnwgov2WOtdQFBhrp2QC8YH1uAHfTBhFSuobLe4Drp/EPTzeP0OBqgvOX3ARO93zUW
         zW6xiY9ttasYdOHDLm6uzIhudnRB6ZHCyRNzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483843; x=1736088643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=Vf5GqXFtYlQArw7YU6rXUTD0pGMUUORgIh99LwSUV8XjpDAIa+V6M3kEy7w62yWj9Z
         fNJ6mRuZtXfsiqgRs+z+lN6NNK64HxSjLNUCM3regPI4/NdvJn0afmAMQKybfP7Xgof7
         DvLLWgRaX5l+sr6W4V89Fgk/DWmp7TGkgM+sCyIJ7Au9UlGem5YvVDujxfmf6sTuX/4r
         IyZaUBZz/4Q+kyCkRkp3XvdqfUKTeTaXdRsICj/JD5Ze4hcUNcWIrKYMoVKJJ9fAA9tI
         zGLOLcAu9T3whUfOxqHLs7ctA35b8lXO+8phpSUuJR1iKnS1svW2J7hS9LnGs8PGhkaE
         YZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhTikIb7CAT57P+QehBgB/hTLUM26I2+GCdIfA4RCJDCwVV0v76cx2dxNtWmlcLg6YGajcRc+dOfWxNQ9d+MVq@lists.infradead.org
X-Gm-Message-State: AOJu0YzkfmM5fpWY6FIQXSJhJNp3Hw35i31HfYUhzyYvDvqDx6zZ22Ls
	vIXM9OpYSeUZd5QPYNuamDsEEdnPvOYby977LD9WiWD/aqoHNTV73ulDoogtjs0=
X-Gm-Gg: ASbGncuXed8/mUGCaQXkWbk+e5gUI548EV7LhtUtt7LcOriT255BcVROEu/s+aXeyX6
	pBMp3swWoYLf5MTN7whw0/XT8BrfzypxiR5cA3jzMTeSRvz9mORZP3VYb3q7WOBfCKT/v5QEePd
	YCJJ2CFMv+7v4zE2bB32mbTj3OhT7vWPS2k2u2+BpNogQgJUPVGzg7KBbnAalv8uVWTYIPDQlne
	2Abw6DJ6lOvlalQppFeB+47c1pHolt2IAL39BOORj4F+VQk1n/xOg7SpoUuUz1kmlJv7D2W0GLv
	lffPZD0lnkbAEY48G/JOIA==
X-Google-Smtp-Source: AGHT+IFDrY6B7oSvA67ot9ukQjCg8UM4FQr4YLiQDwamuPsObDrBp+CwuA86CFPPQhHpy2R/frIabw==
X-Received: by 2002:a17:907:d9f:b0:aa6:9ee3:e51f with SMTP id a640c23a62f3a-aac334e377amr3135317166b.41.1735483843575;
        Sun, 29 Dec 2024 06:50:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:43 -0800 (PST)
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
Subject: [PATCH v8 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:31 +0100
Message-ID: <20241229145027.3984542-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065044_913128_42B30B6C 
X-CRM114-Status: UNSURE (   9.01  )
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


