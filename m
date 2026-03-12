Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E36106ACDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=; b=CwRpvOyCUio1HcUoVFArZ/NXVX
	RA57RcxDKe5hgW8aChsx9lifqhKjJrZg1c29fYJZJSZeyikjyAtdoR65d85krAlxS17xX7B7mXoyC
	97J4PXU5gv/4BXnzyywwmn09dK51ppCfHHL3EWJvHCNZgBw/gYYrFshYEiMB52gvkRLDuuUs5iLDU
	oiqaiQTd2g1KstGY92eOtRjBdnLl3iXU/g/xDS4AKyGXG4HZgJ09S4bbvlbKD5IhLUiJgst2UYUJj
	vTFEudQ7Cv4vpAewshuemDz3KLU2YkVHQZq9Q7njV/6AVSCGbU+5b+IeKSLHQS+xvbcsolk9O1Ts5
	hh5NzgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYP-0000000F3Lf-0Pv5;
	Thu, 12 Mar 2026 19:18:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYF-0000000F37C-3Dth
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=; b=ZWZbczzXW6L9U8qm8n48Q4I6Dd
	/i3f3CzjmeV6L5wgM5SusiIj/VB3hXXw101B2bduMlaDa3FkTiRVFs7e4eteGG9hcHest/47xM8ny
	eP2OORIa8dfkoTQIsycdLyZ2OsTEXMamiiEfH53FmU1Hk07yiEOlFTBBgpwoZQGfejAPTQvwxsvDi
	iG30aLY1nAF1s6u0rrNu+SGrw/O+qxcNUTS2gC+QYnDziEi7tLR2eQpeaPZvH37uedX0vHq5Fh/+I
	aSZ7SHDO8I+UPcsUGkna7Dcn0pyZ4HhnNPskQokemsutZsPTaIHVq5tQ4VKa1UvweCznHVfcGjtoi
	GDUn8kfg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYC-00000001qxh-0mUy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9eOZb4025765
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=; b=IfIkcg1m68gKg+06
	3WZ5zEcwOKtIpmXyOGEL3TqKkQto1CBGecIQlzD1tZUHL2ew2x3GcGiadTPmdolH
	ic/qTzPGC4bYSx/zcmffwvyiTAy08QE65nqTsJY6fVZpcbnYKKOeLoOMeRoHl9ce
	T9LSdSTBTg10k1CO29XUlw9aoZ0UX5XjId56XCOm0wNCzIiSOFy68JqDlQ1cutsZ
	DUTobrVyoMeuDqnMjLgo2/KrsnysDXCyz+OGg2Ks0zZofKRyzi1U0GNhu0hwmu8s
	K6AixTRjIB7tUNTNybQlc8YPx8wKepXZAgTbK3dlOckA1ZesCp4dOwJjVjIQ7fyt
	LmBDmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50u8yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd98d96382so197034485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343105; x=1773947905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=;
        b=Kl56FHjmruYy1Sxp31gU03dr/TMtfIsYnj3bVRizr5kWTg1UU/nfdZXtXRcMDzGeRb
         JpQFYsXDKd1Vr/9k3QwIn6w+id/4itzjO5E2Gm1WPyLPUo89c3an3r+uCE4o7jseetvs
         vDN63DyJG5vkmlncDdd4iRQsVOXvZZKRPmbkp++B9BwW6WZkhZWtBQ1ObhOxIJDUTExQ
         zGeYNjoca60VKm4nCs5r0DdqWr8KLw8Ae2by+YYiQiaZzbXv2DD9dIDDFEoiYt40lnbC
         f/an2k/sjKx6etNSSrpVEK6PvolGYqngB7sAkmUVfqVPYscAVIFEjkyh/RUWhcUIloIq
         NhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343105; x=1773947905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ccn/0QgAw+T2Kwh1hmiZq1U1PNoFAig87VYk0VegLCA=;
        b=FSaVx16wNTlmAthgpq3NtlyKh1ONme0cdbwS7av5OEaepX+evZ/WolZVOkzW6yp9iT
         82lk1Udl/OXOVD7n6DcLxkq1sYE1VSqV5C7UH3A74exFDQpjxXuYLHluom0g17OtFQR1
         1JCB8rNZ5r8gmXdwnh1yNkmR1kCy0R92YD6bmDJHkkgdy9bqMJWxYBtli2OcbcvRvbbP
         UoYefCWVDy83kJA9TeMTWGKsTe+FBx9Me/kh2s5B1AzRa1TlmtGFeAi2DHJhLTuC715F
         2wmjf6rNxTYlYkCfnP+GaaYRENTrw7AmjVeI3afQC3Eyi/KlUlnGDIh9SmQCC2ehzbp+
         G2cg==
X-Forwarded-Encrypted: i=1; AJvYcCVPJ384Ibm8mkuPqV1ypl5FQCykbDP7naohXOBPyhf1XWp1QVt5IBSlJSnRMKxHn9z2ZuIq0JeKBlkLDZvMCsOx@lists.infradead.org
X-Gm-Message-State: AOJu0YwSWzrv86HjQicZLVjCT7PXTnLwtbUnasKajb3gpcWHhcjWbj2S
	PFkmHA4BkDuGOxrbj384Ka7YXrjghBMUFaE11Ryy/2SwS1BxeKn+J2Uu2sUIZJFhkmO9smhenkO
	8JOAJDcnAag0Q9mE9N0Jr77ZNMcpOnhFqK6t3+fyd3K4IBKp6XYqJ2+NqUIkoqQBKKft4yB/UfS
	ocZQ==
X-Gm-Gg: ATEYQzyFknrfoWmTNYFMc8wbtjDO5U4swayYFTUiLkyHcE4LYjI25zszcZa3SJK+kHG
	B7kcqTmR8TX7QrzeX6S+n2Xpzb6ZJWUH7TJZwq8KPeK7kBx5w6ud4+CNMIJbDJCd6T7lWzQryMH
	fmPJvE2HMpHpHS8k8yBBceX4CLvELFEJ+L/i2ZAHZoPqx+vC25jg4AjWcRgept11OBYwDiVu4Bp
	UwvkyhliGiraG68l5tuQQsMn77s3z3+pXaPJZfaqzjDgzIq9LbsPYVm+aIdPtRDpqVKVDgnNfPg
	TqSWfjllyXCi2iI3iQiF1+Tkj8/G0Mn7IY0csJMcYX4NEzYAU7L5JGaFRVNxXbrkyX5Wupa7bBe
	S1cOqaHW5yDdiWhCygcxp7J+wt9qzTgtO1U5iDq2bdpHN
X-Received: by 2002:a05:620a:6910:b0:8cd:b2d8:ec7 with SMTP id af79cd13be357-8cdb5a4c3e1mr127703585a.23.1773343105125;
        Thu, 12 Mar 2026 12:18:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:8cd:b2d8:ec7 with SMTP id af79cd13be357-8cdb5a4c3e1mr127699285a.23.1773343104574;
        Thu, 12 Mar 2026 12:18:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:54 +0100
Subject: [PATCH v2 07/12] arm64: dts: imx8mp: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-7-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12006;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+OfYi35/mvFcBOT9a6DFCCxypeHl6K6c0paRCOWmHsQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFmnlATEtl+m1zswUSr6NuxTbAzYAaIffIEP
 LNS5mSU8w+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZgAKCRDBN2bmhouD
 1+vFEACXIMP19bDRtaUqZN/msQld2xxWGze2xcEHHTR6Iiw0IJXNVSlvWGUzboTZ6MUNzjEE/mn
 7NH0bl5j9Ffy8ZlX4f1VM1+w0d/E4gRgiquRwmm+eUPPA/oZBddfzRYjw9EZPr1A0ngXT8j4dPH
 THdj/Y8RYLZdZNOxTroIP273q/EBo3+gNx9NNvI/d39e3MA3ITfGCSnmXNMGvFc9JzwHDF2pxdy
 lc3UFgQ8VCYBSpk6KTyzCLH96WO5gTuWClJMT0MeXhrgMGq/dm8DjzkmW/rijLc9dojfIJcpYDF
 ryCBvxkean/bPGfRJ2Q1MSmZ1+MTYbJmXDKm4TcIlAp3FmiV0OlyWrZvpdU2zy4EaTgfkReOmsp
 NXB8kDmEzvIjnRUEqVPm/tRfUrZjGxG+b+P2+xDwJFl4lR71lUU5I3lbRC3FczJQuE93d28Mkgy
 bQMHMSO+aXwdMJm4euVo2tFEP14J1QKtsdyM9pAWE84FUcG5RPtntMkC4NYBkEZEo5U4LXbt3DZ
 MHWQwr2q15LQBbkK8bVaVc4jD8FBiZ7Cvy8FX9DFD06SQ6Q5pFEcDxz/brUGn/VdkjJa2uZvM1G
 ZYmdOqEOBSsAtVpuxIVYfglcZFrTU4Ye2gdhfpkvQMhnovk6TaF50H4cUF/tC2F5WCTKjvRw3Fw
 z030qKVG9FOBHdQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: o7KL-df8sp-x_bOTfE6bMmrKWfQDdxfY
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b31182 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cw-Pq11FuC5Uhxb-6mwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: o7KL-df8sp-x_bOTfE6bMmrKWfQDdxfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfXxM46MQ3+ZchJ
 GhHYQJcqpS6ezh7791K8JHK6Kj6gZvFFkVSKep+wXsCrbYQxflTh5tebFB4HzzY6mTQ4eUrbOeD
 zO502bzzE6aCMQvF8wUfXgC7KX7+eLFkSHBcdJNmvhECPHBUIn9pSKfp4FUxVStWxHCTQ7hgtdh
 khYRTAVCvbYWXe7wQ4liKhKdCmUDk/dsDw49/MQJwDmmbd6po+kYaf3WR+fYVlCE3i1z425+guj
 bRDfWe8JoSZ2JZOhit+rUS9HW//uryOH4X4lb6z1U1yVx97/0D/hLfhjhuAzbsEdUjKQwz2Qe8C
 BWQRpvBtEqYdeRXPfoCCxgRmTLXgOzigtcp6PvIFzyPaGEOxR6+XHoiKVyq1cZ20g0ou8mnipD3
 3HwBf0rdjA6J8qMA46P53SQ6tnot5tXNFPWGI7U5AFtQM8KXnSp/6sQGwpsxm6dzCrmDpSPhumT
 Cm9HmfZ75XafGyERhSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191828_643914_C71675BF 
X-CRM114-Status: GOOD (  14.68  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts                        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi                    | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index f654d866e58c..7d7d96f0642a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -568,7 +568,7 @@ &mipi_dsi {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
 	fsl,tx-deemph-gen1 = <0x1f>;
 	fsl,max-link-speed = <3>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 31c33acb560c..001430130e01 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -530,7 +530,7 @@ dsi_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index 7e46537a22a0..bf6c53700057 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -614,7 +614,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	fsl,max-link-speed = <3>;
-	reset-gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
index 3d18c964a22c..68a481965cf0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
@@ -237,7 +237,7 @@ &pcie_phy {
 
 &pcie {
 	fsl,max-link-speed = <1>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;	/* GPIO J */
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;	/* GPIO J */
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
index ef012e8365b1..78f0ba14ea5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
@@ -296,7 +296,7 @@ &pcie_phy {
 
 &pcie {
 	fsl,max-link-speed = <3>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
index 3f1e0837f349..1c8a380dc01b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
@@ -310,7 +310,7 @@ &i2c5 {
 &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio1 1 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
 };
 
 &pwm1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index aedc09937716..fcfe89cb76cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -769,7 +769,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
index 36cd452f1583..a09b2dc34429 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
@@ -34,7 +34,7 @@ &iomuxc {
 &pcie {
 	pinctrl-0 = <&m2_reset_pins>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
index d32844c3af05..8e87a9543382 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
@@ -57,7 +57,7 @@ MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x0
 &pcie {
 	pinctrl-0 = <&pcie_eth_pins>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio4 28 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	root@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
index 2173a36ff691..393cca39a0d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
@@ -187,7 +187,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
index 86b8c5af4153..254d6930eca1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
@@ -243,7 +243,7 @@ ldb_lvds_ch0: endpoint {
 
 /* Mini PCIe */
 &pcie {
-	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 0fe52c73fc8f..7a4681578b24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -264,7 +264,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vcc_3v3_sw>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
index 9317e62304e3..1c2e5be5ed9a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
@@ -123,7 +123,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
index 76020ef89bf3..89681b21ed36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
@@ -154,7 +154,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
index 5eb114d2360a..90d15340f935 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
@@ -166,7 +166,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index 7662663ff5da..e37f580fa90e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -680,7 +680,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio2 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 17 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
index f90b293c85fc..efdd4b0231af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
@@ -140,7 +140,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
index 2b86cc62a41a..fb12bfaa9b77 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
@@ -237,7 +237,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d31f8082394f..0f5f924b6a6d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -801,7 +801,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
 	/* PCIE_1_RESET# (SODIMM 244) */
-	reset-gpio = <&gpio4 19 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.51.0


