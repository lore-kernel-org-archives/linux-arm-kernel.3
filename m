Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4D0CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UagUVrbSdBOzKGzY2pDlX0dFXH7FnLY3MCWxkthYFrU=; b=JpMptacnYigK9NAePYS6drmtn/
	dCGdpAlLmrDfhXZig+EBdWp8er3ZaRiE5Uz2W9XHs8ulRmTngtGnw8N7vILXN4n2o1ZZxrBD6f4+H
	fj/RDGGC9W5R+FWcAzsjJtMGyMqKEdD9tAcWqobLhT9MTQJtLl/ns3WXsMn18nRK15BlfRVwp8vzi
	FnDxMzhGH5furmWtMlKmZ9O+0cKQuvtln6AQpvE8Imr2T7CEZRXYQfK2OSM4KaKZ/U0uUj9zu87Vj
	GC4aWeKQUOzs09Wicgo6VG78+oMvevxs2964qzzexmwhl/Xrjflz+JnhQT5MVamOv7dR10fMyDSJs
	8cHHFPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjXZ-00000003sYy-1l4r;
	Thu, 08 Oct 2026 08:31:49 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjXW-00000003sXY-0OSv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=UagUVrbSdBOzKGzY2pDlX0dFXH7FnLY3MCWxkthYFrU=; 
	b=IfMF5kEOhfEgf267uSPaosPYppa/BbWjH0czEIGCfHI/aQDGeuJUTG9Wdq4bsifwZf/4aKe3zsh
	FypUVlV7YGPkYvc8bAIpQyFKqxluJ/ddxBUcqiwxlubKK4q03z5JMxlaJhHipNHbl3MjdMpnYW94z
	FWHWhkYSdrn+2eiq52pbaakupXF4NotBDE6Uq4njG8Sh3EwBBpZ5A7ifYcKapYfCRiPYOovD8cjII
	VvvthmA4mDXxfRtoIuSKey0pdcPmnu9QcdoG/hGAyjia+K19aSOy3bac6jQMJwchRQcd3rlW+waqm
	Vip3ZWpo2Cja5/A4aWGeufbZzFCDMDJ0dmbQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xEjXN-00000001o2d-39kN;
	Thu, 08 Oct 2026 16:31:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 Oct 2026 19:31:37 +1100
Date: Thu, 8 Oct 2026 19:31:37 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>, Can Peng <pengcan@kylinos.cn>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: stm32 - reuse clock rate in
 stm32_rng_clock_freq_restrain()
Message-ID: <asdU6Vnk6-BRpXOU@gondor.apana.org.au>
References: <20261001211612.38124-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001211612.38124-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013146_135881_B9FCDF9D 
X-CRM114-Status: GOOD (  11.20  )
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

On Thu, Oct 01, 2026 at 11:16:10PM +0200, Thorsten Blum wrote:
> Reuse clock_rate and avoid calling clk_get_rate() again. Remove the
> extra space before the colon while at it.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/char/hw_random/stm32-rng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

