Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E483C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVYzWkq8RkWeG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=; b=nKNNTI74rWOPl8FItiVu4p6V7v
	90VaUfW1HjLjwdQTOMXo6blnA6J5TdKGGoGfpRQ++2Ycl0yFU6qUAVW8a7WugvPtzc8fNhh1o2IUz
	GW6tlH7wJn1YKfIFn5uu7yEkTsOeYdiqLnSV0N6Y7n92Gsl0NnRdgLho04D+SkKpg6H/js5EgVtLn
	k7mjbTKhBAOQ7tleQQ+DRAY/pOZxJNof0QaZHM9T0BD/b++VbMbAeTmClwwdGx6vPvFKeo4UnS0vN
	Fpw4ZZnWyzf/1VQyG9AZNrkjt02Hx2RzIkiNsRzZ7IOHpTil4Af37o1zhVXz208bBkJtl1kAHqXFP
	enwO4lQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfit-0000000C2xw-3HvX;
	Mon, 06 Jul 2026 09:34:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfiq-0000000C2vT-3ERE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669Gs7h159973
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lVYzWkq8RkW
	eG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=; b=NFLCOJfCuBezPKIGjoBd5fMS4T9
	sm2LSF1ro6b05Lcd+AdtG7GcKw3uPxZByAgcNdB/7fYvFLl5TTY1BGrKHoQmD7MS
	5zCMG+5P7X1nqMqXlow2WrKKPdbg8tYOrY46DZ9Fe++7FXz1gj3Ocrh6GkvICS8G
	ziwj9SbQP+wadn7aCxuNydqD7WrZonxAjmpA8mCYaycPXDWn7vHPU995SgfhVxh+
	MT9LfEs49dbYxctwLr+NEL+eHLb1fMwfWzefZWHc/ina7NERql3Y1eFGDFqiNB/m
	+B1xqYE8/Yjl2PXP7PMGa22Ga5MywjmVPP0JQzqHBfoPABnR/jLWv7JoTqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr22t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:34:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92aea0d801dso256509785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330479; x=1783935279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVYzWkq8RkWeG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=;
        b=BGsPJiv8LE11DiHgAWZAb7I+DWbJXeh+9DvXdMIDxr/wZtZolds3q+YCUGlPISCZ2H
         UyKpAUlWrycSEZvXtD98GjYbdXLonX2pwLQ5TY/jiAw39enAy4opPglbzq8g9XNU7n4s
         EWhdxygKILbS9eKg4UGqOIKnk41n+rIQ2fyrMr6VeyK+uTdRZTqa1YUe5A71SIQdJgR0
         F/qOByDtpkkoiHj0e6goih2qe2WUdcEZGR47NRMHMIMFyNOW3/sd442Fp0gSzrQvb+nm
         C77enTIDALYIwpCMx2A5diSmg/nqOyDrXp9k37ZM/PJYS/E8HVMHf/0Br3twCbFPspb9
         CdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330479; x=1783935279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVYzWkq8RkWeG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=;
        b=IUafPr0VuohLpR+GJ/lpRs26ymTX4swHkY06l7r9T15Rd9WbXvsxcB6aYOoEDS3hX5
         ih4Bb5cLrpY7JPDvDHpw0+CvNC59mfdgTLbnXp6Nlyvbbl4nQn50DBVvNRW+r7oXO3RM
         9hqNFa7oG7GGo/Zi3/22K4Sn9oxs8gh2m8yw2XPSOm2GjDa2y9KdJQgTQ2Rj/y34F94m
         jBd1p0ULHxsSeyr6Qt3l9tgQWm2yt+ksuZV0m0hTjOlI2+aO2bZrlh+nXD7EA0PtfCGI
         AmoU6cj5sivUf6QVzqPT45wrR7s0Sw5ULmiCW57UEp0AVBvCa3pSM5ZIfqIzJPrXDnHK
         HK6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoWVnffIxvGkrRX900iHw5DxKMByAQ7hlaRUOe+VeLZkLWsYEMbHRI7s9JVbX3qaGUB4jfbu+T2jLObA5j6nP/c@lists.infradead.org
X-Gm-Message-State: AOJu0YwWHGpkwEwGfNjTyiLJgSjiNCxQSIRLvfoxPlLyD6gsVRlujtY0
	C3eMacovtLuwYVHQPxXvrat7E9u1jjRiczvoqlHfoCl+PfD+UrPIDWkW4/BwAa/yZ9GIWC9Szr6
	3OS8Imc1t3kkqCA9s6i84aDMLAzhPwBO98zHkXblqd5A6BCuv5AVxemb6GciAyABR48Qo5JgHZy
	x7zw==
X-Gm-Gg: AfdE7ck5ECNVQdaySLyo4DR2j87E/y7gr9yqrRlF83kCpIESJQWplzIV6T/NKnpXwro
	ZUyjnCS22DagyT7bPBJ2hJl2lrtizBEvIZKjGnjKZ3YKuOkG+gPkNSbPEI/YfYy9JB4394cMmZ7
	Qm8iVqlU5aueFMxvxHjJgKCCOIXu5/1neOmzB84Yz0DlWobAL3G0a99DM5nGSlq1dtnCSCvs/cb
	KyANMHy+Lb/Vp4dKVD20p8pyuYePpI5f5JcOSYYXrZN5amdFOXpI8QyIAnDjN1NmkbYN6++23mb
	bng2H8ZZV3VQbxjBMwBgpd2mFa1tk3DsPIreo85smlN+OGHnp2EvXHbcBfw7zDjyq9HPuLVbgKj
	SIubLAgL/VcKtJnOXGuwUsY3QhJY=
X-Received: by 2002:a05:620a:4609:b0:926:16a9:cf08 with SMTP id af79cd13be357-92e9a4d1e57mr1259051685a.51.1783330479298;
        Mon, 06 Jul 2026 02:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:926:16a9:cf08 with SMTP id af79cd13be357-92e9a4d1e57mr1259048385a.51.1783330478878;
        Mon, 06 Jul 2026 02:34:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm23938339f8f.16.2026.07.06.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: s32g3: Correct indentation
Date: Mon,  6 Jul 2026 11:34:32 +0200
Message-ID: <20260706093430.273703-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2184; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=IeKRZg74QyhRVwu+kGBUQl8HO8WW7FxL2jQ3rUJ6AMI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3anbJNEPvKPAm/1YFLMfNg3gBUMSn0Tm6Py9
 TsPqF6qYdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2pwAKCRDBN2bmhouD
 12thD/9fnkq5jQJ4WKHrWWltGuRyHhe+UQRj9VLv5VK1BmER8T8CowIHvmUX0XO8r/vTsWLjmKt
 WXB7pc+QQw2B5KYr2GO3YVt4aoyuO9eclCQuyOb2bQ+Watye2rgVgm+0dtiDDPPPhpPZQk/uIdg
 5o0HtXrtOEV2D4uBNK2JJhZIu+OoCgl2XS8n/OCGs00jegKKIB+dVgRw10pgYsYIsjf3BEjLVxk
 86QbzmKKFf5KNjxbIVSzMWLWqBcblJNJpQvBT97dq+lwS3EaFIye6V/g4ZPwcT29Bd2w5SeuD5H
 pDbC/ipEC8l3U1aEGJoYIDBgEAdmmKe884gec8VkclFcQ5W4e81SFFNxsoRRgCkNik1G8JO7CH8
 QhhRYbga3H7QavEhjpGUaYV+yts0PdjoftKWbDpDuQ4/4+zrcalBxpcI0ih1aR+IkNEdDxL5Qm1
 O+LoGdfiL63YjVzEeht0XAivyr1jiFj6sAy4JK/nNPubnjUkFSbSiSbU+iw2trjDdi8qV3r8vjv
 23syf0qvADAsLkFIEWgOoQxSbUXA5or/Ja7BeuQQZw+0QWGohLf6rS6F4F3fLZAxM2qBGblInCo
 Tbw4GL+l7Sn5jD5YegF4e2KxlWBZWBFVPKWxDG7bglqF6qHvNRIdO748vYqI/knGdanS4SRv3lh pQ5guXLIWUA0weQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UyBnk0eN0WUUhmg577E5EJ-hjmRO6gJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX6RbleBsq11tF
 pf+NNMaw/rx0OA/afOotexUgDXpljoG/TD7GgYeey91aoA4E8GFZXbsSFVWL5xg4GYMqeGUN424
 mDdzvdo1+PEYLiz44Mg4fqAc/8YTmkefoW0otxDW7wCKrz4wSjsUMuYt2IQWGU4ynRaxO1jR9Xn
 Wyb+9ecJ7afukBQdgz1kgPuK9gNsDrbbIGIKTiwwEsVlfs+kKUufMt3fSscHw+2YV22MucqoUfa
 JR3lKQhWwWzviJMTNZxJLJ6bHZmozx3YUfOvfDXIfndMaz5G67jfPPtnpHPVel95GePfHVd3/TA
 JqSbTxr/BkH64qjp+QW8IF91QyK+K/V8MK3fZkA5pxws4Y0gleEkM3oJ/UB6f75SzWXoBgi6TZI
 G+VrRBBj+74Mhy/6IUxZmUv572Ha56L1PDaFvWxqi0SGVPAMzDWnbCgXHufbEcc3fwrOKGu0Xgi
 glORvq5FQbpbQ01RJAA==
X-Proofpoint-ORIG-GUID: UyBnk0eN0WUUhmg577E5EJ-hjmRO6gJ-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX1lpX0Ouhjb3l
 xHSRaOsrthupmop9Ptf8OHhGFRQPKUJ2vWwiVvovwgRX6dD+R3i0rdN5lpL6z5MQjnWg3ZPAb0U
 YVnyrJCCgDpJH9DIfxVA7GrDxks1NzE=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b76b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yCPzjt8dSLUH7PgGldcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023440_811151_ED711E17 
X-CRM114-Status: GOOD (  12.93  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c..6eafa9139557 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -534,22 +534,22 @@ usbmisc: usbmisc@44064200 {
 			reg = <0x44064200 0x200>;
 		};
 
-                usbotg: usb@44064000 {
-                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
-                        reg = <0x44064000 0x200>;
-                        interrupt-parent = <&gic>;
-                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
-                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
-                        clocks = <&clks 94>, <&clks 95>;
-                        fsl,usbmisc = <&usbmisc 0>;
-                        ahb-burst-config = <0x3>;
-                        tx-burst-size-dword = <0x10>;
-                        rx-burst-size-dword = <0x10>;
-                        phy_type = "ulpi";
-                        dr_mode = "host";
-                        maximum-speed = "high-speed";
-                        status = "disabled";
-                };
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
 
 		spi0: spi@401d4000 {
 			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
-- 
2.53.0


