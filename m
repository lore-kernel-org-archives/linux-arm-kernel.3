Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13404C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IniKC5WKFomByrKxv+MfxE4r4cLS1U5X+1446OuWw/4=; b=rx7SpE3aSI7/0WcDPRhxHNovts
	HQC3QI6IuzgNI5fSy9J/oGp8AnXXLDphIOdpX5khSkikqHs2pMKfzIJXD2ouyswce5wJnIdRWegNo
	GZpFcFxNzSaIQJBTNq7AykMRjP/sQKtF3QhehPctXt8RE7EM8ZQul8sk9hVNcoIk4rQqrCxOb2ayG
	PbrNPyh/1kzc+CrRhMBWDdfEfEo9wXoozFYYZc31WoO+Q0rYYCum+6lOSqxhAtrA44ROnKGE+15Ds
	eKvmkNja4w5ThTeU5w6ia6LUL3hGxCRhN1JuzKApgdm43D/O0tpw1rs+3lp6ePdURTGKxxvDRzSIv
	vgpyWuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucUI9-0000000B14v-2269;
	Thu, 17 Jul 2025 19:29:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucU64-0000000Ayyw-1NrR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 19:16:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45610582d07so10702435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752779807; x=1753384607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IniKC5WKFomByrKxv+MfxE4r4cLS1U5X+1446OuWw/4=;
        b=CFoEn0dcsK9MBgb1Amk1BbyvVTdGMNNKbkCBHEvEln6y67LKo6goE1oqdeav5CnziE
         t4ON5jpY9oit8ur03dsDQ8jJyNCG+7tTB4SsF4cUf95wvyT06L8u5cQ5HKOytJzvaPJR
         sHY/ZVCgNBWKxFiRQpH+aSMy6PtuICg5u0zaqjNfM7ztWrky0HFZKIoyvmDWwYxin86D
         ueh5d/sOUi4ZsJzfP4hp+O8zFmlM6/PjletlPaSjQ9qVCXCcri7L2o4fVrilEkAJzwHZ
         IRPck+2XVlyUcjgqYZuwvTaM42tM5qFNPiqOuWb7GJny0+TmtisHIsuaXdtkNBBBFhfV
         W96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752779807; x=1753384607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IniKC5WKFomByrKxv+MfxE4r4cLS1U5X+1446OuWw/4=;
        b=gIQCLxBTS721NSwxy554njNDeU4r5MkE8AMfTgUrBRAFpe4jWwHsHOkT0bRKiMGARY
         oBHJjvbX6+Kq0ON2nkGe5OqVyPzWhB9AnH4FDVlIuGoOjWZ+5D8DzgrtaVaExeJ9Tn8j
         lSKoh5epbdc0CZGbEsHK5w8zqBq2gttZoUQzFhE0/Sk7H2F3gk7CX4aNyFExGxOsXeRF
         f4CX1zwaO36A//hMiAz/UzX4GPih9LcavAmxgrGgr4paF2JsJ023Y+ZpocIcjKPR7Ecm
         eSGgy8rfjpS/mdWgPPFUNCA8XyPrhGrstP9Cl/ownA/1De3j2Jmi558N7/ACb4FcPQqH
         3Qwg==
X-Forwarded-Encrypted: i=1; AJvYcCW2zk6PSnFtiuyECMytwAizpBg53kBQD6i9Nq4EVrx+jyj4CujeMSBujl3WslI/6FyQad9Playc0Xr+qpRqxn3B@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0aSs3cSv5Tag3b2fvPe+yDwkhakpyCMRcLV3YmIfFj9tTbtLF
	MVKVhvv1j2y1C8LKHxdse8RR5aJhDhH2CzIPioVGHT8l/2n05JNliIg/
X-Gm-Gg: ASbGncszYHjDRxOCUL3VvMUa5TBEArKoVNynoUXOREWRVzmuXWgY/XCxzzyzZVPtsh+
	qOXDJVFeL6gwJHXLc8mSPEwtVzkrZeIDOUJcY/afaqc7E2qcS2WunEiNDMGW3ohjU8Apw37M3Cb
	4UC2JLYANlr/48p2lQC8GmZOwgSzAYULPaF0i8UZeFehpk6NDDOwRuIIEbLnsGaurzYXRIfTObx
	en0kg8iT1fgKvzsnmos5x7RK1UjkdTJGNrlB8xfCTpjiG0ZyLtiIU/jIt4/DTDiRCS3roaMBTvU
	b3pfB0vhCGlmuqCWCJ+tLdWmvcVhJQOfygC1ZceuKbXhCsZAhdf2ta0sxODXrnVPU5HHXFRNLjy
	bkBHDchkoPBaEi+scgqe1f/BpZUtmwpBl
X-Google-Smtp-Source: AGHT+IGHzyOYCw/m0HyP4umB1YuYT0FPkPuXBFk/lapuzoe2X+waZSCxE0xX5hMXQCuEqnY0X0GUaA==
X-Received: by 2002:a05:600c:3d97:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-4563532c32fmr38379325e9.19.1752779806421;
        Thu, 17 Jul 2025 12:16:46 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4562e80246asm58861725e9.10.2025.07.17.12.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 12:16:46 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Jul 2025 21:15:35 +0200
Subject: [PATCH 4/4] ARM: dts: sti: remove useless cells fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-sti-rework-v1-4-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=l0o8fS1wvKD2cvbhZZBTKbtQIm4NdpPP35SyjFhlGvg=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoeUwYbZ7h03ffdcgJqJpcrr4dawhJoUjOSplKv
 rVN0WaP95eJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHlMGAAKCRDnIYpo1BLC
 tUtkEACW2KbCulMwEimw5aLEGZ5XRbUYEK7XeBo+HKLYJJZUDJuQC1lR6m2p044x5FaJ90wxFic
 DwY64YN6E1Y5WlBqrd9DRQPsD64eKHKllh8x1vnZI4LpzBcFj9Npq6E7ozfkWRn6yMvqJLcOszf
 SN3aZcsYMAZE71FPuYLnl9SikG4VidpUxwdQcdZ8s6nAFiLhujxNraibTFDnYhD669+iLSx4RP+
 qIq62BqIZXxgUn571k4tMjWD/63S7F0utZeWyyrlraP6NJkJaEVSsYyrtvgfVN1+I27Km8O7nWH
 Y/yH3h97XhTfnK+ipaY4hvjbo0G71vRJ+yKtlU0UjLTYYDk87RsuxPl8DKe4r3flNbC7mqqW2/w
 UbDCozcdswbFuNBu8+d5kpg5CoYwGjuVejsf1UeECrDkwrIsXnoQWOMZSC40NSGwdzzvOirWVQa
 iu7JUWIOiNYhbgvgtcbwrZmRRD1KUHKCOroSkxymsxUWyfDP5q8ILa8tDUXT4cWuKzdYNFP0oUx
 cSqDGKJ8nhMkWrjkZvuPfisb6oUGkOU15WrBM/ChJB3FF062Jws69igkXENPjXQ4kwXgmHS7JWT
 qMiKi2iGZrtWxXIiwzgB/NEk209ajh85JzSlZHgcCK3GOS4IlC4IDTIyDukjbYO/3Q6UXaE43+t
 oIYTG2joSLVDe2g==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_121648_373749_91611A66 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

tvout node do not need the cells fields. Remove them.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/st/stih410.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
index 47d66d7eb07a3d73d98b3e21d62b2253aa1171e4..07da9b48ccac16c25da546ace8e6ac5773c68569 100644
--- a/arch/arm/boot/dts/st/stih410.dtsi
+++ b/arch/arm/boot/dts/st/stih410.dtsi
@@ -191,8 +191,6 @@ tvout: encoder@8d08000 {
 			reg-names = "tvout-reg";
 			reset-names = "tvout";
 			resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
-			#address-cells = <1>;
-			#size-cells = <1>;
 			assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
 					  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
 					  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,

-- 
2.50.1


