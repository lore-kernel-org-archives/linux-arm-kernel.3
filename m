Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E91C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 09:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4ZKx8OEuhG5n3iA9Ht1qjJNqikHTEvlSRpqNyHprtI=; b=kX+S6OzknIaBJq5ldKKe45btwT
	FZKRKC1KPPUTDY2jZ2aBu/bauv2Hwk1bpEmFO2i2nm9ad55fz/i/SXqQgYLggJXPjmb5uvpKDORGZ
	FeG3VSBiuDMGw6DSAz4n3pppQp481aHrl+JiCnk5JItpIwM7t/5TaYgRs6RhkV7RSaMQBybVRQA0K
	6PsgSZKy3s2CEJTRPpsG4EXsDgJnFzivYUZsVz/fk5QZ4CAeQwFRGyJzqoPOjHbZlhZFwunxnKhT7
	kDkAHiutkcX76csF73XcnkXhvkJPUE4NVOY+HGlrGDEhY5R1Avxps74PsQ2Z1dFstawfFd+WL1Sh8
	dZH7knyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfui-0000000FLhN-2oS6;
	Wed, 21 May 2025 09:39:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfkW-0000000FJV9-3pyb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:28:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso11844140a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819711; x=1748424511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4ZKx8OEuhG5n3iA9Ht1qjJNqikHTEvlSRpqNyHprtI=;
        b=Z2MXmj4j0mmfuOqjn1uX3pwZUtFmIyLxunkCNgnM8OXyHCbUPMsWN0ZqkElGq6yD7l
         89EIOHapJyEC4K6Sr2kT6ZjPbDJsWx8F72DtqjrSWxyhsUsCJDl2ZZJrf6fRzQyEasQ4
         h46dcY0ZSZp1P2nariwVXR38pNc6Sqd/rQgXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819711; x=1748424511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4ZKx8OEuhG5n3iA9Ht1qjJNqikHTEvlSRpqNyHprtI=;
        b=dIQbFQOG91EvvUSvpGJdSADryI9dZuCDPHpU1HHE17dN0ToT/bL9gDTHy/lBifWkDw
         Ls8P+M/MX+/ze8zfQqm49+QHgLaXWevpqqGWJqY8WaIEkaNMzUN0NfVrkTqS0CIKivxq
         PyqpVdwf168ghEpYcasy7yjo8hQqiqlaDsLQZcz3mIToMtEK5mjr0QSgjL4G1PJU6q54
         YXg9zd3XCYmpmWwncrFa8btT4vdRpXpULDEfa6pe3wIA2ZoYdVrb22aPT9l2f/3JQKgk
         Mg/FKa+wWlOQiYBzexTvZl7F4wUjDMD0HM0dplra0Pbp7Vte6iskc1r+JtsJQ6i6MIL8
         jeIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYybYLQA9+rDAItaEGE8LAbl9Fa7Bua9jgtNoo279j6sDp4vcEi3V5zlDW6GuIA0L5vG2a/sw4Y0klXIIro4p4@lists.infradead.org
X-Gm-Message-State: AOJu0YzPkNlsoPF835RTNb2W6Mv8dZmow8KaMjbujSpQ+lRbTOB5hsYL
	g6O1ZQEpRBUL+KnZZOBB6aDiR6MRfVZxrXlktPaGPj33B1fvcGFrvWduTM4gZssJ2WU=
X-Gm-Gg: ASbGncsRYeiutBtI2glOqcfpBT5uNUDose1Y5JQHRSeKsBf0KNhsRv2DQcm4AufqDQh
	1cttRXxBTHWL+cA4zoKNEPKge9yvPzXMMSIALqD+olj2cUTyo7KPrwNtvNDae6wLfdeSW67W8mq
	LeMUJbWbdLVW/W6Xg0x+2CiVXqdmbmRspN/q5JpJ0xTzx0Lbo3T1swRGsO49N/LsxV+qDrm2SC0
	zkaaUy4c2WZ28IiKgrU2ht0OFChlyCodWKInBFHmb2p2C+QR2K+8PO7xAGJbUv/pjddtzMIptQf
	g3+M2pACe0cCWxgmYpY+ntJZuXJydtKbnwQzgQVmqWDQgZXQmAuU1Y2VoT5+WMcTO6YUqk0U3gl
	xiFHM3h15RVbU
X-Google-Smtp-Source: AGHT+IFNzWiTTqQss9HBBtI+Nr/N9FAThr7Gi7sc3HVIWm4O6Gp1xrzlrO/3vjZUf5bm0cbWUM6fkQ==
X-Received: by 2002:a17:906:5582:b0:ad5:4b4e:e2f9 with SMTP id a640c23a62f3a-ad54b4ee44emr1238839666b.1.1747819711158;
        Wed, 21 May 2025 02:28:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: imx28: add pwm7 muxing options
Date: Wed, 21 May 2025 11:28:20 +0200
Message-ID: <20250521092826.1035448-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_022832_948466_ACFA902E 
X-CRM114-Status: GOOD (  11.04  )
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0


