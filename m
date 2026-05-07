Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB628CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkZhl2rjBW+nl3nyNEminS+13XOQl2O/je9IzImrzRw=; b=rvQxDLe90kNUsP8EFw2K7GFYpE
	bqSYZAps2HOYqJnpZswLABD6Az54YAdm2/qD+tTUm2uAaJCwpW78OEiSZkQNYslky3EM0ws6LXgY2
	DxhLWBeGSXiDi+9YFEjlFRWz5zNA+nVceyhdjsWMo6eXlq33qKohnkfGoDXWxUxK5OSlMiP9OIazI
	Egd1L1M9mwIgiyFJhUjhwaDX1hjjT2gV+xQjz21mkxoLvEE1ZEATnmgzuzi55hFWfKiTYtfmpzpeG
	qAXL73FZq9Hlxbd+aWRxr4WchmFlcjHSH4cXum75ewHP+1GVq2SGWZxgC/svDleRy6l49Kb4ATTCQ
	5pRpySiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL26I-00000004Q0V-1xH6;
	Thu, 07 May 2026 17:01:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL26F-00000004Pys-38C1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 17:01:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so5295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778173282; x=1778778082; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkZhl2rjBW+nl3nyNEminS+13XOQl2O/je9IzImrzRw=;
        b=tBsC+77kFGhFpmvZBxSXbyQkfye1gvFbWP+CixGcWEcVZIeTynEKK+6NiTdnLWVtGc
         y+4siAbKRQOj7VYp2jVrFGIL1ggBYtB2mKCkt8iA0N7k11v/NGM4Lucv1SF1XnIf6QgX
         4cq6prTd+O702bz4fNHHtPqNe3gTNn9aTaqYwnR0fH1D18VzV1080ylDqeVSI70+xhnV
         oFqTMimXreUdDGf7O9fjxZ3l12iPEFzkY7RDkKUkecw7ptqAhQSaHHhbfPOYNSgivCrB
         fQVwH5YiASeQgtFOsxeZEUcMmXbuf/xoq8ObrvrSg0upZsTXMC9BYCyI2tkDF6lilued
         uTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173282; x=1778778082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkZhl2rjBW+nl3nyNEminS+13XOQl2O/je9IzImrzRw=;
        b=GHke+4XVG3yN1tZaNcwfA0UUHEFg3xHswydDjPMcFUJS7K0OIywlim7MMTRjdBjTVF
         4jqANxEKecMZwtNYgbiNO5oA2xhLI1neXOqcsiUPBfLTJC6WvuDNdr94oBk00VRbU96A
         on6bGGxdg2gp+1EWV8Y1Ig6N+YFxguvMFsWDdF79dpan4tm2goWoxwWZxWpnKN/yuIZA
         kQa0dSkwAy5/KBdiPDv1u4h4CZoVqv1ky2vUfdtkJ6LaWcAvTFOCODzBHdtTm8f87JHc
         MhDMlsG1TQvOLzjCmJgBRyXGrw76gvmghc/lnrWBSHsLAf7ZQoNR4Jsjn6e9WegR8WbW
         b2LA==
X-Forwarded-Encrypted: i=1; AFNElJ80hIoGWUGlTHzxYR5jUbZ9V390WDMl22gptAycQYGkOc0bl4r7KVaLlQYKGNe0q+f777VT5NPQREWyRQxn50PK@lists.infradead.org
X-Gm-Message-State: AOJu0YwG92f7MRjVtp/m5X8bXAr1+Ar+gIQTeK67tA7ft+zVuvJkKVeT
	UGganzm3C/kIEeBFPAeyWMopBFu62rS3rxxy6vrK8WhZmc+zN7b7oHGOKos6PcrTY1TQm/tfk0e
	ic0hUIQ==
X-Gm-Gg: Acq92OGUumLqlNJlcBLs2f8c9ON+MhVTxznRWX4qNog/pERZXGbAjj8KadQsjQGkq9t
	ExbsB78TX8h29k+TTHDfF/mRW11Ma2kNl6Cd8Sz9mK0YeYIRaD4E09tnEEBsJTV52G2uThRyqsF
	ZGyPT5BwMzeKScpFFJiwcjP7t7UqMb2VgpayQETVD3bBo9Ioyc6HRO8NygrpjpyGna2P6cvXcvq
	MpmIClQU5bpoHz0GdR9Xk9JN5EA/N9hgg0CMK5IqeRqe0JeRY7ZDLwBm7oFnODMNXpVP28unOMU
	fgn021OeDny6xOFfhYsMtT1zoZagVZ3rc0/FVpocXqn4ek/OlhzFJyjbfoZJeFO5oFtlDH8mkaZ
	SCXFusKidpMh/u1Qx/xsVygLbFrHXct1ED5yg2QkoCuLUfCsg/IDnfBceGpboKcqSVjboKz7RMQ
	cKglnfM9ATNP2jvSgdr8fwuWnOpHpZ34zjZyWysP+TARtRtqWyZ8EaJmFLWTzfajros4nuP4y5c
	guAZzo=
X-Received: by 2002:a17:903:151:b0:2b7:b03d:9847 with SMTP id d9443c01a7336-2bae59d0064mr672355ad.7.1778173280664;
        Thu, 07 May 2026 10:01:20 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae755e95bsm2712105ad.25.2026.05.07.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:01:19 -0700 (PDT)
Date: Thu, 7 May 2026 17:01:13 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Yigit Oguz <yigitogu@amazon.de>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, dwmw2@infradead.org,
	suravee.suthikulpanit@amd.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lilit Janpoladyan <lilitj@amazon.com>
Subject: Re: [PATCH 1/3] iommu/arm-smmu-v3: Print PCI vendor:device ID in
 SMMU translation fault logs
Message-ID: <afzFWUEyw73n5yAR@google.com>
References: <20260506150541.60467-1-yigitogu@amazon.de>
 <20260506150541.60467-2-yigitogu@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506150541.60467-2-yigitogu@amazon.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_100123_787508_94453B48 
X-CRM114-Status: GOOD (  20.31  )
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

On Wed, May 06, 2026 at 03:05:37PM +0000, Yigit Oguz wrote:
> From: Lilit Janpoladyan <lilitj@amazon.com>
> 
> For translation, address-size, access, and permission faults, look up
> the pci_dev from the event and append the PCI vendor:device ID after
> the device name, e.g.:
> 
>   event: F_TRANSLATION client: 0001:02:02.4 [1d0f:8061] sid: ...
> 
> For non-PCI devices or unassigned SIDs the output is unchanged.
> 
> Signed-off-by: Lilit Janpoladyan <lilitj@amazon.com>
> Signed-off-by: Yigit Oguz <yigitogu@amazon.de>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 29 ++++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e8d7dbe495f0..ab1afa36965a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2213,12 +2213,30 @@ static void arm_smmu_dump_raw_event(struct arm_smmu_device *smmu, u64 *raw,
>  
>  #define ARM_SMMU_EVT_KNOWN(e)	((e)->id < ARRAY_SIZE(event_str) && event_str[(e)->id])
>  #define ARM_SMMU_LOG_EVT_STR(e) ARM_SMMU_EVT_KNOWN(e) ? event_str[(e)->id] : "UNKNOWN"
> -#define ARM_SMMU_LOG_CLIENT(e)	(e)->dev ? dev_name((e)->dev) : "(unassigned sid)"
> +
> +/* "SSSS:BB:DD.F [VVVV:DDDD]\0" — 12 + 1 + 11 + 1 = 25; round to power of 2 */
> +#define ARM_SMMU_CLIENT_LEN	32
> +

Nit: s/ARM_SMMU_CLIENT_LEN/ARM_SMMU_LOG_CLIENT_LEN to maintain the
convention?

> +static const char *arm_smmu_fmt_client(struct arm_smmu_event *e, char *buf, size_t sz)
> +{
> +	struct pci_dev *p;

Minor nit: maybe we could intialized it here?

struct pci_dev *p = to_pci_dev(e->dev);

Not a strong opinion though.

> +
> +	if (!e->dev)
> +		return "(unassigned sid)";
> +	if (!dev_is_pci(e->dev))
> +		return dev_name(e->dev);
> +
> +	p = to_pci_dev(e->dev);
> +	snprintf(buf, sz, "%s [%04x:%04x]", dev_name(e->dev), p->vendor, p->device);
> +	return buf;
> +}
>  
>  static void arm_smmu_dump_event(struct arm_smmu_device *smmu, u64 *raw,
>  				struct arm_smmu_event *evt,
>  				struct ratelimit_state *rs)
>  {
> +	char clientbuf[ARM_SMMU_CLIENT_LEN];

Nit: s/clientbuf/client_str ?

I was able to test this with 7.1-rc1 & it looks good:

   [  106.880820] arm-smmu-v3 9050000.smmuv3: event: F_TRANSLATION client: 0000:00:01.0 [8086:10c9] sid: 0x8 ssid: 0x0 iova: 0xffffc000 ipa: 0x0
   [  106.880855] arm-smmu-v3 9050000.smmuv3: unpriv data read s1 "Input address caused fault" stag: 0x0
   [  106.880894] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
   [  106.880922] arm-smmu-v3 9050000.smmuv3:     0x0000000800000010
   [  106.880948] arm-smmu-v3 9050000.smmuv3:     0x0000020800000000
   [  106.880974] arm-smmu-v3 9050000.smmuv3:     0x00000000ffffc004
   [  106.881001] arm-smmu-v3 9050000.smmuv3:     0x0000000000000000
   [  106.881030] arm-smmu-v3 9050000.smmuv3: event: F_TRANSLATION client: 0000:00:01.0 [8086:10c9] sid: 0x8 ssid: 0x0 iova: 0xffffc004 ipa: 0x0
   [  106.881061] arm-smmu-v3 9050000.smmuv3: unpriv data read s1 "Input address caused fault" stag: 0x0
   [  106.881104] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
   [  106.881136] arm-smmu-v3 9050000.smmuv3:     0x0000000800000010
   [  106.881163] arm-smmu-v3 9050000.smmuv3:     0x0000020800000000
   [  106.881189] arm-smmu-v3 9050000.smmuv3:     0x00000000ffffc008
   [  106.881215] arm-smmu-v3 9050000.smmuv3:     0x0000000000000000

Apart from the nits above:

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Tested-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

