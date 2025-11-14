Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D3CCE7AAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn+WZbkFWl9GEXlWzbgdsX9misJw5iBF5BGbREwNIdQ=; b=D/dx1BAZIv1T92t9EPgpp3hAO5
	iyGUzKrHDvmQhBU6hQYySS82GtgK0QOv2WYEYhD+180FANj5FRA5l3GbtEKjucmNUgWlC5h7PAaWb
	mjOuTal8ycygfqhpIOEpG9b7yCyet77cJLD7aC/j6sA2W/Pp0ZQcsFjTZwSsvGmTu2nfn+EEQ+vtU
	cwSwhqxBukOoBXYgH5+tbzauyZNM0BmqUPT+kbwVOd429doA4rweMMd22W/c8S8imV+vtz8ep5a62
	TvjAYSKuIi/btwLgo5Kq9x42vjY6K41aILGSKMsUNV+VqCoNf541H05sdgCpHM1zOgi98kD+3tv7K
	URjfexGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqxg-0000000C0PF-2Ki4;
	Fri, 14 Nov 2025 10:23:24 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqxW-0000000C0Ky-1nJT;
	Fri, 14 Nov 2025 10:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=zn+WZbkFWl9GEXlWzbgdsX9misJw5iBF5BGbREwNIdQ=; 
	b=ZnU1QTQ2Ezz66z5U+K+2XVzN9FSC9x7fI/wpDa0JR/y9hD98yNP5vNBBSB7/i4ZHJDzA3Vg6agJ
	lZr/mJYkNxLWGhRY11EXNWP1m7kkhxAN+huwmjXhks6BcV88MvvVovp+w9+73Sz+Rj4c05YdKmf6V
	YZx5Ap76TF7SxcHstmXugmQXRRsYHjw1dxIAlM/swiq2a9v8W4OA0Csy5dCyPTZS4CQIIYC9lFHVM
	iWOw+pltNGDErFgNtW7dTYl7QYft3IxP8TFQsFAV/CLvUUgU3C+Xl5wTWub0z9STMqcPwdSaYROej
	N4tt/J9N2G1zTGvWU9cYAhGQqCnoWlED3cvg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vJqwu-002yOl-2q;
	Fri, 14 Nov 2025 18:22:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Nov 2025 18:22:36 +0800
Date: Fri, 14 Nov 2025 18:22:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	"David S. Miller" <davem@davemloft.net>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	linux-crypto@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com
Subject: Re: [PATCH v2 0/6] crypto/hwrng: Simplify with
 of_device_get_match_data()
Message-ID: <aRcC7NzNk7__6hb3@gondor.apana.org.au>
References: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-crypto-of-match-v2-0-a0ea93e24d2a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_022314_483495_3A342A9F 
X-CRM114-Status: GOOD (  13.25  )
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

On Fri, Nov 07, 2025 at 09:15:47AM +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - crypto: artpec6: Add missing (enum artpec6_crypto_variant) cast (to
>   fix 32-bit builds)
> - Add Acks/Rb tags.
> - Link to v1: https://patch.msgid.link/20251106-crypto-of-match-v1-0-36b26cd35cff@linaro.org
> 
> Few simple cleanups, not tested on the hardware.
> 
> Care has to be taken when converting of_match_data() into
> of_device_get_match_data(), because first can check arbitrary
> device_node and the latter checks device's node.  Cases here should be
> safe because of_match_data() uses 'dev.of_node'.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (6):
>       hwrng: bcm2835 - Move MODULE_DEVICE_TABLE() to table definition
>       hwrng: bcm2835 - Simplify with of_device_get_match_data()
>       crypto: artpec6 - Simplify with of_device_get_match_data()
>       crypto: ccp - Constify 'dev_vdata' member
>       crypto: ccp - Simplify with of_device_get_match_data()
>       crypto: cesa - Simplify with of_device_get_match_data()
> 
>  drivers/char/hw_random/bcm2835-rng.c | 11 +++--------
>  drivers/crypto/axis/artpec6_crypto.c |  9 +++------
>  drivers/crypto/ccp/sp-dev.h          |  2 +-
>  drivers/crypto/ccp/sp-platform.c     | 17 +++--------------
>  drivers/crypto/marvell/cesa/cesa.c   |  7 ++-----
>  5 files changed, 12 insertions(+), 34 deletions(-)
> ---
> base-commit: cec65c58b74636b6410fc766be1ca89247fbc68e
> change-id: 20251106-crypto-of-match-22726ffd20b4
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

