Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75798106ACDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=; b=SHcX84ySQlfx9EmKa7AZi3PV1h
	1gypw2GVCIFHExJAPLj7LnQyBxOrHV9LcAJNzow+4crp876CSEcM4u9GzPE7dXRTYP3c2GS6+lo7Q
	hMq5EUYzNVsi0Wc/8weGJ9Wm+cRHGHOvpVrraJmjHzqmX6RdjXEIYldRuUg3NIhk9V+11lsMbE5pA
	nbHPMxWnbMDgZJXX8rrsLXqKwkB4QaJ5FkIPyVIAOB3E9mcrgg+gwO9ZwoIWNptvLU9dGn2oIbirO
	VEJmu+3wd5RG/R68Lmplfc//xBXrueSCmeNM1OoIjrV5hMI+hpJY8C10qAj5OM5LpI39ea/Ifd/uh
	xh+9tHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY1-0000000F2px-1UkP;
	Thu, 12 Mar 2026 19:18:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY0-0000000F2nd-1JhG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=; b=T4BzpPvu4+w/a66IMrqaQ2/7Q2
	mWYKq/S04IeADzxIzOOGZv/a08ZOvjWh5QmaJzoHp+70KC4NHd2bwVMySiL5TKc5RIyfsd7SPZs5T
	8Ef/zMdXnR5C6gq6jfh7aNofkBxsM+eRPFJAUonT72Syc5QMrurrJ5zR45CZkvPN/94Lor825nRok
	a0XMuqn8oq9zi9TyjaLeHxcxARWpEzD44AviB0tmcJ8cLxsGH4olzM4Mh+KI5AloI/iVzo8dzEadj
	1+TxQypaFltUf+ytM2XTuHQr+qeABO3P59LjALRLDoeaB2XLQf4pIfsT+B+OmjmlxdqG2RkNVrY3t
	K2v8PYiA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lXw-00000001qqE-2XWl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CI2PNE4133000
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=; b=bBCyza6G/BGhXPG3
	g/oNxp9/ZwyCeqLuCUHehfT9e+yeDmz2+ki5gJq3zK0hPHMStxtnTGEX2Rh5vjlB
	ycFAt8CTTxGWQ+vHfO9dXXthVH7PLHYm4WJyoa6thkdPFy1IDOShTumbbiLsSwIp
	r661KrjbyCVJZkmLFcq+iRAkpRVLm6cvvUlHXfgTu1KNK0hLBr5nr95UFlkZkOt7
	qwrcPjh4xHj/CHhPx+oD7kg/MjzDp6etf6CNnI9Q459QdAoDGAIFcIjZOdKWxcMh
	Y+yptfqf0m9s8ajSFKFWz6Ayc9A/XNngZtJ7+jRUUcOAcnPJU0+W5SWtCDIvDm+1
	HLJ2Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w3ave-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso1000798485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343089; x=1773947889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=;
        b=g/aywoHPIDovq7r4J+K77l+56yBacrqUBoWFHA4tsKZOZeRvnWfy2q5228JQ9i2ugO
         nlfFvEvGf1Mp4Mzae3xwQDMvFwhcDfJcH3mytqem+82fkcTFkW8kdvE5slYniszK4goM
         NI4MJ6NdoQA+V9GPxtq9SiQF88PuZnUvK9pG+/N3vQ2Xw544+EYFQMuJwaVKKMiYTZxL
         OzAqzuQTUIR9PiJoYcG41RsKK3EujtNJxcovtR+0wHOnnLj/Rr8nB25GoEgy0+HmwCB6
         ixw9JeCYxTFTNoejBCvclvtKXUE9Kz5ix4Xiem8TvJTJSar74J0bCiqgr7yhM1RCXiBY
         Bdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343089; x=1773947889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hn0Jom/dKDg9V+FpEaAQ2uZCrmd2rK7NdsFUGXTcB+A=;
        b=tUELdQy0gud0d3xgjiD5cpNSGf1KHLgsWbfPTy4FdmqLqO+4nkzWEw0u1mrPrgkkZ7
         8OVsYi8yY4kbazN3vpIfqJuDOTdh+kt1Psq32jXxs1E0aO9DWicF62TSXH1I9Ms35GCK
         rBcWrgZ0TyW2wBX2eWYAkNCKqEO2isoxik35a1xlosmUbVWmO+loqdLIy6Ct0wpii05P
         Vnr4i2AlY9oAUQBihS3+IFKjNWTSnZbQvwIjBjrfwKK7Ppc6pcvAFskCVmh5jrM2A328
         ZFPHfxilO4imjeEkkCQUDJyldqtQG752G5SR0VHI8lZcM5t0wSSnZK81OY1djiKo9c6u
         Wf7A==
X-Forwarded-Encrypted: i=1; AJvYcCVSuONH8NZ87uqQj2bCm8rXVxBSVUWNrLfwB4zJViqtmhkXCNgYeGQsEN3lLv/GJNAaUyMiXLPE5y1gohmHrJIV@lists.infradead.org
X-Gm-Message-State: AOJu0YxCcSBirWqEYXzFnHnzAT6SqqlZt2rZq9+Mj87pTervnpMpkieO
	d8fy3fqIAA0A3OtJURgk6/MnXfRdhfC/i2Mck98PxMgfKx736ya7ZEqL/bJx+Wp9O2abSzUI2E/
	r5K5JsTfx41Ialb0BCbbuus0kFMaNRFSXkGQJC+9KKq8Y3ihHm9mv3tLPNPDdP88fxS3+GCCGbT
	wRMA==
X-Gm-Gg: ATEYQzyh+4XdSk8WXBYVub+kwcEjWvUEgvomnk+S8Uw+PY8Yb3oLWjGl+rmZ9X00pHY
	hevyrFwOtRsqLolp8gHlfbMBWNxU1y7kXDHhhYvOIo3qnS552XtHiDwgPUsOZK47GtS9lg/po2M
	dkhiGKtozNW3Qy98Xl79UVhAu85uep5R9cag+V7XvsaXpuZsTRxysJ+hw+kyKfBsZ0gwk6Z37dy
	mvbq3f+xKuleahfvGd9vr/CI/Z5DWLXaoET9BPeQAHFCyA3FbrMGphuXGaJ1xIRH7UhspGhPFsE
	iYDnwb5i1ppYT6DQeZjXPuDuD9oRjNnZTz8I33BNk5guoLa4H9j9rTiGe5Rj8qN5t2fgkH0pYYc
	7C49DOJ9SM81YGWN73CGQyj88gxhLKHRm2yS1ShpHwgvk
X-Received: by 2002:a05:620a:29d5:b0:8cd:8f18:d1d5 with SMTP id af79cd13be357-8cdb5a8416dmr124947285a.23.1773343088863;
        Thu, 12 Mar 2026 12:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:8cd:8f18:d1d5 with SMTP id af79cd13be357-8cdb5a8416dmr124943585a.23.1773343088396;
        Thu, 12 Mar 2026 12:18:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:48 +0100
Subject: [PATCH v2 01/12] ARM: dts: imx6dl: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-1-0d5040eb4a1e@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2713;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SsPV7daT9HJwMyMrg3BL/XIk1NTdhqQYvT/+ymScgaE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFh3kr7vFwIZ6KFp22omprbRLHlu3whIPYnE
 2e/tE/iGDaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRYQAKCRDBN2bmhouD
 1/EdD/4xJwYh+ss3JAxD30YMdqX+iEMjvJ6b4lHXGuwjFRcEWUE0FT3AxGj9VWxpqFG+RdyfZLx
 PAphf1jtpUUNBCaFyQxYSJTDYMrKzoSnawew5PInETgqiJ5rxYEMTt3pEnGd9+Wj9t5xcauvUE9
 kfMxKaJNaw39zgSB/Vw96Msdv3aRV4je2cCKzwMTq3TLCcr1hv2U9Bjol/M+Ti0KotLWrSFHQd3
 b3PorS44XD+h+T6Bx2LPDZAFsbmp/itwBqsze8aKylTj/+Ky4uSH1eGDkMjSEARcz25ONWqI2yM
 YTmbYgGOsqKUe6pJKCpplh/u91ndgHa+g4Zi6M4QxrP3QhVvOtz3+PrNMCrlnCdL0ATme5krgap
 hzRl/XtE+eWI4or2XtwNf4WA9lYDmXSBPky1x5NKza3P2tTMTV0Q+yVa4WxA8UIs3/ArsmCAkFO
 a10dixxtLcD74eeBx86KiMJiCN864471Tsine1oR/v7gBIpqa/8S+Pc/eqZw8YQx8aQSwnAmsFb
 v4FnwJYN7GJZhZAb2yVremuyAbQaJzHX8DGfP2eRYOg673o16X2CIUQEPJXDz8tPlRvUbfV2gzI
 D+3SYhVgCa5oHpR10aacxgSKXOwa6jOg6z2POza+3r+/8GFBW3oAxizm90b1c/5el/JUxRob+Os
 SQxRaHIdA+djXCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: VSmX8AmfJgPMeLPAOLr8xPnW2SzQdOkm
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b31172 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lgRk19EvD0hfQEPH5KAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VSmX8AmfJgPMeLPAOLr8xPnW2SzQdOkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX/yrM9Q5yaMdG
 X4z+e6MJblpDEN7/UF5YldOqZiHLc8ym4WFwzSwJt2pnRH6wZ2PfmSWT87gMuaiW/53C7LMXSqI
 8ytsrdUvPzyhPigwR25102mbS/TKaXglOihNxqycsPOxOOtUshpB9erhzaaAW8KYoW0XBGr+d7Q
 kx1e929vDalrqsz8s2YPvhwtJDHEMPnt1WQUui5I+IOZoaphFETZKe7sMFum36gEGNZXe1kqPPp
 /kOYw1oGUIolkpb1UZ+ZXEpose7+3Y488KfrINN/REUCT7GSCug+liVxNGi7zZZ0dtDs1jlxlVX
 kK3gowDqCuHbIeL0k9bvBA61gMEeANZl3v0NXJyqDMz/pdMO8irpeL+Yejr9bCgXyo4lVtQaV83
 Ztu/AbG5RobzhK06G2d4fKp9zpzPj7E4zmzHUbiLB5j9oCTplvFixvS/Q9Qij1xvI2jO4htVMnZ
 bTwpSOnDHqKN8koSeRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191813_053894_4475702B 
X-CRM114-Status: GOOD (  15.01  )
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

Freescale i.MX6 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
index 1e0a588b2a15..a4e2fbdc0d0b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
@@ -318,7 +318,7 @@ mipi_csi2_in: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 5ed55f74b398..7b4c16e3fd5e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -321,7 +321,7 @@ phy: ethernet-phy@1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index d5baec5e7a78..de6473a0d262 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -271,7 +271,7 @@ vgen6_reg: vgen6 {
 };
 
 &pcie {
-	reset-gpio = <&gpio1 20 0>;
+	reset-gpios = <&gpio1 20 0>;
 };
 
 &pwm4 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
index 4a5736526927..d4911fad1d79 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
@@ -571,7 +571,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "disabled";
 };

-- 
2.51.0


