Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B09CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=; b=Fz3wak67SpUhOUKS/sSQbL5Bhi
	xEt5IP9LSiFldXFtCpGBJkCt+lQ7BzmNGTqzrfjWpJp1k1pKpQvmYHQVYx6H+6W9lYA460pJuSz3V
	em2fklHth85srdBxJc6aHecIADOTz2a8C6FcdREFA6Mx2cCruzSsbFAOgt9/+Umyf4C8cKDG6L7hS
	MjAXCuV0LHzD2s61U94NBdM1p1O5OIcgvQwjQigULncUwYE41/i0D7rlEjNyAunAxTC41dYitee5A
	QCz9D1y+Hd9sFovD9XgdDDczOH+vqtOayAYsaY0iKwljCDWyVQfAll2Fwor4fvGQ0aj2L/c+yl3Xv
	BPYmgVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGD0B-0000000ABPR-1GV4;
	Mon, 12 Oct 2026 10:11:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGD07-0000000ABOV-3fiZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:11:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA03ki3098909
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=; b=MWgNbi01PvSuV0K/
	GF5vPCOZWMSjPDap+X8gxQFGn0AxFPzoOlEuhclgJlQoh+1EyVaLIEMI9aDt6V2u
	E4JTNI2xJ2WVBWFmrlPfqMd2FmMKaNzPOnQX9w0OdTYiFZ9E/sCmOwbgOUgxbPc+
	q9w/HB3hXhNDqntAfxEeSUNgCQapin4GrYsI26ruhS7cJrTeNRl9fGHnaUJximpn
	bZBRC/015zibDeqOHhuGE9WpdFLSI0wob5SUYSompRBWtA8qOEQfxY6fFD8hafTN
	N0/YQkRBLX1o4zVMPipBGfCyZ/0QUFVz7Fu3bHqYdDwOAb48flvJXm+DxewaaALa
	xQY4Kg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr81wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:11:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-887faaedb46so2902727b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791799883; x=1792404683; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=;
        b=F/AuaAckXuclLhXvDJkiGKAfCkFBAFGCQHqrZQDW0GfI6nt1m2c9/48iEam+MWO/fg
         j3HPkM8oVGRag6qs77lo6EHxLp7QPEWrE/vC+Hshu0QtuqSSq6VdXk3l16wKdeox6ud3
         +A3kcyU2CkfPVnPO1cQU9xr2CgeU9MgYBuAHT21wHWWmKTfov/y0xjkVh38Pdqn3fk/f
         /5S4jrwrKtRHHtaA/ichflepxMnvzpl1179WCFq/gPqjjnk57qr/fv/1tkULsON28V0c
         JxglIDFT++369GY5LkOjm7z+l7iL2TvdTxy2cAXQkPXODDWzgHo7yLOUFuAHncxRHBNI
         yFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799883; x=1792404683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=;
        b=DZwZH3y6ZA9TatHKSoS6RdKihCC0nxsWVgfuPuUT3gL+eHGNukq/oXehg7q/fKD7XO
         bodcoOdKZhK5ofZVh1gVv6Ts99V9FdnZ1KYg8l2MoDWYjmjKGYsyr/eQ6uK/0OM8VIkB
         LM7Ugj0FDUQ9V6Ms50MnR13P6ldGrjbOloCUU4FS5zAIWN0npp88jxMNfcFRS3eE/xC5
         1FTr6d07W2KSkM/L/EteV/7k1qsRaHSKVc5kKoGCg6uh1lkBdlKCfoEBCBmO8qaPnCjx
         kermhEpi5C4Sp4CiMeCztdDIvWTVmpGgufgqYAiYPa2QcYngLbljKZGut1ohi0zIGxnW
         TcCA==
X-Forwarded-Encrypted: i=1; AKwUvBydptIxjxy3ENoLzfBVwGNPA7/Vo+t4zPCBUOnxtUu7A59lgG0GNQ7cSIkAP8AgqTz6s3jLTk6kki6aOUMHonkl@lists.infradead.org
X-Gm-Message-State: AFq9FYKsl2j/WDHhA8ZpShlIA2BRbiT/Y+i7b6faSVAKghbAdx44exwD
	A5yZvp90hjqCBGp+pjxuFja0Cv38O409Rmlvb7nFbeNyvYoAf0aGpWrI5FIIuZ8ryqp2o8WocdB
	AUzrH+XU2vRybK+9p/t4QKd0yvjvT6FzwbBCOCit6KqnPJsl09xKRQX23KAxi1gw/dh2sGlodgc
	g/CQ==
X-Gm-Gg: AYBFou3HybVjsJtNK9hmSMAlK1SFCNM1Pk+P+crxukLSztCided6CrXKgMGJ+rEnJ2z
	hEizURrP1flqUcGACErMfTUoN98bDurSPxGjLEUaQm6hxnDWwpvN90NoqSoKJCsi52Kx/Psmb5R
	wuscjrJSyuMkyTowzsvzL36+iMBTQLMC8hIJ7ZCFg75ihP1VHJrLhEQ4wH765FHuQyB9bNIw2UU
	agQSoSKe/dCsIevNy1yMq9AMGSN5HsKNWn+2+wFN75YO0rn8a2S+rvAaN09+mq5mLqLHh4aW8HF
	4cy0pPAaY3YHOXEsOxQSjNUVjI8QCm7fWz35HPQtpsza5aCLegMQah0nRkWzNpwv4igPw863MO/
	PGG7rle9rzw1XYl4YFA==
X-Received: by 2002:a05:6a21:329a:b0:3dd:a00a:170d with SMTP id adf61e73a8af0-3e16be79864mr7616218637.40.1791799882441;
        Mon, 12 Oct 2026 03:11:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:329a:b0:3dd:a00a:170d with SMTP id adf61e73a8af0-3e16be79864mr7616168637.40.1791799881951;
        Mon, 12 Oct 2026 03:11:21 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107348sm3869973b3a.13.2026.10.12.03.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:11:21 -0700 (PDT)
Message-ID: <e25158f9-9fda-4561-8bb0-d05a21f420e2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:11:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC on
 DT platforms
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
 <20261008212904.GA1450868-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261008212904.GA1450868-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX98DR+f502x9C
 BhKuu+J9pvxD6TjiF+gYTjv5HVjCUejxhSCE2q7hNX6XJ6Bu8iCM6h7gIt0vbB133tmE0s8cvLf
 tujw0LZmMa1uVtOnCB4eVk5LgWvJFwlhtHZ0RH7qVPfSSJdcXVi/qvOfFi1ouX9LVmZ2c96kwu+
 GrPc1F+7iBWvqlyuqLHTbRx4y9D3+yocegDJL2xPQmtTrWSiKeg4M3pueL1TrAkqCiXsqad31zg
 lEJ8k2JxGRiWHeZvtkYbXo0kITMHsSYVqAL1XAaZhydwPRy1bRC28hpyq5Y3jaL0Lvptt2cn+MC
 Dc6OZAwIZ2MBOuKhlYYAFRk/mP9s/LuTIvRQQuC/tWa8eDSZEz7AcQO7wyQhF4SQIPisVAuxlML
 ajbGzgiqHYfXTVJNL1L0/HMTOZLmznBknNTjhEo9Yw1XbEJK75pWDR4Gp3w0o+A7l+tFficQhPo
 AGqGdkaZAm5O6l+9tfw==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accb24b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=urU-21cbkK_4QL_mq_YA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX24aXDmVdVvVX
 OATmAIIDnb4q6gqbxPAAT0cfa0pup1Di7HHgm9cxMeQ+frG7eIO1cgak3DoxnddnVWvS1BK1iDV
 LRyw+KrkcW78p5XWYPxWC9AxoGUx70E=
X-Proofpoint-ORIG-GUID: VgCw9T264vHPwVObQ-DlX_O4WJEn5qPp
X-Proofpoint-GUID: VgCw9T264vHPwVObQ-DlX_O4WJEn5qPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_031123_927888_0D70FD96 
X-CRM114-Status: GOOD (  28.93  )
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



On 10/9/2026 5:29 AM, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 02:41:15PM +0800, Yin Li wrote:
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> The MPAM DT path only handles cache MSCs. Memory-controller MSCs
>> cannot be probed yet.
>>
>> Add support to discover memory-controller MSCs from the device tree:
>> derive the component id from the NUMA node and create a 'memory' class
>> RIS, and treat a memory parent as accessible from all CPUs.
> 
> Where's an actual user?
> 

Hi Rob,

The Kaanapali platform in this series only uses cache MSCs. This patch
is inherited from Shanker and James's work; They may have a platform in 
mind, but we do not have one to point to at the moment.

The binding already includes 'arm,mpam-memory-controller-msc' and the
corresponding example, so if the driver support is dropped the binding
entry should go too, to keep the two consistent.

We are happy to drop both. Shanker, James, please let us know if you
have a platform that needs this before we do.

Thanks,
Yin


>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> [ morse: split out of a bigger patch, added affinity piece ]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [ Yin Li: fix context offset conflicts; use of_node_get() for the memory
>>    parent to avoid a refcount underflow; use u32 instead of unsigned long
>>    for component_id and compare against ~0U ]
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
>>   1 file changed, 40 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 0640690eae2c..048d32e69f55 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>>   				  u8 ris_idx)
>>   {
>>   	int err = 0;
>> -	u32 level = 0;
>> -	u32 cache_id;
>> +	u32 class_id = 0;
>> +	u32 component_id = 0;
>>   	struct device *dev = &msc->pdev->dev;
>> +	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
>>   	struct device_node *cache __free(device_node) = NULL;
>> +	struct device_node *memory __free(device_node) = NULL;
>>   	struct device_node *parent __free(device_node) = of_get_parent(np);
>>   
>>   	if (of_device_is_compatible(np, "arm,mpam-cache")) {
>> @@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>>   			dev_err_once(dev, "Failed to read phandle\n");
>>   			return -EINVAL;
>>   		}
>> +		type = MPAM_CLASS_CACHE;
>> +
>>   	} else if (of_device_is_compatible(parent, "cache")) {
>>   		cache = of_node_get(parent);
>> +		type = MPAM_CLASS_CACHE;
>> +	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
>> +		memory = of_parse_phandle(np, "arm,mpam-device", 0);
>> +		if (!memory) {
>> +			dev_err_once(dev, "Failed to read phandle\n");
>> +			return -EINVAL;
>> +		}
>> +		type = MPAM_CLASS_MEMORY;
>> +	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
>> +		memory = of_node_get(parent);
>> +		type = MPAM_CLASS_MEMORY;
>>   	} else {
>> -		/* For now, only caches are supported */
>> -		cache = NULL;
>> -		return err;
>> -	}
>> -
>> -	err = of_property_read_u32(cache, "cache-level", &level);
>> -	if (err) {
>> -		dev_err_once(dev, "Failed to read cache-level\n");
>> +		/*
>> +		 * For now, only caches and memory controllers are
>> +		 * supported.
>> +		 */
>>   		return err;
>>   	}
>>   
>> -	cache_id = cache_of_calculate_id(cache);
>> -	if (cache_id == ~0U) {
>> -		dev_err_once(dev, "Failed to calculate cache-id\n");
>> -		return -ENOENT;
>> +	/* Determine the class and component ids, based on type. */
>> +	if (type == MPAM_CLASS_CACHE) {
>> +		err = of_property_read_u32(cache, "cache-level", &class_id);
>> +		if (err) {
>> +			dev_err_once(dev, "Failed to read cache-level\n");
>> +			return err;
>> +		}
>> +		component_id = cache_of_calculate_id(cache);
>> +		if (component_id == ~0U) {
>> +			dev_err_once(dev, "Failed to calculate cache-id\n");
>> +			return -ENOENT;
>> +		}
>> +	} else if (type == MPAM_CLASS_MEMORY) {
>> +		err = of_node_to_nid(np);
>> +		component_id = (err == NUMA_NO_NODE) ? 0 : err;
>> +		class_id = MPAM_CLASS_ID_DEFAULT;
>>   	}
>>   
>> -	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
>> +	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
>>   }
>>   
>>   static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
>> @@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
>>   	} else {
>>   		if (of_device_is_compatible(parent, "cache"))
>>   			get_cpumask_from_cache(parent, &msc->accessibility);
>> +		else if (of_device_is_compatible(parent, "memory"))
>> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);
>>   		else
>>   			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
>>   	}
>>
>> -- 
>> 2.34.1
>>

-- 
Thx and BRs,
Yin


