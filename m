Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7CCC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=; b=Wo+f4pchCJM5wRkXr7Vm7tkrBd
	nEurgBVLzzOsZFL/ftSbwTyrrNp+1V7ul2zH+LMo3PA02gscMqoux94sHNEjQu3xzK+Ad2vKDZM1I
	x7nC/bqLqeSOi+mkKgeulx/BMJwVmE6YtjPcak58c5Kaum+CUjnm+zDHk9wKP7D77c1GPaeo722Gt
	Rhjn9LPpeLj96D8vfAdPPlWs6UfCidwdgF41jjl3TXRxMfFvbGYDOYmbmnONbwMYkSMVqDPi+TMQ+
	DUqpOeT1rVnxTUvlyGHEfAu+vUvuvDLl7F5FXxtXAphOdY1jY2nBt8EMRXOI6pnCK4LkIsTU2jTa9
	ZLLxnNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrbA-0000000Bzjl-2u7V;
	Thu, 10 Jul 2025 13:46:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqL3-0000000Bl9q-1tYn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:25:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6GdK5022610
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 12:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=; b=BCBl8BQnoib8Svq+
	gfbo5fvs1mFg9wD06+fQV4mO1Yujoh6bcMlpk5i47P8zlnXcU5yE4ZPwbEecRf7z
	HReJSijPmv9Gp6e0mRCjmIfajjbIqmhe3BWdIlgQb6g38Hx/ZsuGU9wx4aia/xCq
	t65mAn4ocuHMxGM3JMLfvliRQ5mq3GSqvx+vUYklz9zLmSMOwausfZgxwXWK+7pV
	ascfe6QsPtHKFrGuwBjcVjOkEd5w391snbN4+StyJ49NENL9SDRm9P/7M6Jw740Y
	ZM2RR9kJr6fV2QFImPUZcizk7Q6lu8vj3hI3OZxb1BKUqfpC/fc5ge10boKpxYZ6
	dv6zdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u1596-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 12:25:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a804126ed6so3940491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 05:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150317; x=1752755117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytbTCzKHlppw2SwuVFycJKbJ22dHTAoFO6LLPths6vk=;
        b=uE4ZBVMOLcLO/NjR+3WD9Rfp+pfOoEqI5RBywitJK36fA7AJiHqePUtmbG8jNHdPTk
         noVRI+1+Q24YfxGISFCkzrx7JEHpVX+8J1EMxa8Wa37aL4ADr3dL/CsJ6GqFwDssJD6s
         n8pMi+rOXBb/NYP1xzaY3+bWrkRjrFrCwFX5ZsG9DciMNxJm0/0aTZI4T/EZsFmqJqwY
         ZXBhKEdM8aFi6f7xwFsQfm9rsEuMnMb/qal/eNLC82F225FCZnVCdw70FKj1QlCSTL3n
         NM1Zr3akAx/EmPoNFaDXD9GL+mzBmC4jDpdeHdBiCXZ2zDLA2deWq+GfA8Z+lVO+zQPk
         EqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6pnKzg/xgtUby6HMnuCNchNnx1fG0qunE5kbaIJ7MgZeK/7pJw/W5fe2xvzWi1KsU20gXo5GWS8aoa85YKlh6@lists.infradead.org
X-Gm-Message-State: AOJu0YwprrzqQOH4rMlHQpJLi1YLq7HtKI+D9t3Yge3KcnBo+2+pbEXq
	yLDQG+JR98I75HRqa5+gyuBRN2YE6RDw883vd9x4L7Ix59iWe2kKOOid/zk9JkeKCHNhGsKzB42
	IAzBgG7moa5ZSZKhxhF3sVnn3ycbcoDa0jSOOu8hmlapVR4Eb2JBrhmkZsGOXD+LD2EZcHaRRYU
	lDPQ==
X-Gm-Gg: ASbGnctjLdmcj7FMcBRFN+bNJkezF1iFEJjfpCUF5WzDERjAlDdJ8bYD7uLXeXK6L3l
	9lUmSUiFUspSOsC/mueAd54TGyB+0uKkzqsVh9U/1Z5nH8Lmv+Dg89dq93Sq3lcqOouCwjX5guR
	inIr7OUcQ5XJ111ppe8/Li4QLG4uk5mUmx4DegKp0X73G7pYVFHOp69e3eZ6eQjzeKO+OENnQuT
	xx+I0pMP4PnT+dH7BWp06FSTGou10/AFWWAxSf2Zqbl4T+6gMkQZOqMhxNgtXe4mfXCrn/AqWGd
	P2CY5JXdRc8348v0kFT209mjXiqq//g8rgFnWhUtXrZeoLXaiCpN48Eo97KMMrukcPszx+bQsOA
	JCIo=
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061871cf.5.1752150317029;
        Thu, 10 Jul 2025 05:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL2upV2JP4A2q8XY4xH5jOb8YXZErvSG6S/PQkLmFjLIJfoL6nTfAPNahLLoITNqEwR13IJQ==
X-Received: by 2002:a05:622a:18a9:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a9e72c759dmr23061571cf.5.1752150316273;
        Thu, 10 Jul 2025 05:25:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d1062950sm455639a12.65.2025.07.10.05.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:25:15 -0700 (PDT)
Message-ID: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yu7B1yciahOP2RWrM_qXNVB4PVy4jhC_
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686fb130 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=SCCoO-_AHFKZ3jW1OIgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNiBTYWx0ZWRfX6KjwAoYiCLfj
 N4Fr4PorwEBJRTij0XCKKEFEPUIRqMtphzw+QZa4iDkCh9o+bgpRXJcXeJnDVc58xg7g2OztA6L
 fGTDpInvS550s4P3lHVOD73RVhSz5FoB982WON3q/btbcgQYiEHLcDrLc/HWeMZyGPD+0qbbH1q
 edI0NVzeJfGnvVaHPQHZdQomMwySruB113477kSjZZ0Q4o+Q2eFi2m8kJErccpq6ne0S+y/SGLA
 tpCAnTvy4XTcuDuvPJFLtkxkxNIlr4kUh32pYItd+31+8IuAabXhBBA1wYeOzoQum9vgT5UsuUC
 95LtYVW6aLVbjcOPFbh+s6s4OMypN3Xt9TdGXRZ24QYD4zxBUci5bUg94zq4VFbiPndE0BL2FQo
 DMBmf3xLEu0YxAxSRvAqOasyi54Ddjcz6Mjy4r7uqnQMDhqf9J3EmTTmxrIocIJai8R7Uo+G
X-Proofpoint-GUID: yu7B1yciahOP2RWrM_qXNVB4PVy4jhC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=815 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052521_500207_7E8AE014 
X-CRM114-Status: GOOD (  17.62  )
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

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the existing infrastructure for storing and looking up pin functions
> in pinctrl core. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  int msm_pinctrl_probe(struct platform_device *pdev,
>  		      const struct msm_pinctrl_soc_data *soc_data)
>  {
> +	const struct pinfunction *func;
>  	struct msm_pinctrl *pctrl;
>  	struct resource *res;
>  	int ret;
> @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
>  		return PTR_ERR(pctrl->pctrl);
>  	}
>  
> +	for (i = 0; i < soc_data->nfunctions; i++) {
> +		func = &soc_data->functions[i];
> +
> +		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
> +		if (ret < 0)
> +			return ret;
> +	}

It's good in principle, but we're now going to house two copies of
the function data in memory... Can we trust __initconst nowadays?

Konrad

