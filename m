Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECDC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=; b=H9nIeEx6iwcJ7M2jY5VEgQGLNO
	08EWXqMXlz2SgD4k4PkoC6vOvSxeUpL0QXcEKCcyDXekMMZMZkeHQXoj5BMUu29Ak8Dbfwrd3ob4P
	k+Y39s6rx1vkKpkLzO4S7U0+n2heGGZKKkfHfb5KJZXs0tAK7qqugZqfOolwTg/ZKKIs2j3zG77au
	Nl6R7l+9kB9y8VTW/wuZ477WeGGM4ArlagQxvZdYrpkA7vovZ4nPDobaKEF8aJbKlWhWEM5m1S7V/
	agLBlsfSjmvf1MIzrP5WNjGls2mqtV7qpRVEpUsHXq/3+fWDUvQDyNqGy9haagxCJTaj5XYrzHYpM
	aD2wmTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JJl-0000000CX2K-2yRl;
	Thu, 17 Sep 2026 21:06:53 +0000
Received: from mail-oi2-x09.google.com ([2607:f8b0:4864:32::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JJg-0000000CX18-0nlo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:06:49 +0000
Received: by mail-oi2-x09.google.com with SMTP id 46e09a7af769-804795653f9so3143a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789679207; x=1790284007; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=XQBjpG2xlIw5XoJl+X3hppnP77QYyqPqGEP3jyZlfrep9FZ/gk/lnZq/uZzsm1FFxw
         LVlHC8Z7ntd53mEIZdl2fNWsmcDN/ZI1FLcIachwhZzR2xEIKTBYQsHUUmBfwCl1nAqi
         ad5AVo4wDYnhl5wPnFbXOOrelJsTMBbKc3bdydpUri4soslzuAGRToWwxYn8pgErVr/D
         Do2xV9RE9j+bLkG6BYif/5qkwFA2xpmHe8KdT0xuEQAQbFuZlXFhvF705pl3h15CrWD/
         LTy5uSX5DVZqLqbLO8rfW6e3PNzN5aZgYcwUrVyJbhnS/Hrrl557k+tPqfIhxKM3MTfN
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679207; x=1790284007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhGqQvEgqcceDfwacv9AFFFJVljDY2FHfHQZ/xmKpow=;
        b=N5i8BbvvVcucm67epshw74lmrWCnEJya8B/KnvmaGZO8vDF6KYtUKZISNWNCs0m/HC
         YhD9VSZM9axwrwO3uVXKoNCwdXxJqmlEy5G/hcPdidYuJH937hGilPgFTv0V6vI4NfeP
         n+td8OmUHxi7/+OPmWuGkbztTYlCFYhF4EO1rdg/1ObgSZjG+Ax+qVCtgwDM2uT0HAaS
         6SACUxA4p+QL59rYJHvWumbFiq8tZmCTgJAqgU7o7Iv3ubmiWKCfXyKU+zjXnGx82v7u
         7FkvRqXVzMF8SKztqryLm9/07qFOZ8leajzBJu3NJx3K9U2XgzEw7RtuO/jJFNB0sFuA
         s61Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPnZzWiAF3BNJS2zkqMz1VEAnt+7cpAle1L7TaQ7xy9OPvRcHnSf5Mxf7B+8TbTYly8rzTvU7Fn9lB6kjDIcuo@lists.infradead.org
X-Gm-Message-State: AFuF++k8MMe+9ajNpezI7duiwnPcVE33vhyJuil51DQWN2sMISFPCWaT
	igE4GZ3t1h+M3ICwq5q4aoPUYJuiyAhRvkRu72oG733QTzO0RXjruTgK
X-Gm-Gg: AYBFou3RsxDOQMcDWz7Qvdv/Efy489nWBZP2U7/1ua60oB98Tmo/uQiJgre4mpgwbjo
	Q9L/hg9eNjBbjrbs1/Rr54U2QcqJRfqsxJwMuby/DyaojDsCDY3YP4LR8kmECHJEpFq0YK8jQDP
	IcUvblRLdmEuQUGsJGEFqFxMAyymU6AarcGDmS0zLC/O6nl9TWXZCXwZefZF6ABYjtp54rvtUDh
	t3dSptXfdie8DZNFuvo+DeBpDFhsw3Qf19oRmr+g7jyLD/1h0JxwkSTg77jh8eVsdHQ9Ju9bj9s
	8e2M05SSqZI4RQQRS9FU0GNJ1Q2xuxKFwU9WGtlc+ZMOaBnRJuPe1+ZZylHNvSG9/BLIM00gF8S
	JgoKqrv5QRX4izisvSljET4AheBbiE/QXsELp/lsyPEtvVvC8XoqYRZr3jBVgRh5juYTuWZpGdp
	iFr1KpBA9sSoHmKJ5lybW8xbG9RpAEoW646enn1Q+/QLG0xqJl0UGGm+p2bieuw35UG4bMIXTaD
	MfgMK5nVRBAGd8=
X-Received: by 2002:a05:6808:c175:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4ccf6a67699mr616748b6e.5.1789679207257;
        Thu, 17 Sep 2026 14:06:47 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6cd41d0asm3431836b6e.10.2026.09.17.14.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 14:06:45 -0700 (PDT)
Message-ID: <bc93ea43-0650-4a3f-919d-6e0272d24073@gmail.com>
Date: Thu, 17 Sep 2026 16:06:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
From: Ryan Brue <ryanbrue.dev@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
 <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
 <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Language: en-US
In-Reply-To: <71a6ed12-f089-404a-85ec-546e03b4db3e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140648_236113_91A1E753 
X-CRM114-Status: UNSURE (   7.73  )
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

On 9/17/26 4:01 PM, Ryan Brue wrote:
> On 9/16/26 4:55 AM, Andy Shevchenko wrote:
>> Why not add this device support into that driver?
> Please see [1].
>
My apologies for double-replying, I forgot my link here.

[1] 
https://lore.kernel.org/all/2d1b80f2-53f6-4ed6-81bf-e35c0a9efb26@gmail.com/

Best regards,
Ryan

