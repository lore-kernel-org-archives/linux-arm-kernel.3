Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FE4CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hH7fDiyFIwd5GKCGsoTM7UQ+n2/6xvaN9QjJ2WXUyBY=; b=o0JkGKNodjVSrf52ggctA8DsxD
	fzq2mxKojmVuRcbFmnWJjO7/o/x7EjfvXbf3NW3IfA4JhkxLRhpv2ggidkLXNmqV6X5QWq3ueBJOB
	EBriGyUbC6RejuBLdpc5U5vtjDoDIrxslO17rFBIoHsZm2h8rkSrefsVd1HjX2ruHCq6TTAFgUUMs
	rSj+FulaP5cO/1l5LtPX9zCF7ufuHKPeBFFj4d8tOukRTyIgPYZp5/LjOGolinZVZUEzliE2e2Zz4
	TJ1BQdZ0wu7qpGn2Ndt3wbxNUjJMne7fj6rXPc3R81RHouegUGGkgtk7jv8W9lZyevuVzG9LcAuV0
	aIU8zS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3U-0000000GACB-3cMM;
	Wed, 24 Sep 2025 09:44:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M3S-0000000GA8r-04kV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:44:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso41203645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707092; x=1759311892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH7fDiyFIwd5GKCGsoTM7UQ+n2/6xvaN9QjJ2WXUyBY=;
        b=b95QMQzL/UuzKMnHtWnTNPG7iP49hfuNZW2Of0HNbOqYLqThX+Nmskhf08Ga4So6c+
         b/fE0XzTeF5VTihDtEgmMSgfuHlt+pwDLLtjQYIJVq/L24VU88EvupwzsqcdMO36iVCb
         3Mw9HatUinQVwr0TIhLPgmJyLc5iDGRzZETcIgY144oEJayy9i0HkMKXANKKpDJhMg86
         Xh8H8ERDcKCAVJcCSmBujYLQwlrR+ONrgmiY49gVJwl4kJnt2YhdI2Bk4M2ydT4aP+JB
         G5WMdoW+rpbdqxPxuA/Ro5GhR1XX7du5QLJjMq9ESI+AVnZscZ36olPqkc/ZWEXpDVQB
         odhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707092; x=1759311892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hH7fDiyFIwd5GKCGsoTM7UQ+n2/6xvaN9QjJ2WXUyBY=;
        b=G5S66BMBauI7+sO8te7uRmupwcHRY2axJ09GS9dlwSe2L3wyxeBd/tefwutIM5ldgU
         TGFcc5YJ2vekCFcGjpAi2OaCoeXYq5JkDs+7x8FSnAbhJZ4kf+ooH50tJMEH70FSawgn
         Fx4DcpjeU1gOL2xCr9xHxIF3v+P3UR5o4DNz6qtDUJgJ9zqGrPM27nRQCePioNpNs2yg
         3icMI/e6yyKQJWmIh7BGGEd9Ib0u0EF0pzSR/Q7SQvayRZYZGvrxlaFbizyvkSSMeI36
         cP6RWRM7MN8/jktTfqbonMQDCvPk2eniOcKD2JvH3CCqGmzZlTLAJM4uSV7PO7X2w/Zu
         RQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX250eSMdrlkLw9iedgIh97/xIDims9qg7I9dRedwYq7G0Mzx8ypucNyPkk3D8Cil5Y+gbkJdqdfXe/TuCuHDRU@lists.infradead.org
X-Gm-Message-State: AOJu0YwALe/fN4D9O42kKZajTF8HSj9MsoWRBCntAXRQ7ljd5jaUgx4z
	rDjpo1B96n3ZjPSk3oGGF7H0KKj6h+ngdnfR6TTYKMPfNJIDUpclSwk8
X-Gm-Gg: ASbGnctPjONc+xWCBUYQjMD5ZNBSihuTnowqWjHJBfENYKmRfAkFmdZj6y4wb8jMUWC
	VpRDp3YC1hsEWoOShdPnjsCplVuSSEk7+K8DzCJG2CL7ipJ8vps9bj7/vcRmdfYRCd14XzXSMcT
	wlk5DnxrerfVb37M3v8gFocpMzzljAqFC1CLwojIexLP67EzS8INYk4DjVyr/4e/gTAXByot96D
	f5XmcbZFlNnjE8DNcjtLlAIriepWa97GBQdc/vW7FMggQofVOsaEl5iXWyOogOGqTqwdn9hpMKk
	bkKD/LpDHsYW//lYuH8mRhCr5YVAWNZR2WP/ED5HQcSNbcHUYtv3c8rHtqEeUbtggme4yox03zN
	E+sWxPWjuJ+7EisTRG1XiHI0yaKy2TeZDTS7U+2gT46ElnAVEEFyX53dHBdpLOvYW3b53bRSso8
	FdtIf6batkwHaD3UXmQxR9u+kv
X-Google-Smtp-Source: AGHT+IEIpicMOfP08Ui6PtoUDCNZ6++RjL5ZW9INST6VLjpDrbiX7bE7tvizzZ3gSwxM8E2g4eP1TA==
X-Received: by 2002:a05:600c:1914:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-46e1dab512bmr50452905e9.21.1758707091986;
        Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407cffsm27184233f8f.16.2025.09.24.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:51 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Wed, 24 Sep 2025 11:44:44 +0200
Subject: [PATCH v8 3/3] arm64: dts: st: set RCC as an access-controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250924-b4-rcc-upstream-v8-3-b32d46f71a38@gmail.com>
References: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
In-Reply-To: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024454_081434_06F768F8 
X-CRM114-Status: GOOD (  10.18  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

RCC now implements firewall access ops to check the access to
resources. Allow client nodes to query the RCC with one firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 75697acd1345..8c0dea2796a4 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -776,6 +776,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 303abf915b8e..fbedf23def52 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1677,6 +1677,7 @@ rcc: clock-controller@44200000 {
 			reg = <0x44200000 0x10000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#access-controller-cells = <1>;
 			clocks = <&scmi_clk CK_SCMI_HSE>,
 				<&scmi_clk CK_SCMI_HSI>,
 				<&scmi_clk CK_SCMI_MSI>,

-- 
2.43.0


