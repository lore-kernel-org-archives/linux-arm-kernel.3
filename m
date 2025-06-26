Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F718C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 01:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkNAUQZsgTOYyEpp6DFNDFEm1Y8rPk4V1hWAnUJpQCA=; b=jXBnYgPjapysy/imP85rD9MIMx
	S1S486l8EE9zYT6mNXSReqwONfDgQNPna8itze/vF9aKbcSUvkR8HrfRzW/ftafU/OilskQnmTnQ4
	7shP0LP9/3JlFe33KPiPWrI64+wQkJtc1KSx0yViYK7YB4Q9jM7X/G3rDqQuyk9ew59QGgOezFGfa
	T3xFB+f6DUuPNx8i26xt4Teh43yCKvQGQ6VIgO4jlrzgrtTa5IfBM6o4Swv5auAa+IpXXfr7RyqGq
	/xAl6qCgPg6BlK7rBYzbw5dwpPA/sOlZsAqfeZKHmobt8VFm8KNNGGU4EFis8hUa8QgYS4dzzOebp
	koaI5xFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbCZ-0000000ANvx-3q6q;
	Thu, 26 Jun 2025 01:14:55 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbAG-0000000ANqw-1rCo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 01:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750900345; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=XkNAUQZsgTOYyEpp6DFNDFEm1Y8rPk4V1hWAnUJpQCA=;
	b=F5sU7ut8NP7JbI+EP7pqPtFuPzUMAEZ4dneKkv2Lr5nV5gKqflfIrfI3+MUwIBYJj5esW8lvWoGGduVqgJPoJKgcCIzJ6UGq4zWS41dBKJLWLjjY6+5grxwpchZUm7bcjcUGN+BLsRRUhUvsOYtOi/9th2uU9lIDEv91omPA20Q=
Received: from 30.74.144.111(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wf4LWO5_1750900339 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Jun 2025 09:12:20 +0800
Message-ID: <4a7606bc-8ab3-4026-8bf8-eb875bdcb00c@linux.alibaba.com>
Date: Thu, 26 Jun 2025 09:12:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] gpio: sprd: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-7-bc110a3b52ff@linaro.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-7-bc110a3b52ff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_181233_166255_AB0EAADC 
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



On 2025/6/25 18:33, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

