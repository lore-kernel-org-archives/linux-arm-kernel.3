Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8564BCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfVQerc+uHw+N4krqe/n6SfCqS6EUafruS/6IpTFDa4=; b=yKPG/dridzzKS7KOTJ2ebthujT
	7FovcwVOlEtDPtugImPH91T6JYLdeT9w6xpEAQpe33PnNwtRa5dzzT0UBOc0+KGZdv6PtqoF7gb2X
	E6b85P801j8eabdXJmxMbqjEB6tzzBxKh1yJlae51SEh616ce8oY+v6Nm4gNpa/1b9idra7q8YMyz
	EzReD6fqpJACyUoa+V4DsRyNPYGaYgWQFFQYVd+rB5bBi/HAbPelhaA2XLentAHF5DKGJzxkgDHdb
	Du3Ov0s2FLTcoYad9t6BL09Y+qB5vY1IYLLwbFNXmdAeoK9Rbfp+D7pakxfcefbbharJUTRAaopn3
	BKrDMhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq1X-0000000BPSJ-1Kp0;
	Tue, 26 Aug 2025 09:31:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpv4-0000000BMkp-2OEv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:24:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q9Jo3R027023
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CfVQerc+uHw+N4krqe/n6SfCqS6EUafruS/6IpTFDa4=; b=MsFTymMnI093YRxP
	U9CBwp95o4AtBT6NO5aEgQ9yvd9CVwwrSzMjZwDx0PhDwPbF0UrfQHjjVa0+QmF+
	NZbK06MXNPiJm4OlOuYM163DWXlZOt9BbfI6t6pzK6ocy46Y9aCp0L70dlm90NV6
	yUqvsatYg91DMMyw8WnZyZREPMMVtX0QEIhy8/T8rZEihQSl4Sp0af5Y+6b4u4iu
	UfVrTEjZj/mn3OfyKD+JXSAgN73N0GJnGGaQNDkTyZ9Po6O5zLkne18rnR4pDH2n
	Osvq0g8eoTWwOYrYMUqvjCX1/YiS2c4Gh90WwcWtaHJJ5hxY7t0oh2DErM4aiIAB
	B08kSw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48s2euhc6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:24:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771b23c098dso1769297b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200285; x=1756805085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfVQerc+uHw+N4krqe/n6SfCqS6EUafruS/6IpTFDa4=;
        b=ZAJTDZOW63eBumkNaT09YPp8vLVZErpVlwyzDV4PpfUIRnFMB7nP6MI7ZT+s2fANW3
         1frqp5DPidkoHZrSVMXzYveVs0bppt5eYcCq4dDtfPCifv1o6EsJfxx4GqhkGOdA8K1w
         x7oFZ2uGYuDLqe7iFzM59nSuVrjTA7hmdlG0qQpP6/87yqqgWRSpPmUIaA87HHcfR2UW
         aT0QNJSWL8l3Uzprz1Tst/tlIUDT9ykxuwMReV9aW96Rvi1FcM2CreyQXVbkFP6HuOZM
         vMLm5iuNQNVcDWbTkltMoC1zaPyvAkhwyGq8OGtyAJZYdmRUf5radrSq64mNRwZACdYK
         cmsg==
X-Forwarded-Encrypted: i=1; AJvYcCX82nf+H0gihedYtAnG3YUuZoXDTgIjiwLl1Id8XkqSmLePOVdeKBXP475trLujyCVEe8hoVluSb66rcFP2++EJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu7rNpkZ/acAptVD32gQ4T7lcx8I5573YUgoeTAgaBrZ8yyfft
	zuYVZcSRr9gde24Z5vvBZkPa1Pi/ORSsDSYPGcBVTmPAkMAgMjdIFo8KSozwbJryzWjCd21TJvn
	UujNKzsSJRyynO21P6FjtUeu4lfBAApk+x//eJ3AesOmmLIv6iTvTfvEwzdU6XvuQvnfofVLovH
	RFFw==
X-Gm-Gg: ASbGncth1kMgI3/5xM+Eiw0BQUhgmDsN+u9NrFcalvzro0nDRLJiNE6AdHO5WFb3tCG
	PF7PseXmMmrSE+iCEq9GlB8F37MdsAQnO72m05wMTQoEqz7F6rWCXK39XgAe9KgKDbP5Kwt9b7k
	Z9gUEEQow6p0oxLdwKEv8oCUqfvGSOwwo7celC7lLt4ylLNNsxq5nJ1kjrgxMqpKtpazBNaa23I
	XfzHaSrdQJXx6zH5a25lxhHzkptvtVQ+PqSpN45tNbCy7qr0X22CATKettsPFkFS9R4Jv12JWtr
	1d70e/pVo0Qbv2B/M3KlVSuPXbBQfFae9nV3KEBUZJ9nKXQ1sJJ1dn2WGSLqGu82cAAkg/Tow2f
	jQh1u2hSPkav/swJiQJkkIegi1Eb4cg==
X-Received: by 2002:a05:6a20:3d1c:b0:23d:c4c6:f406 with SMTP id adf61e73a8af0-24340e06848mr21993641637.43.1756200285019;
        Tue, 26 Aug 2025 02:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpqloeXmXwEVuJtSSmRHXdt1+2U4Mw4rv0BI++2B779xAglt/pCmwtRWFeQCFBd0qp95/NUQ==
X-Received: by 2002:a05:6a20:3d1c:b0:23d:c4c6:f406 with SMTP id adf61e73a8af0-24340e06848mr21993602637.43.1756200284591;
        Tue, 26 Aug 2025 02:24:44 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4b23a2e8e0sm5281035a12.49.2025.08.26.02.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:24:44 -0700 (PDT)
Message-ID: <2c542b10-ba75-4e75-a2cf-964edfbac52a@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:24:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda
 cross-trigger configuration
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
 <ef2267d2-a6f4-4f51-be44-687a4074a4d3@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ef2267d2-a6f4-4f51-be44-687a4074a4d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AYIJe2anVBN1HbMdHLJUluyucSHFyPcf
X-Proofpoint-GUID: AYIJe2anVBN1HbMdHLJUluyucSHFyPcf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAwMSBTYWx0ZWRfXz0kr9SRS0Brf
 X7inOdSrfwMMV4h6bC+mEkJKFnX2+F++F0giLDsV3uk5PDN8O1mtoR/bdQlN9nmCSlKbHVrzAG+
 F5rfmv2zMOEBbWNV24/mZPuArp2e3w94IfpR2UK0llU8T7inwcuvIiutmBO0XGZkwDUqeAFUNVq
 Gj0MvDbDTSYoKSJEH9CRoxvK2PCOW1PG6cMhOg8K31RMMFuix9aI8K38g+CrsiakGawaRCnqQUL
 MHiV/l/FMIt6WQ9AIjjbYKiLH9J8uSgboXOFJ4drrcmj23xeP479oPiCW/BZIA2zXh3qXuuvm9A
 tXWL/9ceCgK2HEwTRcjLVPJ6M+xeIPfnh22uD3zXRXUN/cq3exAeCnyyxXIWXD7pUt/ZWAqAJoc
 QOWEK6Ql
X-Authority-Analysis: v=2.4 cv=PJUP+eqC c=1 sm=1 tr=0 ts=68ad7d5e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ytvvUmyFbC-rj0LgiQgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_022446_620475_4002B8BA 
X-CRM114-Status: GOOD (  16.71  )
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



On 8/26/2025 5:17 PM, James Clark wrote:
> 
> 
> On 26/08/2025 8:01 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
>> These registers define the characteristics of cross-trigger packets,
>> including generation frequency and flag values.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
>>   3 files changed, 311 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
> [...]
>> +#define TPDA_FPID_CR        (0x084)
>> +
>> +/* Cross trigger FREQ packets timestamp bit */
>> +#define TPDA_CR_FREQTS        BIT(2)
>> +/* Cross trigger FREQ packet request bit */
>> +#define TPDA_CR_FRIE        BIT(3)
>> +/* Cross trigger FLAG packet request interface bit */
>> +#define TPDA_CR_FLRIE        BIT(4)
>> +/* Cross trigger synchronization bit */
>> +#define TPDA_CR_SRIE        BIT(5)
>> +/* Packetize CMB/MCMB traffic bit */
>> +#define TPDA_CR_CMBCHANMODE    BIT(20)
>> +
>>   /* Aggregator port enable bit */
>>   #define TPDA_Pn_CR_ENA        BIT(0)
>>   /* Aggregator port CMB data set element size bit */
>>   #define TPDA_Pn_CR_CMBSIZE        GENMASK(7, 6)
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>> +/* Mode control bit */
>> +#define TPDA_MODE_CTRL            BIT(12)
> 
> This one is missing the register name prefix, like TPDA_SYNCR_MODE_CTRL

Yes, you are right. Besides, I made a mistake here. I should put this 
Macro in patchset 2.

Anyway, I will fix it in next version.

Thanks,
Jie

> 
> 
> 
> 


