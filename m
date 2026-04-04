Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED014E88D66
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=; b=ewmkrYLqruo8MT8/PctEqdfP6n
	inU25NQZWWxW2v2a5kpbSwnzGCOuBIMHqWkndGAN9QV3sHialk94NiwlLCcOp/TUUIX6NKWmpVIfQ
	WM/64LRmIqoJTrRKOsrCKp9SkrCDgxS9VjLzmfMLrOuBXyTXPavwvsFRl4UAmmdOf7Vo2VPV9lWNu
	umYR4BXd9TPTQD9uaMLKuarVysMSDVJFumDFLNIA7PHi8KlSh2fCrPGbGCuhb0zCnmdYLYfZm5R8k
	fy2leSW4sbDCH8c8QzFD76xi1vZHwB6h3OXtYScNKRQs0X58cvKJ9RVYlEcaktVFcA1+DJcSFoSoz
	Qrmhu2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ySz-00000003OId-2sjg;
	Sat, 04 Apr 2026 10:43:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ySw-00000003OIG-4AYQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 10:43:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634ADEnf3391719
	for <linux-arm-kernel@lists.infradead.org>; Sat, 4 Apr 2026 10:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=; b=bS/J3/egbPRXKEyd
	vluVPleDYVVweuaDNqrB72HsQf37Qocy6KhZhVk/8ZFalQ60sv513OllyiFnaDjG
	ify3GMbq5HAHrZqBIQe90a3atcPOtIWAzFEjRV/+IigD/vvsNcqMQLegK1oujoN2
	8+4xLXEcq/DT2+HD1Z8GTjP9AAIQYabw3PN2Neo2OP7mw2R/4klrZTf9v2VCYKoO
	mv7+A4oPgrSnSDEjaaSx2d8zJ9jw2Jz9NSEwtsDzAa1ndh2R9OPQT3p7cLnUJCqD
	0stfdctpdjZdjrReB4LvCp4ydTf8giNT/AzumXk+tOj50QampxPWd1lPORF3rISW
	I2+cig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrgscw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 10:42:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2489af602so24541935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775299377; x=1775904177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=;
        b=i+Bv+rjBmVDpV5AXGjTl6OeyiIP2W3+WMK9hhCtdW9idw+mlxuF+JoRXyikq+OjGqb
         5XAIeqxKfO+epf6xKHTVWD61oeqoiF8eLpPBhdV6xec3NLNGwV8fjtoQKB80jpzdhe96
         Brcrsdrj/ZsQl264nsjpqcFsYz3Jcx6oVNUcu5+3yCW960uvtJpjiPmL6KenShPOIi5J
         kwNRUyQ+5aurt/yoBmRDaYi0JL/LcBwqShHZylAP6Tn5LA01NYiDqtw5uQKX6ZzzLZFn
         w5+s1dtJIcSyty16T3p/2YUnECgRghzWuq5DV2yeRn5zwrrjdYFEI1ci6Bc1tpIMbI7f
         VYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775299377; x=1775904177;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e84297XhT8HmGfOAGvVKf9pMmA+a1FqZAkjsY4N6Eoc=;
        b=F0Gu6vHg8niQfwVCrUtiQ7cxOUz8HYCIz/6BWRoVUGlcv2DXZlkK3l1Nhmy73bcPPP
         lsubYaoOD4E2HdTpuccGHvQjzf0qUfHL1Qsfenao98oZGTU9GR8S8pmGYIbu3I6QW18r
         RAFfUK554dpnRzbqTaUnQ1HvWLUFAOIlNXGJtSf3B0S3zIN39K92hR3/L5sNEuGycrir
         eFSzhThMMf1DnnsPHJVkGUFGoV6eaFk/bU/fuVlsdqUKoCkkJq9BXQROYsQiwtReEOdN
         lVA2SyS8Ewk8KguaMND90Knq7oToTUCt3xPzp9nsgXGugTNk/zK+7oSA0Ug7AEHPv1of
         6Z3w==
X-Forwarded-Encrypted: i=1; AJvYcCVdJ3CYKLFD6XiW752SPLWwQuA+s2pXN5+MH4hdBxU+Cb+OSDXcBRz1rFYkyee74SO+JApQaS/RGM+ZOfssY5Sw@lists.infradead.org
X-Gm-Message-State: AOJu0YxJIIZV2xTOMa2Vc9OyCYk1y0fY+bEqfRM9Ab3sqpAtyvMbpZpm
	t7M/BQNAqGNpCLsDFzDTAawIjkmBh4Yz/IO11I3Icf3Qd9RaV5avv9ExRzq2IfTIA9LtzEBedxh
	1J+5E4v0DkPYTkOVL8S6N/RpSbuBM4lAYzksui7xXo0c0SCVmTe6tqD925gdBM7UjxZ7VXjf6bV
	5bHTcWNv1bZw==
X-Gm-Gg: AeBDieujCTxoWysrLi4JOsm24dwaZfN4/V2OFlPNFUW7LtbFhql8mA5U4SgmoMzv2jG
	X3IROcjHgT4bgESQdlTTVRuqR4EGuRctsKGETCawW339cdKZJSH8buS+Hnv8jCzcXxznTlkyEqw
	FF48qh6Uq/3siKPI3NtN1s9ZB1R1RFpgGrJOlgTOwiqileOqUwOV4gGntNLLMfBxxy1lslqkZCf
	E8kPD7RhwjmcoFl4KPveYj6jwq+7RmIIJuTAw40kVlPW5tnleNV8YACHNG3kSVptrW/09HWkNk3
	vo0ye4RUrQBsoBmq+s/OgasLKJz8Qt5QXkgp1AiejZcP1Jo3BoBEwLv4sNntxSIbLvoQ4LPyWd9
	GRJruKyn4Nmxnvoc=
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr84232335ad.14.1775299377482;
        Sat, 04 Apr 2026 03:42:57 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2b277e36491mr84232055ad.14.1775299376666;
        Sat, 04 Apr 2026 03:42:56 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:d6bf:182:1f3d:df20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749794e8sm88066315ad.53.2026.04.04.03.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:42:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260324023036.784466-1-hongxing.zhu@nxp.com>
References: <20260324023036.784466-1-hongxing.zhu@nxp.com>
Subject: Re: (subset) [PATCH v8 0/5] Add i.MX943 PCIe supports
Message-Id: <177529937123.12054.16299397232734906774.b4-ty@b4>
Date: Sat, 04 Apr 2026 16:12:51 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d0eb32 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=8QGBsu52YCFcfEt-ioQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _CWOvqM10YScBgy6lcix4cP_76HYWNgb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5NyBTYWx0ZWRfX3fAicoRy4Hrk
 sog8hr0gWkd9fBSpDjGTvwm6iLZBL0K7fLYkUwPylvJ8JxNMZhUnCxINFhnA6pOwon1iYFW0e8b
 M3FwYmfmY95VeFUqGyw0UYcYtgnrcpoE1c2C1fazZCZ11Rys+lIFDuHeZ9MPspuBThpIIG45oGA
 +5X6nemzifh1CxBe8ZKCXgdYEmSfrMJQSCcqPUmaYtxkTA46lDyP7lU1T9C0de1rPto8fsOV95G
 FML0X8G1QJaD72dcC9fsa7Ibm4Yq8cj5RFe1rHc90cM05Upr4J6Yo/mzM1rQOODHHaZ/vQXvBpe
 RqQ14ULN+Iy915gdfPPi+wi547Vmz5bbkhV3ZUrFC2XeZsJN/J43waaNMGNkNfCQyCq3szdfTZd
 VumrikMKevRwSSB5gqWxzc3nJXM/uTTjw0Bq/jG8XIVsafMKUQ3HIWRwu6TMhTKr0tOngR6CW/R
 n0vLbi5yuz6aEoubf5Q==
X-Proofpoint-GUID: _CWOvqM10YScBgy6lcix4cP_76HYWNgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_034259_044799_274FFA7E 
X-CRM114-Status: GOOD (  10.96  )
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


On Tue, 24 Mar 2026 10:30:31 +0800, Richard Zhu wrote:
> This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
> attention to that it relies on the patch-set[1], and the PCIe1 port on
> the EVK board relies on the [2].
> 
> Both of them are included in the v7.0 kernel.
> [1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
> [2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: PCI: imx6q-pcie: Change maxItems of clocks and clock-names to 6
      commit: 401359ef44af43b6b775dc01bb7b31396db67aab
[2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and i.MX943 PCIe compatible strings
      commit: 4d7937d8cc32b027a14cb8152d9df64d17e9392c

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


