Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF1FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVl7KxhpUlQVfwGSCI7uwJIxFW0XwW0xZf2nUDVHT9c=; b=JhSPhqleIp8oZtNIW3ezUrGUff
	IT/2zSvu39+Zvc5vbqf0C6pSh6W1TZcGxgHJkESiUOp49K86FV2ITN0mUx46JPDcfn9aZQSSIoWPg
	VHV29nLOW9CcPGdDIKgzUDIzWDc9MtUcIXIF+GQBltrw25dNEE5iAd+P/E9cZnl+cb+nD0nYxIUrm
	nF8sQp8A4sMjLEQSqt9SEEiskmIVSC/8YyohBlfMohKadqUAZKO0lgKUVVYn2Rz6fHYbapQJkwDxm
	8+Z4+ZjkL93V847VvqD5AnVui6ktYeohXpNjKHMgFcyVSJaZYeqzcjh+Vti4zaxSi/vRtx2B9j1vI
	qFHRWnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZhg-0000000Ef21-08TC;
	Wed, 06 Aug 2025 08:40:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZZK-0000000Ee5J-2zvD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:32:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765FgYv011200
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 Aug 2025 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gVl7KxhpUlQVfwGSCI7uwJIxFW0XwW0xZf2nUDVHT9c=; b=iEjhkFMUTvcNo9ab
	GOcPwI87/CjUigO4zD+nwaSU3vs3ZnMjZKoct81/nobk5IjdSWYZMHGegA1zr9Xp
	Lnw+xq1wj/kyL7YsE0CV6nqYE1UUpQoglz7N1EjgCAOv8ckeGtOj+R8HKaymqXhV
	CIV7FYDSWg/iLq4NI5wgsSFABUwg5NF0m3RRilELVin+mXRU21CgkQeQGWz3owbV
	DEwI1Z90KmzvqVtb/KKCLM/0gXfsPs6zmzUHjuT0oLuxEdN7lF6NG++lwFM//S8i
	AicbCtS37zT9JNFeyMBMlb0HDP+DwNi42iMjtM2XK+5DcjBNrUCcDCmg6Cjj39+f
	2uk3Jw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw322ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:32:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so7457243a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754469136; x=1755073936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVl7KxhpUlQVfwGSCI7uwJIxFW0XwW0xZf2nUDVHT9c=;
        b=aU+QmFfKp+2JEP1io+Lpb7zHYWnOl7KGybDTL8fKVVfg+DEcbynA+U/laDTqwYDAd2
         OGbKwN2TJ1NvtL/n5SDrHGPfJt2A12wox//asB4rosm67XK/lZAZuLklFFoNWqT3qPGI
         gI1o/G10hfk6zCKPckh1AJgc75utCIxUXse7ycc9SuCwqC7yz/oLzMBebyTCwlq5vROv
         HjMxapiytYUp4c763Qjy6s/BxFjABEkrkD+6jHzwqb1pupOgsvrHsd4hLpevAwjup0b9
         Jk6JpPeqmlrmMDbHR227AOzWVXXELyW6+fah5a9y8zgzH/21zrTGtdEef5f6BpuDK9AH
         OSxw==
X-Forwarded-Encrypted: i=1; AJvYcCWPZUsrm+ufbeVDtkXsSFpB90W4dsKgwk6Z8tPXdfXhvyfvQ+9rrKneEQG8YWGV0AKMlQxxBoyKnAy6Tfv/JWtZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPkTNBhwtEea3y/4o2WePU3Y4R4q7CU1L7+JpAXFHycEi6MhFC
	me482+ck4CDn4UbNrd24WLeQUKFcewkMawardm2FXOyLBTXag2jHb2TSnN+G+a542wcB6ciTrT8
	noMJoVRDdb8HO1ppkAPZzJEyEi/T/8VyhfljOdasw0TwwkyuiB81gzaGQI5/D8cCwT0JxhWCI4O
	XI5g==
X-Gm-Gg: ASbGnctwXNCLcpNlCnCynF35XUiM1SuMTUpUHLULJEcayAppIHtkKY8iAlb8tXckFsn
	yWY3Yl0+CdS0v7Zr0JRujkfuOpm1/CzF6DmYlM2cos0p3TB/XY0WVOEgHQqOf1DtIj/IA81xZNz
	EvlbJCqIMV+f4ogWF+h367ln2iPk4dQuXTT9QkiTC2nrlE73yozrvmRJ4erFN7TDpsXIjnTpME6
	pWuIDMGmXE5adza2fzFD57qmA5Dyp5mkDCUU7m2ixsWhz8iKo9MiO4fmK9z1IgKBeCZopm2+OYB
	bOjec1jZYKmpG4eROIP9hnUUBcacVNuJfmY5BwLbiXfqUBmudB9HxMeTnMeQBS0CRXM+rmPE/0x
	WU2ZLSds9DhDrcMnMC/jGVI16
X-Received: by 2002:a17:902:cf0e:b0:23f:c760:fdf0 with SMTP id d9443c01a7336-242a0b8c6dfmr24782535ad.45.1754469136377;
        Wed, 06 Aug 2025 01:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6aanRzxuxOdDFDL6IEoz3tFt0aU9YroEKfjh1dTfuTkVQmyF6r8Xa1vDHzKckrxBfjAPC+A==
X-Received: by 2002:a17:902:cf0e:b0:23f:c760:fdf0 with SMTP id d9443c01a7336-242a0b8c6dfmr24782245ad.45.1754469135862;
        Wed, 06 Aug 2025 01:32:15 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b5e5sm150607895ad.124.2025.08.06.01.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 01:32:15 -0700 (PDT)
Message-ID: <33b6aa57-9675-4b4e-9ecd-f82ed7f6c380@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 16:32:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] coresight: add a new function in helper_ops
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
 <CAJ9a7Vi8qpHH2SjmKNjgeY4gdRXY9wnQXhkjN71EcbYSKqayuw@mail.gmail.com>
 <40c8c2d0-1ac3-4944-b509-d23f21687476@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <40c8c2d0-1ac3-4944-b509-d23f21687476@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX8ENJG7oXHc/P
 hyF/s/fbbm+CAfb+EMsMynuH3dtHawqtP4CitOoAY9jliYNM8h7rb2kswRS6MLxWIXaAGJndi+r
 k0CBqHtxGY4bK3Ny/vTOSgnNrazqKZn6FkNqgirlCHe47TzzbgUaIVmwRKK231aQxmugLoJ6GwF
 vV7itBEP3U8o91R94AMuWxXc2ivbppGh5wJjAcmEmIBm0AD/f5kpY+kMFPtARIjtHtYVmWRG5en
 NyHTKldaQbaA5JjtcTegq/eAyRKk5X7p3UdTLehhpD6hDOJY1hm/wczphn3qSAicZsPoPCySjRc
 kgyP74rz62RmnePlpfjs0cXDloNfJ8eqx5m+Wo1eDuqeLZ4wMF4mgqbjxwR+jToNdKioBHbmUnz
 Cw5YGZM9
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=68931311 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=y1r4oU-oRDH_k5QpEX0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 1v8iufO_AmOTnYjQcbR5xvP37kvqRm0a
X-Proofpoint-ORIG-GUID: 1v8iufO_AmOTnYjQcbR5xvP37kvqRm0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_013218_874907_0B9487C8 
X-CRM114-Status: GOOD (  26.88  )
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



On 8/6/2025 8:35 AM, Jie Gan wrote:
> 
> 
> On 8/5/2025 8:30 PM, Mike Leach wrote:
>> Hi,
>>
>> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>>
>>> Add a new function to identifiy whether the byte-cntr function is
>>> enabled or not in helper_ops.
>>>
>>> The byte-cntr's read_ops is expected if the byte-cntr is enabled when
>>> the user try to read trace data via sysfs node.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../hwtracing/coresight/coresight-ctcu-core.c | 35 +++++++++++++++++++
>>>   include/linux/coresight.h                     |  3 ++
>>>   2 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> index 8fc08e42187e..dec911980939 100644
>>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> @@ -234,9 +234,44 @@ static int ctcu_disable(struct coresight_device 
>>> *csdev, void *data)
>>>          return ctcu_set_etr_traceid(csdev, path, false);
>>>   }
>>>
>>> +static bool ctcu_qcom_byte_cntr_in_use(struct coresight_device *csdev,
>>> +                                      void **data)
>>> +{
>>> +       struct ctcu_byte_cntr *byte_cntr_data;
>>> +       struct coresight_device *helper;
>>> +       struct ctcu_drvdata *drvdata;
>>> +       int port;
>>> +
>>> +       if (!csdev)
>>> +               return false;
>>> +
>>> +       helper = coresight_get_helper(csdev, 
>>> CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
>>> +       if (!helper)
>>> +               return false;
>>> +
>>> +       port = coresight_get_in_port_dest(csdev, helper);
>>> +       if (port < 0)
>>> +               return false;
>>> +
>>> +       drvdata = dev_get_drvdata(helper->dev.parent);
>>> +       /* Something wrong when initialize byte_cntr_read_ops */
>>> +       if (!drvdata->byte_cntr_read_ops)
>>> +               return false;
>>> +
>>> +       byte_cntr_data = &drvdata->byte_cntr_data[port];
>>> +       /* Return the pointer of the ctcu_drvdata if byte-cntr has 
>>> enabled */
>>> +       if (byte_cntr_data && byte_cntr_data->thresh_val) {
>>> +               *data = (void *)drvdata->byte_cntr_read_ops;
>>> +               return true;
>>> +       }
>>> +
>>> +       return false;
>>> +}
>>> +
>>>   static const struct coresight_ops_helper ctcu_helper_ops = {
>>>          .enable = ctcu_enable,
>>>          .disable = ctcu_disable,
>>> +       .qcom_byte_cntr_in_use = ctcu_qcom_byte_cntr_in_use,
>>
>> These ops structures are for generic functions used throughout the
>> devices. Do not put this function here.
>>
>> This is a specific ctcu helper. Make it external to the file and
>> declare it in coresight-ctcu.h
> 
> Will address the comment in next version.

Hi Mike
Cant add an external function in ctcu-core.c and called in tmc-core.c 
because there is a cycle dependency error:
depmod: ERROR: Cycle detected: coresight_tmc -> coresight_ctcu -> 
coresight_tmc
depmod: ERROR: Found 2 modules in dependency cycles!

How about I add a function in tmc-core.c to directly retrieving the 
sysfs_read_ops of the byte-cntr?

like below:
/* Return the byte-cntr's sysfs_read_ops if in use */
static const struct sysfs_read_ops *tmc_qcom_byte_cntr_in_use(struct 
tmc_drvdata *drvdata)
{
         struct ctcu_byte_cntr *byte_cntr_data;
         struct ctcu_drvdata *ctcu_drvdata;
         struct coresight_device *helper;
         int port;

         helper = coresight_get_helper(drvdata->csdev, 
CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
         if (!helper)
                 return NULL;

         port = coresight_get_in_port_dest(drvdata->csdev, helper);
         if (port < 0)
                 return NULL;

         ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
         byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
         if (byte_cntr_data && byte_cntr_data->thresh_val)
                 return ctcu_drvdata->byte_cntr_sysfs_read_ops;

         return NULL;
}

Thanks,
Jie

> 
> Thanks,
> Jie
> 
>>
>> Mike
>>
>>>   };
>>>
>>>   static const struct coresight_ops ctcu_ops = {
>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>> index 4ac65c68bbf4..b5f052854b08 100644
>>> --- a/include/linux/coresight.h
>>> +++ b/include/linux/coresight.h
>>> @@ -419,11 +419,14 @@ struct coresight_ops_source {
>>>    *
>>>    * @enable     : Enable the device
>>>    * @disable    : Disable the device
>>> + * @qcom_byte_cntr_in_use:     check whether the byte-cntr is enabled.
>>>    */
>>>   struct coresight_ops_helper {
>>>          int (*enable)(struct coresight_device *csdev, enum cs_mode 
>>> mode,
>>>                        void *data);
>>>          int (*disable)(struct coresight_device *csdev, void *data);
>>> +       bool (*qcom_byte_cntr_in_use)(struct coresight_device *csdev,
>>> +                                     void **data);
>>>   };
>>>
>>>
>>> -- 
>>> 2.34.1
>>>
>>
>>
> 


