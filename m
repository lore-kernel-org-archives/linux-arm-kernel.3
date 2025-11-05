Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91324CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/N5rROtcnxc6d5f0IUPrUWxw9x/K7/M9hcGw0GwgYE=; b=zcIHxu2zR2kp7Nypc53WFgPduI
	Z+VlSQIGIu32TCej9xZPMCAaojxRdLFKspvCOZdz3ZNMgOejYUnS60Dv8D0+1q0QLP1ev8BhhrYfG
	Kx6ELA9cYpHp9v6iLxXLh+oQ40VmCWgO/tbqK85D8epFbnTpRnGsIDU9CL27kkwnVI3vFBAXKfclm
	Yd/VLNkC3Q2jubTUKb6Llq8++kjqyImQfvnFSHjg4g6VRLDsIqNi0/Fce7cZJ/FGX9K8D7SM2z2ZP
	XnzEEX+gvTuG37Fuo6uywC7MsMAujDf4rdiRdLE9+R6oF043o3zhjVUxN+GpYXM2Ve3z8h1S7sD7z
	3Lej9IdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkjz-0000000ESm9-2L2j;
	Wed, 05 Nov 2025 21:08:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkjw-0000000ESio-2yHw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:08:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b5a8184144dso34485966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 13:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762376902; x=1762981702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4/N5rROtcnxc6d5f0IUPrUWxw9x/K7/M9hcGw0GwgYE=;
        b=ezpn6I52yd/QnaXBR7R7+7kiIavPpI4Z6GiqBe8xIGocZKDUHIsxkcPHnyuCC5fOOm
         kzErvxQi1JaPi3NbVaGMOjcQqymRhAhO+FgYD/gTztubC8mn7ILcqr/ehaAcePkZcQcE
         j6tKSNPl3BEhqDEV2tvt8cNujIT3tSMzVQWN9qV/aI3eEen4gK1m9/Sln+jacdoLNzBX
         eROexM4hJmlmsZedTq+hpEVl/+b2b2c3QLRf7Og2TGReLPt0/1fTbSdTdRf19Nw6a88L
         sZS+JoCGOmQ4x5EyoVD2tSwwMOtbmFIDqkdRC5+Bzaq7bib3yhoNrKfE814B+V9O+5cv
         rZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762376902; x=1762981702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/N5rROtcnxc6d5f0IUPrUWxw9x/K7/M9hcGw0GwgYE=;
        b=o2VksEiIy0G7Ps49mCUOZyFFNUUjyLMaHubV21z+jqW7p7JixQAEPy78MNfqouqlQn
         DWQh22/hKBff+qGv2WzPy0e/Q0c9i15qJL31RBXjMhr90/Fjg473HdKK5MvfpUzATm7J
         ur1nYRMtIwM/WivgwuIcHIU0zImjLsecQPGy4hUiEfYyP3vx8ctwi5iO2Rrd6/SAQTBV
         NXeEuehLjC1MJS2ZJj8Y+2xXPY+kXB/1Hp/fmn2MMc0NdrYUkHDnQDRK/6LeNO5z5OzS
         sdu8NIPNaj69Cu+jhyl4+z/JaGuTsS0NJoDgVTIOistYvfRvp8kiXusJaqvBqrCGocxL
         ROQg==
X-Forwarded-Encrypted: i=1; AJvYcCXYhbYIRZ5hZKhs0MU6dPrUVz+L3OjUJhKizvvOD4UQdImAe8CdeWKp+JrsMdQTVbPqUepi47TxTq+ngvZAlsFz@lists.infradead.org
X-Gm-Message-State: AOJu0YzglN7DdBvFhsjd7AQ3m3CB2mYHbvQvcV8hBB/N/lJDCSXMW9eL
	4R7lpBqrTUlA4kpwnmu3YGFAg/7j1T1SOtpjfKpD0BX98FqsdvPD7YHU
X-Gm-Gg: ASbGncti19aDWPeuvMUFnOb/5O61lShju5UvIsVhRzwZlpS5XDSxvC4sr8D0RSQLpcm
	TS1tw9OksWoeaxVFFRnDWIQI4JDf9MFeKgrNHwqZXmNqLmJcPHzziJwWL+P7N3k29oQvT6NglU5
	CxiVn/pRa9I6JQLfrf/EIrYpuMKmsi6GsmK65VJ2N9N+tRyoDl0D0J16v/hSbovIHezJ1VfKknL
	PCkRyZPT7ztRZX5xSBJ/ULfz0nzSqnum5Hk+2mq9cf99XMBB3eoMs627ld3xoMZYSfLboDsFTDp
	tqaQGnqsJTno3cYc1SKquitrZl1Y3oXmf2qR5g0CQVdp0Vvl3Q5PPQW/Kmo/yokThZ8r7Zqv4ne
	/9j5wvc2LKH9/yI1HyBYE6snepz/Oph5qszWxkrR/F01lKp5rJNA5qpWJlPqV43pK9P7gSBnHil
	RNTWQzAEE9wb/k91A9b9YXub1jnHT8nlhuBghisipbH79eNg==
X-Google-Smtp-Source: AGHT+IEQN8LEBzg2FibdPs1zW7myIBbg1Dg3RX0BLIHipmkT0F6MtRX6Fdv53CQhOLloh0SQE8k81g==
X-Received: by 2002:a17:907:968c:b0:b72:5983:db0a with SMTP id a640c23a62f3a-b7265297e0amr437027566b.15.1762376902297;
        Wed, 05 Nov 2025 13:08:22 -0800 (PST)
Received: from HomePC (89-67-214-154.dynamic.play.pl. [89.67.214.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728937cc8dsm54005766b.17.2025.11.05.13.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:08:21 -0800 (PST)
From: Andrey Leonchikov <andreil499@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Andrey Leonchikov <andreil499@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Subject: [PATCH] arm64: dts: rockchip: Fix USB power enable pin for BTT CB2 and Pi2
Date: Wed,  5 Nov 2025 22:07:33 +0100
Message-ID: <20251105210741.850031-1-andreil499@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_130824_810885_65BB0D08 
X-CRM114-Status: GOOD (  11.46  )
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


 Fix typo into regulator GPIO definition. With current
 definition - USB powered off. Valid definition can be found on "pinctrl"
 section:
 		vcc5v0_usb2t_en: vcc5v0-usb2t-en {
 				rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
 				 		};

 		vcc5v0_usb2b_en: vcc5v0-usb2b-en {
 			rockchip,pins = <4 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};

Fixes: bfbc663d2733a ("arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2")
Signed-off-by: Andrey Leonchikov <andreil499@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index f74590af7e33..b6cf03a7ba66 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -187,7 +187,7 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 	vcc5v0_usb2b: regulator-vcc5v0-usb2b {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&vcc5v0_usb2b_en>;
 		regulator-name = "vcc5v0_usb2b";
@@ -199,7 +199,7 @@ vcc5v0_usb2b: regulator-vcc5v0-usb2b {
 	vcc5v0_usb2t: regulator-vcc5v0-usb2t {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&vcc5v0_usb2t_en>;
 		regulator-name = "vcc5v0_usb2t";
-- 
2.51.0


