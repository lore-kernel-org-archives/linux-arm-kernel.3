Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DE7CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWJipRp1l0+TmPmfCk3tN9r8Mezn1hV2BQ2RPCc3KbU=; b=I/ew/aSnoKiLgrRn8sW9c2iMlt
	NXPjKPtQru4g8lxK1nVuv/B+4jO0QdguU3SygrNt7l7NL0pOm5AVF+BpYOawrf69O57scuFkfYTQ+
	AcRa4JF+wnciZl2EHIztgBCVUFbyaGcLkTBLv4GSqfCZXteI3BufJ8I9bjOYU5tr83e3OUsBXRcpF
	dIqHBzK7W4qNb6YUurEMqEJL725XWBMkVHl0FCWlTSwrS4nogpeMckSEvispQT94hkkZgbHNbN3tj
	5zH0BqDK2COm96xF7MA94wqPu1DlXA5g7f86GLCbnh9nOSij4cJLsTMTmO8BBnvzFjUnOiQxWBrWd
	4Xd+UXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6oL-0000000AkC8-3w84;
	Thu, 04 Sep 2025 10:03:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5fv-0000000AM04-0XE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 08:50:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA6881596;
	Thu,  4 Sep 2025 01:50:25 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0F793F63F;
	Thu,  4 Sep 2025 01:50:32 -0700 (PDT)
Message-ID: <961258a0-3cc6-4935-a305-80bb2c2c0597@arm.com>
Date: Thu, 4 Sep 2025 09:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
 <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
 <a4382db3-115a-4d79-924a-08507e6e7b3e@oss.qualcomm.com>
 <1cef4224-1f0a-4c51-937d-66823a22dec3@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <1cef4224-1f0a-4c51-937d-66823a22dec3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_015035_245690_C7A12E98 
X-CRM114-Status: GOOD (  23.23  )
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

On 04/09/2025 02:12, Jie Gan wrote:
> 
> 
> On 9/3/2025 5:45 PM, Jie Gan wrote:
>>
>>
>> On 9/3/2025 4:57 PM, Suzuki K Poulose wrote:
>>> On 06/08/2025 09:09, Jie Gan wrote:
>>>> Some TPDM devices support both CMB and DSB datasets, requiring
>>>> the system to enable the port with both corresponding element sizes.
>>>>
>>>> Currently, the logic treats tpdm_read_element_size as successful if
>>>> the CMB element size is retrieved correctly, regardless of whether
>>>> the DSB element size is obtained. This behavior causes issues
>>>> when parsing data from TPDM devices that depend on both element sizes.
>>>>
>>>> To address this, the function should explicitly fail if the DSB
>>>> element size cannot be read correctly.
>>>
>>> But what is the device only has CMB ? Back when this was originally 
>>
>> We have CMB TPDM, DSB TPDM and CMB&&DSB TPDM.
>>
>>> merged, we raised this question and the answer was, "Only one is 
>>> supported, not both." But this sounds like that is wrong.
>>
>> I think we may not answer the previous question clearly. But it 
>> definitely has issue here.
>>
>>> Could we defer the "Warning" to the caller. i.e., Let the caller
>>> figure out the if the DSB size is found and predicate that on the
>>> DSB support on the TPDM.
>>
>> Understood, below codes will be added in the caller to check the error:
>> if ((tpdm_data->dsb && !drvdata->dsb_esize) ||
>>      (tpdm_data->cmb && !drvdata->cmb_esize))
>>      goto err;
>>
>> Thanks,
>> Jie
>>
> 
> Hi Suzuki,
> 
> I've reviewed the logic here. It's not feasible for the caller to 
> perform the check, since we first retrieve TPDM's drvdata, which adds 
> complexity to the code. I believe it's better to handle this within the 
> function itself.
> 
> We are expecting the element_size for cmb if the condition is true, as 
> well as dsb:
> if (tpdm_data->dsb)
> ...
> should obtain a valid element size for dsb.
> ...
> 
> if (tpdm_data->cmb)
> ...
> should obtain a valid element size for cmb.
> ...
> 

Ok, fair enough. Please resend the patch without the dependency on the 
static TPDM patch. Given this is a fix, this could go in without waiting 
for the new series.

Suzuki



> Thanks,
> Jie
> 
>>>
>>> Suzuki
>>>
>>>>
>>>> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB 
>>>> element")
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.c
>>>> index 0633f04beb24..333b3cb23685 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct 
>>>> tpda_drvdata *drvdata,
>>>>       if (tpdm_data->dsb) {
>>>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>>>> +        if (rc)
>>>> +            goto out;
>>>>       }
>>>>       if (tpdm_data->cmb) {
>>>> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct 
>>>> tpda_drvdata *drvdata,
>>>>                   "qcom,cmb-element-bits", &drvdata->cmb_esize);
>>>>       }
>>>> +out:
>>>>       if (rc)
>>>>           dev_warn_once(&csdev->dev,
>>>>               "Failed to read TPDM Element size: %d\n", rc);
>>>
>>>
>>
> 


