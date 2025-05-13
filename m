Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBC9C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7HOlMAg4ITw5NVtu1FU2SCoRgaRsj5LUWrw5KUtfOSU=; b=PsCYePD3UspocHZvrE3xxBGuK/
	rJZ2gMUQUZQqxuvHdAJVk0KukbkE3By6VDEbuKcUZN1jvkuGDQsApQCmBP3HFhSAclf3W55D8hr+b
	VhWQ3xiz6kv7v1gU4bD6R/UFNZvDGdiPdYvbHTmdlLo72jS67l4/AYzqfpxWVKYww20ty9XeQo96B
	A3RAqxXi1y+Em+Xz2ndLzl5Fw5rFYGWkArM/0ijPDr66pY0LS0hX6Bv2y7w9H1b+8+KKcmYYjc8n8
	nxS1iybHLlNBxIwLz8BSnPh4UHiWsD6uKuF/k8srOcLI+R8X5HBm+CgemLsk3PgqQdo857WKG3ohv
	uXN8HrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErVB-0000000CmK0-1jCH;
	Tue, 13 May 2025 15:25:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErSQ-0000000Cli4-2GFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:22:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so59798285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747149732; x=1747754532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7HOlMAg4ITw5NVtu1FU2SCoRgaRsj5LUWrw5KUtfOSU=;
        b=JNRb9+7hr3lqERtfypCKvIV2gexut264RpIdQ4JsGggr3dUfWV8mPTEfTL5RwsPuh7
         /1vjQyU59wvJR568YCh8DXwa0O8jk++mF1G5vjLCQ92scmvOoLkfNaDfuARpAWnvuzHD
         o5bkXLCc0hBf+IjWlXgxcWhCrBGMEr6EZqjSmNDGtjpT70EhrzLW36htD+mvP+GtRVgc
         7ZBzHG86lQxOlXKZQ8h+9KmWRc4e68Ponn2IpqyncjpsfUg5wiUptWfu20iF/6Twm4JY
         Ohu8uYBxUFxYV/qi8A0iFLrPOZy45ddPCbUoTOOHyRQ6XK5ahXGT21fwh0U+nTw9YBd+
         /nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149732; x=1747754532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HOlMAg4ITw5NVtu1FU2SCoRgaRsj5LUWrw5KUtfOSU=;
        b=GzTdWo7icYngiy1Wi62mzbgQtMmiAe4hixT6sBHtcLLi6A0WZBVem8QZ0G27Rt7Ykw
         P168NazLD1YZLtnF7chk38r3qNyB4pJJrxpxuSbcRqEIUA0GI/H/3C/ravatoJU/SzzU
         VssifIUHH6xTTMJD6CFPCMhyu2W0Vgbo1d0KKKhiX6DzIahfYvZDx+kQXNLnqbWqcJko
         lRx775UDPEwpTAJKpOWv4+gmGYD/YEy+PTI3rLKcQUCxiJBOwLJmkIJezsb+M381Fn5D
         NMQlKOZ0udemIGLXdRrvgZvM4vG+Rvuc0YXo1ZdRkFY4+JJL67XmG7xhIO+Kg3Bhj75s
         EULA==
X-Forwarded-Encrypted: i=1; AJvYcCUBLShB3CyDcBbEwyXhj7Lo7qR35o6JnBOgZx+7VAlw348Pkk1nNDknwCHpcY8o4ui3aCIkxAI/e4nkCdREzGv6@lists.infradead.org
X-Gm-Message-State: AOJu0YwckrEjvehJepLR6mledXWq4O/Bm445Ppl4NIPvGSHEHE9FALdE
	rU4Z0jKSGWhuYHfldL1n32c/P8JbT0XuVxIjwbUKcn/soik0ps/s
X-Gm-Gg: ASbGncv+1IagMDOCZv3CoSKV7Zdv44rrJeeBm0eePCmKk3iIO84PxqvAFS9ms6txe6Z
	rGeSdNuK8Q9EQcdXHxL4VNLNPxgXFq1d+VK64SXfzt3fvrPlbs+hgQbK+zggQk6YJJ9xTL9sJet
	2xpspNhbVxamwLTaeYKY96ZmreADz2b2bjufaq+xi/1LwE54mv8qmWG36TcZuhW5Xf7wJQbcnC3
	pJDLpQfu4kpDMliqn6+8+H3Bsu4MmwmmLOkuXXatARRFfnhEQorJwdcD6v4xR0Wj7dhp94pS+OZ
	oLZa+Wk+LouupxxrNDp0JMKNknP1CX4HN524m4ALs5V2IYQfgRICBinLr+mPS6R6/bEQuSbn4fQ
	7eyGuvGKVTLiLVDJF7DVPIFtr9JX/5UeSjVUk5PPciYrsZiB6sOACAqPZwg==
X-Google-Smtp-Source: AGHT+IEg6PWgzF4jLLpPihZcPfaWsfwoK2cBnNIZhlc1AU9QDfK1ahFTXtyBWf5ovWIPZUOzXx90cQ==
X-Received: by 2002:a05:6000:1889:b0:3a2:377:500c with SMTP id ffacd0b85a97d-3a203775382mr9139211f8f.16.1747149732220;
        Tue, 13 May 2025 08:22:12 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec0e4sm16384170f8f.40.2025.05.13.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:22:11 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add ACSPCIE1 node
Date: Tue, 13 May 2025 17:21:55 +0200
Message-Id: <20250513152155.1590689-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_082214_581974_2B1B4B2F 
X-CRM114-Status: GOOD (  10.64  )
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

The ACSPCIE1 module on TI's J784S4 SoC is capable of driving the reference
clock required by the PCIe Endpoint device. It is an alternative to on-
board and external reference clock generators.
Add the device-tree node for the same.

Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
v3: Split SoC support; board-specific changes to follow with Toradex Aquila AM69 upstream addition.
v2: https://lore.kernel.org/all/20250404101234.2671147-1-parth105105@gmail.com/
v1: https://lore.kernel.org/all/20250320122259.525613-1-parth105105@gmail.com/
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 363d68fec387..d17f365947ed 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -131,6 +131,11 @@ acspcie0_proxy_ctrl: clock-controller@1a090 {
 			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
 			reg = <0x1a090 0x4>;
 		};
+
+		acspcie1_proxy_ctrl: clock-controller@1a094 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x1a094 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1


