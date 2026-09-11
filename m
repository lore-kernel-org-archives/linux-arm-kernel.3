Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EA5C88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnYccK3xzr9BQVnInnVflfQ+NjnnOIfuEFeellD6/Po=; b=RMOuS6sN/PYOx4qs7DoX0T0VXH
	k79Q92mtCSWmqVESVJM5Ir06RCJ47lEwnBYphUCMgc6iSCwGfxCh/PwHG5Rbx/ZzE/TkgOTBIgfBy
	wVUpxNASHhsAqZuwtnQMECUPnNsK7me5j9mQP4UKQ/qtYhuaCztsH6QSfr0OiGzfKlhvvacfxzdms
	iqsCxYp+gLjHPPZ4rqeexJFYq1+kWoraaSiXEKQEdGWwb108CuOWe2J8ND2Wg43acvBNhB0VNhm4F
	VOi+x/VDyQtlzlOi4WyYm5X7pyaJKaCyZivt0xlctP73OImILRrMAxDiBV6DW0x4DfPce2Z+HkkN6
	03OkU+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yM8-0000000GM3w-47hE;
	Fri, 11 Sep 2026 10:19:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yM2-0000000GM2B-14eM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:19:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9mXaN3292279
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NnYccK3xzr9BQVnInnVflfQ+NjnnOIfuEFeellD6/Po=; b=owHCw+AZw2BYohNM
	sPxCRUNNHLfLg4uqqYHdJecK6IwrSzQl9uJAqQwDZ8F9V3Uf6E0lQ+48lAUuJPzX
	yCmt4WoAVwkgVQtFjDVroZqIER3OTsvZR8sZTNaL6FeRd/94dnHACVJ4CkxMOcXe
	fdfN9l+4jzYT09D5F6Yt4aYr1vRF8ts2UVkdxKAhKa4ZH8vJBNPx7RDMpbRtNZFc
	iENzZ+vu5/Auhv7e5cUNIa4dIIjH0nmjH7LzXPhq+I33pBniKc8T4zpRmEA94vYB
	TudaJYa8p03mYhpKfTpDTw5sO/y1jaOtQgWTzl1oPU5ALMScGioaDcbxcTMQ11Qj
	HOb26w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbg3v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:19:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939e1847252so276669585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121973; x=1789726773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnYccK3xzr9BQVnInnVflfQ+NjnnOIfuEFeellD6/Po=;
        b=IXDjpksi00ALZXa3wknawSn/jiJ4gVgi5Gu+6/ujzFKtOP3ieGbHU3rUoscuEziulp
         OvfH9mfkwZB2dVEHORqK107N4PPIoxK5G1ar5RwTQDFDYJlb4wIBzq41NKQ+Z8zqBI5c
         XYPZpT9W58MuhUoIWAgWZZx4EZ4v56M9nyyLTjABQdJ34bzuUbNZEONxso6usT7lHqx2
         OZfi4Ce3Yp7LLSeqJrDFycvdWgLOZKGBF8et512NBYxreMC+qJA66diFCkJawpGCCPW1
         GK48OrZ/kSGu4DkeOFYvBRUQbXTjPJoAYDTsQ5nfxl64H8AuUvOvrZ9x+dMKbMj+5Po8
         iVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121973; x=1789726773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnYccK3xzr9BQVnInnVflfQ+NjnnOIfuEFeellD6/Po=;
        b=c3mi3Vwztg9d3eFaw4ecR+e4PVhWpKLOQ0M5yLW8nuLDlrpsg0doPGFhwwF1H0jycA
         db0h3AmTdJHsh0lAcb++Vxfq7aGF5t/LlntPNFlegimurgzF6FQ8e7ZBxHQTx53EQxz+
         Ge89gVEZ2N1iA2/LruQLj3JjXjmXkkDqU/vfCe0x9zEStmPX/xoFisvQmzdDKNr0PTUc
         JOrdI/iQ0iuKSc6s6HziJ8fvkLIHq3fox4qVoFpI4UFSUmkIs87mtdzPLB6vJcD2WKcO
         MGePWgnNs97zrfhuAiRItNfFLOeY6+pUgnfDi423fr170CLTCW/McQ8wm4cBKePgvBjV
         wjXQ==
X-Gm-Message-State: AFuF++kydhf6vu1xJPqYO/ZBlWld4vxdxfZ81eyehiGUDbeSJLab9oKI
	iPm6Wo/Y6JlgcsD9bXEc7JI1f1q2jvPbinCMKwQ0QWX+RS+6TaeEnO9FsRax7FKeG/dfTa48Eny
	PAnQXwKMcCJCVaw83N7k0vxcSAcw1J/Vvp7VnYp2J8vPhrwmE4fMx9tB5q5TMD3xJDG5o6L2hy1
	+PInM9rKT4WQ==
X-Gm-Gg: AYBFou0GTcpWgImEbt10CwkZRXIEM39x0CN/9zytJ+lRAxrlGCRmynAnddXkDD6PaJx
	bJ5RHz4MgtVrN1Xgq36VbMzOY4/cTPGkRQroGvqEQsWxn3kTeVUT9TN8xYFx7PkBNcdR15G099A
	g90TuPBzYWtqWrzh6WGO5ErBdloDf1c09i8XdegbbBbx0tfXZarRI6d2IbqfahVpbfmrpzfoe5n
	WV26oxSwXG9UNItf2+tTkACqnWTsuTmYr99sRH+YLmnVY7tWltVeXg4UAG+ztBIitNqF9FMrz0o
	7njyIDwPisZjGvjZxaLNkf0a7M2h/Am3OmaKgOAEL4gr6ismNeeahZuVvVr5p7egejWxMVVl2ii
	9eh7YH1wp46O56hiqQzV1ufQ=
X-Received: by 2002:a05:620a:628b:b0:939:72cb:bae7 with SMTP id af79cd13be357-939d7f86baemr1019422985a.30.1789121972750;
        Fri, 11 Sep 2026 03:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:628b:b0:939:72cb:bae7 with SMTP id af79cd13be357-939d7f86baemr1019419485a.30.1789121972317;
        Fri, 11 Sep 2026 03:19:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:09 +0200
Subject: [PATCH 01/10] arm64: dts: exynos: axis: Re-order nodes to match
 coding style
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-1-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2959;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/7+9wiOI5IHqlAQwmNyLQEH0oKQcLytjBMp/ZKWGtEU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9WncwhGm1lsFzVLd1FEm5BcMS/WzSbUizJeh
 uGDnExUqOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVpwAKCRDBN2bmhouD
 16YCD/9sqlvyODs311xq2lf4+fkNygfAELWHdXyW1rIYRo1mRWpS8ibpDYHOJcbQP7brjV7c5/T
 2yJpmGDnZVLBDgCmCgjiXCZhK+K10d2fHiMFNh5WGObqZDeU8oQhXazoNHNFakeCnCFEKTL1ox7
 gscO4ijcr7A0spZukxRNRIeI5fdPN84/Mcp6cx8gIdElKRwpetPVwyjf4rxUsoy/fSrw7VL/K+3
 J9AA6hKJ/pLvuOiVL81GN3gzDy+EdgAt1NkP5SKjcC62Mc60xK96b91BGXejCz1wLo4L95LI4Qu
 RVCXyxVMutiLGPH8weA4B/eOPbyqWkMxOzb+w+a6/1K89pwe12hjTI61JiQk7VG6AP7SpNRgLhk
 ncKXFTtqyPc2IHs/muqGMud2+qljhmsHV8QfcaGI6LLv93jQGChqQxx9JjrUQE1iNcxz9nwlwzF
 8SxVpNDIninijaCCu7GbekY1SQd+DH4Kg6JhzZDf+DQjqdOSBa0fNS//obzuZ442EDYqGDDLGP8
 uCe2QsvfH5RoYZRN3KMLsUmENjP6yNqh8HdZDXBRX6uLB23pE43HwzM6WpR5glZqSfmpPc+8pq2
 b2hkteFYjRTTfA9N54t3ZWTf6Dn22iZv0z8XWArG/y43w6v+/opxe8ucagIaW/N8n4rz1NZcT/s
 SPNWEPPbjYIyXiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 1ZViv5JTHXZosl4ZL0SUy-oqWsbzuBqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX2L3RstiRrNxJ
 pCWtqS/7/rGLWtC4NAc4+OErbm+lRPvGtMbFQ3V4LPp+Z7VsheOG/bzle2r4ii+xV/hFhSX5CTA
 IcWSgL1XczJ4RWWvYqAIOXIl55Hh8+mGTAvVeq4d2DUVewhRlJoOKGLdrGzu6u4BkJH2IwAok7j
 Lbhb58qltMF/BylMbOVt6dvEh07AG+GT67rEQVXZuwiam3BgxRantjCBNok4K/f6fCosmp7x6N6
 pac+yMvVq+tdy975E9xhN+KGND/d1UYxvOVEalmLOMFUdEXt0GFfTpTRJUqyU7muw8C5mDTgLvy
 4KNnzCP08EahNL/qOV89SR7gPDrAAsZFmJVBYjBVktMPCbXg+rFrqOqVgtJHR8tVgKyZV7/ACJA
 AOVr3IGteeP7DgdnIrxj4sjr4Ne9+uaheE1N1JtxettNFlwhY/PVZC2zewNNgKWh7dy5tDj/Fjy
 OFnYh9t2yEQvuGL2bhw==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3d5b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v5i2LZF9WRl65ewKHLMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfX0bxOpm9q8hEx
 6ac5C06YXzLX8kH9kIaIRbdB+2yMOn649YU2h2l3VHvzC301Tb4p0twPSAo1O4AbHNFnP9AMLUx
 ZZ3Wcmcq9PViOd0tvhJB/EG7RC28OVA=
X-Proofpoint-ORIG-GUID: 1ZViv5JTHXZosl4ZL0SUy-oqWsbzuBqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031934_305996_3C354123 
X-CRM114-Status: GOOD (  13.68  )
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

Re-order top-level nodes to match coding style - ordering by the name,
as pointed out by dt-check-style, e.g.:

  artpec8.dtsi:77: [child-name-order] child node 'clock-finpll' out of name order

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi | 32 ++++++++++++++--------------
 arch/arm64/boot/dts/exynos/axis/artpec9.dtsi | 32 ++++++++++++++--------------
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
index db9833297982..853b2fafc8d1 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
@@ -22,6 +22,22 @@ aliases {
 		pinctrl1 = &pinctrl_peric;
 	};
 
+	fin_pll: clock-finpll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	osc_clk: clock-osc {
+		/* XXTI */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc_clk";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -74,22 +90,6 @@ cpu_sleep: cpu-sleep {
 		};
 	};
 
-	fin_pll: clock-finpll {
-		compatible = "fixed-factor-clock";
-		clocks = <&osc_clk>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-		clock-output-names = "fin_pll";
-	};
-
-	osc_clk: clock-osc {
-		/* XXTI */
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "osc_clk";
-	};
-
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
index cd46aaf05628..310cafa14f5c 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec9.dtsi
@@ -23,6 +23,22 @@ aliases {
 		pinctrl2 = &pinctrl_peric;
 	};
 
+	fin_pll: clock-finpll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	osc_clk: clock-osc {
+		/* XXTI */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc_clk";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -91,22 +107,6 @@ cpu_sleep: cpu-sleep {
 		};
 	};
 
-	fin_pll: clock-finpll {
-		compatible = "fixed-factor-clock";
-		clocks = <&osc_clk>;
-		#clock-cells = <0>;
-		clock-div = <2>;
-		clock-mult = <1>;
-		clock-output-names = "fin_pll";
-	};
-
-	osc_clk: clock-osc {
-		/* XXTI */
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "osc_clk";
-	};
-
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;

-- 
2.53.0


