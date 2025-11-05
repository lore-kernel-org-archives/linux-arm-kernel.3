Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31608CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 05:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fwi0DrEUoNTIOaZJZRTu2PMBRWvJKCPWH2oh77N1gps=; b=IN9d2H/eE+L9njEbHzw2XruA+u
	vWGWuzICKhhhd7wguZ7dzcAR2QmQfnTgwlVu2XB2rcAhNHkESrLv2nZJJsXoCP5HiLRNU6m87yr/h
	lN5F95bXONqode71rEF7HnV/84g8ZNQe4gyPmKX2wjCV11D8IZxFWO5HW2h2GHJzmicfw+QdwqNVI
	TiXiTpwJXmdPqGzEcVgmdmN1qMICz3tSeotIobAo22MwebCCW7EqSvrLLcSqxbpKVgeFFMjq9EnwI
	0gK0V2TpAXnvaVonUJ3OqUjZXo62a2zrjoTOuXrGZaZcSXaDaqRc+mADMTVWBdJtjMERIGHpkwkFj
	ltkjYFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGWUS-0000000D3NJ-0QVY;
	Wed, 05 Nov 2025 05:55:28 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGWUP-0000000D3Le-2vRm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 05:55:26 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7c6d3676455so141340a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 21:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762322124; x=1762926924; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fwi0DrEUoNTIOaZJZRTu2PMBRWvJKCPWH2oh77N1gps=;
        b=hgroCtjiNMsWlQcjaJMV4VKc3iY7mpXdAlZrf7zMJeBFV88Sr50MEsuH1QEQqh8m8v
         XWxTPn1JU4G8jX/4dN5oj1sFOhl3XK+yFM8CcsL2lo265ioEsJ9zXmuIaUgitUtgls1a
         7vsnyzgljf4fBgZNxhLCbt5bcixdV4sMe1L0t/uGE/OD/va9LZ9MiLhAJCNrGs0wtB6k
         QNZaavm9z0vpeS2Yg6BEWxDIgw4zqcTsoveh6iR7LXAu7JA/z8UXlCVjouVaqrSJYG8B
         4WC2aHOsgGS8gv3+WQpjz5poUFHnt4oawz7qKfxBEh8sfMFlrjmyslWjFVeXLHPXvg4Z
         lp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762322124; x=1762926924;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwi0DrEUoNTIOaZJZRTu2PMBRWvJKCPWH2oh77N1gps=;
        b=cEnMq7ReP/VorDXz1xQMiA2i0iX7xZqN1jMkN69+plStA3EgRmatILOEgeRh5R8gtL
         KfyXjQT/oTGRQ3uc9QI4GAF8XfxcqX9VfnnDeW/Ezy8u9O+t9BvFWFIDJD79BIsHUDoe
         ESmqiVtMIX7kSFE9j8FB3zoLPT9sbKiqiVBUoB+w26dfH5rh692z/NyFGtrT0N0lFbKK
         Qs5hn7teaTu8wZItyKqFW+5f3pEi0QWOxnwneQgwVZBg7vYlE6g0OXR2rH7+rb3FMEk1
         OQgxRV46AUiR8ionyqtgAe0ieVp1QlSkzN0lt3u8/ZrllGXym/gfu7PFTqKBU+uC2n/g
         nyHw==
X-Forwarded-Encrypted: i=1; AJvYcCU0sOYN9mnFYZ87ch9nHYaCS6SHwLnu4sbpKEvGQQrh5LCFhZO1X0G47O8cudSoBhsBNNiTdT8uM2EFF+xgUhqf@lists.infradead.org
X-Gm-Message-State: AOJu0YyhXJUpDPl/nPp0vK25Fc15hu/4zFoUAJUUlbDRTtKO/qAhdnNB
	d/vtXUGgGp04x+7AlfqgRmipk35BoSVYodZuxkjIrIZVwR8C8P2tMQsp
X-Gm-Gg: ASbGncuBlmIyhBWvQjCQHDyapStFaK4ownRJAEiKendPs7e21KZnV+rqk8UHPygKc1T
	nUjHWxgZHU/Mu5bV+Q6IypUkG/KV3PUoTsrj3CtQqj62g3cKIcJyydbJnwTuJrvqZCdfZz9tC7C
	qNSa5O0JbJPCAnU98da3Cn6PMiUdza/wc/95tV4SfEDZgcTbAjdws5ooBdpYs/VOlWYqGhnFsKM
	H/plyv/DgIdofjkiKlkPRWsj3NBWlJUTNfILKE7gKzdHItw1BnAOOrqaSXNtc89Wr9mG2T15JUa
	DDQEEEv0LT1rpm5pa+PavUzhH5oZgLjY/S5tXgIOrvhZQZT8sqffC5//oTIirBgfiPJ/AxFWFpX
	jZ1AMXLfvmdUUJTlIKzTJOOScrOVNNg+6htdUMxBumgcbXtxrQMwmUMNBiC8xiUs=
X-Google-Smtp-Source: AGHT+IFEVR0qbygzze5iBfiTi1hOIxTOUWBa+aFthKdgTb9tcWOqhz0feyJ/iBoBrEyZdPQs0msfOg==
X-Received: by 2002:a05:6830:63cb:b0:79e:69fa:6bcb with SMTP id 46e09a7af769-7c6d140f2e0mr1585902a34.13.1762322124566;
        Tue, 04 Nov 2025 21:55:24 -0800 (PST)
Received: from geday ([2804:7f2:800b:2cb7::dead:c001])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c6c2448c76sm1714476a34.2.2025.11.04.21.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:55:23 -0800 (PST)
Date: Wed, 5 Nov 2025 02:55:10 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_215525_759465_EC167536 
X-CRM114-Status: GOOD (  13.64  )
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

The PERST# side-band signal is defined by PCIe spec as an open-drain
active-low signal that depends on a pull-up resistor to keep the
signal high when deasserted. Align bindings to the spec.

Note that the relevant driver hacks the active-low signal as
active-high and switches the normal polarity of PERST#
assertion/deassertion, 1 and 0 in that order, and instead uses
0 to signal low (assertion) and 1 to signal deassertion.

Incidentally, this change makes hardware that refused to work
with the Rockchip-IP PCIe core working for me, which was the
object of many fool's errands.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index aa70776e898a..8dcb03708145 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -383,9 +383,9 @@ &pcie_phy {
 };
 
 &pcie0 {
-	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+	ep-gpios = <&gpio0 RK_PB4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	num-lanes = <4>;
-	pinctrl-0 = <&pcie_clkreqnb_cpm>;
+	pinctrl-0 = <&pcie_clkreqnb_cpm>, <&pcie_perst>;
 	pinctrl-names = "default";
 	vpcie0v9-supply = <&vcca_0v9>;	/* VCC_0V9_S0 */
 	vpcie1v8-supply = <&vcca_1v8>;	/* VCC_1V8_S0 */
@@ -408,6 +408,10 @@ pcie {
 		pcie_pwr: pcie-pwr {
 			rockchip,pins = <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
+		pcie_perst: pcie-perst {
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
 	};
 
 	pmic {
-- 
2.49.0


