Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E887CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzLI87gVSsw12bcRQHm4zXKzF2cdEbYasj1bN4s+jM0=; b=FYlwLTNA1KORd5bzBXF2IFkKwU
	cN1XJztv7inKx8J1bccDboOwRHroT75G/F6npnv+R9ADewGRjlmGJ9GqDLLEfZf2HZ2p1ZJsx16AL
	h8t9iW0GKhk8RT+GeCjJk+5eEPfpsbrgavykSiFwTE5yyL1mSi8eTT1XSK2nvfkA9+ng2pw5gvpmC
	RUjtUKGmfUgF9BaAbYm83DpFaHcnkfoAG9zn77EWAfGRkihaeEE/bO1mBZlfMJ1EVveUQUTnH54iK
	GYXT6d3HKeM1Ux2z/ykxd5/nqmyTsJlYMSmdZD/esPqvYP9gmQjnRrPhjDREPO7CyX08XQFZXP12v
	1REuL9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLnh-0000000A8Ps-1xSF;
	Fri, 24 Oct 2025 17:42:05 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLnf-0000000A8P1-0w21
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 17:42:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b6d402422c2so536598466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761327721; x=1761932521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bzLI87gVSsw12bcRQHm4zXKzF2cdEbYasj1bN4s+jM0=;
        b=YtxSTEvbSyYxIIVxz2DILE9RStJcljDPr9WpCLtNJadWtrwjdeiPvYukwmbYsN6ynU
         tlkcmEjYPQOr4CYDtwXSlEoUCdL1ssxUi0hg5O019zG6+fmqOfaO+Ru0WwEX4yrZ1der
         OW/j2zdUvJ9VWBAK7rYQlrDsuARs3ieqIgQtF+EiB6HjTHPv1VR5BFQ/ZV9EiGqFsmh0
         2A2xqlvjdRtR2IxV0YTuDqaWiVFSb6/Wvv+m0DUBS4xmMwzENILDxxlgTWYyzrOVVU8V
         RXAzAXmFTVtkE70HgX4WGU2Vw0UYDGCgtD4bExJ+OXKc1xQsWH5gZMOef4c0hkaysL4/
         wVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761327721; x=1761932521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzLI87gVSsw12bcRQHm4zXKzF2cdEbYasj1bN4s+jM0=;
        b=e6NN+ZGD03zzy8/awAMAuRjAB83jNpi+8MkkJN819m9F2ypSaN7CsH/nJvBDhr/dt8
         TQuRsot6N1GwNjVmWk3W+QXi2LAhtroBP2rV3YZUi8J1WZ2E0TKzv8NhkG6LClLvHMx+
         YtY4OkYO/YM9iY9du4VRrryJtOaDfN53fKm8sayR/zHBWiN6VM0KfWiAIjfjbLnTdshH
         0SEfJpVAsHHhh+Y/79q9pXtPhXlW6KKkB163nFpas96vWhWmMvV7mBpAqZiTl4RA5xZS
         goQrPw4ZSiqPQk5OUMLv2feEwrpzIiCchdiBCWcMz2emnboEnZv4z9m4uOJJqUwJp04o
         rQXg==
X-Forwarded-Encrypted: i=1; AJvYcCW43DwPBJffXXepEikBR8HrgAsQbVgcbF42qsdtqYSaOcAqvUS6fIDH1t1O59k/+/umeTzQlN1Y7oa5DXsHYeuq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8MVnxc0Hs0MIEH7fR96GAil6C7UvI1c/FZZzi6zNORPeJQOVk
	rfHsRrQNQKybicUTea0GWr44NYGftqDLqgU1wQMQunCE4WzWHygdyJR9
X-Gm-Gg: ASbGncs24wQClFTPoINpsDAFpE3/6l3V3LGEh77tR5ym4xNn7kaVB6jMepoLtDkgMWn
	N8iUQ4QjsWpT5kNIrG7qWhEnAn/IaDAAXylw+1TWL/bn27hEy9lVdboZMTt4MTZPtovUNgTI+kI
	UiHIeLH6T8pfl9adzbENytaTHFzv46WLTpdSNJn88dFFGwAfVzydjiUoukSEFuw4dyQw+mtbp5p
	CByvbtE9kowvMKwnmRFphduP9IKrMkcATTIjdLWizQEGKnduwAnvQLnSYLcA7T7RJu9irdHK8tM
	ukZJZBmIG7oz5l3/j2Bipqf6YDuupHtzSCNB8ct8jgA0/aaXPS7Wxw97lqAGlRBD3jYnk8/ExUU
	XRbAr9pbOb5F+fwo2II7if9koD46LsqK1IC5jdD1FeEAgKWbOtLfPb/SrSK5O1OO90xUGYhWtER
	l3xRzhH1ArJt2PLl/TbgOZVy5x670wDyhMGScBh12vWxScRAfHfm/hIiUZd9Q=
X-Google-Smtp-Source: AGHT+IGsywe6fvei+hAvPha34NkEyxNo/q2u1ZRQacwWPUUZaTx/YX5nzymYXv40loyt4fMWa8J9Eg==
X-Received: by 2002:a17:906:fe45:b0:b60:d888:32d9 with SMTP id a640c23a62f3a-b6471d45a8cmr3700021066b.11.1761327720554;
        Fri, 24 Oct 2025 10:42:00 -0700 (PDT)
Received: from alina-IdeaPad-Gaming-3-15ARH05.. (pool185-5-252-158.as6723.net. [185.5.252.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5130d517sm586822666b.3.2025.10.24.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:42:00 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
Date: Fri, 24 Oct 2025 20:38:20 +0300
Message-ID: <20251024173830.49211-1-xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_104203_258620_C2F9350A 
X-CRM114-Status: GOOD (  11.67  )
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

The vcc3v3_pcie20 fixed regulator powers the PCIe device-side 3.3V
rail for pcie2x1l2 via vpcie3v3-supply. The DTS mistakenly set its
regulator-min/max-microvolt to 1800000. Correct both to 3300000
to match the rail name, the PCIe/M.2 power requirement, and the
actual hardware wiring on Orange Pi 5.

Signed-off-by: Mykola Kvach <xakep.amatop@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
index ad6d04793b0a..83b9b6645a1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
@@ -14,8 +14,8 @@ vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
 		gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vcc3v3_pcie20";
 		regulator-boot-on;
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <50000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
-- 
2.43.0


