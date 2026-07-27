Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1C6C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 00:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cePsuwFbqleCO0lprDfloU/DeGUmtkvcYNUIMucMeWg=; b=gfaqaR4Ouki83cDpSAmntfduSP
	KHDtpqaVh8ug81sL7HHqircjWZEub4LaSUW9u59FW+ozy+1VI5fOId50T5xtNhtThYvelNMK/4LyH
	2g89dfAQDZ1ZYxl1DuwzC0qdOe17XTpiEgc8D3w3R7W8Kt98XXwkPYlthIZf8yFwbVpMSFL0khtCB
	8MAVuZ8prBBp9PTJqXbsayE4wBbRDyOcoxOHB7AaNEowzkRTaDfx8dEuNEhiBYyJZobjz1IB5Ky8h
	aw4zWLYTtSFvHR6u1SGOasZ3WePrcDnrjsIyqRWE6qBrmsfotf0cH+85LvQ0vJUk2sV6V20+VgY/b
	7NLpBw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo9KH-00000001kEw-1Fsl;
	Mon, 27 Jul 2026 00:36:13 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo9KC-00000001kDO-3BRE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 00:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=cePsuwFbqleCO0lprDfloU/DeGUmtkvcYNUIMucMeWg=; 
	b=M3sJhciDYj+wPs6LfKGT/qM9VynYmUYn/zWlVcCxF+HHeDkGuyNPkfcusRx7lZOf8QTI/fnvnN9
	4pFvE670qS4cQsIC9g7WOWCBuRGQDHS1LyM4YYr0hdJ+qt9mHt9VM+1tT7h/bTxg3uzt57OucXAzb
	1qBIs1V3+k0VpkOvuAy2BxslF/jyYxckOEDqkcZHKyUwFIIEdae8sUZV2NPROESy4Z4Co+V8gMam9
	CtyCgJJKIGpslss5NraFX7fGgm5k7/vmQCjI+cDlF3nEs0VlbXVM71SBRzI287dKUPeU6Y+EwMzfv
	GoD50ZrURqRJZ00jpa6ucoVu3RtJSzVVJBgw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wo9K2-0000000Gz3v-0xch;
	Mon, 27 Jul 2026 08:35:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 27 Jul 2026 10:35:58 +1000
Date: Mon, 27 Jul 2026 10:35:58 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Can Peng <pengcan@kylinos.cn>
Cc: olivia@selenic.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, danielt@kernel.org, linusw@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwrng: stm32 - Fix runtime PM cleanup on registration
 failure
Message-ID: <aman7sL1uDcwcQ4i@gondor.apana.org.au>
References: <20260718032937.420561-1-pengcan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718032937.420561-1-pengcan@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_173608_803353_E86ECEAC 
X-CRM114-Status: GOOD (  13.06  )
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

On Sat, Jul 18, 2026 at 11:29:37AM +0800, Can Peng wrote:
> stm32_rng_probe() enables autosuspend and runtime PM before registering the
> hwrng. If devm_hwrng_register() fails, probe returns with runtime PM left
> enabled and autosuspend still selected.
> 
> The remove callback also only disables runtime PM and does not undo
> pm_runtime_use_autosuspend().
> 
> Use devm_pm_runtime_enable() so runtime PM is unwound automatically on
> probe failure and driver detach. Since the managed cleanup also disables
> runtime PM,drop the remove callback.
> 
> Fixes: c6a97c42e399 ("hwrng: stm32 - add support for STM32 HW RNG")
> Cc: stable@vger.kernel.org
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---
>  drivers/char/hw_random/stm32-rng.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

