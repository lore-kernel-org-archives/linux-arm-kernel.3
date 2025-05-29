Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BCFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 00:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny8UrZV+yDW12ChrpSJinfCzQgq9Rotc7NxMtarbZ9w=; b=LFQQfOfK0voPP7/cBDuCs3AICw
	aoKCx0y8BRe3SOXJR9I96UHHThKNbu6ukd8b1d1ewqFYUz+Ijz5vDZuFzuikoOtCnhDI3FQ3igLUW
	TeiiYaQvirf74M59K/mRZb26Z5i1N+1uHKWloPjeyYL+K6++WlXiSh10nYjN8rXc3H1OCYaJNRCTO
	A5f1cpET5phu0rkeim/YMKuJH4lpNMMZ64x2KcZtxZbgpmczpso3ZuZ5IRmwbDY+61KlSB2FYEqVI
	qs0TOM1sJce3IidjV4qsdPP/L9hWaPkLs3oLE32J76D/wmtj/oJtSolvt63O7V5nQloY+PlwTo055
	ygFTHUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRMI-0000000EX8H-336r;
	Thu, 29 May 2025 00:42:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRIq-0000000EWdE-1gvt;
	Thu, 29 May 2025 00:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1748479155;
	bh=ny8UrZV+yDW12ChrpSJinfCzQgq9Rotc7NxMtarbZ9w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lhVxSlw1XDyalKK+FYY9gimu5uKVHJnqaeDIt0HjfhB9x7uQWy4SQI/TGIY1Wadbb
	 OBr8B5u5921nStK7WPkz8zc4MGzv2ocjjcgGlJ5cdSLqKRB3yuwNNZFghEaoqXOuCU
	 XGaz4hQH9WJDhXlF8jAqHQVlbLn9J2xItnpaLWAaOSf8uRWGcOYpJzwJ/z8Yza+HV2
	 WSRl6+BECuvxv7ZqlPnd0zrRetMjz80rmuwva0+xhB1ZJ6+J3uQ3VeB2RJYY7yrZD8
	 LjDNdWRt2mnVqiGXOpycjhV17I3sk9KD2OTyKXx3l5mPgsYmNZWnz+Ux5vXkgut4Mj
	 cMaTpUDMxrqLQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE6426449F;
	Thu, 29 May 2025 08:39:07 +0800 (AWST)
Message-ID: <af3edc0a454eecbe52608e0bc16d82b99be6bad7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>,  Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,  Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal
 <dlemoal@kernel.org>,  Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
 <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, Jianlong
 Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 29 May 2025 10:09:06 +0930
In-Reply-To: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
	 <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_173924_647308_DC5506D6 
X-CRM114-Status: UNSURE (   5.91  )
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

On Wed, 2025-05-28 at 12:41 +0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

