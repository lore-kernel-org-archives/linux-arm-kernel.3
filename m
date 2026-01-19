Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3003CA5FFB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRVp7dUbSthmOrlglJ6TGdqGPUk+uDvjIluK+KIJt6U=; b=3q0701Upo6TnKQX0pUEHDBVIaY
	hbZJVIiSpRisSd0OKgW+Kuz/e5uN0LF9ATWC/3zkzhFRhb7ipAd2sYjb3jCpjqFYvORKoGwTe1/Ps
	bmiIJF9LgsDFYUYGgi+sxMZVREYHJEiE+Oa2Qr0+Hof7Mw7fcjrKJv4e7M0WSf22Htyv8fL4AubZQ
	uSPa5GQ5PFXlm3Xa2J2b7xUcYs5rj8oKegS4uRwecjokxPer30l+nae3+TmILtMSdKn3sweeycGxN
	n6QXcNVpsd+XExeTACTEmon/KtZkf8alYvreWIf7H2JTtdGbcEUBBxQQq/mMaibXjh5cJF2m6sn5K
	QCzixAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhk3k-00000001WWp-3iLW;
	Mon, 19 Jan 2026 07:52:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhk3i-00000001WWO-24Vh;
	Mon, 19 Jan 2026 07:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768809116; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mzO0Shua/4atpUZeelS+ZQgvhxd/sOj/CdGT2JvtNeMdrVbhkDqiCS9/tV7FnuOgtAzsXgyTW6M+6SNLwsDsYzWs40xNLw32yj/UTaxF4oZ1vAkndP2vw1tPY7HYFoRntFpdk+Dc1ozUeSOyAbUUqDa14TNU1nR+g4DTDNJSJRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768809116; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sRVp7dUbSthmOrlglJ6TGdqGPUk+uDvjIluK+KIJt6U=; 
	b=Hg/H46awInmh+1qx1wTLEihLOvryH7prxxthG9krTpP3W0tQSKdVc7E6BYEUNGCMzGkQghlgShPPLUzjz1/Ne+k8E+x32Yeev159MNkb8bGycTxgxCrfIHr7IF4AnoFDVKeJCKubc+sPePuqGbupQKROO4PorFB52mtssMAiJgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768809116;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sRVp7dUbSthmOrlglJ6TGdqGPUk+uDvjIluK+KIJt6U=;
	b=LZ53M/g2B/lEi3Cw4XEq9FXGeHNwxs2mhesW0QOopdjdonaDtdoNwyxYVDQyoI0b
	6BP6qBItIYHg9DTgr4WdGf/GFsAmbWXc7txbco0MHXDt7+DZQ95SrCATlZE4vgGrA01
	CUZRUw3KPoT6CERFiPBpj2qltx4GApoQblEaUIRU=
Received: by mx.zohomail.com with SMTPS id 1768809113865738.6117525224621;
	Sun, 18 Jan 2026 23:51:53 -0800 (PST)
Message-ID: <1030ddab-6124-414d-958f-c461c19bdbb0@collabora.com>
Date: Mon, 19 Jan 2026 08:51:46 +0100
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
X-CRM114-CacheID: sfid-20260118_235222_606569_C879FA17 
X-CRM114-Status: GOOD (  13.05  )
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

I have already send v12 where I have removed the useless function.

Regards,
Benjamin

>
>
> -Joerg
>

