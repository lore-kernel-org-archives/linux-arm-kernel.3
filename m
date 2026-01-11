Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3BAD2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=; b=HDOhvFx/Ym9+8d2F71Eok7V/2v
	ZrvcIW4KWWaxi2a5bZzoC1mOqJMkZbKhRktcaVZnSP4g32PulYk/e0CXmYbJz0uZevEWbAYsPbk/H
	tZXxEhEGp8VeFTB2qei/Q5HxuNaHjBGPvJZvWU44jhX4p87qqBUQ4y/m9veA0GQfFDQCoKBktdxuE
	XXp5LK/d1Rc3GuXyS2aeSxBBdu5U3uEjHVDpLiYOAnY3axpNqisd/f83LVWtTHD27YEKfigz46PVE
	AAGNpJ3cfYbGuR2CZwd0C8HvV3kae0tf0r14bFkkJTHZRDDKZ+cO84LdW6ImWqrcuTOjBSd3SENfo
	16zKaU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewh9-00000004Iid-0ExG;
	Sun, 11 Jan 2026 14:45:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewh6-00000004IhB-20d9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:45:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so10967403a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142726; x=1768747526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=iuCLfAsAiyPuLxbwfGqkp1vrY5XJ/0/tTJ9rgp1Rud/rty39wOdCdI68ih/GLNXjkG
         oIfruBiCnFKU9M4OfckjChTvqHKGtH/sbIpq7QO/a400NT1jBMCbdMdZEmsyAbEnpv1R
         mhwlm17omb1v0dZ3/zVQI3537iEMtr5+U4Sz6vgMzu6wvhVjcp9HQl3kaolpyDV1C0w6
         6RoKoNqzsF2UNmqpuXdjtpnMeRnKDzDhM9XPEOowvN3f8Dg9UKKO0KWYxzs3WnEMfzXb
         8nzYY0NZKKTIwDzYjGGeeDesTLDbUtMdRJ1v7hxkXESDYDKDV5TfZ48Dm+PWHQcSWTGK
         ZOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142726; x=1768747526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6rwalswAWwTHAknUrP94zFyJo4NhuP+T6GegkCWM/M=;
        b=hh3Pgw4at8lDmgCSNVMlK+Y4rALLkMp3tm9BLW3l0DNiClME6r9XYVgwTkyk6XwTQO
         Z2tBCTCHAKFrrDOLRK0NE3HQLrJ2ReGsDXS83eAjZco46sFc8MzMnFaoYRvAvJCl3eVy
         wNiB2tYOYQYJDeFA9luPrASC8nMsAVHr2E9863LpWGAZ17cb9A2FbVwt7BWi3cW64mn/
         F92jH5GWauDgj3fUgJsDuLRjQJJ3qNiEgZrwNTvwLbXDjKf5bw4XxVXpz4x1Zh4Rcac6
         vDZS/fB4Zi6GTAUjWGTISlskIjcgkjEXBbeubS8OTuF04FMjplaT7qUo8jOKZDvVdjce
         BTHw==
X-Forwarded-Encrypted: i=1; AJvYcCW2h64J2nPSBxAZdGWjq3nislEv6sBnFsu0N8FUfxnjcaToX/oNagZTFjg/Xh/vbb3RwDftH/R+SJNE6hgOKanD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6yS8wkvMYMjV4jfHKz+AMiooWBPAy6IRuU1hAKUtSSphFiHkh
	dPVKNC2fGKvtMX/o2k0heREtNhYxXBbgOhe1hLsokQPggKRsX68jt2Oz1zwBnyQpKrw=
X-Gm-Gg: AY/fxX5LQ7uPjOX5yOWmmBbdqpq9t4xLVs0az55Cy0ZqZZk4jwsj8v7smU+/ImG8IFk
	D/VpSRo8FfqnJM74jo1YVWhbaQiI/gojd+HAEZX01rLpLJLHL/0w1JbeohlKTL5saW91Fx626Vw
	iJGlFH0d5Lo0OqcB6K/wanHbmBXb6v7DeK1KsZMXX1rZTV2tSb5+XZvyxtF3XmUg7mcu3H2j5/l
	ZsJTthFhFzJeBCtOKTe7zctDEA5qkHg5e+XvWytb3jiPdAeFoK2RhPrmLyV4vA+90pL24v2qDUC
	4MXH3mzpsj68qHcewPVN/D8s2IFGfJjXKl1D7j5nkpVWgZGzq7lXM27Up0juL3f/gwXAzzX2Zsn
	4DSgES8ptltabuLRXl/P4Vo+4XYQCeFGyYEYHwOqCROtwGp+eoBY1oYiJivIGoRA+xhbn1cHCYQ
	+j5N1KdhBe5uMm+XaZlmBo1w0=
X-Google-Smtp-Source: AGHT+IGvS7IBApFn5Y6caZIpVWCcEKkW6+CPDWe6wxvm6P/BpWNKX4ZQoy1X15u9d+HjeZrWR8LDZA==
X-Received: by 2002:a17:907:6d10:b0:b84:40e1:c1c8 with SMTP id a640c23a62f3a-b8444f4afb5mr1764352266b.33.1768142726523;
        Sun, 11 Jan 2026 06:45:26 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56962esm1699865166b.66.2026.01.11.06.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:25 -0800 (PST)
Message-ID: <7081b61b-599d-4a59-8a27-291c55a0e52a@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] dt-bindings: dma: atmel: add
 microchip,lan9691-dma
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-10-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064528_577249_9BDCEAF2 
X-CRM114-Status: UNSURE (   5.43  )
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



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

