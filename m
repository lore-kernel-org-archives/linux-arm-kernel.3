Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144B5C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyVMRVNWvI1N6tn0c1P1mLOWRR/66FZDJFH7mB5a5fI=; b=PMksMbCq15hV6CFchUWCyEyLon
	RDFrH9hQkP3HCf/uEvQ83DD3hWkukqCNwOkIu56QoIl1cNeg9DabbKgFYw2CUL2bGaqvFsN7IxfOm
	8kB+YlhZV3Dud/Rj/rAGcO4TZPoseb9eNNeefiThTnzSrbPDXZ4V6UKPHJdQL1CfMvV7vkG5ijUU8
	QzlAI6AMuOQU1Ana+vlkD73RejzqSsfiWQwzqM9KuuBtBnyneh4e731P2XO3jvCshyB+9uPR1um7m
	k0ityceylVzBUgjaHwWX7m7KwKlBotKI0DYXXXYY6MP4KEUj8LC46esifQmd9AwlHmDDpSQu+DCQa
	Y/2qotJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8LJ-000000015gE-2Kun;
	Tue, 04 Aug 2026 06:09:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8LF-000000015fm-2kqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785823772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyVMRVNWvI1N6tn0c1P1mLOWRR/66FZDJFH7mB5a5fI=;
	b=FBoeW9cdSuFa/iZQOjVJleqtOxooVPlCvvJxS17JTc7upkQzXA+b7y0+dbSbRCbvLwCp4i
	Gi6Xh4I55qlJ6uUbtH6W7NpHnic7YxEZNLA++/+AVKYj+u5C0XUgpeYvoxAAI1BPlmNs/n
	QmwhuoLs8eNj0sSoM/VP8pukZ9ql4Pw=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-XI5MFQClPHCU5DXs_Pjfiw-1; Tue, 04 Aug 2026 02:09:25 -0400
X-MC-Unique: XI5MFQClPHCU5DXs_Pjfiw-1
X-Mimecast-MFC-AGG-ID: XI5MFQClPHCU5DXs_Pjfiw_1785823765
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so1540193b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 23:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823765; x=1786428565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyVMRVNWvI1N6tn0c1P1mLOWRR/66FZDJFH7mB5a5fI=;
        b=AnE2AoGZe1x+//iLtuCz6I9lkS9KPKrGXKPZIkZvAC+Gk1rjqB7d26M4bCRBhUs+Bx
         NY1ZbF1ywMAFeP2u0KC0ginShiuO3sQKwmFuHq73zzjmbRGIm8PDCM5iZCsp5jEX5Efr
         MLWWLxg0HElkIEHMSsPmyqOxCQi8qAELmuWFcSOy44SRlx2anZ9TkESOijUpx8Mujz6u
         CzNfUqMSblZiTqlK5wXu/WInR370p83IwlCG2n54dxarAbE6CsRRpSvaPr05+MDTrIHw
         TTSSRj/QzAHc0wJSdH7G3aUPwNLTy33Xud+ieVRohptgS/6DQlomuxU/ElGxBKOHd11y
         Zezg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9RPpHktGODsTgYxyo35cEmwtMqw0e1xiQ2kTohL+lhthr6HJxxpEBGRRerr5FOaoVo9R076OfJxwiVED4G0K5@lists.infradead.org
X-Gm-Message-State: AOJu0YwzWiU+O4kkWN38uHhJ4NjZLVgfQB1Ne4baocFYg8CsDme+ZApN
	FBumOxBOoqw3LXrfeoHGhu02bN5bsS2M0ri6ptWTn84zXY3tGHkiMsWsaOMVXpuZ6Q7iwmBmG2Y
	vn8PapEGzlc6OfxxW4NsT0LEOVlVKfP9t7GDGEXeMAadtb9+eM/JQ4+F/GSNo2otcyLE6zPmF7r
	HI
X-Gm-Gg: AR+sD13ffeCk52gb0UGQUjCkPjnnrMK1uMZ+Ksn2hPQQDQpWTLTnybQQnQPwIYt2LzE
	77nMOPXuXGTSJomKXYxlu3LDHMGlrZIvYA8Qy835hom+qYCFAbh42yUO27DRSBUmLAQvVoZ46IT
	3lSQh3ywSIl1ePxMFb0Xtv//8lJ10iNPUc/JXj4bf4DJ6bpUAgmXpJmVYnZ7o6CdIXBIJAySs+C
	jTxbkgTTgNFiFMQn9NZTSdbV9To0OL3wSS0wdD8MGIAlnkSCYsbWXPlfBPjPfzOLPDfpANgwBYG
	yI359Iqg8qz2A9aywDWoSohZ4BnwQChoykPvQRM4cQ6yriwHcX8DFkyjxDZN7n3x1U5MsW5ps6u
	nd5U6UMfC01WO6xjpn5/zuiTQUix0/NEAj/LK+D0KK20=
X-Received: by 2002:a05:6a00:3d51:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84ee4840812mr11560582b3a.19.1785823764659;
        Mon, 03 Aug 2026 23:09:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d51:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84ee4840812mr11560561b3a.19.1785823764076;
        Mon, 03 Aug 2026 23:09:24 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe57a9esm4666927b3a.19.2026.08.03.23.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:09:23 -0700 (PDT)
Message-ID: <76e572a4-a8fb-42d0-8503-9f227005d790@redhat.com>
Date: Tue, 4 Aug 2026 16:09:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260731170324.2927758-1-andre.przywara@arm.com>
 <20260731170324.2927758-10-andre.przywara@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260731170324.2927758-10-andre.przywara@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NpUEBLyoSFwBGJjsenfLLUIFLLE70XxdgqQ8RKkpA2Q_1785823765
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_230933_900169_185FE28F 
X-CRM114-Status: GOOD (  35.09  )
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

On 8/1/26 3:03 AM, Andre Przywara wrote:
> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
> alternative way of accessing the "Memory System Components" (MSC) in an
> MPAM enabled system.
> 
> Normally the MSCs are MMIO mapped, but in some implementations this
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
> (simple) SCMI message generation, for just the fields we need.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com>
> ---
>   drivers/resctrl/Makefile        |   2 +-
>   drivers/resctrl/mpam_devices.c  |  57 +++++++--
>   drivers/resctrl/mpam_fb.c       | 209 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  18 +++
>   include/linux/arm_mpam.h        |   2 +-
>   5 files changed, 275 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/resctrl/mpam_fb.c
> 

With the following nitpicks addressed if they're making sense and
another respin is needed.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
> index 4f6d0e81f9b8..097c036724e9 100644
> --- a/drivers/resctrl/Makefile
> +++ b/drivers/resctrl/Makefile
> @@ -1,5 +1,5 @@
>   obj-$(CONFIG_ARM64_MPAM_DRIVER)			+= mpam.o
> -mpam-y						+= mpam_devices.o
> +mpam-y						+= mpam_devices.o mpam_fb.o
>   mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)		+= mpam_resctrl.o
>   
>   ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 11d053dbdfd0..ea08c12f717a 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -83,6 +83,21 @@ static DECLARE_WORK(mpam_broken_work, &mpam_disable);
>   /* When mpam is disabled, the printed reason to aid debugging */
>   static char *mpam_disable_reason;
>   
> +void mpam_fb_disable_mpam(int err, int mpam_fb_err)
> +{
> +	static char mpam_fb_reason[64];
> +
> +	/* Prevent repeated calls when mpam_disable() does MSC accesses. */
> +	if (!mpam_is_enabled())
> +		return;
> +
> +	snprintf(mpam_fb_reason, sizeof(mpam_fb_reason),
> +		 "MPAM-Fb error %d, kernel error %d", mpam_fb_err, err);
> +
> +	mpam_disable_reason = mpam_fb_reason;
> +	schedule_work(&mpam_broken_work);
> +}
> +
>   /*
>    * Whether resctrl has been setup. Used by cpuhp in preference to
>    * mpam_is_enabled(). The disable call after an error interrupt makes
> @@ -179,8 +194,11 @@ static void mpam_assert_partid_sizes_fixed(void)
>   
>   static int __mpam_read_reg(struct mpam_msc *msc, u16 reg, u32 *res)
>   {
> -	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>   
> +	if (msc->iface == MPAM_IFACE_PCC)
> +		return mpam_fb_send_read_request(msc, reg, res);
> +
> +	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>   	*res = readl_relaxed(msc->mapped_hwpage + reg);
>   
>   	return 0;
> @@ -197,9 +215,12 @@ static inline int _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg,
>   
>   static int __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
>   {
> -	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
> -	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>   
> +	if (msc->iface == MPAM_IFACE_PCC)
> +		return mpam_fb_send_write_request(msc, reg, val);
> +
> +	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> +	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
>   	writel_relaxed(val, msc->mapped_hwpage + reg);
>   
>   	return 0;
> @@ -1141,8 +1162,11 @@ static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
>   
>   	mpam_mon_sel_lock_held(msc);
>   
> -	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> -	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> +		WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
> +					       &msc->accessibility));
> +	}
>   
>   	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>   	if (ret)
> @@ -1176,8 +1200,11 @@ static int mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
>   
>   	mpam_mon_sel_lock_held(msc);
>   
> -	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> -	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
> +	if (msc->iface == MPAM_IFACE_MMIO) {
> +		WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> +		WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
> +					       &msc->accessibility));
> +	}
>   
>   	ret = __mpam_write_reg(msc, MSMON_MBWU_L, 0);
>   	if (ret)
> @@ -1490,11 +1517,16 @@ static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
>   					 srcu_read_lock_held(&mpam_srcu)) {
>   			arg->ris = ris;
>   
> -			err = smp_call_function_any(&msc->accessibility,
> -						    __ris_msmon_read, arg,
> -						    true);
> -			if (!err && arg->err)
> +			if (msc->iface == MPAM_IFACE_MMIO) {
> +				err = smp_call_function_any(&msc->accessibility,
> +							    __ris_msmon_read,
> +							    arg, true);
> +				if (!err)
> +					err = arg->err;
> +			} else {
> +				__ris_msmon_read(arg);
>   				err = arg->err;
> +			}
>   
>   			/*
>   			 * Save one error to be returned to the caller, but
> @@ -1970,6 +2002,9 @@ static int mpam_get_msc_preferred_cpu(struct mpam_msc *msc)
>   
>   static int mpam_touch_msc(struct mpam_msc *msc, int (*fn)(void *a), void *arg)
>   {
> +	if (msc->iface != MPAM_IFACE_MMIO)
> +		return fn(arg);
> +
>   	lockdep_assert_irqs_enabled();
>   	lockdep_assert_cpus_held();
>   	WARN_ON_ONCE(!srcu_read_lock_held((&mpam_srcu)));
> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
> new file mode 100644
> index 000000000000..61a91c6cec0a
> --- /dev/null
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2024-2026 Arm Ltd.
> +
> +#include <linux/arm_mpam.h>
> +#include <linux/cleanup.h>
> +#include <linux/errno.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +#include <acpi/pcc.h>
> +#include <asm/mpam.h>
> +
> +#include "mpam_internal.h"
> +
> +#define MPAM_FB_PROTOCOL_ID		0x1a
> +
> +#define MPAM_PROTOCOL_VERSION_CMD	0x0
> +#define MPAM_MSC_ATTRIBUTES_CMD		0x3
> +#define MPAM_MSC_READ_CMD		0x4
> +#define MPAM_MSC_WRITE_CMD		0x5
> +
> +#define MPAM_FB_ERR_SUCCESS		 0
> +#define MPAM_FB_ERR_NOT_SUPPORTED	-1
> +#define MPAM_FB_ERR_INVALID_PARAMETERS	-2
> +#define MPAM_FB_ERR_DENIED		-3
> +#define MPAM_FB_ERR_NOT_FOUND		-4
> +#define MPAM_FB_ERR_OUT_OF_RANGE	-5
> +#define MPAM_FB_ERR_BUSY		-6
> +#define MPAM_FB_ERR_COMMS_ERROR		-7
> +#define MPAM_FB_ERR_GENERIC_ERROR	-8
> +#define MPAM_FB_ERR_HW_ERROR		-9
> +#define MPAM_FB_ERR_PROTOCOL_ERROR	-10
> +#define MPAM_FB_ERR_IN_USE		-11
> +
> +#define MPAM_MSC_PROT_ID_MASK		GENMASK(17, 10)
> +#define MPAM_MSC_TOKEN_MASK		GENMASK(27, 18)
> +

Readers usually check the layout from MSB to LSB, so we would define
those fields in that sequence. Besides, I would move those two
definiitions before MPAM_FB_ERR_SUCCESS because MPAM_MSC_PROT_ID_MASK
is strongly relevant to MPAM_FB_PROTOCOL_ID.

MPAM_MSC_ATTRIBUTES_CMD isn't used, I would drop it. MPAM_FB_ERR_SUCCESS
would be MPAM_FB_SUCCESS because it's not an error.


   #define MPAM_MSC_TOKEN_MASK          GENMASK(27, 18)
   #define MPAM_PROT_ID_MASK            GENMASK(17, 10)

   #define MPAM_FB_PROTOCOL_ID		0x1a

   #define MPAM_PROTOCOL_VERSION_CMD	0x0
   #define MPAM_MSC_READ_CMD		0x4
   #define MPAM_MSC_WRITE_CMD		0x5

   #define MPAM_FB_PROT_HEADER_LEN       sizeof(u32)

   #define MPAM_FB_SUCCESS		 0
   #define MPAM_FB_ERR_NOT_SUPPORTED     -1
          :

> +#define MPAM_FB_PROT_HEADER_LEN		sizeof(u32)
> +
> +static atomic_t mpam_fb_token = ATOMIC_INIT(0);
> +
> +static void mpam_fb_build_version_message(unsigned int token,
> +					  void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem = msg_buf;
> +
> +	/* .signature is filled by the platform */
> +	writel_relaxed(PCC_CMD_COMPLETION_NOTIFY, &pcc_shmem->flags);
> +	writel_relaxed(MPAM_FB_PROT_HEADER_LEN, &pcc_shmem->length);
> +	writel_relaxed(MPAM_PROTOCOL_VERSION_CMD |
> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
> +		       &pcc_shmem->command);
> +}
> +
> +static void mpam_fb_build_read_message(int msc_id, int reg, unsigned int token,
> +				       void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem = msg_buf;
> +	struct mpam_fb_read_payload {
> +		u32 msc_id;
> +		u32 flags;
> +		u32 reg_offset;
> +	} __packed __iomem *payload = msg_buf + sizeof(*pcc_shmem);
> +	int msg_size = MPAM_FB_PROT_HEADER_LEN + sizeof(*payload);
> +
> +	/* .signature is filled by the platform */
> +	writel_relaxed(PCC_CMD_COMPLETION_NOTIFY, &pcc_shmem->flags);
> +	writel_relaxed(msg_size, &pcc_shmem->length);
> +	writel_relaxed(MPAM_MSC_READ_CMD |
> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
> +		       &pcc_shmem->command);
> +
> +	writel_relaxed(msc_id, &payload->msc_id);
> +	writel_relaxed(0, &payload->flags);
> +	writel_relaxed(reg, &payload->reg_offset);
> +}
> +
> +static void mpam_fb_build_write_message(int msc_id, int reg, u32 val,
> +					unsigned int token,
> +					void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem = msg_buf;
> +	struct mpam_fb_write_payload {
> +		u32 msc_id;
> +		u32 flags;
> +		u32 reg_offset;
> +		u32 value;
> +	} __packed __iomem *payload = msg_buf + sizeof(*pcc_shmem);
> +	int msg_size = MPAM_FB_PROT_HEADER_LEN + sizeof(*payload);
> +
> +	/* .signature is filled by the platform */
> +	writel_relaxed(PCC_CMD_COMPLETION_NOTIFY, &pcc_shmem->flags);
> +	writel_relaxed(msg_size, &pcc_shmem->length);
> +	writel_relaxed(MPAM_MSC_WRITE_CMD |
> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
> +		       &pcc_shmem->command);
> +
> +	writel_relaxed(msc_id, &payload->msc_id);
> +	writel_relaxed(0, &payload->flags);
> +	writel_relaxed(reg, &payload->reg_offset);
> +	writel_relaxed(val, &payload->value);
> +}
> +
> +static int mpam_fb_translate_error_code(int mpam_fb_code)
> +{
> +	switch (mpam_fb_code) {
> +	case MPAM_FB_ERR_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case MPAM_FB_ERR_INVALID_PARAMETERS:
> +		return -EINVAL;
> +	case MPAM_FB_ERR_NOT_FOUND:
> +		return -ENOENT;
> +	case MPAM_FB_ERR_OUT_OF_RANGE:
> +		return -ERANGE;
> +	case MPAM_FB_ERR_BUSY:
> +		return -EBUSY;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

SDEI has similar function. We may follow the convention by renaming this
to:

static int mpam_to_linux_errno(int error_code)
{
	switch (error_code) {
	   :
	}
}

> +static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 msc_id,
> +				u16 reg, u32 *result, int mpam_fb_command)
> +{
> +	unsigned int token = atomic_inc_return(&mpam_fb_token);
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem;
> +	struct pcc_mbox_chan *chan;
> +	void __iomem *payload_ofs;
> +	int mpam_fb_err = 0;
> +	u32 status;
> +	int ret;
> +
> +	if (!pcc_chan)
> +		return -ENODEV;
> +
> +	chan = pcc_chan->pcc_chan;
> +
> +	/* prune token to fit into the 10 bits inside the command register */
> +	token = FIELD_GET(MPAM_MSC_TOKEN_MASK,
> +			  FIELD_PREP(MPAM_MSC_TOKEN_MASK, token));
> +
> +	mutex_lock(&pcc_chan->pcc_chan_lock);
> +
> +	switch (mpam_fb_command) {
> +	case MPAM_MSC_WRITE_CMD:
> +		mpam_fb_build_write_message(msc_id, reg, *result,
> +					    token, chan->shmem);
> +		break;
> +	case MPAM_MSC_READ_CMD:
> +		mpam_fb_build_read_message(msc_id, reg, token, chan->shmem);
> +		break;
> +	case MPAM_PROTOCOL_VERSION_CMD:
> +		mpam_fb_build_version_message(token, chan->shmem);
> +		break;
> +	default:
> +		dev_err(pcc_chan->pcc_cl.dev, "unsupported MPAM-Fb command %d\n",
> +			mpam_fb_command);
> +		ret = -EINVAL;
> +		goto out_err;
> +	}
> +

Maybe worthywhile to keep the cases sorted upon the command values:

	switch (mpam_fb_command) {
	case MPAM_PROTOCOL_VERSION_CMD:
              :
         case MPAM_MSC_READ_CMD:
              :
         case MPAM_MSC_WRITE_CMD:
              :
         default:
              :
         }

> +	ret = mbox_send_message(chan->mchan, NULL);
> +	if (ret < 0)
> +		goto out_err;
> +
> +	pcc_shmem = chan->shmem;
> +	payload_ofs = chan->shmem + sizeof(*pcc_shmem);
> +	status = readl(&pcc_shmem->command);
> +	if (FIELD_GET(MPAM_MSC_TOKEN_MASK, status) != token) {
> +		ret = -ETIMEDOUT;
> +		goto out_err;
> +	}
> +
> +	mpam_fb_err = readl(payload_ofs + 0x0);
> +	if (mpam_fb_err < 0) {
> +		ret = mpam_fb_translate_error_code(mpam_fb_err);
> +		goto out_err;
> +	}
> +
> +	if (mpam_fb_command != MPAM_MSC_WRITE_CMD)
> +		*result = readl(payload_ofs + 0x4);
> +
> +	mutex_unlock(&pcc_chan->pcc_chan_lock);
> +
> +	return 0;
> +
> +out_err:
> +	mutex_unlock(&pcc_chan->pcc_chan_lock);
> +
> +	mpam_fb_disable_mpam(ret, mpam_fb_err);
> +
> +	return ret;
> +}
> +
> +int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result)
> +{
> +	return mpam_fb_send_request(msc->pcc_chan, msc->id, reg, result,
> +				    MPAM_MSC_READ_CMD);
> +}
> +
> +int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
> +{
> +	return mpam_fb_send_request(msc->pcc_chan, msc->id, reg, &value,
> +				    MPAM_MSC_WRITE_CMD);
> +}
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 6121cd126510..f13a79a84c58 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -11,6 +11,7 @@
>   #include <linux/io.h>
>   #include <linux/jump_label.h>
>   #include <linux/llist.h>
> +#include <linux/mailbox_client.h>
>   #include <linux/mutex.h>
>   #include <linux/resctrl.h>
>   #include <linux/spinlock.h>
> @@ -57,6 +58,15 @@ struct mpam_garbage {
>   	struct platform_device	*pdev;
>   };
>   
> +struct mpam_pcc_chan {
> +	struct list_head	pcc_chans;
> +	struct mbox_client	pcc_cl;
> +	struct pcc_mbox_chan	*pcc_chan;
> +	struct mutex		pcc_chan_lock; /* only one message at a time */
> +	struct kref		refcount;
> +	int			subspace_id;
> +};
> +
>   struct mpam_msc {
>   	/* member of mpam_all_msc */
>   	struct list_head	all_msc_list;
> @@ -66,6 +76,7 @@ struct mpam_msc {
>   
>   	/* Not modified after mpam_is_enabled() becomes true */
>   	enum mpam_msc_iface	iface;
> +	struct mpam_pcc_chan	*pcc_chan;
>   	u32			nrdy_usec;
>   	cpumask_t		accessibility;
>   	bool			has_extd_esr;
> @@ -484,6 +495,9 @@ extern u8 mpam_pmg_max;
>   void mpam_enable(struct work_struct *work);
>   void mpam_disable(struct work_struct *work);
>   
> +/* helper function to call from outside mpam_devices.c */
> +void mpam_fb_disable_mpam(int err, int mpam_fb_err);
> +
>   /* Reset all the RIS in a class under cpus_read_lock() */
>   void mpam_reset_class_locked(struct mpam_class *class);
>   
> @@ -511,6 +525,10 @@ static inline void mpam_resctrl_offline_cpu(unsigned int cpu) { }
>   static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
>   #endif /* CONFIG_RESCTRL_FS */
>   
> +/* MPAM-Fb Firmware-backed protocol wrappers */
> +int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result);
> +int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value);
> +
>   /*
>    * MPAM MSCs have the following register layout. See:
>    * Arm Memory System Resource Partitioning and Monitoring (MPAM) System
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index f92a36187a52..002f56e15362 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -12,7 +12,7 @@ struct mpam_msc;
>   
>   enum mpam_msc_iface {
>   	MPAM_IFACE_MMIO,	/* a real MPAM MSC */
> -	MPAM_IFACE_PCC,		/* a fake MPAM MSC */
> +	MPAM_IFACE_PCC,		/* using the MPAM-Fb firmware redirection */
>   };
>   
>   enum mpam_class_types {

Thanks,
Gavin


