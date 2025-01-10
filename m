Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695FEE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBGdfJMdVhlPTQvAdZpJcqFAGRqMXm8T9/wD9E1IyTM=; b=Vo/a8By/ftkHKx51OPimbmNKkL
	9azWV/4SM2o6Jiu0frvh9Sg1MbBlyIkJH+EemEojYyqIrkEIxua2tMb0mGs8x8YUqKqjn+C4sggNZ
	WPAnDfS2/HF5/hlcotKjXqaEkpqwNAGoHap5RL3PpAUR1TlmEXHJsPySsn0xkzhon1r3DPQpoWPsa
	GNzxcx4wavjUiVFoevEqBmBNS1jsRW7kSLHLVnqblaTYyPpBQAKb8NqxDyB2zqEBD/lDS+Cd4BXc9
	wsBNTgodbkXxTdt1Z3SmGDDduhdHJ+1HQ+W8+2UOso6ASwWyWFDb1WWMNjFlyNLT5UW7iuKhdijEk
	rvQt1m1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBds-0000000EoBy-1smH;
	Fri, 10 Jan 2025 09:49:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBcX-0000000Enmk-0LKT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 09:48:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436341f575fso19553685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 01:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736502479; x=1737107279; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBGdfJMdVhlPTQvAdZpJcqFAGRqMXm8T9/wD9E1IyTM=;
        b=H4N0KWP/Kvl6HxUVGe9t4jpUrdCtD2ewNDNTe7F8UNfakakXXffGuzupR6EhIgmxIR
         99M3mM5AsK6Az0qjTfUjpGn5uroWAalTrxPj3J6sm1Q2r21/mdhVdMdJSRBQq9NzEGQd
         n1+M/i02PUPC2R5NHrBcDZernsTnMEMG0t6Ibj/rlymmX6QBrpmEtb7lU6gRCexrzBx/
         DMzKf3vNCyQzEqnjiQmQfJS+NB8wOc5BXnw0FlLFgq/EYe4hLPyoe6oHf8w+OiXZWa1h
         bLo8Lp4k0hLR3IxNkexdH3lxI7jdOMzty/THUB+t3nsJE7Hq/dWiRa7PFjRDIqlE0uHv
         RY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502479; x=1737107279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBGdfJMdVhlPTQvAdZpJcqFAGRqMXm8T9/wD9E1IyTM=;
        b=gahE81P4Ktk3RNYneAw3pW4Ec1KYMZJlL/l/OO8zROGHvgynbUB0TaX/RoMIEgBd3l
         IiZtIvULGv7wR6kPWerUOyoAYzaVL7Ew8+rpzZKDKqP/w3Kasi8YGqDHnMznPjcqRAA1
         EhY7IhFM4JqX4JLjj2i40jvGh/0by+l3wGgMWWzUodLGn1Tntglp8JHqkVbI9mMfx1jj
         CDrRqDcwZq1OemLu0IERLBDa/3KK6oN7xVXmrCVpE35JGjjeZcrTxg8xqF72E9wNOT1F
         04ooUsWMU2Ealv9lTS/WO68QwdH2HkrYv3YV4jwRTnmpGIOraPMlPbzktOBlu8AeSHZ/
         rB5A==
X-Forwarded-Encrypted: i=1; AJvYcCV73z5FbT9wFaJ49wtf/B7YsXUt4lLy6TDrhuW1spf13kw1oQHytqKnHo7dCSMSN5gErRrjashYmHqgTiRWE2mJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxkgH2rM3qVSUj8hYm7OxfPNKKSD4kqLMcx4Y1m6816l+AVM1Nl
	3C0C1JsCwXumCsfVP9ojSMNQe/28iKbHytUOQMqoRbV1YSsC2mnTPGmZi0BVfhY=
X-Gm-Gg: ASbGncttpkFO1PN4hl9yG+MJVK7hKcIOSpmp9V4gf9V4NKqbGznFlP+OkLq6L84bK6f
	coEkAU8uhlDgBlrY4fAcCQYYeO6txjipYEvdNlVUD8X7EQANbWsgvYFzeuJl/6M1wqTq8Bl8OId
	xsZH4S5j+Qi4f8TIU3YbTHKTT+oZKpYrkz7WOfdljLHgDcyIwEaPWfroxjCLfO3YFALwrHG94Xx
	1XVn4H1hnQMZ05TgJkFEDlxptcFoxMhF2ZU8exN6Xogs5Qe6R67n6pLjjta+i3eiM+iUyqIag/Y
	IynDw9QQAftJjkyD49B/fZZtlH6S
X-Google-Smtp-Source: AGHT+IFHyFvrD9JGtDK23deWD3TLVFj1J1IlYF6J7R6HXxf4RUW/XkwkfNSEE1u37u3mcJyOGBdgDQ==
X-Received: by 2002:a05:600c:1da8:b0:436:6460:e67a with SMTP id 5b1f17b1804b1-436e889dff0mr54195005e9.25.1736502479074;
        Fri, 10 Jan 2025 01:47:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:2555:edac:4d05:947d? ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92a50sm80261485e9.36.2025.01.10.01.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:47:58 -0800 (PST)
Message-ID: <f2cbaae9-d0b0-48e7-a869-81ca9666fca1@baylibre.com>
Date: Fri, 10 Jan 2025 10:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: defconfig: enable display support for
 mt8365-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
 <f5859a83-975b-46a3-a33d-ab203efd9e21@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <f5859a83-975b-46a3-a33d-ab203efd9e21@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_014801_330793_8F137356 
X-CRM114-Status: GOOD (  10.58  )
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



On 10/01/2025 08:38, Krzysztof Kozlowski wrote:
> On 09/01/2025 11:37, Alexandre Mergnat wrote:
>> Enable the DRM HDMI connector support.
>> Enable the MIPI-DSI display Startek KD070FHFID015 panel.
> 
> Why? It was in previous commit, now its missing.

What is missing ? Don't you asked me to squash the defconfig commit ?

> 
> Best regards,
> Krzysztof

-- 
Regards,
Alexandre

