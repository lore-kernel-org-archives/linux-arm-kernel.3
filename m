Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8659CCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FztTc2k5M11TsDtaJ8wrSSkPXnje8lRDmvN72GDsbxs=; b=dLD9UttfeJvar8e1ppGZ3qkRea
	cWUlNlpGh0+MzhjERi33bqVsEOGKpYmnqffKiI8nEVpIrNYiJJ8Pq9nULffkNM2LoOh+p2hmykCwv
	EaBI/2mXIISgkS010WzqTDLa2gdaJMf+lreZTCrQeSLXLZKdjC2yRfZn/58tft/Tp8kA8Xmj05dWA
	e7hohxF9QXBAtoDoZNaz/iPxyw2a1aGhcwcHRWIBZ4piDo3KSsvTkNnWbW5jR8pQ2bwbaVCmJA3TI
	SkHcX5yrm8t5DgYdkkp65seqhPawc+3OjZa1Bf+Pt/01VpiH4Ds81urSXBY5amTa2IkIM58HMvQPu
	dH+B6uMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74k-0000000Gtru-2YPh;
	Mon, 17 Nov 2025 21:47:54 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74i-0000000Gtqg-216W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:47:53 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7c75b829eb6so1289071a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763416071; x=1764020871; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FztTc2k5M11TsDtaJ8wrSSkPXnje8lRDmvN72GDsbxs=;
        b=LMgaEiD+Qf3FTWcFXgZ/4dM/khVEKP6Drc7T951TuEZehuY5BpdlF+kxDZTVsgN3IL
         LzgD4VCVpJtxq2d+5w0rDgB847lik8GwTRxY2q0MDucUQJDT/KpN34mjPChp9a+Gda2G
         B+0sPK+oEvbS4k1PrIU5SDfsggJ6agZmww3B+LmODie/hUjANRTtT8wuF3x8C2Wj/lEo
         L+OWQgWtrBknR7aZSzjBNjnJe/dZ8/A4co5+n0P+gkePeXScrXtwsvxjKf+80Kfq/xxN
         OggLofe8Ma0QSrKDSY82dY97N+ozuadSJcQW808Gq6N2O3u5an4fOpYgQNPIP5cgq5Ov
         7+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763416071; x=1764020871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FztTc2k5M11TsDtaJ8wrSSkPXnje8lRDmvN72GDsbxs=;
        b=tPCKrJ5sVnlhQnTdSmu775j6pViYI84otO4yUpJwyndCVuiDaxbeJZayA3HYu1kw58
         q0dyoIK8skAbcIKLngnkuI04Z4liZpnbrDi/h/Yeacs4Q4TsFQ4DjAClycPcCPoG8RWj
         sXLfE4lzU2q0xw/jbWaI1J1n68/iCo4LvnNoihZaStdzkQVat0eu81BD9ComBCpAuM+O
         C7a1fNuyrPNsOmEQ3TsprKp8cX6SJ4mKCWa+pvFtsI66u1n7dFqHmOdB2cvXXV5bqBa/
         GMf3Cl5gsXawreA4LKATPctIJsa7wguvbe8UPPB9477J3INCa2wTzSBZJBW/M/nnLLB8
         FKBg==
X-Forwarded-Encrypted: i=1; AJvYcCUW3LvSPFjkBCt9wZTSN/cFFHFxAN8oIxxcUp/lMNKx/sqDYsQDxKnNWbk/sxW8iJrm7niRnDqDrGoi8m7/U6rl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw9y7lG8cY41y4oM4h9LkEqCH0yPOjFDoWU/L1H8h2LF184wrC
	A/ToFHjd41H3/yRCkBn1eMYWFy9bKMNaGpQlF+VH5xMXRd3DLhAyj5IF
X-Gm-Gg: ASbGncsXHdi/Of3btfsQK8rycwypcsH1FEegqiQJ5Cw56+nluMAr/2ft6Bcov/+D46X
	chVhiBoWvR3nX67YJRdvtgjvVDY+PPfbRZglN3zqk9RMGge8zo9BUWybrQrAPQwL0+yXI+UcwjW
	DaxvvEBVnHZS9Zrsy08KUxKj0h/L/+Lvj6DKv1AuumDB0D8Cxp03pDdyEXsY5/f6UzKeZWf1CE6
	jrxTg2+41fyaoI6RpiLig7BhMC0eY/N/eWtn4R9YLE2OvY0K1JJ/2EzjZ4/oCO4ryCp2iG5p+FN
	SO0DVJVhzdYQOh/8FwYHeEwuGsQS2zPZWI+4c7d9+C7Kf6F1nzkozc+NVI80d4VV2dCmMoEB3U9
	LG9eGS6C/tG+MMRmdaWeBqRi5rcILzZv/sjK8jCy453NbC7SByOAHt53bhVt/n3cLPw3AKtHsyg
	==
X-Google-Smtp-Source: AGHT+IGMYVYdHBolX/z6M9K3TLoZVSU9KkaoXZJ5KYuYSaivd49NkYuXdvP0LyKiiZfq9uKzciAXCQ==
X-Received: by 2002:a05:6808:3a18:b0:44f:6d70:45af with SMTP id 5614622812f47-4509738e814mr6476179b6e.9.1763416071337;
        Mon, 17 Nov 2025 13:47:51 -0800 (PST)
Received: from geday ([2804:7f2:800b:a807::dead:c001])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e8522b268fsm6350105fac.18.2025.11.17.13.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 13:47:50 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:43 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: rockchip: remove dangerous max-link-speed
 from helios64
Message-ID: <43bb639c120f599106fca2deee6c6599b2692c5c.1763415706.git.geraldogabriel@gmail.com>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763415705.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_134752_521010_8872C92B 
X-CRM114-Status: GOOD (  12.77  )
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

Shawn Lin from Rockchip strongly discourages attempts to use their
RK3399 PCIe core at 5.0 GT/s speed, citing concerns about catastrophic
failures that may happen. Even if the odds are low, drop from last user
of this non-default property for the RK3399 platform, helios64 board
dts.

Fixes: 755fff528b1b ("arm64: dts: rockchip: add variables for pcie completion to helios64")
Link: https://lore.kernel.org/all/e8524bf8-a90c-423f-8a58-9ef05a3db1dd@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index e7d4a2f9a95e..78a7775c3b22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -424,7 +424,6 @@ &pcie_phy {
 
 &pcie0 {
 	ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
-	max-link-speed = <2>;
 	num-lanes = <2>;
 	pinctrl-names = "default";
 	status = "okay";
-- 
2.49.0


