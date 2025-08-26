Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08989CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNuw2smkSUbseMqhQYhMnAKOM3W6MRvMOpj1QgvkS8w=; b=Ywu66iMBK/vLAu4+0UdAVQ48x1
	Bb+P72MoGbDBCzrPozdVOynFzgdks9S6985dQmAm44O5ZtNOf8K19qnH6sKmctBTkTZWSEpfC4VV3
	WE6k+Cc9wdrHAVPslHqyRg8RXHHMHg2yBnD1AU0AWcSYIjY1MygDKLCxd5U50sZuWipSM+r5lOgmx
	lUT3daKtsf7q2lgH4tsv2jY5h1t9RFrbAsdGL81X2ctjC3j1aWLMowV50m2GRAnYmKnJesxcrtYiL
	RKsZQP8eV9oMct/rWcqYSULNq4flYopEe7K3ox8iVp7yVcjP1KVaLlEx7LKtxPFqawTWgqJ2mZP2s
	I0U4aKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtyy-0000000C8nE-0XHQ;
	Tue, 26 Aug 2025 13:45:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtVm-0000000C41H-0cV5;
	Tue, 26 Aug 2025 13:14:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756214076; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SzFR1y2hQifrr1QcPR5WzrWPvb1o9u/qCP/XFXoSQ0eixqkF4WfPknRj4noSB+VIYxrwBu/+gAQLGHH3d5enRKgIEcYRWmoDBQtMkzwLYsSACjPRzAc3nwvfPio7lXuCRjDefXNdwAxE6lp1oE7yVo0iI7lQx/lnsYIdCgLabPw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756214076; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WNuw2smkSUbseMqhQYhMnAKOM3W6MRvMOpj1QgvkS8w=; 
	b=JnPShJ/oLY3hwO01CreDYBXMbChk11ZYRhdeoShjQAd+WV2IRdfwZsiwVJphqMa068f5Np9AkgkAiE3sfs60mSLNHkG8PXLSJc9JA9ADF48ohhiRciWn2WnALv4x7s1bJmrLEdAc0k/CbDIXOJoqpUlLbTulWz1CLagQAYRtlk0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756214076;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WNuw2smkSUbseMqhQYhMnAKOM3W6MRvMOpj1QgvkS8w=;
	b=Vn5AcRhuGSt2DFamCzGpSUHNC/sEkT8T+X90OV2ajvTRiXEQZlJ2uBTzMl1cZLkY
	8REbeo8r1FHpwGjvvKUw7Ibd/uoePOjBTwfTSB6YfpMVT2m8VKXcETlUALaUlHcuRRD
	NDdFupVdVqUxPssNPoMBayroq0UMTgLmtRVwFX2o=
Received: by mx.zohomail.com with SMTPS id 1756214074471159.25951317157126;
	Tue, 26 Aug 2025 06:14:34 -0700 (PDT)
Message-ID: <f2f09c95-1d08-43db-aee0-25cdaaf8dbca@collabora.com>
Date: Tue, 26 Aug 2025 15:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
 mchehab@kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
 <20250825170531.GA1899851@ziepe.ca>
 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
 <20250825183122.GB1899851@ziepe.ca>
 <441df5ff-8ed4-45ed-8a52-b542c6e7d38c@collabora.com>
 <20250826124155.GD1899851@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250826124155.GD1899851@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_061454_263034_624BFDDC 
X-CRM114-Status: GOOD (  18.38  )
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


Le 26/08/2025 à 14:41, Jason Gunthorpe a écrit :
> On Tue, Aug 26, 2025 at 11:52:37AM +0200, Benjamin Gaignard wrote:
>> Le 25/08/2025 à 20:31, Jason Gunthorpe a écrit :
>>> On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:
>>>
>>>> Jason, the point is that the iommu and the VPU are not separate devices, which
>>>> comes with side effects. On RKVDec side, the iommu configuration get resets
>>>> whenever a decoding error leads to a VPU "self reset". I can't remember who from
>>>> the iommu subsystem suggested that, but the empty domain method was agreed to be
>>> IDK, that seems really goofy too me an defiantly needs to be
>>> extensively documented this is restoring the default with some lore
>>> link of the original suggestion.
>>>
>>>> the least invasive way to workaround that issue. I believe Detlev tried multiple
>>>> time to add APIs for that before the discussion lead to this path.
>>> You mean this:
>>>
>>> https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.casanova@collabora.com/
>>>
>>> Which came back with the same remark I would give:
>>>
>>>    Please have some kind of proper reset notifier mechanism - in fact
>>>    with runtime PM could you not already invoke a suspend/resume cycle
>>>    via the device links?
>> when doing parallel decode suspend/resume are not invoked.
> It was a proposal for an error recovery path.
>
>>> Or another reasonable option:
>>>
>>>     Or at worst just export a public interface for the other driver to
>>>     invoke rk_iommu_resume() directly.
>>>
>>> Sigh.
>> An other solution which is working is to call iommu_flush_iotlb_all()
>> before decoding each frame.
> That was already proposed and shot down, it makes no sense at all use
> to use flushing to reset the registers because the HW weirdly lost
> them, and flushing should never happen outside mapping contexts.
>
> If the HW is really resetting the iommu registers after every frame
> that is really just painfully broken, and makes me wonder if it really
> should be an iommu subsystem driver at all if it is so tightly coupled
> to the computing HW. :\
>
> Like we wouldn't try to put a GPU MMU into the iommu subsystem though
> they do fairly similar things.

I will add vsi_iommu_restore_ctx() function where all locks will be
managed and call vsi_iommu_enable(). Decoder driver will call this function
before each frame.
I think it similar to some omap iommu code I have found.

Regards,
Benjamin

> Jason
>

