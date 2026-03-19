Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B561088E73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3As/sXmvTb3Nrb+A3muL5/yG1ULkPfgGgdjrXA9Jlw=; b=ufGRIKbvUq51IhLFHAe9a9byCZ
	DoepWp0cf6UEbJ68WMYOxTsreAac3qjMgJkoWKIDjuX2AA5jpElFIWUemgWYi/6DDOBVtGP5SnYk8
	MN58sCejWm7T3Jptufttomf9oLYIUdHtD36nMSKv3GuCPfu1K2w3AOIXyNgZAmG+FGTb60EQwk+P7
	8eQGwKHHo2Pgbi+3XUb9EXU4BN1hQaaMxBpcMQE/kW5FhpZyTPJBIr3rcE34Cfrz1cD0ArGQe6qaI
	REbmCOkZcT3IHgop0NKInpnnvK6sL1TSn9SyeWA8eyF03qyNi2Tiqhg0hIL9FKhJ2UagwYLdKGk+K
	EeNmhClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SM-00000009rM9-2sBc;
	Thu, 19 Mar 2026 03:53:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SH-00000009rJb-0cKk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 03:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H3As/sXmvTb3Nrb+A3muL5/yG1ULkPfgGgdjrXA9Jlw=; b=P78dFqJF31p+/XWhSFGNY963Rx
	LyM7Q5vyOaH68VkC1vGKMHPfBVhNSUoNbhWiCLjyX2Nvyt+dpIbGwV+QA7OnEn0Ci+k1jwxNzOwhs
	5P2N3oY0heaLqb3Khd1tdRCY0FWCeiQ3YFtXUa8eoRDyKC/rlwolR2ogcxqzaXwW/geyxAaGAxKtd
	veYFGxvLset3giK1n3C1YXtZfZ55C+i9w9P9Gbfz++KNELfG1gP+suE1OkdizjAdK2NLo25cdn1bN
	rYuP3SG1ehxHSVri/Ha/a46EegzMjFzZiwKYF4yAH7gRfGIl4GTjXb2zbyPQBjNnZVHClIDkEH5Su
	WH1QYqvA==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SD-0000000CgGa-3RTZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:53:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-356337f058aso145351a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773892428; x=1774497228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3As/sXmvTb3Nrb+A3muL5/yG1ULkPfgGgdjrXA9Jlw=;
        b=B52hfZ+SgZO/ovuuEMbDun4ZIOyE1Ka88UK7IGBQ0VaIVF48blZYYOVz7qmgW9lyQI
         jHM7j8WGRd6jkDoIZGInVNQKjXRgUYJAaiULTuVjIXdhB4A65lfjMQ/owcMCCO9wYDlg
         vivClQX1LQlgiwJtcPToxstTLQoStgvxXHc9mW9SnzZESXh0e2HKtuktJvGUx4K0RZmS
         L0QBJ02wPOmvjuAQ2IvqGYCGNyU7QuwwBFcvYwLyIc1Qh1MQiqVIW40tH3pv+nELml06
         m1p7IlIwsMDWYUJN8ETgvm0szqx6rDwK/PKuILGWjY0jEPf2RBNjl766b/P58e0q5g+A
         ZvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892428; x=1774497228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H3As/sXmvTb3Nrb+A3muL5/yG1ULkPfgGgdjrXA9Jlw=;
        b=pKcp5FtpkbBOUbz0Xf3UeQmSQbkPv4iZ+scKU8rajsokHf9WRhzXE9NjSczaC+heym
         3dUlcX2dRB0VobO6K9kAVzR3yJYLY3gsONLYg+4n/w/EYmt7QyAL7+GO6WMEN/njbUY9
         hU0PwCdgYWY867DixqJOpmaeo4ARHzx0nILtLnrwPeYKMIZw7Omnk2KQTv17LPLSTxC9
         cOHS/25kQM0BsfNAneHzwORXdCk4TQ2GrKlNNQuRYs5iNthRv+8iLYT7DF/Pm3E897n8
         GvG69q4+a16hVs70ztLBrWSDVE82tjoy0HLB0dzJ6d+hA52yJfeDRiHbg2Cf5HeChQKg
         O68w==
X-Forwarded-Encrypted: i=1; AJvYcCWsjcO28LEdNEMmgTu6gF29s4MOkIkw81b7JaiL1xQSb7GZHHTcK6IsnR0gndMjgNGh179SPvDTB0XEwNObkmrK@lists.infradead.org
X-Gm-Message-State: AOJu0YykKMZ8+8hvAyOK1b0dSbEBFCUBO+aMVg99vTj5Lk9cEr+agiMc
	4DihFwWDiBjxp85Ni1ER4hOf1dTFJUUjaOwQIPH5BdSfhyzeN20ApJCP
X-Gm-Gg: ATEYQzwWpNRHeqGmGWnncqqcClMr5+VGFm/SArUVJ59NrhGDqjHlzQA6VHV9VyR1GZv
	VS11KtccHyDh8ZvWtEfIFa+pEXKM1o61P4ERnaQoXdkLfZxbIjMgebR83d9E2WDhYeM4HJE9S44
	DAdBbbZ+ZQPVe3IiXM2ZP8hQw8UZfGQNUBlxUy8ylTUnCzzyE2iTGOptQMcpX+SOX0FPg0bzvqJ
	rpdyOpbjmTh4HJl21VwnjBN2grsSWbwPBv0EGsmsO3wqCZfEE29vyQrJkBm68KUDxt8WETHCrej
	2DXBEZcMU2PxlH9oyI2e62BpDR6wN6uuvPwoJyd30UlRx0jh+dF2EAFYpTV9GrYgJFz/tMnvsDy
	agb934rtB0b8YYYM8wSGNj9aiz822RNbNYw8I+2E//BdtazaJzStGWlcgtfzAL7CRgSbLU6PZe0
	2pouw6oqlj4Jv0x8moD1wTk5biGG4btiH0WvF5O7am+E4tq+nHvoZV46M=
X-Received: by 2002:a17:90b:2d10:b0:359:ff8a:ee3c with SMTP id 98e67ed59e1d1-35bb9f11dcbmr4706091a91.23.1773892427775;
        Wed, 18 Mar 2026 20:53:47 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ecb30sm1159145a91.12.2026.03.18.20.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:53:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
Date: Wed, 18 Mar 2026 20:53:22 -0700
Message-ID: <20260319035324.269905-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319035324.269905-1-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_035350_269493_2FAB8652 
X-CRM114-Status: GOOD (  10.56  )
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

brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
some of them for proper operation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 617fb55bc52f..7b1363aa1144 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -93,6 +93,56 @@ led-3 {
 	};
 };
 
+&pcie_bridge0 {
+	pcie@0,0 {
+		device_type = "pci';
+		reg = <0x0000 0 0 0 0>;
+		bus-range = <0x01 0xff>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		pcie@1,0 {
+			device_type = "pci';
+			reg = <0x800 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				ieee80211-freq-limit = <5170000 5250000>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+			};
+		};
+
+		pcie@2,0 {
+			device_type = "pci';
+			reg = <0x1000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+			};
+		};
+	};
+};
+
+&pcie_bridge1 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+		reg = <0x0000 0 0 0 0>;
+		ieee80211-freq-limit = <5735000 5835000>;
+		brcm,ccode-map = "JP-JP-78", "US-Q2-86";
+	};
+};
+
 &usb3_phy {
 	status = "okay";
 };
-- 
2.53.0


