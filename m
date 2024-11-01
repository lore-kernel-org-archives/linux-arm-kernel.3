Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55982E6B254
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HDgzWKsUKx97E2mppbNA0tlv52sTXzgPdKbp7JsyHc=; b=hbIWX/j/2sQR0P+nR4PsGCx4tO
	ZtsyX8jagQftWUkOy6UHo8XrPUi1AJnXW1CBxayB9x5p7A1cD8TE2RPNdh5HTeTJniTLRK5kHoxKP
	RlWmwRvklNRrqP4CdYnGkawho9BihWIEkH4h8R4cL0lXtqSDS3c/Wld1nZ9kk1iHqYF4gT4Nr3Ymx
	uz6pJOAEy64ITwfWwDjXFops/oagNHNxtT3/ZUqIMrM5MqfTk7ezToB6LJ7AB6+4cWnEnESPzeqnh
	Nv4uERt6HQESbluWSaw8Vxexvlc01YXfOpH6/n1EqrHV2QP/P8hDip2JS/UeR00AFSvNPdulJuvRF
	rrcXqQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qsk-000000073tS-3QmA;
	Fri, 01 Nov 2024 12:36:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qcH-00000006xEP-0E82
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F483A4371C;
	Fri,  1 Nov 2024 12:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C80BC4CECD;
	Fri,  1 Nov 2024 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730463539;
	bh=+HDgzWKsUKx97E2mppbNA0tlv52sTXzgPdKbp7JsyHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBHuxN/pAPf8IHixhryTxZ/futb2LvKpXXCyR/SW5uqdlFGHVLyrlBC+FoDgxJK/8
	 BXZ1Fn1ywsP56K2duT3rd3UI+AOCVdZmtR/HykfvCUXf3jv+5ZNKavkqEnCI4LKVwF
	 LRMnqS48aXxmJsDs31Z4xPwsC+bm4UTb7nLroxbppw7andSl//KM3oM0Tk4BPncaBZ
	 w1Qs2YqwVqIpnwUXRzbOyRf6LMKWgSiY+Z1kSvOokZF2WryjywWEbsMTi0AdGzTtx3
	 DxocfHC4sNGzai1qJLidnKNIKvKXS5sFlWCK6RoNSgw6FiIuVJ2TXQJsams+pxngiG
	 /RIoyXXF0y6rQ==
Date: Fri, 1 Nov 2024 12:18:50 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	kvm@vger.kernel.org, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
Message-ID: <20241101121849.GD8518@willie-the-truck>
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_051901_189371_C305F9E3 
X-CRM114-Status: UNSURE (   8.37  )
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

On Wed, Oct 30, 2024 at 09:20:44PM -0300, Jason Gunthorpe wrote:
> [This is now based on Nicolin's iommufd patches for vIOMMU and will need
> to go through the iommufd tree, please ack]

Can't we separate out the SMMUv3 driver changes? They shouldn't depend on
Nicolin's work afaict.

Will

