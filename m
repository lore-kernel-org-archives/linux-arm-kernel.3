Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDABD78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCAGw3CcdeUl+tWZLwElBhDe64DQp1bTeOLewMFgc3U=; b=DYlEc/3a+BPackfRcnXPiHKqHV
	mZhgayDyKQwAOkoJSgzyi/NYhY1P0J1hvavT61uBJYOurYgvPi5JODF4hOs38jFvLnAsfyhAwPCAX
	k1zbnkNi7X4FjXea4efjBdX5iDqhYb89SbBV4ZUa8fxSlqtaEZy0xfI6J/UC+BLSTlpBPTrRblOq5
	0lQ20yie5aIyUbIksPkP3Qv3lljXlrrhP0fbMBhCs8RSUDjumZ4SE7B2fR3n65UON/HEkYEBD8z1v
	URnMemp0VyyU0yYa7qJ4wx+jIusRBU0QptVG2PfrMxdDqgYe5BytH4d/AtAd9U0WktnN248PAL+vy
	638xqJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9kM-00000006wWP-2isY;
	Mon, 02 Dec 2024 16:58:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9jL-00000006wMY-2rRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:57:06 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so770226a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733158622; x=1733763422; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wCAGw3CcdeUl+tWZLwElBhDe64DQp1bTeOLewMFgc3U=;
        b=YhDjdLPNzBLD8ZO5WdvZYK7AX5RJLN6ja9KN0wg3PTeNoDK3NleLpWgUJkI0lySL0F
         vRpQsp5pSyraSn0C8mHUX1AC+L0HmwefJyvE1sdJf4dXoFj1eSlj3UVF2eCrA9EHzRte
         d+UXblWMzNJFw5w9QYyI56bp0TzMuGQkM+jcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158622; x=1733763422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCAGw3CcdeUl+tWZLwElBhDe64DQp1bTeOLewMFgc3U=;
        b=B5CcSythfx16NH5Dc/Vvr7sRhUEoSUxybFzP7UHGRt2fByDp45YrZElkuZNkBAnIjW
         w+dHuobDD+XSBfN7ss3p70bsJmgv8WJo38eL2bVg9kpD4LLpVRHV1FKrq+f2QhtpgTAC
         tP5W/Imm0Zz/R3bkNMSHREcc8RrvurIttxQaWrrz4o4HBE9Mn13RrI5FfbwC7+p71Y7+
         7n1zNSEG/c9M0+I0Wr3yE3KIlZg+oOMQJvT2FdMAxbTHKbJSch1pQboiabltsS7B2vFT
         T25gKiYuyzvwCrWmuJTCD16qPJiZ7ytwAjeW5Cgp+qHJlvzz60VtGFeAvhEAE2thnulP
         bcTw==
X-Forwarded-Encrypted: i=1; AJvYcCXAPMdK4QjvpzAK4qFXllSU5iLIIjNAi+vvMIsO0fEYQQxh7BiDirt70u/xiJSRClyUGXtPVX/XA954KYyJq3el@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0hGR6A8/syFru9xAh5eedzQHxLKX22UHG94UkjPOfqLEhc2vl
	QG/IcFUw/P6sWXRYf3ViWaZS94OOrDooBBTx4SWq67ln9C4Jr4+vpOkZmgvRNQ==
X-Gm-Gg: ASbGncuY9/NohkZErRanivRA+bSrEdI015lJxpDUwXvQgSiDAtdor55enwxa5OEMaQr
	3eHxEgp9RLe/mt/mVYvUUTroMqKDpt16IDOI3HGail0Tzs/n/yDMJ/Hpd/dir9KZ2rqC7a6IkrG
	RGiutQdHcu7yHUOONAmJCQPYzUQdrlud6+72zIh42QnCEVAIfmMGZl3IWQSICYfj0C9UoGZ3rS8
	+hxXKUo7A+ur/RQL5gVWjYYmMlsthSKiu4m6iS9Y4X/4OOA0cYkgaV4vCD/p2u4V5iUwCi14gHg
	GpdEveG2P8aXqA==
X-Google-Smtp-Source: AGHT+IHw3XDkWltSNr6nZink1lbc1pck3rHLuglw9OPS87ycLWANAwGeGA+PLT7Pf2yscolP02SgOg==
X-Received: by 2002:a17:90b:2681:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2eef80c6a63mr529291a91.3.1733158621793;
        Mon, 02 Dec 2024 08:57:01 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eecd83914csm2036849a91.0.2024.12.02.08.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 08:57:00 -0800 (PST)
Message-ID: <10f3e9a9-187e-4c1e-9e1c-9885da4ace79@broadcom.com>
Date: Mon, 2 Dec 2024 08:56:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/bcm2836: Enable SKIP_SET_WAKE and MASK_ON_SUSPEND
To: Stefan Wahren <wahrenst@gmx.net>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
References: <20241202115437.33552-1-wahrenst@gmx.net>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241202115437.33552-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_085703_963234_C39702C4 
X-CRM114-Status: GOOD (  10.59  )
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

On 12/2/24 03:54, Stefan Wahren wrote:
> The BCM2836 interrupt controller doesn't provide any facility to
> configure the wakeup sources. That's the reason why the driver lacks
> the irq_set_wake() callback for the interrupt chip.
> 
> Enable the flags IRQCHIP_SKIP_SET_WAKE and IRQCHIP_MASK_ON_SUSPEND so
> the interrupt suspend logic can handle the chip correctly.
> 
> This was inspired by the patch series "irqchip/irq-bcm283x update
> for BCM7211" by Florian Fainelli.
> 
> Link: https://lore.kernel.org/lkml/20191001224842.9382-1-f.fainelli@gmail.com/
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

