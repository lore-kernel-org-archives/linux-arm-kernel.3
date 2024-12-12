Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA93DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBCtB4P7LoVsX+UGrbBFWgz4hUvi2N2icOGRXyods1c=; b=z8ls0Z/Lu045KPyR98f+hu8pBl
	U17FA2+jk/u5Awt3ydKnmH4YfSwgqa4fBJVmwq9wfG0BiOUJAtx19B2EQHLv0Z5eVk4xObc3I0g2Z
	UonHDDSlZFY4FohzYfNOno0g6nCzsWpgwzSEMCPlyhpmCQscjDPcZjBPUbBq6U2ZxrpTtTUP86qEV
	CHeuHhI+PlVUlaJWhG2Q6Z4J2xnXZcIleA5mLvekDfvwuMFE8zb2LN132yWcNq1m3ym4qKzTBISVN
	n5e0aFuSep0OrvksZW6gtplxu25+/Cc7z6RPPYSDQSdpRlojmRkPjm6vwK5HEGoBUzUeogakjM8IC
	McTwS40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmjo-000000018E6-428e;
	Thu, 12 Dec 2024 17:12:32 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlqb-00000000vZL-0QAT;
	Thu, 12 Dec 2024 16:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1734020117; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nFIkIZJ1xuLhG7CnV7y/LlyF7GMO4DNKYynUuDDfONJ9IJ/6c+vLKjieOSVWF2MEyhdi36wNFpuHUWzE6/Jd5Ow1DDEUVhLGM+EIG4tYMSpLYAgekkJy91EIknKTvNPIqJhzxWqmjKO6Ns6rqBLgg/xTG/qCWUXUYKKK0w1vJqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734020117; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PBCtB4P7LoVsX+UGrbBFWgz4hUvi2N2icOGRXyods1c=; 
	b=D3EwNniM2uODf0UlYsxmeJoz5wZstD1V5P9/VWDm8fwnImRVr9FbdlONAO7bSWeOlw2KNZNIg7A9GhmecqhryYamQTVgVmJk46j51nI0+gr5GBhawmwwYa5yOxOOfl0Y+DHGitxF9MqpYS6Vg50X6k+nf89CZS1x3z5IC72Pb+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734020117;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PBCtB4P7LoVsX+UGrbBFWgz4hUvi2N2icOGRXyods1c=;
	b=R3TgZfLusnXNGOwnGXLv3tZEKdrfCkswpUKAUHr2kRAxHcU6ZcG0YTqR1hkLY9Vl
	UDFK3dWbQZZy+kUHhKocKBZcAnpDtMkNc0C7jRavwZp8UCv6sXHqrTwgc87sUGaqj9e
	P65sFgEsSoMlRX7NYmIBLHqUlOGQjxdXmsFAaIzo=
Received: by mx.zohomail.com with SMTPS id 17340201149634.725551844082247;
	Thu, 12 Dec 2024 08:15:14 -0800 (PST)
Message-ID: <21db56f1-ee5d-4309-8fa6-5aaf92782885@collabora.com>
Date: Thu, 12 Dec 2024 17:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
To: Fabio Estevam <festevam@gmail.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
 <CAOMZO5DgW3YrpMJPCTzQ-LZCopB4tNPoJhyFQrr6RBvbnBu4VA@mail.gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <CAOMZO5DgW3YrpMJPCTzQ-LZCopB4tNPoJhyFQrr6RBvbnBu4VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081529_205172_F50896F4 
X-CRM114-Status: UNSURE (   9.81  )
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


Le 12/12/2024 à 17:10, Fabio Estevam a écrit :
> On Thu, Dec 12, 2024 at 12:43 PM Benjamin Gaignard
> <benjamin.gaignard@collabora.com> wrote:
>> Hantro hardware is splited into two parts: the decoder which produce
>> tiled pixels formats and the post-processor which produce raster pixels
>> formats.
>> When post-processor is used the selected pixels format may not have the
>> some padding/stride than the decoder output pixels format. This led to
>> miscomputing chroma and motion vectors offsets so data are overlapping.
>> This series introduce a reference pixels format that decoder use to
>> compute the various needed offsets and size.
>>
>> With this series Fluster for VP9 tests is now 207/305 vs 145/305.
>> HEVC test score isn't impacted by these patches (still 141/147).
>>
>> Version 2:
>> - rebased on top of media-commiter/next
>> - Add reviewed-by tags
>>
>> Benjamin Gaignard (2):
>>    media: verisilicon: Store reference frames pixels format
>>    media: verisilicon: Fix IMX8 native pixels format steps values
> Do both patches deserve a Fixes tag?

There is dependency in around hevc compress feature in post-proc code.
I don't think it could be applied on stable kernel


