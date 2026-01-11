Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A198CD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vh0+NaFNSqUUr0lRvi0qh/0gFpaLfgRir9e/Vu9U7W4=; b=1mtT1bApCCyykxd75UABv2kjg8
	gmtbAtOhDdHiDM/TM/SpuxbIfobfQ4pKHyESFHDEnDekGdDoCwnvvRO1UuUIPyoBGO3sH7AGNTIEB
	C310RODBOP6fyxtydm+8+02AK2cMSoTLOh/ejXtwiP2z2SeRRpw0EyrEK3JrphEPpLGn53q9y0OJQ
	2JzMXKRIi++1KLIG2OqbbNCWftR14p9u7hjej2Nq28oBCWeraRJBDpiAmp0O6l8BcX/0Gr6oTptNs
	4bYrfGUY/6ik4kz2DvW6O5ZIQfFYTcvJMckg1ujNX03EXwQjFljAHtNdw74Cp5Woq22e67cPCTgux
	AjPQ4lFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewg1-00000004ISy-1Zbw;
	Sun, 11 Jan 2026 14:44:21 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewfy-00000004ISO-3bvF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:44:20 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b72b495aa81so1072716966b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142657; x=1768747457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vh0+NaFNSqUUr0lRvi0qh/0gFpaLfgRir9e/Vu9U7W4=;
        b=ipxSnbAufbQGkJRKsES0ucoYF+GSjrB78x/L5BFYOSP5D5/xeWyklWsvDrnfij4yI0
         7umGDXHJpWkLdQ/tETdgDudaFtdWY8LQ8Ie/Uj579f3ixdpfhxiQ/wQqUVlcn2WBXrWN
         1VsgS6kEkYWcOBTOodxUFOcRLLsFpdCeKafdwNa8CJA1snVP/yz2rvl7rcZprPMCHjS8
         VQOdrLe2ML9839SKiSv5ynOo7AP0AxveAnYI1IP0sNZPzyxBTEU+fmQNCiV7WE8yS3dc
         qMssH+47unDJN2mfbKb/+5q0pPcTQPEfkDCwSSks6N+FK6NLyYsnXFIfprj47lBUrzIK
         jsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142657; x=1768747457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh0+NaFNSqUUr0lRvi0qh/0gFpaLfgRir9e/Vu9U7W4=;
        b=M23dz+DLGaTE/X9zA443aJ/yVDbLVZ1hxDs0i5F93KwqkU6F6tAm1suYdth2eIrjUm
         i80Y/Uqc+iKVN4thZ82tJDBICtLwOpjkxfUbK1/xyx1gpEZwHDPa/gb9vmrYZ0mtLyyP
         l+jz+2LRCokiSrTc65DYoGptxR05MwIKr+geTm0fUGaUWSr+3JrdLWMWP2yBpAxf7xXI
         IaBXEWJJ3TYCM6vnxIyC4c2EbCJ3hgCrhx7SO4p43FQ+RHk5OKbrztSF7k56lzMf/U5n
         sWyT4UTAQkSQbsxJ8c81jw86Dwqb2eFLzwwKI+wnSTrmE9lprngopim1FBFUT4E8YTsJ
         T33Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkJUP0jX9jADUnIIoGmN11LJUjwO3sg6wFMHCXO3RScOaMWw/Q3RLKIqy1Pu0yhzrGjlSRR5LnJOaQHxDm6Is8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/776x721IpbKwKMT7vPb9QA/bmHN+6eTR8kM+hjulw91YR60V
	I4JRiInvzcUkj/eHLp2TeWecLKGxyetdIOtVMxd7EJKLpvyKtYTWcAzd0ot22acegaE=
X-Gm-Gg: AY/fxX6mueQuFDn3XML0+JgPw2/Sqieptsu65220eky+3AUXw45ctOFafdxiMjf2wIE
	3nEyPpWMd35rWHyAyD3zxkIYgkiEgj7YZbKxxtTLBDdTcOfpiCIo2Yfr14LxrNuZxK5bvOdw6s9
	HXvIB2t1fVDINBPBidMB26PY6meFt/OkyizA/KUfb8KWL9b8gBkZbJ2MtSvcu5LjYtbWhkejy+G
	emPK3T9M+rmHJfEV/BEmxJdizY8/9fy+l3l/fDADhDYB5fupxsmBaOVz+td+lOParLYAdkGQ97p
	igAJizYaGNu/muSWHqL/XnilxQJnpdZ/KQlMbeRmqbvw2sUbgL57EA0VC18S79saIMXdETfQe7M
	W9IwPM+b57g3AbXMWFNGWUDzXGp3Z9t7leToGnTC7Yr5ENTx/8zB1XDyequIqLpGearsUlT5b0k
	GHFbFCjq6AJQP3bIe+EcNXXvg=
X-Google-Smtp-Source: AGHT+IGSkgRdvFAJszoEIUVPnmxFKxpG81LZeaQDTCtjgK8/9NBkGo4UJCrHj8/qs3u8e7/Yxpu5vQ==
X-Received: by 2002:a17:907:96a1:b0:b80:6ddc:7dcd with SMTP id a640c23a62f3a-b84453a123amr1485279866b.31.1768142656775;
        Sun, 11 Jan 2026 06:44:16 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d3831sm1727347466b.44.2026.01.11.06.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:44:16 -0800 (PST)
Message-ID: <bb0c473d-0a86-407b-9c4b-9a39f9985ab9@tuxon.dev>
Date: Sun, 11 Jan 2026 16:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] dt-bindings: serial: atmel,at91-usart: add
 microchip,lan9691-usart
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
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-4-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064418_907639_49C4B8BC 
X-CRM114-Status: UNSURE (   5.06  )
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
> Document Microchip LAN969x USART compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

