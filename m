Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FBEC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VZZ5suwPV8JvNIE1HcHsv0fY/f507EGEB4rZQRxbOPs=; b=E/Pq8RY4nec9y0Jjbk6/CKlYyX
	Na+qf7UnN4JkvaPodDJ87PUwPcnPDwwfE2ltfmZSbe3czjYbc/IdND18YyXjUhhB95um5pFv2B2Yp
	EVnAdzSyptNNIbhEyGqO4xm1DoJO+EhCF2ntdsZWZPOMeXyuHC95mj/tFNvOrvAbpQ/Z570p8Qgnz
	48R6PP1NiZR5YSkA92zHuj0jIiMugcLVyUjtqzxE8y6CFWegLNr/SgOPOpXokd5E5gjrwgP/Zejyr
	dggzHTwpQK/H5Nfc/iY4vtrkMpH1jY79kCOb1s9ZyfLO5cv3lxsL3xDPAGsVtfiyTjaEiXt/qEGvD
	1wWAJ2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFco-0000000Aj76-1Xkb;
	Thu, 03 Jul 2025 08:48:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFZq-0000000AiSg-458g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 08:45:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a53359dea5so3028581f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532353; x=1752137153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZZ5suwPV8JvNIE1HcHsv0fY/f507EGEB4rZQRxbOPs=;
        b=cvDe/IXYEmhkPdQLF4hfOmJOcxjNYMFj0SM+4F5E7o+RfuvjEWmsoJBGP4A9KOD1wd
         28Np7jcvnWVYhwFsJcgatunCfu+oIlri2S8yrOlRUC2FbUeQIjW8l/4Ynwbd10XuroaM
         nshsRnHivJDT7LRGJFP8DcVbTcQaIfooGs3GfL95jjiv7IcidokQ/3al35jckPXE2Bb7
         Vek3h7WkpzlQPCtRNdY74dgMVJTQyL/P62Qo70d3A7BEVVm46v91gjK/+r/aEa6PSotT
         M4h793t/tK9AuF3z61fGNltoc5RQ3eGOjs4WILfAJffscCKtFBWDIloqU0LHT6iQYJRT
         02DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532353; x=1752137153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZZ5suwPV8JvNIE1HcHsv0fY/f507EGEB4rZQRxbOPs=;
        b=l9EaX8gZ3i7+tTVxolrM8PyITD5/LDHE4sWGe+dpMpZ5kdqjvsIO0AekOsmX5AauYk
         rOvPbWN9ZFGUl/IImWMHnt6zxA4B3/Yl9Ks4dCQKQJ2lIjhszzoXsDx/tXE3y7YWFyVI
         6bbc0jnP7XQcPsnCGxzMOmwNLg/H5oYF9wEAQz/RZVbCByEZ36FJVNcLdrVGDhJ3bUM9
         Fw7qu9Jh6pwg9SD/OWrsHoB/1H+6iteMiAwZ5hVwG3d5kCEVTsms6tRmvK6SMuLhSVPs
         mTpOXnd3tN4q4GqS11FC7AyGpWVQ3069Gt+JO0JY+fozFIGQw0E06OZXf2TS+RYIfMQc
         /kyA==
X-Forwarded-Encrypted: i=1; AJvYcCUvkOzJ6vtIBiqqcRyzGvngR3vUZpttZlGd/VDVI8kxZ7MEnlW+jPNaco6eLdsns8PYXruZRjFTWFm4u6o7fJjS@lists.infradead.org
X-Gm-Message-State: AOJu0YwR43S2Hx1c4isGBcY2vTiQtB9yZriPwwUR/kXkSWHIYtyyfCrl
	dvKJ/pNJqALq5NHEy6Zq3fqhj+dLxKp2CU5Q0L5dpM58H51g1UHiFSMt
X-Gm-Gg: ASbGncvQHLVcDAJnkFKG9gGburIFaYMvHWhmUCAueGnuVAHNGDjHqG5851uc3aD5weu
	Sy7bSGTrJDOi8w2RVuWVCI8dkRjYbgE5CBhgJvEe+UtJ5+Fq5IW68wqRMtxGCCGzkmEvZ2rvSxY
	bPqkiuuT6F+CwkfT9bWP2tdUnffHccMuP/t24NPFKcUrkicW30+PZQwvmU6T6swNl/BiW7Bgll1
	xCUzXgYdkvOmCD7sgg4dBvpfShNWWyRSCOUaUM1pXzDRityh70JfLosB2Bd/uXklPS0bck2U2Hh
	P3NBUo4c5xVRrqoQaUypbwH48QndCH/ZW6Rb+mQmfDQc95JiVcpkdy8HJofVAlvQZgVjulYdL0l
	SYQa/40GdVXruSVSAUJbhylTb51rUFPeNw3cRtdsYMQvXe47wVUZWFad+9ZWoyzkLQZMR
X-Google-Smtp-Source: AGHT+IHKVzrFH8EdFJRt9+sIGdgnsO77Zqi7iCWJlIKvDOF7Fz7qaovoCqBOU4nm+R3zMocdJDsu9Q==
X-Received: by 2002:a05:6000:2f85:b0:3a5:2257:17b4 with SMTP id ffacd0b85a97d-3b201ba2a5dmr5403191f8f.55.1751532352765;
        Thu, 03 Jul 2025 01:45:52 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e76e1sm18392949f8f.16.2025.07.03.01.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:45:52 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-am62p-verdin: fix PWM_3_DSI GPIO direction
Date: Thu,  3 Jul 2025 10:45:34 +0200
Message-Id: <20250703084534.1649594-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_014555_010584_AEC6E6E4 
X-CRM114-Status: GOOD (  12.31  )
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

From: Parth Pancholi <parth.pancholi@toradex.com>

PWM_3_DSI is used as the HDMI Hot-Plug Detect (HPD) GPIO for the Verdin
DSI-to-HDMI adapter. After the commit 33bab9d84e52 ("arm64: dts: ti:
k3-am62p: fix pinctrl settings"), the pin was incorrectly set as output
without RXACTIVE, breaking HPD detection and display functionality.
The issue was previously hidden and worked by chance before the mentioned
pinctrl fix.

Fix the pinmux configuration to correctly set PWM_3_DSI GPIO as an input.

Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index d90d13287076..1a6490572453 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -426,7 +426,7 @@ AM62PX_IOPAD(0x00f4, PIN_INPUT, 7) /* (Y20) VOUT0_DATA15.GPIO0_60 */ /* WIFI_SPI
 	/* Verdin PWM_3_DSI as GPIO */
 	pinctrl_pwm3_dsi_gpio: main-gpio1-16-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */ /* SODIMM 19 */
+			AM62PX_IOPAD(0x01b8, PIN_INPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */ /* SODIMM 19 */
 		>;
 	};
 
-- 
2.34.1


