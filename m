Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6848EDEBEE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpAqgqnxsYIXlo7xalO5qgaLwP1g0ilpL3ajza9+KEE=; b=bT7pc2Z1SZtogewsZRywa9M69E
	z+VqPOe9BkOcctB4NZuV9ss69qpQdOZNwV4OM9iliaSaiCTvgdA5zD2FzM2wosDmjcmSD+urjhL27
	mWy79shV6K5ylmSo2nJ4rZ6cBFJddX/xsy/qZMvIK7Gjvg7pRFynBs+SxLYydghaWdXuQM8qx40QF
	pNbV3JIIktxPBGt9s/3FSuafLG3KoK+ErO47TcJp3QHqsdFZN3uzGhIGgIfgytu9gATJ3eleO/zKx
	cePMSz1OqdqaG52JdU9npGbfYm5LOVLVlkRm2pPCQlwlN/F8yRg+Sf4y6HNVaTzLZcrha677zjYtK
	lClFA2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVaM-0000000FotR-3rbQ;
	Tue, 03 Mar 2026 19:39:14 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVaK-0000000Forx-3diS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 19:39:13 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-5ff9ef0a426so160419137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 11:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772566751; x=1773171551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpAqgqnxsYIXlo7xalO5qgaLwP1g0ilpL3ajza9+KEE=;
        b=AcHoe5Vpw1KRX9iakLVy0yZRAKtIH2QLLE8F0v80vN7wqX83xe+dTCU5PHHj6yHlvQ
         sh0RZwssynRH4p6LUu36OzrhZ2dnF1DDVkWvkaKO8KrWDlL46pd7OyjnZCEnSwwHB8Ho
         Igl2Ir3H/ytroF27mlMfS3yiZ8BomZbE9YZTM88KrcRl6zsOT3tGSxb052fuwR5QPWFq
         BA5XiQoLt4lTsJFtk+8pTaZ98cLppNWBNdqLsaW43go41jkaKMOeoNT6z/ZEyIM0w1WL
         tNbOlWMt3F1DW8zo+xuYwPckOjRLQvRmjow+9L4Rn4ynmtUe2R1G75PWJZOilhG65DRh
         0hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772566751; x=1773171551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hpAqgqnxsYIXlo7xalO5qgaLwP1g0ilpL3ajza9+KEE=;
        b=Inzpc4DYAaKyV9ngj0SGV9UdSc8topeo+0yPdjzDYm49hicP3vvF3AVR3EOnP53j0z
         A7KkISkEpIrfoWRc0mffZ408TBqTIcIZXDR+6cuV2AcSNwJi9KwPwK69ntk+BdFlK2g+
         kjWF3oL2VoqltSTMYm7NAk0mnaB1CpTAD7CmIynmKlW388+/h79+ZU8nGAShpmpCmpCB
         8RsIfg3ooiKlZASMwcefHDRUUzu2HB0IAWQ8zYpVzLPDAVDb90x03S/hVLqM285lMCRl
         9V/RK3Kuz+yqyDuw8p8yeSHrlbtyjIBA9K1kPeTVt/6NVKC7ALFI150O5N96m8JF2BDk
         x40w==
X-Forwarded-Encrypted: i=1; AJvYcCUIljtynGqEBEH2DpGl8guUCENZ+GDkRGtFaV3omf4BG3kIvwJZVT4LmIkYduySz3AuDosHqubOCYqFKYv6frL1@lists.infradead.org
X-Gm-Message-State: AOJu0YwQsgbbmM5UIOK8kKWRbxv4wr/VW+2t2093ex5FsQLvUXo+JKvD
	smR+nvQQYuq0ZrYAnuwX2l+dm7egDPBQnBZFV40hB5emHIbR4qo16t9E
X-Gm-Gg: ATEYQzzh1ecT0eYdZpT1tFscQ70GnsXmVnzIrJAGc/R+3f/OykZpnK9RutuuGK/Fwu0
	JPzusnFiiVAJ7RnZ+EPQpftLM4QqwLkc9t8TRHSQIPDTC0jXyBUshpEXeGMTx7nPKPn42oBnXuA
	yb+mihT36YQs1mLwGEjtRoW/2Ni2OrxHLwfzmT8pgY2t93tdr8V4rKi2Bd2SNX0QjJ4MWAH28zB
	zFVkhz05Je9XSQ+qIQdI/lJeP3ytPQ25DCmfyEYckHi6x7YIPFxb13ChNeb6+uqSdSEJWasGATZ
	x/3tEXLdFA32jUO2DUGPEkf7IzfZ/sbiMxkd54UXfWjV5t9GzgqJ/g3VjIk09Xza7mZ+urAkNzq
	Mf3Ft3vHbymvnJGDEOe8RW7Teo748lHC/QuTX8gCHriP5GAkFVRrhuv8T0PFg1nIp5Qe1baqMFn
	iqOMKdycJts91tJKUHSfJwaFbxaMA0hJqUctoDxFu8JdDX17X4hdl3SbInF9KMbF0VZTAA
X-Received: by 2002:a05:6102:1610:b0:5ed:675:e355 with SMTP id ada2fe7eead31-5ff3250f641mr6894908137.27.1772566751414;
        Tue, 03 Mar 2026 11:39:11 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:499e:12bf:3287:5753])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7af30asm17780456137.3.2026.03.03.11.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 11:39:11 -0800 (PST)
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
Subject: [PATCH 2/3] ARM: dts: rockchip: Improve the RTC description on rk3288-firefly-reload
Date: Tue,  3 Mar 2026 16:38:54 -0300
Message-Id: <20260303193855.828892-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303193855.828892-1-festevam@gmail.com>
References: <20260303193855.828892-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_113912_915262_D384908A 
X-CRM114-Status: GOOD (  12.37  )
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

Node names should be generic, so use 'rtc'.

Remove 'clock-frequency' as is not a valid property.

This fixes the following dt-schema warnings:

'hym8563@51' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
Unevaluated properties are not allowed ('clock-frequency' was unexpected)

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts
index a55270672732..8b491b002992 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts
@@ -197,11 +197,10 @@ &hdmi {
 };
 
 &i2c0 {
-	hym8563: hym8563@51 {
+	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
 		#clock-cells = <0>;
-		clock-frequency = <32768>;
 		clock-output-names = "xin32k";
 		interrupt-parent = <&gpio7>;
 		interrupts = <RK_PA4 IRQ_TYPE_EDGE_FALLING>;
-- 
2.34.1


