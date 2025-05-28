Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1601C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ccd/GmmVAtJ9YjezxivUTBQH7dGSnkjYiVGpP3ihZI=; b=p6TX5uVNJbqLqRcqc6kO5D72cr
	ixrIYL7NcHGTDUNL+gPnBt97ywMfT26w5vMe+9a6Rmt1mCUiac7suZSeEk4h56HC/fUWJtsteULC1
	LfcZSyzGxYZnDNghCYF6ChxwWp48YsOrR7v5/L6c1aGfL7UuwjG8yFJVR4HH/9kuWMJNj7UW55GIE
	R85HacorNeN/ubRdsTECm4fgN6T/MHHwz6wOK2S/LOJGRMLVOMFkWcqJ3K0KX5E1C+T02DOwFtPLX
	XYqnz9xAj44H6GJ8hIrAvJIbF4cUKD+HrXB0xyrpDDoYK5tfXKGJPd0B1F8F+oOHw35sFjNdXHeEl
	JMZrPLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHFT-0000000DITT-3XfU;
	Wed, 28 May 2025 13:55:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGuF-0000000DFk6-3BZ7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 May 2025 13:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8Ccd/GmmVAtJ9YjezxivUTBQH7dGSnkjYiVGpP3ihZI=; b=C0uzA+a+7Sn4zYI7/wM3atFZvc
	XIJ398gQMdrwrRvEp9vGSTxQ6zHz4Ad4H1+zCgt2Jr6eCr/tr7mCNiutOcOgGD9TSVojzcQM+E9zk
	xHBU1X2eQ5GSqheK+ZllAqa8EQkI8R9zzrj1Z31NHu0ipbondvOFt/jJf3CsQC5modz+1oGPA2yuk
	pVvCFG8IG3ps2jq9f5r/q9xodu2GZWopJ58+LBnNSy6f4/raWbn1dsv8kaU0rHIlm7CkcBwH8OLoI
	lu43TFGCx1tzfM4Hr6vN+HT+YnFnsIVndnQvEZKm1Moz5jKTJ0035JBGNimjLw6MNSMocPHQjTOXA
	PSWF6U0A==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGuB-000000000YE-32Xe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:33:17 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCX9tb024738;
	Wed, 28 May 2025 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	8Ccd/GmmVAtJ9YjezxivUTBQH7dGSnkjYiVGpP3ihZI=; b=gdaXVjjMGwwioBNy
	ZhDgesU82QoE3/jIF2KWxlUBpjIeAY3TCDhIC2JNdgc0Th9D0xP9C/iuKAoS8UE0
	txitkniJD0OxhOsStU7rT0uulLbhXTVj74Aoy6LOV4bl55eatwNZYcvIfkUb76ZF
	09Su/Y9ZLDjKaim9maMWhyVd0brATr+CF8urMHUHctiG8GiWxvDQ8D4QTbM3X8eU
	yuCi/6ajEW1pontfreeke2bVjUh4r780ZKY5qG76TRX4B9uT0N0QKxNGz3VZQh+k
	9P1rHE1+E9G9QJnTwSnLwv35ELDJbIOnHOZdC5oi5yE7/gBb6Nh8czx9R/Vh52l0
	Tv0M+g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f2a2pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 15:33:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A631540050;
	Wed, 28 May 2025 15:31:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0588D6CCEEF;
	Wed, 28 May 2025 15:31:04 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 15:31:03 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Wed, 28 May 2025 15:30:58 +0200
Subject: [PATCH v4 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250528-hdp-upstream-v4-5-7e9b3ad2036d@foss.st.com>
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
X-CRM114-CacheID: sfid-20250528_143316_304054_56A6D837 
X-CRM114-Status: UNSURE (   8.66  )
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

Add the hdp devicetree node for stm32mp13 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..9e3797ee1f7b 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -954,6 +954,13 @@ dts: thermal@50028000 {
 			status = "disabled";
 		};
 
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp131-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
+			status = "disabled";
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;

-- 
2.43.0


