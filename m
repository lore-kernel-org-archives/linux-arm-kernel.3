Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A74D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bR5pMB9Z21CNTk1B6+opWEfUH+WjtdKh40K9u7GvYSs=; b=XY0RjH0u7hHgvJ5v9BJoDnDi1O
	+r3tf0bIbLin/EaBCq2Anzcr0KwJw0RYKUYtPMmfsjFAxbvcIIWKq5mthwW7gI2FtNQLXT43xhRdz
	Wp9nwgLeQVa0eP1DafpbPcMR3P9T4zAL4OyuaX9KL8SR6OJIcuzWb3B3VAsp54dvTbwIwMO7SM+OX
	pThvxhWosrpaQhgV8PrLR373bRs3guN+AkUhHUAQCj2Q5qieWyqFLw1fyBkoghYdl9XwHAUm9KNGg
	mHjiEHAeCad/sFIjy+HuXDlOO0YF90YhdRkulmwbPUpsie2BnRnQdi1Op/7Bvk5QLRy5jA/wnLK5F
	qKvW+ukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewgp-00000004Iel-31Ut;
	Sun, 11 Jan 2026 14:45:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewgn-00000004Ido-0Mp4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:45:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b870732cce2so64072966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142707; x=1768747507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bR5pMB9Z21CNTk1B6+opWEfUH+WjtdKh40K9u7GvYSs=;
        b=fMAT0eTxahFOrdxto+7URnmCuE3mKqGtUs7w8Seix1TjYy+93G6ABHXqjunKuCxkSS
         jjBYfnUdwnf0Tp4oohjp/2dp+NV4l4sjRgwx8HZMYoj1zVOrguDUh5tZ8witx64FgPoh
         6Dt8JympluCFavpUefJoDMxAHXl8jxHoucxBaMdjSJbWvU4pDsrsbkRPHaMzV90wH7AS
         8A3v0hhHcAIwdLgFhItI8gZFzxLvEJ8c7MIbzs2bkx8a38v8qSRdnfMhW5HGvzqx/bTn
         d5cUgiOq0zRnDmkQSls67/Ybz79Svm/FuqI935oGBsqauhD/sO7VmA7KJGDacGoT+uH8
         oAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142707; x=1768747507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bR5pMB9Z21CNTk1B6+opWEfUH+WjtdKh40K9u7GvYSs=;
        b=VWLn7l+3bzNvuRnp2R/FL2+/wJAsdx0VIX3d09JKLKpWdDsc19x98GyV57w2bUit6b
         Rml3lLk50n/AUOcV6Er6yK430mdabjUVshThJHl5uDgXTGl6Dc5trSC4bIZTabY5ba/x
         zsGZc6PWmX0edzlqA9FJ70N2SFSkrfU7/YBif0t8yQH/VT/6LeM8cFCPGVs84E4pWFto
         8vXF+tXlP5Ppxf2Abx1RSiMNBor90fLLvij5genoyNMFQnJpQh1AapQvubTqmcb/ssPG
         ImIYTbmux7bBrKCvIDaxKctchHqSUkOv/HkAkusxyYXXDc9G/thYCNVLwbi8OuFpV4YX
         WXGg==
X-Forwarded-Encrypted: i=1; AJvYcCWG/wlr2JtZwlf/vEQtLMr3I/uN9g6Zf86Aq+yTCJ28nsL2cMrUtlsBeybtqBjWl0WjiZ+L1cOuzdXU0RF6h+fL@lists.infradead.org
X-Gm-Message-State: AOJu0YyIEknJGNiU77U6YaX5jAehHM5AbLJKsLzU/Z1d8ewOzk6Naqa/
	nn/jeXk/9ZeiGyKRkdWm4fgRP4+z4NcGTu+IGwDHl88t5Y/eBQ8RuBtT0iIOsbdEbDk=
X-Gm-Gg: AY/fxX6RGFyOLAE6F37MXQj+0gzr8uziWnpOuZL92/2+Cj19qd9Qkl10zHct4HkGM+E
	nxmRvLK3bargbhw+vuao4yknbpWc8PlbFiESHWhuBSl4r8Rzj0ykbAFNh/1HDH9yX6irfoFsnsK
	8irGQvBCoiUovQjNPP5ri1v2eCv5MbJTg+SoWlD3QjV2qVlQDhWJUBdTD4T9wiR/k30YWSVpSWe
	CfK2Vves7wMUv55OiF0qbNm/CA6/vY7U1bid5UfagPxdOkxdczP5kLRFDessAyHuE3ld2moLYU4
	yy19QC4xeqBujQRVXONR3cAT+Y8UDY7hAJLbo8AXrq9oqbEdBhCBzG8XUst16dqyeygXrYCOEXe
	iiWnT5zimWk6SU1k/wjrp7apJk5Mc3OtgXqjpi6MTXUYgZAd+zAPPbCChfeCgAhuGfuw9dGG4hy
	LHzdV5u8D2xqNvBNYyhas/aEh/sC6tP3Ac1A==
X-Google-Smtp-Source: AGHT+IEnRprofKW6iUFW+aOMnt2p1AYruny/NjK8tSS/dtcvBYVRc/tCV4eudi2xBk8lGr0c6zLI/A==
X-Received: by 2002:a17:906:dc94:b0:b87:b87:cdbf with SMTP id a640c23a62f3a-b870b880077mr194416066b.53.1768142707046;
        Sun, 11 Jan 2026 06:45:07 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a235c0fsm1673227466b.9.2026.01.11.06.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:45:06 -0800 (PST)
Message-ID: <19f25a94-fc90-4298-b3ea-58bd66cad11d@tuxon.dev>
Date: Sun, 11 Jan 2026 16:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add
 microchip,lan9691-sha
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
 <20251229184004.571837-9-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-9-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064509_137167_5C2FB2A7 
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
> Document Microchip LAN969x SHA compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

