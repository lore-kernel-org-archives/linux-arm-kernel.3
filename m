Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87350C54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1Xe+iFfoFaZmcBVvqZtaLKC4sE7WOeQvKFEpMrwsnw=; b=w3gJlq2VT5oD8XheS7bXr5mkYE
	2eORVgPCMX12MzSKN3s5ZKd7rJz9gs1ocPnp4C05G/cHCujJe71yigOQz+SIlnHcecty8QkXPhv1c
	Us0KXWPOQ3XAij9diyLQ/52A50WKp/Q/B4IMIwUqr/U6oSjgSaUxGtBOXpToo0jInLZfAU98fMSH1
	F1O7ZH6FTolXTa8Lu474gbgfZvab3wS+Xjc03+EWr3iIbiV4qGpUvXP3H7j5nJtf0g+1EU3q0iCeE
	l4Q0CMOyXsFZhfTitl4Ppxee8aR+hvZJBURvVYZjgiR6Jhn3jWjRm+VuoMqTwV4QebSB21nhqq4KF
	25wNRd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRve-00000003rnl-0Jts;
	Fri, 23 May 2025 12:55:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRha-00000003pdL-0ZcD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 12:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q1Xe+iFfoFaZmcBVvqZtaLKC4sE7WOeQvKFEpMrwsnw=; b=cgB/9aE/HITMsyUyi+TkDKuHDn
	lLF4qQcd9JG217KjQylkfivP5/2gU0zP6KRLL2FyeXnh0dl8CKyBZBQWhc5fgB4eIIPea7iLZ8rH+
	LVznokvBreu3tIDnaAgHfENn4j+ajOKLXqg0bZnFp10D1dINYIX01tzeNImdn9xmQwHVcVpS48FFB
	zEemDkHDqspVFZrcuC/6CW+h34P+yw4FIVSLNK459mNMgv7xVaDhsexY2RJDFo2xQs0eLqz30VsOL
	0Yk3IQoDy9IrU/9w2Zid0zW7w+ThPJHZK/D1BJHZdw5CV7HO7PfbYhFVELsBZtbUFDgomswJjouAg
	xZ8pIm0A==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIRhW-00000001JlJ-1u3o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:40:41 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCZhFg031186;
	Fri, 23 May 2025 14:40:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	q1Xe+iFfoFaZmcBVvqZtaLKC4sE7WOeQvKFEpMrwsnw=; b=swUO2dDH/z8E1BrC
	GOKktnCEAuRpXR9N4TIGZzPcf/eZ+pYNiCVBWbKn9ENyPey3usCVP/5fwsKmCma/
	507JAr/laSByH4CDReYro8Qymjt8EGAprVVd9lJrstEWDhHbRx5QP3yAtmlvRNtg
	NPJJ5o+lqClS2lr1hvp7l4Yn1itw2NY7w0nTL9wy2XdA7dtZ8FlDNXFQI/ROBn1C
	jZMn+1ZVm7XD5rA8VflahEZzcWuPb5DHW9gXyTJAz0PpRuJk6RZAQ9ODBVfCFLze
	iNetHEbCLuQkd9Bp8TAvwLejjKthuOSNkdEKBpHUVZ6GAgWDlTwUTp2KMIemRQE2
	AN1x3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4e7ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 14:40:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F405440051;
	Fri, 23 May 2025 14:39:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FD8FA0D91F;
	Fri, 23 May 2025 14:38:29 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:29 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:19 +0200
Subject: [PATCH v3 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250523-hdp-upstream-v3-7-bd6ca199466a@foss.st.com>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
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
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_134038_888785_F6D7A3AC 
X-CRM114-Status: UNSURE (   8.86  )
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

Add the hdp devicetree node for stm32mp25 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 87110f91e489..0fd79acd458f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -917,6 +917,13 @@ package_otp@1e8 {
 			};
 		};
 
+		hdp: pinctrl@44090000 {
+			compatible = "st,stm32mp251-hdp";
+			reg = <0x44090000 0x400>;
+			clocks = <&rcc CK_BUS_HDP>;
+			status = "disabled";
+		};
+
 		rcc: clock-controller@44200000 {
 			compatible = "st,stm32mp25-rcc";
 			reg = <0x44200000 0x10000>;

-- 
2.43.0


