Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E79C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rORRiKiB+EWx7YOSIrm73ZvW7REO/WRMYpnQsWCiEiI=; b=bzMLijNYcE+oqkh/HjkpzwX2jk
	SpnNGxhHljS2+dqerdao3Zl2mLFdul8JmDYfV5pmkf4YHLoNq/4SqsKx/q7S6PnL5+ZQm6XRDNXgP
	GO3i6j2xKP5o+KsoRhfX/gbr8v9hhYse1+TdwuS+t2VCEzo/+SV/hOMcxSvogCh55KidUzNKMvfo6
	EefjsVzfTyKhB5IGtNxafpN6ijuvI416UePIGQm46cN/OJn8BiU+pyBcWvvhg73j7gaWgCs6TE8dr
	V95+H2ob8Dw1eopwR2ePpHFNaO69qCuzg9HwU/IGHPlSJ5oL63ZOQ+ziZ8pPi94nxJPFfGwHlAq8p
	gdUMApHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcwQ-000000024as-2xYq;
	Mon, 23 Jun 2025 08:54:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTce8-0000000216a-0z4l;
	Mon, 23 Jun 2025 08:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667718;
	bh=8cvOVWSgYMO57JWfjmueorCmKRsqrIQ8/Cmhi4HtF1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E24sWwndWIspXU3CJ0hu9uoYozOk+07HfBHNlezTZWrIGLDpCS+U3L/0SWBWMu7Zn
	 HMvdW/2dh8su1Pj47sU2jO7I8HXCimhlWcK2mDX8N3GadsrpJ0Kz0MFRJxbJMOF4o8
	 YuMenUinXVd6fhaE1WGh84X/UAecbfFI6GU16uWIT2DxFjXybBcG52eBZDuRQgvH4r
	 kVkhMZ3nBNlSrKPuB7CkxXEUHGAnf1NdJeHia6rWMv7/TJ82lAUYkPiZsE22pHZVu9
	 rchFTRoZgTVQgECGmwxVa9pC+61cTv0xFGzsCIMhIbSraQB/CkrnImmpKVRMEQ0Tqg
	 RzW26OwLBt7Lw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBA2417E1580;
	Mon, 23 Jun 2025 10:35:17 +0200 (CEST)
Message-ID: <b6c15bdc-95d9-4690-ba9e-f5eb9ed77029@collabora.com>
Date: Mon, 23 Jun 2025 10:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] ARM: mediatek: add MT6572 smp bring up code
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-8-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-8-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013520_426624_86090DA9 
X-CRM114-Status: UNSURE (   7.49  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add support for booting the secondary CPU on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


