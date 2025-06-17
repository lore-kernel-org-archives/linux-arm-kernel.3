Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F99C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k19HAkvRNiczLKeclhMJk/mNs/a0lpjS1krajAWgAOk=; b=ptcfS4BTnDzIoeG4mg4kcoYdGT
	tAWsbwY1HEwZmLXnxANZ6G00NEj9NvHsBar4bNNY3XJSt85chRzC6GHpK7cUwVLXR/huKpyKRIDer
	qJznfcmfoQUVE2huPZCWvtzX8GTaN6+aaGICo4Fq8YykZotNlhgXuLVZISQKh4K+yR6B0JlqhxXjn
	xvoPHWSuoro+OHBwpOZhgwFs1R1fhn26nzdCjdmVt3no8HBeUnDvqTTYemoqtHz+xadmyyXFeMZtV
	h8HBXptLETB+9akv/whMEfd5a04tzHQNIs/GrlgU7El2HFG2UOLTpX/mdFJSJ69QOFuKfAFXhDl6b
	VBLwqwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrF-00000007zoJ-2Wo0;
	Tue, 17 Jun 2025 17:12:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYo4-00000007pRX-2gmt;
	Tue, 17 Jun 2025 16:05:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A5D2150C;
	Tue, 17 Jun 2025 09:04:40 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 267763F58B;
	Tue, 17 Jun 2025 09:04:59 -0700 (PDT)
Message-ID: <77867c46-d868-4496-a1a3-45feb0bdd604@arm.com>
Date: Tue, 17 Jun 2025 17:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: verisilicon: Flush IOMMU before decoding a
 frame
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-6-benjamin.gaignard@collabora.com>
 <20250617155822.GE1376515@ziepe.ca>
 <30a48107-8e98-42dd-a5a7-9c87c9eb538d@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <30a48107-8e98-42dd-a5a7-9c87c9eb538d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_090504_733694_46084478 
X-CRM114-Status: GOOD (  13.96  )
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

On 17/06/2025 5:01 pm, Benjamin Gaignard wrote:
> 
> Le 17/06/2025 à 17:58, Jason Gunthorpe a écrit :
>> On Mon, Jun 16, 2025 at 04:55:53PM +0200, Benjamin Gaignard wrote:
>>> Flush the IOMMU mapping before decoding a frame to ensure that all 
>>> memory
>>> translations are properly applied.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>> ---
>>>   drivers/media/platform/verisilicon/hantro_drv.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>> This is a really big red flag.
>>
>> iommu translations are supposed to be controlled by the iommu driver
>> and should be flushed as part of the iommu map/unmap flows. It should
>> never be necessary to do something like this.
> 
> I have redone tests without this patch and the decode is perform correctly.
> I will drop it in the next version.
> I think I have fix the reference frame management in the driver so it 
> becomes
> useless.

If it turns out the hardware does require a TLBI to guarantee new 
mappings are visible, though, then the correct way is to implement the 
iotlb_sync_map op.

Thanks,
Robin.

