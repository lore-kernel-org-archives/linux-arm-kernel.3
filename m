Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C64D5CCA6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxOfEoxJrpdJfWhALuCidnuHpCbc4UMX4i9V24oLUBI=; b=NhgUdhaIfgfDHEGPU+dGy3hTt3
	iCdCz9rXacE2BqQ3I50V4eWNFm71XSSlJuTk07E59nANfPlB48TRRJBiu0UK0vt+ZF/It+toaz1p8
	3tnV7e7c3jx+03O3haEVYXgpIDZTeUYlqMNvFw5tGs4++Yh1EsEr8iHxvDp23shhbUM6MfBUtAUXX
	rqSsfIo8QU+JXUiBdOZxr2jJ+WKipI3qDBeOIaKXYTMK9mVyxWZSnnspcV5SLNFtnzkO+V4E+JT43
	lNVsW9MTszeSTVOYzxIdQbAYjQghNK/65GK48GZONqkx8sv2AiiQz5sJsY5zQeqKR3rl0AYAZZLuw
	cErGhj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68Di-00000000Nmh-1qgZ;
	Wed, 30 Oct 2024 12:54:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68AD-00000000NEm-1Zc4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:51:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBDT9L008803;
	Wed, 30 Oct 2024 12:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxOfEoxJrpdJfWhALuCidnuHpCbc4UMX4i9V24oLUBI=; b=hptq/L4lQ4yD3X0f
	fjnbcamXtEISJU2eQX6JofH3dbOw59mYGwVslMzQfu34CDWQsT4o6WD8RKSsGhJq
	4+/0M1sDVlFlwyZU67jTjeV1zBo2kCxN5cMiEhTpQcwCHiCHkOmoDUWH3k7Hy9XK
	w/ft9GJCiuC5gN5TQhhHkpwvF3H2caLBoBtZf3HzIrqfPagK/1OEplG2CUGtITBz
	HTDnYmZQ2EUQJuvvd4I6owK2TgCPDnhngpMyXkVEFhmu+uxof4xM//MkH4+lfYwi
	TZmxHG19bqaBTF4O8+jDa4/6E/uMtEE9ZtelbNw5Y2wxbhBJ0saeoAmiIaU0xXwq
	WcORWA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42jxa8bu6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:50:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UCorHS005813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:50:53 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 05:50:46 -0700
Message-ID: <58932d61-0aab-7738-97a1-2eda3bcda0ec@quicinc.com>
Date: Wed, 30 Oct 2024 18:20:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 3/4] pmdomain: core: Fix debugfs node creation failure
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <jassisinghbrar@gmail.com>, <dmitry.baryshkov@linaro.org>,
        <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <johan@kernel.org>,
        <konradybcio@kernel.org>, <linux-pm@vger.kernel.org>,
        <tstrudel@google.com>, <rafael@kernel.org>,
        Johan Hovold
	<johan+linaro@kernel.org>
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
 <20241023102148.1698910-4-quic_sibis@quicinc.com>
 <CAPDyKFrVopgySevDVZtkZdHBBxiiVNh73VOXLqaHfXs9MyiZ+w@mail.gmail.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <CAPDyKFrVopgySevDVZtkZdHBBxiiVNh73VOXLqaHfXs9MyiZ+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VvKhigREobC6oWICJY78p9ho5q6T5YYT
X-Proofpoint-ORIG-GUID: VvKhigREobC6oWICJY78p9ho5q6T5YYT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_055105_467725_2F956674 
X-CRM114-Status: GOOD (  26.00  )
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



On 10/28/24 18:58, Ulf Hansson wrote:
> On Wed, 23 Oct 2024 at 12:22, Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>
>> The domain attributes returned by the perf protocol can end up
>> reporting identical names across domains, resulting in debugfs
>> node creation failure. Fix this failure by ensuring that pm domains
>> get a unique name using ida in pm_genpd_init.
>>
>> Logs: [X1E reports 'NCC' for all its scmi perf domains]
>> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
>> debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
>>
>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>> Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
>> Fixes: 718072ceb211 ("PM: domains: create debugfs nodes when adding power domains")
>> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
>> v3:
>> * Update device names only when a name collision occurs [Dmitry/Ulf]
>> * Drop Johan's T-b from "fix debugfs node creation failure"
>>
>>   drivers/pmdomain/core.c   | 65 ++++++++++++++++++++++++++++++---------
>>   include/linux/pm_domain.h |  1 +
>>   2 files changed, 51 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> index 76490f0bf1e2..756ed0975788 100644
>> --- a/drivers/pmdomain/core.c
>> +++ b/drivers/pmdomain/core.c
>> @@ -7,6 +7,7 @@
>>   #define pr_fmt(fmt) "PM: " fmt
>>
>>   #include <linux/delay.h>
>> +#include <linux/idr.h>
>>   #include <linux/kernel.h>
>>   #include <linux/io.h>
>>   #include <linux/platform_device.h>
>> @@ -23,6 +24,9 @@
>>   #include <linux/cpu.h>
>>   #include <linux/debugfs.h>
>>
>> +/* Provides a unique ID for each genpd device */
>> +static DEFINE_IDA(genpd_ida);
>> +
>>   #define GENPD_RETRY_MAX_MS     250             /* Approximate */
>>
>>   #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)         \
>> @@ -189,7 +193,7 @@ static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
>>
>>          if (ret)
>>                  dev_warn_once(dev, "PM domain %s will not be powered off\n",
>> -                               genpd->name);
>> +                             dev_name(&genpd->dev));
>>
>>          return ret;
>>   }
>> @@ -274,7 +278,7 @@ static void genpd_debug_remove(struct generic_pm_domain *genpd)
>>          if (!genpd_debugfs_dir)
>>                  return;
>>
>> -       debugfs_lookup_and_remove(genpd->name, genpd_debugfs_dir);
>> +       debugfs_lookup_and_remove(dev_name(&genpd->dev), genpd_debugfs_dir);
>>   }
>>
>>   static void genpd_update_accounting(struct generic_pm_domain *genpd)
>> @@ -731,7 +735,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>>          genpd->states[state_idx].power_on_latency_ns = elapsed_ns;
>>          genpd->gd->max_off_time_changed = true;
>>          pr_debug("%s: Power-%s latency exceeded, new value %lld ns\n",
>> -                genpd->name, "on", elapsed_ns);
>> +                dev_name(&genpd->dev), "on", elapsed_ns);
>>
>>   out:
>>          raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
>> @@ -782,7 +786,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
>>          genpd->states[state_idx].power_off_latency_ns = elapsed_ns;
>>          genpd->gd->max_off_time_changed = true;
>>          pr_debug("%s: Power-%s latency exceeded, new value %lld ns\n",
>> -                genpd->name, "off", elapsed_ns);
>> +                dev_name(&genpd->dev), "off", elapsed_ns);
>>
>>   out:
>>          raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
>> @@ -1941,7 +1945,7 @@ int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb)
>>
>>          if (ret) {
>>                  dev_warn(dev, "failed to add notifier for PM domain %s\n",
>> -                        genpd->name);
>> +                        dev_name(&genpd->dev));
>>                  return ret;
>>          }
>>
>> @@ -1988,7 +1992,7 @@ int dev_pm_genpd_remove_notifier(struct device *dev)
>>
>>          if (ret) {
>>                  dev_warn(dev, "failed to remove notifier for PM domain %s\n",
>> -                        genpd->name);
>> +                        dev_name(&genpd->dev));
>>                  return ret;
>>          }
>>
>> @@ -2014,7 +2018,7 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
>>           */
>>          if (!genpd_is_irq_safe(genpd) && genpd_is_irq_safe(subdomain)) {
>>                  WARN(1, "Parent %s of subdomain %s must be IRQ safe\n",
>> -                               genpd->name, subdomain->name);
>> +                    dev_name(&genpd->dev), subdomain->name);
>>                  return -EINVAL;
>>          }
>>
>> @@ -2089,7 +2093,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
>>
>>          if (!list_empty(&subdomain->parent_links) || subdomain->device_count) {
>>                  pr_warn("%s: unable to remove subdomain %s\n",
>> -                       genpd->name, subdomain->name);
>> +                       dev_name(&genpd->dev), subdomain->name);
>>                  ret = -EBUSY;
>>                  goto out;
>>          }
>> @@ -2199,6 +2203,23 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
>>          }
>>   }
>>
>> +static bool genpd_name_present(const char *name)
>> +{
>> +       bool ret = false;
>> +       const struct generic_pm_domain *gpd;
>> +
>> +       mutex_lock(&gpd_list_lock);
>> +       list_for_each_entry(gpd, &gpd_list, gpd_list_node) {
>> +               if (!strcmp(dev_name(&gpd->dev), name)) {
>> +                       ret = true;
>> +                       break;
>> +               }
>> +       }
>> +       mutex_unlock(&gpd_list_lock);
>> +
>> +       return ret;
>> +}
>> +
>>   /**
>>    * pm_genpd_init - Initialize a generic I/O PM domain object.
>>    * @genpd: PM domain object to initialize.
>> @@ -2226,6 +2247,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>>          genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
>>          genpd->device_count = 0;
>>          genpd->provider = NULL;
>> +       genpd->device_id = -ENXIO;
>>          genpd->has_provider = false;
>>          genpd->accounting_time = ktime_get_mono_fast_ns();
>>          genpd->domain.ops.runtime_suspend = genpd_runtime_suspend;
>> @@ -2266,7 +2288,18 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>>                  return ret;
>>
>>          device_initialize(&genpd->dev);
>> -       dev_set_name(&genpd->dev, "%s", genpd->name);
>> +
>> +       if (!genpd_name_present(genpd->name)) {
>> +               dev_set_name(&genpd->dev, "%s", genpd->name);
>> +       } else {
>> +               ret = ida_alloc(&genpd_ida, GFP_KERNEL);
>> +               if (ret < 0) {
>> +                       put_device(&genpd->dev);
>> +                       return ret;
>> +               }
>> +               genpd->device_id = ret;
>> +               dev_set_name(&genpd->dev, "%s_%u", genpd->name, genpd->device_id);
>> +       }
> 
> If we can't assume that the genpd->name is unique, I think we need to
> hold the gpd_list_lock over this entire new section, until we have
> added the new genpd in the gpd_list. I am not sure we really want this
> as it could hurt (theoretically at least) boot/probing on systems
> where a lot of genpds are being used.
> 
> That said, I would suggest we go for Dmitry's suggestion to make this
> genpd provider specific. Let's add a new genpd flag that genpd
> providers can set, if they need an ida to be tagged on to their
> device-name. Then we should set that flag for SCMI perf/power domains.

lol, will do ^^ in the next re-spin.

-Sibi

> 
> [...]
> 
> Kind regards
> Uffe

