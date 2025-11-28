Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8ABD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2qtcpRq8efSAHaERqbxo76VCGb4u4RH+i4nykgh9AU=; b=0WYxqPdCSe1mdEucyLgAH8UvXU
	DtkeV2Isfe4j/Gub1c9aMcoYTovdxUTRutZBd5HG+9s5jjlIXE0wa88saTIv2Qtu3CIaxnLG2CWwP
	8wqdagp+s5+5WTwe5774YjBQT9jOrmkHP2RQwfq8nJlmKlbdINNy+H7lx/g54URB5ldb1nrhHZ47C
	IedqHdpTkecLRjOmbURqv2Lemrx6VJxYsRitEJblBZeeRZ+eSpBcgU1SWRwugRmVL6tzT/ul7aCxf
	TeOnT1EUX5BXM4DLQArhM6omrH69RDltZhUT6DtBaakMUsmpK9QHNCcIUHnIVvLgH8XAS+hJxeDfv
	QSzXtOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP65k-00000000yQC-2he6;
	Fri, 28 Nov 2025 21:33:24 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP65h-00000000yLu-1vRC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 21:33:23 +0000
DKIM-Signature: a=rsa-sha256; bh=p2qtcpRq8efSAHaERqbxo76VCGb4u4RH+i4nykgh9AU=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1764365456; v=1; x=1764797456;
 b=AgY2i32MfwrLjBId1IrPpncT+tqowE+QwxuR7ntoWP3V8c5Px3J7ADTQjstLIDuyQ1TV5Sbp
 5jb0Io14qPVxkm9MpOHzDo2WjXSqQIXalzeeoknH5rXOy6tygBNOGUc/a/Go+rqjSsQGgZV2SFH
 ARbvDv22F3DK+Q4i2bDg8OYYxKwdsJq+V7lhUOf+fGa0u/mJQgbi/HyfEnq40EgOe/Lo6rtGwD7
 CXTgYGjXKd2d5CuCY6WRwdjz+Kr3irAzm8QfFTdsPPCmHu71sedWfLtvqXI09rDUBHrvs7C+Lul
 oA8GeHbPwWD2mRlKrgNaDH70Hm9HnRVd0P2ZHikCoX/GQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 43edb07d; Fri, 28 Nov 2025 22:30:56 +0100
Message-ID: <51c9408e-45e7-4ce7-9e95-6e0a45bcc8fa@dujemihanovic.xyz>
Date: Fri, 28 Nov 2025 22:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: add audio power island for Marvell PXA1908
 SoC
To: Karel Balej <balejk@matfyz.cz>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20251127190237.745-1-balejk@matfyz.cz>
 <20251127190237.745-2-balejk@matfyz.cz>
Content-Language: en-US
From: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
In-Reply-To: <20251127190237.745-2-balejk@matfyz.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_133322_532404_8B5F18D4 
X-CRM114-Status: GOOD (  18.86  )
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

On 11/27/2025 8:02 PM, Karel Balej wrote:
> Define power domain which needs to be enabled in order for audio to work
> on the PXA1908-based samsung,coreprimevelte smartphone. In the
> downstream code, this power-on method is marked as specific to the ulcx
> series which is likely some variant of the board or some part of it. No
> other audio components needed for sound to work on this phone are
> currently available mainline but some successful testing was performed
> with the vendor variants of the respective drivers and with the domain
> forced always-on.

From what I know, ULCx is actually meant to be some SoC codename. ULC1
happens to be PXA1908, but I couldn't find any such codename for the rest.

Other than that, just a few nits:

> diff --git a/drivers/pmdomain/marvell/pxa1908-power-controller.c b/drivers/pmdomain/marvell/pxa1908-power-controller.c
> index ff5e6e82d3f8..e32eb227f235 100644
> --- a/drivers/pmdomain/marvell/pxa1908-power-controller.c
> +++ b/drivers/pmdomain/marvell/pxa1908-power-controller.c
> @@ -29,7 +29,10 @@
>  #define POWER_POLL_TIMEOUT_US	(25 * USEC_PER_MSEC)
>  #define POWER_POLL_SLEEP_US	6
>  
> -#define NR_DOMAINS	5
> +#define APMU_AUD_CLK		0x80
> +#define AUDIO_ULCX_ENABLE	0x0d

I would group these with the other register definitions.

Also, it's probably better to be more consistent with the naming, so I'd
prefer APMU_AUDIO_CLK.

> @@ -59,9 +62,13 @@ static inline bool pxa1908_pd_is_on(struct pxa1908_pd *pd)
>  {
>  	struct pxa1908_pd_ctrl *ctrl = pd->ctrl;
>  
> -	return pd->data.id != PXA1908_POWER_DOMAIN_DSI
> -		? regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data.pwr_state)
> -		: regmap_test_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +	switch (pd->data.id) {
> +	case PXA1908_POWER_DOMAIN_AUDIO:
> +		return regmap_test_bits(ctrl->base, APMU_AUD_CLK, AUDIO_ULCX_ENABLE);
> +	case PXA1908_POWER_DOMAIN_DSI:
> +		return regmap_test_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +	}
> +	return regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data.pwr_state);

Perhaps this should go into the switch?

Regards,
--
Duje

