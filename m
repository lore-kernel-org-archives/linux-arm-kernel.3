Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A10CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ep5nKo6DRclkdaB0Yg7vYnUiOGxV48mwn6/e9YS/4RY=; b=PNG1TU+XXvtON9e8uxSIbI5YPg
	OPRNLlP/Oah09WnfhAX6lIEADqKNox/WxaN/QjBcPvvf95dadVmbaT42b+Wr6mnq6U+8Vsd64K2Bi
	BemHbH0FQi/byiXXs3QR7FaKzGHp/UxJAE7bsSyCkUt5v/dxB9Dz3K9j26RgqMO1VONrynQ0wGjQQ
	cQT0DFTZsrWWf17BfnN2iuRckG5c3Fw+aU1N5xJ5rZC+lGlKuwpw1KgzLVM70HTolCdyK5pyELGhr
	iAvZ/8SSY+iyGflPeM7F7JNXPvC9yaCCKI8yRxjOqbDkBRVS2+kDsypGXItbcEL2PvI8M0G7zwCTY
	sIHo2ejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTys6-0000000AUBH-0x6m;
	Mon, 01 Jun 2026 09:23:46 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTys3-0000000AUAZ-1isa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780305821; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ep5nKo6DRclkdaB0Yg7vYnUiOGxV48mwn6/e9YS/4RY=;
	b=rWGws0rTyXK4FtsX90kzbGqooV63l8stf01h2B5IOl4faHEUaFXlO7FCMHjtDVxhxqMrAG08CYhmTIpDd5W70/BYzkBHfHvzQK99tbL299Efa8VqMhbQzwqtxcmfqXuo6kouRTVSYLcO81u4XQuv/4mKaatZunbNP15w4o1LaUI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R341e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X3zS2An_1780305818;
Received: from 30.221.133.117(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X3zS2An_1780305818 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 01 Jun 2026 17:23:39 +0800
Message-ID: <87bd39ee-6fd6-451e-9ae6-ca2faad84ce9@linux.alibaba.com>
Date: Mon, 1 Jun 2026 17:23:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] iommu/generic_pt: implement iova_to_phys_length
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 alex@shazbot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
 baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 dwmw2@infradead.org, xlpang@linux.alibaba.com,
 oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
 wei.guo.simon@linux.alibaba.com,
 alikernel-developer <alikernel-developer@linux.alibaba.com>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-4-guanghuifeng@linux.alibaba.com>
 <20260531235421.GW2487554@ziepe.ca>
From: "guanghuifeng@linux.alibaba.com" <guanghuifeng@linux.alibaba.com>
In-Reply-To: <20260531235421.GW2487554@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_022343_794436_FD95EB87 
X-CRM114-Status: UNSURE (   8.11  )
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


在 2026/6/1 7:54, Jason Gunthorpe 写道:
> On Sun, May 31, 2026 at 05:36:31PM +0800, Guanghui Feng wrote:
>> @@ -159,45 +164,51 @@ static __always_inline int __do_iova_to_phys(struct pt_range *range, void *arg,
>>   	case PT_ENTRY_TABLE:
>>   		return pt_descend(&pts, arg, descend_fn);
>>   	case PT_ENTRY_OA:
>> -		*res = pt_entry_oa_exact(&pts);
>> +		data->phys = pt_entry_oa_exact(&pts);
>> +		data->length = BIT(pt_entry_oa_lg2sz(&pts));
> BIT is the wrong function, it uses the wrong type. log2_to_int() is
> type'd properly

Yes, log2_to_int should be used.

> This also needs to keep walking and accumulating length for
> consecutive PTEs until it reaches a non-contiguity.
>
> The other drivers don't need to have that complexity.

Yes

> Jason

