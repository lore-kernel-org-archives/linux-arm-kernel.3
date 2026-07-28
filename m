Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC1C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 06:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n36bS+3pZHkc3jS0sOVcHIozJRiOsa3RWkEz4fHvpUs=; b=zVOUqkfoAyXDdY+M46jdpZn0cq
	1+BhXd6fVkdXLaOSdL1VZAiJql76XEy9I5go+zbkAw7FM/UW+FmNmJ19mcfECT4zvEzRr9usXEYOF
	Lg5BVNfE+QJEXuBBRzzeIEiZRC3p593dU0zNVqu4KjpHQrH/cvMjReQqu/gUld7w8zJg6FoLwscwS
	YvcMCem/94LIRhB8V+oqjEOfr4v9jumEBfKrCWsOlKOW1YBhTJzjZ9qEFTLAFKCUibgIPd2e/ykLO
	j4nBuFjh85GWfMDZBG9QHMnOU5Xoil7zWkMt+5ZrQnAh1hWHXtvi+8+RZA88yhxQsCZ4Gyo5BZnOQ
	yHDh0geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobHh-00000004X8I-1rBG;
	Tue, 28 Jul 2026 06:27:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobHe-00000004X7x-0Kjn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 06:27:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S63X2O1387886
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n36bS+3pZHkc3jS0sOVcHIozJRiOsa3RWkEz4fHvpUs=; b=DH1IPd3u166uwuOW
	vahEphe+fRbrAg/Scrz16dt4UYR6RvEscq4L+lQrxOYRfTXCSsjCCNxRr9Cy1IlW
	DO8KvAv5b4OrH0Odv3E2cUiC9s7afXBpblOvKvqJxX8KyC4HP1SnZ91tlhFQQNq5
	mYTGiE8yls+J+OTsPcKcgCtHc7U09UZV2rFoqXOCgHaeBwgFO7oa+J+Wkt+sGvNZ
	UhKTqDKi+gUEfosjDDgWcATqaxZXSvm5sIaRhKs+K38Ij+2geQ1ZIaDK4yY50bmG
	wR443ioCD60UxIl8KtF73olwMSu9kEdt8/o75z61vYZjgnIhlkL9uWjQiNq69ABm
	G4eNNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttr36m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:27:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so65464045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785220041; x=1785824841; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n36bS+3pZHkc3jS0sOVcHIozJRiOsa3RWkEz4fHvpUs=;
        b=SY97PvNwEV0mYrtDWKBdrMq8SE7ZduJHcfu+qGoNlPiyz2MgTdCXAPAbe1++QYnFMd
         yBeCA/2Gb/IJb7F+lSAGFuYlRZv+ZYXRb8mMBAiTZR+Eyrrd03hKGz/tEGjsCwcketpI
         ItpSzp4ZXhKa5Yh/BrkngM4QYrORMhcpCr1dpfozxheWmjhKCsEkuba6PQyhU0T8PIa+
         /G/BumhMvrys2OFQ8no5kiePbr5zTNuNQMYwzBwSJd3bsTJNxsqLDKeBShw9mjfqMiTf
         Phxno6qlMa4hUOTyAAIpZ+1tlG05QFzyzeeBTtNsHTQkffe1btHL7O5bPC+VJrVXuOpg
         VFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785220041; x=1785824841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n36bS+3pZHkc3jS0sOVcHIozJRiOsa3RWkEz4fHvpUs=;
        b=SLg/cyo77hTM6kJfhpssiXZrJcOfuifU/b2pfNs2SvSyX5WBoPULGa3nNj5WXl1A0C
         5qjTZhEZSHsgytE5kmGGSmB7YRp8I2jZhHn27DXEFO5hgFN110qqnKuvwMeOPZTWpauF
         bKA06elQazeFLza78LDAM/vTyB6I5rkHfBkCgtC8lhz4HkJ3C9LRkn+HOoGE8k8YzTaY
         7DmZkvo8GDxjw8fROQSLRhZgQ2wf0KBDHAWhStWYSnTFqg9lxN4JyPspflCVRVeSEg2D
         2OxOMhl4hLLqSZaMqdw4D2sQuH3OABXU7Th4D/4hOGLRIX28B+6svF7nqy4Tgf6AuRMJ
         Ix8A==
X-Forwarded-Encrypted: i=1; AHgh+RpW0nkXj4iRlfPpHzCgQCT7m3bza87w1lVLRrdsNjmuLe4RYucGOKB3eWiZSdX0h1ljxSad+R/b/ulP6kZvEBEe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7M7av0u2y9p0nKxxV7XToC8aXxSMX7IB4Iqv9kcwKQmO0Dvba
	M2yahb5h+dskmm4yyMa0myl27EpPEqEu0LNPFioq/Tq6LF2MigqM92gTY/O42okZP4Jz+I8A5W+
	9w52wJef+/QFak3zfWIIRUBb4Utovg3UUqXy4odH65tp7LGj892B3ZWQBNzRw1AZxpYCqCeic1y
	g3Rw==
X-Gm-Gg: AR+sD12s6KXFrm+9orm641d5VdlK+USCl/6IaiW0516ncFW4AOWojsIH/v0hbKU3nki
	Byp+NhfyNKCA9Fto2r2EGTC2pSKYR5UpST7h/FE0Ev8ppG9akxuSGsQ3yP+ylkjGc6Ve7gmTm6H
	++Hlkz0jzmzDzsfpuZe6dMymL6dMaCg3RyskhWk/d78RRTViZYv3QE3/c2JCpXj63/qkfDlBT/X
	d2trJ4GpfRfo0hnI/SzRKPbU+ccGLiMaex00Wa/QeMCQ4zgL5q0Nlnvz+LNDn6Zp+4hTJEEjosT
	6CRB1HcE4jMt33IDikBMCd2ieLYQv95hC5Q7zlrfJCpdYoadUwm6GLS7GmFhHhs6EtOVMXzA7X5
	yMp5EJ3vNl0y0CM0W2BYWLNawEC1Cj3In
X-Received: by 2002:a17:903:160c:b0:2ca:bba:b35c with SMTP id d9443c01a7336-2d015c37989mr12686955ad.31.1785220040835;
        Mon, 27 Jul 2026 23:27:20 -0700 (PDT)
X-Received: by 2002:a17:903:160c:b0:2ca:bba:b35c with SMTP id d9443c01a7336-2d015c37989mr12686795ad.31.1785220040270;
        Mon, 27 Jul 2026 23:27:20 -0700 (PDT)
Received: from [192.168.1.106] ([106.51.199.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcb3sm45962225ad.82.2026.07.27.23.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:27:19 -0700 (PDT)
Message-ID: <8daee801-ec05-4206-8816-ef7a5d527f98@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:57:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
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
 <20260723155454.1760823-9-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260723155454.1760823-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX5tgEB0eMJiD0
 2/C6UFOnd90AhScnpYWHHaNmr0Ukf4lFseDMSDZCMOHDvC/DeGkpdT42j5WYkkfit+GBmhNDfKD
 bkz8apoK41onBrJKx0GLS/ke8OPSBtc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX7rVg2imWIghb
 4MGdmNEj6sKDKpnJte8gNTvxa3C0+ScAC4NZx1Cfdhvwm43KfivrFjuIMhGgSnI5YusUvR48A44
 zv7NXbHGD7mlM/UTOukmMOAPnPnkyRKmlmKpUJ7J5nJlOYQa/P8AlEfzzX3iou6bpLHdvdY2Mtn
 jPbV0ACkVcIpqbijj6fwIS+El+ZzS0le/XGl2M5R5jRl8QWFcseViwTNFecoSNYWRWWxAGD8nzt
 RCa8BpQb0GqAbkjZvtQk7sDINyOkcsXRZAen5wF88VXQpYu/fXoWHoIfVLHLJ9W86A6Vlnbac30
 hGDQMIqq+gbtYBFLJ++tITZRwVcjJ4ZurDPD7JayplrG9beMql15ru6HF9bI79OZaQIxUA9xJqF
 rluWnDI1nf/kbelvwbt1fV4VlwWjp5U34+pVt93Usgeg24G6ciD792D2XJVV0IDSy+EqJoMK6lX
 ry783StShYMp72qL2Qw==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a684bc9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=PO1FP6gy+OYP9C5qPHjZag==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=8eIDnr76gOUAJy6mN_MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: xXte8lXyL3MTQtLoRnEI4g2U8_-ehj1p
X-Proofpoint-ORIG-GUID: xXte8lXyL3MTQtLoRnEI4g2U8_-ehj1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_232722_145749_0B978A90 
X-CRM114-Status: GOOD (  33.90  )
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

On 7/23/2026 9:24 PM, Andre Przywara wrote:
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
> ---
>   drivers/resctrl/Makefile        |   2 +-
>   drivers/resctrl/mpam_devices.c  |  27 ++++-
>   drivers/resctrl/mpam_fb.c       | 197 ++++++++++++++++++++++++++++++++
>   drivers/resctrl/mpam_internal.h |  20 ++++
>   include/linux/arm_mpam.h        |   2 +-
>   5 files changed, 240 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/resctrl/mpam_fb.c
> 
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
> index e2cb884eacf4..b8108ed4b32c 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -181,6 +181,9 @@ static int __mpam_read_reg(struct mpam_msc *msc, u16 reg, u32 *res)
>   {
>   	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>   
> +	if (msc->iface == MPAM_IFACE_PCC)
> +		return mpam_fb_send_read_request(msc, reg, res);
> +
>   	*res = readl_relaxed(msc->mapped_hwpage + reg);
>   
>   	return 0;
> @@ -197,9 +200,12 @@ static inline int _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg,
>   
>   static int __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
>   {
> -	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
>   	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>   
> +	if (msc->iface == MPAM_IFACE_PCC)
> +		return mpam_fb_send_write_request(msc, reg, val);
> +
> +	WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
>   	writel_relaxed(val, msc->mapped_hwpage + reg);
>   
>   	return 0;
> @@ -1136,7 +1142,8 @@ static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
>   
>   	mpam_mon_sel_lock_held(msc);
>   
> -	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> +	if (msc->iface == MPAM_IFACE_MMIO)
> +		WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>   	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>   
>   	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
> @@ -1485,11 +1492,16 @@ static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
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
> @@ -1916,6 +1928,9 @@ static int mpam_get_msc_preferred_cpu(struct mpam_msc *msc)
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
> index 000000000000..ec4bf0dd9182
> --- /dev/null
> +++ b/drivers/resctrl/mpam_fb.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2024 Arm Ltd.
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
> +#define MPAM_FB_PROTOCOL_ID	0x1a
> +#define MPAM_PROTOCOL_VERSION	0x0
> +#define MPAM_MSC_ATTRIBUTES_CMD	0x3
> +#define MPAM_MSC_READ_CMD	0x4
> +#define MPAM_MSC_WRITE_CMD	0x5
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
> +#define MPAM_MSC_PROT_ID_MASK	GENMASK(17, 10)
> +#define MPAM_MSC_TOKEN_MASK	GENMASK(27, 18)
> +
> +struct mpam_fb_read_payload {
> +	u32 msc_id;
> +	u32 flags;
> +	u32 reg_offset;
> +} __packed;
> +
> +struct mpam_fb_write_payload {
> +	u32 msc_id;
> +	u32 flags;
> +	u32 reg_offset;
> +	u32 value;
> +} __packed;
> +
> +#define PCC_CHAN_FLAGS_IRQ	BIT(0)
> +
> +static atomic_t mpam_fb_token = ATOMIC_INIT(0);
> +
> +static void mpam_fb_build_version_message(unsigned int token,
> +					  void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem = msg_buf;
> +
> +	writel_relaxed(PCC_CHAN_FLAGS_IRQ, &pcc_shmem->flags);
> +	writel_relaxed(MPAM_FB_PROT_HEADER_LEN, &pcc_shmem->length);
> +	writel_relaxed(MPAM_PROTOCOL_VERSION |
> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
> +		       &pcc_shmem->command);
> +}
> +
> +static void mpam_fb_build_read_message(int msc_id, int reg, unsigned int token,
> +				       void __iomem *msg_buf)
> +{
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem = msg_buf;
> +	struct mpam_fb_read_payload __iomem *payload = msg_buf + sizeof(*pcc_shmem);
> +	int msg_size = MPAM_FB_PROT_HEADER_LEN + sizeof(*payload);
> +
> +	writel_relaxed(PCC_CHAN_FLAGS_IRQ, &pcc_shmem->flags);
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
> +	struct mpam_fb_write_payload __iomem *payload = msg_buf + sizeof(*pcc_shmem);
> +	int msg_size = MPAM_FB_PROT_HEADER_LEN + sizeof(*payload);
> +
> +	writel_relaxed(PCC_CHAN_FLAGS_IRQ, &pcc_shmem->flags);
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
> +static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 msc_id,
> +				u16 reg, u32 *result, int mpam_fb_command)
> +{
> +	unsigned int token = atomic_inc_return(&mpam_fb_token);
> +	struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem;
> +	struct pcc_mbox_chan *chan;
> +	void __iomem *payload_ofs;
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
> +	guard(mutex)(&pcc_chan->pcc_chan_lock);
> +
> +	switch (mpam_fb_command) {
> +	case MPAM_MSC_WRITE_CMD:
> +		mpam_fb_build_write_message(msc_id, reg, *result,
> +					    token, chan->shmem);
> +		break;
> +	case MPAM_MSC_READ_CMD:
> +		mpam_fb_build_read_message(msc_id, reg, token, chan->shmem);
> +		break;
> +	case MPAM_PROTOCOL_VERSION:
> +		mpam_fb_build_version_message(token, chan->shmem);
> +		break;
> +	}

The switch here has no default case. If an unrecognised command value is
passed (in future), it maybe safer and future proof to have a default case?

     default:
         return -EINVAL; ?> +
> +	ret = mbox_send_message(chan->mchan, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	pcc_shmem = chan->shmem;
> +	payload_ofs = chan->shmem + sizeof(*pcc_shmem);
> +	status = readl(&pcc_shmem->command);
> +	if (FIELD_GET(MPAM_MSC_TOKEN_MASK, status) != token)
> +		return -ETIMEDOUT;
> +
> +	ret = readl(payload_ofs + 0x0);
> +	if (ret < 0) {
> +		switch (ret) {
> +		case MPAM_FB_ERR_NOT_SUPPORTED:
> +			return -EOPNOTSUPP;
> +		case MPAM_FB_ERR_INVALID_PARAMETERS:
> +			return -EINVAL;
> +		case MPAM_FB_ERR_NOT_FOUND:
> +			return -ENOENT;
> +		case MPAM_FB_ERR_OUT_OF_RANGE:
> +			return -ERANGE;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (mpam_fb_command != MPAM_MSC_WRITE_CMD)
> +		*result = readl(payload_ofs + 0x4);
> +
> +	return 0;
> +}
> +
> +int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result)
> +{
> +	return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
> +				    reg, result, MPAM_MSC_READ_CMD);
> +}
> +
> +int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
> +{
> +	return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
> +				    reg, &value, MPAM_MSC_WRITE_CMD);
> +}
> +
> +int mpam_fb_get_protocol_version(struct mpam_msc *msc)
> +{
> +	u32 version;
> +	int ret;
> +
> +	ret = mpam_fb_send_request(msc->pcc_chan, 0,
> +				   0, &version, MPAM_PROTOCOL_VERSION);
> +	if (ret)
> +		return ret;
> +
> +	return version;
> +}
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index b3a6ed9ed175..e4686ff0ba2e 100644
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
> @@ -66,6 +76,8 @@ struct mpam_msc {
>   
>   	/* Not modified after mpam_is_enabled() becomes true */
>   	enum mpam_msc_iface	iface;
> +	struct mpam_pcc_chan	*pcc_chan;
> +	int			mpam_fb_msc_id;	/* in its own name space */
>   	u32			nrdy_usec;
>   	cpumask_t		accessibility;
>   	bool			has_extd_esr;
> @@ -511,6 +523,14 @@ static inline void mpam_resctrl_offline_cpu(unsigned int cpu) { }
>   static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
>   #endif /* CONFIG_RESCTRL_FS */
>   
> +/* MPAM-Fb Firmware-backed protocol wrappers */
> +int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 *result);
> +int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value);
> +int mpam_fb_get_protocol_version(struct mpam_msc *msc);
> +
> +#define MPAM_FB_PROT_HEADER_LEN	sizeof(u32)
> +#define MPAM_FB_MAX_MSG_SIZE	(MPAM_FB_PROT_HEADER_LEN + 4 * sizeof(u32))
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

Best Regards,
Srivathsa

