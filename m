Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39D2D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8ivZWfcmepYc5T+3Up0ol6uJ6XFnUAYmd34ka9AIUo=; b=MYrj0Rt8LLtN+4cbr/Fsx1kYHN
	2VUJF/VVC08AKMXTxkujIOTxiYBB3m9uhXOTFTV9XjKTQBTt3jhvqUDLNy/OMXNPBgdr9qBuL6kFJ
	dqJDpmPmE/nc7Fo8C+4FKHcfqoH1xmD5FokxYwARmwMJPNhz+zVUNi3PIDqPxZQ5X42XGjot0WZ5q
	8/da/nks+z8ficsZvON3H4Yh3Y0dQIZf4nPBxd8WsmZLegDDbJy8emUJYJKTHQwmkdIM9P/k9c7Q8
	WM9U7mHUSZfSV/YQYw6UBqs/+hOb8KiRI1vSLFYeTwvcbkpJTwp+uqfQGm3EWV9v+uQNFKlR33X6/
	nDEt+hng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewfd-00000004IPU-062W;
	Sun, 11 Jan 2026 14:43:57 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewfa-00000004IP0-2RSR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:43:56 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b8052725de4so786115766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142633; x=1768747433; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8ivZWfcmepYc5T+3Up0ol6uJ6XFnUAYmd34ka9AIUo=;
        b=F1hAEAnwcf8RY4xHW7RPimI6N7mivbVjpvhHuNqO64ZgrkLqmnkQ5XHBzfUatNrqk4
         QV+swWhSbpruNToT1BHCJvTwNpMVt6yQYlvwBHmG09Xnl8QoMCS9y9NZubleELc/Hbty
         OX9O7Rfg+vRhHy9EO2jnBXGDoURYwlxh5uGDIYGqu3UT7q6SNCABcreKG3oIEa8Ht+UO
         j6cVKpfANtTwkiQcTsu5Idhn32sk4msvVUoFb6of9AH+4VJFwMex83joONr5pcvmSI+m
         oDzA9+OySD7VTuA3fA/MsnY857p05ipyGlZ2Cks2Hcj+SvSakbV+b8z7ETGR4a8AVUOf
         6sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142633; x=1768747433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8ivZWfcmepYc5T+3Up0ol6uJ6XFnUAYmd34ka9AIUo=;
        b=rldN0UPcF4vbw0wW4Ef26sMQdEfUSiACucP0RXMTFmQnBciV7gFTY4/zqgVazX1HeA
         GSNRXeGeK8AxuOLCqwLtCzSW7f0WGlB5rscMxerKazlq2M3CMxbgesaZwRPj/R195JYG
         f7nRizHx+i8CdAVlkl/0u4lnb4wx5b8BFNLl5A+waXMULdSNPSUXdT1EtvVMtyoWYK7Q
         PqmSozRnCLC0mVHX91ggdCGs4+Sm5kebdE1vzDtiR7Xd5t+zkLEo/6wmxxduZSqXGujH
         a40Io1JUdlbMfBXDqCuAi6pe1q9rqd5LGOgZuP1/iopEts5siCS1ATRQ4t/JXnVhzFpv
         ogYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3dGmo+RxdaPPdpS0kfC6Zw80BLvRrnTWyNmqTaDycI4F1718Ho1YD+g1XpVD2SUxl3FByQdYKl9BV+kLnNOSm@lists.infradead.org
X-Gm-Message-State: AOJu0YygEdUybKgCSA+Wotk4TXgrq/sLJqocrw+6iiNl5jmT7kQVmT7T
	u4tYlKlWJpa2Ft0hrJwKMP1XQ/wHevNB/H/2xVKQUnbJx1GP34lIc13ttF0hongTueI=
X-Gm-Gg: AY/fxX5JqOnCRvARjIFnbH68CSG086BXwgW11FYYhJNAHUm2Rs7cIwXJxt6x8fRA5lo
	PeBytZaE+86Hg6bVhVWEXX/SzSP2bd8ocZHTbQpuWsOfd/yjwiGfBqdkHpEKQ+2oZfak+fFmSWu
	1duHlcXKPu+4L7wQ2e1s8EWnCwABIA9nOExOFWEzI7govRLMvOzOlkcIiP5kw8aYAFSTtiks2ql
	utdHVhenuO2dsoLwZMwxLFWhV9yLqQfqYysQ0IijsaA+wQ8DYxMrMKRc/pGALqCNJPE3W17obqk
	9PPxDtw2ixaprMXYvlx3YZU6hV+7eE60w1G9nIf5RbBNF7t5yIoo8c0pYhBB0Jrn3YhKkglrVap
	LD8Beue9KXv1Ah/wOBRHZf2v/lCf+e9GOdYKeTMxmqBttkuzwCPnZP1qFN9hkhlc5Ct911HgSb/
	ruCbk6EM6vyQObEyFpR6dCkrU=
X-Google-Smtp-Source: AGHT+IEIDu7YG5XG/nu65TCe1ZGy2PfVFAGljLAgOLVEydIa/k97PZQn/n1VHfMaw/abNX/NIg40nQ==
X-Received: by 2002:a17:907:980e:b0:b72:5d9c:b47b with SMTP id a640c23a62f3a-b8444f6f7dcmr1568524366b.36.1768142632630;
        Sun, 11 Jan 2026 06:43:52 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ebfd007fsm491365166b.31.2026.01.11.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:43:52 -0800 (PST)
Message-ID: <d97c48eb-ebbe-4742-a4f6-220d4515a65f@tuxon.dev>
Date: Sun, 11 Jan 2026 16:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add
 microchip,lan9691-flexcom
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
 <20251229184004.571837-3-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064354_638230_464C1B28 
X-CRM114-Status: UNSURE (   5.49  )
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
> Add binding documentation for Microchip LAN969x.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

