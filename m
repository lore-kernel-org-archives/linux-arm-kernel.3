Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF82C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8HkOPFKN3GC9vWOM46Nwa7p+fPHQ6WYQxK03zZBQac=; b=B8Yef6ibhUyQVlsZ8Vt+MwkH7e
	vTf7hWxyOtIPsBv15qosijfrrHjRZOudS7jyH+b4O6fY+iu3E6puXrRejU5ACPnmYsN2/17ZOHMci
	uQp4fOZNdSPVu0Cgdlcr+pVawvB4r4b2cK+/rcnOFKpjwSTbNhPE8GwizOA8+CuZ4g+JGvubIARNA
	U68lLrgxTRhrl/Gz7ENyUZyx2kmVom+emnsSWppKxzk3Dq2Ne+1yx7nw9Z/Cl3ZTXK2PU4JZlJmTk
	1HIR5Us+5ozT2BaIpesd1lAT1zaFOQwh94mR/4AbNcBs3iOHaho24LVEi0v3+HvwHVm3CegAivHoI
	BXdew2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83Jh-0000000FLtq-1nxI;
	Thu, 24 Apr 2025 20:37:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u83Fa-0000000FLak-0VIh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 20:32:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmfww025194
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8HkOPFKN3GC9vWOM46Nwa7p+fPHQ6WYQxK03zZBQac=; b=h6jfwCVHDQOYZElI
	KqMdn+DgOWPc7UbIDJNyh+xGuawbfmXa8O0O57XaiRXJsnmV+l/iGaHsp0idoiFp
	wO+gEUVRIXqPHuEjil8byuZHj+LvyGZwvDOTWOczB1QMMeIaY1ShCNR3C5PcxytU
	/c6UZQhL93L6eQzZ5Nbhb0RUNvbOTCdB/x94/ZA2y4/4Q2w8RbGXgdm1uvhRnHGk
	rOwaLk3VIKby1TQ9v98EgkVtAUdOWiHO+wEh1dSpFBgBYOHT8vR81vn6GZLcYtTX
	plnrPVO6ig3K0zRVIbiDw+EaiKLA5jq86tMJnvNt+NtHFa4jzbOouq4hDcL9xy4P
	S2zGJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy6u2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:32:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so29179285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 13:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526767; x=1746131567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8HkOPFKN3GC9vWOM46Nwa7p+fPHQ6WYQxK03zZBQac=;
        b=XOIZFYQH3cn1+gLuM6DSeGJy9dwv5v7tzEanSrbCNyRODdV0uRnHgLpSpVmHfUyksZ
         L8TX9bjhCepoKU9AqUkSjFZIfr8GLd2JGqw0b7ua68j57oq2YLhg/z0CupHGBdWEELry
         D0zDfZSD9nZ91gas7ir1NegTkmhhukdrJcNccRH6GC1ZVrNcwZyVITo9BDjHPsK9MDFi
         CuZ2haS+A2bhHa86pDtOhCacA1B44av7HZO6zZVxPjJhredRsW2t7r8KUyjNPiZjGQ8s
         rUs/JgWbYSypFqc5g4PlJQHomD6WLgdIl9i8Z8g3v8iCXI8ChdkCZKbQlJsicINt2mKY
         MXeg==
X-Forwarded-Encrypted: i=1; AJvYcCU45AH7kMTHoynRz/3Rh1vXKJFs/NQqa7GExdZskDH37QSI3JT30/OSWVUHVF5+A49NQcTVusZscBz4YZijIKtn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/XOZStOW8HXlUJjdxDgvOjsk0sqG5lk3wTjEL97mSWwmp4rRm
	C8VHYcKUTIj3XpCq9Xqr3p5vKpZU/Bv8sPrRIQ5yXkG510RcGLgeFg3qhZLSmPBw0RgOYpXwdND
	9/4GbUOb2OBf6B9b0Ohqn1KuqaZcr70k/R8BDEGjwUnf9ox0HMKyUDyKFmRCpg05AU9mTpszIPg
	==
X-Gm-Gg: ASbGncvbZh7mazHTib3+Iu+1JI4gzfZpZEf0T/TQwEp1ovZhbVg9RcgZB4/FyDXhTZ7
	W6r93p9zPQ5EKBjB7pTecEI/3+g+c7+yZ2db9JlTzlm3TgDR2ZLU0zZ5lSqLIjj7USgBocpTYiQ
	2BBrvSArwi5I3kk8qoi6/I+kowAAIJcRGxtNBsliERniuma3IwWyTfJP997TZ/QHW5OD8JRiY6f
	FabreDkkcRy3alW2HlTn+YhwiPmUF0sa6s7O8B6aOiiPbzxDcbPVQ7Bo2DrukVSY9w+La56zbNh
	Dmvhsdoa+tLcWkB2UqiETjOetDamuF4sMFcSWpk93LplNw2FA+OluoYfVL5Pc6I/1Og=
X-Received: by 2002:a05:620a:1729:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c956f79fe9mr259898785a.10.1745526767274;
        Thu, 24 Apr 2025 13:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzye98f6Zt0tar8sWeQ6uN8aYWFW+oIeMzfavLC0AjRUoW90eRnRuTlTFArGMlyuz16164NQ==
X-Received: by 2002:a05:620a:1729:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c956f79fe9mr259896085a.10.1745526766905;
        Thu, 24 Apr 2025 13:32:46 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f658csm173401a12.41.2025.04.24.13.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:32:46 -0700 (PDT)
Message-ID: <01bb7183-eb33-4b9b-b73a-e7e3622bf9dd@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] coresight: Add remote etm support
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0NCBTYWx0ZWRfXwihVfuWUik7p JSFFOmp2VVwrDWKiXM/eUsXIkSsyVuY5z7/Fj++AiQ+xZ67167XSLr9Z1YGdBsu4LtpKnBt7+2J M55QP/UJzQ/Od34Dxrge1vz2EzDBfxYdzV8fWX+js/fluk+nrPUmxz/GZA2e6e/0GBxy8qEFR6w
 M8Fsv0nCe42EPFY/zXxewsY8itWZdLKu/nMuO1OSDUwflhAhX7P3Iy9cjJfr3wnNE0fl/Ty1rHA Ih5xJl4oM1H27PTebJvJTh/YIlrQqCz4UUHwvi2bUlmBv3Qmnjb4u8FHaidIHAr3NhpULz8j4qR Gpq3zGWdWpsdVxiD8l+Oahnrk4QvGHTYT3GU/kTINvYNkK7eTY5g9ACA1XWGNTLPszzO0t5FMUF
 wTlFbJ4dADa80Gs9vsCKZo9DV7B1aojvMaqe+OK8CSF0u8BRVScoOlCCfCRBX9RMsaRmoNsM
X-Proofpoint-GUID: jNnTZIukEQ--Rt-ntf6Vo2Kj5U_uYYMG
X-Proofpoint-ORIG-GUID: jNnTZIukEQ--Rt-ntf6Vo2Kj5U_uYYMG
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a9ff0 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=day4Cjbagy4oAH_-zrgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_133250_289959_C4D21134 
X-CRM114-Status: GOOD (  16.42  )
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

On 4/24/25 1:58 PM, Mao Jinlong wrote:
> The system on chip (SoC) consists of main APSS(Applications
> processor subsytem) and additional processors like modem, lpass.
> Coresight remote etm(Embedded Trace Macrocell) driver is for
> enabling and disabling the etm trace of remote processors. It
> uses QMI interface to communicate with remote processors' software
> and uses coresight framework to configure the connection from
> remote etm source to TMC sinks.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---

[...]

> +/*
> + * Element info to descrbe the coresight_set_etm_req_msg_v01 struct
> + * which is used to encode the request.
> + */
> +static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {
> +	{
> +			.data_type = QMI_UNSIGNED_4_BYTE,

There's one tab too many here and in other declarations (make sure your
tab width is set to 8 spaces)

I'll try to read into the actual code a bit later

Konrad

