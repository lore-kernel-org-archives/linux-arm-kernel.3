Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448D5FEE4ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlFw9E7/7safVoQdTcstXfBKsD2ksjVuQBYYKWaTUKU=; b=KmPRWvoxL139MnufpRrLpdwbPR
	+Jd6rxqulSScaYXP3ikiLyG5zGvv7x8n/PhMAt9YaFkF+Hn92msVZsz+3N8ercDYQ2DcK6SUWCDd4
	NJjMcz98x0U7UKDB5NVkKoaK6jyi4DMHktdBfkXKconCAyFwx2GFgRxTZ0UOyCRoFBa7DPf37165P
	/SACkM8X7v3zouIoBgC/NCzcyFKkw7llKtuGqbyfnOjvRKSArkg/WoWfxKUH2E1D8+8xV1F0prI2+
	bxdxEsVxDTC5cmJL4qFO/oVwyVpUYW970ue5A5JujVdFxKtNBT3FQhgvZUYSoU7CD9xnzvJqpORuC
	z65ksjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKtT-00000009tlA-1lXA;
	Sat, 28 Feb 2026 14:02:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKtQ-00000009tjz-44TX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:02:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48371119eacso35561215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 06:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772287323; x=1772892123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlFw9E7/7safVoQdTcstXfBKsD2ksjVuQBYYKWaTUKU=;
        b=iIFtQAleBV3wR/43qDAyLVFzvz5cg8/ifAtrGKGiHJWlx/xEBIUQ56Yqi18svkLEeJ
         qS54nq1iUms9VRjwgwFlmdwaD7k0yMeVcSpCF5enHzVyIsnkNIPsU7nlimlj6AEpT/V+
         aVRno0Ot3LbXEFzmIC67bjt5P9WEVz2i8cUQWWYMsTieaWjYYBaiMDZVjQiDGldWP4jb
         NkgVmdIlS6LUfEYtmBeGjH0D+U1lqEK8mcZiiJPX6R3HNFenbqwskLLCzqf9FfJqCJAt
         NhayOeBj5ZYf+qE8btufZiyNl5PbpHrrq9BHqVe/cJMaWT159p9EvDkE7jEbFdWQ0OtW
         FJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287323; x=1772892123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlFw9E7/7safVoQdTcstXfBKsD2ksjVuQBYYKWaTUKU=;
        b=KztzGw5y/rJH+/egQM5OqbiRrTt3RqEDc1Ld+0ShEAy8BEai8LyaUir2H+qU69Rd6U
         FHECLFQYq1rwficij/FNM6p0n8sUXxS7+i31SUgn3QxULbCAqOHp0CKL+dxImrcXVElm
         qPG3SrHExZW5lpOGjgKjs2ExmVEBebkQxWNemRg/MM7jgwnpO6MkEf7em4OyIsF9fFbH
         32t8b7lfTZgGVzSnnutv2m3U5jO6+qITjApuuJ07uYj9Hc5mIXAauqzVHyZLG0I5W7No
         PI0XkpA/dgivdWPCj6mvSCMEFMpsdPPtdLqRk5mtF9z0Waz05hipqUYHaSkvo+mDYMJ1
         z8HA==
X-Forwarded-Encrypted: i=1; AJvYcCWMClGZoBWwJxscJsgbprlghmFkaj5WUqleIwwWNL8EPSM11pKz7nUUY+Vpn9frIkcqp+TnSwNzweirNSHMXFui@lists.infradead.org
X-Gm-Message-State: AOJu0YzkTp61WeZSZSJKEEy4e5FYc+HS6nTJCBWwPw1J5JTjZMMu5AuX
	2grzjT2XaLL17/Dwad4709OwFyJdFVaOBm5PUT1+M2n4LpLRrEN/y9FU6mvge6w+0Sw=
X-Gm-Gg: ATEYQzymqBqlTQ1hTMMjyVfjVXTnB8TUTvRhG6+43OTMajGodXm3tpyfNCD3LMyyi5X
	in61ktr532jJKVSpAJUCDNOZ9cjURQ/CQbu7MnZrz4mb1dNfEfZlLTZvUjaNWiwAIxFNkA/hekk
	khrXXjOmQSW5LGvKHEQSbGZvCj4Q0GGT6a+UTEDSDdqmZYx3mPNjPyc6pwbLGKp0p9fdE0bwepn
	epF/vDfH376bQ8IzvdAIJim49JYglgOjcOThg4AZDIs7KHzVo3inNKrw4aXGGlnlDr0KxGEK4mW
	WVgn4IRjLkfnqwR7iEXUZTofPR5OerKDBHFGXP3gbo3uztN32qIxeNGHff+qRlZVXdjgI6Onml2
	229Hr2QSUX17jXWDBb2HAKn6+1rLohF5aqHRkCLWQlFHE8G/nBivyI6JG5/pdGdueOCKmmicn9G
	BNZWV6ZKRtsAmHGkKLPPPeI0TuEgzwPA==
X-Received: by 2002:a05:600c:4748:b0:483:c35d:367f with SMTP id 5b1f17b1804b1-483c9c0ba58mr107075855e9.21.1772287323090;
        Sat, 28 Feb 2026 06:02:03 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb318fsm133468375e9.6.2026.02.28.06.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:02:02 -0800 (PST)
Message-ID: <26f0d6e3-f62c-4a4e-8e35-37f2e5317087@tuxon.dev>
Date: Sat, 28 Feb 2026 16:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ARM: configs: at91: sama7: enable config for atmel
 maxtouch
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Romain Sioen <romain.sioen@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-6-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-6-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_060205_018675_034CEA87 
X-CRM114-Status: UNSURE (   5.77  )
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



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Add config support to enable maxtouch capacitive touchscreen
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


