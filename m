Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4861DD2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5bvCXfrw0wJAyvC451z7sPKX85y6guKkf78mDKwHw0=; b=xYub82kQZ99hlTUW9vila8L4WL
	oWBqDWyQLkIqnsUE6dP22x3AGUOGSCjn9xGArMqBn1oLw0U3Cu3UaYhRq1dzschtgr9lew576C1UQ
	RSSeJScHmG/wLuMcRPINJNnGc06diMlQyTAnTS1+fw5NifplTs9zRwAlJK8B3oH3pkEQtdObc0BwC
	vcXLLm0ospMzPcgv4cpZ4zZ5iMHa58PTDfpyeDg3i3SCM8AnJ4k4D1eZw1V1mjhIHGtXaavPgKsPW
	GxKUKV21SSZIEpqqyieRDi8eY7IVFB5aEijjs/ohNuUdLljk2z1dwypMY7uSadHQXMkXQTVsSkR+X
	/DJiZd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewgT-00000004IYH-35R4;
	Sun, 11 Jan 2026 14:44:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vewgR-00000004IXZ-1Hch
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:44:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6505cbe47d8so9042170a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142685; x=1768747485; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5bvCXfrw0wJAyvC451z7sPKX85y6guKkf78mDKwHw0=;
        b=lA7KW0EH9PjYURSOdUOlz54LkXbtHyaLj8WwOQRCVsmjVt79O01vSGy8NWV0SWDrso
         13DXhhCsX9G0/iW62EYDDrexv/3LSamSduaHIhFen8LlpS/oPkp5c3npA+PMY9C9jwUM
         ef0ppmdGri6fvOvLOkFTE8YN8m1IFHUjzaSpX/ZxkZSzpSGgncv+x35kXNDO32NEnfRt
         UVBvNWRn6SbhSsAJIC9minCgvTj+1sMMBxAhWFGbAvBI2mdHxRHyKJ7ofRsNr4W3/Y3u
         ts1A4khPlDOLbmy2Vzot3jqvGzinI70+tH1mHN4lzh9KKqsGyyJ5fdV2X2VYeZt2AISh
         y/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142685; x=1768747485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5bvCXfrw0wJAyvC451z7sPKX85y6guKkf78mDKwHw0=;
        b=WTNlWIgiLwRuF8mFjHVa+jF+SpefI6hJi9PNBOvzHZ/oKsCCFvabJbIYOwiH424+uf
         nOOyClehyDmTuN3Elq43e406T0DzvMWVP4IlMUW5HnkyIwIL/0XYMoVJUa77DtQvEL2I
         QmMWU9JhSIqZKzrhMA0wzi7mL22D5JUbGWB0wWexsIT2kQTE0ssgRGL6+6sTDxvVafX9
         lGi9+wogjlfQJHX+PZI2G6YF8KJHa5webxF6feisf5nMmq4dvI/8Gs/tkrOSliedCdAS
         HKwI+NBpzPUWta8f3S8Raf2HWbxg2shHi0w7MH/oN5YyNDXhuPLWygIUj0QM4irHs+tZ
         O1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3GXKtSZCyOHTwSUruRKjRjkto35M1jmhOtKGij7PWAFXMi7uB1EGVe5LXTQuLg7OhGBTk4h6Gpiijn5p+YNfw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf+E7jK5+asCSE+Z1RiKP8rgGKFHlromKikzbpNJGqs/x8XfmG
	rk0AqquDCyTZC8hwN76R/fW6C0NYlFiU8jyKoASxOmmA4S/4sVCh84A1pe0D8hABoZc=
X-Gm-Gg: AY/fxX45gdhsda71+DxaNaPtHwgoM+xrk3M2kmCqW5SUmV4bAmrN0sJcxOTwNeamcTG
	kvA8hbp3bjw5taXe9oXWkVcCtyLxav3B77YsNpeXd2oZMs98T+ku/qHCMpSJYCu17nfWUEkf8O7
	2tRaBrfNEurZGVZCV5yY4SE2I6YD7KKq2u+xNUT59FLyLtvxNLy9Fp7q8MqesuQ4oAoCoX1uiRo
	Mc9fQt96wcUJz5KYR+WcanbWFWTZ5cFYtCHCQndNLD89NofrzZvzG2/xrZmx7bxw98Syu1JLfio
	qXqjYCcymfo4kH0RuGyjR2R90JWgrTc741XrXYFb/bYlkgruiy64Uc0aHPKb0n00PhDpNkVJzQm
	Ue2hSfroqy9rzexKnVrHPMjCcApJeBwKj8Dnp+xu8v4dSZRJCsSBpfgURgWFsmJ53kEA5CJDAGz
	5v4szDJacfrJ0TEAmra/Ms3ks=
X-Google-Smtp-Source: AGHT+IHGUu5OYQ17yt0Sks10puH6ECXvHmROUNTsHAGUEt843jNznhl0Fa7GBLD0pgo1znXFARhYGw==
X-Received: by 2002:a05:6402:146d:b0:64b:4540:6edb with SMTP id 4fb4d7f45d1cf-65097e4ce77mr13908239a12.22.1768142685334;
        Sun, 11 Jan 2026 06:44:45 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d44bfsm15272072a12.8.2026.01.11.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:44:44 -0800 (PST)
Message-ID: <ff941a66-cc09-4f57-a511-d253f48d7137@tuxon.dev>
Date: Sun, 11 Jan 2026 16:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add
 microchip,lan9691-aes
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
 <20251229184004.571837-8-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-8-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064448_268841_5FD1273B 
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
> Document Microchip LAN969x AES compatible.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>
> Acked-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

