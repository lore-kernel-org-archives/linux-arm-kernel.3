Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB4FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fERCsVog03ftAkrtNYahspZxv6nhaznzE1BFai+kA4k=; b=DcHzBXV5OxT3mcxyTahXk3JV3s
	t73QOE1E/iJbhdGwQX9j/TM8Q9uQ2LDEaUx/zABWLL0vs8lRc1oSHEZKHXseZZugBo0cEbrg23fCC
	bYeqhtnYAu+RNFYamV3yXbpcNmHEEc9EqHmImPRYnp2nF46NRADmIcS1xQT3Kz8vaiwvI/sHdC6mK
	UD3tsy2TnmdBJeAWCqXD0zkomXy5tX9ypH+aZr5+pIU53unB/1uHpvfLOI8+hLjWWAapwoy/Sq2RE
	FHKWt/LlSHQDX0Icm/hDibPp7X5xjKXchYZf0XwX5HITru7cp+GMtRa3nRkJyx9/q8b0aK9P02fxs
	15qcPKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir3F-0000000A1n1-3cfL;
	Mon, 04 Aug 2025 09:00:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqt0-00000009zkO-2gSH;
	Mon, 04 Aug 2025 08:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297377;
	bh=nXkeDIP7ZV/N4coPJgNQkt15fEwvTffRHGCDXbFcPYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eWKxayx+aet4gpAcun29UOprDRBTBFLW5jmDx2U+nxPRWF+Mn3n0YJIB97hjtoTmI
	 qPxujPoYGZ15Gx8ywyRGXdfeLabHbp6s1uQUunMGWma7MT3tTZbmpGOcbBwsMuxdaE
	 iUGff76XXc9IX5Wnylc49m7C2i4hNTlu143eTl51hEnbSeQMjmQnUJuXLgG6swjGau
	 /oKOYzEwusmIkLa4N3MDz3aT3Ias+0P2hCowIxjEfjDHz2UTbyjKTH4RisCdv9cbc9
	 xjcyTSbls3yISLG69UoLfyi4gXOMqVDm+maMfDE4bTEdS+/Z9+Nr9OJfEV2lhyumM3
	 F5P5tgVeF2Iiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EE3A17E048E;
	Mon,  4 Aug 2025 10:49:37 +0200 (CEST)
Message-ID: <b32e561c-4587-4bdc-b108-2ceb342d3e37@collabora.com>
Date: Mon, 4 Aug 2025 10:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] pwm: mediatek: Fix various issues in the .apply()
 callback
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-16-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250725154506.2610172-16-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014938_838414_83F5CBDE 
X-CRM114-Status: GOOD (  12.01  )
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

Il 25/07/25 17:45, Uwe Kleine-König ha scritto:
> duty_cycle and period were silently cast from u64 to int losing
> relevant bits. Dividing by the result of a division (resolution) looses
> precision. clkdiv was determined using a loop while it can be done
> without one. Also too low period values were not catched.
> 
> Improve all these issues. Handling period and duty_cycle being u64 now
> requires a bit more care to prevent overflows, so mul_u64_u64_div_u64()
> is used.
> 
> The changes implemented in this change also align the chosen hardware
> settings to match the usual PWM rules (i.e. round down instead round
> nearest) and so .apply() also matches .get_state() silencing several
> warnings with PWM_DEBUG=y. While this probably doesn't result in
> problems, this aspect makes this change---though it might be considered
> a fix---unsuitable for backporting.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



