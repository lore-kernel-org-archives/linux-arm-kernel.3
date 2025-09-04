Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4E3CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4UlpG8f8qlhFUnHW3S/D2my3ldPT+l0SoxGKdP3InE=; b=pr3x2OHxdmJEZFZYsA5Kvjppm0
	zrtPxlQEa6qEyDgzUxGV4EuVnTDfR+11e4GRbfpAXQmCCPQNu0ElOBGE7TU7yU3kEkMi1EwzVSZve
	5GQ9la+gjaSvFQQlBOlPsIuMnDGYy2BAaXY6ZL7qmLGIvVnEibwFu8tK1Isa3/mJXOeFX7xV8N0zV
	aL2+d9f0Ry+RDYWOVGdj+eArJp7Ne6eAKFATdOAzkIguc7jITTjqgQUYsnigEX/nf8i/AjOXxLvxy
	BmqtvAiGwZ2eHMyN2AYSU7j4YUcRhOWS6Qhq8dmOjGvnYBlonfqv0PdIjKVokKd/ZR/1rAUPOMfPo
	cHcJ3bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzST-00000008IEt-48U8;
	Thu, 04 Sep 2025 02:12:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyWZ-000000082rd-0LHq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 01:12:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840YFY6007938
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Sep 2025 01:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4UlpG8f8qlhFUnHW3S/D2my3ldPT+l0SoxGKdP3InE=; b=aPimfGmsnQkejr9f
	ZqlGJ3q2HQBGtf0RXrzSel2OHyKkFC+5GHwFiMDJCbx84oN6T4vIbwzZylut/UEh
	EtI8JX+3ClI/Ka1L0mFQAdOzfGJaTZPfxMkwAh46kwVZgaAkulJWDDhK6J7cngYl
	cJVIF4XR03X7MrD5WcezVT8JWEaO85xtDiCYoOSUCWRe3c7Vwq8CVuhY623hn0VJ
	tlcKC9bOU4qGdbvHqAR8zLqqdeu3K4kxgbxz+S3/oxyou7VyIPm1zQRtjFR1gJa6
	YU+j4VehNKXOBI5jD92T7oebXKKjEjWapSlDZLby4QGHB3L/4dnye+ypyrmL9MXS
	FpkS1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy9jxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 01:12:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24456ebed7bso6888745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 18:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756948345; x=1757553145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4UlpG8f8qlhFUnHW3S/D2my3ldPT+l0SoxGKdP3InE=;
        b=SAYe4RnmsMQB/lsnmnYVrQzuLxud96rFWe8iYLS7M0XqDqPqTOVn4CdsWYmK6OI9Sm
         D+TkMddh0eZJ4/6nUE6mnim4m7plN6aM+FuX40CF5lJXFWkmHocwLsrrMis5zfKWLl6N
         vUOD8ZGiZuUhG6ZTRbfiFrV+9b4QCB2a17ehSCH5tO6hNdCUq6IuWUMyQASuEmX/cGGy
         hVbThS9HrMVh3XLXM0TneYjSEuCWjKHZ5KVtvdSWzcr64ak7BU8V3jp3h2Lo2kMpc1kO
         FmyUy/cMT0nu5PUNRaFQ+NAL407wGYRECFQt9O4NsTqdeI6DpfoO9fl4WRa3r/1BiawY
         7r1w==
X-Forwarded-Encrypted: i=1; AJvYcCXZ2kuz6/JUG5Xez8/OJRHRO/F+BoZZ9cSOmjtnbthOKwbcaUdLy0kyzYXFslVe0jnWr8L043r8eTVlqytupTpG@lists.infradead.org
X-Gm-Message-State: AOJu0YxNrJezzBJqlb0HiboukJTJqUjoXU0Bv7p8lSUMJkH5Fcpjw/Qw
	pt40HBTVrizbPzrApcjU3IWymAyxdzpiuFVDRoOAlC7tDnvgkO5wzYpRhPbzRp+nmh8dbCr8Jyl
	XgtsRYB3GN9+O9h8pEutPaR7IIFKo0Xe5M8sW+gFpLVz5WqpAsU56+67Ya2iSfvVlViXdhshPUR
	5s6A==
X-Gm-Gg: ASbGncseWZLmPsGJQ/x+fs2+lwDPfKCAuBXcdpFel73YjPbfovJsxZVyMJ6b7laAoxo
	+JahpeKd6P0kCTO7Ioj3sDfofO+bMUAunf7LS07hM/za4Ua5+LbpYi0W+JYRWD5W5zQP+8NZp5j
	m71iknonyxhYpJLvBYChjVZR1AvaotBfyWr8FEDDXHrPNFAZ4IeWqEhV9VjEKovSIYxDBl+xi43
	6HRg0kp9v2mbdKF+TP6yN/4TmbPhwpGZSXIAakqzL2sshYdk5LyA23TxnK+BMeJaSR3JZH3nugP
	dtJ3Zw655q/eUVXKGQQMAeYvw9i7js1/NZSs3ZQVMfkWrxZQYAEuWgJUwcErCJ97rdMR7uVnrZ+
	Ld4MH3gY0WB+ZzEyTADWuAnCOn8iK
X-Received: by 2002:a17:903:2f8c:b0:249:37b2:8630 with SMTP id d9443c01a7336-2493ee070bcmr241542465ad.5.1756948344538;
        Wed, 03 Sep 2025 18:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9czfEhRl9hye4C8gtNxqDVYJf3M5iT4GyatmB+ImJck7rp2ujuN2+s56plaoGT8AWoaCKRg==
X-Received: by 2002:a17:903:2f8c:b0:249:37b2:8630 with SMTP id d9443c01a7336-2493ee070bcmr241542015ad.5.1756948343958;
        Wed, 03 Sep 2025 18:12:23 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9304b7eesm29677115ad.102.2025.09.03.18.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 18:12:23 -0700 (PDT)
Message-ID: <1cef4224-1f0a-4c51-937d-66823a22dec3@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 09:12:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
 <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
 <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b8e779 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7yWgPBNy7Zp0T3bZPJgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vzmZkPL11wBwz5XBSqf_uJtBXvD0Ed5H
X-Proofpoint-ORIG-GUID: vzmZkPL11wBwz5XBSqf_uJtBXvD0Ed5H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXyARrv6IYYOHv
 KGVaN355qwVliBClEi6aXR9AqOa9E0GKLZCdXINaJdQmLa3E2Q1NS9XSVSB4CQkItwnyLu30cCn
 WNdUIW4LxBBZrX1Nc+9/Zc2l0rXse8KygKuz6NzSDsgQ3TFC0p9sBywI6pZqHcrbwxd7Kc3fGFx
 OGsAYTlKfnfefzfuYO0htHtP6+rYl1kPwkpnOrfl/qdn7Wgeo6lNtUIs0Se9ciBnekhaHVreZbM
 OdyYKJ08dChq9tj+FwbY1IikuxkvqGRh0RTTMMuXpVw2kXolXjJwbgrIcQIP9Hmm257TLrKCNDy
 IR6IX4fNd+lH7ZHHpWcgc3E+9v7TT3nwkvwOKujv/zpm6oWfKvJkeioe5Nxm8ZBqK1vbOtAOeaS
 ryl6g0Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_11,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_181227_241603_B9EDC0A3 
X-CRM114-Status: GOOD (  26.87  )
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



On 9/3/2025 5:45 PM, Jie Gan wrote:
> 
> 
> On 9/3/2025 4:57 PM, Suzuki K Poulose wrote:
>> On 06/08/2025 09:09, Jie Gan wrote:
>>> Some TPDM devices support both CMB and DSB datasets, requiring
>>> the system to enable the port with both corresponding element sizes.
>>>
>>> Currently, the logic treats tpdm_read_element_size as successful if
>>> the CMB element size is retrieved correctly, regardless of whether
>>> the DSB element size is obtained. This behavior causes issues
>>> when parsing data from TPDM devices that depend on both element sizes.
>>>
>>> To address this, the function should explicitly fail if the DSB
>>> element size cannot be read correctly.
>>
>> But what is the device only has CMB ? Back when this was originally 
> 
> We have CMB TPDM, DSB TPDM and CMB&&DSB TPDM.
> 
>> merged, we raised this question and the answer was, "Only one is 
>> supported, not both." But this sounds like that is wrong.
> 
> I think we may not answer the previous question clearly. But it 
> definitely has issue here.
> 
>> Could we defer the "Warning" to the caller. i.e., Let the caller
>> figure out the if the DSB size is found and predicate that on the
>> DSB support on the TPDM.
> 
> Understood, below codes will be added in the caller to check the error:
> if ((tpdm_data->dsb && !drvdata->dsb_esize) ||
>      (tpdm_data->cmb && !drvdata->cmb_esize))
>      goto err;
> 
> Thanks,
> Jie
> 

Hi Suzuki,

I've reviewed the logic here. It's not feasible for the caller to 
perform the check, since we first retrieve TPDM's drvdata, which adds 
complexity to the code. I believe it's better to handle this within the 
function itself.

We are expecting the element_size for cmb if the condition is true, as 
well as dsb:
if (tpdm_data->dsb)
...
should obtain a valid element size for dsb.
...

if (tpdm_data->cmb)
...
should obtain a valid element size for cmb.
...

Thanks,
Jie

>>
>> Suzuki
>>
>>>
>>> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB 
>>> element")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.c
>>> index 0633f04beb24..333b3cb23685 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct 
>>> tpda_drvdata *drvdata,
>>>       if (tpdm_data->dsb) {
>>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>>> +        if (rc)
>>> +            goto out;
>>>       }
>>>       if (tpdm_data->cmb) {
>>> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct 
>>> tpda_drvdata *drvdata,
>>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>>       }
>>> +out:
>>>       if (rc)
>>>           dev_warn_once(&csdev->dev,
>>>               "Failed to read TPDM Element size: %d\n", rc);
>>
>>
> 


