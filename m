Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+Vzn7s81LEOZ8ibIdNbFJmqX0SbVY2nkGqZXOOjSz0=; b=gvFmmsrrjBGX/TkSI+rDkHph0a
	lvmaMi55TIMVFftHvt/P0F7i5iahjneXyu2ZC8UDYwh/yzDzPl97mNBUHg6/eO3NdX5nfePExNDyj
	DsDZNEdiHWEP2rC3ttZ0fYCjF1wQvWpY/JcRyzCNp4TasO3XBcbuK2dF1/f7S5KnHGwpH4LRj4hkH
	VcIeX5KjRJlkYj6ilncXWCH1tErIq7OBkMkuWB6FK/k7sjuJOsa+T4GicbJ1qb9NZqKfdFP1rSocv
	14+Did/NPdEbWCEr6PTYt+ByK1eihHJ6IOCl6eP/auYFOLNHSX+4EV1lF+UibDaV5T5VJ2wakyUx0
	hsl4KvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqvg-0000000A0qB-0Yhv;
	Mon, 04 Aug 2025 08:52:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsv-00000009zbl-2aeV;
	Mon, 04 Aug 2025 08:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297372;
	bh=kEGNcRKii091OoZOGBge+aHBW6zYX0bGJrlr0K3nWNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lt4LunEh6xeDTdscoj61LEXgzFVU3LukujP6O2+cDi4VCjOw0rdF+GDsJzH5d2bQb
	 aE7xUdrIULgB6iNNO29i/cxHYGAmgmGfYaN63Z9iNvPKL0ZbDWxsCqcW0YKDaHvjQ0
	 UR4bwwwMmTR8P+eLFhATB7OsFEYn7fgcIDd8Ai9fMcDP2IUnd/CU0x5ZijxKdbwQlF
	 R6IZCSu5YEZERGMo6U8RghFdvshVOpcd4+UBSmGWEKPlQnINUcAqXBphTAMrqYwL7X
	 5KS3dLO0iT68XqpSUz2DuRlINkIBwPlkfgVR8/qtwG6XKRivHA7f/USgxeI9nryYmS
	 TDZzECPwqw4HQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB10D17E048E;
	Mon,  4 Aug 2025 10:49:31 +0200 (CEST)
Message-ID: <75a48820-a79d-41f3-9e96-b49332865eb0@collabora.com>
Date: Mon, 4 Aug 2025 10:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] pwm: mediatek: Convert to waveform API
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-18-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250725154506.2610172-18-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014934_329908_AFC90CBE 
X-CRM114-Status: UNSURE (   6.83  )
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

Il 25/07/25 17:45, Uwe Kleine-König ha scritto:
> Implement the new waveform callbacks which makes the usage of this
> hardware more flexible and allows to use it via the pwm character
> device.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



