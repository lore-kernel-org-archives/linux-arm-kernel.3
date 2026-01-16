Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA46D4A605
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W95GN1V+oZI3tCyhJrWoqvfYp2X9bfUg8CvoDb5FSAs=; b=ovSt7oIcg6Gn+whmNxwmcYvxtT
	EH4GhI/hjwCb1Gt2H3AEda9HYjF5Kfa7xaKQLMmcgNvnDQUPFFg0/HhRxay1W9RP+iRybY0jt4+KU
	CZ1ispRs6wsnFfwECxxda/AavrdBf+79uz9TDLCOtUplvzzXQdlAZZ0uF4mZRQ4NViuWmOuqmO3O6
	XBKduSpJJqzGYyQ8ptErSS32J9WLOcml3C2AWJtiFELnuqBqd+GW2g9Vpj9wnw0V/TW5nP2zj9MhQ
	JFBgICBCkUeRGXK8VhZErQa57iUiQXteRMN8rjWAuHAJQYBRAAENvRK7hkkqs2XscQKdl6BUjVlyf
	x9lrDy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgeA5-0000000DhJU-3cGH;
	Fri, 16 Jan 2026 07:22:25 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgeA2-0000000DhIx-41uf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 07:22:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1131733f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 23:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768548141; x=1769152941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W95GN1V+oZI3tCyhJrWoqvfYp2X9bfUg8CvoDb5FSAs=;
        b=aGWxnwvH1jPckD6F/haTLurMCfIzBEgCdfpHoSttz0rhTtvcSHwUyF1Hw/q3cIJ1Id
         CZeL4JbcPx4Egsp0p4qamQLDeNwCmx1aKSfCQ+eBpuGJlVdNOGKuXvMgQskaWglW+y5J
         LdmqlMH9lkoss0y9lQJ1EtdhX8ZanXEuyD1t+seGnIUuWtZjAKiE3lbyTOmng1uOwkm4
         V7ZB9LDnVcV9xxvKhgt4pqeDY3Vit3e4VOgmC/BbeCgLLj0bSFwtz40v7MfaHsXzmC86
         Ge2H7NhI0EU7BIyngc6EG42KKR0YH3jhg9SsjSqj0LUMTuOzHb86/uApoa2gJ0x2fktq
         tkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548141; x=1769152941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W95GN1V+oZI3tCyhJrWoqvfYp2X9bfUg8CvoDb5FSAs=;
        b=MnDxjqMT5E+KRARR5Z/FHmucQUdg2qAn8fdgryByIZNwd+p2/pm5FLPRFpJtujE6vi
         Nf5MWq/xoiF9zLuuWvXlbD3ZA+sPlbl6L/pvGOAm8TX3VeV5hlY7BlqKb0uEQ4Ofry6l
         2YuIZyGb0IBTxmr2CkahpriHvGJZAA2QKCd0AtlSVO9gnkRACA3XeeOQ+9ph+NvJyF6w
         aihm6ucH8EpgDPbMxFGFmZa8HQvtzZaaUkfTH9sr0yGbErbjMAXzxVCVZeqRVzX39bjp
         bN8MyCzd+9IdNCdc+mCZgdUMWUk4/xX/Fw3mDJj0dnHDMSWsa8QL6jZkQBkSTaUaMfio
         40kA==
X-Forwarded-Encrypted: i=1; AJvYcCUBxnEQ/FoOQQHgSbCfV191JSjLMTk0LdlpnuncfHsCAZLDAGm3uPL76VM/xxUka8GcOlc9NKikRsEL48D3mI5c@lists.infradead.org
X-Gm-Message-State: AOJu0YwCyManu9bKwdxjIPpG456b2BqcWaoiMOATrAUsdEN7W8T4CyAR
	WKCk2GINnHw8aP0zvd0ViRAWvXm1rPLLXUBATudurIvBB1/x1pi2JoFsTn11YINErM8=
X-Gm-Gg: AY/fxX79EOvW2aF7qnsB6bCU+Jha+sNPJgjSIJMOAXTP/lYqnMFQVlW/f1SOfrDx3c/
	Y1C2V6rZz5uuowTcSG1f+bfVaDkMky//6x/7AmzkWP7Y4SNTIJne3PFPqhetsAC6yS+INQ9KbQG
	S97qNStiYHTzn7F98WB7R67d1vfTk8+z9VusmSDEiBcukrntJZ0FXNsgxeLiH9fuPNLhSZFBWD1
	rP/d8nhtGc6UbJd8pav+97bJy+7cnjTlbfTkYpDJT5m9EeugffRVt+nnjdYs3csNItKNjg8kpDI
	3zzZrfjVyMjsORWzOV6yJTI4UD6y1lsuCwETVgB0v6aWhVmKWw+055Ttb0jPhTEb9t1z2v37G7+
	ZXhVfvzKNL+tgmFRBkjSHdicHlnzi+ev8JkcU9kgHgWu/HMhY3JKc0ULEokJw40x3i4sOKz6Fgz
	Sy6I2pVOZhRvo8qYuE9w==
X-Received: by 2002:a5d:5d81:0:b0:431:752:672b with SMTP id ffacd0b85a97d-4356998a823mr1864994f8f.14.1768548140696;
        Thu, 15 Jan 2026 23:22:20 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699982aasm3496749f8f.42.2026.01.15.23.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 23:22:20 -0800 (PST)
Message-ID: <40b636b3-b1d3-4c67-bbfd-6f41a5b0b290@tuxon.dev>
Date: Fri, 16 Jan 2026 09:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] arm64: dts: microchip: add LAN969x clock header
 file
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, lee@kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, linusw@kernel.org, olivia@selenic.com,
 richard.genoud@bootlin.com, radu_nicolae.pirea@upb.ro,
 gregkh@linuxfoundation.org, richardcochran@gmail.com,
 horatiu.vultur@microchip.com, Ryan.Wanner@microchip.com,
 tudor.ambarus@linaro.org, kavyasree.kotagiri@microchip.com,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-8-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260115114021.111324-8-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_232223_012321_A8BE3556 
X-CRM114-Status: UNSURE (   5.25  )
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



On 1/15/26 13:37, Robert Marko wrote:
> LAN969x uses hardware clock indexes, so document theses in a header to make
> them humanly readable.
> 
> Signed-off-by: Robert Marko<robert.marko@sartura.hr>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


