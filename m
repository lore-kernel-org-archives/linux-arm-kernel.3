Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B734EC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J98yx8lwTcA7+HAeL+xCCMseBkr+QOZ0wOi+JvvluAk=; b=ChIlaCTCJCim+cUGwE48l/RLDh
	hQ9PUoDWJOriNrtP5s0YOVoag3IwqqLJ/uDNXiQDFXPoMOb0s8w2A2js3gKfPuxKAn7HXAZlivQ70
	G0pKegnNWZIZ8LiYVE3kB63WMhqtFEwCXt/akhZQP6SbVn8enRMwg+A8zG4A1w+lEPqtiz60wngOb
	TW9YilDSznNVB3TJx5tEC2moZ0kKZabE0Q5/A5krRTZp6YxLoSlA2x8vM08cdeGDsvKO7SUfsApqI
	qakWViALY62ohRIZKrgG1wjNsbLAEIqtIUuMMlGUKgoZ+/wHwVup1XoTNypsjzxUsFptydKXn+G01
	DqNJJ+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNWs-0000000A7hO-0y3y;
	Thu, 30 Jul 2026 09:58:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNWp-0000000A7g3-2QN5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:58:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8xikD490703
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J98yx8lwTcA7+HAeL+xCCMseBkr+QOZ0wOi+JvvluAk=; b=LubM9gnQs9Dtp75P
	yc5F3KLeQtmljKIMZNSBtf+F4ugRXdyUpST21bWv7uhlZYVZ+MSoXcBIH5zsXDev
	EAPJvhqGcSrMYe7j3eJoAmT2m6o9j7JV0nm0RPwf1rENglbbrqRuwBw+3H9VdBt9
	iH7eoow3w1P5X518yYrQJ4sqsa++ya//cXtuUBaDl9Zz2vp8PaSKDn4/VFZuJ6ks
	vW7tBStHmLm9VQovLgxWztCF4mnjfE9Y4nKdvxYwGUj5e4s86z90YxJ5/1Ucjji5
	d4eOv9yJ290aVw7V4QgzSE3JCkD0UNgrhA4uuh+T2oBoJhP4rS3gmUa/+DPWtJAM
	eW/icA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3kf0991-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:58:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1255847a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785405493; x=1786010293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J98yx8lwTcA7+HAeL+xCCMseBkr+QOZ0wOi+JvvluAk=;
        b=kYrRD4jMCWUOJxLcOMOHJ7mA2ZGnHlwQgDnsWW8ElczyLRcQ2XH/Ud7sajFZem+hHS
         Z6qFBTYi/FW/Kod+HWv/B6bGS2ETNvRShYawdNRyWIytxzf9uq4FvsA5XSEJfYIaDckH
         NA/v4qp38EE0G2HoMa2kfZPo5171NZXfdtUUvvyEVSJQh+bZaoj5kEoSdORyR6vWchDO
         YeV6sQ9Z78/IURxWGZdBNq0m6EAYFRQGiwm7GDVqCy2Lv0Q0PC6qfdyGxNwAt7tsHxV5
         mCyY+go2GY20mrXpCy0dyrFuinjXuqjd6J6w37gQdwrg1E1yq94yf8JbqpFx1QufivQo
         0m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405493; x=1786010293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J98yx8lwTcA7+HAeL+xCCMseBkr+QOZ0wOi+JvvluAk=;
        b=HT92u5AmYQT6MmI90wofmYLLx8BqDT2pB8UcEULDYMfW7h5nAzWzZywTxrCFDh8CIH
         eIUEPsDx0wI9VXOGZFlAWcmaFnEFgWRyCL6GEZTWvWzgq0cAg5N3JJBeisRg3vKukrgv
         2a9Jai2UuZIxyQF+0tjMcBVMwMqFnmQFr6GazHZla7ALrnwPckmfXqkRwWAyV9J1Tpb5
         /o4p8dYIe77VsZFv2xD6WNxrgFKvsikGC4NpujbSjjVF0UyMp0TaYMWay+V2muXytdKY
         t7aiP5bPsQYAt8JQO/dtUvSiTw8KGXgs8an+f1rZPal3/lrdBQRNgmuCpZrVhp67ozYI
         /sgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzJ+NOlUh+0GS5eroUBDRI+54ueKuth8QVQh0Vp3Dt/WaCfUZSdamPhDwK92H8TpEMDSS4iBNtq9jPZ6PeMiKm@lists.infradead.org
X-Gm-Message-State: AOJu0YwURXpFGbVZXAJ98+22hY/1Qs2dsrwlmFGW3svSgjF7uGyxEdZd
	1BIn9oUqflJNSub/LGRIEG4bHNSyOwxAdGtZssPLLPoZ+qHm77RZYYq4XdaHP+pAbMXsJb+3Ldj
	aOawrA9TW47wfClA6tBpggGcZcyfM+tn+3SQXu7vDeOCjfhznGHLhXsLIIJ+gHQKSMp6qPV7Ttt
	xAfQ==
X-Gm-Gg: AR+sD11deyc0B93vcvJXQ2Ukwf+LshTNRl2SqbhdrrISuvWVbfVTchWVj93GhDZ1ZAy
	+oGlbgUehRovTNlgXTSxyMnkvACWL/WRPKX5ZFRCZAuScZydEOWHlrCa8W4ghIw9qM1W7jl76MG
	zv8sN+tbobO+hZB9deDmNcGyQ6DpNCfwOS+Cv5YPEH/5RpTpeEeaMsGGeWlejskv2ZiWIbtOnVu
	YBXCAd9qPi2rZ7cFyJX/INXmlqWkbzlPuIABc52vLaeJWeTTTR9qgI/I9ERBK3Uml2IrURdiY28
	mdWY4y7Fcyb+0UzVenNQGTiRL5PWr0dbHlqZEZVnGOI3tU9N6Fdp1t1ExK3VM1dngCIznI2BTMw
	izHtoTrBIXO2tJ4k/qAAhcvWvJdAiICMD
X-Received: by 2002:a05:6a00:10c3:b0:848:40d0:1a57 with SMTP id d2e1a72fcca58-84ebc4154eemr1987029b3a.71.1785405493002;
        Thu, 30 Jul 2026 02:58:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c3:b0:848:40d0:1a57 with SMTP id d2e1a72fcca58-84ebc4154eemr1986996b3a.71.1785405492527;
        Thu, 30 Jul 2026 02:58:12 -0700 (PDT)
Received: from [192.168.1.106] ([106.51.199.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb824f077sm1876183a12.11.2026.07.30.02.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:58:11 -0700 (PDT)
Message-ID: <5722b21f-6406-44e8-9b55-7272cf6014e0@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:28:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
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
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-11-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260729134124.2506269-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3MyBTYWx0ZWRfX92GcmKyA8fMy
 fruMNRo0raem6A5ZvMsz4c7pcegeji2AF1xSame1cOv3jyVfKZ0dQpjs/WUX2tBxtjWpIgvuwPR
 EBo2gCFJnDFDY66rZCzTzEkPrK3iAqb+BJpPiK/oiDl5eKwoB1VLdLPkJicr6enF1NDjMhJutSU
 uTBxUG46qmCnP8HZY8su7/yQGBo87/T/dGwAbysd2Cq//c+LTvO/T9hFrl04GR0tlYJzXBg/osw
 vl8QLUIhpOYERejwml4xCDnja23D0PbpSyWdaf5rKCZWdZl9qd4sjVSs4GOHVlpcvs/FdI2NBy8
 ui/Jvpf10IGY4obsHecNJc48+0dtqh96isLHe0ZujOkhpCawPAN2/11HKpkD4+nqQ+01ofjN0M4
 mxTbAC+aVeSMB40njBdj1uIt+6aDc84T/lZcK5ea2an/CUqHuhqYc653TWImADfSwrfMD5NfpUy
 mjlTVu3ybGu5Er/IrEA==
X-Authority-Analysis: v=2.4 cv=O7UJeh9W c=1 sm=1 tr=0 ts=6a6b2036 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=PO1FP6gy+OYP9C5qPHjZag==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=Q_vOtp3auH0CpEMZiTYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: G0Yvqo75GCLuSdCVlTI0jECtl2MNIsrL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3MyBTYWx0ZWRfXz+FYiRxIHfbz
 XmBNL++hyHVN8NT4IBNyE+ic4uEKeP3LnIrgccS5u2by/VG3CgIaGlgIZq7jdG5tPqSFp168Tcp
 A1egIn1CNTROEppoLXxGqlS0ZVyce+Q=
X-Proofpoint-GUID: G0Yvqo75GCLuSdCVlTI0jECtl2MNIsrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025815_739544_5D84D562 
X-CRM114-Status: GOOD (  36.28  )
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

Hi Andre ,

On 7/29/2026 7:11 PM, Andre Przywara wrote:
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
> ---
>   drivers/resctrl/mpam_devices.c  | 119 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_fb.c       |   4 +-
>   drivers/resctrl/mpam_internal.h |   6 +-
>   3 files changed, 124 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index e535603d2c7d..e360051f4aa7 100644
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
[...]

>   /*
>    * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
>    * can be enabled.
> @@ -2221,6 +2304,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   {
>   	struct mpam_msc *msc = platform_get_drvdata(pdev);
>   
> +	mpam_pcc_chan_put(msc->pcc_chan);
> +
>   	mutex_lock(&mpam_list_lock);
>   	mpam_msc_destroy(msc);
>   	mutex_unlock(&mpam_list_lock);
> @@ -2231,7 +2316,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   {
>   	int err;
> -	u32 tmp;
> +	u32 pcc_subspace_id;
>   	struct mpam_msc *msc;
>   	struct resource *msc_res;
>   	struct device *dev = &pdev->dev;
> @@ -2279,7 +2364,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   	if (err)
>   		return ERR_PTR(err);
>   
> -	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
> +	if (device_property_read_u32(dev, "pcc-channel", &pcc_subspace_id))
>   		msc->iface = MPAM_IFACE_MMIO;
>   	else
>   		msc->iface = MPAM_IFACE_PCC;
> @@ -2295,6 +2380,36 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   		}
>   		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;

Ritwick pointed out in the v4 thread that mapped_hwpage_sz should use
resource_size() rather than open-coding (end - start).  That fix doesn't
appear to have made it into v5.

Also I did verify the resource_size() in my setup by adding prints, it 
did work well.>   		msc->mapped_hwpage = io;
> +	} else if (msc->iface == MPAM_IFACE_PCC) {
> +		int ret;
> +
> +		msc->pcc_chan = mpam_pcc_chan_get(dev, pcc_subspace_id);
> +		if (IS_ERR(msc->pcc_chan)) {
> +			pr_err("Failed to request MSC PCC channel\n");
> +			return ERR_CAST(msc->pcc_chan);
> +		}
> +
> +		if (msc->pcc_chan->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
> +			pr_err("MPAM-Fb PCC channel size too small.\n");
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +		ret = mpam_fb_get_protocol_version(msc);
> +		if (ret < 0) {
> +			pr_err("Cannot query MPAM-Fb protocol version.\n");
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +
> +			/* ret is an MPAM-Fb error code, return a Linux one. */
> +			return ERR_PTR(-EIO);
> +		}
> +		if (FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, ret) != 1) {
> +			pr_err("Incompatible MPAM-Fb protocol version %ld.%ld\n",
> +			       FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, ret),
> +			       FIELD_GET(MPAM_FB_VERSION_MINOR_MASK, ret));
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +
> +			return ERR_PTR(-EINVAL);
> +		}
>   	} else {
>   		return ERR_PTR(-EINVAL);
>   	}
> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> index dbe984241b0d..55c4778a8379 100644
> --- a/drivers/resctrl/mpam_fb.c
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -190,13 +190,13 @@ static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 msc_id,
>   
>   int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result)
>   {
> -	return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
> +	return mpam_fb_send_request(msc->pcc_chan, msc->id,
>   				    reg, result, MPAM_MSC_READ_CMD);
>   }
>   
>   int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
>   {
> -	return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
> +	return mpam_fb_send_request(msc->pcc_chan, msc->id,
>   				    reg, &value, MPAM_MSC_WRITE_CMD);
>   }
>   
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index a2193e7df57c..e926b7feb72a 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -77,7 +77,6 @@ struct mpam_msc {
>   	/* Not modified after mpam_is_enabled() becomes true */
>   	enum mpam_msc_iface	iface;
>   	struct mpam_pcc_chan	*pcc_chan;
> -	int			mpam_fb_msc_id;	/* in its own name space */
>   	u32			nrdy_usec;
>   	cpumask_t		accessibility;
>   	bool			has_extd_esr;
> @@ -532,6 +531,11 @@ int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value);
>   int mpam_fb_get_protocol_version(struct mpam_msc *msc);
>   
>   #define MPAM_FB_PROT_HEADER_LEN		sizeof(u32)
> +/* The longest message is MPAM_MSC_WRITE, with 4 parameters. */
> +#define MPAM_FB_MAX_MSG_SIZE	(MPAM_FB_PROT_HEADER_LEN + 4 * sizeof(u32))
> +
> +#define MPAM_FB_VERSION_MAJOR_MASK	GENMASK(31, 16)
> +#define MPAM_FB_VERSION_MINOR_MASK	GENMASK(15, 0)
>   
>   /*
>    * MPAM MSCs have the following register layout. See:


--
Best Regards,
Srivathsa


