Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37AFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obN/Fup3lM6BqgjXjChpYGnxmki/Om14WHmxJncGUEk=; b=hL9fgusTgGHaOp2Kj49TNnRsaf
	m6jqXCY2rKN/SRTPKWirKy7314N8EJ4jMtiXQ2lvLF7Fafws37E75WaemCL0yFAaUybbnmW06AplO
	pvwxuVt1/dZmF6q2ZCql5NyNgbzalVAy6WMcUmmT+xICJg3/9+enVzCsv+OuW3v8gYDB6w/b4LVB6
	34bqHntEYDwjOzGH+yykFHTe3Skif9e+qvmgOy5Rj8uWr1gZOK6sE9lK/8dV6/TXHbK5AJP4u35MY
	h7/LYzRLlOUdyO8KCTL0xBJFcwPujJ4eJ5tkIZV99uk//DsxfRz1o3l1kRo8B54knEacgrgKtxDyI
	7TQKb2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdof-00000007zFb-3iDx;
	Mon, 09 Dec 2024 13:28:49 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdiz-00000007xRK-3MGn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:22:59 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-466847440a6so26430241cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 05:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733750576; x=1734355376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obN/Fup3lM6BqgjXjChpYGnxmki/Om14WHmxJncGUEk=;
        b=uHiHnkBU367h/AAPHQN+Uhjw1qWpIzeKEIFsRHoBrImQywsDIQaH0sIYM9yZb02Hd+
         TkKDD14gg/8/r0CH+6clBLCGuqpBa+Xcd/lghtQvg9PaPl5rvxv/o+dnU91VX7YPSBvz
         3KEXnJqVCYjmo99UbY675WZyb+5NZVM4I80LxrbVbRPLWJovTacfnxiMheI0wwd7wsxv
         pRqqX0gxoNpUjNg8Ou9U5Vgw0/c+lTTaLjHmfS+VdvinZDUS7nCpIb8gCikc07HIb+PR
         jempZ72naGD0ym5DmjnVeXNo4Ibit4lSPOt0JkN/A8Vd2N1VIEZCPV9+HKOUY7Z80yE0
         nlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733750576; x=1734355376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obN/Fup3lM6BqgjXjChpYGnxmki/Om14WHmxJncGUEk=;
        b=m8dznS224OjxDFCsuXbPrClKW4f5ciV9hhFxRFJJAsF5SqHxSG/sKnCYHsG3xjECpM
         8T6LlE1gXUQhC7l0LNpSPNWAhPNTDv1sPA/5w8syUrY0m5j97wUujv4Ky/YKVcFv2Knl
         pwjpNIhEQUetSKB9JAObrZ3ULHfZ/B718MUpaoA9zE0w59d88LCFxui2m8vWvorLlRQd
         4VlL9kDUyYmcVwamRyT/GWwBqLS534lI/pz19rEdNQOZ9wchoWFQ18PM097R3encpgd/
         fC/SuTjXJwDw7nrja1y7wLzglfs/7dGZ7iXaH4xkffiAumKJWkRO/OkK8UCoaEdFvj4w
         0xAA==
X-Gm-Message-State: AOJu0YzQAEuv8U4J+lPWVT7AGQq4Sigdsjq0OiWkBfc203v8D4IvdKNr
	TtJ6NBOOg5adFG7lDtfouwymcebQOsO0vkF0BghvGQfF7Ghv1hJZOzqTcQGFvyQ=
X-Gm-Gg: ASbGncs2XegOtkEHyNqpWA35r6iE5fw1kNcqQfN+U6sQR4rm8K+x2WmWZ50GLe9UeN6
	DstZq330/GkS/tUCSzzuBM3EJQcBPEGhhP1TzEu18fOEDA6mznZdF/cc9ToODF+kSmE2SSI9UDK
	+WH0gCJJNso7JjN3SQDQrbkNn1jcxByEy8yiYr1Fm6J+ypuL6PcBbksYFGOx5Eu3Y2Ke8NiAt4y
	Xdy5aEz6KJ9dGQ6anpgXf3S/tO08S38N6V18Mi82sh+GNs0veSvk+ggtZs/eox5RIbGH5LXy7U2
	WIfHcanmk+tW1jm8JQ==
X-Google-Smtp-Source: AGHT+IG+xAs73bYxu73v5slaTcLQjjeYSAx80IDn1MEZt7aBZNho+qYdCjkxNdOS01ULUhUnXJl6kg==
X-Received: by 2002:ac8:5fc6:0:b0:467:6505:e3c with SMTP id d75a77b69052e-4676505132dmr63004611cf.24.1733750575932;
        Mon, 09 Dec 2024 05:22:55 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4672978dc20sm51086641cf.71.2024.12.09.05.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:22:55 -0800 (PST)
Message-ID: <b7706ac1-340e-4520-97d3-f8a65de78beb@baylibre.com>
Date: Mon, 9 Dec 2024 08:22:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
To: Chi-Wen Weng <cwweng.linux@gmail.com>, ukleinek@kernel.org,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 cwweng@nuvoton.com
References: <20241206085501.2623772-1-cwweng.linux@gmail.com>
 <20241206085501.2623772-3-cwweng.linux@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241206085501.2623772-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_052258_044133_03D72E5F 
X-CRM114-Status: UNSURE (   6.32  )
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


On 2024-12-06 03:55, Chi-Wen Weng wrote:
> This commit adds a generic PWM framework driver for Nuvoton MA35D1 PWM controller.
>
> Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>

