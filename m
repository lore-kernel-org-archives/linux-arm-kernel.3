Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0254E81A36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTKzSo0m4MUPpEAgib4DKtRAuR0nDfthFRJAVbg5eIQ=; b=aBAsa86LM7rE+mRc4yVkPoigjk
	YU28HAQ6Sy55UI+SeLVxV1SNKkpPWk/3vATJZp9D1m3FNd52avIToD8g4ikf+wbVQvfgbUKuq0Egs
	u4DE7FW/vexxOAo9v+2Husb7ATdoGeO2TdNI9/93SZpWpyOVo03M4ZNm+AdOjlT0KajPJcH3XVKyd
	7+i6bVzQlOIHaiYxinvbh6tJrBlgv4kEgbAMYebNdOr8FtSYmm5giIRyG6yZTERh8HFoyEXTVj33u
	+3qBRIKVuZz5XRFTRkxW8D23mEdQcJPq+krf6vUQS0LU0zWGlU+zJw0twO6nQ32e3HBqaJ1U/IEjT
	qJFX+Ygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0Yh-00000006u4m-1kE7;
	Mon, 16 Feb 2026 15:30:47 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0Yf-00000006u4J-1ok1;
	Mon, 16 Feb 2026 15:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771255838; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TvcWoI1Uy75QsBx2SWl+GJ7QfpFv3dQVyYATezKi9ECZSn1FJE8BRIbEjrm2sye70WTW3Cj08vlCoUgdiugN4I9V144gbgxWRkC1KGP9lX629DEkHxAn0//ryMSghYVshYKeiBedDzZxt3o+uCzJ9AEBb3EWfUJSFPgbyNuw1N8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771255838; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xTKzSo0m4MUPpEAgib4DKtRAuR0nDfthFRJAVbg5eIQ=; 
	b=g5+0CSpTrkqKwti0l+aGUjKhbJI44WlzDyAlYW4koe+v4TyIVlBoGGD8DjBQYzXAW/7Wyn86wiFxpNnvz6OFfgid6zaGrNqbxGO+UJHTO0qpMakyqLnkpmNJPYuDhUgnOZ5SvFvywcHeeNWnH/lslrl50k86J/hKRHkq8jycfJM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771255838;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xTKzSo0m4MUPpEAgib4DKtRAuR0nDfthFRJAVbg5eIQ=;
	b=ajPNtAFwzTNbO+oplWBn2oy1PNrd4ALkhk/OBecJl3vOoEQ8oCF604lbpUNrpoTB
	OkjCsG4jP4STtkPOYROnFWVvu4KKVV8wSOvzU0DHzKnLLnuPDxHgDKB2vUhj+LW2VTf
	DdQxj3Qu30YOV1l5grp3w7bkOsxymvq34uZBg3tk=
Received: by mx.zohomail.com with SMTPS id 1771255836497792.8581418577553;
	Mon, 16 Feb 2026 07:30:36 -0800 (PST)
Message-ID: <16e32780-07bb-42c9-a5c8-aa61f2366efa@collabora.com>
Date: Mon, 16 Feb 2026 16:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
References: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
 <20260216095144.107356-7-benjamin.gaignard@collabora.com>
 <07b62f39-d27b-4439-a60e-42fd47f49b13@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v13 6/6] arm64: defconfig: enable Verisilicon IOMMU for
 Rockchip RK3588
In-Reply-To: <07b62f39-d27b-4439-a60e-42fd47f49b13@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_073045_515356_70FF192E 
X-CRM114-Status: GOOD (  10.04  )
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


Le 16/02/2026 à 16:16, Krzysztof Kozlowski a écrit :
> On 16/02/2026 10:51, Benjamin Gaignard wrote:
>> Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
>> This hardware block could be found in Radxa Rock 5B board.
> I could not find such board. I even git grepped for some variants... It
> seems you are adding it earlier to a known DTSI, so it will reach some
> board, so the point is to use here REAL name of the board we do support.

Any rk3558 based board have this hardware block
and arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts describes Radxa Rock 5B board.

But maybe I miss understood your point ?

Regards,
Benjamin

>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
> Best regards,
> Krzysztof
>

