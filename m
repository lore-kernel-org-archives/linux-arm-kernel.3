Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204DBC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwNV9XkLQhzGy3LnwouyowzyNAVfOZn4v9Uo2M+zdnA=; b=vj1jyL4V0QgDmH8mEGYJymgWeH
	as0/150ZmIbe9fOShBML/sEaJuI4a3IBq8MnZdinMU/wZFGFpteoWXFi2BCKqthZ+fxsr1k7QhYKs
	nRQLR2iNQJLJHiGT8YeCxRfx8+OQERJEwVmc5QxqZTtvGkkYWRmD5Uqu+s+giR7vvztHfSlprDhwG
	4/3rT7S4xlIxSQqqlk4jqWRhIpsyayH8TcQjfdg+b8TrEK0ym02QGsbfM8wRclajJqC3B3L2ArDDc
	1TSl7DG5nrFTnOtpBZ1N+vhNICKStDt4eutrakfInF+sddPZV/FV8WgjquJ91n0bWszZwfIKZd6lM
	+U7n0BaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfQq-0000000G6zB-3olH;
	Thu, 29 May 2025 15:44:36 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKf9c-0000000G4II-2Lsw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 15:26:50 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-606668f8d51so661409eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748532407; x=1749137207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwNV9XkLQhzGy3LnwouyowzyNAVfOZn4v9Uo2M+zdnA=;
        b=hvsqldqmt4vQdk906kqRA6Uu0VoZUGyO0XpzEp+fvLtWpuB+fivFPXIbPKuXsOKyw+
         0zp6d9nZ+fr6qYnmbEWtSMRl3siq1I0S2zjE2DBp7TG/O53DKArZUAcZ9I+25L06cN4h
         b/tGyfzXl7dDuWwwqV0zhnUETa0jvgikW7FzQ1V+VOT+ou3Fptxuxruaox44JC0UvwIW
         0iK1FAuHyAw6UWaHBP9k5CjXyFu2zzHG2tzwThT+hiV01rOMHsywVGlpslL8XQO83s2U
         n4d3btkJurOSJhx62dGkIX/U4to9jVHSDxA1MMKnKdjpwY/CGzy41erPK3Y+MDPjl5th
         I7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748532407; x=1749137207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwNV9XkLQhzGy3LnwouyowzyNAVfOZn4v9Uo2M+zdnA=;
        b=mqzYbWNI7g7hO7EaWPIzrb4z+iH3QaDeECE2JvAVGoAEGeEAGwo46tO/Bs8D+sSeiy
         7dezO3mTzZ/lfz9w2MV9CBt2zgMsvBhFmjTlzQGuxWz8iAqFxTDDYTmqmZ7N0kGTk9eV
         +p8dydZ639JEY7aLNQXq9U1U8Zqsr3oM/AaFxoNFw+IuScmCLFDKC1FuMrhj8ZeF5lzZ
         oI2rywVGuG7ZEKJ3q4TLjEJngLVcQLxbskyDKIeP2g8PMWxNkcOed4YU19+s8hg5wUxg
         wVH6AHUhdaWs0N7DJpTtADSt4Z4zOVEgLi8B5m5ysTIRGLcvvS5k1t5sThvqCDd48suO
         fWqg==
X-Gm-Message-State: AOJu0YwfVircs6kbECk1Bbilvw/q1Vov0eafV/8n/ul3nPR+sltAJg2m
	cgJg9L6eG4j4DO219QUX2K9M3+Vmw67EuJtdEQ+EufoNCcqSq0bGboof1Kd2La39GWA=
X-Gm-Gg: ASbGncuUseErl5cL7f+RsacpR5OUmWNt3GYIC27QHuSW2PCym8Fo35iZP7y9c8BX1Hc
	m6mtc8u+hVUZ/xNkdq1Gkq9y5rUTY5VICFdTpAMZ8Su7NL6cfoIE9WMc9wC8zj5lFZf7kNMN79x
	80YGu0A0FOz4z0+q7qzBd4JB5UeTi8ogx2M46Ny4NOFaF/VYWx+E1JA0z7D+Wwi+KXcuyBxYvRn
	6Y+7jmEHpaMkcmnuq+yFk4E6bJuhYv4c9rLU319JGWznLqh5LfRu21bWmh0HAqLvHc6G+STFHux
	Isdhas8W5RS3/ZyPERFpI2MTyqqPxT3/gO5pCpaTnSEOxTf/fxIPdKqpshcorWpu7ZvB+srud7c
	4licK83qhIsE63FfS6lz92tF+jQ==
X-Google-Smtp-Source: AGHT+IGPjvnGC1YvRZH9st24obs6F5iZRk8vdE60S7IXw1MFMfmFFESs0FdIBrXXqrBC8I/S4dstZQ==
X-Received: by 2002:a05:6820:d11:b0:60b:cd42:7a0c with SMTP id 006d021491bc7-60be4de19eamr1424084eaf.3.1748532407038;
        Thu, 29 May 2025 08:26:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4? ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c42c16sm30504eaf.7.2025.05.29.08.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 08:26:45 -0700 (PDT)
Message-ID: <b9b9aea9-e02d-4d5f-9f07-ef1c54e46b89@baylibre.com>
Date: Thu, 29 May 2025 10:26:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] TCB: Add DMA support to read the capture register AB
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_082648_760740_53CB590C 
X-CRM114-Status: GOOD (  13.57  )
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

Please include the counter: prefix in the subject of the cover letter
as well. It makes it easier to see at a glance what this series might
be about.

On 5/28/25 1:13 AM, Dharma Balasubiramani wrote:
> This patch series adds support to enable the DMA support for TCB.
> 
> When DMA is used, the Register AB (TC_RAB) address must be configured as
> source address of the transfer. TC_RAB provides the next unread value from
> TC_RA and TC_RB. It may be read by the DMA after a request has been
> triggered upon loading TC_RA or TC_RB.

Can you please explain what problem this series is solving and why we
need this change?


