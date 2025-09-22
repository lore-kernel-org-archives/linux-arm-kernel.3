Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3FECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QFAuB94TCuhJbu5HfgrzB51Khzr10FN1no2TYnl+3I=; b=ie4kG6fx7gR5mALiy6Rca1afWL
	tSFAwYH8Vezm9clVXU6K9SVaRskKKSb++4B3nLJBfxQhx+/6rHBCFMotk02RzBHANt7CZ3HI47X5L
	bjAH+r7NW6egtC3Y/mpMfskECWlMPqiOI10FZRcsIfBdU25Fk/w+tQ4SE+2S0gC1xInFCQxLtAvg+
	GkQg0X3OSgLhCAi5kxczvrct/GwmsJEMxAsYLRX5g5eWy/LiVWjY1zrtpw6eChGBbDWhOQvVMpQVZ
	BnBV7Eh2FFsD05HqyL+a00GSRVXFkACBE4GDL1G8JIS4/97avRsjMIntY7+hkKF/E2hXUIFOpnvd0
	U3FTgUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ci8-00000009rzs-34Uq;
	Mon, 22 Sep 2025 09:19:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ci6-00000009ryn-0lA4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:19:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8niVc032343
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QFAuB94TCuhJbu5HfgrzB51Khzr10FN1no2TYnl+3I=; b=jop2UggqJ8cXVBD1
	m585fhzOmI+yGD9lZaq/gDVGNuTf/4g73kSNzeUy8q+znm1KYBzDW4OgH8nKo2U3
	fI1QHHWvnK6+5z0FjXvUJ2SVAh1+XV5K3+sBZh2X7nExAMwlggad+SBxXK4kfCUb
	Ssgbro6R8AoOCFAaenKeznz/amkSeQzJjJNlCDbdywvUrlbxYLY6+yhwsHW+dgj9
	4t5r08a+UHwBIqvzsmU9uCbrFFG+vyv+UR5PFgz1OFz/11mDlsHh+MdfRHVJZpdU
	NSTIemjDXUvRzZdDBmATkNLu29QVAleyVB4n/B7U54Y4j0Gpm/bhkslx951Lhm8f
	F0jwtg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mn7c6w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:19:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so3992409a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758532787; x=1759137587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6QFAuB94TCuhJbu5HfgrzB51Khzr10FN1no2TYnl+3I=;
        b=vKCoaqJjUI9JYFvIxH+q0oh0E31Z++QPxiYV5AEImR5uAlpUPtaOCxEVRHR3iVUQLp
         cQNOJ8lv+2dLsXvxzRG+mFE3ngOKtjWvJa2hCMIEhscDPVKehrSDrWJ8ePZKkhxyXi/Z
         2syQgew4Faq/AiUZAiWpzbqP0SRibG/NL3yHg0Skw0eK3gaejNwn2OAdCtYX5Dexd6Ms
         9zVxW1jrcwOWs1MDapQh9CrZw3oyEHy+a07f+WycTKjexmiGjMftgBGgh68hKB/4p9s/
         OERSKSj1vVP9Jd2KocO3/Xg9t4lRLu680/hCSBdeuEXpJzaHSKiCeX0zJxttPu+ehe0z
         QAIg==
X-Forwarded-Encrypted: i=1; AJvYcCXaBHHebyDuI9zFqsj83EnSMjv7Cm41Eu2Gp1MsbT8l9N9H6gexQC081eJPBsXXQ5iXTUS9ps4z34klmRTBdZuU@lists.infradead.org
X-Gm-Message-State: AOJu0YxQrT/IsQLpjPGv4enbru5jbzYC4YN+ywDTL9ZQuihFidTVCI+K
	hF+akvBr/0Lq36F+K5VDe2bjufUy0InxVFbYkCsOUkHSc85yNwtqt36jImsVG7TRl53rlTIGk0E
	S1EToq+BpiEplTuG67asuQ+cFVOjaZ0WFQ6JRQjXqjoVtQ6KkmRe14N5jMmkrJ6Y7tQuGoddJiC
	ffWg==
X-Gm-Gg: ASbGnctzIu6/KZxAYKHau5r72R0/qjE93//8S0bhL+AsVdGOPVmPzb1nlzSKD51l6aq
	ixqohmFQgrxMo3CdZ+skk6y4j/cfYqyC1DFB40tdYRbD62OKkbwxjmmgeAaviTov81M1K4qGNM/
	b+B69XT3tukzeQ14GSpAdeYXC6DVqMq+hEx7Xr2tJP2OcfLDr82P3tzc0hjn4rjAUqY9UzNbTEV
	ea/kr0rkE5vH6V6lK2Cb5j4/3fq2Kj0K7nwO7pDo0hkJKtx2sI7mRGLx6O/9kAL/4PCzvCJxpt2
	5S7QT9qfYItkujl8myFpy5MSeMz5VDtZdgt/qSQ5EWLZKLjC9t4xiyN6BLAoo2vZFKOvn3AIFsO
	K/qd5FU/pe5F66/IfK7Lvn/oaIEHW
X-Received: by 2002:a17:90b:3a4f:b0:330:ba05:a799 with SMTP id 98e67ed59e1d1-330ba05a7efmr12060862a91.16.1758532787543;
        Mon, 22 Sep 2025 02:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGlBLHJiIRLKu2Bo5vmptL2RNjyGlsgtdhiL+mYYxplGiZaDVAKYWlOvZMv2E4Ns2BZBmdVA==
X-Received: by 2002:a17:90b:3a4f:b0:330:ba05:a799 with SMTP id 98e67ed59e1d1-330ba05a7efmr12060841a91.16.1758532787103;
        Mon, 22 Sep 2025 02:19:47 -0700 (PDT)
Received: from [10.133.33.94] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607b1fccsm12530565a91.14.2025.09.22.02.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 02:19:46 -0700 (PDT)
Message-ID: <808e57a4-8f1e-4870-894e-2eb05ec7a134@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 17:19:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
To: Leo Yan <leo.yan@arm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <20250922082920.GB516577@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250922082920.GB516577@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX/2NF39giq5AY
 SZH6gaRF0ujxPrMKIKSesHuQ4XXL9Tg1Atw+Hjv0R9nGVq/fM9ZTL2NQkPmbt+ZbR7YWji0pow/
 iI1457newO53BPnl6EKl4gXVpkai/oywrPdFK/1uDPXXQF3564mAa5Uib0f6RuHoCjrS2SrEcBf
 Jg1uHjm/xWAc249v/G6acCXm5cKmmnp7cuenFr0hC7mzvadECO3XbWM+kly+yMvbHFlBnRJg/fn
 hNH1lAVOAc5ZDz6t+8vNtf4X0z1Ce/ztnD4Yry46Su1ODCphW1xSC31Kod7Op4Hc3CgvVsHxLp6
 aCUX8QzzxbGlMCcdBRnJPW/BUXAoCIJkkBzp5iVOd+2lcy6UqPDAtR68nktHlInFEwpHhTNNi+x
 3UYRgytr
X-Proofpoint-GUID: oP6yA6TMXFGCIcyNXNfvLTHpa6yBYuFP
X-Proofpoint-ORIG-GUID: oP6yA6TMXFGCIcyNXNfvLTHpa6yBYuFP
X-Authority-Analysis: v=2.4 cv=EZrIQOmC c=1 sm=1 tr=0 ts=68d114b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=ck2vDrGU2QCsmqff:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vzhER2c_AAAA:8
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=ZO4bw9XDxdbX_LlL1T4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=0YTRHmU2iG2pZC6F1fw2:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_021950_343920_C47AFEF9 
X-CRM114-Status: GOOD (  24.92  )
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



On 9/22/2025 4:29 PM, Leo Yan wrote:
> On Mon, Sep 22, 2025 at 03:31:39PM +0800, Jie Gan wrote:
>> From: Carl Worth <carl@os.amperecomputing.com>
>>
>> The handle is essential for retrieving the AUX_EVENT of each CPU and is
>> required in perf mode. It has been added to the coresight_path so that
>> dependent devices can access it from the path when needed.
>>
>> Fixes: 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
>> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm-perf.c |  1 +
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c  |  3 ++-
>>   include/linux/coresight.h                        | 10 ++++++----
>>   3 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> index f677c08233ba..5c256af6e54a 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
>> @@ -520,6 +520,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>>   		goto out;
>>   
>>   	path = etm_event_cpu_path(event_data, cpu);
>> +	path->handle = handle;
>>   	/* We need a sink, no need to continue without one */
>>   	sink = coresight_get_sink(path);
>>   	if (WARN_ON_ONCE(!sink))
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index b07fcdb3fe1a..1040f73f0537 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1327,7 +1327,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>>   				   enum cs_mode mode, void *data)
>>   {
>> -	struct perf_output_handle *handle = data;
>> +	struct coresight_path *path = data;
>> +	struct perf_output_handle *handle = path->handle;
>>   	struct etr_perf_buffer *etr_perf;
>>   
>>   	switch (mode) {
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 6de59ce8ef8c..4591121ae1d4 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -332,12 +332,14 @@ static struct coresight_dev_list (var) = {				\
>>   
>>   /**
>>    * struct coresight_path - data needed by enable/disable path
>> - * @path_list:              path from source to sink.
>> - * @trace_id:          trace_id of the whole path.
>> + * @path_list:			path from source to sink.
>> + * @trace_id:			trace_id of the whole path.
>> + * struct perf_output_handle:	handle of the aux_event.
> 
> s/struct perf_output_handle/@handle/

Hi Leo,

Thanks for pointing out. I actually missed this error during the code 
review...

Jie

> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
>>    */
>>   struct coresight_path {
>> -	struct list_head	path_list;
>> -	u8			trace_id;
>> +	struct list_head		path_list;
>> +	u8				trace_id;
>> +	struct perf_output_handle	*handle;
>>   };
>>   
>>   enum cs_mode {
>>
>> -- 
>> 2.34.1
>>
>>


