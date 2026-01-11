Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D4ED2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSh5A9C/ikcooPDg3GNmd0+fIcS/l8zoJ1QKaA55bnM=; b=X5ICXXdUYTvf1XFhbk9gJ/4Uag
	rrzp0Jakov0CiUj/ezVD0VFeC5s0xOgh9NY7ZodTFmFdc0zWHkzoySS5fx6UprTqJRLE0wPMMvLAH
	W+stDGPtWiJUr0ihohggdcLhp3cdF73tvHCdGN4duO89/prwwCcnC1ytUzHg0WSAbKE+GdBcpEcDk
	s8PHbg+7ZSs0THEg6ffPUu/9taKcAuE21EfOULyPlNhpWNH42sKhEN3zmGRVuMEsWPSUiZ/pn4JoA
	HfZNm0/qeOy+HpRrEg420xJcYfPuHlsp9HDwvkXJPLdGztU9mcX6kN1bHVD3T1+mYs+b9TKXGQNow
	0mC4ijzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewhl-00000004Isd-3WF0;
	Sun, 11 Jan 2026 14:46:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewhj-00000004Irr-0I7I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:46:08 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so8693142a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142765; x=1768747565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSh5A9C/ikcooPDg3GNmd0+fIcS/l8zoJ1QKaA55bnM=;
        b=jQVReQXh13tLNblD8oRY7HNVYI7KQkGETgWy/CmOy6x2b+WGlnFELb3gTAISr0zmdv
         TiNIshWJja0yjOZEx42YiMLPbLn3xywHZnT5w6QDyPQ5eePzs7wf761KPLf8c1zXiq/4
         QiEX4rznmgiuYl5u+a9rAsj8erkg96oEbK1PA0ppC5yqyFKj5zwF3MRS1uOVTC/Qj0nV
         Xm89ZMavaGt8Zb4gCzTWHNFJd1OLuokLEJiJa20rah0NKfV/yTI8Q2Npnmp+rRvEhTAs
         3O0QOCuDgbq57OnGIx7FLBkLEqRq63KR+Ygo/UbKDgYYMKIzDNcgGr+6SamksvDginsr
         4KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142765; x=1768747565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSh5A9C/ikcooPDg3GNmd0+fIcS/l8zoJ1QKaA55bnM=;
        b=Orma2H7+2A7m1yX9D9+lrr0K4hS9VofGaE3rkVlrAlYSg94lmzfectFgpFVjk2VYaA
         f6NqtCO+UK52Jsav9URX/GcKkYtwRJKeVstMx838zj0wlu9P6jfd3w0ChN8/frEo1V2w
         /naJJ362DZNsSBGqsuM5zi2o3Gonjl0QVZyYe5hfhR8t4M2etn24pCDXb8wqbjYWHNoF
         kVYre7dH+u8sY4eyZjBoQGqyAXw8eIC5lU+LB6mSA/l/gK+paBjUMhG/DmWPOa+85Rrn
         /z+HDzAj9sA7sg/IGD1Uta09nxY8edTUR7daLHeSyo/53r4qGCJv8PzIfKboStcZd1Xv
         iRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsmJqG9sW52/Wqvo51BZAyJp3csOUDAN8Qo8FqwOfR1SWKcY73o5FzWK5XaJLtRT8iL802li0CSY9iuMi8ej3u@lists.infradead.org
X-Gm-Message-State: AOJu0YxZjIkR8ylGJcFFJ76oIXRubAiFX9NzPq5frjXqfPMZj4lZSMTZ
	U2nDVcfuHIL46RzDzUnF8l+hvMNLh5g5Dyx9OChEAZFopJ5v64+ZS9qsjj6Xe8s9lTA=
X-Gm-Gg: AY/fxX5wT6WNtvBvvJJsWhNj3G7slu9oZIEZOLBuXr65XGyJYHo/XLA4rARpuwlmS5p
	bs9iIsKhRZyN0oxV6Z8Vngg6YvNJQlavk8n0xHqe+XffRP8yNcdmdPWYauz81F4SFXjbb/dplNe
	nblrOOIhlLWDOzHXjKZnUJdBONDHON9M2qG7pwM51fgawXE8TuqLXW4XQLMCK1qLKI9ARssh3cB
	UotZfFnSsiXgDrkiA0F59HWQJ496s6f7zWRGd5uDnFrBSFGNmpkmRy5Ypz9mNJF5bmfajcAaMic
	Li9AT2mH/1nvtX6Jf8godci2bZ5y5/oMH8HfXYXnchIVWNaLZ/P7n/L7oXJKrDVetzCCwVsHTDe
	QRiLYi6BjCDqzFyBx5v2FCDB7pJHkUsWHzlz4JeZp6advwtGr4X9IBPysHjcswv2zClDD7e6KS/
	nSWUCfsim0NOfwM7x/sG4zBSQ=
X-Google-Smtp-Source: AGHT+IHdSgN1j5CfCwzzuZuuUE6k4oOsy7A6FyHYN7fpU3s7QMByt1Yrcz5j8phSUL1uwYAKt/FfvA==
X-Received: by 2002:a17:907:3c8a:b0:b87:1b2b:32fc with SMTP id a640c23a62f3a-b871b2b3d67mr52172166b.0.1768142765029;
        Sun, 11 Jan 2026 06:46:05 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870b0dba4esm216046666b.17.2026.01.11.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:46:04 -0800 (PST)
Message-ID: <dd70bce6-77c5-4d73-96ae-6a0bd8ab7b22@tuxon.dev>
Date: Sun, 11 Jan 2026 16:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
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
 <20251229184004.571837-12-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-12-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064607_626820_99B01E64 
X-CRM114-Status: UNSURE (   5.45  )
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
> Document LAN969x compatibles for SGPIO.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

