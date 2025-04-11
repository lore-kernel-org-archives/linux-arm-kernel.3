Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77254C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=; b=eNe4TM51j0pPfTAOyr+o9CDCp9
	3pCl1BEKYvlmanHhJogSlvalOyf4IZk5Zd0u7ny+LUwr5TydCzG/mzgJ/K3YXmwnOlE6cEvVdHz+z
	Qn5X+Lb9sZpl4+aPCKmwSJQL2FwmYtGvZ1DCnSNQARzBG6yDBoreRKdpQH2LDdjjU7bxmpcc2vxie
	RH6VYYBcrR3tQg151L6Ykg5j2m0J9ue9bNaO8REs1a6UMwCkCHbcvMYaEXHzs6ypqSdmJEWlFMi8D
	giUmdgomU71yS+tMTAP513QLXS7CbR5g7GioDYeOA85z24a2/s4kTxZ5AJFzxw05c0N+U9IBqBuzr
	Hj0GYP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AYA-0000000DBDO-2ea8;
	Fri, 11 Apr 2025 09:19:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AUn-0000000DADG-10qD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 09:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=; b=k9jj7YJEUoLF+JFmuIcMdEShin
	Wt2kqsd5QuyIOum+rtC4Z9RtZw5OQaQ4h0iJ/yFZnvIZteXS/Ixltw3Qjo8Ndq3SpBOkgV9Yckvil
	ReWqKasc2Z1ldVkGk/sKejjZtDmuEybcf61P9FUdXnh3BUKtwbVLyvGAq1n9CM9XSvD4NDVzU6oHW
	pm09y4MiPiSMApmMo4OWySr8rJ4erKvKo3ORpX6UhB/yIt8SPWsGH3Fucg2Vx6bPNzK/L1tam8iMp
	AiMl0llawVxDICnzUHK4qr6bS4kUJ+qMSRAHyh6K2tLDLkz8vA4AkK+j1FK5A8awZiBg5UD6gZ/Kj
	0ztjZqaw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3AUj-00000008zft-2alJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:16:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4V7ME018361
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=; b=BXHwukBeNNqi8du2
	PVAq5NvS3OJB6v0j6KUFrswmG8tzjAz7KGLPqliamMJzgcOQsOusYeYfwraPkwXM
	MzZkxReq2Jp0tI1ZE8GwclTnyVGu9rdbtf/aoUGbMFBEQumNPirxh/TELp2Edsba
	0xmGi/O8EA6O17AviSO1mrZv7a/vWN7koPTxvChVg52MAhh1YogFDueJCPpWy0nc
	L/Zrwe2qPMRegUg7eviewRj7A1MZ2Q3m/52qCzNzp0820vVT06VSJmadEnvgekP0
	jhLJsglOmUyb1GQOF85/iHbyGQY07St6pqWggtoVaQzqSNTWioo2n6IUTDb/oGFV
	TszYRw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtba08r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 09:16:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so3861526d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362972; x=1744967772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdbE/DxPDX7mmNIDt0tfMeaCACq/2F5Z7OVDEZCEKFI=;
        b=wxUpl5dhY0tH5URgeO9aMXdeDoOr2azvtxQiL6TXFbyesMHCyHy7bOeAA8ArsDNRId
         ZZozOa2AlgL7rj2QZaUvZR2olTUd0lYfX1dRSnfWyu/yRPrWGHHGsdeOHXXckgj7Zhgb
         ZgU9J8bmjZHniB2UWDJ2YHoi9d7IN47CJ8Ysu2DizUcsnT9YQmUcsoWsYWRvcEXO5G8L
         02FHU2sKN/8Yrveajs0gUprasaGZ5EnWdss/CPYhpNikEmzEidkz+bpVZaEKDLryeTuJ
         BovOZ7LCIp8nVKE2RytN5fCy2agQmfVhu0FtjRiHVigME1fGmTpday6lCaCcuPlPpSSa
         Bx5w==
X-Forwarded-Encrypted: i=1; AJvYcCWC8eGtEBYpZtmu/lfnDxZMJbTRDUN8ZgN06nLKJ16phPauM/XoDAIdm+kFOjRRJ7Pd6t0BjzZomMWFSP0cNKor@lists.infradead.org
X-Gm-Message-State: AOJu0YzKfuSd9O61nj3SSnwKHX140z8eUvJY9ebdqfOuD1purWBAoWAk
	fJG+ffH3wJ3ipQMDEJRpOaxuHoOqRh6KGZFy7fMbp/n28FIHfI3xUQMbv7eoLJ/iKZdtGhS8XaY
	EVJiMUQdnoFRSty8YLT6u5T+Nwi0VtirjZGTI5+1nVwtwuRlLCGDCF7eGUxH1MbOPsN8b2/ahPA
	==
X-Gm-Gg: ASbGnct1Uu3Npd1aXPfDGayZvNz5OLYper/YWsnKjdslvc+t8x5YAnKMIKscxtfFavI
	KREh/DaEnPIJQtHRRI4KanUCMuBQPr23WgYpu0Z4tfahGgFO6QIqAQoSv4eQsAAeRKTefRYQlHq
	OYlOCpKfOxbiFGSajbz0Dyv85xUO0zkJ9Lv+B2uy+TD7W0kUzWroGP5/tEIqSNYwXlom82yUSTb
	vn7LQOuNHm/r8JRIR8QQTyqPmxhYMMAW5D0oOtDzONXR8eLwKIJydaOpqkMkXD802L4EGUeZwk9
	L0hg2nmgxqXZJkeqwBLEOFHCjfWf3Qd4SzRYnQGhVpiCx2FVozPlsxsEqwS4oCg6Wg==
X-Received: by 2002:a05:6214:212f:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f23f1679e4mr10563726d6.9.1744362971603;
        Fri, 11 Apr 2025 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA6e1P/nhdQHi+asbk4W6Q507S4YUL3gYt86eK9/3HOGGRdCgqddHT581PqAJyvJB7RwUyaQ==
X-Received: by 2002:a05:6214:212f:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f23f1679e4mr10563536d6.9.1744362971205;
        Fri, 11 Apr 2025 02:16:11 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd2c4sm406829166b.129.2025.04.11.02.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:16:10 -0700 (PDT)
Message-ID: <d49926ce-e651-4da1-8e15-d24290047388@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-6-63d7dc9ddd0a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410-dt-cpu-schema-v2-6-63d7dc9ddd0a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RqO8EIRwSqHAVY0AmHRdplS6jzWDm_iT
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f8dddd cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rt0Z8iD2R8SC1h9hphoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: RqO8EIRwSqHAVY0AmHRdplS6jzWDm_iT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=766 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_101618_142456_979F7234 
X-CRM114-Status: GOOD (  10.97  )
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

On 4/10/25 5:47 PM, Rob Herring (Arm) wrote:
> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

