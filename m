Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF53CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSWkjItMEsVNotyoDAMPLMvhhraXQe3wDj+bg0giOKA=; b=woLKJ5UlXA4oBjPijb93jrKAQB
	CYtI55qpq4a8WKhhkPVFJiBdVzuE4PhKwsscG/kfFI8q0owXKrd+mXjZfdg3UR+AT+OVfBjFXlHeI
	R5FvLda5JjrYN8eRB2ec8p/O3zgYtNa6MDyZPWtEbwXemZqE51SOnagvSDu2L97GoolWTsuladV8V
	sKfKARfrUVq8V38JAjsN4jIKRll6HwkHkg4Emn4sMildIR4ItsHY0lgWZc5n/H08CBrT8DwOMYxxy
	rgIdoZPwmbfod0ruCzJmVqcdNXprH+SU3mSVa6RkCyy72YWPHdBfptQ22uwN/CB89bc7OzS1UV1me
	LBO+jcnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXVt-00000002LOo-2ADo;
	Fri, 05 Sep 2025 14:34:05 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSw7-00000000nti-2LQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:40:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b0415e03e25so281342666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757065250; x=1757670050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSWkjItMEsVNotyoDAMPLMvhhraXQe3wDj+bg0giOKA=;
        b=IKfVqXY1kx9nuLzcjj2L8NOTtNcg42Edc6gUSaTeCOBiosBVv/9ypZIkrE+pD7T0LD
         3nuTQjQebh/DHFB3nzI526hXpJChiH0e5GkOZDkbbBa/3eC5aF7eLWpji5S/8DcC+lfn
         N2sM/AAO6dlnOAW3GctfASyqnTcj8ovOKJsPujjorMvhtdtUU1JjupJauYwKsbcPKS2Y
         LcRAk+qg/vwB+RyNjC3Q0rPMs9epBKU+K3Ay2E0UcxJHaTyvwn0omzKsx7At42JmUiZv
         CqAO+XAo7b9oKct/CvcIHJzEYq7UeoEvqCDYjdNLugfdZ7NSWy5bSusZC1sFkHx3b5h7
         9VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757065250; x=1757670050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSWkjItMEsVNotyoDAMPLMvhhraXQe3wDj+bg0giOKA=;
        b=P9xuCSiIKREP3KCgxSf8tLtG3D9igPE5RIBB79dghfnlnkWkzJkkk1vwhT0cPbITCn
         5KzDd/dnzV8v1c0qcSm5TcA87vZkzBc16Rmzgp40XhqswRZWqCN2HwlkOippTuyDkknF
         PBE+gxRm8EJQ52dvjYvz6yTabvH896wEKuXkWpHWiEVfiwBbWAkfrHG8q1wa3MlJpqan
         jaXuf7hmpZDSpuMZnZDwAPQEQrKnVWWd43BJOW7119LM6doDoXwwgasfyiKnhMwU7evi
         5Sh28aEVbUTx6KuGprPYjXaMabL5oUllH+H4Ozbhd7RpvGStbjhwkBucqaDlwiRk4oyW
         aM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+uywadHKet24oi+04rcQhGDedFGJjIpOFakGoVPgJrx3KQyw6XW2PKZcCgrllVUdQld8a92KRmP5RwnuQWwMm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9zxyz8QN5z9ckZt5teJsn+vsAjMkQToj0hb2UoKgIeBgyKdNc
	cZ26sCYIWJXtO5ZPKcJjSnGG3oV91bEruDKlzxSjJDKEz0HdPPQ6o9of1ohboxiny3g=
X-Gm-Gg: ASbGncsX+vxtFrY24gg5yutqW+ErP8D7iPaPQkUbb9/RWBt6j6LOuLeBJBw0rlkNDIU
	AXcs6MWWtHLi3F6uqpfz0et17YjTY5WriDxa/g2x0WjbsXTXy0GOueu5+gSlwG+/9RlVcXO6faC
	1cme9fY2wQU+33CV4/FWUJvZOqT6AcoEwEYAg+OWag+utgQ4qydcoGquNp7P6gkkFMkvtU6ibFj
	cpnV2U54lNJeWOVsfarJZrmD0new5IlBRz9NNEUOPx6BXikcfW9qbSqRxywcUCw5aEWhbSNp/Dj
	KcctzGdEbMv93kaJu6DSP2iT8HEXp+H+MHo0QAia1pRMP8I6NQo59mvVMUhJLoQNtkppo81WrlW
	9LGPhryntWwmmB7nbb3vuw92OqNkZw/8QI99NMqaFmhlYbxBTYyT05gERH7oeFKNB/LISew3mHJ
	VKyS+rss+2z33g1jlstYbAHaKNTRBahlPI
X-Google-Smtp-Source: AGHT+IH146YCd5rLDFXJuCKGLfeNOz6gYO2M5rsXVh68MQw9WmhS/YuaAcFuV11qUOxFVCZjfM7jgg==
X-Received: by 2002:a17:907:7fab:b0:b04:48c5:36c with SMTP id a640c23a62f3a-b0448c50704mr1338741866b.3.1757065250127;
        Fri, 05 Sep 2025 02:40:50 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04190700a4sm1362967966b.63.2025.09.05.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:40:49 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: broadcom: Enable USB devicetree entries for Rpi5
Date: Fri,  5 Sep 2025 11:42:40 +0200
Message-ID: <c6b17f0f896b5cdd790fc10aeb2b76b71df9b58d.1757065053.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <16d753cb4bf37beb5e9c6f0e03576cf13708f27d.1757065053.git.andrea.porta@suse.com>
References: <16d753cb4bf37beb5e9c6f0e03576cf13708f27d.1757065053.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_024051_606974_67E56B3C 
X-CRM114-Status: GOOD (  10.25  )
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

RaspberryPi 5 presents two USB 2.0 and two USB 3.0 ports.

Configure and enable the USB nodes in the devicetree.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 865f092608a6..95ab67c7aa47 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -21,3 +21,20 @@
 &pcie2 {
 	#include "rp1-nexus.dtsi"
 };
+
+&rp1_gpio {
+	usb_vbus_default_state: usb-vbus-default-state {
+		function = "vbus1";
+		groups = "vbus1";
+	};
+};
+
+&rp1_usb0 {
+	pinctrl-0 = <&usb_vbus_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&rp1_usb1 {
+	status = "okay";
+};
-- 
2.35.3


