Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D09C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=; b=gBRpBq3tCHtYvozDZB94nBe/qp
	qbi+ruDF8bcdIZRf5Bjlz+MPKNfloKJn6+VW76ioSabWiZ3mqY2jEr6vSEWXLgKq7d69uWVt4ceGt
	CC1syrNgicwrx3IFw++0Es1LKIMuREbjhZwo67zbVvYfqiVNJ5ZIkPeI0JNEHy7eMLfaU9HObGbOx
	WRh/o9goUftVk+ldEkSTBTKwk8k7/B58+Q0ip+6YZ5C9d4/CTvM4jU3vrrnLXBwm5GRbHrqrMAIUz
	NGbcT3+98G2RE+QqIdowQIHjEAaLgvOcnAi6v39qAhS1OhbIavYZGuAFv33qF6WAnNx+hqfrHz20N
	ucNX8fOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ovs-00000007Gje-1FaF;
	Sat, 29 Aug 2026 19:41:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ovo-00000007GiN-3kuJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:41:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGwxtQ1742423
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr
	0rRgOknU=; b=W1fHASaeVreLYR8e0aAhG+oZ4kbfH0cC/6kqLiOExVdlkiKN/tw
	5UW+9KESK1c7B+YpLNybQ6m4/pDM1ZWhNAw7WVBat6Ni1j6BcPzzroObh8NEPhMV
	UURUQYEW9ea1ktwz1ivYzU2LqzQyhIzCbu44lpuMtLANlBAQEJczODPggbdnz/pn
	J33EjK1vf3sV4IxnHPyNg7ZWNO9ilXN+rdafgTe/AMzVRFA8Ym3jrfbGyFFAp8Yp
	9+6EMCSVtdOcL+fCKZaqGxFmebX4iex6GU/1PXlR+7SIWYu6Bn+r9vbthlFdXRds
	OYnsQehtSl+fUFGCTq/WSoZC40nCr2otBfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81g5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so54928971cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032495; x=1788637295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=I/tG795610Jds4YDPhGwcWAs27/GBQ39eoiRdsqlxXzWAkjSnwKvmg1RKyBhaBQe9i
         KUZjnjyC8PmyfiC88mVjIXsfFDymW/xNJ7CBYviiM/fy3zyFjhbjjPyRNgOkSgA/+CcH
         7AfB8UcbmU7i+nGWHiMDcx+2EkOhzWgcioyvbcvO9N2nBIEMHR+9uQqKsw7alieKIFfV
         jMx74c2W28AyYunsJaldSFN1CFDU9Zm/qp0utnMuVTKbW1OoF9F5wzXUv3B2qcUGYTe5
         Gx8FBmpJqSvc69HgjWhy9j0gcTGZTQnevXaFSvlavPpC2P55AxuB6teu5VowWy+h+Y43
         z8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032495; x=1788637295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=q5cyzvzVzNjJsBaDCpzGxBBpVVPIojf+nCTCe2+2t0PDd1TYD1uRxBSFQ57Uwyy0GP
         g3Ofk1xTl9GBcq5/1CMYf4jTGtESaLMGjt7XuoIh/me248PlbzIk/uINHgBxCx9Cy132
         xyTpLX/a+x+2qLj+6K7IHaY+vlA+Yl7pxFXMG7EXDspdY0yLyqgUsRxKjsgRefAx2wyZ
         u8m1s6wET75DdnO68VmkGbPGMEv3bp+fIRiKe9dRzs681gvPIP0lFTCvVCrLEYFYWHtW
         3LF8WaCg/lAYukfR4zlRxZDdifON8YDdg/ogvz2M7pqrggGS59kho4LQm1WFbXYG+3hW
         5Gvw==
X-Forwarded-Encrypted: i=1; AHgh+RoHD6Zq3yJ6eu3LT+gvs2vJd52ZZi8UQ2D+P1VHxAWo3RyMs5B/EZ6FhWS4lmq6meKRDw6Hlib/DZ2GlG/GvQ9d@lists.infradead.org
X-Gm-Message-State: AFuF++lWLdk8FJaTBWmtpuKLE1fx2tJw6W13N8+Q72tokSI2akOvll7D
	9UsjX5XjH9LaLN7k1bcEpB2gowr1iBzg8rluedLxHAWKnI1YsxsVnNC9eZQGCX0g5Wf0PKBGM3/
	B2a6o67+3qYQmOPgiCkWlP1tfLhh58+eN/eSg/PUSy2kfVfO3S67L/BwbN6wjGXHxds1Z/YXvc0
	yPGw==
X-Gm-Gg: AR+sD13WuBetXxLBwjCwJzBlaMxdeSbZsnNaINoVexE+C7/ZMdWnVfwIEWO3hhyGn5c
	nRYs+0bpA15ouc/cgbtRdJNlBRfXcTh1y1u4qqYMZb4JxG6CgFFKfK9f597HbvuSsfeKLLiuE+n
	nIaTy0aXqxhVdHbJFiAP+rWLRzvVcO+wmR4ICpsiHlceuGyYUXDJvZFaOr+VsTapyfpXjRgriZA
	EGpES56i98ZThOIfJVsZOioH0H0MO+4miYtlXyzerfbE0DbcrgwKf3BY/Q9T/ywhEQRxF7W3Wqp
	D4Xn3wuDQqZ3nOxqQaDgiVEgRGCoiitpHGPLCxChquUmsJsgVry4o4DtffIjBNPyHLa2rauK/c/
	o2JxvGR8yfXX1/YY=
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911281cf.23.1788032495535;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911061cf.23.1788032495180;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48435b024fbsm2499802f8f.29.2026.08.29.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:32 +0200
Message-ID: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k8n/bi2g8bb5SMtULjvD127VMpit1jAkK54KyWSdN6Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXr8Tf8bT7OCyOkAuUb/kCNtsQh7oAUs4V8i
 RtE3/I/EL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM16wAKCRDBN2bmhouD
 1wivEACM2xUyoCqIPlXoVuxlyn/QJ8FHgmm/6tDcsawf2Fro+zfY2Y5Y89LOQJgHY6a72n/xnjM
 GGoOYSZWlWJgFRa64oN8BwBfmy8BFSyB2USpUX9Sa88PGWwIBjH38PhTuge0fIfpCfL5k8k+SLD
 FuRz+nBWes8h7zDU0xpdV+QHLisd4U/ImjoJX4vUrY2UWNZnizuZMrJlhrrSsdL9zagFS7JnOuP
 57YB7SPsi6ECqgW0HIEWw7u7sH93bQsox8wp5BS+O/eQSAHMGclJ1iLiMgMAgC+hV7nehLSvJvW
 MTu1ZUWE+mjB98z+QiJveQef/Hk8it7QZvjALMURpOc8ynbF/Ye4VpVAHlWP6Uhy4FONU4E+P5u
 G0VZOkGNNdM6UqTwiajiMbmsD0twLMgPWmr/WzrWCtLAmUbXtCLtK1qWms8q+C94Wak+a0mBVRp
 f15zFI2CB1VY8zsABi94X3USYoMPKiTDfrTZ1mFNEXyLJNVecleBVFyCNhmYSSpSmlLiu6afEm8
 tA4r4umx2V0nG+RkO2Wz1yiivT8HdoSkMeQpfb4JZE+rUAD0Sm0FPaY8IFCFvjGQcNuxnPYCNXr
 L7wE/I0NO3OIXPODIWa5bvsIduxiwsrg2xzuOMTEJUWPDHusoc6fhOluRDpn4V8NKptOZVuGylb THyxiCiWRXx2t9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 558BqriWzf3M7djZVa0q1xSvHJtk5eti
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX3Ngrq5AcNjLE
 Z2TInIUVzVvGXlxg1OCK8K89B4s8Xn4tKG0wtXbM0CFwkJHB023TwIO31JAbkPEXF9TPYY2pbTA
 2iQPLepOESEjRrVhfRZ9stJl1OzEGcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX67+DuAtxqtlL
 VmduQ3bM27lmNOUbKdBaKsmq5gB+sX7FTDiM1KmEpFVcnI43R5caJ8/zzgs1HR3HR+Zxz73ZT4B
 T/G3gyU21RX/JsSBbFMb/UlykLl6BmMauNWN9riZN3OFxrTQl9LYZOoI8utR4gL7hLBpWu/1bkb
 0FD8HeObMidURkI5NmQOlrwMSZDnWnRMempu3IIvquSjO9HwBZ9/OQVfT/TKj3l0SRTH/B/kMRl
 u3zHHO6POUUvoHZaVF8umA3AczUKzOX2oUIh1nP5FbRIY56A37SfYXcYd0l3sJUPDpTg+G+g73Q
 75l5MAxt0a8knUwcZuqDY3qa/ck2hs5lRrH3NDDuWvf8U/86E0naqr4ouhtx6abZavmC5tMrChG
 hrfw5F2yn0XYegAUmKcl8glICHVZb8zDjZCLLq3t9pVlnTfMvOmiiZU3OPU1TbuKrtHku6Nf1T7
 VJMVio3Sq6SGUTkj7QA==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9335f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 558BqriWzf3M7djZVa0q1xSvHJtk5eti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124136_945679_3720BD9F 
X-CRM114-Status: GOOD (  14.15  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
index 5f44f09c5545..adb9ee57ac11 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
@@ -873,7 +873,7 @@ gmac_mii_pins: gmac-mii-pins {
 			gmac_rgmii_pins: gmac-rgmii-pins {
 				pins = "PA0", "PA1", "PA2",
 				       "PA3", "PA4", "PA5", "PA6",
-				        "PA7", "PA8", "PA10",
+				       "PA7", "PA8", "PA10",
 				       "PA11", "PA12", "PA13",
 				       "PA15", "PA16";
 				function = "gmac";
-- 
2.53.0


