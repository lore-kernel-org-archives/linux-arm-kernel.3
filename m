Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2DDC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 07:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86TSTNJbA0vh6MpGoO0Nw1mMTb7YtQgj21vqlwf1cxc=; b=KW6IfWOiNSNPbiS7JPG90OJ6+3
	aHLeLTg/+d/nEbNE9tUVkr9S6vaC0/MJT49cRwTBTyQuhjTxqoby9mO/qemb6BR9GKur9iY50/juP
	9i/6JC5kD2CxaHfQhLLWAXtH9hmRjH3poUh9tf6ZCTJrou4/CPUNE4QPf3Q3jYsHLHyjOItmZV8mi
	bYj4s0tF49ThVBqF1Zdw9i4O5CPXtXhleXHtap8Y0nCc6ArKx7nfU/X1b8mhHYTItOMo7R+Qwr1xz
	srx/CNt1vBLXBeUPNd53SUQVr1h+c+pKrsJr/rIRfZ0LOMkDtRXCBy5gJYEXHtBpW6rYYJlYVYmps
	WjgPcNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgag-0000000EMop-2HOE;
	Sat, 22 Aug 2026 07:56:34 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxgad-0000000EMnV-2z5p;
	Sat, 22 Aug 2026 07:56:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83EE711C821;
	Sat, 22 Aug 2026 09:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787385385;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=86TSTNJbA0vh6MpGoO0Nw1mMTb7YtQgj21vqlwf1cxc=;
	b=iJWwySiSJB29Uhb2Iw5CShZxVoAPl1IrdePqLPtyuvGAYzekddAPDXjR4AmsWs+wKCqCZ1
	y8XwvdPc3xz9toBaFIxtg5f9jtrZNZlv7N3k4F308xvF+4h5uv+E2hkeSamZbBe3lme2Wo
	o9dkM8jp1Y4hKOMibXz9WkwRJ5Zd90o4WuYexStv+75cfq536QvVK+1ClCAh0jiq+iBgZf
	KK65vANwnNq6jD8khwWqoQasE1+7WY3f57dszKrEHXtHSStNKPIQ/PziNyt/YPb6CeHIP/
	5TL1JvgqTvj8vA3ar219xh6Yaay2+7Bq9COVPK6cGMjgnpAJkWVsPtTdkhixRg==
Message-ID: <de3f992b-f39c-4ed3-9033-91eca7fc966c@nabladev.com>
Date: Sat, 22 Aug 2026 06:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] usb: typec: tcpm: Add STM32 tcpp driver
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pankaj Dev <pankaj.dev@st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-2-c5e27cbc0795@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-2-c5e27cbc0795@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_005631_918406_FEC1A99E 
X-CRM114-Status: UNSURE (   9.67  )
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

On 8/21/26 6:23 PM, Fabrice Gasnier wrote:
> From: Christian Bruel <christian.bruel@foss.st.com>
> 
> Add support for the STMicroelectronics TCPP02 and TCPP03 USB-C PD
> protection for dual role power (DRP).
> It can be used with the STM32 family embedding UCPD controller.

[...]

> +++ b/drivers/usb/typec/tcpm/st_tcpp.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 STMicroelectronics
> + */
> +
> +#ifndef __ST_TCPP_H__
> +#define __ST_TCPP_H__
> +
> +typedef void (*tcpp_vbus_cb_t)(void *data, bool vbus_present);
> +
> +int tcpp_init(struct device *tcpp);
> +void tcpp_deinit(struct device *tcpp);
> +int tcpp_get_vbus(struct device *tcpp);
> +int tcpp_set_vbus(struct device *tcpp, bool on, bool charge);
> +int tcpp_set_vconn(struct device *dev, bool on, enum typec_cc_polarity polarity);
> +int tcpp_attach(struct device *tcpp);
> +int tcpp_detach(struct device *tcpp);
> +int tcpp_register_vbus_notifier(struct device *dev, tcpp_vbus_cb_t cb, void *data);
> +void tcpp_unregister_vbus_notifier(struct device *dev);
Model the TCPP as four GPIOs and you won't need any of this 
horribleness. Have a look at the UCPD driver I posted two days ago, 
"[PATCH 2/4] usb: typec: ucpd: Add ST UCPD driver", it operates TCPP 
exactly that way.

