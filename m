Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC9CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 13:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c50RyBPgQdPr/4DUil1KpdDvS+9hJu/6Tk48lrLYEFk=; b=1rObrHSffSEo+TN0tdBX7/JzPn
	B/RZlT4MtFx8bofBwAVGZ6pS8GrqUmGRVmH/4AOk7Qst4dPKT5uSPgx3jbXcFZLyRLgqqGNV1BaJJ
	+U3AbGldhod7S1HtT6XiKBHx6+aynml0LUkySW84aOwnMWu0pSdYsu3b2nim97Vwon8e75UdiKYVU
	IFoIGWgYYfA3o+S48UQasem7lsS5Hfo2nDAZnh1E/dWhkXJK+OUMdHBYANSE7o8VnOH/xmBWyveP4
	8cM2jdKcsydi7/kDu5j0SFZ2PxVAejXBLNpIhyMNWLd918iMayG/MLxrus+/FCwJ5qRpnRD+dXFIl
	FvQuFuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeVf-0000000FL0R-30bZ;
	Wed, 06 Aug 2025 13:48:51 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeLk-0000000FJfd-40aF;
	Wed, 06 Aug 2025 13:38:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af9611d8ff7so199098866b.1;
        Wed, 06 Aug 2025 06:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754487515; x=1755092315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c50RyBPgQdPr/4DUil1KpdDvS+9hJu/6Tk48lrLYEFk=;
        b=kUL+PHOs5ewiIAxTaYZ+dFp1QosmHJjS0W9IPt4UunGwd8W9FZn4GUK1V60l+QNUS2
         9So4dXKqkujVx9BLUzZm2xYyCCoLWtBBMm6xCnQfGcI0xtPytOVFykw87Of3a9PdpwsF
         VRthYVFyadwmfTPza3mm+fWn+MS+5IMY0MBoQtX22aDYuSH3YDHLGnaE6Df+oDFuJIjM
         IO0PsbkjBO8nOPMMdfeXUWEH8szcZ+/vVZ55vSeKVX222+awcpqtyYRh4PhxLn0nt5CW
         OhTZOsdG03acLClaqj6I6hlNLq6r5Yp7JgjatBhiqBveX+uItGLtCjueTlOGViGhYz3N
         TIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754487515; x=1755092315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50RyBPgQdPr/4DUil1KpdDvS+9hJu/6Tk48lrLYEFk=;
        b=s+OEggF5gY+2OBnrTawPci6X0Qg8W1xnxlPD//6gDepzfe5p6SsjhKFw+4qSkHDYKJ
         CGH4qx7tGXuIuaZNs6dl27Nw1W4qDRX83KuX8AYYx3yJCreJaL39kpM4M9kzq/5sZvIG
         UKVFvjZmSAhZe6GVc0efUKch+mYF4tx+UGj72e2Mix4qBejrNYc+Hk8Vb8m7yDA8fFUQ
         jKqRsLwtYg5m1h5EOW2M2sXGszbPFKsKgFuSthp/1WEXOE9p52KOPqol/13HckpmRgH9
         xTFPIGWhMzQGj8FyhDnrZjDEUntv8Hkw7ptKXpFqJZkgHATRKOyB0VKnSvOLFS4+z2S+
         TL/w==
X-Forwarded-Encrypted: i=1; AJvYcCUXBxm6xWwpTcno0W3qW5EZG7qnTL2Ikm56yoNLQPnmafDFj12+zXu73U7WMv2hXjYUuGNY0oBkR9iW0rlZXJM=@lists.infradead.org, AJvYcCVaZ0oZ2CmhLiFhy1MhmLliQ2js6+76L8pQvOe1LpR06hm1Dft5ax0YvgTCWPzVI5myYfHaC/fwsP39iVtD9DEq@lists.infradead.org, AJvYcCWVa02lZPsg5RpwYoQUAIEiy6HrwJ8Godcb+KDxyxjNbwtjTyAtJv8SEZuxAAtCX8yBRUTr+CN3BdU/@lists.infradead.org
X-Gm-Message-State: AOJu0YzUcCTTp0EYjFiStMOgnWwzOEvfL67jrpIXV9dQS7Qgdrqb1LZb
	YjlYOMg4EmonzHAx4owPftVYIEvNrDxntlTvimoakheHFgf4gq0KtFsT
X-Gm-Gg: ASbGncvTQsZB5NnmUEh0gqZYbVSf/BZQRnRvFkq5JfhVI44GKGJ8edGBzqMBln7r2Oq
	bKSvN6oUGCNZR9OLzQIK3vf9W+S31NaDrOPbmDTlIFVsnFybSPJTqEBa0f+E/aQRP9EyYV78kGj
	Kv9PNmZv8dwsCPDlM0I78v/9Ih/y0Eb4RCgyLC21scAHwz66vlgovMtYAtZzD9msSwZ8wxJjHsj
	FyyLwdyklHxs8TjXMZW4Y9Jtz/7uvc09QAZO8L+q0n8I2yy+9NAi6Oro+ztWYTgDKTDW8CxUagC
	24n2E75T/RAhxTP7gaV7gGLduB3XVSYFKNB1KgiFxHWOIUH0TyPOTjbYxAjyCx+wgunuO7b2wC5
	YzVKZV+JL+bd90jEjHclZee+bEgbrLD987jPukKmZQWMMSMr7
X-Google-Smtp-Source: AGHT+IECRHTOqH1pMckrQTVJ2vn4wcB0MM2YxMCUNqlzmwxmnXRr2ua/O3tsfNjUQBkMU3gTEe+wCw==
X-Received: by 2002:a17:907:9687:b0:af9:41a4:25b3 with SMTP id a640c23a62f3a-af9909a55efmr267368466b.29.1754487515061;
        Wed, 06 Aug 2025 06:38:35 -0700 (PDT)
Received: from A13PC04R.einet.ad.eivd.ch ([185.144.39.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c10asm1113170666b.116.2025.08.06.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 06:38:34 -0700 (PDT)
From: Rick Wertenbroek <rick.wertenbroek@gmail.com>
To: 
Cc: rick.wertenbroek@heig-vd.ch,
	dlemoal@kernel.org,
	alberto.dassatti@heig-vd.ch,
	Rick Wertenbroek <rick.wertenbroek@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: phy: rockchip,pcie3-phy: add rockchip,phy-ref-use-pad
Date: Wed,  6 Aug 2025 15:38:23 +0200
Message-Id: <20250806133824.525871-4-rick.wertenbroek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806133824.525871-1-rick.wertenbroek@gmail.com>
References: <20250806133824.525871-1-rick.wertenbroek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_063836_991640_AA65B1F1 
X-CRM114-Status: GOOD (  14.29  )
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

>From the RK3588 Technical Reference Manual, Part1,
section 6.19 PCIe3PHY_GRF Register Description: "ref_use_pad"

"Select reference clock connected to ref_pad_clk_p/ref_pad_clk_m.
Selects the external ref_pad_clk_p and ref_pad_clk_m inputs as the
reference clock source when asserted. When de-asserted, ref_alt_clk_p
and ref_alt_clk_m are the sources of the reference clock."

The hardware reset value for this field is 0x1 (enabled).
Note that this register field is only available on RK3588, not on RK3568.

Add support for the device tree property rockchip,phy-ref-use-pad,
such that the PCIe PHY can be used on boards where there is no PCIe
reference clock generated or connected to the external pad, by setting
this property to 0 so that the internal clock is used.

DT bindings for internal clocks are CLK_PHY0_REF_ALT_P/M and
CLK_PHY1_REF_ALT_P/M and clock rate should be set to 100MHz in
the RK3588 cru clock controller (PLL_PPLL).

Example DT overlay where PHY0 uses internal clock (the first clock of
the cru (PLL_PPLL) must be set to 100MHz, other values are copied from
rk3588-base.dtsi) and PHY1 uses the external pad (the default):

---
&cru {
        assigned-clock-rates =
                <100000000>, <786432000>,
                <850000000>, <1188000000>,
                <702000000>,
                <400000000>, <500000000>,
                <800000000>, <100000000>,
                <400000000>, <100000000>,
                <200000000>, <500000000>,
                <375000000>, <150000000>,
                <200000000>;
};

&pcie30phy {
        rockchip,rx-common-refclk-mode = <0 0 1 1>;
        rockchip,phy-ref-use-pad = <0 1>;
        clocks = <&cru PCLK_PCIE_COMBO_PIPE_PHY>, <&cru CLK_PHY0_REF_ALT_P>,
                         <&cru CLK_PHY0_REF_ALT_M>, <&cru CLK_PHY1_REF_ALT_P>,
                         <&cru CLK_PHY1_REF_ALT_M>;
        clock-names = "pclk", "phy0_ref_alt_p",
                              "phy0_ref_alt_m", "phy1_ref_alt_p",
                              "phy1_ref_alt_m";
};
---

Signed-off-by: Rick Wertenbroek <rick.wertenbroek@gmail.com>
---
 .../devicetree/bindings/phy/rockchip,pcie3-phy.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
index b747930b18f1..d9b9d7eabb81 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
@@ -67,6 +67,16 @@ properties:
       minimum: 0
       maximum: 1
 
+  rockchip,phy-ref-use-pad:
+    description: which PHY should use the external pad as PCIe reference clock.
+      1 means use pad (default), 0 means use internal clock (PLL_PPLL).
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 1
+
 required:
   - compatible
   - reg
-- 
2.25.1


