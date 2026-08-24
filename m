Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2C5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oczCj5f3UWMs39FGECP1/K93ViDAX6FAuEBjSlTzqVE=; b=jlb+TW198luM1XjxYt4j4CJJAI
	A8GskxslG7Dibl+HIXxIHiUktLIJJwz7YJxXuaHzfPXKueqs1EajbDm5g/RHZKvjiqWcLYboyyqBi
	/ofYffuEGtaYpQ1pUm1lETBukmvP2XoVP5fJ2UWAnK6cLb7CbignO+O4FnnzQEKVwM8kOGCgNM0Cg
	PId3e+jBycHPIyhwUKux+FbeZufZkxRwPXQBG+67VyuLPOxJb/rYQbJ3OjWYiFnSkDtw8CbLPEF21
	eIWWD8eHpuc0Hc2QalsegjNxuAPt7+nRBgokokGliv439P7+Yo94k6KcWTsniHMZ623O3DcuQJuM2
	JEhiSYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPYw-0000000GABR-1oFj;
	Mon, 24 Aug 2026 07:57:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPYu-0000000GAAu-0CSD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:57:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67etn1662625
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oczCj5f3UWMs39FGECP1/K93
	ViDAX6FAuEBjSlTzqVE=; b=ovgqGziCxKRiwicrKzukwp+Vw5GFK9548mfORnVf
	O53d80Esj50DcLKwJfUquyd8gQdmqd9aSE/jKEmLtsk3GpoBqTBm3SfpqGZ2PPbk
	WeVczAQNgwfIUaGvZMIqQ+p7XAgir3mldG3r0V3SuJIlGlWPouFEaNP7SwPhsYlr
	QIMZxlyIKlNquzN9U9zhbQLW3lCY8nwysjlZ0KjX6lMWSX6AkR/zqURB9v7gaXqr
	tlOr+uiMEaEpbp4AgdAgEO3fHVp+uvahtZoeyhDQsPpfqskTIJvU7WfA/TE3dpQH
	OvU5BHt7zntrSmyLXDiH+BVHbO3wDe6CSWdm+FTdbJBfNA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgfq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:57:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bfd13481easo1051332e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558259; x=1788163059; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oczCj5f3UWMs39FGECP1/K93ViDAX6FAuEBjSlTzqVE=;
        b=GnYKD8ep7tjAZ01FrTW2Wst+M+fRGW01UqNy17pIZtyl13GsyQ2hXiImStd3e21WiN
         VBrgh8WfCUFVFHU7McgkvjHH7obRm55E8gYvV60v09niazxadQzLlCK1JBabwEUxYFe5
         TV7BnLjPVjqBbRDz//9vysFOzNOAWKLaHecMw0sp1CUkBgWVli6HFE7A/2PMrVnEcHUA
         HbA41zWM9qohoNUNiWUS593mScRNPEFUxsZYW4H1YXxy6o2/rjjY2Phvds9kUha00ks0
         aFFNhb0QvZd83MNtx/f0PQjbqaVfPSEMsvPemPEGvoukAf48EyBSd7lbO5J7T8nJm6Rh
         P/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558259; x=1788163059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oczCj5f3UWMs39FGECP1/K93ViDAX6FAuEBjSlTzqVE=;
        b=d2sQPefPb/nvu9uCFsgq/g3dHTETksuGHXJKcHZjMq4aweozSgi3j83qRX/0kD6x9J
         U9H+hMtdTYXeDbW9w8bYeO5yquWyFZ9ieP1rAKT5jCPDHR1WrxTs1MvoCEwbL90lX+n9
         fN+u9L3sBP79FYVauXuG9P2qc6YGcRXozOAXHPZn6lqc/JrQwRBWZax9f7raM9MM/9kx
         Fii00KrYGyt0uib+Hxr2xOSvCSrpTJY+6z+xlEFgjhBFm3PoAWZojU+cuZ9IN5KnjUOw
         KyXrk6ites9GA0l88F40pqAAKaFDQNNS0dwvhSRIgip9rCJJyD6bf/PRDYTy+oQX6n4x
         FN2w==
X-Forwarded-Encrypted: i=1; AHgh+RrFnAdnPtFpyu1JDLZzWlSyjSTHeLtJhGpEujq/MZepXnvOyYg4Cu9s38qA4iyf7IWqBAKtJPY9K+xIl0V5um61@lists.infradead.org
X-Gm-Message-State: AFuF++ktqLzVGGIT7qNrMaQHYTYgz1zZEVd61CAnk848wsgnVuZm5qze
	Z2Mq0awc/RG0A7wOSsGSW/Q/BwvohFpqhuV4oE/XABm0NhGeNKu81SPse2f5bEwis3ipWOwLccZ
	KO2bMJYcj6RMOmeCmEL2kv+WFT9sNkgDlNosTnbeA1uBlTIWh7A9zzuSbM7sWs7QOJlsZ8iOE/Y
	DNcQ==
X-Gm-Gg: AR+sD10HphqKlMfj0tHGZnX26NbFfa6l4+9o+tGNrle1MOMQ9gaqdn3aT/mV8Tr0G82
	TZ73nDh2Y7CZ47UEIXdc43O7lhoZywVy2GjL1d3WXiGAS3Zvs23eKQWnaGe/Wm6tXggk/3hTYRK
	2ZjHIbFAnlgSXHgM9bgsdwXE2MlkmHa4TZfU855NCkyLpjwnZxhw+l7ol0vYXspPrtuAh1Sqc7F
	wH7TOriWBwN0OW3aeZ67G6VVshuzqzLdjDm5Bd9L4Vs/0KC3cxhdxuuZNBMrrPkkyVzALDoDCni
	otLLZz123vohJWGSlrO/jL+eO9lD4qjAzpfIV2jl1xbf/IlQy+qBBeDUqGqOcC/Xy1LaIAdQ+5u
	YNVGodwLK2GJUUYI=
X-Received: by 2002:a05:6102:2d03:b0:77b:2d24:db60 with SMTP id ada2fe7eead31-77bd3189574mr5175335137.10.1787558259428;
        Mon, 24 Aug 2026 00:57:39 -0700 (PDT)
X-Received: by 2002:a05:6102:2d03:b0:77b:2d24:db60 with SMTP id ada2fe7eead31-77bd3189574mr5175296137.10.1787558258934;
        Mon, 24 Aug 2026 00:57:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm8633622a12.1.2026.08.24.00.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:57:37 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:57:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
Message-ID: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
X-Proofpoint-GUID: rbv0PdVoc_iVy_sdQA2cfL0DNB4Vm2sW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfXyRMtc4cYQJ+i
 AwjSa3t7j/8wrwdXm1MIlGeEUUBbQ+JTljxZPRzQrWgcRHFAb9Ga2/C70LUjo6jYF14pGKzViaE
 tzMwxcejYRfQ2tNg1sTPN3AMYhuKqjhm7s42hWzx3dUm5JIVbtIoVKr26Px6uxYSjU7RcnZJlM6
 YZy7iHl1JImClwZjqn1k9tnwK1/TjLG9XAY23wXH6W9hniTu9T0hmMqYnIR4E3PkoiKkpQlGr2M
 7yNYoXXkWjQnSUlekYYXtg2OSLdy81UDYPFVZ+RI1RUNw62kZ/uOb1S+aGwttENPQd9TjGeHEEI
 kQvwdr2DiNzRwJDY81MA5P5Rd9DeYHpSEsOIb0kUGhxOMLT9xMcu9LdLumCELZL4xaVYeY83VLs
 /JMrlqkB4BKWuNECrvTKGURCwfgI93hSh1E4ONRY1rjohokEmdH+vqyu8uiLkvRegUnNukZ3mGu
 JTmUNzQfL+AbEiCAhcg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8bf977 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PAQKBgKzElogREcGxNUA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: rbv0PdVoc_iVy_sdQA2cfL0DNB4Vm2sW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX+Xs+bYF38RSY
 cejvgLyg82+8p70/IJ8+mmt/UmHf4OjNi8opcnSU5CST8mWBc/17kAaIDBLrzSwxhy1bGyYRQLB
 uarT0+nZjGRsR5xa8oPrDsKb2+Vvt/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_005744_199177_36F52F21 
X-CRM114-Status: GOOD (  21.50  )
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

On 26-08-21 21:39:00, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |  13 +
>  drivers/interconnect/qcom/Makefile |   2 +
>  drivers/interconnect/qcom/kuno.c   | 977 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 992 insertions(+)
> 

[...]

> diff --git a/drivers/interconnect/qcom/kuno.c b/drivers/interconnect/qcom/kuno.c
> new file mode 100644
> index 000000000000..9a5bd53e7ed9
> --- /dev/null
> +++ b/drivers/interconnect/qcom/kuno.c
> @@ -0,0 +1,977 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */

[...]

> +static const struct of_device_id qnoc_of_match[] = {
> +	{ .compatible = "qcom,kuno-aggre-noc", .data = &kuno_aggre_noc },
> +	{ .compatible = "qcom,kuno-clk-virt", .data = &kuno_clk_virt },
> +	{ .compatible = "qcom,kuno-cnoc-main", .data = &kuno_cnoc_main },
> +	{ .compatible = "qcom,kuno-dc-noc", .data = &kuno_dc_noc },
> +	{ .compatible = "qcom,kuno-mc-virt", .data = &kuno_mc_virt },
> +	{ .compatible = "qcom,kuno-mem-noc", .data = &kuno_mem_noc },
> +	{ .compatible = "qcom,kuno-pcie-anoc", .data = &kuno_pcie_anoc },
> +	{ .compatible = "qcom,kuno-system-noc", .data = &kuno_system_noc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
> +
> +static struct platform_driver qnoc_driver = {
> +	.probe = qcom_icc_rpmh_probe,
> +	.remove = qcom_icc_rpmh_remove,
> +	.driver = {
> +		.name = "qnoc-kuno",
> +		.of_match_table = qnoc_of_match,
> +		.sync_state = icc_sync_state,
> +	},
> +};

qnoc_driver_init() and core_initcall()

then

qnoc_driver_exit() and module_exit()

Please have a look at all other Qualcomm interconnect drivers in upstream.

