Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B602CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J/4ivpOE8qtitd/efpLlMj5E5YlfY95TXIstr7HGuK0=; b=tghd+4rpsUXJ5vNrwLqDk4yVw3
	HQQ0eHZGveWCHlNpPNNPdcbmXsyfQgGUMGk1nQj73T2RPm3YTjchqrqoGxgz4p0hfyfNBsa4giF02
	CGRVr0BAIw2/f/mhNGnkgArLf4Wovqti4SmCJaq/lqlAaSasPA/Zvc3oTsVCwzfUqRw7B0dyd3QzH
	6NdLSNsll9/+fA2K01FKCXhuwhI4EIXXM7tm70NQYANaZUqeN9DCEozwNxRw4FSP+WII9zPf5noCq
	zjBS+TgpCdYMM4cNd2w4blkG7euxqXkqXGQWH63ulKiwMeW0f6/zZz2pJ8jATUu8H1MkNZpp6hzIT
	J4rdmkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXVm-00000002LFp-32zP;
	Fri, 05 Sep 2025 14:33:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSw6-00000000nt2-1n5P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:40:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b02c719a117so366501566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757065249; x=1757670049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/4ivpOE8qtitd/efpLlMj5E5YlfY95TXIstr7HGuK0=;
        b=eAzmAjKAfrbdS/qt9esEXkyQx/A85XD2MpsR8374GGEO8hVE7cSbI+vWP1dlgIsBla
         ZGmo6d0l+Cwhb3WkPYYUoOjOkY/WQWfWx9Q5YKWsFcnY2xopywJsfFwyVkn56APtiDiD
         bJTFEMVVHAFcsJmAOHHDok4lJqC/0tHlwQDXPapb44j9RbfNC7ThpPHbRMIfPe4eYfMR
         CDkQ9qKNEIbD0sFrB94blBmlXCHLkNb1yk2V7ARVSmHgAno2gIwA3eY+DO4/0mkkyjNN
         6vIVtiZzJ6h28uiHPjzj2rWOyyuYOD1gMBRmH/4jFjObuSiqQWFYsQWIjY9/aDKJEhaF
         0dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757065249; x=1757670049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/4ivpOE8qtitd/efpLlMj5E5YlfY95TXIstr7HGuK0=;
        b=Iu48y7p53WxBcoGmIG5tdijNmaeY7Dt11dMruNjJ5BPUJopBWi/p5fOrAT6jfQrDY+
         fHDGc6KCXwtSEOf0IKT3FNq4WHOSw6hyKZxGsQR8yyzCH+ghLiAXHmj061WS9YgL/e0o
         dz90MzOZVz3PBj4Tx2EVaVTku1Gn/HXSLGIsml8gm/lgjOoN04/41gQGP9EMS8RN4E6L
         O3C5fvWPd4NlZJ0aZ95/6dZWz93V7NYRaY8HJ1G/TmSVpr7dfR+75Has4Hatr9R4/lCd
         blkQrGGZ6mJOhM31A5h25eLPa28ggxNeubQOF4G2s2iQ5NIiV0f5Lew/Ykw8hkLsL8kn
         v+3g==
X-Forwarded-Encrypted: i=1; AJvYcCUte2EXqqw6jLo0QI8vSbYCpYy6jtekSQ2yL3gqKALIwbj1D79FUYvCGUK6hu+ShhnDqz7izTGu4fgy0CDvgfbI@lists.infradead.org
X-Gm-Message-State: AOJu0YxwpTTXoE9vqCo5N7+UpHkkm3I0zLb85yT+N5cC+W3COwbv0q1l
	+3L6ieQ/1f573c0tSf2i4O8XT5kSz9KEZ3cZ2ceBFaNIQLx2/lgBxb1fLPVAzI0yqxI=
X-Gm-Gg: ASbGnct2dp3r0WQ0Bsr/gkbhfL27u+PMlR48KIJr6X4Z2f+CwTteXtJiFVz4XSh4aoo
	nhe1kzJ01skZ28D3avIgZaohdO4Acu5MNOEHOeN96Pwj4+ZD6/f+T4NfkksWlEn1RGlkccN5nvn
	Xncecjvd4CwtnG7iPM/nVyvk5tEw744Kw1/SxL9w4piuqjkQbhI/nc9+YWj5UEShzSKNStLyIUr
	UMdvl78D6hhEyfTLLrToP8UNF46A9HJX2ZQ7cDyS+YWzShYQnRtJq/JU4aDOnkIJfVCmmQUhKRX
	xedbpq1gC1p8aw/mzy/YcyUR15oHe9KAXYFtOn+5rqjsI5Zv+foAnSrHA7Xi9KQxdvSd54Aq54X
	oGqdROQgaGJZiiOZFGKDetx0u8Y+oeJeM2J1i3v+H4Tzta+HE8/41Grf25fHAC57fzcVmR1z4HJ
	T7jqTr8cVnWNa7NXqg3BnS0VNk1JoBkZrl
X-Google-Smtp-Source: AGHT+IHUDHuJjsleRsQTk/qSu97rV3jdhcfaODQkbUhAaumpEvisyB/1lzmWlJnkChbNYC6NWWQ7mQ==
X-Received: by 2002:a17:907:1ca8:b0:aff:321:c31d with SMTP id a640c23a62f3a-b01d8a277c5mr2226502466b.7.1757065248826;
        Fri, 05 Sep 2025 02:40:48 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04279a59ffsm1228257466b.60.2025.09.05.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:40:48 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH v2 1/2] arm64: dts: broadcom: rp1: Add USB nodes
Date: Fri,  5 Sep 2025 11:42:39 +0200
Message-ID: <16d753cb4bf37beb5e9c6f0e03576cf13708f27d.1757065053.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024050_475426_E4068800 
X-CRM114-Status: GOOD (  10.08  )
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

The RaspberryPi 5 has RP1 chipset containing two USB host controller,
while presenting two USB 2.0 and two USB 3.0 ports to the outside.

Add the relevant USB nodes to the devicetree.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5002a375eb0b..3be14ac53c81 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -39,4 +39,32 @@ rp1_gpio: pinctrl@400d0000 {
 			     <1 IRQ_TYPE_LEVEL_HIGH>,
 			     <2 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	rp1_usb0: usb@40200000 {
+		compatible = "snps,dwc3";
+		reg = <0x00 0x40200000  0x0 0x100000>;
+		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+		dr_mode = "host";
+		usb3-lpm-capable;
+		snps,dis_rxdet_inp3_quirk;
+		snps,parkmode-disable-hs-quirk;
+		snps,parkmode-disable-ss-quirk;
+		snps,tx-max-burst = /bits/ 8 <8>;
+		snps,tx-thr-num-pkt = /bits/ 8 <2>;
+		status = "disabled";
+	};
+
+	rp1_usb1: usb@40300000 {
+		compatible = "snps,dwc3";
+		reg = <0x00 0x40300000  0x0 0x100000>;
+		interrupts = <36 IRQ_TYPE_EDGE_RISING>;
+		dr_mode = "host";
+		usb3-lpm-capable;
+		snps,dis_rxdet_inp3_quirk;
+		snps,parkmode-disable-hs-quirk;
+		snps,parkmode-disable-ss-quirk;
+		snps,tx-max-burst = /bits/ 8 <8>;
+		snps,tx-thr-num-pkt = /bits/ 8 <2>;
+		status = "disabled";
+	};
 };
-- 
2.35.3


