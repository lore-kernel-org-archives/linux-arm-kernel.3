Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC70CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIKMURTzGnc0o3Eec57Nl0ZpPfL0lnmgxqpSyQAZbI4=; b=47SWEjxTX7YUj3Of4cItGdwGf3
	ha0oixkfx+UN6rzE6ttcTaLjy77meSaH6l5y6cyHY2UizoJjfPUE4P3itkSzPIWW38wMQVhOQhjsE
	7E+LEFQN919xZhg9F3oGmfOKgREjr6pbCv9MKP3N9vKelJ9wXmGQOVeDs6+m90ba+c/9rdm9UHWEy
	U7d2dg2w95KbxIiTjo6MqltT4mGMlTrBWfcX8rV0WcKplhjjcyWWnh0/vL5tU0TAvJYB8JWumRg+1
	9s+dXtp7OhwOlTxmuqa8ERALCIyFlbmLvr5cgWIRDbKUTu2Uveh99oXDQ7+IhY7aic1dYkrzixqhq
	fHn8nSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphoV-000000042qo-2buQ;
	Sat, 23 Aug 2025 06:33:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTVu-00000002z3t-1l8u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:17:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so16822505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 08:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755875829; x=1756480629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIKMURTzGnc0o3Eec57Nl0ZpPfL0lnmgxqpSyQAZbI4=;
        b=OpcwMXB3HCz3dk0DenZRKV3qn4A2h4flotsm/M43+yvwWuCfo7SaYNjBwynLeHullK
         3MQWql1133YC+4tpL0H/8+cKYAXMlA5jx46chgDEXgTDvJhtYw1hnxQrqdlWXzJOFnu5
         UiXrmlCJRKfn1MOn8JQDWBbLtnC+aCcJ6QD4dme615yKJoC8BhF4P96mOumWflIrAeO9
         jKmC0iU0prRV9pvXuZ/W9W6u7+h4c3icYa6MxUrkO1l9KRrf93SyAutz6vXlPVlBEMKL
         sVzcG6irtU1tAcMH4ES1lEZUCYNhbq/U41NfCgs/3Fn7Jsp5IoL3ci3QfNqkW5aVsIeo
         6ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875829; x=1756480629;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIKMURTzGnc0o3Eec57Nl0ZpPfL0lnmgxqpSyQAZbI4=;
        b=begTKHR5Nzl3qTm9PHFoZsJz1Sb2sy0wgwZq6BeQ4UUnl6FtihAPRsjbtFLY+M+ScG
         Fq371y4Bc+qWc1vjsEhlrv8gNkPwUm1wtpPRihwKOmU2bFtofm02E2V83AucIFqN1lSB
         HPbQFw5eVKbk2/E9inWrBNAIRH0MMLEvgjHz+FWe7bjVAFrqPpUE7BMQVFDEiNwP/ppP
         gJ2yHF2BloJ8CWP/62esHcuSG6a8ltmqY4piFqv4+EC3UrEL8Zv2x9PFFdU8IXWTX7Nm
         0ECnru9oJhnFd9CDF9OwQrtBatG5nqnB8b19bTgpAo1+NFbl13aERrIFJmMWsPD7Ov9T
         GrKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDLp1cw4j5F4SWBfHf3H7gkPRHff9N08wjnsuhRNCwesc50Mk1bvww2I2wkHofGI0QByLYnykUpJLoofZP1JET@lists.infradead.org
X-Gm-Message-State: AOJu0YwfGsFyPlaoWcVMnCln7AtwTJ13X4l0BeiAqKYGmN9nqU20bOxc
	IFLN+URguyw/0EvXwMbA6O9UWw/1tNk85+44dh1kTqpPBOGfbUSHhoeVc/pScsjmVYY=
X-Gm-Gg: ASbGnct4D9BFZOf/q3rDNLVUNa8GVL9mM9DPeFOyu2q3St4SjEVXAhcouaHjkbAyY8O
	q6MZPXc2lvJit9guOPsNH3Bz6oRMXGd0BEfcv3JjU73zIw4For5LDb0hIxbCYNmeo+0gLehLcgc
	DcWUg/SetpD3P5O6UyNamINeudBpPAGVE1txcjkwQNtqJXgufGkUoPw1L8tNw6ExCDAFQypdNaO
	eVzscZZenXFUD2QJyeNAMpc20cxDzBg14sNynD5/j9cD0rwY5fg9QW7PzVveAa5fMTdTbTa3Ip0
	h53XXCV5sHMfWpInTlS4AoWU9SsgqFy04CrGZ0KKyNB52upmct4q6X3nIlVtnJiacPSCENE4iXh
	t9R1+8KTjk5R1Wfc6M0TH+DnithI/IA==
X-Google-Smtp-Source: AGHT+IFfCxlBLYp46j2up+4x50Ih1kKtjjCCeP9uWttzOiVuvk9BH4ASeoYU65ehdDMkjUePa7z9oA==
X-Received: by 2002:a05:6000:40dd:b0:3b9:10ed:e6eb with SMTP id ffacd0b85a97d-3c5dac17469mr2333176f8f.8.1755875828487;
        Fri, 22 Aug 2025 08:17:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c52121313asm5508248f8f.57.2025.08.22.08.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 08:17:07 -0700 (PDT)
Message-ID: <770e936b-2c4c-4554-a567-6e7b0f688512@tuxon.dev>
Date: Fri, 22 Aug 2025 18:17:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: net: cdns,macb: Add compatible for
 Raspberry Pi RP1
To: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor.dooley@microchip.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-3-svarbanov@suse.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250822093440.53941-3-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_081710_479058_1FA5C941 
X-CRM114-Status: UNSURE (   8.19  )
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



On 22.08.2025 12:34, Stanimir Varbanov wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The Raspberry Pi RP1 chip has the Cadence GEM ethernet
> controller, so add a compatible string for it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

