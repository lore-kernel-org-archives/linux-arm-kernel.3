Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3045D31761
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nA3CGM8nOEU5hoHnVX3z/+M91z6FMbIAxtmESCg87hQ=; b=OoeDuGt6Lpsyce655r61ZLTz3D
	q4Ll/42GzusRZurGLvm5i0oAI+sgpO1lpixNZSY8o/HDnUfJfVtnN3JKi7JkGy5qVLsV+lSzgz8/6
	cAVhT5IG+JmwMdgn35JFthnKrePqbj/qu/FHGKjVKocKkwh+r8tLjgDyEqOStg4WrPkfrBIvARO4Y
	F3jofewWQV9ICSpG7+9AQadd9EZTk00QzIrZDoQxyuwApB22JbdalBG1zkCkbJ4DU9xH6PpdR2ssQ
	1+mBmnnkJKb0vZD9WwepxO3qgQ5EEfvyqCn2wr8LYSMKBJPNOcFcq/k3LPam8RGkK0ErevPVGKlXm
	kCeDmmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MQg-000000002wF-2RZv;
	Tue, 05 Nov 2024 16:29:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxL-0000000HX40-0Ggm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 15:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nA3CGM8nOEU5hoHnVX3z/+M91z6FMbIAxtmESCg87hQ=; b=YMYXrZAjkZnm7WINTLF3+AlzBG
	cZZTIkfPms9U1RtccyDAmUm+xVleYOCtauvjMRkfyyM+Fmz4fVm20Gk2BINckLn1zCg44Hgp12HeS
	c+SfrUSvlYecA2FqwDqMHRJvlWoqZFAdzVustc0oxjsS8Mur2mxUDhM1bEpotXET7+WSnDpq2QTFd
	Z2rDXcnENAMXroEK4/a4jiu9n2YkOWFqwFQMjRQPn+2E6fqq22ibm49zepob6RE2euA2oeq0pq5kH
	/1W1LiS9MHEND67YjdfWfzOCP/msM/zNp8DG/0K9o1BuEEgZ8p4wo1HEI+VEhoGMeuEbwDGOB326B
	3keZPArg==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxF-0000000Bme1-3uaN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:57 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DjjHW028612;
	Tue, 5 Nov 2024 15:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=n
	A3CGM8nOEU5hoHnVX3z/+M91z6FMbIAxtmESCg87hQ=; b=WDZNlAqqrS9wQkSQS
	j6BcG2/dH2kODZe1rHHxuf0IXMwNp9DOaV1P/OWvm8ie3Cy9q9S6XPvx/mK40Tyd
	iTaZFqpCiPaJ5xINYZEzardH1xoHwBxd+XmLhgHnpJ01fDvQBr04oiOOUUaocrU3
	bBAhgDZY4t3OCeixwFK6RWuz9FJEDGRcTAlQTVEe2t5w3nRcBdjdxtQLW9fn5lrM
	IlcrjjdAItF+O5PmuuBx8+ZT5XLfTt2Wa/XqTfcFWPb7488g5ijC6T1FGkqO2bGr
	a9+dK0L4tpCMzPd/dZ0PZZ5zsbVoJ8l7Jkp9NMYFfdam4XAGJ9YRpjPgrGLKIWdZ
	/2qsw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42nd212jtx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:30 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:28 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:13 +0000
Subject: [PATCH 07/21] arm64: dts: ti: k3-am62: New GPU binding details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-7-4ed30e865892@imgtec.com>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=hhqqk8iLmkduPLBwLYVkXHMido2SN/KRWTRGIxpLJO4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcx9fojjltVkU92Ha+ylRP/+MN21d9KtqO87NuRej
 dC6EPXtREcpC4MYB4OsmCLLjhWWK9T+qGlJ3PhVDDOHlQlkCAMXpwBM5NdWRoaVyS6yLFPmBmQF
 SrzlMfSf23Zk6fqJR901VJ1O5nVMTfnKyHDLddfR9ZtMZKK3t3Y/2vs1rNbf9oLW/gfXj/fMWjl
 9qTw3AA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Q9aA4J2a c=1 sm=1 tr=0 ts=672a40a6 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=r_1tXGB3AAAA:8 a=OLj8r6_nq0VfqmG8xPEA:9 a=QEXdDO2ut3YA:10
 a=8kPRlD9_DNCPj0uVuuhl:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 7cp2HIR6pZO1F6iol6B0MsUTafw7_yJi
X-Proofpoint-ORIG-GUID: 7cp2HIR6pZO1F6iol6B0MsUTafw7_yJi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155854_292558_5A68BECE 
X-CRM114-Status: GOOD (  10.70  )
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

Use the new compatible string introduced earlier (in "dt-bindings: gpu:
img: More explicit compatible strings") and add a name to the single power
domain for this GPU (introduced in "dt-bindings: gpu: img: Power domain
details").

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 5b92aef5b284b78749a01d44184b66e7776a124d..93dcc67c3138ad5b4a7ad6c9bcabb71a2b7e408d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -693,12 +693,13 @@ ospi0: spi@fc40000 {
 	};
 
 	gpu: gpu@fd00000 {
-		compatible = "ti,am62-gpu", "img,img-axe";
+		compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-rogue";
 		reg = <0x00 0x0fd00000 0x00 0x20000>;
 		clocks = <&k3_clks 187 0>;
 		clock-names = "core";
 		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 		power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a";
 	};
 
 	cpsw3g: ethernet@8000000 {

-- 
2.47.0


