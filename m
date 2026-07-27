Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A17C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgYsOGPbuwZ7cF9zpsVC93NbLVuyrbBqaRuEzQrNaDQ=; b=fGJKOK8GKfEDUFpXwu5dAvLCfK
	wdLtSpU6cIaCVAgeqzxAROxk+4C23jvLXpJUll/SRmoHlMlsaErrSBcU5jLhkWf3VIjpRR9chtZ+F
	h6PcIxyrEkjYbm2nzNpgjsu/L3lZhn8d3Le4FgOPw2jjKdw6Ks73Yye4LOGopcvi57q/CoDREKqSd
	9bZQSF5jI7E7gk21Q0XKIaUC0CeD6wHWCMLZ4rKrfqjV/tIbYmoyeb/Vk8EhSnEFlzbYLEfGTfe56
	eqkZ2zu0oXxalHpAOqKZ0IkN+WE+X/IE6hmtH2yOKcXasL8Q4nKArt+YjHvCA4fYC8O0Qconfsssx
	u1hU0EZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOAt-00000003JsX-11HY;
	Mon, 27 Jul 2026 16:27:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOAq-00000003JrV-0k1N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:27:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZKr4115071
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgYsOGPbuwZ7cF9zpsVC93NbLVuyrbBqaRuEzQrNaDQ=; b=U3EXNueFvvEMmiZ9
	Rxim5FgDacmvNTUt7rQl9N+fAJVOnRi67/gxI4ZkDkPXMBProC5V+QgJA1VplnvP
	QqiKgHqhorsd8L2BFiLqJe+vIZmG+svWKe42sOBN1Ik0zETKlbqSoGAbXY7xrCS4
	ksoRkq+tCatRLvOCogrJyHunN4FI2geavPu6aEGlaB1iGzyUHLqUQlHo+dJrqBeZ
	u/ogkh88/l65KQXDiKwGQwIT2WyhwMjg1iySBMUogcbrE5KfjUNvlG3T0DvJFhtO
	DcYMdBMx6bJFZ1IOmzVVyh4SFPlNomVtbmuJ+/ErFetDNN8AQ7Hr4YKReaNAfTbi
	d3FrOg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrsrbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:27:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3378476a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785169645; x=1785774445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgYsOGPbuwZ7cF9zpsVC93NbLVuyrbBqaRuEzQrNaDQ=;
        b=G5tmVD1c947c6CNN1PXrtk6UR5figQAXegaRxg+i3b3W/Hf8DRYJcyoHMNbdJhTf2S
         RQFkmWYH/pasCS4EvrGSpukc70F6roJIrOQCSKrTUhgNXHFIe/h6mkkFcL+5OhwZlcYE
         xIxrKcnxN8rgsDvL+hVMcUnLj37o0Ozu64JQFox6Cm0+OCqvzF6NnLl2sHRyBAOJ2J6C
         uQXJWEdYsSHd2lfeR5U2CkHJHqGrWzN7RsvSRZLznHWDVxzGdcPdtTh2Xme7DC1Cc1hM
         laVzSZADKcqqstDQhSMeYwd8XuKfBTnoRI0V7/P9nv+ggkyXZtLhUjcAxknb6xEwI3hw
         +sIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169645; x=1785774445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgYsOGPbuwZ7cF9zpsVC93NbLVuyrbBqaRuEzQrNaDQ=;
        b=rGVPQOe9MwKW63vpGRIsGjJBOlVaLQNVOziCpVMFxXtwEJsAHpxKCJmR5e/a/9pY70
         9ajjoMl3hqkRdTZSmSOoTXIMCB8NbEjhx3imv6MhxAjp8LNqlYwGfEmwjXsOxjnLxKoL
         f+U79qbATTtCf2aTp1I0yyfoJrIoNCXZgDVuOj5Q7HPanXPx5NHiSB84oFNBGmI6QIfW
         FrBFFL1zNj29M4RUgRZGyzBk7MSDKCqQLIeiBrl9wYJkreXi0+nWbiAU4Him3CFKVb2D
         0AUpg0afDjJcYdcr8Xrh7lTiHc/K8hbx1iz73UqqoO+TJGzHbCw4U1fq61068MgsrBrs
         W+QA==
X-Forwarded-Encrypted: i=1; AHgh+Rq60bi94ceC9icfEhNt6qwTX59zhQB3U/y2VlfKi7QMI/iYkTqgitjW6QqFC2gIPkKgWwP/gRnOCRBlekXxZO1u@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ1a3rT8N5wdiQaf7oldwMwxHaRaxI0lMEBB64G+bBPXy0138b
	UUqJDYYIbdLaTXV7cHeo5zTK5rKe24OkS8C/fPfoZ63aU7YD5HYawPd9XClmrOL3IFXM+hMQBno
	jwmDyKvix/QPDF3UIe1Gq5W2/yFwB3tf5300N2pqkmHuM6ETWJ3uFEAAmnBOeoW1Nx/wetOHLHO
	cY6Q==
X-Gm-Gg: AR+sD13w8fc2qjeNatLiC63TdngFnu8Dc/u+Ab1d6VitRd5nPDEVHWQuqpABp9yhv7C
	HH3cG4GDYVhL/xCBZRxHkVuY5mQVbYEanrtzVw3W3n09bz6FBFREdUmfD+UeRzxLAaHFrUozEAT
	UCzI+oG+q18Vd+9n3DW06lMpHIVS6FAdg3/qep5/nTgGR84cHBBJfaQ+9hAMOL2iZo6Ircfxk7Q
	gDiBoZD5cY7m4RfRYYoQjENYjSF5cmYZWNxBi5bxcb6wlva0GZi35MIjNwxqpiWiPsnbMRWtbEW
	/DVkTXR6y3Ugjqk3FS6FeF2oe2ashRRJ6hNvVP7EbT9sCh4rAM4HTMkKjWDeGWLb+tGBVJGqsFa
	ejjZv500OqZpYfLwkGETPq9TXr3yIV87t
X-Received: by 2002:a05:6a20:d12f:b0:3c3:83e6:c705 with SMTP id adf61e73a8af0-3c67df08725mr9450543637.35.1785169644710;
        Mon, 27 Jul 2026 09:27:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:d12f:b0:3c3:83e6:c705 with SMTP id adf61e73a8af0-3c67df08725mr9450504637.35.1785169644259;
        Mon, 27 Jul 2026 09:27:24 -0700 (PDT)
Received: from [192.168.1.106] ([106.51.195.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm30947278eec.30.2026.07.27.09.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:27:23 -0700 (PDT)
Message-ID: <4faf0089-4615-4fb1-bc07-e52b4d43f073@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:57:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
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
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-11-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260723155454.1760823-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfX7q6f1GApBM7C
 OlHDb3faiQLHf9rQfn8jkC9CPPiFC/DJI7xnQ5P9hEGMOcb/hs36dZYIZb7nqDeFcGvedgIdkWi
 +2hUJhlRXIDhzjUPIXmB55RVLVvm/cY=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a6786ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=P1XCd3+ZtGMRWLP53chLSQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=roaC5YTsdUms_DT7MN4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IAzenLfmwTFDdQaqvKR3wFd2ey8XgrLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfX+ml6RfuzZtJf
 VC84hjdMmd1LbIvErvOj3nPIlhuqIFP7kmdCD0EzFFmsTy6D/eJ5dCwEIyHF2XTC2cBKu3L0vxj
 iOdgsIqYJAfThr2mBna2sHqJIYYpb4d9KXQrVD8s0HStAUa7OrIWpVmA7ZhPH8KqF2Jq8MuKYpZ
 61IU/C42vYQXVR1XqoEw7jD6RrQOM4yd4p0BtD0IQEHMT2shMOO1JcYp28L96RXSueXyXWInoRr
 rMPlTq38a8bUPwop20GKOWzjo8skml5OL3esNXuANsDk4XRzsJfGM3Wm/dDNND2FmAaDloMAiiN
 9pTX+uCfk38SyLsuk3UEtA9hcXF+/f0q8n2nWnwJt7jq1vYs5oiRZyhTpDzh/uEhG2JL5Ki/9xg
 nDyzvkrjjLZu6rRBkVvwaoAt3FkfV36y95cpw9Zv3aayDAjEZCKyEyOHsBtDpIfjY5HAsVQbjqY
 Qi+0WPgs5oC5mj3YP0g==
X-Proofpoint-ORIG-GUID: IAzenLfmwTFDdQaqvKR3wFd2ey8XgrLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092728_331778_F3E48A4B 
X-CRM114-Status: GOOD (  42.28  )
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



On 7/23/2026 9:24 PM, Andre Przywara wrote:
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
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/acpi/arm64/mpam.c      |   6 +-
>   drivers/resctrl/mpam_devices.c | 127 ++++++++++++++++++++++++++++++++-
>   2 files changed, 129 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> index 84963a20c3e7..ca9b8754ae5f 100644
> --- a/drivers/acpi/arm64/mpam.c
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -220,8 +220,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>   	struct platform_device *pdev __free(platform_device_put) =
>   		platform_device_alloc("mpam_msc", tbl_msc->identifier);
>   	int next_res = 0, next_prop = 0, err;
> -	/* pcc, nrdy, affinity and a sentinel */
> -	struct property_entry props[4] = { 0 };
> +	/* pcc, msc-id, nrdy, affinity and a sentinel */
> +	struct property_entry props[5] = { 0 };
>   	/* mmio, 2xirq, no sentinel. */
>   	struct resource res[3] = { 0 };
>   	struct acpi_device *companion;
> @@ -256,6 +256,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>   	} else if (iface == MPAM_IFACE_PCC) {
>   		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>   							tbl_msc->base_address);
> +		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
> +							tbl_msc->identifier);
>   	}
>   
>   	acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index fea3161ffbe9..fc4b5f87fbe9 100644
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
> @@ -49,6 +54,86 @@ static LIST_HEAD(mpam_all_msc);
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
> +	kfree(cur);
> +}
> +
> +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
> +					       int subspace_id)
> +{
> +	struct mpam_pcc_chan *cur;
> +	int ret;
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
> +	/* Timeout based on the "nominal latency" from the PCC ACPI table. */
> +	cur->pcc_cl.tx_tout = cur->pcc_chan->latency * 5;
> +
> +	ret = devm_mutex_init(dev, &cur->pcc_chan_lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +

Here, devm_mutex_init() ties the lifetime of pcc_chan_lock to dev, which 
is &pdev->dev of the first MSC to call mpam_pcc_chan_get(). But
mpam_pcc_chan is shared across multiple MSCs via kref, so it can
outlive that first device.

If a second MSC has incremented the refcount and is still active when
the first MSC's device is removed, the devm cleanup on the first device
would call mutex_destroy() on pcc_chan_lock while the second MSC may
still be inside:

     guard(mutex)(&pcc_chan->pcc_chan_lock);

I am not 100% sure this is reachable in practice — it may depend on
the order in which platform devices are unbound, and whether that can
happen with MSCs sharing a channel. I also note that devm_mutex_init()
is a no-op on non-debug kernels, so this would only be observable with
CONFIG_DEBUG_MUTEXES=y. But it felt worth raising in case
it is a real path.

If my understanding is correct, would it make sense to use a plain
mutex_init() here instead, and move mutex_destroy() into
mpam_pcc_chan_release() where the kref guarantees no concurrent users
remain?

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
> @@ -2201,6 +2286,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   {
>   	struct mpam_msc *msc = platform_get_drvdata(pdev);
>   
> +	mpam_pcc_chan_put(msc->pcc_chan);
> +
>   	mutex_lock(&mpam_list_lock);
>   	mpam_msc_destroy(msc);
>   	mutex_unlock(&mpam_list_lock);
> @@ -2211,7 +2298,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>   static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   {
>   	int err;
> -	u32 tmp;
> +	u32 pcc_subspace_id;
>   	struct mpam_msc *msc;
>   	struct resource *msc_res;
>   	struct device *dev = &pdev->dev;
> @@ -2259,7 +2346,8 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   	if (err)
>   		return ERR_PTR(err);
>   
> -	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
> +	if (device_property_read_u32(&pdev->dev, "pcc-channel",
> +				     &pcc_subspace_id))
>   		msc->iface = MPAM_IFACE_MMIO;
>   	else
>   		msc->iface = MPAM_IFACE_PCC;
> @@ -2275,6 +2363,41 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   		}
>   		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>   		msc->mapped_hwpage = io;
> +	} else if (msc->iface == MPAM_IFACE_PCC) {
> +		u32 msc_id;
> +		int ret;
> +
> +		if (device_property_read_u32(&pdev->dev, "msc-id", &msc_id)) {
> +			pr_err("missing MPAM-Fb MSC identifier\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		msc->mpam_fb_msc_id = msc_id;
> +
> +		msc->pcc_chan = mpam_pcc_chan_get(&pdev->dev, pcc_subspace_id);
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
> +		if ((ret >> 16) != 1) {
> +			pr_err("Incompatible MPAM-Fb protocol version %d.%d\n",
> +			       ret >> 16, ret & 0xffff);
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +			return ERR_PTR(-EINVAL);
> +		}
>   	} else {
>   		return ERR_PTR(-EINVAL);
>   	}

Best Regards,
Srivathsa

