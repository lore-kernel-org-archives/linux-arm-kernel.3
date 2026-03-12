Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EA9106ACDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=; b=Je9lRH8t3VPz3xL7dKDedpodZ8
	kUsnTk826AWOEyMk/JAlVzJt8RdA2xqcMP2+Q5kCzXb1kW5cwcxcepYnGAGmYu7TJ7WnkRuin7HDJ
	zVW5VKptiVKVRrFw4N2mFzIYNpSQ/P5agV8o56PXENn8L86cfOw3l0U2/5jjkaFCVBVuyTZa51TMu
	i4K2vyJjnuwrfqT71Gw4culbZFf5Yy+csNzEByjac2jxdCoBsDty7wIOnW0BnSm5s2GuPR9nF6NlL
	6a+BpiNHfgnEGhu9+Dj2LVqv8bCGiiB8toP2IoWOFL5RbzpYJiiswtjHVvNtecZ57IGRiY/kUDcC/
	Rxj1tu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYE-0000000F37n-3zzx;
	Thu, 12 Mar 2026 19:18:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lYC-0000000F32N-3Dxn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=; b=c0guRnWspI0M+XIiZO28uJlr/k
	K21UTOIkPiMLZTBGvyrc9au3vS7mYokMdwxyVl7kzx1BdDrtU7exXCrNF7YOZG8cH2wk8ABBXuj6v
	/S4clNBtw2RPqU0vH/OrlNBXj53Fyt7eZrbURyaxo/Fiwfw6oYmDOoSakkl7F1VyLft3MXc1kAzXu
	f5ymuz3eVVmOf07hoqtxqTw51MlT8uOc3ZmHwCWGXlOc904NNyYKcmSmRnvBu7GinaaGZU8kYO29N
	IVIyFxmZwQV/NuVzSbaO7438+UKqZSiB8g3ToohFD/JQxxSkDX21ErsQIIHzuRISqgU90r/mNp88+
	SbnQx17g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lY8-00000001qv5-00D1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:18:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CIX2Eg4132843
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=; b=H/JBTheuNdlh5Bo1
	WQ2iZ/nH5d9rg3IxdpZd0T3RvimYsq7OxnvSATKJZMT4p3DQfqKrgH+eFjwW6MWO
	CTT1z6ef4JJUpS60nEl9qXIBo5LjwullndRGEyCUflVubKxwGM89grYOZB3FzasF
	EA25CFylXTLx8ndlEhHg0fqSivn1/yW8OcbQSbfsdcALAoLZcCmNfCKfn5OclIKm
	OQ4++9ubE9dPks25z3RTnYiP4Mi0f4exUlbyZjQoMc3cd7zrzmQGuF1yLebcpdfp
	IeJM9W6sU3tg4s0GPcAPfSO1h3JGzXZb3Q/GJxJhv7SwU/mW3D7gD5CHiv4Ei6O0
	tWDXjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w3awc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:18:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd39bso1000952885a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343101; x=1773947901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=;
        b=EUpa6+/yKyl/1KVtA+nYQfHFqBTamdC703xhIE7gbIXkVd1ldCV78yYo+FrjqFeDHo
         ImeH3aNO+M8ed7emodGXC5fVveNg7QkyqbWBsuoi3M3mQXL8I+hRT0biliRR9SklSkSp
         0a25BjhYl+SB2Gcl6u/tExEIix48jdXCWPt3W3OEECiLaSGyTYdvPHABHOLIHu+snEeE
         9rX37q7eHVhnob7gIlAz5B6TbeOPqsmEo+GSDYY1einTlvbLmgXA5FhLvLn3nLQab+kj
         M3VGBtHsC6+lzGzy+5KDs+ezkwAtQru+qEAZCFXzlmx8M3Xu3BcuFmANz9ZSygakYu52
         KApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343101; x=1773947901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=;
        b=EEn/y7GMwXtyJVEGrjhrAYVt7x60pPeroO6rYi2OybF3AvUDtrCiAg+VVF54Xnx22u
         113hryk4YeDVgtxMrw0E+sSsb94o3ALLbOTcyvDOJI2x/Jub+T5hc4pGOeHI/N1tEA5E
         IbS9K+zO+GoEqZZLghzRpTAXu8X33jWCk2BdtBDiEPQ1nQcuqpUgDqYfAuOtEs6VlARO
         QqTrUgeWIGreoDCrbXEiagRSp0PATF/5dRmxJSgZ31t7luJx29U+xb4nSFk/bUqfa+0L
         gKiNSRUwb6TNtP5GXdYa6FajIqvXfj2P3P+Z1fkS09YiZMcaobySjzk1DR90GZ7UqzcF
         82ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWHgY0gqipovGMdv3ZF5Gnl6LPxs9No1SOBx17isn/R+9w7pNRvf+cJ3K7DDWm/zs3WhKNrUkBZRab18CegeuLl@lists.infradead.org
X-Gm-Message-State: AOJu0YwEIPS8qgtByHuvVL8kS0A6MKn/5rpCON4pNx/zaIZw5Akz6pLO
	hp8GzWW9W1Wp82JyZ40MCes1tF3gsV6NDRYZKhLiVNMVw27dtJgRgpMSEnrGEpobfTekl+0lWUU
	sKiRDc9eCHYQJ7Gna/3PTmgxpYPWJhYtTGH1Q27lDbe8j68cwBTNJuckzgT4S0uuDn51BrpTlMg
	S9yw==
X-Gm-Gg: ATEYQzzwIMPMHyvOT7Ugdtqx8Iwn2VXptCafCO5NGhm8DD2tYsiMrY/1V9hwt0f2C4W
	dirJts3Ym4fGz7TQG8r/MyFLqRRq0ocSnhceAbPxvqGMGe4sFx0lSiwq6xC42jd8ic2oTvVZ/Am
	4mTS7FqY83TUawEh9Te3+etMOmukeH3bErVK4kEekU2lcxuOUOKZNZNrroEt4oHLM0z+hdLi4LH
	I7TRQ5c697AMPLX7HhpoM7GyCDZr54k5ZgZ7fgrNJhRFUgfB5OVmAJ6VozAOf2z9QM7j7S6xEWB
	IoSLVlm2kzpfCZO3l+K/8XH9LTrWzXdaldxAXhm1HLGHdlWo3izuF4SEeAoi5/NdxEAB/TW4pv+
	E5j8WWDwFe6GrZMw9drs8A4jF589e0AfUmqXt1MqC/Bb0
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr76167685a.46.1773343101109;
        Thu, 12 Mar 2026 12:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr76163185a.46.1773343100450;
        Thu, 12 Mar 2026 12:18:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:52 +0100
Subject: [PATCH v2 05/12] arm64: dts: imx8: Use undeprecated reset-gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-5-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=okCFCbRAc+6noYCZhUa9P4+dnrKGsmwQbeCL9ESxXoY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFlucTKXuhI/+bUlAAr1ol5ZMSA3gi2hw+Pb
 v1q0d1r33SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZQAKCRDBN2bmhouD
 1yWvD/94DlbtVJG5ChNG/ZRexVSm5IWZghRwXXrMlPRJpFNH371UMGyhXuJRmWraX2POKnKOmxZ
 o5MVcL2Qm0PMj34NiB4HwOHVLUDJ1FD8f5O472uKCq1TYyOAtbXfWOKmZM+uOu5vQQ5coj3Onx8
 7R68P9kX3NyBH/z+FsYMJdhU1pT3SNzCfC2UANbGkqT86RK/yXv7PORaunygcNn7+9Dw4lj2rUX
 rNKWD0sacnSTavQQSd7MUYnvTL2XMNt1x78ZKCuYL1EikboDFE/1u3TDkLKT72zBlUfNWt4jthW
 Ra43WA2j56Y0Y8XHDHO5zPqq0gUQo5uruymXcvZvSBXBrIuEgAEa8lvk556njXXtk3QKnc+Xaiy
 HX33sSvDV69+5ql2CNJxTJuR3A8rXEZj/45pm5AwEqDqk7e4Zq4/e1iQLoNimPUFShGEtKnZhu8
 rGwvwdNyWjzapRaqovk3NBdFfoCM5GktJfB+62u6U4ufnfGF4pCtVjK9J3VR3XEL28KBnhJozMj
 U+09+IgX+Ng9ik5BKEydprb28zo7lOcrImusTvlIYYDcRNJ7ALzr8vX7r8nuI2RgbbB1+CIJeYA
 zLdG/0Ve2qbSXUR8p+fAkPTCKbuhcbzvJizIZ8sGYU3ez7vkt7A2bUrZC+0EW2pyetJS9paV3Ss
 sWU9CNcuO/KuZXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: DB8UT7pw_eVA2G8J66hgJgTXA_TLaIwd
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b3117e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=lgRk19EvD0hfQEPH5KAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-ORIG-GUID: DB8UT7pw_eVA2G8J66hgJgTXA_TLaIwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfXwisLGu5VO1j9
 8dkoqzYeEFbcFQcs3ixhyOiQ1hctHpgdvPlfnSfrBZJSnm/wVQN9Xz7LH09kClLD/RdlLzZnKNY
 xfwKN1NIvj2lJ70dP22qpW8zK1sgjVE+plF022v9QhIlp+RHzKLqjLxa5PcCHqXUKSkxPIk8s7P
 uxQ4ZYzWVQCYAm39EMiMyObgh/+6iTaNXEcBDV8KqhG2f09N3SQNwtZzJjm4Z+MWok0AmlHIDQ8
 7liamax+2zGJjPNrMhHFE3lbUb7HmcqS1lHMD5FNyeCKIhjMtllJckJENKi+EhDn4S+yHVKim7d
 nWO+YFP1ZDy8ba0hJueiLrTPCFZrcGDs8FEM5d+XA0ECeiO273MtLrH2TaKlzhnq7lUBoWipbsV
 GG08wrR/ONiL29f5jXxeasWxN22NC/+BO9bKK0sr5o4Wt5gIVdu65GvhWRulJv6Tt+VoDTm7wkj
 2Zkg6lUnAsLe9aPVPPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_191824_657242_E69D6EE1 
X-CRM114-Status: GOOD (  14.97  )
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
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts       | 4 ++--
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6fc82b5eb58c..6d8a57ff56c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -806,7 +806,7 @@ &pciea {
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_switch>;
 };
 
@@ -816,7 +816,7 @@ &pcieb {
 	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
 	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5c68d33e19f2..bdd1dbc6b322 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -651,7 +651,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
 	status = "okay";
@@ -662,7 +662,7 @@ &pcie0_ep {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index bfc918f18d01..677a05b38391 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -407,7 +407,7 @@ &pcieb {
 	phy-names = "pcie-phy";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcieb>;
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 };
 
 &sai1 {

-- 
2.51.0


