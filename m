Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505C0C36011
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax2M9a/XgoXAPcO3sZ17+WnZpkQpX1cgkPlcAGReZKM=; b=DPkfdMt/sNygghRbIY+9vZD5ML
	6ES7XQkmESNHNA/pgwhpd4h68ikYTM8ZbOpTORP1FkcRVKFGf2ilWWZSwYwJa/ovLdFY1+RjQvbQM
	zpN0EzsA+QnMp2jdiKiUn0qvuOVpQlL7OeKKDhuqxAmnZVLnfTOPs05hvmwToIYzQLGeHhA8mHOFx
	Vq7wRBwIrQtBtHstd1nKf/rwUx+voLiBvB3UtSSo+u99Df7JuipBOyGKZ529fDJ7cAxDOQKkYqWWT
	z8B/B2fzvEhL6doajD1+xNeRKS9trAtkepLZ3rutve4qcT7jx00wnhtOmzUkmjSQ5MrIuB83ZRnUD
	D/MboRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIUH-000000012Ee-0dR5;
	Mon, 31 Mar 2025 16:59:49 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIRB-000000011ru-14lV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 16:56:38 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-72c16e658f4so1309282a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743440196; x=1744044996; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ax2M9a/XgoXAPcO3sZ17+WnZpkQpX1cgkPlcAGReZKM=;
        b=DZFJbHZm0Kh4ChVw94N+Wf52JbAzIKdCV0yVZOCzCD6iZV31LrMyY/9PUEyOnb8OJf
         rtilOJ2awWlA4Ps0xaOarKg8oj7j/L3PkqpI6mMSwQM3c8d41VukiveMBL/aDqzE/xkU
         wlmZhIWh+AVHdZaP1aC2WiS+gsq4V4EzEpELE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743440196; x=1744044996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ax2M9a/XgoXAPcO3sZ17+WnZpkQpX1cgkPlcAGReZKM=;
        b=sbtrU4ocWc7s4pdRfWYszztDipJIXxRxafkwRBszR/qGMI22rNYQerrNqli9uYt0TT
         pHaPPdvhSrF1NIwfKCXFBigjUeCnlCGt6iuf8+/VN/gCXi2F7bi6uSQh610PSm2PNI5S
         pFyOd4VoqmT99jFRU8ttcZZn9iNVIcCbk5TEpzV9IrAsPkub0uOspGhn+igRyUVrlK2Q
         67xMSDRrZMn0cAQ4COiYnMSqzIQgltUj3fiFPlEBitkKrKG5mikYouapCT9sKkzzACDX
         zfhYdn1oe8rOSf928fxdOGDRZ7qn0emTEsTWRVx1p45CnZpf6f2V2dYX6SNzEJEJU7uo
         CSiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiMHj3z7fhATxjJOiWocTn6ffH841GuFGNcf6DbGytWJYe0cCcgof9y4VDzvIWYjisgm7knZFL0SNrzEoF+QeE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5higRdVbjvp5V+aywF7suDYlW+Ii8Kx0GXNEkU3QgOxXso3ff
	5tyFL0V8ssTWLj73Wocdfo9s4bb+iVp9/Z2AQZG6kHfKMJA9V5YjVIyHjiGN9A==
X-Gm-Gg: ASbGncsYWOjunIkgr0nhl0i+vp7CX1cdTZdFZH1heOpCJE7/r2hPDZCEc06EuWboMDI
	jIj982xJNWgibl3u0e81QZJQy4hbpPhmxEK5/6Ilf0yIIwlc8W3jXZLCa7fuprfH4TFbx14rgtC
	LVj7QLnN1puLoZoIqWZUkDwU9qJRD3iF0v6ISMLxXkKWPlqORfEUXMoCLers3wyKvZyV8cISKk2
	RcTs+/cIFXtx4KnF0fdmVhAG1A7x3kgW8yUxP/vpu930jj7PJVMG/ynj1jpi75abdgPASiCDrN+
	oKgunS7T1ybEx2+x+sjqTrMSGXnp4JSVGLMxpjqjjLKZQXqZ1CXsBdV66amZC6jo6WvRXnnQz7J
	7K0YUaxfR
X-Google-Smtp-Source: AGHT+IFAXomCN+VvRG68JDNdUluvh2lXj3AcWbjX/p6QC4V6FBCZPeEeCGZxgPSF1rNpZnEYJMMlow==
X-Received: by 2002:a05:6830:6f0e:b0:72b:a6a9:8465 with SMTP id 46e09a7af769-72c6383aa8dmr6039333a34.23.1743440195881;
        Mon, 31 Mar 2025 09:56:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c5828b3a4sm1535795a34.66.2025.03.31.09.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 09:56:35 -0700 (PDT)
Message-ID: <b07f19f2-be84-4d72-9d3f-d7828ec48e9a@broadcom.com>
Date: Mon, 31 Mar 2025 09:56:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: usb: add support for bcm74110
To: justin.chen@broadcom.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Cc: rafal@milecki.pl, alcooperx@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, kishon@kernel.org, vkoul@kernel.org
References: <20250327185623.3047893-1-justin.chen@broadcom.com>
 <20250327185623.3047893-2-justin.chen@broadcom.com>
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
In-Reply-To: <20250327185623.3047893-2-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_095637_286375_065258D0 
X-CRM114-Status: UNSURE (   7.26  )
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

On 3/27/25 11:56, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> bcm74110 adds a freerun utmi/ref clock that saves further power during
> suspend states. A tune is also necessary to pass USB compliance test.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

