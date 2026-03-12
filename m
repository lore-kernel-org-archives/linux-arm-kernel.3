Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC30106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=; b=xktC7qP2dy9PIrXLC9SFdLyvK+
	CehFRGFC+oO1cC8Sx+p+pvP8PY2ytdDU0GJbvoTBkHd9/prMtCGZkJ1+OqBa2cUxREKEDhrSmsf7N
	Cec6oK52I2EL5nHJj5ggnn+ZmC8MtvzasXWkxoD97Zia3CnveV3R7Ubq7nKggwg+GXzJ9+6OO20k2
	ut6X53kCFRnUPSuAEE9FKhr25r//BXce3R5TNMmK6Ck9Nyk2EMsvMw6cOXI+2uveUuJZU0lr6xXPE
	pq1DgMnTFi41qPnPy8YLoWbhCa4SIuFTjhT67ylsGJLdTK2FpNbPRa1JUMritKexQAqXIEsL07cmY
	EtWTGaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYO-0000000F3Ko-32J4;
	Thu, 12 Mar 2026 19:18:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYD-0000000F33J-1R7P
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=; b=U9egb3J+fgvf7UIIRxFqykAxld
	j71XYScgXhGcxgp5+vDNHVoyXSzy6BPNLVMeVbrk1HhNhK2alaPRRq+3sDuPQDwJzlzFJUnf4PSzN
	L0fe4WZl3MBqr6+RuWulX3V/QT8r23a23USTeYy5g28zs/42Rt7RaR83APdmwca2WHWSvJA/KcAbn
	s270LlI2IXVIXiYAng/XNdMNykbZ3ywamQfvxPAPNXMWC9hqRmJPe/sijlx+4EUh53IUuixIIejgZ
	glrKoLse3t+XxhyjExyoh8vV4Gs2D0osuPGoLp0mCbWtDGVRdxz2XpNCU6zSC120tUuQG/KI8+maE
	2aKWbqsw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY9-00000001qwn-41MD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9Zl933137108
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=; b=KliSlHdfu5J9+2wi
	NHl3lJPdQmB2h73Icay+jPPcgzvwRprGrhm+bL2idjTTVo1C0GaNmTZePCSLVshv
	pHy1wj3YqGu6tBXNW/2ZuxX7cKBv9KNYgz3h/ERFMk1ZVtC847kh+5GYfhy0lvJc
	ESTzLfonPOoMGnWt11vh2CffTFWgKBrHqvspVVA/sbO7JPFfR/XbpN1mltlIKEkv
	4gEXJ53E0R8dc3pqpf9jlyV+22Qf9aS1kHdT1O5TBQ1KV72PZ65hnL7MBKE71sci
	fxQAVm60XVo+Z5zjj7DdPa++FPQHTRxNcTRLKJmU+eoRPbd1QzrrADdHpYUnMZpq
	WtRoLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wba0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7de0e161so890260685a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343103; x=1773947903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=;
        b=hwJjBAHBAwCv5xoQJ8EGgGkf3jRurg+hst9xsHUF6kxRO//r2XSv7j/LSYu8SmUgcj
         9JEMeN1jLuyBrQvTodIIcV7ejvBZKMzF4U6Wh38UUtpcjV0v0iDc2KzrlR4yGZi20hLb
         I37dsFOeGu2AB+s7MtuIkqcvEAv7Rh/jY0tRNkPLlt45dDUSTuGs3w4Qn6JhZq0rVUCM
         2jlBIDx0IAT6JXEX19v4QGrT6THYifzsYAXaIjN8rhSVOMJepzAICF2QSiEMwQbA/Aqm
         tV5dJvHaXILUpQDGTS2F41SNqYpuHaCNIxRPSc19VVGV1IZUZMRmKc5jZZjKY4AEBgEq
         2rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343103; x=1773947903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aOg1TvMt5mwIozSwq3v3obDuc2Lhso1YJ9tDY6h6AFU=;
        b=ofc9qiXezAjmrKs7wtrdk+ysxJGQyN5ug+DRXaEMJqnP36uEa4Bz5F5cX3g1FAIj+I
         ORsZSjfWLB5TtE/LqhKhdyXHk8mb2Eq3PvKLvgh3gsqfw/3aGlxOMd0tAHw4MbGS61X6
         8SwSozfyKM09yJoGtzUeNdFNVq5eDl4bR8iwkfNBZTZ9TtDNlYmUpa7M9SvZ70lWLUbq
         kRj2t7XZZAEiNKptLbijMPPPg/VKKlVLjStEYCjyZqr7kl6/+sD//77rRWo33ohnEI7P
         A92wfU4TIXVVrzVFmruzEVy8HUEIp+WmwFZCtDQcbovhTo1Rb2p7Nv8wgmG5Cm1/qZdZ
         rNFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq1ZeizvxoACe+zNGZlNyPOWAWFQ49YWyfj8jL1GfZ1/feIGkMFnZT7gqeNqDrN2f+vZAzxPrW+4MJn4DhQ8p0@lists.infradead.org
X-Gm-Message-State: AOJu0YyqFzvux7oQAVS1iRR0Nii8EaFkm/8pWEdTfBuOhqxFLh5t82c7
	VeWyE6xeCH3c4dFIxkOhI/h1lvck+dM1GZQcATbwDvB9KkodjoD3sEov7NmKdC2jMAuZvGwlHqh
	2ctiCvgmZc4vdRI0opTnq165YmOO/V2mWB2J3xs0qfSpSeo9mZSaansAcjHSF/sl6dqv2dmV9b8
	bxYg==
X-Gm-Gg: ATEYQzzVyIylg9UqMq28UJyMICVtWO8m1XpN6LS1MKa2NIxWudLanZeDrxSPSgxDfrr
	4Ug/lsBY66LAhPsTV8BZIw+gSYHsjZVVi2R/lNksc6WdG7FwthLLA5cMAvPn0RvJEGpRl3zH4rh
	efTjLJYx/DeXD1Qzl0utXOmrgoHFHhDq+kzy0H0uxvAHOUPd48vSAYmxeXGB5sZILrIWe+ksfDv
	VypsRK5LkE1fY78UjTqgaeTrUZjK90sVxHKWkDpWLWWLPWzFvMKvONsVZS/ZD7lwcRBRcBjUt3r
	32Kb6O6pG+HuggcDXhhEXeZf6VJAS0nabhLw2KBRra2kHBjJDyUBfnm+T0bbyOQb8YmZxIHaoBw
	lTpngHDxI0fxsJ+EILAGJklUjget59ZwIIodU9lwdFXC3
X-Received: by 2002:a05:620a:6c0d:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cdb5a176fcmr119087885a.5.1773343102882;
        Thu, 12 Mar 2026 12:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:8cd:9231:8b51 with SMTP id af79cd13be357-8cdb5a176fcmr119083185a.5.1773343102255;
        Thu, 12 Mar 2026 12:18:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:53 +0100
Subject: [PATCH v2 06/12] arm64: dts: imx8mm: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-6-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11981;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sCSn8EaGxkJ7RiSv19pVk9Xndqm5kr9dkfsOD4kkNJY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFlzbqEAUQEwbYJpQBlH0V5JVv1IwRXLtXfl
 F98jRc0UAOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZQAKCRDBN2bmhouD
 1zUyEACILJNe9W63El4gdsnpg064Tjij1fLDF/xadAM/dLeJD9+oM2dRRhPKNMPhps8tmW/McOV
 wZjNz3ekcdhKfHugq/L5f+sZB4Fo8ezo7khehDDdQgxidmU/Kukr/C6gP7doWTEKSvE8w6wKTjs
 ti7sRk/bqMUSNX7JFISqw/dlxba9FIGlEVoMP4Iil0IFGrECc9Zl3x5yBhZY5oZmhEgNDM7XWLl
 zEfpk5xTtMkJixWzxumcLLFw5AB3Zi5zoQWzra9AuZhhQM4+R7aYguXLA+pGOTt5z8DD6bhCiJq
 V4smAU0x6/QviQo3cjf/XWnGIFEp6c6ETQjfEfsFtcF3XXxLAqG8Bkv/YPE9UIrBppj1RXRX4lP
 63zmKrDMSGaXo63sl00Tdq+fZV6IRxVH/774skkcT/WBZvSOIwZgz8ZRhU1vmIwAgBq8lkMVy79
 r2PLFVBw6JdEk7hqHnEswdSOamcstErn3jhg49CMdfEWxUT9cyr4hdUQvNEm6VTzAf05sy9bJQd
 ju7KQbkVhEAZTYx56xSl/XIuqN5MLKUcR564oit2LY7v0Px5Sa8I1k+XxJGIChANocfw5u8Roi6
 SH9hmZMkczM+DFvJrgG29GKiSVwE0N3eHpXT/0vlfFQsvdsk72QPi33kEk4tUMSyJZEpz9zlFOz
 oskb7J9SJo5SVaA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: zTg2Vw4ws4CVhcv0L-FyOMK2mU-AEoMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX93VAr88aZVEm
 eec+HZZFB+2zJiU4EVT8rCsm+M8EHyzJgdcnlsfWvHqWQYv7lyBmTZOwzXeLsjsGoueHjHJv4bl
 0JXgKbTo1gG7MvF50SrVLKskFATBxuhIRRwIPpYG/Vset3bXQUOc+Q5eisSgcMDp3xYCDKC76/E
 TljikKRMOTZvjLsJvHx1rZYmEvxb1Ju0fuJZOEw8C7yvJ+D+o1IK469ZLRKbp+nFU+BF2swVBDa
 ZCNBy9hmlRK0Cc1YcKHTGaAM3aP3CZ59hJhMuCirws9ZWlwOT1PxWMpl5zTCZ5HrCqrl9zZlhyd
 1xSKF0CcEZHk4okDDD9vuqeRlZvII9o6FoBNJYesEC/h6cy9RMj2bwJBt1i2dIEmpZmrJ6is8gC
 YVYxSIFEpgosriqU7TX2xl6MiqHC6FqiMC5PA/WWRQNF9bZ5zaWuhpBYbvGHZb+yF9iVO2g/78o
 Ap2Iza8gYRRsj+I7aeQ==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b31180 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=Z2WWPTJv0FA8N6Tej9wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: zTg2Vw4ws4CVhcv0L-FyOMK2mU-AEoMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191826_349324_7AB4403D 
X-CRM114-Status: GOOD (  13.64  )
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

Freescale i.MX8 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi               | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts   | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi            | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
index ea1d5b9c6bae..5642139ebaec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
@@ -301,7 +301,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk_gated>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index 472c584fb3bd..6a874f3ec22a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -919,7 +919,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 0>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 8be44eaf4e1e..31052ca1971e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -533,7 +533,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
index 299752aa8277..7eca9127bb9e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi
@@ -209,7 +209,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
 	fsl,max-link-speed = <1>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>, <&clk IMX8MM_CLK_PCIE1_CTRL>;
 	assigned-clock-rates = <10000000>, <250000000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts b/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
index 370558a8ba46..e5b8415dbe0f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
@@ -137,7 +137,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index 6043e7d16306..0165ae04c6ae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -205,7 +205,7 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <250000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index 2ecc8b3c67da..a5f3dfe06a4a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -182,7 +182,7 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <100000000>, <250000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index 8dcc5cbcb8f6..ce785b103a57 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -90,7 +90,7 @@ &pcie_phy {
 
 /* PCIe slot on X36 */
 &pcie0 {
-	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&expander0 14 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcieclk 3>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
index 320806d3d073..bb441fd4aa23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi
@@ -122,7 +122,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
index 266038fbbef9..184fdfb26cd5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
@@ -147,7 +147,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
index 2aa6c1090fc7..1e84c365b2cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
@@ -167,7 +167,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
index 53004c4a13aa..e0982b4cb663 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi
@@ -152,7 +152,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
index 272c2b223d16..a31bd864c022 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts
@@ -726,7 +726,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
index 468c7e993c52..4c839dfa3ce0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
@@ -626,7 +626,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
index 636daa3d6ca2..ea67654c9ded 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts
@@ -559,7 +559,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
index 99572961d9e1..7028d028657a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts
@@ -623,7 +623,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 1594ce9182a5..3b656f8a81b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -672,7 +672,7 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	/* PCIE_1_RESET# (SODIMM 244) */
-	reset-gpio = <&gpio3 19 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.51.0


