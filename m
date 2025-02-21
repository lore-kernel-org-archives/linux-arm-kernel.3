Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311F2C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnXDRqF+7jHzdDMYeLb1GVbJJ6rATcvBORv64B0RqgI=; b=lPgTzJSHTbjlR2aef9UJNpVWyE
	Qsf0sRjP6DQdEMBX9znup/Rmpt8Kt9JcIoc84rCBQtRR81xVYgnE3tuVv0VzlXf6OU5ew6x+7TT78
	N8OoMXA3wD+XEq30Eo8qHNmx1Zd5yNKRtMx4sAC1wVvODiCo/7Vh7CyAx0oZ/0sedFDnmMIZBZESU
	RsnOsctsQGUGrCWPoppHqOqmT5F1gHIHiBBhh8hg2EUubdum9ydSBMGC6UNzB1hYUDZ7bp0FJ7kFn
	psKVKHs/bYAZXdROeWp2r/tNJr/Ks6VhSh8nSqwsXPBLq6bTYvtKS/lm7lyhNEWXJ3OPN5WayaQHd
	WIbxfUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRaN-00000005OW3-0ZIX;
	Fri, 21 Feb 2025 11:52:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRXc-00000005O0R-0DGs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:50:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5JdXO011843
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnXDRqF+7jHzdDMYeLb1GVbJJ6rATcvBORv64B0RqgI=; b=M61dVp5XtBGhkkwp
	8CbLNOfzXQrnd53lUnvvdMVNlkywZ/HhEYrfQN3qR3owj5i+8x3eS4oozFoHw/z6
	+wYDslBszqHDV/EQLZ2M8QPbZ4Odk6axqOHlY7PmBAKgp4RKn2up5hCXI+5RHO4Q
	86j0pwVN1uKvCgZh/EYhuqYF7As4E5PhIbbwW6TJdX9PmBKvauGWKnt7X2ITDgRO
	J0tlfsLiMpyP3RRojHlDYHKG+fGSzB+JJoFarZ8BADu+Rl/jvoltCs8gbnk08s91
	U9D6hrQqTcOgx8kpZiKyGrmvD5uc6SKAj/FeT8bJ6KBVEDlWVhls7levwHJiP9O1
	HCsxFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3sswh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:49:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e665343a70so3198676d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 03:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138598; x=1740743398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnXDRqF+7jHzdDMYeLb1GVbJJ6rATcvBORv64B0RqgI=;
        b=YOjT1mXe9z3/HGP1xxT4970GYkjjZLrDQy//3ilgYhhJmA9oyFQbgZ01OrwqoAA7PR
         B+gqnMXHsIdadOkhIyNVMHu1E1wEmh3XeDAIXjaA9+oNPk9/wroXBJZHzgjsswzwQS6y
         pDOSyfGD9jPAUhTo2bWDoAglu6N9xQZUK0N2ZL/jTnhO3Gcon1M5RIaVNmovj8s42vI4
         kllPAIyQhT+iYU34vzUGfN+e/QYIR16YYpRysSolzoiCrwXtliAHSODkMiZH0cs1dKSm
         ECRQ7URfDZ2BPEHLuaXAdaR69yZU3iW/zV0dS1H/1ne2prqjQU1OrA501C+h7MWQSMxH
         1vcw==
X-Forwarded-Encrypted: i=1; AJvYcCXj68QnMowKNZpVdReZLqajw9bl264fJzrNMZDD0O8vOSH+6W+kebFycQhmwVoM5MVX/h8O/rh+6JIR3TMLjVxj@lists.infradead.org
X-Gm-Message-State: AOJu0YwIEzszWKxUBnIMIBliQ1cg6uNiGnrQiOrvo3sW04d6OCSik/Mz
	I4rcA6KGP2ykiopNFIVRHe7Fa+rHX9jGxgQIcy5vfqRt3y1+b5Bm9PXJZStVTVyijAR6TtEnW3N
	B9KWBud3+rbvAEnkMiAgQR569a8oOvZYIXjvn5yY+TS5uPxYK6ClTbMj8PM2xvoep85m9wv38oQ
	==
X-Gm-Gg: ASbGncuoe36kFl0d4E614nvMtM+7Rr10siKkQfnqPng95OGLWUsyzz/49jlP2SNy6Uz
	v0eC9gpb9FjebEFc6AmnzieOyzcbMCstB0LtPaR6LbVfpjt8KMLxj2wVT6j6V9DPXCQpD+Ns5pA
	cqJ8J47PoP+39r+AeoZkD0vC7Fo3pfuOoToEiGOjbhp7L6zm05ECC4TCPjJDiEiaBeqCsAKURZ3
	vYg5klwdS+0Emfk5dP/dhaw+lKtCRuAEvy6kS5tAE+xzh2JZxA7qoWlRzT4s8zNGMFNUdoABshq
	xCBD+gkiirN0DLxMi+pQuK8KZXo3yV1ProjjqPcsdul8hSO0z+BnNC5N9lZQ62q/Gtar8A==
X-Received: by 2002:a05:622a:3cb:b0:471:f185:cdda with SMTP id d75a77b69052e-472228d9e7emr15401781cf.9.1740138598215;
        Fri, 21 Feb 2025 03:49:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz6tjScwFqnyjtrUPjnhi+ssj2b9sF0tanjJCBHYaWqQMsLgwvd3nnPdcpK3+hrUaFc9rY+g==
X-Received: by 2002:a05:622a:3cb:b0:471:f185:cdda with SMTP id d75a77b69052e-472228d9e7emr15401471cf.9.1740138597834;
        Fri, 21 Feb 2025 03:49:57 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm13554823a12.6.2025.02.21.03.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 03:49:57 -0800 (PST)
Message-ID: <3bfe9a79-517d-4a27-94da-263dd691ec37@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 12:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_tdas@quicinc.com, biju.das.jz@bp.renesas.com,
        elinor.montmasson@savoirfairelinux.com, ross.burton@arm.com,
        javier.carrasco@wolfvision.net, quic_anusha@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250221101426.776377-1-quic_mmanikan@quicinc.com>
 <20250221101426.776377-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221101426.776377-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8KQH9GhlQqGGYkXSGuTCTYzbLJe45-Ez
X-Proofpoint-GUID: 8KQH9GhlQqGGYkXSGuTCTYzbLJe45-Ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_035000_252056_875CEED3 
X-CRM114-Status: GOOD (  17.04  )
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

On 21.02.2025 11:14 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add Networking Sub System Clock Controller (NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

[...]

> +static int nss_cc_ipq9574_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_clk_create(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_clk_add(&pdev->dev, "nsscc");
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Fail to add AHB clock\n");
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;

if /\ suceeds

> +
> +	regmap = qcom_cc_map(pdev, &nss_cc_ipq9574_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);

you return here without pm_runtime_put, which doesn't decrease the refcount
for core to put down the resource

if (IS_ERR(regmap)) {
	pm_runtime_put(&pdev->dev);
	return PTR_ERR(regmap);
}

instead

Konrad

> +
> +	clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
> +
> +	ret = qcom_cc_really_probe(&pdev->dev, &nss_cc_ipq9574_desc, regmap);
> +	pm_runtime_put(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static struct platform_driver nss_cc_ipq9574_driver = {
> +	.probe = nss_cc_ipq9574_probe,
> +	.driver = {
> +		.name = "qcom,nsscc-ipq9574",
> +		.of_match_table = nss_cc_ipq9574_match_table,
> +		.pm = &nss_cc_ipq9574_pm_ops,
> +		.sync_state = icc_sync_state,
> +	},
> +};
> +
> +module_platform_driver(nss_cc_ipq9574_driver);
> +
> +MODULE_DESCRIPTION("QTI NSS_CC IPQ9574 Driver");
> +MODULE_LICENSE("GPL");

