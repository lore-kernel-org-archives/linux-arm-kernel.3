Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFC6C71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDt7ez3i6z0BSsshI76a7nThQr3BMVLTBBzfDYTA6pg=; b=oDjGmojuTy1CBJSS6a9N4UX6uK
	gRkRYWkuJJESK9NJHjKkFqoPyNmHB02Q7EiOzyOKClkptEy2acJZFoK5hljUUOssjDT8c1hW1ktlj
	ELTnXqSsav1I8c1X4kl72z65DgSSjKJ/mQG6WCIbJlrOdOPn4tsXtp+cIExFVN9mnLDcaLe3N6cwn
	IohcSghUp+4i6Nvdz/uxMs2PPYmt2wQ0oGL6ZruQKk8edkXaiiSYLkqRzlRJAsLWrNef3BMw0zU1P
	jQGtBy2uoPtIr9aCnv6VjAwzXwq5dSVD/NbINvXxhPiunQIukxP2g0Bxn/bJDnRSTq5SD61heJ01C
	WIP8Ivyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMmT-0000000AC7t-0Zri;
	Wed, 11 Jun 2025 14:50:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIAg-00000009YI6-3d3f;
	Wed, 11 Jun 2025 09:55:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dDt7ez3i6z0BSsshI76a7nThQr3BMVLTBBzfDYTA6pg=; b=c1s0W8msQ7d4JsEjDx7uD1DV2b
	VTIA1NamixyZKMMm+klWp7yDLjSMIXUN4psRM0o74JATznDGeFSemrR2z+aDo1gXOGjQ0PQ77ssJo
	oVUbfkPw38AA2/+oKa1vFavZ30Ov1gJq7XpbSmD8QigsVpmAZ7NgOt3Ck9DwHugViyh57LeLhmL4p
	ppUG0maZVq6SbqJCwdTPJ+qweNMn5VwQcPJphXf6yxxfZJs/fBqPd6HcOY+92k74stS8IvYVF5ujG
	teXjwi5GBBgtIQ4OwC2C1E7CbZLdKQ1PjdiNOop4Hvc8CSmy6WCtj7Ts1tor8P1no5/kND6jetKP3
	UJpwuklQ==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIAe-00000002FSO-37Ph;
	Wed, 11 Jun 2025 09:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
	 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
	 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
	 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
	 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
	 fGRPXfFbZHprg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 964313C153A;
	Wed, 11 Jun 2025 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1749635665; bh=ZELWje44IQXg+aqRqhMjZlzmAPP8bdbQVZYOFJq3M9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jxt6xsAgMAOUb4jl76i3Cw/ob+3g27CDrEJ11UaNWweARmh3pASKr9vGVkS92IFac
	 YPXA6hqSgGV5dnyifiEPzFxSuWmHwqtnnBorcndP4VXu30erdJBfP8YrJ46WtqkT2C
	 ZB5SXynEGjYF90uyMsBkLTP7/K9tKTjfvpNQc65M4ZFGcmOJyetoZJbQyfgMTcccnC
	 ovv/hF2800vFjHZenrXZ9Ib3Cs3634CyeipOu5H15sVoNWHX/j8qicu106Z5ZeHvjj
	 l5CXC3vkbBXv/RUgPw6tOFDOWz5MZGDnaCREKgxUUUqRvZgLkdcVlwdN1MIjOJGq3p
	 fGRPXfFbZHprg==
Message-ID: <2ae6aa29-ea42-4fdf-a0ae-8cd088c88786@mleia.com>
Date: Wed, 11 Jun 2025 12:54:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250611_095425_660571_DE75DF41 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_095425_660571_DE75DF41 
X-CRM114-Status: UNSURE (   8.73  )
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

On 6/11/25 09:13, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/berlin/berlin.c                    | 2 +-
>   drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>   drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>   drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>   drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>   drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>   drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

>   drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>   drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>   drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>   drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>   11 files changed, 11 insertions(+), 11 deletions(-)
> 

--
Best wishes,
Vladimir

