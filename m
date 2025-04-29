Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C263C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=; b=DCj9BMHhvpYXEET/xdcdT58HTU
	dv7J5z3gty6B3n69RIiiUAQcXdYpNQD8bngdHe80M3OQx8xxl5QfLFnzgPEQAKO75MRNvIwhuHJVs
	qZkGxc7K38TtwnKNxqMQSWEjrNkr5wlvBxv6G4u6JtaLqHpnmORI8GqihqCIPrIQWUEirsMDrHHhx
	RNvyVgjXsl/lIb143/Lt5M1CNFhG3QTsEcAugC/lcdGlNUWUOHD/A9IyaSDi6Q15ChH1NQ8z2+HTk
	flCFjqGe25xHAsUaRB2BvHpXp5s7SBCrfthtANyVIbQ2+5DBN5OiC/ZxJ+3hbhyLl/OXboOJp5OCY
	jMt4lc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cN1-00000008HYB-0hHJ;
	Tue, 29 Apr 2025 04:14:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9btV-00000008DDN-1456
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 03:44:30 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so6005660a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898268; x=1746503068; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=W4C6B/+37FvTIZVgNxIE8DP61FIXIrkZDNE5DEFGlfSMXJNs3Z1Yj6f/af09zcMVUv
         /qh21z3N3oE91XkiCibN2qtkiTWfm8hXViBZQVAnA0Aenx2X/Uxr2pKM6p9bLyfV6+W9
         n1PLvm0yzMfMhgk99vhv/x3qWVAPZfZ2TjdO5dzwmsYVbqwPvpGKS8bfbsBTyrPl50IY
         cmNkvafsqkjXuPMMt9gJnxyXpP1Kr6nr0MiXX6+2ipTnTaRLVQYLbmCtC4wUHwKdVOgK
         +r0Ot2u9fmBgPWK8l/HN/kFa8fsZwTuCFVK5LBuhLTEBgrab7B4D3td5aj5LOaD8r8Lv
         RTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898268; x=1746503068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=OTR67MWWJx35UNGOWjNaIFw2QcsEXaosbvVWBvML0LCark7Tkd/mm72DsEz9OjIfp1
         T8/H2gYIC+IHVH7VTv2GscUvn+YfwLdIDTVN1FOWbMx84CO2oc4ywkWwizWjl2amux5j
         qOi3eJewjw8BSojLMEe6al8isKSGkpkrpqyy1kalRXHC2fJPLguaswH9leAX2EEP7+CN
         lYC5v0ojfBRDa7sqDb3DGvyL0vQ/lUrEvV0qNQQcx+gWcNsLpJaoMdQxTdBafrzDh71U
         Yvd6PuNdVp/9prif8esRVk4FysfjU3kHQisUlqi5hB4IJs/UroS9uxuleM9X6NxrwO/l
         1lBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbSAB0wzxmo32HFA3Gx9CwfAmKSrnioLAdIhe9AUGSeZthXNB19XW26DB7/7uta7AnoLacv2NhzkCGqe4VCxEu@lists.infradead.org
X-Gm-Message-State: AOJu0YzFi/5GQy9etgO73kEu3sSVUI1zcjXtlI0BoPaXR/vVIql2QuJs
	8as2w2GTvzhmHpQBHe0oTPWdhHPHNORZ8L7O9AAlprs69qYQZxb2
X-Gm-Gg: ASbGncs7jucxLMR9rPaCYFlLAKyfpVOJoAWxHmgcBGUf/I7hi6mG7AToVD8WATeMr41
	yoKset4+WOE7wkBHSFBup+73rLGOqGWHpoFcWKlkEuy4MBkBcsrpf34LwcFLfz02MVpWma6dUaW
	lbwNA6zf6IF8dC/G6X5zsPhTVYnGWOqAfuKW1oeZpDMN2QmZYhHsN+m/gXj041nm9ivgQVhRyxv
	YSv/fklLVvyye/ErkPXPP+0Cl5HNQ8svonSWFNwyc4Kh8b23zY/o/CwgzwmragTKjE78fQIf2NG
	uFEr3GgGsHmtbjLhZUEK97MU0MLz4ZdwVM9Q9aMqddapGfWqK2EAghm3mA==
X-Google-Smtp-Source: AGHT+IEWEAw4OwT6q/IeOWjxagm4FtQQx0OABKyoM16AT5iVGUbP68gxrwVyzhJZKq9oXmYDl3pltA==
X-Received: by 2002:a17:90b:37c5:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-30a01329347mr16385125a91.13.1745898268547;
        Mon, 28 Apr 2025 20:44:28 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:39 +0800
Subject: [PATCH RESEND v6 15/21] arm64: dts: apple: t7001: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-15-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErlTlWClVLzzj9JKvXwgD+WaQ6ahUE4T4P/+
 RShtTYfN0mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JJG2D/9mYelzQkgmHZJ+Gk9hwJh+/0FCUyI/1EeTu5DrTgqAnxUbT0fLW+7ldfhF33cOLMANMhV
 YnPNRFc5GiumM1clRZY0p92fIuG7o5b55Dui15dcarrcBZb5NRLiet8WHiKuo2+W4qSldLIjnp1
 dla6eCkdJajYiesIZg1MWs1gh9qqXvo1UMbMRtUtfb/mQdrBqap9y9DBKSCsS4qIMlhOO3zIhXM
 6yUvEC8TiY1NN1m2FVH8DgSsObS5a+pGm+vbmVrIeXDlD48fmln60yS9NbD4CSCf4fF/Kh3MXjU
 CigdKHVnufn5Wp8QS71MWLWDyB8I+xhwWYFi6lDvkpi+q/eLEKq0WaZ+8+hrKd3py5v5dE3Tobv
 U+lH141KU6QlRdwUIHxERkksiG9XtoRk2QM/xA5ZOSzBSMc0l1tslqH5Ew8LJsJbjaAVUzcx660
 Rpbg+7i/TBidpdCTv0jYsMyIUNvVz2YQeDEbp+rEdg5Dt5CsRaxl1VdA9qYKIaFq7pHff6GSyn/
 UW17ny0wsRg2S/FvSheuQW1XYQjLZvHmpLlGchM6GnNAs3z8oXeuYAK6y4jOldrwy+Set48FEt3
 gR8h85WlInSig38WV67JiaruYXYdHpxkK/0tnoggnqSi5IqExrL23Hx1A0GGUb6uuZ5JWlNzuMc
 ZiHX35qQt2rAeFg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_204429_296227_FFD111D3 
X-CRM114-Status: UNSURE (   9.53  )
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

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..fca0a100dfd7b29086735d36fec0db51144da456 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -183,6 +183,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.49.0


