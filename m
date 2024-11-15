Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6497FD6DDED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+8swLwqF2X83AK80kvODCLIKsVeONdbEHVvDm0uwjk=; b=SgvVe+luw9/B6Xv8sLQpshQxhe
	6wDn1fo25QhB8BxomIBEh/BEPBxk0tQr97dNpxRD7vigeYtQI2OI9utd79FGSUj99FTPMOAluA1nR
	me6aSPdX3O+6aHutlngOoLCUcQKQFlGhC1brlXOXQau2FMAi9HNkHUsFtXKOIvn8MoanuKAOzzh3T
	qXms8ao6Bur4eAhkQscKUdJXsZNhBw4VE2u+ObugvgNJy6web/ZL76OylFsh1ce3VKH7/uJf7PSRj
	6pXRM8IEtNBwJcyeuo8zjDX0GfFawOyAs7JcGq9xaWsmKaXrVZroFlEUNmQfFOgmB9LJLTDDv5bvn
	s88yGjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBui9-00000002Ydm-4A7d;
	Fri, 15 Nov 2024 11:42:01 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuhD-00000002YRw-2NUq;
	Fri, 15 Nov 2024 11:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=U+8swLwqF2X83AK80kvODCLIKsVeONdbEHVvDm0uwjk=; b=tCLhJN8tAY3prXd8p6rS+OVy+Y
	j+bYIBxLt8CwVkBOQ2qcUGG3PZ1iL67tud/C76A34ge7MHGs8q7sGhbGLQW0eW/G7W/2bh3J+rm8i
	e6f79azl0SzqPmQOpVvFAh1jiDIgXzxanvBLkVD1OWA+RljuigUAUaA63fceQX+DTDgX4CMI3fmcv
	hy93AUtjqmnq5J4Diks1LGLMt6hX+Nsz1QtWjE5wGZU8HDyPOxAIP79/Plxm1EMXUzgslNEsCM1/P
	GPqn9t1ougoVP1Ue+a2E+d4Kn3+nJcDQGLW4F+KHHJgiH+BA7JkuhUdSzeep4SN3A9AqCAEY6k6tc
	fhw+gixA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tBugk-00H1lk-2q;
	Fri, 15 Nov 2024 19:40:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 Nov 2024 19:40:34 +0800
Date: Fri, 15 Nov 2024 19:40:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	vadim.fedorenko@linux.dev, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v10 11/22] crypto: amlogic - Introduce hasher
Message-ID: <ZzczMlpfC33yjQ0j@gondor.apana.org.au>
References: <20241108102907.1788584-1-avromanov@salutedevices.com>
 <20241108102907.1788584-12-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108102907.1788584-12-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_034103_611871_66A62F4F 
X-CRM114-Status: UNSURE (   7.42  )
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

On Fri, Nov 08, 2024 at 01:28:56PM +0300, Alexey Romanov wrote:
>
> +struct meson_hasher_req_ctx {
> +	u8 state[SHA256_DIGEST_SIZE + 16] ____cacheline_aligned;
> +	u8 partial[SHA256_BLOCK_SIZE] ____cacheline_aligned;
> +	unsigned int partial_size ____cacheline_aligned;

Is this alignment for DMA? If so you cannot use ___cachealign_aligned
to achieve what you want.

Instead of this check out the crypto_ahash_ctx_dma helper.  For
an example driver doing this for DMA, you could look at caam.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

