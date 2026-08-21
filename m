Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725D7C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 03:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcge2qUWUjrfLVf+Vom7hfdT2yW5yXg+cm1A2GuzH7Q=; b=wh96Ff722wgv35nYi0eBbI7q5d
	Q5OMVDNk+hD5sIS3F1EgzIx/T+4VxZj4pq78MyFJBflo5e5H2SeXtvLObSpDwTZo7yLeW+2GzwXMa
	YfISKyWgXFHiclgImQhw+sqTB6dATf/6Z0f+EjB4Pj55hD2/Lc5GoJnpSwuzD2Gu4N21tJlbmkY/R
	VJxtk4dRi3MlHZwPZNGLRcsgBrh6mcw/ZKcvlUQrV+ys7aPzLKh8qF/t1aq/U0Tn2lkR0hMtx/GxS
	ZzWCCEwYyyAAZobDpkaH5uwXDOAeLiD3qm6qeSif+ly2wyVyZlyHzFl4rVDyNPXGTGn3ElXl2AHEy
	3vV0PUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxG9L-0000000CVLr-10dp;
	Fri, 21 Aug 2026 03:42:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxG9I-0000000CVLJ-1sIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 03:42:33 +0000
Received: from [192.168.0.15] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id DEE4220B7128;
	Thu, 20 Aug 2026 20:41:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DEE4220B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787283720;
	bh=gcge2qUWUjrfLVf+Vom7hfdT2yW5yXg+cm1A2GuzH7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y5MrYufBFbdpjXo/97GZO4RQUeLoaCJUpVw5CUkj7N/WoHU9HNnYE3YY4wG0NDsg3
	 CBCKzJL8Lktrj6nWItyozwo/643jeKgmG3hY32hsODUNhd7DmAv2QbU9uwOK1ipPBQ
	 TW/TJvLorGp5Y1ILe7gC2vaLePTGxfe/S8Dcucu8=
Message-ID: <3b019c40-e91f-4670-86bb-10c2cd1047a8@linux.microsoft.com>
Date: Thu, 20 Aug 2026 20:42:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 03/11] coco: guest: arm64: Add Realm Host Interface
 and guest DA helper
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexey Kardashevskiy <aik@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jonathan Cameron <jic23@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>, Steven Price <steven.price@arm.com>,
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, Will Deacon <will@kernel.org>,
 Xu Yilun <yilun.xu@linux.intel.com>
References: <20260427082805.931832-1-aneesh.kumar@kernel.org>
 <20260427082805.931832-4-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Kameron Carr <kameroncarr@linux.microsoft.com>
In-Reply-To: <20260427082805.931832-4-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_204232_527640_10ECA787 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On 4/27/2026 1:27 AM, Aneesh Kumar K.V (Arm) wrote:
> - Add  guest-side rhi-da helper that drives the vdev TDI state machine
>   via RHI host calls and translates the firmware status codes

...

> +
> +bool rhi_has_da_support(void)
> +{
> +	int ret;
> +
> +	struct rsi_host_call *rhi_call __free(kfree) =
> +		kmalloc(sizeof(*rhi_call), GFP_KERNEL);

Same comment as before that kzalloc is best practice for struct
rsi_host_call.

> +	if (!rhi_call)
> +		return -ENOMEM;

Returning an error value in a bool function will evaluate to true. This is
probably not your intended behavior.

Regards,
Kameron

> +
> +	rhi_call->imm = 0;
> +	rhi_call->gprs[0] = RHI_DA_FEATURES;
> +
> +	ret = rsi_host_call(rhi_call);
> +	if (ret != RSI_SUCCESS || rhi_call->gprs[0] == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	/* For base DA to work we need these to be supported */
> +	if ((rhi_call->gprs[0] & RHI_DA_BASE_FEATURE) == RHI_DA_BASE_FEATURE)
> +		return true;
> +
> +	return false;
> +}...

