Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F9CCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 10:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn3Jicl8olp9EaV0TqV4EBh3aYu+CRSHNFNRqLFHCz8=; b=F/Gkh6VPiX1DIi9onW0MmCOglC
	SsB/20WTobNtHTMDEV4TS+eGfZx1LW3EVVFaWQZE7eEw8Lkn2cWtaMeJBltzHXFxnL3vs0b+yl5tQ
	O78UQQ8qYpb/eJJCPDT8VjSuFLe6CMwXgsz+U+stagomRKwmENGfChcsKPe8tuZmqu5vlIptuJ/l2
	BrH3Y1qFGT3CzqkWqWwBbXGnAElHyW++kASKSUnCqV1S+f70a15LTh28Q15T0jDYOwHb3f0ocyDHL
	cUuZ6vRs9zHtTWk41KfQCxHZT9fLXFCpkaD8RLJbGGobyfm/3Lz3EbpUGEfR/K7OoHnJFrw7WJznA
	2sC33U4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqr8m-0000000BedL-2o35;
	Tue, 26 Aug 2025 10:43:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqMw-0000000BVQg-3vk9;
	Tue, 26 Aug 2025 09:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756201998; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X3ygrqwUSuwx6dHiIGUQtLF1gLG8fJGjuWMLZdLv54TwSfNdJyatQRzdOHwg8IQikXjAJdmXu2WqkEn1IZA+JnLYycuq0OynB3qzLDRc/t+X2pFpIXOAoF83H/2ieIJGXBdX72EbHm5guOqMpviXNO6BK2zU/9ELbPeEe1pyi8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756201998; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dn3Jicl8olp9EaV0TqV4EBh3aYu+CRSHNFNRqLFHCz8=; 
	b=NNnul6sK8D5SZXlwiOdk2Vo/2XiikXGdpMcK9jsQfThAUe78IoXcAFVswPcuX+vbd0O9b8k1xcXw9CWCkqJJOToJEBtxKviFge/LuvSpwCiMFXLX/qyCGA197jrsGey/MA0nAlXGlfdUpkFyJZl4oIsTvELgk4TJxsQ0gL4zcO0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756201998;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Dn3Jicl8olp9EaV0TqV4EBh3aYu+CRSHNFNRqLFHCz8=;
	b=fTL3GjBlvFAwIZNuysAvG47xhYwqyFQ1DdN7snGwnhGRKREejSWnp4NRUPxtrwC6
	7KTnFtpqBWhvVmVvz9hhmlF9hthuyMPDQnpDX8hY9cHYPtjGfr/N9OtCOEWjRm7ofmj
	0uUOyEhks8tNqzhWrXXScbIoOhM0h8Z4Ci6OCW18=
Received: by mx.zohomail.com with SMTPS id 1756201996213653.2470978174058;
	Tue, 26 Aug 2025 02:53:16 -0700 (PDT)
Message-ID: <002f164b-4296-428b-95ec-1ca10b979070@collabora.com>
Date: Tue, 26 Aug 2025 11:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: defconfig: enable Verisilicon IOMMU
To: Krzysztof Kozlowski <krzk@kernel.org>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 jgg@ziepe.ca, p.zabel@pengutronix.de, mchehab@kernel.org
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-7-benjamin.gaignard@collabora.com>
 <b7869ddb-f44b-4d1f-a6c3-393a28d3cb00@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <b7869ddb-f44b-4d1f-a6c3-393a28d3cb00@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025335_036048_7E83BE61 
X-CRM114-Status: UNSURE (   7.33  )
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


Le 26/08/2025 à 10:25, Krzysztof Kozlowski a écrit :
> On 25/08/2025 17:34, Benjamin Gaignard wrote:
>> Enable Verisilicon IOMMU used by RK3588 AV1 hardware codec.
> Qualcomm RK3588? This is defconfig for all platforms, so be specific
> which board uses it.

It is for rockchip rk3588 SoC.

Regards,
Benjamin

>
>
>
> Best regards,
> Krzysztof
>

