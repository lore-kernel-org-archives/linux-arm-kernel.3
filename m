Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1877DEDEBED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BB0QVBpGQ94Lw9CGC203QszMp5Otiswv82HpkthV6hY=; b=ZsxIu+tTN2HyKOjOg2LMvgTyr6
	NKUZLA7+/zSz4ILr9uSOxuViwxUyHHFht/25fhIwxp2YCljBWXX6OUJnplXIshF7cDxo3FfnpXS7p
	CbAwyLLnIpXMVHRdBeRJBoCbNe5zdW+0GLXpKsMKc5u6TYonRjlb62YPEzMoQG2Y6G7nWj/3RVkc6
	WCbbfPRPr5vDmn+iW7o25qSI21wxdW8hPDWs00amiTbEi+awigY6TNZq0wtQms5cpK3KNNN0aoWC5
	rq8t82lxBmdvZArlMkyypOQ7XdpxBi6SHFFw+FF6E+V4itdEwkdAAkXfGl23ddpx8hsWbWB/lBu0l
	SzJlxPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVaL-0000000Fosk-1jpn;
	Tue, 03 Mar 2026 19:39:13 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVaI-0000000Foqo-061A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 19:39:12 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-56a8da2faf4so4944851e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 11:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772566748; x=1773171548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BB0QVBpGQ94Lw9CGC203QszMp5Otiswv82HpkthV6hY=;
        b=JkEWeqVdu8qS+xKVS037MCU5Mjylo8LZl0EGXsSV2/bvsnJ5lwsh1R8cmRTuZpnSVD
         zV7oinHMZx6C0/NzRGdwebktBoAWpe4rdnF3akV94Qqhh3oGZ0jJl8PVsIMigsOFmF4u
         /9Eo+S4C7C/tMbVGOj+iDPoIP3FHmwxOjXZCKmjbI4lHof/8AhEXgyUpxqVeB/YMsmz1
         9yzJk9eg9MsC5uJkIf/CqKUzYJEMoILxWWjeYyDgK+GxWEwA620tBlR7glhqZG//83sq
         +FWuVsphHH+cWDBTsmVZSpA5qLQMTanqz79aWfGGq4rkVAnky7aBwtsINSvunPwL2PTX
         1kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772566748; x=1773171548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB0QVBpGQ94Lw9CGC203QszMp5Otiswv82HpkthV6hY=;
        b=PMK6KP1QkyWEdkjkXTsborOvFzPaDjraLjbujbUtQtqsCZ0iUZsbzSspKWORFtv6St
         3H8qyKku+uxukE2jaXxjkIV8SfWjTXoKs5+MKkrz9XZyCXVA43gbIGtuwVTeTkCYg5gv
         uLNHPXznJwoQyBcA5edO1HcDWIJMlBqxW+Qz0iVOONAbQHHyH0IPr49X2y2FSC6rcfWk
         bjuY5KpOmMnoaB4DY0NwdvzaGOjkmzfa2CzxJDfDmCxujEqWhYadDhKRm2RIffs0xTC7
         aIKyRjtirw7KMfO14Ye7B7yRKLexu7X5zesc/1zYUGcrSoDN0/R6iMiozbJmJI6KUeYD
         7X1A==
X-Forwarded-Encrypted: i=1; AJvYcCUSRRSxmiKj7CNZP4EYUMYdGULpKb8h0uQhGQCulE5ledKB8E6RyH0Qnwv7DUbpVDXFb067awAte4dzjKa1YeUo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2nfr4lPkP9zP/2BhmiSSqgtDRXSh8sLErfx4e3xSGKdCkvlQO
	QmheiL1XffUkYwxDLid+3fas9VUq3ekFt2u2qo91faazE4wE2hHEKlqFumnO4w==
X-Gm-Gg: ATEYQzzWljflUPiqlLWXbHh5HNybJ+AtUjmbIGXEsA2M7va30rqsY6iauRemCHdp3uC
	fWYAvF/EsIzG3YoXTz+7+S3kFo0C5q+TCTLf6u6hSuHjldpCC0MRwiW+xntqHb3bwbJ50SoOBFC
	6RvEGvwSaFdO4wK6ipY6wkGrhloQthLR164h8fCmUnuQKh0pyjFXaV1cpwobLhhvFqCSZNsiCIK
	GKWLE8pabHT+fdmLZran56WWGnu6HXyGEkGjnYpuxNW8yhYbYyPaPls3RHi8Llx2G8xc+jmMkjY
	7P8Gm6MiBhhRhw5y5wbZS7+BHUWY1UmJFG4xO1dAfmfVLtLINnnd51IhoJMc8/YavKbbmcGhDfu
	Stcce6s98Wqxu/SMycK8X9fd6FbxUHg9vybQnvBTFRRpOaDO2wFad6X8KsSxVM98soKR/ixoHJs
	q0wHdWOrxWXc8Vtf1JC2eYMsGZy4HARj6dCPehpXgJ68pxctqh3X0rUeZkVt/zPMksZdUw
X-Received: by 2002:a05:6102:304d:b0:5fc:2b29:afee with SMTP id ada2fe7eead31-5ff3237e661mr8739890137.18.1772566748110;
        Tue, 03 Mar 2026 11:39:08 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:499e:12bf:3287:5753])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7af30asm17780456137.3.2026.03.03.11.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 11:39:07 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] ARM: dts: rockchip: Describe the touchscreen interrupt on rk3288-phycore-rdk
Date: Tue,  3 Mar 2026 16:38:53 -0300
Message-Id: <20260303193855.828892-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_113910_066662_7D6DD88B 
X-CRM114-Status: GOOD (  11.19  )
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

According to the phyCORE - RK3288 Hardware Manual, GPIO5_B4 corresponds to
the touchscreen interrupt line:

https://www.phytec.eu/fileadmin/legacy/downloads/Manuals/L-826e_1.pdf

Describe it to improve the devicetree representation.

This fixes the following dt-schema warning:

	'interrupts' is a required property
	'interrupts-extended' is a required property

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
index a878a2632de0..fb2f585caba2 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
@@ -86,6 +86,10 @@ &i2c1 {
 	touchscreen@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_irq_pin>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <RK_PB4 IRQ_TYPE_EDGE_FALLING>;
 	};
 
 	adc@64 {
@@ -199,7 +203,7 @@ sdmmc_pwr: sdmmc-pwr {
 
 	touchscreen {
 		ts_irq_pin: ts-irq-pin {
-			rockchip,pins = <5 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <5 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
 
-- 
2.34.1


