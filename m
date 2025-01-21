Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D50C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 18:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPmI6P1yce0Rt1cYrZm/UVilLYiBEgksr3ZYl6OBta0=; b=uRjdN3IHTFeslUap0qbl3kFB3h
	hCqmxx5/vRE/ahyZUde0DUvKj4wV5vfGzEO6RNAWEYfzqMLqPY49LFkWnGoBjKAPVMDs7hvkvSknR
	M+wkyZhKiC13mmgPHqP8YYppeiiX+33G4BR+A9mv8bK5u1oHI/8J5ULhO9eHF0voVTonJJeT4WGB3
	J8Gp8u47h0LCr7RTkkJO3e5ADGGYEYzUgGKYmvy7vxp5U+vvEFWxcPJzLnPaSRLR0RiXSkRtZfj6c
	LnBI7GCX/iht/MANrPWBdeLJLeoWgIM9j/m5E5YUBpbROV0Fd+RxfiyPfmGQ3bL1ozUewXXBaeNKW
	aBJJ69qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taJ0u-00000008bN9-1ToU;
	Tue, 21 Jan 2025 18:30:12 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIzb-00000008b3q-2Kk1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 18:28:53 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2addd5053c0so3637082fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 10:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737484130; x=1738088930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nPmI6P1yce0Rt1cYrZm/UVilLYiBEgksr3ZYl6OBta0=;
        b=NRrKHF6t8qseijwZxPOpG6AE2sqtaKgJCg4Z21f3p1ZU7uBhPw9vhV4hjEYHWS8/Ph
         /WfHmrokdJnlmEPHjR5gEQ+MtwS4GnGS+tGOJk15Zh41lUW1tTDjeDPgOarr9CEWuCIk
         0HJV8ld7s24WVxSxn8FHgBR7+bz4jM0qmS8NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484130; x=1738088930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPmI6P1yce0Rt1cYrZm/UVilLYiBEgksr3ZYl6OBta0=;
        b=VxrLDUUa/tOZN0fqcJ0BE2QlWGIqLOFsosHEF0Kl1E4hQvjzE2PBwYkHbEu288Z882
         53Mfmw+GvEqTq0ndeAEbMVoCVzhEIl252NfpBUHi3JXLW9KI8y/eVvMMN2aPFpzc6cqi
         7KlI5dI8HObSvtfen/DNZ6A3+eld1lIqIRsaHUynJfjUXpBpTwrmoFTAirurZHsX8huP
         8wscs4a3QkPCik4jq+2y9TNwfFLlCOF/YjQYI8Opme/CjZxHf1cQM8yNuJBzSi7mYQnX
         S7FBfHuDu5aLOwChBen7k0oiX+8uC3en+QiYQmeS5Dkq6DECQ15VqM25I5PK/w+n/yJT
         bkwA==
X-Forwarded-Encrypted: i=1; AJvYcCURjmMjwreDmOk1j8SyYkBHgBWzSeWVw1yWHC6QM8yShQPa8PZHlq++3EWI/DWDI9rgITt2BbdHzz0aC2tYm2kw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9U7MjS9BTGhaQmZXGCVZ9VGIE3sq9bP/Mdgv+hJaYKFaDS4Rq
	cifhL8AQ8jcKZvunD215angWFKzY5OaN5gEYJNuVo+K68TMrCKI89mVLH3AKrQ==
X-Gm-Gg: ASbGncv3LQxQF2jOpAFci+wQzFZ+w8PyZ6/4xFx3tho+dGmNgdr7rw+9umdTfeVt19P
	8e8OZc5ZTgaLxULWPUWs/+cX0++jeRw4uXzYAyiG+PT59E3FMTtcf0jiubiP1dqwoikksgFxhuR
	sUaCIF+mFizbq2GxZKY2D9mkJDUynni36PtICDBAh1c7+oAnFGClSeS3DN1U622fkGfPrOgEsYH
	72QCeLGLDXPL/uVZYRllnamYKr4mYMetXNrppIpehlK17C7VufssLygV4bJj16HzfAsF4cmGd3O
	WLYkVKQdsn3jxdhv6ajD95dgWFmKvr650Q==
X-Google-Smtp-Source: AGHT+IFjKKl0hAzIld/Bp9CKfd2qa5nPK0PXiRU/GqnggYe1x1c7HhQHt6C0F2hBru2e35XfOzkNaA==
X-Received: by 2002:a05:6871:5317:b0:29e:d36:6e39 with SMTP id 586e51a60fabf-2b1c08c6401mr12423250fac.10.1737484129843;
        Tue, 21 Jan 2025 10:28:49 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b1b9011b66sm3833108fac.44.2025.01.21.10.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 10:28:48 -0800 (PST)
Message-ID: <641c46a0-6cd9-4d2e-8576-69900948029b@broadcom.com>
Date: Tue, 21 Jan 2025 10:28:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 02/11] dt-bindings: PCI: brcmstb: Update bindings
 for PCIe on bcm2712
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-3-svarbanov@suse.de>
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
In-Reply-To: <20250120130119.671119-3-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_102851_664260_D3CB2A7D 
X-CRM114-Status: UNSURE (   6.78  )
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

On 1/20/25 05:01, Stanimir Varbanov wrote:
> Update brcmstb PCIe controller bindings with bcm2712 compatible.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

