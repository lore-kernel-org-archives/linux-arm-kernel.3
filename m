Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D93C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeG5k7eeG5nrvh8Eq49sU4B3j2ymx/30X9ZLGBFGRWk=; b=OlmS1sYnRr1qQiFBG37fZAZqtf
	AELU4w6iqg0bysh3tRlVj9V/tINLugqMAjyri0mryq2cFu9ocEDVGj+EPsDZow1UyKRPzQUe+5sZN
	eyDIltRIfJIcPbV9OGOy78TEpPna3zSJjYRDrgsoLTaxdcXOCbxUYGJcQAeKMCMBKoS8LWgiW1o47
	ghpGN8BVaY6iYO6qJ08Q7kAPeex4QoegomQ6I1yX9+95cTBZ1sjURpNmj8aK8NFusDMzJqU4Wl35A
	bfBOtm9/Xxir+KHSJferl2p6iAxcqoeFyAd5HN8aVQyAHZzXc1JvBGGmZzS+Dr5Uz2YBet3m2i5vg
	mH7ogo6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gLF-00000008t7N-113P;
	Thu, 10 Apr 2025 01:04:29 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGO-00000008s8t-40Bl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:30 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c597760323so28645785a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246767; x=1744851567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeG5k7eeG5nrvh8Eq49sU4B3j2ymx/30X9ZLGBFGRWk=;
        b=SF6EYZ3K3O1xTEYRZOs1Z5qBxwoe3+YbzUSw42Lzq77zi2U39k1FxsRL1XKlEBS7BO
         YPdQbESGxeTmQF4RwYiLS9pz8Br9yz3NrQv62T7S9Zru72OfBgw6gpb8WgeLTXuYQcnb
         W307a7bZxTYnhHHSu/UkDRGT2Mff8J6rW6G4wp3R/8gPXVYi5hzkP3+dAYoyiAcfTGsD
         /G8Bq6ILAnJHiXHQFOiKnnNmr2YH+xO8wcJYmT7kuy7PoD9UaMH1QSAHKoQVTq39ir0A
         8cBJsRfkJUlNmX/0JPMdlRxsCRqJLsXgx1IfloJ+wW89OaXc9GnmBt8aBXeYAKUF3n90
         Wy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246767; x=1744851567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeG5k7eeG5nrvh8Eq49sU4B3j2ymx/30X9ZLGBFGRWk=;
        b=LFXGaR7bXcgvovGokCbK0gzW1SBN4nPN4ZDbQ8gjtpbDNcP25tNe/klePUUADXNyR7
         T92b9T48ArCvjbfhUB8B1jL8FkfFabfhicsnu1Cprir6ZVUBNxCiRL35CgfS8CU39HyW
         Qk7prrCdi0t4sIic+G6jyZPGcqWEnfcrVlbeqPOChSwN8hSvvidz8EgJZT+OABqwqzxD
         PiorOXBaH7QfuuBLtn3E2LLpxmqIHZBDPMF2BcMp3TFraXqQGvd84sSEF2NYZ3iCSVtZ
         8EhRJL6n0wtgdUEUCY7HlRBvbj9KmMMDPDehdI2AbjpDzCwT/5xxKh3+Ra+P0J9iTeih
         oHVg==
X-Gm-Message-State: AOJu0Yww9xdD3DRD/XFe6lbXP2zTKw5hiHZ+au/hKy/5+rbZtuhxIg54
	Za831CXxs91cYeQtbdyaUi+QUoLLe1Ml/D7WmitlYFmTB0iRoWtN992j3w==
X-Gm-Gg: ASbGncvHgYaUoh3lFR+K/aBkg91uHJjO2Mtkmo0/2emWd+kIAKPY+ozRXIK52SeSQpp
	xhdCeSo99NHSMftkZQLy6bvsLhRbFscatxCNopED2p7RUIhC1LLJRxYUWZy0kiU5WKa9n+kZiPo
	qi7LrNgqydveJ1s27JU+u5WXZaZi9YaYRFW61XObwckbce8YW+gbbb9UATV471aXzh03BvKVV7v
	cufsBaTBmBQcgtwun/J+zrAQqtWIBau4qKHWdBnMI2ICeiTrdyCki2xW0t8MfORxxu7Ps0WWIXQ
	C9eFojKpA+kIaPDEqmlS/pPx9snpR/hhnGCuiyWCxiItVHUkEcc+YEwI6cE6CPgjyasKB4K8031
	H/YpwpRG8F/pBYiY=
X-Google-Smtp-Source: AGHT+IHDQDEm510Zep6ehXFGr0QIvBVvOcXxaZ4hhWGvwNKkFEXwQS8kRk2/D5K9n/qyNnT7NjYeFQ==
X-Received: by 2002:a05:620a:468a:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7c7a76bfdebmr138512985a.43.1744246767488;
        Wed, 09 Apr 2025 17:59:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:27 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: imx8mn-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:56 -0500
Message-ID: <20250410005912.118732-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175928_991541_DD4A1A34 
X-CRM114-Status: GOOD (  11.57  )
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

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1..bb11590473a4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -242,6 +242,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


