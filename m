Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2690BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TorOeLYGo8DxParn34xnnfB8pnXI12Opq9BZvAUKlQQ=; b=znYS5IqPvaCLljxnIYuh0VLnf3
	nFIjM3YCiOCLubM2KtDCK6NTAH8g5+CHl3CXZuTeKR1NAyxbfczoSXtaj9UV6xL7KK8vmthhUqysc
	4SRK2C+BWHJX2Z8v4zo23htjoc9pjUTCbLXcsVWo9GjGH0ZVNvYHp3CDdpY/RHIbxSXGVRk4/jONs
	L91XSSQ9L/ojIqj52QO5eDnOiVQmImIBNQ/lOw+gqDzH/0Y6zu4SGRibv9cjTHDBtcni5bQ78zPwh
	2p6j7GBrmZEJUqczVKQqjv6KsXJrp7SOfe62iQsrqebzVhs6weM/CVzqHVWkoITf5m3a/U3R7NyKg
	ww91jb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZr3-00000007zbb-0vjS;
	Tue, 17 Jun 2025 17:12:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYl9-00000007p24-0XYC;
	Tue, 17 Jun 2025 16:02:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750176100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mmO+Alr6kQQXRa0SJVWm+b4p0d0PO0kWFXmacsiV+zFpHlrkpTljUui27K7SbsVyZgK4xBfJ4OCyi3iwRj9kUhB5qC79j9nbvoM/2RX+/i58sFtPCHUCiX0u3xKGT8WIbUtW8ZCWip6ZB1XkD1YgYEdUQXFZfwOPXYU9lhmjflo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750176100; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TorOeLYGo8DxParn34xnnfB8pnXI12Opq9BZvAUKlQQ=; 
	b=aWh0O/5Tp5bLOSObnkuu0O1sB9gk6qA7kSaBWNOsuSyTbh3x+NecyXnJnmUEBgalYAjlcu3Uuz49nHTb4sw3bMi16+12UqfpW8NsQ5HesSJMlvU7r8S6UQfABdF358zNuu9WFbV5kRGcTnMBZqzJbJPXRtaaM5ExmbpCKPkxzAM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750176100;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TorOeLYGo8DxParn34xnnfB8pnXI12Opq9BZvAUKlQQ=;
	b=NuaGdrHJ97ZwgdVUJeSfzo9qAbE9wjsfOfrx9UNJAr8B6dPp/vpZcyAMuHn/kxU+
	/p5m4mr1GDQ3Xze8r1Oi4Taa18BZ89QToQy3oCelUgnt0PfJqr1ONqcr+9MSs4yRlud
	x36VTLbw3MZJVMXnA3CKGicFf24NRPHO/7xgsAbs=
Received: by mx.zohomail.com with SMTPS id 1750176095913785.9876014183155;
	Tue, 17 Jun 2025 09:01:35 -0700 (PDT)
Message-ID: <30a48107-8e98-42dd-a5a7-9c87c9eb538d@collabora.com>
Date: Tue, 17 Jun 2025 18:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: verisilicon: Flush IOMMU before decoding a
 frame
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-6-benjamin.gaignard@collabora.com>
 <20250617155822.GE1376515@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250617155822.GE1376515@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_090203_230565_8ED2B376 
X-CRM114-Status: GOOD (  13.95  )
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


Le 17/06/2025 à 17:58, Jason Gunthorpe a écrit :
> On Mon, Jun 16, 2025 at 04:55:53PM +0200, Benjamin Gaignard wrote:
>> Flush the IOMMU mapping before decoding a frame to ensure that all memory
>> translations are properly applied.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/platform/verisilicon/hantro_drv.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
> This is a really big red flag.
>
> iommu translations are supposed to be controlled by the iommu driver
> and should be flushed as part of the iommu map/unmap flows. It should
> never be necessary to do something like this.

I have redone tests without this patch and the decode is perform correctly.
I will drop it in the next version.
I think I have fix the reference frame management in the driver so it becomes
useless.

Benjamin

>
> Jason

