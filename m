Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59B8CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgwmeHX1hbkUcZ0QBlqPTtZl5v1WvSKOppfTm3dzSus=; b=d64LfuwRyAZX3vNi9TKpXz5jTH
	4M9h6exgokXIiNl9hT6BBr3GgR1Euh8oTO3JCbL4dW+ZkbaKQVfhqkWjP4TeZRBJpAlLFPQ5ATeV8
	jb2yV23A/aKcgfbj7EKanq2TZVTyJbcVz3KuAVDYwHXYxEAhqRCJdoPWoFgvYR+Sqiq7SrsI5Z5+0
	qCHo0XH91Is0FEJ0ae4HRmMFix26TcjnLQsefc2vpQeJDiRXmxmQz+N1Andej5To4d/7/KV4xMLpZ
	nP+c3iM42kYKqQ6NKxdsjkWrH1cKSdr52n6wzTPROsFjb28W0ZIr7yBK6rz38no/3SC+PS6Yh73yx
	5Z5IP5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlPE-0000000F8uo-3rXH;
	Wed, 03 Jun 2026 13:13:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP9-0000000F8kV-1me7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:13:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso118700775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492386; x=1781097186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgwmeHX1hbkUcZ0QBlqPTtZl5v1WvSKOppfTm3dzSus=;
        b=tLckJ4ajemakabl814hQBtVujQH0AhT6lmrKOJVU8zGbNeSjO/NcAPInUl09m5hbmU
         uGbgYqOfmHPleog1tDWQtambhiGTQ7+WwEiu4n5+7d2nQ0R5lLelUxOHLhybH3jews8l
         eO6Rls3kgJJxtfnMWlogOtxfqTyCG2usTlMYLhZWvsVIMZEyFud1+/nm6ty5Qj/H49oD
         VFA5SZsIRd1defHVaD5Jne4Xe2+SPZYBNHndemLcs1LDW8I22Q1Q7kvMUZ0hrU18vj5t
         q7jQQulcY14m13jfvn4oFjsbItGkhNyp/PCTEh+B3vR/2enhNOBUnyiARWe5+5frJgqo
         fBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492386; x=1781097186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgwmeHX1hbkUcZ0QBlqPTtZl5v1WvSKOppfTm3dzSus=;
        b=B+J0cxfDxRMDVnQuUBR3hQwXL8v2cAiIs3jPyN7bnpDFT6oxV15AKBxHrEsGcmYAg6
         2md9OKRakpPfea7M+4NUhBC/jWEXoacOFaipwny8fUAs4JWTEhcYrKHpOKRqZ4TCtxfg
         K9SIGEZ5xvLKqfATWwwQV259raDUEtz4deR88nbExuUHi8l0mHgpRA7HORn46IWGf1bd
         Y+QrQRvfn96DIy6ueHbhT02d5PAcZ2SkpS6VEuu/DdnhaKN59hMLH7COD5n7yfDIgW3v
         cmnximyXw6Dp8ni/BODvPxHvVc/Ofwdpd4jt9Jnjrb/KwcF6I5r3gcqhi1W/1SkayNTi
         fCbw==
X-Forwarded-Encrypted: i=1; AFNElJ/3LepJqFlqVwA2wLsBI8Dun0wTyyopwfMZzmaiAdGMP/8JcrnnJePKphd4Ujy7FLVazedf6tA7haH/ITYf01I4@lists.infradead.org
X-Gm-Message-State: AOJu0YyHdBB04MWZdmD+To52uAfNadPuLKyzdbkyJ04ZEQQjboJN+Q6k
	ub0/CXUFsJNEwruMYXoHL32eohCR7PGTtxScMdTfbWEYnkmDHPwCFdk8
X-Gm-Gg: Acq92OH+Nh59lrMDGcIlHZV0fItFyYWZ2R8xGVqbVhcrLJXvHytwEWGxgFplIh+Hwyv
	yz6QxR9VAXgE1n4lwizjB8JwwXwzY2aAnEbpSt4fJIJ9oAqYTcQYL6ivmWWOWEUhAjGczYKVmla
	Uk31hxmk+oYWxU4Qh/Y/z7kAff7t1vhRlDCycM5QyRoNWK1q2aHYJfK0QZjMgGGg5S/eb20XGRl
	3FCAfojBLoe77bAEP/vLGuSoMPkLLLtj6ngxCTRiGxylK/ZjKYBPskc+Ozu1Owoswxq7ELwkKUF
	mlmBjDzfufR3HThe2T+x8mx8x0gy3OgWeHO+0/niytNOYjFz5bmW5ayzGCyvjPnhSmePLL0uOeS
	v44KmFlaMqgtCTg7twBD6ndfxHF0GgRlJZxo5zeeJQO41e7xY0RsF2hZSuOcPP7bNnQW0zAWdH1
	mTd/s9Z4+YTB4aLEZ9obiBPCLTO0sCx/wSoF7i0hjDUFsBUPqoqUot85GGirLY7WoLwNji2pQ+b
	TT7YGTz5SSeSihCefr2+mEAWOCx3LCUYsZ5W9SArxqKoYaU
X-Received: by 2002:a05:600c:1551:b0:490:9d1b:2022 with SMTP id 5b1f17b1804b1-490b5e805aemr59644945e9.13.1780492385546;
        Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 11/12] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 15:12:49 +0200
Message-ID: <ecdc707f750339257a758a09b61f5382d0bde471.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061307_492661_69AA2AE1 
X-CRM114-Status: GOOD (  11.14  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 91d24110a283..912d064a4ce1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -246,6 +246,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -398,6 +404,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3


