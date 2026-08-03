Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E60C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hkRJdHHeh4LvGjciwvxGygdU4Rqbcvkupv7IYudRX4=; b=A+zFvnn6uXYMrXmFJrFMbyIgBp
	idoD0Dm2AWqemAdnVdFA7jGHkVxT2ND/0jnG/mFuuYVpiQxbon/YDJf9sYNGddPvRsyyN2Jg7IA5R
	DSME7IoueE/5m3zCPG+NGheGUmEtc85lObckuPr434VyO5Gyz2GSTub7ZYtyEy9f8NxwMlhAVkO4U
	GHrZmCHXKIA4mThQJEiCEhXkhMbx3q3U1pMIeUuO1bBy5kVaCrVqnqQ2Wg47CH0NI3PqA3OpLsu2A
	Ze9kyDu2kI5xLeq6QfyLk/XVD2lYP9p9fOY7ABuERYD62QX/52m0aYaX6iiShagdEez2Z3o5TntDO
	5mpxHewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqFK-0000000Gtey-3Mk5;
	Mon, 03 Aug 2026 10:50:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqFF-0000000GtdZ-3tNJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:50:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AkXmb005475
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 10:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hkRJdHHeh4LvGjciwvxGygdU4Rqbcvkupv7IYudRX4=; b=Pbe/KUvdhObQu9Kd
	yBAUFYkyh9ubMnvIaz52rDPd64UTKuhaP94V/AsmSzr8QlIwqxXBqelkIskbr1qn
	LzdFymYQXZo+gN7HfQRwazb5aUIXmHp873SoxCfytMa0Pr+7TdQSxGELY5CkI8h7
	hBWg1B/VTqwDKe/F3auiU8QueAwCJ7eWVaOdFA2ZZjm/ZmLyhiXkLTNi/3EgDMT9
	eiukH+Esvg9rwPb8NzYgAcX3oQSIiAj0TUQips44gVG0elSTu3vsrcuteDHk+d/X
	Fe5luCkB4RKeIcOJM+jglq1eUWlOohOtquCSmuyCNJajb4RVvSDtvEr1ze5YMlEI
	6/xrpA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj794pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:50:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso8401376a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754202; x=1786359002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hkRJdHHeh4LvGjciwvxGygdU4Rqbcvkupv7IYudRX4=;
        b=Z9srrufFDX8UtuVBAcIQY8sxWEDuepBfmoaiGXpTBd22QDxJDGW8EJs6MpNJNbwIB9
         8j4BR+1zgoEr/Xe37sFXHwQ+UNEuD5ckinmZd/ZcdXUwcWS6Xai0gpk0NG5E+FL41OK9
         hGakLxThwfTPyulf5UeONKRCqy79l8lhWCFr4m7afGwNIG75cluy3vRe9YZcoAVORZaz
         UibBeQWeqsljEtdaU5op/y1ydc2+xo4F35xSTF7VLEMJ0tSGvV8naKbPXH1B1kNOZPLe
         MZnAUHfOqxt+UVUoMkOfwQr+9Dx5QOYuRIWYVzV8Rb54kbxK7pNd5gL4qsYDJ/WjI2L0
         uxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754202; x=1786359002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hkRJdHHeh4LvGjciwvxGygdU4Rqbcvkupv7IYudRX4=;
        b=FOrzACXRHGVMVK/80b3dHdmgiIjkwlGrZgN5DEEVmnjE9ruvLyXbr5PeycPXIlipLT
         O/3gobAA7FOgWNb6RVnTr9mHN1Yn0dN7wgZSy+R2J5mQq85Q1Mc6dkR8dhisFmi3cuR6
         4aefF8f3iufP65NeI/LD30xrrVOrdp1LHde3uOil+EFqMvGlvX9y15v4SHC3F4Z8RzfY
         il59FYDvc1UzRqhUwVIhufSwPN/cBulOpuNeyNYVdFWjVsfSwTbzmjOq1N5pjdjTdoX7
         7kuQSanKnCwNxOMP+igtmonCjALBvP7JVvD2LJQzwg1sOAEGZfw7VOXEXoS7rCU0r2SK
         tisw==
X-Forwarded-Encrypted: i=1; AHgh+Rrz5CFDUYK9kGEvxhVC7+e1NVDQseD56hudYhrrfENNQgZUPfyseVwxszOx3Mp/KBJibE2G64aw3YsbK1ouWIAD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/05qkFVWo3XGx7zxeKusZByVBeNPF/WIVK4gH+hcPAUtTYNfT
	Dw9RDym9GgA3XJf6Ct57gkPgPDP4h3gUt6Z96ZbHmWL0RmosHogVR0cDgnyx0ToxNU0V0aqbroh
	BtTd3m2WGhZq8pY/LlCp9jBKnSeWJrDgYl31PC7olsJKa5Jpdncu72oxSM4v0Vp0FbykdQbN0gC
	hEjQ==
X-Gm-Gg: AR+sD12F9nLX2goI1UQhWA8B5iOHTLvJZIi+P/V34XgDXOQJsdnmtHGBTzXrex2Bk2A
	mLrtu0dTkdd/WakOwup8BAjf8pBW7JIlqeXMlzY7vpTY/BUPtZshwKSpcQ6l6kFXGZr4QYsxrim
	vW0uYhgALAZl0rGh+URfd/D3LDHbCXu5lfl2FhUUYScAwXfpUpx/TNJXAK85JTt5+XZWRDWAeiF
	/JT+WpHmWltxhlbvLFt/a0tswMBjcGiz6vjtygD6SasnPjoBxvXjEs4FdXi0GB/GEkBdfr8KVKd
	rZIu1ZGWLQRAZJW8wq7qb0nEgG755uAne+t8sCzMdRRqwEsFHD7BhFm2+U+b2jG9cQfIDqYyatB
	6tQVvfPibfIHFl0XyGgtxDsYRc/2E5+N9KQ==
X-Received: by 2002:a05:6a21:e082:b0:3c3:7d12:a98c with SMTP id adf61e73a8af0-3c92a8b424amr9581885637.52.1785754202384;
        Mon, 03 Aug 2026 03:50:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:e082:b0:3c3:7d12:a98c with SMTP id adf61e73a8af0-3c92a8b424amr9581847637.52.1785754201875;
        Mon, 03 Aug 2026 03:50:01 -0700 (PDT)
Received: from [192.168.1.106] ([106.51.196.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153db2f911sm41210280eec.0.2026.08.03.03.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:50:01 -0700 (PDT)
Message-ID: <dd4d5ddc-e198-4747-85ce-aef4c569c593@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:19:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/11] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-12-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260731170324.2927758-12-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8dHniZfSgydmLqVHGQKIgFsWHqxVpKSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX/A2iFprrDFJv
 /BbaUa3YqxeJaT4vAy0fVR6mYjvz+tEzfMUzQBB+JIUxYO1Xh54MgUMHJ5u7LGpb3HchposF/Fj
 hDn1iXJ5ROzWLlhNCJmcCXBacb88Q895HsnKebLAByyvAr1xE8udWitkGJCq23c8TXh18FPvx0K
 P5TqLHdk6SGiV8Rf9173bTL3tNoIpnBKvCzZSjVQSoaym51w4B1O6nWU2uDw83epZhFTK3MWl04
 A0X0K6RkMk2BijVY06ZjghT9bs3BkACQoRRo9q7MkOhBbL4iNPeyxt+rSuXfquifUoX8zb2jc8X
 gtohZDHxZZJwdlLqF/8sT8mYRr12hKklYQSVaX1RhCE2uVRU0kqBVjYNJw4tpO+pcyIu25huRnK
 Q3HmuWm8sQlOdDyjMsOandL6ULAK+qEXVZu48OcfA6nvV9ssXuuqAyXdYLfr8n47yD3yfHTn+EQ
 F3clKOBzD/vxLqb60Tg==
X-Proofpoint-GUID: 8dHniZfSgydmLqVHGQKIgFsWHqxVpKSc
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a70725f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=eeZ6Vdm3skWBw8YHU2i37Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=PHT_-lC4Pkg6agqfKfUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX056RLlaUrlLP
 jHTDUOuKE1560ySN5e+2XsjxyONnAkEJzHwNKhXgGsELeGGwHFUh7kGG9KM9z03wLqHi2T4iJP5
 VutmP80GBLOEA+fP0v0lLg5z/InZ+Kc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_035010_086221_DABCBDCB 
X-CRM114-Status: GOOD (  39.73  )
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

Hi Andre,

On 7/31/2026 10:33 PM, Andre Przywara wrote:
> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> 
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 113 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_fb.c       |  41 ++++++++++++
>   drivers/resctrl/mpam_internal.h |   2 +
>   3 files changed, 154 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index b238feb559d4..40b247a89f8e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -19,14 +19,19 @@
>   #include <linux/irqdesc.h>
>   #include <linux/list.h>
>   #include <linux/lockdep.h>
> +#include <linux/mailbox_client.h>
>   #include <linux/mutex.h>
>   #include <linux/platform_device.h>
>   #include <linux/printk.h>
> +#include <linux/property.h>
>   #include <linux/srcu.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> +#include <acpi/pcc.h>
> +#include <acpi/acpi_io.h>
> +
>   #include "mpam_internal.h"
>   
>   /* Values for the T241 errata workaround */
> @@ -49,6 +54,88 @@ static LIST_HEAD(mpam_all_msc);
>   
>   struct srcu_struct mpam_srcu;
>   
> +/* PCC channels might be serving multiple MSCs, so keep a refcounted list. */
> +static DEFINE_MUTEX(pcc_chan_list_lock);
> +static LIST_HEAD(pcc_chan_list);
> +
> +static void mpam_pcc_chan_release(struct kref *ref)
> +{
> +	struct mpam_pcc_chan *cur = container_of(ref, struct mpam_pcc_chan,
> +						 refcount);
> +
> +	pcc_mbox_free_channel(cur->pcc_chan);
> +	list_del(&cur->pcc_chans);
> +	mutex_destroy(&cur->pcc_chan_lock);
> +	kfree(cur);
> +}
> +
> +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
> +					       int subspace_id)
> +{
> +	struct mpam_pcc_chan *cur;
> +
> +	guard(mutex)(&pcc_chan_list_lock);
> +
> +	list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
> +		if (cur->subspace_id == subspace_id) {
> +			kref_get(&cur->refcount);
> +
> +			return cur;
> +		}
> +	}
> +
> +	cur = kzalloc_obj(*cur);
> +	if (!cur)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cur->pcc_cl.dev = dev;

While testing v7 with multiple PCC MSCs sharing a single PCC channel, I
noticed that pcc_cl.dev is set once at channel creation time (from the
first MSC's device) and never updated when subsequent MSCs reuse the
channel.In mpam_pcc_chan_get(), the first call sets:
  cur->pcc_cl.dev = dev;

Subsequent calls return the existing channel without updating 
pcc_cl.dev. Here dev_err() calls through the channel report errors 
against the first MSC's device, even when a different MSC triggered them.

I reproduced this with four PCC MSCs sharing subspace 0. After unbinding
the first MSC (kref 4→3), triggering dev_err() via a test hook showed 
the device prefix change from "mpam_msc mpam_msc.1:" to "platform 
mpam_msc.1:"

A simple fix maybe to use the MSC's own device for error messages in
mpam_fb_send_request() instead of pcc_chan->pcc_cl.dev

> +	cur->pcc_cl.tx_block = true;
> +
> +	cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
> +	if (IS_ERR(cur->pcc_chan)) {
> +		long err = PTR_ERR(cur->pcc_chan);
> +
> +		kfree(cur);
> +		return ERR_PTR(err);
> +	}
> +
> +	/*
> +	 * Timeout based on the "nominal latency" in us, from the
> +	 * PCC ACPI table. tx_tout is in ms.
> +	 * Add some margin here to be on the safe side.
> +	 */
> +	cur->pcc_cl.tx_tout = DIV_ROUND_UP(cur->pcc_chan->latency * 5, 1000);
> +
> +	mutex_init(&cur->pcc_chan_lock);
> +
> +	cur->subspace_id = subspace_id;
> +	kref_init(&cur->refcount);
> +
> +	list_add_tail(&cur->pcc_chans, &pcc_chan_list);
> +
> +	return cur;
> +}
> +
> +static int mpam_pcc_chan_put(struct mpam_pcc_chan *pcc_chan)
> +{
> +	struct mpam_pcc_chan *cur, *tmp;
> +
> +	if (!pcc_chan)
> +		return 0;
> +
> +	guard(mutex)(&pcc_chan_list_lock);
> +
> +	list_for_each_entry_safe(cur, tmp, &pcc_chan_list, pcc_chans) {
> +		if (cur == pcc_chan) {
> +			kref_put(&cur->refcount, mpam_pcc_chan_release);
> +
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
>   /*
>    * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
>    * can be enabled.
> @@ -2274,6 +2361,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   {
>   	struct mpam_msc *msc = platform_get_drvdata(pdev);
>   
> +	mpam_pcc_chan_put(msc->pcc_chan);
> +
>   	mutex_lock(&mpam_list_lock);
>   	mpam_msc_destroy(msc);
>   	mutex_unlock(&mpam_list_lock);
> @@ -2284,7 +2373,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   {
>   	int err;
> -	u32 tmp;
> +	u32 pcc_subspace_id;
>   	struct mpam_msc *msc;
>   	struct resource *msc_res;
>   	struct device *dev = &pdev->dev;
> @@ -2328,7 +2417,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   	if (err)
>   		return ERR_PTR(err);
>   
> -	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
> +	if (device_property_read_u32(dev, "pcc-channel", &pcc_subspace_id))
>   		msc->iface = MPAM_IFACE_MMIO;
>   	else
>   		msc->iface = MPAM_IFACE_PCC;
> @@ -2349,6 +2438,26 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   		}
>   		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>   		msc->mapped_hwpage = io;
> +	} else if (msc->iface == MPAM_IFACE_PCC) {
> +		msc->pcc_chan = mpam_pcc_chan_get(dev, pcc_subspace_id);
> +		if (IS_ERR(msc->pcc_chan)) {
> +			pr_err("Failed to request MSC PCC channel\n");
> +			return ERR_CAST(msc->pcc_chan);
> +		}
> +
> +		err = mpam_fb_check_shared_buffer_size(msc);
> +		if (err) {
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +
> +			return ERR_PTR(err);
> +		}
> +
> +		err = mpam_fb_check_protocol_version(msc);
> +		if (err) {
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +
> +			return ERR_PTR(err);
> +		}
>   	} else {
>   		return ERR_PTR(-EINVAL);
>   	}
> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> index 61a91c6cec0a..7a7fb6d067ba 100644
> --- a/drivers/resctrl/mpam_fb.c
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -37,6 +37,11 @@
>   #define MPAM_MSC_TOKEN_MASK		GENMASK(27, 18)
>   
>   #define MPAM_FB_PROT_HEADER_LEN		sizeof(u32)
> +/* The longest message is MPAM_MSC_WRITE, with 4 parameters. */
> +#define MPAM_FB_MAX_MSG_SIZE		(4 * sizeof(u32))
> +
> +#define MPAM_FB_VERSION_MAJOR_MASK	GENMASK(31, 16)
> +#define MPAM_FB_VERSION_MINOR_MASK	GENMASK(15, 0)
>   
>   static atomic_t mpam_fb_token = ATOMIC_INIT(0);
>   
> @@ -207,3 +212,39 @@ int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
>   	return mpam_fb_send_request(msc->pcc_chan, msc->id, reg, &value,
>   				    MPAM_MSC_WRITE_CMD);
>   }
> +
> +/* We only support MPAM-Fb protocol version 1.x */
> +int mpam_fb_check_protocol_version(struct mpam_msc *msc)
> +{
> +	u32 version;
> +	int ret;
> +
> +	ret = mpam_fb_send_request(msc->pcc_chan, 0,
> +				   0, &version, MPAM_PROTOCOL_VERSION_CMD);
> +	if (ret)
> +		return ret;
> +
> +	if (FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, version) != 1) {
> +		pr_err("Incompatible MPAM-Fb protocol version %ld.%ld\n",
> +		       FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, version),
> +		       FIELD_GET(MPAM_FB_VERSION_MINOR_MASK, version));
> +
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc)
> +{
> +	int min_buffer_size = MPAM_FB_MAX_MSG_SIZE +
> +			      sizeof(struct acpi_pcct_ext_pcc_shared_memory);
> +
> +	if (msc->pcc_chan->pcc_chan->shmem_size < min_buffer_size) {
> +		pr_err("MPAM-Fb PCC channel size too small.\n");
> +
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index f13a79a84c58..8859189088f3 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -528,6 +528,8 @@ static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
>   /* MPAM-Fb Firmware-backed protocol wrappers */
>   int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result);
>   int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value);
> +int mpam_fb_check_protocol_version(struct mpam_msc *msc);
> +int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
>   
>   /*
>    * MPAM MSCs have the following register layout. See:

--
Best Regards,
Srivathsa


