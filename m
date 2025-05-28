Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D744C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4Em2WOCtNmZnECHj9cB8orbqHwuCdEzrhZKZaFoeaU=; b=UgiJ0GIcMzHZ5K8NZUp+6ohx/6
	0V3VYKsIa1klspD2O1un7GgJ0Js2SG/Si9DYAAIT3mEUNJsloXebt93LeYTJ3pkoQa0iamlcQt59U
	WfvIlAXtuGfvny9zdowWUB7a14edwmpTqNghU3yxO8PonxyYXLazV7JbUqcGtlOjP97F1SaJcrotQ
	rAdgPJFj7N+BP0zoMK9N2uV66QXN3lqHaTrtdwLmlGFtq7JoXsi69Adjko++33yf7tq7DvkVLOYRs
	t2k2LeSOYA67RgkO+iZPvjF+3sYEGQS/HVfTa5bv1puH/QKb47M0F/UUuZakrFJXED6RqhQz5HjPd
	28+u512w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKI5r-0000000DT6Q-3BQh;
	Wed, 28 May 2025 14:49:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGu8-0000000DFiB-05At
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:33:14 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SC8uDe028907;
	Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	R4Em2WOCtNmZnECHj9cB8orbqHwuCdEzrhZKZaFoeaU=; b=baW+lHSG6gqHQtNc
	WioG13qng65SbE66I+iN7vtV2Bfhy7OpljEHKFm9tgq5sEfkke044NNyjCqszh0h
	oinxydP5M3D8WElRd9PfrGJtwa94KGvlr8w8PW56fljMYLnbcSE0eFa2ityk5EgZ
	9D+2+qDvj8yYv7YPhwfWpKuP6Q+w2zFWPx8u2Ci4vzIr+fymwJxgHYJWQ13k/U5B
	6vr5EQ/SzM7CWdZdj9Yar6cpwngbaTLU152SYi7fEkloqEBHsXz4YTDGPjso0Jcy
	jzWcrlLUjcTMwBxjtIVc4ruM59sXMA2AO0zcFp1+bjIr6oGqRdW2+MDBDJetZJLD
	PUpSXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3891qv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CA49F4005C;
	Wed, 28 May 2025 15:31:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0326E6CCEFD;
	Wed, 28 May 2025 15:31:07 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:06 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:31:02 +0200
Subject: [PATCH v4 9/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp157c-dk2 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250528-hdp-upstream-v4-9-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_063312_664114_91AC4820 
X-CRM114-Status: UNSURE (   9.82  )
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

On the stm32mp157fc-dk2 board, we can observe the hdp GPOVAL function on
SoC pin E13 accessible on the pin 5 on the Arduino connector CN13.
Add the relevant configuration but keep it disabled as it's used for
debug only.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 324f7bb988d1..8a8fdf338d1d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -63,6 +63,12 @@ &dsi_out {
 	remote-endpoint = <&panel_in>;
 };
 
+&hdp {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&hdp2_gpo &hdp2_pins_a>;
+	pinctrl-1 = <&hdp2_sleep_pins_a>;
+};
+
 &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";

-- 
2.43.0


