Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F388D31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pzi2n5rq5qaQP6xCE9EQoWu5ATUTL3MLo4MRNMqXSk0=; b=YeOyPJRWa2poR9rum7zyUkk91Q
	nDg004lY0zQawLu47w8pWgx8EwYmG/AjPDleHbKcKXWH576zjFytEBqXzwIC44/UWYhvyhfd+QhiW
	RK3BaVX/5JL+cuabNZCtG6AFxYQ1tMdJ4Igtt9sF3pZDmnkfhSewvIEj9DorA3PrTgo0kBGzUKSQ6
	vM7gLb+x+IBycmGkX65i9yYPkoHkb/8VDQ3Fhs1MHviBa32nWkUfqaKPLvuOyF4R3K2WZW810Mowg
	FtMZ4skjrMEwQE+cIlZtKZSvJdhy7SO2xygtZM87q0qb2CdZMxciwPsd8cfrZ44B7t68Hml87F9ep
	MuhcsdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MVl-000000003hk-0CYi;
	Tue, 05 Nov 2024 16:34:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxL-0000000HX44-1CSu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 15:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Pzi2n5rq5qaQP6xCE9EQoWu5ATUTL3MLo4MRNMqXSk0=; b=NToM1crtR9ht/A3Y3o90yvzLA/
	2VLYOlWGzwPDYEh434V2u1ZX2YTkfCFcE7B9DR/1P8xfHnfaF9Up4fRjndZejexkpQrf5hVVHnZlr
	BatX6hjuv+KBW4Pgji9dFFxlxZjTe6HIRQ7kcJ7qMqAt2nfZTjBIZQhg0A2viMKVvfQqytg6ovVo5
	92OJW6Jo/Oz7UqdCzV7AiK8P5Hz00fxbik6vjd2TTm9q+Fzxj7H5lLA8aSiQaAO6sBH5Wt3YcLoyK
	CT/RzCm7LnKYWEnhOkaQH3fo0v37vnLl5nik2R6lQkLoK2E3Pk8QWoyQ3dIg7+OtkcYVuhjt7eMYY
	xafnx+qg==;
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LxG-0000000Bme6-05ck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:58:58 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A58CTKb021812;
	Tue, 5 Nov 2024 15:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=P
	zi2n5rq5qaQP6xCE9EQoWu5ATUTL3MLo4MRNMqXSk0=; b=r8DzNp6Plg1bnMTz6
	KSloRvcwzqJno0HdZQEPOKLQHld/WAS7n+ZT8BAm33oz4m2D2sEXbp04pKtigNc1
	T1XLm8TQn6Q4ZLET94fA0rXQz1QD0XKgVcl9VDr7tIewRuXo2BsziT95SLxyDfi+
	aXtAVzG/zY6p4LletTFt/nHFSvyu9j1HKht/3cZDTTJjA8Zcs9w7DK1htEEkjMrI
	KPNGlBbcTnMy0101spApam1mW4qacol7V+YwTg4ttRjiNytpWKEGULY+AxL5tzsf
	uYhhSw78EUTPOekvG+LSyIuB9pXqoG5/XC1GDKZ9DnDlk26HBWon1mn2ljOkuXDo
	F/W6Q==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42nd212ju3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 05 Nov 2024 15:58:40 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 5 Nov 2024 15:58:39 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 5 Nov 2024 15:58:27 +0000
Subject: [PATCH 21/21] arm64: dts: ti: k3-j721s2: Add GPU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-sets-bxs-4-64-patch-v1-v1-21-4ed30e865892@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=H8DIARHN5LAhn899AhP+EfNJuCgcAkEDx/aJO8V/l9U=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRrOcy/tSIl2eOW2/xHuTbqlRpc2gol/n0l+jVaK9blT
 fuZqXG3o5SFQYyDQVZMkWXHCssVan/UtCRu/CqGmcPKBDKEgYtTACbido/hf+D5a+F8zl9zFe7o
 vnCa7NVxfv06I8vsj9MrItvfLInIL2b4H/I9f56zcx+Pijh7ijN70j5bB/982XrZd/UdK8222Qe
 yAwA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Q9aA4J2a c=1 sm=1 tr=0 ts=672a40b0 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=sozttTNsAAAA:8 a=r_1tXGB3AAAA:8 a=rLJv8WYccUdZFC7c5UsA:9
 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: LOeMeKqUdp1x6fjOdbEc-ZDE_Y0zQzjx
X-Proofpoint-ORIG-GUID: LOeMeKqUdp1x6fjOdbEc-ZDE_Y0zQzjx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_155854_366079_893EBBD6 
X-CRM114-Status: GOOD (  10.60  )
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

The J721S2 binding is based on the TI downstream binding in 54b0f2a00d92
("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1] but with updated
compatible strings.

The clock[2] and power[3] indices were verified from docs, but the
source of the interrupt index remains elusive.

References for indices: clocks[1], interrupts[2], power[3].

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 9ed6949b40e9dfafdaf6861944b0b128b053a44f..b2441ac9847d7e64d847a5cc220d1a79d0254bc9 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2047,4 +2047,16 @@ watchdog8: watchdog@23f0000 {
 		/* reserved for MAIN_R5F1_1 */
 		status = "reserved";
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = /bits/ 64 <0x4e20000000 0x80000>;
+		clocks = <&k3_clks 130 1>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };

-- 
2.47.0


