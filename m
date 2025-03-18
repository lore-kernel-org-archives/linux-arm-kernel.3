Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BDBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nsBNvnH54hqAh3jvOcKxLcm0lF5Rm/1ukltzQEWli8=; b=TK4KXqMtK6lUWOPqt2F80Y4AGf
	bgZCi3XM9v6cxhJIrrK4GygT60CHbAwmGZPgyJZxYR23wuHSGgWIxR/c0udske4qqFc1scSAMvsFC
	Iinm3Ut6ltwDB1HwqWAwGPeydjyFOFkPWA2x9Yp67ocnpkdV7mqihD5UQ+9mQmD2jsVKxvcyWIf1L
	vEUUCOcU35Th6r2CHpDmpR/ka3B6q3On9gxiTAOiJSH7lCCFfxzqOkFtOy6ofU8/HKmtu7qk8bYjz
	ahv6as3psXFa9x4Vh23LvTfjxOv5CUpj0HO1lyunl6KpLSiGWitsLaI+aGbfL9jOTl87665VhLksV
	61YhQgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLJb-00000004Itk-0Hfu;
	Tue, 18 Mar 2025 01:00:19 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLHt-00000004Ida-0K68;
	Tue, 18 Mar 2025 00:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742259511;
	bh=8nsBNvnH54hqAh3jvOcKxLcm0lF5Rm/1ukltzQEWli8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jc8BN7Rd17gp2gtEEmn7TWB7s4bL/KU9WzIoZXxwN0EXE71k/IBhjJ+q389jhLkFh
	 IdxPT9Z6TJhLCxxAIGaPi/VyQKog/r3YqcPEFnPtF+U6OeS4BHFLDsU1cQgkR8l9fC
	 jaD1J2NKmGr8roMHDZPf6TDA3s9WwqZTw30pOurMTzahUISzqlD+tF4+7MNqrWElPk
	 IQjOSwm2zi669uXJEub8r3Cz9A+EPj/LvtmNuaNPKOJ/XPO6H3Li0oKxcKVnKTSEN4
	 +hR0JWntitto6WeNRxUqnDmKb4vmL0CunRRtl+XT776blnwKyTi9dENlyucXHxDtN9
	 LK1os6FdOJemg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AF2C277BB4;
	Tue, 18 Mar 2025 08:58:28 +0800 (AWST)
Message-ID: <3e6a356cf1e6f293a2218e1c006f0222c9e01fa6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 03/18] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Chanwoo
 Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley
 <joel@jms.id.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  =?ISO-8859-1?Q?T=F3th_J=E1nos?=
 <gomba007@gmail.com>, Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org
Date: Tue, 18 Mar 2025 11:28:28 +1030
In-Reply-To: <20250228-rtc-cleanups-v1-3-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
	 <20250228-rtc-cleanups-v1-3-b44cec078481@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_175833_317689_0349EA95 
X-CRM114-Status: UNSURE (   7.38  )
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

On Fri, 2025-02-28 at 14:07 +0000, Andr=C3=A9 Draszik wrote:
> The memory pointed to by the ::rtc_dev member is managed via devres,
> and no code in this driver uses it past _probe().
>=20
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

