Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D3EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tToTvqgjKjFgEpiH/wvd2sZhq/aLX91Kukol3CuCkpk=; b=3uo3pMwi/OTdN/PUh+zaNxl/L4
	pb+ZiQw/iIFO99mJXb7ep9Y6LvBODHUJUJ6+FAgII3SppXTHEH+FpKCUdBlSIs2BQdKv1+M5XrHlY
	E4SHeaM8eDMJaU57G3gprIE8uBysjsusidEpK1FsaUUaTXjsM67Uag+OcdX/ev15tFe+UYaA55yT7
	PdBslr1Mc+HtbZAVWXTTFvYD50QiZrjVrOXcywsUhjgfTkspIwwazaXzkIBUOOLP1zDRjtjxdcZQA
	kw7FFFFKE9JCgreM5YqRvmGQ71l8F0aiW0MGP92oUSBqc+n9IHUidXAOiral80gjG2XSr13FAAtiV
	q8y90CPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Qnj-00000009skV-1DZP;
	Thu, 03 Apr 2025 20:04:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QLD-00000009m8s-0LG3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 19:35:08 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9BE67202565A;
	Thu,  3 Apr 2025 12:35:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9BE67202565A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1743708905;
	bh=tToTvqgjKjFgEpiH/wvd2sZhq/aLX91Kukol3CuCkpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XV7c57UKnez5RKqG/At88TciQqS/Rn/wFVhMqxC4ViVJKqJ+xmD1pMNLdpmTrUQCA
	 GXSPQxVF1xo03IZU1KvzigOm5aaMWdk9WjKQRQ4uKvkjmxfT9czgFWyZ8PDGQfDZeK
	 UY+VF1RFjpwsXMo0AgZSlbu6Ro82uyp1n7tLcT14=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: jgg@ziepe.ca
Cc: code@tyhicks.com,
	devicetree@vger.kernel.org,
	eahariha@linux.microsoft.com,
	eric.auger@redhat.com,
	iommu@lists.linux.dev,
	jacob.pan@linux.microsoft.com,
	linux-arm-kernel@lists.infradead.org,
	shyamsaini@linux.microsoft.com,
	vijayb@linux.microsoft.com,
	virtualization@lists.linux.dev,
	will@kernel.org
Subject: Re: [PATCH 0/3] make MSI IOVA base address and its length configurable
Date: Thu,  3 Apr 2025 12:34:58 -0700
Message-Id: <20250403193458.158085-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131003618.GB2296753@ziepe.ca>
References: <20250131003618.GB2296753@ziepe.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_123507_152790_C1523E81 
X-CRM114-Status: GOOD (  15.54  )
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

Hi Jason,

> On Thu, Jan 30, 2025 at 03:21:37PM -0800, Shyam Saini wrote:
> 
> > Unfortunately, it is an HW issue.
> 
> Well, that's pretty bad to have built HW that can't DMA to low
> addresses at all.. But OK.
>  
> > Are you okay with this passing custom MSI_IOVA via DTS approach ?
> 
> It isn't up to me, but I've understood the DT maintainers would reject
> this as it isn't is describing HW but just a random Linux software
> knob.
> 

If i understood correctly MSI window IOVA is hw property, if yes then it should be accepted
by DTS folks, did i misundertstand that?

> I think you should make selecting the sw_msi dynamic in Linux.

My understanding is that if we have to make it dynamic, we have to use iova allocator
that would need iova_domain as a member of struct arm_smmu_domain,
and allocate iova for MSI window dynamically using alloc_iova() in arm_smmu_get_resv_regions()
is that what you meant when you mentioned selecting the sw_msi dynamically?

later we still have to [1] re-adjust the final iova list to IOVA range - resereved regions (msi)
[1] https://elixir.bootlin.com/linux/v6.13.1/source/drivers/vfio/vfio_iommu_type1.c#L2232

so either static or dynamic, we seems to need MSI allocation

Please let me know what you think about this?

Thanks,
Shyam

