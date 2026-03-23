Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868FDF483D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEgEB+FhJamQekHHnnzeHBVC3CCx1oLXNDdzh85xf2M=; b=wwRnzu6ueiS5DomYTPnVlnPJrq
	br3AXl6GOxKuDVCggLxwDhSUon0My9a/VuDSH/CXGcwypqRDkOD7C1QcEoGF2/NaBZ1sMut08AEnn
	M5IsZM9RD8AkfDxNHzs/uJ40/aNdkcxmWoKIQC2Fs7Vz4NHtzsUhbdznWmh9y6tVJPyyQH4mTZhq3
	cUVOHWfCX+UeoJwfzb60qlolERbMKhTIhLbh7xDWLqsgyZMWUiwSuDH5Rb89q/CCEzVtrUZn2+L5D
	Bpzglpa3ZRb32Vd8CZQ8HSKTvyYP+/gIs9xt4xNqThvltza2JPlKkrzhatrreLemMdV8prIcWx0by
	VbHbtLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iuy-0000000HDFx-15X4;
	Mon, 23 Mar 2026 17:18:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iuw-0000000HDFC-1rZ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:18:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso36147235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774286296; x=1774891096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEgEB+FhJamQekHHnnzeHBVC3CCx1oLXNDdzh85xf2M=;
        b=NAPHyeGlb1fC9MbFSlmsH1eTYO/jjirCKXCG+gblgS5lVKLJGTItDxyfuuVB32xFDE
         60bZV/XyduNem3dfZDMtP4VbU706XSIEA2QlYFGeXekju703Z3AEu7ejrIccXKgqzcFP
         nr3EDl16/ASHcyU6FjUrJ8zApp6am2RnEug9Y7Dy8wCKlxEMpPJ5eQ0Z4IUpQ9WqkgZP
         uzLj6xepI3gd1JjjCybBRdrwLL3I/Hhn1O9hPgmuC5PKsUla9lwtvrxg3A1/tVmbZwlP
         49CFfHTu2ecC+cHr9gkC5Fe/YT6XisZ4h77G7BayZBLtkBwUVXszZ7mDwyH4tR7J5jSk
         6raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286296; x=1774891096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEgEB+FhJamQekHHnnzeHBVC3CCx1oLXNDdzh85xf2M=;
        b=k68Fva9zWSUHtK3B1QO6aaWVdR2AOx6mFx4SPmY90erjwLd4fa6sxPDS2ALvwq+Wii
         C9ev58cGX7sJoeyNnOOBn+1VUMTSuW4FacTq4Q2SifBXqjJ/gDUGxyCL60y+GbwAPLvS
         R5EPoZSDc1CirawEhveGsjUo4KFFV0a/kQ19Bqxlsf+BBV2cE3OgiUsqSCUBPnmPr/FN
         D3Qd+T+ero6WE5DPy0SRMMx+fqlRqNw4rOiIMMpgRwXNYIHGxMVvQ2ROCm43nCmoVnDB
         rmSpj7TZwVRaPwEJeasI42VxNsArXrwESp6yGvR9C1BMlhmJrgR0gZ6cK1HYcS494dB0
         eKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNYHhVoCiPohbF8btTVCZQz8+2KfiQpCTmkgAIRNN6W5z4YbMhSn9cUQFl9s5sMuMw7zRLJUI7AkcTHiNMpDsx@lists.infradead.org
X-Gm-Message-State: AOJu0YwYXTJ+AdPc4MzqPflas2OXQU72K8GEJsJ20LXnGwt1iDPt2HkI
	q2pHN8FgR2sNJzYYpVjBNCw6GoafL6jAHCkXa/cxc+L2xQW/CHPfkemB7zWRv6SdrDY=
X-Gm-Gg: ATEYQzzqbhPCTeyAYRsxLVkuj6s16uwsTrN8WKGeDv7AwpowWbxHFFqzVzCV9HNj0sy
	lapMHShyLfIEtJXFAr0SDbAYkOjqqDu6k4pox3/Ow8sUU7Z1SvBOXnY855wEBpCMGyxYewYFJDQ
	j5vhSmf65mmx5+E+n9TldfoufHgWVoDgE4jAK/SwTvkCtcp41XZNEJPpfXpmpovvWxhxWaunHvh
	qbUZw+pod19g3wkJ8mMJpRddAmnQbdTaQEHcZDqKsHicMQOh2P7Uu10adjggyWWoevZtOQxlrhu
	txh9oN/3VOAh3UDdh9hzyOrRUYmF3OraqUxKwl1E0fjkjSzOMSbt5eimopuithAGsx3wS1HhevZ
	ecyI2uQuJE6o9HQ0MlCSu+KDVrBf9G6GRlw+WLubqCycwShLsV80s+C8JVIxnZh4mmPF0HCrCcJ
	fbbCNYBbRUNZVPPXEFVUU44weYNhftrsc=
X-Received: by 2002:a05:600c:c083:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-486fee0481amr142927935e9.14.1774286295324;
        Mon, 23 Mar 2026 10:18:15 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm33929334f8f.14.2026.03.23.10.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:18:13 -0700 (PDT)
Message-ID: <67b32e90-1f60-4bf5-b534-b4a901d5a796@linaro.org>
Date: Mon, 23 Mar 2026 19:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
To: Robin Murphy <robin.murphy@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 Charan Teja Kalla <quic_charante@quicinc.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Juan Yescas <jyescas@google.com>, kernel-team@android.com
References: <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_101818_525886_65A820EA 
X-CRM114-Status: GOOD (  23.03  )
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

Hi, Robin,

On 2/28/25 5:46 PM, Robin Murphy wrote:
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index a3b45b84f42b..1cec7074367a 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -414,9 +414,21 @@ static int iommu_init_device(struct device *dev)
>  	if (!dev_iommu_get(dev))
>  		return -ENOMEM;
>  	/*
> -	 * For FDT-based systems and ACPI IORT/VIOT, drivers register IOMMU
> -	 * instances with non-NULL fwnodes, and client devices should have been
> -	 * identified with a fwspec by this point. Otherwise, we can currently
> +	 * For FDT-based systems and ACPI IORT/VIOT, the common firmware parsing
> +	 * is buried in the bus dma_configure path. Properly unpicking that is
> +	 * still a big job, so for now just invoke the whole thing. The device
> +	 * already having a driver bound means dma_configure has already run and
> +	 * either found no IOMMU to wait for, or we're in its replay call right
> +	 * now, so either way there's no point calling it again.
> +	 */
> +	if (!dev->driver && dev->bus->dma_configure) {
> +		mutex_unlock(&iommu_probe_device_lock);
> +		dev->bus->dma_configure(dev);
> +		mutex_lock(&iommu_probe_device_lock);
> +	}

I was chasing the "something fishy" dev_WARN on a 6.19+ downstream
android kernel and while looking at the IOMMU code I couldn't help
myself and ask whether we shall prevent concurrent execution of
dma_configure().

It seems to me that while the IOMMU subsystem is executing
dma_configure(), the deferred probe workqueue can concurrently pick up
the same device, enter really_probe(), set dev->driver, and execute
dma_configure(). Is it worth protecting against this?

I can try to prove it if needed, using a downstream iommu driver (sigh).

Thanks!
ta

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e61927b4d41f..5f0c1a8064b5 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -461,9 +461,19 @@ static int iommu_init_device(struct device *dev)
         * already having a driver bound means dma_configure has already run and
         * found no IOMMU to wait for, so there's no point calling it again.
         */
-       if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
+       if (!dev->iommu->fwspec && !READ_ONCE(dev->driver) &&
+           dev->bus->dma_configure) {
                mutex_unlock(&iommu_probe_device_lock);
-               dev->bus->dma_configure(dev);
+
+               /*
+                * Serialize with really_probe(). Recheck dev->driver in case a
+                * driver bound while we were waiting for the lock.
+                */
+               device_lock(dev);
+               if (!dev->driver)
+                       dev->bus->dma_configure(dev);
+               device_unlock(dev);
+
                mutex_lock(&iommu_probe_device_lock);
                /* If another instance finished the job for us, skip it */
                if (!dev->iommu || dev->iommu_group)
(END)

