Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F5DF01822
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz/G6pIcGzUXqImwOHN+SRnsHkmtJI/E8Bl+l6suG/Y=; b=FVdLboLOJVBRcu65NmuysCoMX6
	v1m+pXsK9Dqn56Mum6i8txoerpYyyYl/T+lUIX50Ef1E+xqtR0G5/oXoL5alhzW50S9vwXSG1dRhs
	ES2QPZlUmXnqC2aeldrjTYjH4dYX8c4jMVcQ5TE6GqTERhJqiV0Bdx62pe0e0DwYo67Coqtir8YBd
	jZ+a7CsbBu8ZN3RPxQgw5dgeBjpPy0cnVjsGynyYyTXyQyZ3aJzLd99i5GKRCASP/Ls8kWmk8jkMo
	T2QI1yDz4BPaF3PpPpywEfGONFfFHKtQTa3+0Lf4CYC4PO8yp24zNLpC/hSR1trTzDUH7L1d/an/J
	wfDmTirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySJl-00000003R9P-3vbd;
	Fri, 06 Mar 2026 10:22:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySJj-00000003R8v-308o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:22:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264acS33886718
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Mar 2026 10:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wz/G6pIcGzUXqImwOHN+SRnsHkmtJI/E8Bl+l6suG/Y=; b=QRuHzsMB6ejFuCNR
	uv4Xki46Vx2Eeps0zF/VafV0n5SBtF8MHA2jq6B9awW+VviYhp3Qqjyh+rYoZhMc
	Yw5U0rN/m94pFKNLRxTRFrpV3xrhWYTpgdDmFAAjhy9GjPI6z7Dr0RW2mtfkcKB7
	Mupwstj5dm4r17uzM3jmN0cqBA1cgLfi5t6vcNELbVyIB0ry6+aCNxR6C+S8LvQd
	zoKaJ+KxepGz8LmkTlKJAbyTF0B8jpyB/X+EBG79xnZ7K7VulXlH0aCu4OKKYeh6
	3N9L3ufCGp38fEIctBTv/PAEMcqVy9I67Z+wXk6EjasMyMZ0keDimgP34v3S4CXq
	aT7Msg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sa8nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 10:21:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae42659a39so371535255ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772792518; x=1773397318; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wz/G6pIcGzUXqImwOHN+SRnsHkmtJI/E8Bl+l6suG/Y=;
        b=ZQEBfNJZ43O5jMt9Z4cSxYhTW3CkPC3dRcuw/wmklykjev+q+8hQp2wxUrv/NPi0Rx
         iTc79Em+07xTEipPRHYzr+ryJXaCS5v0QEwDBChnYJxCg+eCcqZ3Jf8dPd55/L17ld1i
         s+PD3MYaZV9clctmkdvA9zISV/z6u5LOKR7jHbWMCoUmAbwE6FuNm/LVZ7L93wpnGOpG
         4rZmYVQpPb5KI4uAkdofn5+1KArK1iexVbxmWt9sTV4+03hX6EckmKiKSkXtvSYJR0cu
         Z20VXcc+qAJRF4Pn7dM0OgOgKRBexhy806yFzcUtZ12Qt5GYHzOX1uCjZUWV6lIcrfto
         P1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792518; x=1773397318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wz/G6pIcGzUXqImwOHN+SRnsHkmtJI/E8Bl+l6suG/Y=;
        b=QM1SJB9Fwjr0wIshr3670LLHdHVoH1Rzt8FM//tnDkVQ3WHtiltXFRXS2H3DLekcSY
         grH7gzSSKF7kVVW2SlpGRpMMveH/7oG9LvECGTlW/v9OSgXlvQJvPGbE43dyP9Hj92u4
         aTOXXvxh+9hGHLk3V8pNdXQFLAiQQ3uX8prlCFaQ7zeTBhGcxwPnpUUJzgEDpFt5KO7t
         DZV+K1cIlvowFyeaeMW+RnxMMJOISWwBU9Yxcljiq/EV8J2qS1Ut7U7Tlzpr3Vt9GG65
         2rZyBN6d/0sqG63kLVtfVNkHj96nj36jSCXsksdvhL0D/58t2qWBqrbbywr9TSv4x8I0
         5CBg==
X-Forwarded-Encrypted: i=1; AJvYcCVhdINlw3PDGQFuOToFO6xvBnlce340qYCDECQpuIqSZvNjHGEDEhdEd/PaHuS72dxTwA2FmLQpSkV2n2gCkE0N@lists.infradead.org
X-Gm-Message-State: AOJu0YzxklinJ1CmaX+Y3IJqmn+7T8+SC0vOtR5bPEB6Jbod3vRWxL8e
	uJhcNqvONL1xAqxD8KAT+ePPout2UGuEnLtFK65g52hYOI32UvHiXI+X61X147P2xoPDoRcNasW
	SAiBl4maLnrUH3801hiQ7gSJlsUzMIzPpValCY2b9hlwxTomtB6V0hbkCC64l6JIe6wZPSlB+Da
	dEdQ==
X-Gm-Gg: ATEYQzwTAkwbdFbTIdRqXpAEbM2iWe7U1cKB4IW8my/zF3HwVlb6mM6hHIU7tZagIpx
	1dK5iGPRMoMen+4/jXnsoJLkNINKpaeJOsc7Z7BpOfV4iCAVUAge5QsYBq25+y7O9c/xE97sgEI
	Ez2ay8vjO8PeGheq2xhw8zYQwCgh/O67HXBMfTevSIs85DwuZIe4ovbj7ozj/c35+J6EYbtoSmB
	U1pox4dQrRK/EeQ0uZd0n+Fnfmc+ZihBsgnPS4WrMZnB+l3WFGEQuTMwk43NIh5A9NtnpgZp5Gk
	eANFZGagYGi91iu43KLVFFtGKodrczmRGs9HkMSs7HYfYeManKXy0durXe42ApMVqdObQ12PnXX
	Q2xFHRvSLh7w68sKKMiI8PWYZ0Piu0Odt2kGJwHaFk46h5Ag4cKOGf+xeKYiA9TtNEDRrEiPvFg
	0l+PF/ucrxH24=
X-Received: by 2002:a17:903:2441:b0:2ae:4fdb:d596 with SMTP id d9443c01a7336-2ae82367db1mr19360665ad.11.1772792518195;
        Fri, 06 Mar 2026 02:21:58 -0800 (PST)
X-Received: by 2002:a17:903:2441:b0:2ae:4fdb:d596 with SMTP id d9443c01a7336-2ae82367db1mr19360355ad.11.1772792517552;
        Fri, 06 Mar 2026 02:21:57 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c8171sm18614755ad.89.2026.03.06.02.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:21:56 -0800 (PST)
Message-ID: <2ca7cd98-796a-4e1d-a4cf-acbb8ffe22af@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 18:21:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops
 with tmc sysfs file_ops
To: Mike Leach <Mike.Leach@arm.com>, Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki Poulose <Suzuki.Poulose@arm.com>,
        James Clark
 <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        nd <nd@arm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
 <20260223-enable-byte-cntr-for-ctcu-v13-7-9cb44178b250@oss.qualcomm.com>
 <PAVPR08MB967411CF6B2247456F362AC58C7AA@PAVPR08MB9674.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <PAVPR08MB967411CF6B2247456F362AC58C7AA@PAVPR08MB9674.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5OCBTYWx0ZWRfX7qFXmRbm3uDE
 oeOziiO82tPfxOCIbPzo6VZz/WGNp3WmCMm2kypWN/HviHobLf351xDHNqrlO1k0Tq5Q7g8nZ7E
 Ql9CEJr2gbCvIqzI0d3PXICQEJCQiNup4aBxpgTQtfA57cY/V3vWqn5ObFj6liruqy+hqqJ6CYE
 ybUJlLKXJqgiYGJa0t9DOLFPRUdSeJOFh1Cgz4rdFSbvfgQ4JPgCAZy6O7kDVaxxr/7OXS12zcb
 Xxtg1t2B89wXSmSZI2PEt6yx7MGy8d/fLTke+FvmdVplG+5cQAyuZGJN4wqI2W+kSiUBwU+GV/t
 LceZmHbypCinc3Z87002GnG1w1UCQRAf0Um9OTgIRXtnmOeDwkmDUNTH4mAZ+BIfYZJcRMhmDjI
 S/lr5SNWgbMuRzUZBo52UFrmsIkLR01EoYVMBJJCmyOFNVfFljx6kI0iqBOfJ5fAbomD/+f9zmQ
 kK+et+hiMCrdI4EiRAw==
X-Proofpoint-ORIG-GUID: 8WgQRMN9ZOpwTY7BXzwjOkbZL-PxEicD
X-Proofpoint-GUID: 8WgQRMN9ZOpwTY7BXzwjOkbZL-PxEicD
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aaaac6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=7p5ZsVVZITTIZxtcy0gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_022159_771680_F4FACF0E 
X-CRM114-Status: GOOD (  26.15  )
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



On 3/6/2026 5:44 PM, Mike Leach wrote:
> 
> Hi,
>> -----Original Message-----
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>> Sent: Monday, February 23, 2026 6:56 AM
>> To: Suzuki Poulose <Suzuki.Poulose@arm.com>; Mike Leach
>> <Mike.Leach@arm.com>; James Clark <james.clark@linaro.org>; Alexander
>> Shishkin <alexander.shishkin@linux.intel.com>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Tingwei Zhang
>> <tingwei.zhang@oss.qualcomm.com>; Mao Jinlong
>> <jinlong.mao@oss.qualcomm.com>; Bjorn Andersson
>> <andersson@kernel.org>; Konrad Dybcio <konradybcio@kernel.org>
>> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org;
>> devicetree@vger.kernel.org; Jie Gan <jie.gan@oss.qualcomm.com>
>> Subject: [PATCH v13 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops with
>> tmc sysfs file_ops
>>
>> Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
>> is enabled.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c | 53
>> +++++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 32ca2ec994de..6486bdafdddc 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -31,6 +31,7 @@
>>
>>   #include "coresight-priv.h"
>>   #include "coresight-tmc.h"
>> +#include "coresight-ctcu.h"
>>
>>   DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>>   DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>> @@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct
>> tmc_drvdata *drvdata)
>>   	return 0;
>>   }
>>
>> +/* Return the byte-cntr's tmc_sysfs_ops if in using */
>> +static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct
>> tmc_drvdata *drvdata)
>> +{
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	struct ctcu_drvdata *ctcu_drvdata;
>> +	struct coresight_device *ctcu;
>> +	int port;
>> +
>> +	ctcu = tmc_etr_get_ctcu_device(drvdata);
>> +	if (!ctcu)
>> +		return NULL;
>> +
>> +	port = coresight_get_in_port(drvdata->csdev, ctcu);
>> +	if (port < 0)
>> +		return NULL;
>> +
>> +	ctcu_drvdata = dev_get_drvdata(ctcu->dev.parent);
>> +	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
>> +	if (byte_cntr_data && byte_cntr_data->thresh_val)
>> +		return ctcu_drvdata->byte_cntr_sysfs_ops;
>> +
>> +	return NULL;
>> +}
>> +
> 
> Should be in a CTCU source file, not part of the common tmc code
> 
>>   static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>>   {
>> +	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
>>   	int ret = 0;
>>
>> +	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
>> +	if (byte_cntr_sysfs_ops) {
>> +		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
>> +		goto out;
>> +	}
>> +
>>   	if (drvdata->sysfs_ops)
>>   		ret = drvdata->sysfs_ops->read_prepare(drvdata);
>>   	else
>>   		ret = -EINVAL;
>>
> 
> I understand ctcu usage is per session & per device, but at the start of the session would it not be better to have a function in the ctcu code that takes the drvdata->sysfs_ops and substitutes the callback directly, restoring it at the end.
> 

Hi Mike,

Thanks for the suggestion. That would be a better solution, and this 
patch is no longer needed.
I will export etr_sysfs_ops in tmc header file so the CTCU driver can 
retrieve the pointer and restore to the etr_sysfs_ops.
With this solution, sysfs_ops will be switched to byte_cntr_sysfs_ops in 
ctcu_enable and restored in ctcu_disable.

Thanks,
Jie

> 
>> +out:
>>   	if (!ret)
>>   		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
>>
>> @@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata
>> *drvdata)
>>
>>   static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
>>   {
>> +	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
>>   	int ret = 0;
>>
>> +	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
>> +	if (byte_cntr_sysfs_ops) {
>> +		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
>> +		goto out;
>> +	}
>> +
>>   	if (drvdata->sysfs_ops)
>>   		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
>>   	else
>>   		ret = -EINVAL;
>>
> 
> Again override / restore over the session.
> 
> Regards
> 
> Mike
> 
>> +out:
>>   	if (!ret)
>>   		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
>>
>> @@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file
>> *file)
>>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos,
>> size_t len,
>>   				   char **bufpp)
>>   {
>> +	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
>> +
>> +	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
>> +	if (byte_cntr_sysfs_ops)
>> +		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos,
>> len, bufpp);
>> +
>>   	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
>>   }
>>
>> @@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user
>> *data, size_t len,
>>   		return -EFAULT;
>>   	}
>>
>> -	*ppos += actual;
>> +	if (drvdata->reading_node)
>> +		drvdata->reading_node->pos += actual;
>> +	else
>> +		*ppos += actual;
>> +
>>   	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>>
>>   	return actual;
>>
>> --
>> 2.34.1
> 


