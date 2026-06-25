Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34706CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5oKqqiaa+M=; b=taT1QJPSZlbtlZpleFQaxo12n3
	KKzTwVze5g9abgL8b9i2hsKMPBMrGPWNWAwAxLTODWmAboGOQg2p+ysu1XKiw5C7d1trCXb1lpyPF
	frDKbnA9NyZt5AvM2Gt33FCiv6mbzidxHPDHgFmt3zfBg0VjLshZGePXV7Z/HJbgZ/gYaJkvnp8WZ
	Vi486VAaZoz1zBBeLzqPmUshcVlFd2atEjvUtFLdN/ZxZukgYW/VJLTQ+7nBgtK/EvH+ajSWu38mW
	db7f1GSpDgTrPiTGpWDf/4p7K/0h5im/qjUDzhaVPBQHmCDDH0sm3HfboZZ97joJM7AM7TMR2TW4r
	P54m1JMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg9u-00000008t9L-3s1n;
	Thu, 25 Jun 2026 09:14:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcg9r-00000008t8L-2WvW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:14:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p6V21921052
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 09:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5o
	Kqqiaa+M=; b=c2bZND0RWQHpF3L2dJ0dv6Dl3/QlVETkaQvY/b9FdXJa9Kom8R9
	BbWrwfcKfk3ieyFCameOW+gTBCEcyiptktJA4ejp5h0qeClttyNoj/uSPCevKbWb
	A38KRGhUlJ21NrreRq4GSCuKbRD3fqNesfziYvOsHOPgl4+1+ESUNZAIdjvRPZRC
	UeFl81jiKPh3W8StxFwR0rPgMTleeC/8CU7w3Q6QAi96rlkmpzGlVikRnYWs8mYX
	K3rijrZGYNkUySNqvEu5Aab1TzoyT3OlDDIA0shoVmWJ0Mb1ucNExrZ54lheG9m4
	muZNliyMw104nXKXwlNw6n7LwAMZorO3y4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhavt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso271059385a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378842; x=1782983642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5oKqqiaa+M=;
        b=Prqg9lxHA5q9D6rwAotswfBHbDZ8qLpxLmCXe9BDYj5f2NVHUr6Ej22BInRw7M9B+R
         5e+MKMoF12whMGK1jTExI7PKUeSNv81lR3wqd1PdSnnud1kv9Xmvx6H6nMpoXbDA8k82
         WnTiwBxpTLVYN5WIfDcI/yF5RPeqlD061Zx9s3e/Pokv1nuzdRwy7PKH+uFkUDCyMbPu
         h0eDmghugq9l/43B709sOsW8ZzntVAS1dGSAzsTv5Q9GN0N7YA4aviY/mAppAcoAiuXv
         cPG/1L2I+ZLFEKQUf88ENsRvTF+ciVihFP5DcCTIkodNEzwp95dLgV0seKqnvp9xZCaS
         xcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378842; x=1782983642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOLzOShEjuYgUh8L57a90PA4bqQtCVepg5oKqqiaa+M=;
        b=foKjX2dV8tzsxu3ChCmVPUQ7lZwTBcC9hVRdHmWwNvXxDsE0OuycKMp9GjvGWz3h5o
         y05WzmUoV5Dyp49NAxrR3AgzEep3Ews65g+ydTbF0KmOfFUuOdN9Io6oLu/tQVWPmRQA
         rEw1I0CYAOh0Yvk3GPLuiUzMORnPvg9nVMGzBHAQA1lPcbRSl1n5AY9ELKxU7dM91LDd
         THZaD4SNwXx4xV5yRY553QMefKFr1LDrBpOHRa9rL1jpZPU+1HYYB3LmQCI2y1HroTmV
         XVekWCBxSnndZo7XtbrbKJg50jKBaFW2l2DemGccyJ2u9tsOzO1QumSYOOgGV55vzPAS
         kDAA==
X-Forwarded-Encrypted: i=1; AFNElJ+YzthedVz1GMnvALZdVwYyGHutFhwCfpcPRhcg2TBh4TrOTLlpd5883457b5usV9VShYUcqX4sneh5hLhUFQEH@lists.infradead.org
X-Gm-Message-State: AOJu0YxMpaOcE1jVW+4P2qn03fTdudEO6C7r/1Wefdt3u9autbaDkWdT
	4+bgOqEhG/DAocdNoX7OULe4Rlu2BwZcZCBJMKTXqrWwaC+iJ8Xu+A812Gzuv/F2c/dw+Y6tSaD
	d2MxBsBUB7X4+nUTXs9/Lhrq5TG2cHyfbbaAMU8d4eDb1b8kJVC9FFkHTX/gvnjJ/kSdAl6axAa
	xqcw==
X-Gm-Gg: AfdE7cla0rM1udn3bhftt/jJn2B3mFISw/xpuclC2bPotalcQLMFihZ3l4AQRtjdVTZ
	uS9dcKKkCWksbawXFQYWQL9LLxF/vupDauwfb+ii/v/1oTePRua9jzyLapW93Bau63633s95W4k
	mibDrlqRbnIRJqUNue49h+/wdgAZotHvAy3zVzlaCivunHMqHWH5stVxcsEWSEqLWMFAYbSSxBx
	8XgJo1vqXVIcaTWVej9mm/4Mvt6F0ARN4YoiZ1GVGHhgvUiH5V4RpuX1ETxD2AzA7GtEDqmgSD+
	ue3J7nQK2E6BPUzYZZIT9hHF3t9OYwKK9Zh7hMUygJo2p4Gz/48jVgMaRSjjU4lLCCw8tc94iP4
	l2DwpenrVC1xL4JQxBdAIeqf2/Ik=
X-Received: by 2002:a05:620a:4507:b0:915:cda5:2805 with SMTP id af79cd13be357-9293cec6496mr219778585a.52.1782378841556;
        Thu, 25 Jun 2026 02:14:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4507:b0:915:cda5:2805 with SMTP id af79cd13be357-9293cec6496mr219775685a.52.1782378841129;
        Thu, 25 Jun 2026 02:14:01 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49263f9c59fsm109995015e9.0.2026.06.25.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:14:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id and usbh1_id
Date: Thu, 25 Jun 2026 11:13:56 +0200
Message-ID: <20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=en4xdYDW/tnGPMQ48tqOKIrl1OcXtOdwWtGAIvSiC2Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqPPFT9FosOUrlRhQBfDSnt4DVLHwW4qCDda1A+
 Uo8my+67c+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajzxUwAKCRDBN2bmhouD
 1wW+D/9YvOOw/wE+xXFSqYhV3a4vn8KmLqOon0BYGD374ZsneeujkFUT3wpTStXTE9jL7cAYe7L
 U4Bp0r6GmjHMFKetlfQahrswLjKXadIgDCyx09nk1kg+XOeVS1gpf/2QpuRcNvz0BScK3ofxibr
 vNrmfGlrfMiyWQzGkyf19ed690MkCBiTfAZp5l4R6WP/xce3tKuea3VL9/dt47KRtJ/d8Uo7Z6d
 Hrd+1FdaBDCbOzeEi770gAWNkub4IGeV/d5ZU23l/JfPDT38w8dtL7ahTM42RKV8+HXMUz0NFmZ
 TRCwx3FMLB3TVteH/2TRLHQqIib3yRCEDPUQ4Lp6YozdMUVVUCo22TvaGDcJ+C5eEl90HoHC62Y
 y13VbMl5FJtE+NqDMeETWUMwqf9u06hgmphxCTExbNf6k/LUGTaChrlbEXFlTHnOo+ez+C8c4QI
 n5Sw851wG7wPa6iXvCgb9AMm07dE8jGhENXfXzT0BH41ZjBNA25BqFrswG5nsyuH3qS8SNJwMEG
 ps8S8jPynfzoxAMEMH5ZC7ubJoDiA8e3Kdtv3/9DyTcF/ENgXD/nEpbnmpXgMb/cuGDqZMrqn/G
 Df1Cp0vB2UXSs5ADbIlli4h+td52URoW6qZwjBxD6GFdZSeFiyg6AfywrMhQfScrrRckMZ/4yTP OAaE2/2qG2+Mvbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x6NCQS8qJm7Qhkw0_53ofbM2u0odxrgG
X-Proofpoint-ORIG-GUID: x6NCQS8qJm7Qhkw0_53ofbM2u0odxrgG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX1SYpKQbsMEjH
 R1obtTnVp98XiMCg/jPcsf+Sti+lwhilXHGJiVTOdYVXRr6GDUOV/LeY2MLgOSWgJGZVqrL3plB
 wJIWJsuo8g/P4WLMYPqwq7bqHbpn9nA=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cf15a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rKRmnjq100BRpgpmRoYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXzQcJ+8Yjm/gF
 xNqteytqpmTpk5VbCj5IdAda3sXwDHjsUcuq0Zk6b9ZzIRQzYl+kPOxPTeYQRJVp1H5Ey1zlviR
 4wp4+RRl8YzuGDAelPEUuFAPpzcfVJpNV/x1QgILLjYvK9DWPITt/l0tVWbOvamMLRJazZ7xEVY
 LnXawVo1pn3h1g12nINYAyah33M2z/Bx2ehnFmh5ueFeGcrMAt1pHLItsvD+7XTtoZ7RV6DgCuk
 +IlfOU7qk6QqETWEGUYFCJlxv4cC4DtujNIOr3FOlqAildiOMIPrAKm12CbKmvGCd0u8FKf49xt
 VsDAiAP7QOEQy20FunYT9rZCpQ0uvfMdc5eiTAYD8er6I0PV9MNsWUEjoaBcZQz0/CWuN6Lcf+n
 Etvtej3OECyPMDICC3cnmfGrLuHNs57zJ+znGdeja01zRTQzl+CXu4JaMlG0OE3bOca0EmdYYCH
 jVru+wt1EQVlhNAIBXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_021403_774764_54CD97CC 
X-CRM114-Status: GOOD (  13.25  )
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

"usbh0_id" and "usbh1_id" properties were never documented and never
used by Linux drivers, thus should be safe to drop to fix dtbs_check
warnings like:

  st/spear1310-evb.dtb: usb@e4800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh0_id' was unexpected)
  st/spear1310-evb.dtb: usb@e5800000 (st,spear600-ehci): Unevaluated properties are not allowed ('usbh1_id' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/st/spear13xx.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 0bb88f2d4ef5..cf98160ba268 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -178,7 +178,6 @@ usb@e4800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe4800000 0x1000>;
 			interrupts = <0 64 0x4>;
-			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -186,7 +185,6 @@ usb@e5800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe5800000 0x1000>;
 			interrupts = <0 66 0x4>;
-			usbh1_id = <1>;
 			status = "disabled";
 		};
 
@@ -194,7 +192,6 @@ usb@e4000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe4000000 0x1000>;
 			interrupts = <0 65 0x4>;
-			usbh0_id = <0>;
 			status = "disabled";
 		};
 
@@ -202,7 +199,6 @@ usb@e5000000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe5000000 0x1000>;
 			interrupts = <0 67 0x4>;
-			usbh1_id = <1>;
 			status = "disabled";
 		};
 
-- 
2.53.0


