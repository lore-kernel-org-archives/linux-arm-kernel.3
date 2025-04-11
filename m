Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F502C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufhmds+kkSlO2rSMDq46DFe1lGxthqem6KM44BdOhnI=; b=4rylNLtLlzmBPwVna9OcDrj4M5
	Vyts/Z4BCxxfbICQ6sohy1WgApjbA0Ai0XXCm1EkjfSBBQfj+fvdD0M1R6W5o+3eeYSQ6OlAejhtj
	M5gahPNyKS7eCO818giZxP88LpovzKEnCBzTBhkq70tdxFB1HyYm6618Xi+5t2wp2LuK0Tsf2ruqh
	631f+Q5kNXJkvrClx1L33it9QSaoLXNLIJsrm2MnHSneeC3bBxA6POyJCdYvRLtQXxLM12azPDv/e
	oPBBpkQvwgjyyLbQ6zF4Y5qCN6b7NoNL/iWy+4iNM+yVpYpAs+PLch/RrX1RIR4x3nQCO0Rg7hXmy
	6gGel8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AZx-0000000DBlw-1pbx;
	Fri, 11 Apr 2025 09:21:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AVA-0000000DAIU-06kV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 09:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ufhmds+kkSlO2rSMDq46DFe1lGxthqem6KM44BdOhnI=; b=Rxq2Gu9g0XAbwdefD2QV5cOYlE
	hf3F2xvwxUMU3b+hAvCUJu6kk8FTcvFLMB83KBrHk2pcDjH2+J8nDl5pWmPI4yX3inIJSHnaf1C0D
	gPG43wBsZtBZXOWzn3SwVesqyRO7CqF70hS8V2AxcRrTcHT20V8zLWunCyd6MlGHY44wd4MeuP66M
	BkrNZYWpA9a/U/PMBJJwIf+N4WugK6aB9I1gbghy3PvXzKACvToiy2FP5Bmf7XaVdcI6PO1RHzWvN
	+V8V0b9W6ic6SHpQI72f5vXWGBBDyKKXaPhZYSbzG0yvLecHBRO9lVXczR2zn0y5bGUHKMwY+jIhh
	2X3RXQjQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3AV6-00000008zh3-2k4k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:16:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5MB6c019001
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 09:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufhmds+kkSlO2rSMDq46DFe1lGxthqem6KM44BdOhnI=; b=MfRWrUpWHKOXgxYd
	tlO/p2GZIa8GpGmxViFMmae42WC/Sm1LQQSfsr1NCsUoMXDIaJcLbGKAHmC/vmO9
	mGCfteziXR1g/s5n4OXVCfBnlE+djitVvKKVaO0PNb1yjIvOk4sXsZyteZl/MXRU
	0u74+JzCVDzaGwOwQK7IzLVuZqj2WT82Y6ZZdVDBWMoTUSpTGWgMQ5JlvvhiEuf2
	Dn04zgeuEvj9ASmeFiha/ItVQzLRwcsdtbbXHHOkdsh+X6zRW5qmMas5wY2VLWDj
	jMR8zbMd2spdPqvT3hrO77tyq2fJSup339513IQbyZBJVJJou3eIdlBUHZjZCLEV
	8A6aGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgt2db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 09:16:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso42620585a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 02:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362997; x=1744967797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufhmds+kkSlO2rSMDq46DFe1lGxthqem6KM44BdOhnI=;
        b=YSc0drA7GFoWzs9+a93Z43OlgV/JsNaln+tPHR+Crw61bXcONsrtOmKMzjSzAA1i2M
         oobmRfCU9BTqh1OpwUjhkl1ghXbihAAyDY3A8llXhyLqEprxupkjOoJJA/hI8kdQpn2+
         1RRVeWtSfXz4BNvJw296RsIdoW6dRqRByXU0ATOE+i4+89Vj6GDEYDZDqP8vzoyDuNog
         BjW3pS2JJPYkqHfbFEuDkQeHD0UhdjpTgsyTgjt1X3SrC3iSZ5KkkPdACjBDZGkJE+uL
         BZTKL0r+Jr/+OtntGiuaiKwcDCOZ8huXJFiXb9XATYohTBrpiebqU3rIK6nvnH+R0IS0
         QFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjBzAjRIkoVXzse50evh0BZWT0Oe7bywyQIMSslQmCTUx3QGVKaRuIR6dfCEKHT8WDx13Sy+m+HPBMMC29jKy+@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ5klBVQLwUtdWTGCisM6zpYbV1JsCes6uh7yb6FmkXCZqnRYa
	LjQbcNFttz0t7b3ong6tYPn3qJLUaZDtZybYA8xzrheUzhXAppjOF+D14Ev0VomPa832MAefXqz
	EWKNMoQcj+jNyy7GBcckYZlBaYW89Sb8By2DHdaw9hQptiF2qQPYGydKOh9VvP+WKU3FBTzV0aQ
	==
X-Gm-Gg: ASbGncsuLWy1o5AUW/Kn6cj4hOUUzyV64rq+q/gRBu92TfXccHu2KT75KejLDfHA+42
	AgHrsLXAUZFnCuVXH5q1XIerKcxWBYmZpG8DsbOOX7BRKZN3YnW5tE1Zywu7yQEmw/WSJs13dzw
	aHkgLQi7TGKRsxVXOqzB8ATmnXUM5wT0R+Gx4iQ81rHO0l6bxIDRM9Hk2zEeKKgSb/mIbf5WEIw
	npA5888hwQlacJBhXOCWFLEVO+cO/oROaaAZT9rieKG3Exz3ECUCsDeq65Os3V7AmRRa5yfcrHv
	UxOLksjyRk+kqF9GGeTqY6m7Sj4AmwdwcPV+rfrS1xE4RIgF0vTCUHchswak1un3GA==
X-Received: by 2002:a05:620a:24d3:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7b1af7826mr48639685a.14.1744362997412;
        Fri, 11 Apr 2025 02:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk9dXYbzUf6tHquMMviOk/dVPcbI1gX6P3/o7uHdR9WHzJEGAa5g8BLBffgulwxemVb9V1bw==
X-Received: by 2002:a05:620a:24d3:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7b1af7826mr48635885a.14.1744362997070;
        Fri, 11 Apr 2025 02:16:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9632sm424190666b.66.2025.04.11.02.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:16:36 -0700 (PDT)
Message-ID: <d4f29833-a9c3-4942-a333-8ca4e7a8bd97@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
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
 <20250410-dt-cpu-schema-v2-7-63d7dc9ddd0a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410-dt-cpu-schema-v2-7-63d7dc9ddd0a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f8ddf6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yZJRhKYQK8xzFtgzSFMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: hRj942gpAVzhVwoW78tzSKS25i-qRMXi
X-Proofpoint-GUID: hRj942gpAVzhVwoW78tzSKS25i-qRMXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=955 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_101641_281839_D078D52E 
X-CRM114-Status: GOOD (  11.80  )
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
> "rpmhpd" is not documented nor used anywhere. The power-domain is used
> for performance scaling (cpufreq), so "perf" is the correct name to use.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

