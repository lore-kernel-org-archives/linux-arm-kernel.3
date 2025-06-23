Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAD4C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOsuluXNSLkxvHwd4tbbEr6WHEQwIqQwF7TiT8kGSEY=; b=lAQdblJJAU7hYd/u4XgMKbb8H3
	ALjTxazF3j3EqGr9mwoUNa/M/ZPiaxnclV5RS4/1tIEc0b3pKEfMr9VR4QJ6PqotXRhs1GHRjMUt5
	CLhkI+VQi2rLPy3+ipffRV7T8hcKVpiMSbTGVTIg1OFB5QwrslF0inBH5tQLVa+T4Yc8iatGYrugQ
	YiyZ0hCOPYo3p6+CFUdPMv5mBJUkcKG0WXsx/NOB5G1f31PXwcYq849LTP8EL0TBmJmsA1EIbaw2b
	NJM7QbXs9sIW6GAAzT8S5Lcq6xNQul/5kXkBUVEhJDEt6Vqim+zhzEOK0wbMv1QP2PMPfb9bxyLED
	Uriqj1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdeO-00000002D4m-0aNZ;
	Mon, 23 Jun 2025 09:39:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdUv-00000002Avc-2L36
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 09:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZOsuluXNSLkxvHwd4tbbEr6WHEQwIqQwF7TiT8kGSEY=; b=pXbSL0kofYxhJ+Z2oDmhn8jEwb
	PvtroSy7V+Doe3mDvcvKr1UYS1BofAAOcPLtVvR/7qbg3ERFLFt4xhSAaSosShIBBI6/lTfDALrra
	mHKH/CsnYDw8u43/85TSJ89qYuE3iLD79kpAsEaKkuWrWPEFwexhX4+Vjy1g523FqfNPsg5VPHCTT
	zzAbMWiTwrrslogwA4VkUEhBPoPmbCShoeG5TIJis/1d6zOhZ8KBMfi1WvKEfgWCFEmy1IXXTdvZq
	5O5ateAuI6WyzJH0Oc9lrfMnJgPnDU7uH6mPL+q0lhxAO7Sd3XPKMhkl94RpqEjvBGNUlm3NsSANQ
	C6f2I4EQ==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdUs-00000005ASp-1OC9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:29:52 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N5ppEk002482;
	Mon, 23 Jun 2025 11:29:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZOsuluXNSLkxvHwd4tbbEr6WHEQwIqQwF7TiT8kGSEY=; b=xKjNtqKI9/+dDLG9
	oFTGydhHzjiJWbKuNHqPXZyh2TRLdnYlIx9Wm85jf7VTjSZEvYT25ojtBP+kPV7z
	9OlpKZApBw9+xxKb4ywsAoojQBi5XX62vGKvxYhUB7DwqOyVytNjHH5NX0eDuUUg
	oANtco0jJceMp29Z9UDP5B+jVmhEDXG6ForKdRVtZe5gU3FLGUzWqCN2I0P71Enu
	9vHisFwQQ02suimEnYZI5Yjgj8CWp4ShkUCe6bsyJq5DnP6BEdUehg84U2WlKDsU
	/ps1szoDjLVxduRU1fyVtDGIWj3fexp2bRoywhcM1xQEbY6OsvEoMrzKchqre+8I
	lAXVnQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5nfca1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 11:29:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2629E40051;
	Mon, 23 Jun 2025 11:28:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5B2E5C37FE;
	Mon, 23 Jun 2025 11:27:22 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:22 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:07 +0200
Subject: [PATCH 02/13] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_102951_244034_FBFED1BF 
X-CRM114-Status: UNSURE (   9.39  )
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

RCC is able to check the availability of a clock.
Allow to query the RCC with a firewall ID.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 88e52f10d1ec..83974b7fb82f 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -31,6 +31,11 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#access-controller-cells':
+    const: 1
+    description:
+      Contains the firewall ID associated to the peripheral.
+
   clocks:
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
@@ -123,6 +128,7 @@ required:
   - reg
   - '#clock-cells'
   - '#reset-cells'
+  - '#access-controller-cells'
   - clocks
 
 additionalProperties: false

-- 
2.43.0


