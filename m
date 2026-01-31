Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E010CD79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELZgLn75AQ+pskJlpMHIj5gZV10QNIQJqH6x9p2QeIE=; b=oGwYVBgt3OlK5rYafdAod2nI9R
	JflpAE0YUgffO6r/rFBo5e7rCFL8mwTzLS5+BnhpSzAMLWwscRbap8EpdRYz/udsnv5Wf0VcldNmj
	Fe94qUmzFbPJKFRXzHMQM89p7ihFOapxKzlV9ZybnqOZWiDqarW/vsqswFIVDB8tPLWc7wsLoVq6d
	KrjeHsHC7R21jWcuF4UzjglaLTCNv+v6i+kRUddceurxOFMdqrMCYAsWdye+y32WKcTkYHCfGuvLL
	SCIhdgTMHsxhlvw2g4PAlOXUSiPTg4YpSEanGHvZCbLIUhMezRROVerOXP2UJ1i6HFP8lS8RIngmz
	5+zqW8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8sv-00000002WaV-1zQ9;
	Sat, 31 Jan 2026 11:11:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8sr-00000002WZk-0Yn5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 11:11:24 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso5606473a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 03:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857879; x=1770462679; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ELZgLn75AQ+pskJlpMHIj5gZV10QNIQJqH6x9p2QeIE=;
        b=J7S6Vf4a/w3xoaqZJGVcYaA4Ag6U/axDnw8pC54mnvPKUXBbA+3MJxnCN8o5ngcgPT
         CkBKNSI0jcY8Ts5zgkbDSF3Rt4NpxEjwnuieZCsEx/Kwf+k+lyyBHAhl43JI41jMeLkP
         J/R5GZ28e25dxbFvTpK2Kza61wpCC4YNWf9waZ53yBBpM5jAe/fJhxeZyVOw3njqrfWR
         DdXFituKA/hIx8JwFmnDqYRRWQfabkMOScO2aUjFqlXiE96jVrg38kLf/UjGDcbZ3UGB
         n6LK4n4qFTVAk/TFkWqaBxus5cI8DU8HWZlnFD5eLq8XJzFCrrc8Qy65SNuVgEHp+L5z
         /mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857879; x=1770462679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELZgLn75AQ+pskJlpMHIj5gZV10QNIQJqH6x9p2QeIE=;
        b=rSTxnDl2wjmPiO7L+N7cEAoIjLLQz+Mu/IPPF6HDSf2AoPnKZEx31Jhr6LZP0QoXCN
         z64nhW+RVL3anRyzJIxmr3DRK5HeiHW48eXnWulJNuH9mHKu1yra9tmY/ze/foxCZYzN
         Xkbe9IdmYdNmFHj/oDI1Z0waW5SplsE4/zA5lBtC1c/jHTRwjA8Tk6tq+MdRkO/4d/Py
         vQ5NIM6/5AtiumTzvJvQC8t44V4xRok1S1kes4kaUC0dWTGW4oheVo1OUntpsoJTvN9W
         TkEPhnIIJFfeyJ76idQm7QHtRn+F+oxuDaVxPUiSCEoVybEHfYIbbOdCIChj7xUblNIf
         OI4w==
X-Forwarded-Encrypted: i=1; AJvYcCXPrC34xLlrlycuzjP6vsQ6VlgbpbbQyeHzsbihaQofWRJwCxvutfwkMGQ3p3cElAOoahhY4N+jvBigmv7IhnKv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6d8e/TxWP6SZ98y+3xntBhjPs8d6ddKCUh39iPhRhkB3doRv3
	42ME84YToN5pWc7s0XQPq6ZlD1GuFmCrb3Wq/7VpYAHL0hLwVCnTXqOZNc5z9XIwpC0=
X-Gm-Gg: AZuq6aIkw9FIhz9ZcV58ZxcWwV4OPrXjtyyyaK1hi2mOfZ+uJCgxc6GAK1xbNRFOoj1
	KZ9uv9MTkleUOEy95EtPKz7xyxOL461nQZ/HlLrUMkifjuaVYH74pkJJIafj24rXyP8DJzSOo/T
	wQnx4xlQbO9P/7+G+u3XeyVZaQTX86kBG18fis7UWW1+T5l9ZiIEkkP22dgqxue6mOGx1cnABve
	FCU6pZnfukgM/PxTXAzbOPeVQe1bDkeLyyVtgiH0wdM9sk8ZCAl9IIvmtA/PcKpmkGDsfLf1b5a
	9+wa4AaF6Cp3vb3PZNSMtTzioxV9eiNYa/Z2ipHEqUfupQZ/GLLDLt4qHS6aw326Px+lv+tyxDy
	oxv1Tk7u7d26Nv/LnDtHbK3vtmnQqMI+3v5VXwohCrk4bWoyzG8T63Nu2xHcv0RE4P8vm1B1onB
	6+JFiMF+ukSwNwWgi0vn9HG4P8KNVlL1avd30=
X-Received: by 2002:a05:6402:26ca:b0:658:2f40:1f7d with SMTP id 4fb4d7f45d1cf-658de31630cmr3892847a12.0.1769857879069;
        Sat, 31 Jan 2026 03:11:19 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e80fsm4924999a12.25.2026.01.31.03.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:11:17 -0800 (PST)
Message-ID: <20a61488-ccd4-43d0-a1c1-1cc2d1dc52bc@tuxon.dev>
Date: Sat, 31 Jan 2026 13:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/31] clk: at91: sama5d2: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <df4421219824d026b0183d5469bbb658ffd7a40e.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <df4421219824d026b0183d5469bbb658ffd7a40e.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_031122_911814_292DEB94 
X-CRM114-Status: UNSURE (   6.76  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D2 clocks to use parent_data and parent_hw whenever possible.
> Having parent_data instead of parent names improves to clock registration
> speed and re-parenting. Update the clock registration functions to use
> parent_data and to use clk_hw Macros.

s/and to use clk_hw Macros/and parent_hw/

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Adjust commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

