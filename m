Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A5AC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr1AjOf8uNWev/Vso1mJTfg4siB3r6WSL8vizNNJAl0=; b=gsL/oQIszwIGRaOkdcDdPEUOdU
	hjpOwHuMUHrdVdLUpSbVQpGL4qzjduDpoZOAwfX7Tk26FHIntwZ3GsiD4TL39BGzdBtcThNgo7fwA
	V9oPY1yn07KZWT5RN6iMbIpeNPhUb4wmn0EbdgEfnlWbjb3Iz5/OLJFWV7qZAelkZac61n4HLK49H
	z10PGdK2BecOLY7ocT9M73/k768LdV0uqOEWt84izjsK1ONHWFVNUtKfpQxi5Ow6yi3zWZBtmgt7U
	ExPG0Y1P/H6b6esgE9rvNMsjpQF2/wvx/sVEGBh2weA7Vo2zeN4k8dRxJ9pAbrKJ1+ATWjyClz0l7
	bEUq+oVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mF-00000008GTT-0ByG;
	Tue, 10 Jun 2025 22:49:07 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4IK-00000007sd6-2hVi;
	Tue, 10 Jun 2025 19:06:01 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5290be1aedcso74652e0c.1;
        Tue, 10 Jun 2025 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749582359; x=1750187159; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr1AjOf8uNWev/Vso1mJTfg4siB3r6WSL8vizNNJAl0=;
        b=fCkmyMESbpOgdVDlG68d6Iy7LKOFfLvnIEhirTyI0gRTc/3SSZvi8H1NFifove4C6k
         tEJsOBE0HW41Q47xTlsmqxHGkCi8nu6xzrg6jHNNdCKRSfsRw0MnAmoEzJWKxy3Uo7PM
         lzc6TLmV9Dy/gS6ueXfPKf0L5V8RTB/RZuN6njbglHrbG1i5LkecdeNuTH/8MuUSfsdE
         ooOpbUEKOt5NU5/FV+8guCbVOWk6Tv8N9o23EVdUjGGEJMWBRx5DENLuIrkgTTVqf7yW
         KF/BaRUPRi3fknXP32SXSIUuUs2QoHcz+BAvJmcQqR6h6WAoTwK75iAmlsq8Hu4BPvEq
         2czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749582359; x=1750187159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jr1AjOf8uNWev/Vso1mJTfg4siB3r6WSL8vizNNJAl0=;
        b=kWFlJ1GzUxueGBVxagiLa+s8XUnUxEWKoKMW4e/XqkXhNL14IhRv6PsuGv+SxnfAV4
         d6O9ktp2v3dQWgZ9ZuRrkyExEgz0BXKelgvITQ6iDUsC04QhcmcG64kudVPtT2qgmL09
         D7kdhyBAmQVyBOiphRovDqJ3LmEwXDsfk7RkXL+8rhZRpl+34WG6svp7/lV8ZNtcYHmI
         EwUWHHXpTP/QJVxC6aS0sIGE6t0q/2UceoNwsAv2F9qJ+qqueVxReft7RXcq1aorBXjU
         eO5etsThaytcY4ScEQPe1yeO5lMDWIJRTZrIJS5dioflZ66/nKClZH54JEN06ZVCVuEn
         D9QA==
X-Forwarded-Encrypted: i=1; AJvYcCVmV83fVyjucfSRBXAdQkmRNTxFZYe8n2suMjtjJtoj58M6FW6pXDddyGvakZCPa9cnpjUS80dBImHX+131xa7h@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+H34mC8rpjMvsMmgB1c2ws7AuB+wqhRoDimWVwTriprFnjS3e
	J/9Dk/UesB7Rwq6UxM1gTo2Vbw+H0Q0L4u+suM9kT0efTJggn1bKqdq0OJtACo7l
X-Gm-Gg: ASbGnctD2S2vqyhXeRtEZApMwVT4NcR4SMA4vsK7yIztWc9lQsxEqOR6vuvDJS9JxbQ
	3bUccEUuF80Usc/kUhdMz1dv4gJ78gLx6t+08ARwC5BnlPJx0krDvYLno6wOZY7K7UU0t4vsF3D
	OUaXfXaeWlwHwn3l+8Ku8oYP0YTpFCso59PBP/OHDifaMV9EMniAuUjDI5ln54LS0Lmcykfrl0F
	MgdudWu/UWNLZKFdt6vRUYEan6LNgBED1emwNGrC3zweW2r6Ryhbr+7XzmVpGSEmxpjA5riFrUr
	pHtdXzopxrn7aq93M3OHc7j8tE/5Rt+vGSQLDsJBuG24P4ONVg==
X-Google-Smtp-Source: AGHT+IH2IvnJ2xHYlgG47unoTFtLmp+tlD5s81mKKw/vojOHwwvxSAlVW6+jhlxIIXwUuHLnOOd9YQ==
X-Received: by 2002:a05:6122:4598:b0:530:2c65:5bb8 with SMTP id 71dfb90a1353d-53121d524f0mr1060751e0c.1.1749582359532;
        Tue, 10 Jun 2025 12:05:59 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5a56::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113bf5a61sm1854439e0c.25.2025.06.10.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:05:59 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:05:53 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 3/3] arm64: dts: rockchip: drop PCIe 3v3 always-on and
 boot-on
Message-ID: <da144ba62607c87bf89a71ecb12fa5055f1e6fde.1749582046.git.geraldogabriel@gmail.com>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749582046.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_120600_674891_3E4A5ACC 
X-CRM114-Status: GOOD (  11.01  )
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

Example commit of needed dropping of regulator always-on/boot-on
declarations to make sure quirky devices known to not be working
on RK3399 are able to enumerate on second try without
assertion/deassertion of PERST# in-band PCIe reset signal.

One example only, to avoid patch-bomb.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index 8ce7cee92af0..d31fd3d34cda 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -25,8 +25,6 @@ vcc3v3_pcie: regulator-vcc-pcie {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_pwr>;
 		regulator-name = "vcc3v3_pcie";
-		regulator-always-on;
-		regulator-boot-on;
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-- 
2.49.0


