Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A5CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/sq2zHrfuDi7HjvZgFw7HSSCYOpthLqSEEjPomTHDU=; b=fVqtClRlIwAivFttC7MR5JabLo
	UL10LxiBUCyZasxmnJmyJr+tVhgB79Rb96+s1D28mt4K3CZETuOmYPInyAE6LeBkA3I0itQ5VXDBR
	bxhmnqXsqKGEPVHNidZeuoCdNmxFafwT7y6KzSVEPwrX+hPB7GYbSomBvQgJbCYmYciVJ+ez3Fayw
	bvsZrh4X2xo4/BRXsmQjCQM8zcwnJwg2/o37ZaVbByEGynQ0l5/sh4Z6Qx+FzO2VzcePiu7kPtKHq
	PCjipQqUzoyX1ZYqS6P3mtSQlR1TkkZcWUf75/NL4hqcmjVV1tm3ZsPWNAA7OoPDUU0OTvTZSB+Xg
	67iTAzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ticGr-0000000BoU2-36RV;
	Thu, 13 Feb 2025 16:41:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiber-0000000BfBV-3Trt;
	Thu, 13 Feb 2025 16:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739462504;
	bh=zd3CJunqywqI5AKyrBsDBDEx1MdJbDKWUbWp/YwdNJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NlLiC48/7e309+ZJIZvbvqiem+LAJBnmRmbnLOw8eR3Jdf9KMrZw+BYMIlZljdsiB
	 lmUczCdniZJuyVObJTqbsN0bPzgr1LnLBriGGMej8o3W4Dw+X4MUXZ7oTEncuKXHXe
	 jJIDN07tTeRC8dbMVctjhBuOklt4Q7r53s1/+4i+40d8xcF0DDIf942cejCCk+LSX3
	 kTNUkTZfP9zYp+QwehJg5r2GXdT5DzgFo+9VHQ5LwDcvaAgznCv5Eon4aEtG0lNvdk
	 55gsO1yu5hVsb5Z9ymnuLSvlx1S8REQKJJ8GxmG3OfbIkWCEkVuy1JfENw3Ygbli54
	 u4w+sQO/GDUDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85F2517E153C;
	Thu, 13 Feb 2025 17:01:43 +0100 (CET)
Message-ID: <4978f335-38d1-47fe-b029-de6a2f1374c7@collabora.com>
Date: Thu, 13 Feb 2025 17:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] i2c: Introduce i2c_10bit_addr_*_from_msg()
 helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu
 <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-2-andriy.shevchenko@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250213141045.2716943-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_080146_018166_8645F2D6 
X-CRM114-Status: UNSURE (   6.95  )
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

Il 13/02/25 15:07, Andy Shevchenko ha scritto:
> There are already a lot of drivers that have been using
> i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> to have the similar for 10-bit addresses.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



