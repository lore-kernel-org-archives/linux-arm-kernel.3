Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE80ACCF2DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsuevJkgsl5C8dp30TcVS68HeqiqukUtd3I4/TFexqc=; b=VwwFPBa2LJ3afRCdqEeRPeIZbl
	fT2K26KWdBFidwitfliS+L9QsXfF7bYx2E9hD3QHsad6rRSvTJBv4p9iGz+Xs2OCXxy2xs1x6HHIR
	IxcrFSFB4DIBDCDKzJ0cL5XZYCb3j8TS1fdQds5jl7Ph3E9wZsfz9raNrcWL5SeS117cjZbWAJJPh
	x+6a9lIxdPeCpO0UmPxl+Mczx2qXbhmRmHUNiitTLh5I1m6HdBMgOJn1mdwYA8cKW9Gw9GNoDuCzf
	GYLN68XYvtjwrkR4/ken5OzI+F0ExoAH4oofgY7wahmrWdmnL42Qe154sC1Bu9Wn/GgLCsRx17xx0
	pgb47Ybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmUs-00000001m60-3SEh;
	Mon, 19 Jan 2026 10:28:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmUq-00000001m5X-1Mnl;
	Mon, 19 Jan 2026 10:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768818497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c2+Oc9wLMk54ge9fXvqUDFJyAAT7ec7rGEzKziR5QaN+z1z+rYOLC4VTelqvmOGmxAWYdKRr6O6s6MNKpwLXDhlL5lcGObgtP0rdHil9Vb0BGdsnIs4YglM6IDmVEaxWfWUQUdSpnEvc+N1CvCq+b7wf0NJz67YVdzuQZegORwk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768818497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EsuevJkgsl5C8dp30TcVS68HeqiqukUtd3I4/TFexqc=; 
	b=PCpgNlj7n6I5+jp2Tf7Tr7dHfDi1tCAjsYDvdzMx5yFgbzZX6WT/h8sBwDUjW/hCqwYF0Ev65ozoN4kome1DuU0c3HYx8O/Q3KClOtdpMKpcdvH15iWcsAngNGweP3xIAGbiJSVfDmHKROVyhsDbXAFuGlYofF0jcARnDjD9J1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768818497;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EsuevJkgsl5C8dp30TcVS68HeqiqukUtd3I4/TFexqc=;
	b=IzMYIQ9xcILSyPL5IEgFBFGVo7j1D7ZBB9+pLkD8TJou1OhxL5m2aeY0mUG8sBsv
	Wv1ahwlZ/JxKsdyJ4LI5HiTSJL64r53/U8Kqgk1RJy/0aMnZ+lBkwQr9s8a6uXe7Fe1
	Ncr7UNildBZ9+LxfW3aXn6Ywt29jhDAL6JPF1W+g=
Received: by mx.zohomail.com with SMTPS id 1768818497079716.4924558723245;
	Mon, 19 Jan 2026 02:28:17 -0800 (PST)
Message-ID: <d81c0f26-ab36-42a9-bc40-b9767aea038a@collabora.com>
Date: Mon, 19 Jan 2026 11:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, kernel@collabora.com
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_022832_424923_03159957 
X-CRM114-Status: GOOD (  15.66  )
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


Le 18/01/2026 à 10:41, Jörg Rödel a écrit :
> Benjamin,
>
> On Tue, Jan 13, 2026 at 04:10:51PM +0000, Will Deacon wrote:
>> I took another look at this to see whether it had changed significantly
>> from v6 when compared to the rockchip driver. Sadly, they still look
>> very similar to me and I continue to suspect that the hardware is a
>> derivative. I really don't understand why having a shared implementation
>> of the default domain ops is difficult or controversial. Have you tried
>> to write it?
> When updating for v12, can you please put an explanatory comment at the top of
> the file explaining the relationship of the IP this driver is for to the
> RockChip IOMMU and the rationale for having it as a separate driver? I want
> this part of the discussion documented in the code in case it comes up again.

Does the follow wording summarize the situation correctly for you if I put it
in header comment ?

  * This hardware block is using a 2 pages tables allocation structure.
  * That make very similar to Rockhip iommu hardware blocks but it has
  * it own driver because the registers offset and configuration bits
  * are completely different. An additional raison is that this hardware
  * has been developped by Verisilicon to be used by their hardware video
  * decoders and for a general purpose like Rockchip iommus.

Regards,
Benjamin

>
>
> -Joerg
>

