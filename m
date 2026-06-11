Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D707CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlMltLney+5FO6rJ24VqCkuZLI37qXL5DCduKEsVMiM=; b=avHwT2D9NY2PIcFFx11ez+zsvL
	qy4JLDH049PAgVoBkgvm+soO8nx0lf0M/jKJGvj4dTnU6hJAIHOkhxLWbMRMMraMjxlAJSWBv+MNg
	lTIwZTM01/ukmIR0Eo3TNAIOHQ1bZ+3qEwopYZZLzQGgN1z/jvmujI5dFm/r7Ht5N7fSvn0Cvb1Rn
	F4W5/kA5WbWu1azascl8TcL8l/TyyvppwULwk4gEx1rM2qiZQzneUDHSmdWprsN9GaP0gYuMLEwk9
	8YxwnNydskNlwKQI5Y1vZYdHxM/ekXx/EPBKBASpXvMEWQPsbaDxROBqvFW6/Xh3lBA7x8+Z1T0PY
	Jggi0E0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbhj-000000097lH-4AlV;
	Thu, 11 Jun 2026 09:28:03 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbhg-000000097kl-1igL;
	Thu, 11 Jun 2026 09:28:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3795413F6A;
	Thu, 11 Jun 2026 12:27:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1781170076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RlMltLney+5FO6rJ24VqCkuZLI37qXL5DCduKEsVMiM=;
	b=OsmJNX00sah5SQTArdDrms3Rb0W7fi4r6DOlhQvQXdUuRazcr+SEqPNUGaHXocZfYy+gu4
	IGF3xiapUHEvQ+QIIU1/Xvj77PaS5uJkv3ouSDmAGSoc9+5lj86nC1M87sFfXSU9YRaEnP
	7KU7jBYUeTVoAMhpOXoOyspipaSFOBBJFEgyL8bwYH/V4MkAveCj8M6t8oK2GKmUC3Dpju
	DqIa/0fUnSZ9GATWzSFdFaLUmMr4xNXbzgNhnqxdZGeZiyTzI1FkSQWnlBhaV2hrzdXwnn
	Sc0tftfC5oFZ+ad91M8CU18DYycUQYjaav5i2FYZTf2/Y/FWmsuwcUTv9ciRpQ==
Message-ID: <a523e854-c1d8-4f9d-a184-70ebee5fd630@baodeep.com>
Date: Thu, 11 Jun 2026 12:27:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com>
 <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_022800_958961_47BB9CDC 
X-CRM114-Status: UNSURE (   6.87  )
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

Hi, Marek!

11.06.2026 11:26, Marek Szyprowski wrote:
> Hi Viachesla,
> 
> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Thanks for testing.

> This probably also affects the similar changes in Rockchip GPIO driver done
> by the following commits:
> 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
> 7ca497be0016 ("gpio: rockchip: Stop calling pinctrl for set_direction")
> 

Yeah, we also need to revert can_sleep=true on rockchip and amlogic-a4 
(d6df4abe95a4).


Best regards
--
Viacheslav Bocharov
Shenzhen JetHome Technology Co., Ltd.

