Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E5ACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17s2MHhHmT5kNo+75PHQcfHsB0zgEcKrR7cg9CRVNlE=; b=OkbyIW0Fb3CBQP1+3vzT6YcRLC
	BW5VtSn3/3fkxGNoLcBzxd0DTdST0Qwou1pkqhhPxGbXnEoQ9vuSaZjzgf7LgBwsnY61afkrMFIjw
	6Vo5p78Yx4O9nNtdsZBV6dQL04B43jSSmfpMkRX2jlkDMJcjROBi5K+TSX0WDG9vfhCwCjkW3M+vt
	CO5FpVD72344T3pZEbXIU8LJO+L1CpSPjzxGRzyb4o2lqqcp1Ozhx4JG6TkrmQL/EuDiO1iuohQrX
	T4QHcMu/5i4nNvK3BmxKq0hi1siXZt+PAzreqlxo5lxpAzt7EZNCSlaLsEWQ9gprLrkBPOqFzUmZz
	utgu+dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bp-00000008fTJ-2l1s;
	Thu, 04 Sep 2025 03:26:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty8z-000000080xQ-41hQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:48:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwqHg021562
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Sep 2025 00:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17s2MHhHmT5kNo+75PHQcfHsB0zgEcKrR7cg9CRVNlE=; b=LM9zTdKbue5Z6EDq
	tG/ztLKWWIwSlbttSMR8hW1e9f/LH2aBDqhmoXhV/T3Qtjb3PyXZNCHBmb50Wh6Y
	+4wwqerrTc/ReU701qKExxk+W90R4P+R6pKAOahRJObsmGsAKj+4XO6caspCKKB0
	7E2/rMltGZMcIlfTMYO/bijQfj/WfWIffKHGwt/kPBWLvuaQCYA4siZapL2B+ena
	eUnTUL2g+WtYLrwggiA0ER4sOHWVOreWXuho87UqELBqdZyvg7FKFxuZMHT3Uc7b
	BY1P61lAChDTd6C23/9Q6aZRpER5nuSecO5s4rtDdzxagdXzKREra1wNDr+a7o4X
	dPSuAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ensqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 00:48:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24c9304b7bcso5188595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 17:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946884; x=1757551684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17s2MHhHmT5kNo+75PHQcfHsB0zgEcKrR7cg9CRVNlE=;
        b=KhfF/6NCz68GIJdqzcXmaajAtmmMZxKNvrr5YXXHjpx6gjjLVbDDVWiL+GSgisP1Q1
         0hxqs5rR0vDgWA+te6g0X9CyNT5ZFlO2RxV78qCBLYZYK9gOoBhsouNffcnsi7cBMJYV
         Nzu8gg1Rjc9S31R21vt1JRLDzIbVUMTcuzsCySlN3//ABplHzVsSm5KfIPYiwTbi68WA
         RM2YstpOSsDmI9/ivV4IZD8evhgTNFZ6CWnWR7Equ19EjM53+VDauCbvpCbn3kap3zDy
         9BPsAAtgfpy0b4frZFw/icj/KQSgkiUuxxWCxQDhy/z0UuNDIKrwRJtFp7XI1v1dTt6K
         Wt/g==
X-Forwarded-Encrypted: i=1; AJvYcCW36wMOTZtCg+Cm45nugX3bYTRiRfly8N+44gF5p+MZPkf/gGZcWchsLUwFBHb+fDcDq/Jv8DhukMkDj+Gv2z7J@lists.infradead.org
X-Gm-Message-State: AOJu0YyCGm7KOODfud1L7Ud2c2L6S0I8eS6/oOv28QQ0tpj3ZWWRXf/G
	4MfQB59V/NAho8coYn0YEME5dM3tTRfBzP/lzHA4IPe1/nRt4Rjlshc80zTZ6LoAiIr2LdzvIee
	WkYghOzdFhRKe0gzEcSzfNL6wwB3dNE327UAN96/gBYQ8ODWZN9VxVog+rdck0sR371/1QNvJpy
	KR7w==
X-Gm-Gg: ASbGncuP4HGh04FWoXTfmbSmZ8apt3qsdw1dGMaSGuUKyp/o+vjKr4PQOPGaBkaB89x
	Wh9jlj9f/0MbSeI6SgsjFdZc9tkKiD0YgIWWRCiGRdchMqo0rUPPVcmQoDRAu6gScGX2ZWUraMv
	3bjD7b4d+MkAtPTVC4kcAolEVI9z4Bf/5RGytFjrsJ6iHlzsI8il0lWvsWH5oBXauNrV//Tt6Xn
	UCgXTdHfX7On2NDXLufN2wuUuZN84Y33ERdCmoe6u+oIy4E2L8D0AJvqqaWrlYj+UegtEYcAUKz
	arFiR+0J8HAJpnI1xytKZuKCHIFHSTC2i5XhV9tY+VxinNc2QgiexTQMoNPGHQLzxh9QF3zobr7
	U2kMl/w4qS8TaPqQbTXSWsdkRuyd7
X-Received: by 2002:a17:903:388c:b0:249:33db:34b with SMTP id d9443c01a7336-24944b3fa5amr207542415ad.42.1756946884319;
        Wed, 03 Sep 2025 17:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxb9Q6ymf/7LlpnATnajz4oPJxLQ/auiRISza8RTn4ZuddVk1oudIFgSFwT0ws67aSUTyLJg==
X-Received: by 2002:a17:903:388c:b0:249:33db:34b with SMTP id d9443c01a7336-24944b3fa5amr207541965ad.42.1756946883807;
        Wed, 03 Sep 2025 17:48:03 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9304b790sm29195915ad.67.2025.09.03.17.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 17:48:03 -0700 (PDT)
Message-ID: <2b36c742-f517-4685-950c-696a34bc9c1e@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 08:47:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] coresight: tpdm: add static tpdm support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
 <20250822103008.1029-3-jie.gan@oss.qualcomm.com>
 <4a28c9ea-fe71-44de-ada9-eda3111eff9e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <4a28c9ea-fe71-44de-ada9-eda3111eff9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nQJWCkTzhRCcUa7nxJW-teNYTZ27N3mA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX6AhJYRrMwptp
 FLUqiNFzgYOwn1B6R5ikCdEAwPOzCKoAu2rP/kuWZfildRQE1wjjC9PSEAFwgFi/V3Q+lg1tIFF
 a8ZSILLn3UcyaW0zK82/qsfHLVDUGpTQouwUN2jnevFOW+kTPrOzStBV1GAVMRebSmUSbU/BpF1
 ZsChzZA3GXFuZCh/wJNsY8iI67hDxYRlxI3Uh221sMxROQLP1hLrfnyZkBdG2yKXqfyr7uujtM6
 dYRmVsDictwFKEFIUaOxL9TZjjzF3fJT84DdW6UpKweHZ21uuIpvDcqbslRIivSrhVFnPuoODiI
 ISxZjJS4JePjQ9Yj8CTUDUy9sd1bnGdgLiQ3xNwS1APTNsotLB+UPy83SQ3Cvf+OjLjnJi4Nf68
 3R1ucaAj
X-Proofpoint-ORIG-GUID: nQJWCkTzhRCcUa7nxJW-teNYTZ27N3mA
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b8e1c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uvk-ifDgNjwOAWHDOfAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174806_008485_745620E3 
X-CRM114-Status: GOOD (  20.19  )
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



On 9/3/2025 7:06 PM, Konrad Dybcio wrote:
> On 8/22/25 12:30 PM, Jie Gan wrote:
>> The static TPDM function as a dummy source, however, it is essential
>> to enable the port connected to the TPDA and configure the element size.
>> Without this, the TPDA cannot correctly receive trace data from the
>> static TPDM. Since the static TPDM does not require MMIO mapping to
>> access its registers, a clock controller is not mandatory for its
>> operation.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 148 ++++++++++++++-----
>>   drivers/hwtracing/coresight/coresight-tpdm.h |   8 +
>>   3 files changed, 131 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
>> index 333b3cb23685..4e93fa5bace4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>>   	int rc = -EINVAL;
>>   	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
>>   
>> +	if (coresight_is_static_tpdm(csdev)) {
>> +		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +					      "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> +		rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +					       "qcom,cmb-element-bits", &drvdata->cmb_esize);
> 
> This allows either pass/pass or fail/pass combinations to succeed
> - is this intended?

Yes. For static TPDM, we cannot read related registers to confirm which 
types it supported, just depend on the element-bits property which 
defined in DT.

So we treat either pass/pass or fail/pass(pass/fail) as succeed.

Thanks,
Jie

> 
> Konrad


