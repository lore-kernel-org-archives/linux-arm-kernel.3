Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54C0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6Q7Y3E1cI9YU4bN/X3ZlCOSutz2V8wdoXek4KPsGKk=; b=FAZCo3E7dJorcQKcNU5TzBrMIv
	2W3pKnlqveiCFXD8ze2mQrN37Xx5nCqiea6qcBBO+GJNo6EgFyz6ps3LjvCSv6J29gzvLJ+Kxd+cz
	CYziZhX6Eteye9UU46ZOIh18Mg0X7O9XyFn+2bEixgZtkHc+Mw4vDdR6lLzub/ZznioPVPIGtY6bg
	b47oj8BPHb/K4X5kAX0k36cyTPXRviekvvnKPSdBG68p5BcmPO4lmRlVleLJGpS9DRXFmf+xEqlTm
	tpTMbin6KcGeXW+AvufEwZB0FcxqDhpPVgudQ7sZneacvoEdCmakbyLK2KJQ3svTR6WF/oTXeMM0x
	5Xiat8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr8l-0000000Becl-2rRc;
	Tue, 26 Aug 2025 10:42:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqMT-0000000BVK9-1RtC;
	Tue, 26 Aug 2025 09:53:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756201964; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JqdDCyoBRzA1ioGUjwKcsJArCawzPxSOe3thrDi9ZwZgHt0F9QAZqRvQAfV4esQt0ZAZYxZfIwKBbLA7wAN7myHdr64ix7uqfJlkTjg6/8Z8geKK3qdsikhHWjXZdkwx8jcP4HmdM2znP3ZrQ+jGvAhdUK+s1kfc3IWXPCcePq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756201964; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o6Q7Y3E1cI9YU4bN/X3ZlCOSutz2V8wdoXek4KPsGKk=; 
	b=O5Q+G54QW5RkzHJ6dJtSKoVoOCfSKVlAW+tfDEe6CjrFcIrolaNLgkVVGVlXU6YMb0lZSSUL6jajqZN74bUUXUQxUpjgSKaIRLRnXOs2Ay78qz2buhWoyqtXUub8H+w1BJW0kL0ivqY6GnMj28JhPGSLhMYnqndGs68QaJt0/+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756201964;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=o6Q7Y3E1cI9YU4bN/X3ZlCOSutz2V8wdoXek4KPsGKk=;
	b=AG9TH54nMsGLH+Z0Jeu4Bj4Bk9uWmYiW+eIryri/67U8aGWVludige0cAmHf5BUe
	4Vr+Dy3eHegOxtOfj19PKtaH4dbpV48j5LWWIqE/K6aTrdSqjS2YOyqGTZ07W7EP8bU
	O8Mw0wN5T1Ut623zh1GF4mD75RQRZ9MxZIZT209w=
Received: by mx.zohomail.com with SMTPS id 1756201961981405.52754025942295;
	Tue, 26 Aug 2025 02:52:41 -0700 (PDT)
Message-ID: <441df5ff-8ed4-45ed-8a52-b542c6e7d38c@collabora.com>
Date: Tue, 26 Aug 2025 11:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-media@vger.kernel.org
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
 <20250825170531.GA1899851@ziepe.ca>
 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
 <20250825183122.GB1899851@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250825183122.GB1899851@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025305_476840_CB30EA0E 
X-CRM114-Status: GOOD (  16.90  )
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


Le 25/08/2025 à 20:31, Jason Gunthorpe a écrit :
> On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:
>
>> Jason, the point is that the iommu and the VPU are not separate devices, which
>> comes with side effects. On RKVDec side, the iommu configuration get resets
>> whenever a decoding error leads to a VPU "self reset". I can't remember who from
>> the iommu subsystem suggested that, but the empty domain method was agreed to be
> IDK, that seems really goofy too me an defiantly needs to be
> extensively documented this is restoring the default with some lore
> link of the original suggestion.
>
>> the least invasive way to workaround that issue. I believe Detlev tried multiple
>> time to add APIs for that before the discussion lead to this path.
> You mean this:
>
> https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.casanova@collabora.com/
>
> Which came back with the same remark I would give:
>
>   Please have some kind of proper reset notifier mechanism - in fact
>   with runtime PM could you not already invoke a suspend/resume cycle
>   via the device links?

when doing parallel decode suspend/resume are not invoked.

>
> Or another reasonable option:
>
>    Or at worst just export a public interface for the other driver to
>    invoke rk_iommu_resume() directly.
>
> Sigh.

An other solution which is working is to call iommu_flush_iotlb_all()
before decoding each frame.
It doesn't require to allocate a domain per decoding context.
Does that sound as a better solution ?

Benjamin

>
>> Benjamin, please improve the naming, comment and description, I agree with Jason
>> its not completely clear. I'm also surprised that you do that every frame, seems
>> excessive.
> Indeed if it is just error recovery.
>
>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff8c5622f9f7c644e995d013af320b59e4d61b93
> This is already merged? And now you want two copies of this? I think
> this is a very poor direction..
>
> Jason
>

