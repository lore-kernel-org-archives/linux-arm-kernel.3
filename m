Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB35C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 04:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i81vfxx6rnbOmwz/BGTkep+/cjFf5C0tzqdntf/uZX0=; b=DMLrZM0vJxkYBu0n8PlViA5adp
	tAd1jH3Lfz8bLn3FPbwyPEYEJ+riEc601OCc8fUVRRLx4T24ramv6sEieHHl1P33vzkysM3V0ZVvI
	EW6D2URNP6WI8BBV6aGA9lvt/zvFH6XoyQHUCQYTKWO/4PVRAm2OfP6UBRo5Is+IX//K8M5Pt6Y9e
	dOwX6pjOXNOvaMxmv82V7TGE8EMXwXIz2kY5wBRKTMl2KEKdtn+tcyGcsxMOVbnPSzWfZAFVHWfGg
	TYw7CKD7SxKEMAYzU2CrC5ubR11xIfvKFyjm1fIuohkHICzs8IyMqroFSxCX+LRGpR2xNlEGQg5dE
	HEvM9tQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuktw-00000007xpU-0XxE;
	Wed, 19 Mar 2025 04:19:32 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuksF-00000007xfE-2Afm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 04:17:48 +0000
Received: from [100.65.32.26] (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id 834772025373;
	Tue, 18 Mar 2025 21:17:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 834772025373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742357866;
	bh=i81vfxx6rnbOmwz/BGTkep+/cjFf5C0tzqdntf/uZX0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=BBdngRFjrm3qc8p3g6SsP6YR+S/l76EJSt+6UA9xAvo2M1xlEwANRzngSNQMKNQbI
	 cTdh29l+lduUf0ovrmFq6mD+e4+hi6eBh9M1vDbP9QZmnxv8RWuOSzRQTDwnauV4Yb
	 49k43AlBkgAET9m0J04z5EQLbb/kzxPuW8ODh9FM=
Message-ID: <06d2ad24-7554-4e7c-86f7-9e22828cb725@linux.microsoft.com>
Date: Tue, 18 Mar 2025 21:17:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, mhklinux@outlook.com, ltykernel@gmail.com,
 stanislav.kinsburskiy@gmail.com, linux-acpi@vger.kernel.org,
 jeff.johnson@oss.qualcomm.com, eahariha@linux.microsoft.com,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
 corbet@lwn.net
Subject: Re: [PATCH v6 01/10] hyperv: Log hypercall status codes as strings
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1741980536-3865-2-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1741980536-3865-2-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_211747_584645_D3B5DAC9 
X-CRM114-Status: GOOD (  11.32  )
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

On 3/14/2025 12:28 PM, Nuno Das Neves wrote:
> Introduce hv_status_printk() macros as a convenience to log hypercall
> errors, formatting them with the status code (HV_STATUS_*) as a raw hex
> value and also as a string, which saves some time while debugging.
> 
> Create a table of HV_STATUS_ codes with strings and mapped errnos, and
> use it for hv_result_to_string() and hv_result_to_errno().
> 
> Use the new hv_status_printk()s in hv_proc.c, hyperv-iommu.c, and
> irqdomain.c hypercalls to aid debugging in the root partition.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> ---
>  arch/x86/hyperv/irqdomain.c    |   6 +-
>  drivers/hv/hv_common.c         | 129 ++++++++++++++++++++++++---------
>  drivers/hv/hv_proc.c           |  10 +--
>  drivers/iommu/hyperv-iommu.c   |   4 +-
>  include/asm-generic/mshyperv.h |  13 ++++
>  5 files changed, 118 insertions(+), 44 deletions(-)
> 

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

