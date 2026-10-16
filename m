Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC61CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PboifeeUBu+En/QUnp8Dze9H/89JQuESMLCW2nSTi0=; b=29uU00nNaOofHCFFQylFI6QeE6
	5EjnP188AXNvo/EDSmDYquxKDJWvVd2Tv+4g4V6oslBXTUwM6GF74kZXbC3BcDw9kV4C74qDHLyDs
	hgOsJWYqFQyspkrxDgRhy5gP4K+MJRXoAn7x1uISi0YabsIykYIgfoZc5gPXH9rmDghjWEqqt7cyF
	bYdd5/+6Zl/l4QTB7S7avtPP6gUt+mXWRDKcj9lxwJU0zitav/ygWr1RaKKayhVGhkRN6UKtG6ZZn
	5VFFB49Gkk1378kDpiif9AB1xEsoGGtwF/XFk9nDazLr9FJT7ulRxjRkMkk2L3+z0nV8K6N6nxGRH
	UMeydYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8HF-000000050Ft-3F9t;
	Sat, 17 Oct 2026 17:33:01 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8HC-000000050Ej-3r2N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:33:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0413109C7B;
	Sat, 17 Oct 2026 19:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792258372;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0PboifeeUBu+En/QUnp8Dze9H/89JQuESMLCW2nSTi0=;
	b=bYit+MJr1x/TFwh8IMEuyMS7y0hQzeHzdvc+wxFOClJEgGlZ2xFrqX0Gsy/uxeqFVO66+b
	joHDJ4BBaEypkc8u8iVW6fOBJEfOZ8tpFhoSqqKFlpsICoa5e6b4XakyisLlGXQfH6gHHg
	bBZa7EyiOiqQa/dYNYB6iwXJ9mDbHRd09YwHoRa+jilLYMYkHL7liejfjEFbalR7F0B+MW
	cFfHcgKJKy+FTE3jDkjKjH9Z62rVtb7aZwnrOwGqtaxGLmyh3dvyMhijQVDiB/FHyzNUHA
	6GwoK9Z+xorwKfo5C592zxEVbAR8E63pIeFN6+hLO1NEVuw/NkCZjEXvO3Wh3A==
Message-ID: <32239c97-e1dc-416d-8570-f681f91df0c8@nabladev.com>
Date: Sat, 17 Oct 2026 00:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,PATCH 2/2] enetc: Make eMDIO MDC rate configurable from
 DT
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 UNGLinuxDriver@microchip.com, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20261016193344.115518-1-marex@nabladev.com>
 <20261016193344.115518-2-marex@nabladev.com>
 <725fe351-bdd0-4b53-b551-0f638d02f98a@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <725fe351-bdd0-4b53-b551-0f638d02f98a@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_103259_299252_7C5D2D9F 
X-CRM114-Status: UNSURE (   6.59  )
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

On 10/16/26 10:59 PM, Andrew Lunn wrote:
>> +	div = ((clk_get_rate(enet_clk) / mdc_freq) - 1) / 4;
>> +	if (div < 5 || div > 0x1ff)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Requested MDC frequency is out of range, ignoring\n");
> 
> Returning -EINVAL is not really 'ignoring' the invalid value. Since
> these are optional properties which are present, if they are not valid
> returning an error is good. So please fix the message.

All right, done in V2, thanks !

> Why is dev < 5 an issue?
The clock would be way too fast, on MX95 that would be over 33 MHz.

