Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CD6C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czK0+r2bU5CFI56zqbiiRnlxJxdH80DDV95cNC/UIGI=; b=VmwMPr3VgxuKJ5VQscuoKnstw7
	3C79nSz+u8raIr29sDGmn0KodJAYWSDFYqNZw8hnY30UMpyuZEirhdeHSGuAjh5QFLm/oqXjLfJ7w
	X3UGTiRfD6ztyQajyxWOFZ/kKlxGnE6ZSWDA7slDtu8JEqD+9tH6cPL9vrGFZ11nG755n9EbeKfSy
	13PtnPTjF8877P6NkGyDkgT7NHrrkelSd0YHW5AAbRqy5mVUZ07AUtGYZKxdqQ06evgCIGBiFZzT1
	W48DCWFJKgAJ0GKdIA7lCfGFr2r9i2d/wG12BjYgyc/IUp8l5wiN1n+bBImdg/z+Ky2dMI/4BQq5n
	2Z5QZT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWGb-00000001iwz-3Ir2;
	Sat, 14 Jun 2025 19:10:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWEQ-00000001ioc-24W6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 19:07:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EISwiv023055
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czK0+r2bU5CFI56zqbiiRnlxJxdH80DDV95cNC/UIGI=; b=UAfU5rwZzqvcNtFl
	jaOdBi9vtGH82J7QMOexumQzZJjregDTM4Llp23N1DQQ09PJEQdzf2F0+u4vjioa
	uDxK/3WvNvHzFl6qjQim55lJ0209N6n2IUn//8d9ZcxmzuZw1pIxOYPP2EmSvb9M
	ISCw4hkbEojzykIbX+QBR9ntqx+W8PWgtjDIaarqBprKmSEycwwgeNo3OQ+BKSKb
	Pu4PJqTc2348jtZtTd+Ao7moK+IgZWNShQyBxj+RnVg1EKE1yN7Ir3vq5SRu4/Se
	Ujmyid1faE4FuSbBFhLp8CA7by4JLfWhqGOTBc1LbMK/ltlq5BwBmcy5cSY6eJsL
	rgD2pw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8x9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 19:07:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso100801485a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 12:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928076; x=1750532876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czK0+r2bU5CFI56zqbiiRnlxJxdH80DDV95cNC/UIGI=;
        b=piN/bo1iBjRF6KbatyIq5yAgRaiWGM/AyUn2PSpyNHbn5hk92rCWiYUenxYG+nSKbp
         P0p6/1PeKbDbXg6dYKq2xXSO79Y2iTWor1B1UrAjCuDidbePljdyRHNtGIPqu+1hguu3
         2BjjkkcSrA/M+++aUXd+YKnaSrJrNXdc2NIEoEA7wYF8oLq4Kk9xaFmwd02PbpaDmIv2
         En5qIveYQ+JwYVZl7BbiyFh0KBlZhyNGvw/IBrI5l+gv/tbzI2Sna3Y40ZMdDuGLw5CR
         CUC65zUPKEWNSs1WKOp8JTk7davtOxHYLpAFtIpv+8apoP+64yuNGvGsvl+bl6OGF60A
         wOcg==
X-Forwarded-Encrypted: i=1; AJvYcCV4hLbUQDK6/W0s7GT3H5NmQOnDyk0Aq3gsHV1+Df/yqGtnRSZF8k6I8bcGaJS5dHVU0mPg8sQm8k16Lg80+/mG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr6/9ZdY8GKrCVlg11vL0+C8hC51Wm3MXkBSKW9KPfWTI5eN8/
	NwBfeIEH+xLQVCJeO4R6u4bB5JP/8s4ui9m9HEioLbNQ6eOIKdUWi2up9VrUrenhpZ6C68DguIA
	JEy0bWV4evybI4IsO9vYRQJ1DS84xVB9FuGGcT9FtH/7yfeCFf2GhbkzFl7v+GS7ceC9fwfSd4r
	pk4g==
X-Gm-Gg: ASbGnctMF3KJockslbsF8nOg2oqWi7qcEOBggXfY/yFyQftMVmG/NCcfjBJsuGIQyog
	HTEdzBadmeFdhk8H+G3xC16PvbjESrbeGH439GM1k8XbqhDVn9CjV5L+gJo/s8lYvvintgUpvLm
	0TvEqhu1NVZTAx8BR8yWVOTjK8WzuX8D2xMKqes78NWSdnYcEhL2k8rG8Bno0aHFg2ksAJLCYIi
	wvVDRCYS1YkWT9TVlaHCnM3A3xIHNmZ0WGejmrAuHAGtuooo9tyQhXCbBBYKkbk33tygStof34Q
	emXbRUeSUBz5e3CRMiC/WXe2mN+LfLz2UxZw8oZFXupK3IWb6fINiKKMhOgFdQ4BHlUdL/3E7eD
	8mTY=
X-Received: by 2002:a05:6214:2266:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fb4779e607mr23145396d6.4.1749928076567;
        Sat, 14 Jun 2025 12:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI5J+2Qhz/ZsAiL1MBsakDRbis6CARe5oJAazNWsgg8FGvV/1N59kDzEJiBk3ROKzM6jr0ZQ==
X-Received: by 2002:a05:6214:2266:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fb4779e607mr23145106d6.4.1749928076097;
        Sat, 14 Jun 2025 12:07:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm3268359a12.42.2025.06.14.12.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:07:55 -0700 (PDT)
Message-ID: <b89c5809-38c3-4b62-b26f-073869674b95@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-3-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-3-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MCBTYWx0ZWRfXz+C4DPKTfnt0
 lL0C8APi+lqQg92XlngHWYxc5NvkVIoASQx0fkuUV5GAytGP2WOaH3g34fck/D0PBumFmb3m/NR
 tJ8+W1tlMcgG01eyR+QkT55iwTb+MP3xJ3cUsNvWDPHXfcO6iNNknPkxAP/ekXJQRZShplfvVWm
 ETNsJKGwXvGYfsGWVpvM/sJnh+1AEoBeRf27lXbxuKRMWlTaQlrwmKLXTxWxRR8xcb6DnpOtU38
 qGOSnFDIyTLZ07K7dWPCtqyR78EuGCur4kAW0hbwCHUrjaa9Rk2j3b06TS99ZW88p/4nlrORqkk
 DztClfTzh9QTsPWGRkowLoMhkoymk5SPkQHzLtTuQvVTCiwkeKKBIQdPHS9OP/ErlCCemm3vUd9
 N31EkVq4KypONLDzBTBGyn3CaOXb51OYOUQ+qzCu/7tUnDEPfyvSaXtBk+4pM/HLNQJL4eVs
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dc88d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Bfq9QhnQsXqFA3cbzqQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: phwF1JvT9hX8vPq7pESmz-P3MOgxdR2O
X-Proofpoint-GUID: phwF1JvT9hX8vPq7pESmz-P3MOgxdR2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_120758_545220_E0F0862D 
X-CRM114-Status: GOOD (  13.51  )
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

On 6/12/25 11:55 AM, Taniya Das wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on QCS615 platform.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

[...]

> +static int cam_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &cam_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> +	clk_alpha_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> +	clk_alpha_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> +	clk_alpha_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);

Please convert to use Jagadeesh's recent helpers

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

