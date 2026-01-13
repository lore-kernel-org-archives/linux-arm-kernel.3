Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F2CD0C852
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAOeX4n+oBxdWTfJxCSFfny5St8rR/AsbKjH131FUnU=; b=m4NNg7CfBbBeNjUYwK0SKH7YiC
	MimKbNDGEYHUV1VE6LL7IhD0jklrK07i/71NA7x8K+GPgU0FTrPDV6Znwuj4NB9AxF2dw+9h884UC
	ZPFmTNMRSIWpi/10OhFuLZErypqAuPEvpYg0a+nErYJRGaTtUCky0UWDCbvQ9z3n6nH07Xe1PKQFm
	Yo8VFDJKN+bz2DLMlqcaeTgJYNbimh6lSHCmgly90L1JllLGfXgeP6m1dCTk7ud/kkkfmno3oXJC+
	j7B02Tl42U2bVcVh0nVwBOCAz+PS3m9FBRmxLSsUVj2/Q+QMwyAClWoshdtzGTC++6D9Rdfu+Bu1d
	T+owveOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcKn-0000000702c-3mKP;
	Tue, 13 Jan 2026 11:13:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfcKl-0000000702E-2oqx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 11:13:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7hvRs1935377
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAOeX4n+oBxdWTfJxCSFfny5St8rR/AsbKjH131FUnU=; b=GedOwv1VXbSrlQCC
	qrXTxu7tvKao4KVa8GsjGn6BbfZQOsjoPKzX/BeIkyg1q7yw5k1v1xVLGVg5Ohhy
	KdcR3/HsKmssWUz+Zdu/5DVI0ompdsUg5jXZjpNXEWH/9/70ooXl3DtSNSvVuQK7
	KZZyATmWYBV5QuoLCloCE+au1n1NYWao0Ep5+mH6zQukxwRLIuHe1lr7CklRxqs0
	+wewQFkgEzmsD2InSIefzToDA5e6f1X9BmbyJAFagFB2aGFAJHYv3JVhC8ggMt0W
	K6zdGi/+fdCBVgYlX+Oh3h6QF6eoLYGS102Xj8g01ZE3S9+rsnuXQ7el0Jp2jUWe
	vQBGIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnjnpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 11:13:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fb4c55f0so151964385a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 03:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768302790; x=1768907590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAOeX4n+oBxdWTfJxCSFfny5St8rR/AsbKjH131FUnU=;
        b=H3x1m9F65vPxZFCWWLGWTBG8GgvjvMuAYXQl/U1w3cDEeMpDoHAhMXjcHoizKKdDTW
         JiW6dOI34S/2UQ2qexSThksGXRShGN50unYOsinGz3n/Q+Nxyr7VSqpimlNmKQnm7WuW
         oUbdSrvBaIdQ2joFM2XvOjP0mLorGtKLWywchwNE7iXwH1NhglemoxbBUMbeLuhiCekx
         e5baHhTwfYpfvwedvu7wDf/y9YXJA9rmm+tvz5sHg4jTBmyqarnbpSyA9TTDh6asxNtp
         e+8Dd6rK26G2N8pv7Hx7zLM+TXL0Ltk25N53Mr2r4ZQ+wlnTmok+S/Iaxdqi2xBDbXXU
         ZT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768302790; x=1768907590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAOeX4n+oBxdWTfJxCSFfny5St8rR/AsbKjH131FUnU=;
        b=HF7wQM+SmzC6PLuWYHlfXQ8EDwYqjw3isWz98FtBlyMtURxcHGm6c+K/hWQ9oUUwg0
         0bCvDNQ4O0T6Bmgi9sm17ndzoJWwE05HL0cya9yVRznICWB6amhbweMMNrVXcW6OQa9j
         l6Wt2A0QwETYS067U+MvRN5wf1AxjgWJARYtKuIbUk1hu9If8V5+JWwn2uVo9+Y1gO/v
         a6iNhKky2lU3FjzUZtiF7iPfbrFxePqgn8JX4i3YTIpO6EFpRdG0p1KZBuGT3DLOrPUo
         72u0wSXYRFqk3XocUors3NaIimmTP2dHGlmgotLGnyHhnv2EgsvXAW2IEMP/kALGGc3v
         UsXg==
X-Forwarded-Encrypted: i=1; AJvYcCWLHlVX3qdYHwkuPx5/nKEUOBW1gxTrasjQUnK+wue+RfYCk3XGi9EIhuUxtdSzfBQDXUKyBk4U0oh+gVZ/WqVF@lists.infradead.org
X-Gm-Message-State: AOJu0YwGuGNsy8e3lun2Fcb+zWKFTK22NaP5KYIZytlaljR2r35cXYf+
	lF0gX7ZvP8swbVDJXXfTzOIi235eHJ3QGhqNarMNvwNOG9dE6Evq8GSpkYM0o9uBH1skfSEJYZ5
	MyX/TpnKgN0g/AWDhLAFmSWwTX+6ICNprr1O6rSFIwmchacMMybrx/tLkz7fWM7Ao8Qk1tc2ZYf
	afyw==
X-Gm-Gg: AY/fxX7pQKnbymaYJEtO4oJ041v8D5Y4Hkl8UCiNoqHsvj8vYzUOS1/6H71641Hfumy
	y50dm/tiRdtNLeXGUTbk1ysiG95XxGqAAS91MzYcnitcjByVXVq/5g5t1OwFK4jXV+9Y4MKgHc+
	t7muWeWqbeJnDGim+mXrXHZRxz5sSyQyI+85FwhFSRZZeO0of09M1nWne8d+hE3izTa6iWlndSQ
	PYCkOGjYfnviVUeHadxIBnjWJ3uIbW7QtQGFR2UGn1wFQb9A7+MV3qgvlKrr36GQc7x4VT26bQE
	5rMCVPbyCNKVQEnAojHgt0iCsOPmXXrMNIEDysv5t8KubEbhtDKqsNmZ3upCB4LDssfWc9G7J20
	cA6MMOMqL0UCMGeMpJuBCQVvVOdTjfO669GfxIcPJGSVFc2ILb8d3j3+3E+DOt7da64I=
X-Received: by 2002:a05:620a:f15:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8c389410414mr1907219085a.11.1768302789861;
        Tue, 13 Jan 2026 03:13:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAKAFpGE/APckeyZBkps0xBADh43KNlPgtm5cix9GOlwpx5+j2l/7Qpo8z3SnIe+GwTLKuAw==
X-Received: by 2002:a05:620a:f15:b0:8b2:efb6:5ce8 with SMTP id af79cd13be357-8c389410414mr1907216085a.11.1768302789049;
        Tue, 13 Jan 2026 03:13:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a02e3sm45306481fa.10.2026.01.13.03.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 03:13:08 -0800 (PST)
Message-ID: <beb63598-a7fc-4e77-a68e-8622fbd93972@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
 <20260109021141.3778421-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109021141.3778421-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E3e9L-RzvRRxyXpA1RgjQT_-9FsExEZX
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=696628c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CBdMip5UwVPz19tR0hoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: E3e9L-RzvRRxyXpA1RgjQT_-9FsExEZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NSBTYWx0ZWRfX/NEvfBeNbtUK
 aba2p2u9SW00Hye+NYQUEhOa0eyvczDcgWuLKW8nE1et7BCTuOre1eRiiu4Xt7s7Ppcwio6EI3+
 RSjOqbdQo3payKWgD6r+eaT0BYT58Vq9HNVPRhPSowru9cGanX9rpmkjbjM/fMuNz6SRhn6hEzO
 05HWjIqU+yOe2QdoDWYldJPFieSPE5F4s3dBtcN+k6PS43Y7hv1jojRTSLj+ngyjAiqoC8hOsp7
 YCe9f1reIo+YFARxrWShHH5jxa4GCYMDrGMyYCp/+SHnTGiwfX0t32SVGtSxyDeDEByKzcriKd2
 i1TADNKc6NDHrMYkncTh3d8jI++RN/Uq3JWjvgmwE5NI/nQAqsdzhy2lLVuPohhDi0YEpij+dMj
 SuIp/NBbBkhNIds+qoltE9rho/tglzdldqnTeXj5IctELPX19rGxbZ6WJjJMA80BaUbFueC5bZn
 IHRtNe29zaDhj6Ue5xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_031311_839849_3FB311CE 
X-CRM114-Status: GOOD (  21.32  )
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

On 1/9/26 3:11 AM, Songwei Chai wrote:
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---

[...]

> @@ -18,8 +18,36 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>  				   int step_index, int operation_index,
>  				   int reg_index)
>  {
> -	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
> -		step_index * (drvdata->max_reg) + reg_index;

I think this type of calculations could use a wrapper

> +	int ret = -EINVAL;
> +
> +	switch (operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		ret = operation_index * (drvdata->max_step) *
> +			(drvdata->max_reg) +
> +			step_index * (drvdata->max_reg) + reg_index;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		ret = step_index * (drvdata->max_condition_decode) +
> +			reg_index;
> +		break;
> +	default:
> +		break;
> +	}
> +	return ret;

The only thing your switch statement is assign a value to ret and break
out. Change that to a direct return, and drop 'ret' altogether


> +}
> +
> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
> +				int ops, int reg)
> +{
> +	int result = calculate_array_location(drvdata, step, ops, reg);
> +
> +	if (result == -EINVAL)
> +		dev_err(drvdata->dev, "%s - Fail\n", __func__);

Avoid __func__.

The error message is very non-descriptive

[...]

>  static int tgu_enable(struct device *dev)
>  {
>  	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret = 0;
>  
>  	guard(spinlock)(&drvdata->lock);
>  	if (drvdata->enable)
>  		return -EBUSY;
>  
> -	tgu_write_all_hw_regs(drvdata);
> +	ret = tgu_write_all_hw_regs(drvdata);
> +
> +	if (ret == -EINVAL)

stray \n
> +		goto exit;
> +
>  	drvdata->enable = true;
>  
> -	return 0;
> +exit:
> +	return ret;

ret = tgu_write_all_hw_regs(drvdata);
if (!ret)
	drvdata->enable = true;

return ret

Konrad

