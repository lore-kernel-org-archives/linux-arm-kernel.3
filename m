Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B0CCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=; b=rj04pZwd0jl0HRpDzaR4qviXwF
	XWyniLEc8O2eF2DIl5uYMnpUfNWxfgfjqD8tY5j+Ee0ooCap+oe0Avv1YqSX4OlSsoDxdnAtfzjuc
	q/neyrcl46tEA7em7ZM/Ohp856UyimkH000dJISaAlGrhaaAzl3rcXfL/TfqblTg00bYQpCHHgI3y
	y1h8Bd3FSzPe0qMZoa/nWGH3fsHZTf80VUJfbhppjJk665oABd4QOJxXP0pEgJ2JgkEZOHDw1F2dQ
	5PmO8jqZ5Ao73uZhOwLkvLxryuqoUAW8srOO7KsUsU2Vfbc3d2Ot+xjlTSKvp5pRhmeZt2JtNgHH4
	Bk7yoP5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzuv-00000000DPN-0XHx;
	Tue, 06 Oct 2026 07:48:53 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzur-00000000DMW-3kmA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:48:51 +0000
Received: by mail-pj2-x09.google.com with SMTP id d9443c01a7336-2e13013f1ceso5399925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272929; x=1791877729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=bhSZWqptRQsUl5/k+N+khLQrR6n/uXrOTL68hc+lCIdbzzmqPd4SI73TkSLRGTZwE3
         lX9n0daXhiypssBVE/sHqmChmAirWs5/emXulUVuHFwYIDVqSBNRhPSCyhJBITNI/TGK
         ehFckzNfpj4Hs9wN0KFIQ/f0x4l9KEHNZOznUWt4xt9QZSdkdh1Okg6syPWiT8tko3Oi
         VZKlemj05vYVxTCZ17F+bRrggRzOyXYXb41iaZhoRgLzLmtvN7m57bbJf1VnOzXDVEmn
         xan4zssh7cDM8fencoOdFWQ9Eh3UqB3FNoyOhMGsq64+jxcn1oet0gCsRqPyoxSX/aPr
         fCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272929; x=1791877729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2tJApUzC1LEzp8M/eTL2SHChylQhCDDbwAQQxkGsv0=;
        b=kTrlw+uTpn9Aw/zvkNxavbcGJQXiznFmHigEp7w4TfHuEn6bnb9nMOWk2tjQyZJ4Gm
         YFkFyzAKRc64KMrKkybYxb284KUdkw0Js4lsZwgJQKD4LlevKyEulPaij0Hb0yKUBVSO
         F3znyAu0A+f1tVJFpFrzYn1+uwNvvbeWwljaZ9eIw+VlWQtbyJ9jUdJOEXuSULdSkkvD
         g1BoKUhaeMTwWCpjuSsXW7Y14uthh0hQq2FzsRc2hBu/9Qlr8uHyP92D33+6Fm14MtG6
         /blkfot/SmDjpwA24zAuy7JsxKLIMFC4mIWYvrGrdanRZPKdZvLIACFUvWiWaeLjWhv+
         9feg==
X-Forwarded-Encrypted: i=1; AKwUvBx97hww6AKNXu9EV/UI6KkMDZXyDWuRc5rNVMhfePcIDGy7LIW1dsoULBV4gBRu1HQCjZL+M98Re3IMNSEASp84@lists.infradead.org
X-Gm-Message-State: AFuF++mofTE5p/VRwdwV3UO64zPl5Dz1s1IBvg0VdwHhtw9ML7ZyvCmC
	2+ml2/fkC7y3tET+cC+k0Nbg1R70q+O4/vBnq7sPhaOIr1lCMy3+omme6mZVqk8DDWUgVw==
X-Gm-Gg: AYBFou3rnfvq8KKOgyytvRYUtTtIfu/HD5ysX0rrMU0Mjis3YDsfliLnMinYToOomNx
	1ceKsIFNbX9X3pME0mE4/TuCMf5+pz7dXWPDtvFcnWl1Bvjc5cePsmi9A3cwMPIhZillVijUA/D
	Lxo+gX/2XFNRznwL7YnuDHfRv87ewVY69IkXKmz/dtqF2OqUnDssgUL8N15ubNQCYHf8MrvvQaA
	M3LJRE8MyXFuLifLKdKG1J3S/LgKFAE2HWShebjeatqvL9WLcrOiH2ZYJb7nk2zmkk9pgmfyPph
	O2OxWIvYWfYuHe7ZRQDUXHqTjUrgtxQNaVgj7pzSzqWnA3kiC1VggSDmtZ+Uw11+zlU0l2hwmKz
	QE2ZiTOXdT6Q3Xns/lEzmNv7Aa2YOVXgPfP9/HmT3cdFzs6DD3AT24MqqIfW+u4prYonaFimNbM
	ramkAyqC88EzeWotM0SZsCmaIelQ0lCmgEcDxR6wpYLb4v1IqnfFxgKLLRJbqp0EL8ZFpr
X-Received: by 2002:a05:6a21:6b01:b0:3e1:1689:1ebd with SMTP id adf61e73a8af0-3e12485fceamr550520637.49.1791272928795;
        Tue, 06 Oct 2026 00:48:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1998173a12.8.2026.10.06.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:48:48 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
Date: Tue,  6 Oct 2026 15:47:48 +0800
Message-ID: <20261006074749.2010233-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006074749.2010233-1-coiaprant@gmail.com>
References: <20261006074749.2010233-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_004849_997543_C55E8572 
X-CRM114-Status: GOOD (  13.95  )
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

On RK3568, the SGMII interface can be routed to either GMAC0 or
GMAC1 via the pipe_sgmii_mac_sel bit in the pipe GRF registers.

Add the optional "rockchip,sgmii-mac-sel" property to allow the
device tree to select which GMAC controller is used for SGMII.

The property takes a value of 0 (GMAC0) or 1 (GMAC1). The hardware
reset value is 1 (GMAC1), but this can be overridden by setting the
property to 0 for boards where SGMII is connected to GMAC0.

This is necessary for boards such as the Ariaboard Photonicat, where
the SGMII interface is connected to GMAC0 and needs to be explicitly
configured.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 379b08bd9e97a..8e898bce9af73 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -80,6 +80,15 @@ properties:
     description:
       Some additional pipe settings are accessed through GRF regs.
 
+  rockchip,sgmii-mac-sel:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 1
+    description:
+      Select gmac0 or gmac1 to be used as SGMII controller.
+      The hardware reset value is GMAC1 (1). Set this to 0 to route
+      SGMII to GMAC0.
+
   "#phy-cells":
     const: 1
 
@@ -105,6 +114,10 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+        rockchip,sgmii-mac-sel: true
+    else:
+      properties:
+        rockchip,sgmii-mac-sel: false
   - if:
       properties:
         compatible:
-- 
2.47.3


