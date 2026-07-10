Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E657EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xSK4+lHSvlK826QqeBR8DeMUlV8JNVRsDYih4vnYtI=; b=tPLiJBniS4zSftWED3irQthk/v
	RLBsKHd5geLRU99wolGtzXn2vc2LSc+XwgoHGhThjTfBVkBHeKIC8ytWDB/ubizv6BYDQtj9csagp
	1zJoKxCrtL7NP4mjyNQUkNDqBUZVptweRtpXHg9EXQ+y/fww1JM+j6WT6KE+kiNQifnr+RPPEipBj
	aY25jGW+ZCDpZkIOhvnGskV3ySGKV3h0uFpewAEBcrIEyBoFAs6EB01stTIZaMq7nGKbKFxGkR+NR
	nmAhebbXUyF7bwYKfbBlesKgB/pDxGGCGCNn4lTSUQ9jJRtZAFNlonVIzh9rpNmKpPkIHe1cKylJy
	d4u05dPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHMv-00000005dej-3vCd;
	Fri, 10 Jul 2026 19:58:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHMs-00000005deG-3rjH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:58:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3uBY1325661
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xSK4+lHSvlK826QqeBR8DeMUlV8JNVRsDYih4vnYtI=; b=nzQCYrK8LP9hgzSZ
	XKuUB3ncjjQnXD4N38nJrEftUMXMF0IQ+XdM46Xz2gQpm4dp28u8FLRZURK2DhkA
	ozbqSKlJ8TkZbg2Wbr6iDqHMI+W00NjplfUoeYl8tH/ibRuomGfqMBlLgNBxNxQN
	w3Nrerwis03C6FAXBjwWYhrNRs8tGRW/VXAlNOYZeJ4BIjQO50+NAOMJ16qJcKFO
	+HSsq9LAzKbNfPkSY2zRwBWq68N0M/g98TntGBmrzC/1CEASt+Q9KYuBu4FnZEGo
	AaMhNdhtpePoXGNrhzRre+V+qSMPp2SFNv5N9W4l+GqOhSGlfrC8/HlXPiuTSWXr
	QnctfA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb339s06d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:58:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1466826a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783713517; x=1784318317; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5xSK4+lHSvlK826QqeBR8DeMUlV8JNVRsDYih4vnYtI=;
        b=jLWblDmJunS7ev/qLxiAFzgnuckM7VTwelK4BIk/j94cYEPUIYjqrjzXTbS+w2PjGV
         hcOKiorEk3OfNxEVVu6x2lXobmYkK2YsoSPkAdpaxZeCG+7uXF1fAAExrBnqYkCfof7P
         drJx0dpj+BmjvZORiRMWK12eHZmpBGcDBrdczVQdu4d4F1BdyodJ1FjE7L7xT6G2OEKg
         9AULF5asO6aknSLCZndME8G0npq0sAzn8lLMdYxuse5zq2QIEirTeq9+qkNcIej0iYmH
         OxAmZRr9AuNntvrqWwsAZRkgNd4e11+eGBASNsrCF+lHKn5Ji22WhDF1kwXv8d34E8K5
         6GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713517; x=1784318317;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xSK4+lHSvlK826QqeBR8DeMUlV8JNVRsDYih4vnYtI=;
        b=c/lkXfsoFXb2KiDyxVPaMESJTOJVdPbDmQ2VefX9ZYVH/t9tb8wfz09LRfDw/E2pes
         pRQSfpJzuBR9PVCIc8Dkrg836/Uf5I0vj7gtrP82JgV9AYMYXBQYjsKpBUjlZnCZ6qLk
         +cGA4UvFhPnZuDDVDYsxC9vmjdubaA9w5geLOu72Q5DWkNZnkJVQidW//Raw2Jq/LzPA
         299b6GYR4M+mhOGE7m3lZW0S4mxlGesVesrRVylgVb2VuE2PMjxD1d7IKfqq/zG1Ulxl
         ikMYjo8XUHCPlVjcwLBf7ws4T9paOtwXE6gFtPd49PnuaUbfKVkhry5T9Sft1o+7BiFR
         7aJA==
X-Forwarded-Encrypted: i=1; AHgh+RrDsgs62b4ezoN0PSsNF1Hld24368jb5xk5YdOF9djC/TWOY/HO+up9eeww9wA0FCPczXK6ekl0Xx+VKRK9F95T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7BlgMwNusbX7M/bZDFZ75fhS+AOWxK/BnQCm2ACsMWwFWbcjb
	nHe4yZKLtQR2i56nG7MdiunftbtC3R/B+mpMOCHbyHBmpT5QoLg+Xlw+aZFydI9YV6AOq+QLe8p
	7Ii250VI5GkZLXVEktC+Wy+I2JDJmkNsH7LuiXcRkUZ9Y+VX7CVAey5ap0oCIEbz7mCzZ3JP6ur
	9v5A==
X-Gm-Gg: AfdE7cluXGkpWKHa/aCRwh/MoiFKo/2yMZm3A7uxnXCpzmYrZ3SV4P4m6bnCtRBlBZb
	WeX0lwpGvm72LBWN8Gw3n9PKLnd0c6YXXwxK6rKAy3b/JlhdewiK0Ecjr5tCm2YGBSNOE3Elov3
	GQqOZOkbMzkRcWS7jRY9IcfnlSsRQsfEVFyok8dGwsLbbFQGsnPL9HVHTB4dCK8msirHrN9gi/P
	UdOeB7B6JvSsj2Z1MxxVvBdMd8yF1Eq7vlQtIBBwMF9MgIH/He/hOjQc1zAykYP/jRew/Ykpaqe
	r6Mi2rmCjZ0Te33uKJw9pD8IMxGTON4ukFC6QtA6bEGoOrkdKN9mMLe7AyxdHSIT1tlNRKddLMA
	15TU8w+exd6Gd1hhaIeZ+UmrO7DUduGN7kfFC
X-Received: by 2002:a05:6a20:4328:b0:3c1:a0c:ab85 with SMTP id adf61e73a8af0-3c111095f37mr361760637.76.1783713517184;
        Fri, 10 Jul 2026 12:58:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:4328:b0:3c1:a0c:ab85 with SMTP id adf61e73a8af0-3c111095f37mr361729637.76.1783713516726;
        Fri, 10 Jul 2026 12:58:36 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b3206aaasm8187103eec.13.2026.07.10.12.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:58:36 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:58:32 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/16] arm_mpam: add MPAM-Fb MSC firmware access
 support
Message-ID: <20260710125832.00003be9@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-15-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-15-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX30SGMww8vNdj
 LnrBwp42X+z6oiSn2k+qkDgPVSNw5XFrlfxSRrEqjYtCOvYuCFrSPG1vqtBWsBaafxzdVWmKI4o
 VJdXINcRIUqW2E+J5lLKiZnf2KKXZMM=
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a514eed cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=BKSArZ9tf1QpHAMEYIoA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: hl4fUd1EbZ5q7KbUMe_rVq5p6zy9H6aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIwMCBTYWx0ZWRfX0n3u9cpHtmqn
 AAwaUJqReaDd6BNg4hoD15QwelW91YDvEwai22PufSrC1EiJ6h5Ph73HVCh4H3shb+k+JkeQTns
 vMAgdPkYxbsBHoazvEHYSSCSkj4gnoWJHgJi6MHdFkkTsBAzJQ5hlnBelX/tWckpuLLx9PZKf2p
 vJWPttNpjZk5SwoL6ZNemTugRYWclUcqJy92kTzSYYl02p87ArYDx0sx9KYg3CL1ohZoJCvSe/V
 hooTLuJH0xDS0nMz9psHldRzkK3wqj1wQKmX0CtYk0XxPWMLNoiXzzsgu3z6O19dZ3IdVDFv49e
 RGd7BhAiKNJ7rk7Vz77EgJMBdFCu1rX8EAzrpzFSbab57EEjl4wW57WMiu5BZKsG9LIl6dD0vSA
 EHSqITHkIiEowUOovgnju72TpH47NUlqi0/dHskGvYVRmJeDdDXG+pEE41UOQ+8n7/dM4EoS0j1
 EmmM0j9CKlw9LryZWvg==
X-Proofpoint-GUID: hl4fUd1EbZ5q7KbUMe_rVq5p6zy9H6aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_125838_980405_5B7CDD3B 
X-CRM114-Status: GOOD (  36.20  )
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

On Fri, 10 Jul 2026 16:45:18 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> alternative way of accessing the "Memory System Components" (MSC) in an
> MPAM enabled system.

Blank line for consistency on paragraph breaks.

> Normally the MSCs are MMIO mapped, but in some implementations this

Hmm. Not sure what normal is in this case ;)  Maybe make it something like

In systems supported before this patch the MSCs are MMIO mapped,

> might not be possible (MSC located outside of the local socket, MSC
> mapped secure-only) or desirable (direct MMIO access too slow or needs
> to be mediated through a control processor). MPAM-fb standardises a
> protocol to abstract MSC accesses, building on the SCMI protocol.
> 
> Add functions that do an MSC read or write access by redirecting the
> request through a firmware interface. For now this done via an ACPI
> PCC shared memory and mailbox combination.
> 
> Since the protocol used is only a small subset of the full SCMI spec,
> and the SCMI protocol has no full ACPI support anyway, open-code the
> SCMI message generation and handshake, for just the fields we need.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Hi Andre,

Various things inline.

Thanks,

Jonathan

...

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index ca73029654b6..4d3e642486d4 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

> @@ -1133,7 +1139,8 @@ static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
>  
>  	mpam_mon_sel_lock_held(msc);
>  
> -	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> +	if (msc->iface == MPAM_IFACE_MMIO)
> +		WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>  	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>  
>  	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> @@ -1481,9 +1488,15 @@ static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
>  					 srcu_read_lock_held(&mpam_srcu)) {
>  			arg->ris = ris;
>  
> -			err = smp_call_function_any(&msc->accessibility,
> -						    __ris_msmon_read, arg,
> -						    true);
> +			if (msc->iface == MPAM_IFACE_MMIO) {
> +				err = smp_call_function_any(&msc->accessibility,
> +							    __ris_msmon_read,
> +							    arg, true);
> +			} else {
> +				__ris_msmon_read(arg);
> +				err = 0;
> +			}
> +
>  			if (!err && arg->err)
>  				err = arg->err;
FWIW
The arg->err check here seems pointless

			if (!err)
				err = arg->err;

is at most going to set a 0 to 0.

Maybe lift this into the if else as it should end up simpler in the else.

			if (msc->iface == MPAM_IFACE_MMIO) {
				err = smp_call_function_any(&msc->accessibility,
							    __ris_msmon_read,
							    arg, true);
				if (!err)
					err = arg->err;
			} else {
				__ris_msmon_read(arg);
				err = arg->err;
			}

			if (err)
				any_err = err;

 
...

> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> new file mode 100644
> index 000000000000..7d7409910f28
> --- /dev/null
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2024 Arm Ltd.

Really?  sat on this for 2 years? ;) 
Given it's changing during this posting I'd at least include this
year in the range.

> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gfp.h>
> +#include <linux/list.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>

Scrub these for things used in this patch.
Maybe others will be needed after later patches.
Not seeing any of_ stuff in here for instance.

> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/processor.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>

> +struct mpam_fb_access_payload {
> +	u32 msc_id;
> +	u32 flags;
> +	u32 reg_offset;
> +	u32 value;
> +} __packed;
There are only a few of these in spec, and whilst they share the same layout
for fields they define (not all same length),

I'd define separate structures for each of the message types.
Added bonus being that...

> +
> +#define PCC_CHAN_FLAGS_IRQ	BIT(0)
> +#define MPAM_VERSION_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS)
> +#define MPAM_READ_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS + 3 * sizeof(u32))

These would then become  PCC_TYPE3_MSG_PAYLOAD_OFF + sizeof(mpam_fb_read_request_payload)
or something self describing along those lines.

> +#define MPAM_WRITE_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS + 4 * sizeof(u32))
> +
> +static atomic_t mpam_fb_token = ATOMIC_INIT(0);
> +
> +static int mpam_fb_build_version_message(unsigned int token,
> +					 void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem = msg_buf;
> +
> +	writel_relaxed(0, &pcc_shmem->flags);
> +	writel_relaxed(MPAM_VERSION_MSG_SIZE, &pcc_shmem->length);
> +	writel_relaxed(MPAM_PROTOCOL_VERSION |
> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
> +		       &pcc_shmem->command);
> +
> +	return MPAM_VERSION_MSG_SIZE;
> +}
> +
> +static int mpam_fb_build_read_message(int msc_id, int reg, unsigned int token,
> +				      void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem = msg_buf;
> +	struct mpam_fb_access_payload *payload = msg_buf + sizeof(*pcc_shmem);
> +
> +	writel_relaxed(0, &pcc_shmem->flags);
> +	writel_relaxed(MPAM_READ_MSG_SIZE, &pcc_shmem->length);
> +	writel_relaxed(MPAM_MSC_READ_CMD |
> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
> +		       &pcc_shmem->command);
> +
> +	writel_relaxed(msc_id, &payload->msc_id);
> +	writel_relaxed(0, &payload->flags);
> +	writel_relaxed(reg, &payload->reg_offset);
> +
> +	return MPAM_READ_MSG_SIZE;
> +}

> +
> +static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 msc_id,
> +				u16 reg, u32 *result, int mpam_fb_command)
> +{
> +	unsigned int token = atomic_inc_return(&mpam_fb_token);
> +	struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem;
> +	struct pcc_mbox_chan *chan;
> +	void __iomem *payload_ofs;
> +	u32 status;
> +	int ret;
> +
> +	if (!pcc_chan)

Is this defense needed?  Feels like the sort of thing that is so fatal
if you get to call send_request() that you should really have failed a lot
earlier.  If it's protecting against a tear down race or similar add a comment

> +		return -ENODEV;


