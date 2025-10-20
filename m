Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C4FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBgoG0NlNqdTX6ZdJeqlgGlIGRZdpCkpx7Qc0LRzYsY=; b=X+QCjJq/w+27jaRzFremBjg/UG
	cjXCOqrJLL0FD1t3q5LDFYznUuDNyw5WB/DI9BrAG29HwZGOqEYAvFwa9FYfMrsjN9slVExWspmyQ
	Ka6y4Hu9AwkfWDVw3ZmNM0HGja3IT/h12v4zwubx1BTmsMWtlhblp9fVW22w8G7TnQRB98X5WzBO6
	CFETx9XsN37Kn/WCSpC2fEbNHkWT5OBtwUkqDhgWK6CGT3bsTN9VA4O2G6z8IFNJhB7N0fGsOpTPn
	1FsReNxOFUv5uWz11t7nT9UrR1qKsxxdidjeFQKGUdOTtsHfc2WporaTkvUTpzdJ6SKQHQdPsBi23
	zYk7J7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnZg-0000000Cxzi-2tIF;
	Mon, 20 Oct 2025 10:57:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnZe-0000000CxzC-0lm6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:57:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BA451063;
	Mon, 20 Oct 2025 03:56:59 -0700 (PDT)
Received: from [10.57.65.154] (unknown [10.57.65.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E80313F66E;
	Mon, 20 Oct 2025 03:57:05 -0700 (PDT)
Message-ID: <9cb7bead-d0c0-4edc-a8e3-a77731e8dc8c@arm.com>
Date: Mon, 20 Oct 2025 11:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
 <5a95ad38-0b32-4889-a8fb-af7e79c2e862@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <5a95ad38-0b32-4889-a8fb-af7e79c2e862@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_035710_348349_94C149E2 
X-CRM114-Status: GOOD (  23.77  )
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

On 20/10/2025 11:18, Jie Gan wrote:
> 
> 
> On 10/20/2025 5:06 PM, Xiaoqi Zhuang wrote:
>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
>> and enabled again, currently sysfs_buf will point to the newly
>> allocated memory(buf_new) and free the old memory(buf_old). But the
>> etr_buf that is being used by the ETR remains pointed to buf_old, not
>> updated to buf_new. In this case, it will result in a memory
>> use-after-free issue.
>>
>> Fix this by checking ETR's mode before updating and releasing buf_old,
>> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
>>
> 
> I think we need a fix tag for the fix patch:
> Fixes: de5461970b3e ("coresight: tmc: allocating memory when needed")
> 
> minor comment:
> Since ETR is enabled, we can't switch the sysfs buffer, can we exit 
> earlier by checking the CS_MODE to avoid allocating memory unnecessarily?

+1

Something like this:

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c 
b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..a9ddb05c10d9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1252,6 +1252,12 @@ static struct etr_buf 
*tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
         raw_spin_lock_irqsave(&drvdata->spinlock, flags);
         sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
         if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
+               /*
+                * If the ETR is already enabled, continue with the existing
+                * buffer.
+                */
+               if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+                       goto out;
                 raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

                 /* Allocate memory with the locks released */

Suzuki>
> Besides,
> Looks good to me.
> 
> Thanks,
> Jie
> 
>> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index b07fcdb3fe1a..3e73cf2c38a3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1268,6 +1268,13 @@ static struct etr_buf 
>> *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>           goto out;
>>       }
>> +    /*
>> +     * Since this sink is already enabled, the existing buffer should 
>> not
>> +     * be released even if the buffer size has changed.
>> +     */
>> +    if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
>> +        goto out;
>> +
>>       /*
>>        * If we don't have a buffer or it doesn't match the requested 
>> size,
>>        * use the buffer allocated above. Otherwise reuse the existing 
>> buffer.
>>
>> ---
>> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
>> change-id: 20251020-fix_etr_issue-02c706dbc899
>>
>> Best regards,
> 


