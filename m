Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CDCCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BFHOC0io9g0o+2fapfpOBebq2bCjMy1h8J+xiMNdOIU=; b=JWFrZDbT2SEdwWywqm/wx9Nvd+
	aRHTblkQ2tDD3cwkapknYQCCQMTsYxPn/WtIKYxt5cAy57iBHvKWWLjGu0rKL1gb7rZTkOwmLCTaj
	YnTCoNqP/jIJ9z8QWX5N2LzYXdsW9P2c7jKYVfAY5w7i2yvD55WXOUJ2ZrEw85CkWMsL4hgegXngm
	b7kOC5dqhjp3re6ex+RbTq+7FBrHikbK/eg2iiauDz/vGZWwU50pdKLFeV4mER7hfz3vd6GSjBk+0
	DVM3HZJJNZ0YdFmCMRlvX9r8DMdJtdS2l0bE/WssFsQRzknv7ksHN15ZiJ1wV4pB53F0UFfln6q19
	2k3kH51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdw-00000004SJS-1Hba;
	Sat, 23 Aug 2025 09:34:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRtK-00000002ddB-38EE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:33:15 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61c297e8306so36513a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869593; x=1756474393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFHOC0io9g0o+2fapfpOBebq2bCjMy1h8J+xiMNdOIU=;
        b=OGAdhr6urSt5ViaFQd5B4jiZImZIzp4Ix4DjWMZSbgF9y9rlt2It8RI+qAe3COjTib
         54xVNhMF47TrtOkPAcMKC+i6Md51/wLTMrCJWfuYYwlg4j5VWViYBVh7uBiEu0acbOMX
         jP/E/xhC9C0bYXr+U/GvNhcRcxWSiXzhZqxdhErWoX0Qhcpgeau7G8ZGAHT09yCWnvgu
         G8P78zTr3BoER4vikciwjU+xDw3vLMkKj701k+m8RT12loMZK3HA6asTSzWpjhvr5ofz
         mHgAYG/1mRGlstduIenY/eFnduuNtS8M7g5wqoGT8z09B4LtEmxB2w4Czyl/AAGvU2TV
         U7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869593; x=1756474393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFHOC0io9g0o+2fapfpOBebq2bCjMy1h8J+xiMNdOIU=;
        b=g/0IhJiF1z7596gD600LXSX9tvZrljpcZ+utTPjJHyLstxNfd17ZHkbngHD6K/td1D
         vbGieqA19nrHwFkpmy0VSP0SPHJufAip+1YjR7NrarRzCEI3/XiM65wr/M/mL5c5rfS2
         zvHzIjd6N1ZyPBPz7DvZE4SiJwjDRVmdofQHxArvsKy9L386M+A8tli2qnmnF1Lf57L/
         DE0B5CpN6vjxenhtDYs/14QJePIJE3aHAFjTKIUEYYRL4jeeTF9AsLf0DI/KPOowlj4r
         CUzXLtZc2gkH80HelItesmHkgaVOyKDjwJiSFllDoVusKRHGqYiQ7MFjTzINYPbANKkd
         Egng==
X-Forwarded-Encrypted: i=1; AJvYcCXjk84KOcCxe0SqABaPWdZjlYEhulFRSsKzazdG8zdsicsLUiMe1dzGcyi6xjmE3kb54NxDbUjm6Zb4GgekJ2iu@lists.infradead.org
X-Gm-Message-State: AOJu0YwYq2lSCShWeGy4s0o9MrCo7oWO2fvieAg7S37SOE/Z8w7B1ciU
	h1yjrtO/Z0t0CfxCUtzjMN9hvealPGYwHjeok/4PZzlBG3jtqTNA5HoGMfdiaLu1Pgw=
X-Gm-Gg: ASbGncsfgAD9Lc2PWyjNltncn9UXt9/jGE6z6rhyh7+rgrmpdPF7wzlPc4LzfJRAG8g
	aBZo+vGIGmzORbm0hk4S8+ss9rCNu+6evMywGbz6H30L1bWqF456KJUMr9ry0TUO+uMa9oZMUIt
	govDJVz2pJ/5VA4t08D7SQZNnBCbV7WzgwQUc8OIfaDkyRK7SM9D2AkvmVPEV2WhekTfRDOkUG0
	m9qA5gy9Q8xTTiWKUbGRYYoYAh8n83oCMcSEXRV8PIel0whaDs7/BV0Izldo8VvjqgRSf3sieep
	v07pD+8mVkBREawqKvEXNkf4yUoH2g0vSnqZrVC0tXRPZTBUHRpWMyTuIXanKKrREchUZvb2sjY
	vf7E3eyDell4bJJwIPf/2TEYVRG71CugbZQ==
X-Google-Smtp-Source: AGHT+IF0Xwlv3Rrf/C03hmGVd0k/7kdYNfMsfW7Jcb6mh78D7QdfCpUt2d6qVO+BaDy74Ko7HCfWgg==
X-Received: by 2002:a05:6402:348e:b0:61c:22bc:b207 with SMTP id 4fb4d7f45d1cf-61c22bcb3c6mr799727a12.0.1755869593007;
        Fri, 22 Aug 2025 06:33:13 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a7577462esm6984160a12.36.2025.08.22.06.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: ti: k3-j721s2: Add default PCI interrup controller address cells
Date: Fri, 22 Aug 2025 15:33:10 +0200
Message-ID: <20250822133309.312189-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=wBmo3kbfIxIyD5dwKOQGVZ3JiT7ZOos1M4ntpCsT3Gk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHGVWUdwHDptTGA7iZdCDsmkuIdKy3wqepGPC
 pE/eGTH/JqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxlQAKCRDBN2bmhouD
 1/MsD/wMWffWNAolAGwnNwVa1nFOJuOBrzvBM7+J2lxF14EKnnzhoffbj1ynFHes38QTRNQt9Fg
 5CqG5wh5hsDzK55ejAqrYcUH8VL59ukHeNR7ocJk9cDJaHHVU2hDRIo+vs/Htf2q8/kyAqqEvn6
 A+y49RYhdtbUUmh24+79Chh5xgG4UDwv2uI1xQ46fMe8ivN3CssmIpkDjjdv716gie0UwSRMqX6
 Z2ZFha/fSk1hD+wzBjxvC3uPnIwbnriOu0UbirFDNQKXGOlLAc4Qp6hm/gxCQHdISimMkeP+u3w
 foHEPu6pz3GfOGyf+2X0ZLrkBKw0B5hlUQoMSKuLlvrm146PI/AtZ3+z27uN6Ov60UP2Dd3ALT1
 ILNAs1tcps4nejlvC5D44+2a+7RbWO2Ki2vzQX3rWJZ7dlxkQ9rW75Em9COPW8w2y+nQ9X3etQZ
 SBrwiW4LtsRyn1VOlt3gvY/teUb8t45zbaM0CXpzp+hXQBX7xwg9KEeiQJJ/R9fiMcwHp1GTZHW
 LtlDALgoFxqR8RLEiJfSeVUjsTpWgg7ZtZSxSLh1NsMDLqbUslj4BZbiUBT8IUxG4P7WLSNLFa7
 ociB55Pln/NEiDm6pbHMRUAViGnfW0KbmIJ+Gu6uhX7rtk2qd/J5iJZIBeJ3eDQ5r6x85eAgVur 8yKAxa/NzFEgsdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063314_781519_11C9B154 
X-CRM114-Status: GOOD (  10.79  )
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

Add missing address-cells 0 to the PCI interrupt node to silence W=1
warning:

  k3-j721s2-main.dtsi:1431.3-1434.29: Warning (interrupt_map): /bus@100000/pcie@2910000:interrupt-map:
    Missing property '#address-cells' in node /bus@100000/pcie@2910000/interrupt-controller, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 726374dc8795..0ad752975acd 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1437,6 +1437,7 @@ pcie1_rc: pcie@2910000 {
 
 		pcie1_intc: interrupt-controller {
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <1>;
 			interrupt-parent = <&gic500>;
 			interrupts = <GIC_SPI 324 IRQ_TYPE_EDGE_RISING>;
-- 
2.48.1


