Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFB5CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 04:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFVF8hcyyJXywbekbwZWS0m4c7TNp2T6eU3I4HWZyY0=; b=2SVSCw7CFkZj+zHPVJ1OZ3HCoa
	Hi6bGB5Br6txlAUskL+DnTu3fE1G2k5jDlPxwuylsS7lG3nH1q1xvLHVLpj+CIHEb43y5uEorRh/S
	cJJI8sVd7UeTxLGRAe+Zp3n19NyNM/URYTk1dheQ3u3TvN11SnFxKHZZOqqin4+QVD+5hFVTDWRXX
	QKADXffRiZqVgvXs44Va0DjMDaFDQE32UH44KW9YodaS2YPBEa7ghhTNImVwo2vCU3ONLEj+XQ432
	eWQ0M5Fzs5TaDbtc8mBXWIxQ363eFd2qvov35L9+3ikgSgeQFHGdwse9AteSrcEMmFOH2O6GPnRO8
	Qafgp05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGrh0-0000000ErGh-3qBd;
	Thu, 06 Nov 2025 04:33:50 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGrgy-0000000ErGF-10KG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 04:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=xFVF8hcyyJXywbekbwZWS0m4c7TNp2T6eU3I4HWZyY0=; 
	b=V21XD2ciC8mWSIgvOmJBojTX0vMkPP04EFgOkmJrcZN6TmUxITVstbnIrV/jq8J59DNAlgvtJJW
	8swxpyfbZI4rL0lT3mcWtbRm47/wW3EfQZy7jEgDxtlYlo56YtYiPOVmnknDL5MlDsrZnm5L+tT1G
	kuWauin+hDLmcwsxoaYndsq7nEDTrCKkuVFXYekNn31CJ3H3N75dTlo5/8ToFxxUjaJayDMZvO2zr
	SkEUCMpgq+bAByJDYFfBUaSv2PJqPzSylu5lP+QFpbIS7Pvd3HPXXSDOwDV2QjuyAYw+6eXC6PkhP
	XBmkEAhaESb9lOE2jHz/9HPse101Mi35PAFw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vGrgY-000qB9-2T;
	Thu, 06 Nov 2025 12:33:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 06 Nov 2025 12:33:22 +0800
Date: Thu, 6 Nov 2025 12:33:22 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Harsh Jain <h.jain@amd.com>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mounika.botcha@amd.com,
	sarat.chand.savitala@amd.com, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, jay.buddhabhatti@amd.com
Subject: Re: [PATCH 09/15] crypto: zynqmp-aes-gcm: Fix setkey operation to
 select HW keys
Message-ID: <aQwlEgMlYr8EPrTo@gondor.apana.org.au>
References: <20251029102158.3190743-1-h.jain@amd.com>
 <20251029102158.3190743-10-h.jain@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029102158.3190743-10-h.jain@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_203348_781949_93B88A4E 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, Oct 29, 2025 at 03:51:52PM +0530, Harsh Jain wrote:
> Currently keylen 1 is used to select hw key. There are -ve self test
> which can fail for setkey length 1. Update driver to use 4 bytes
> with magic number to select H/W key type.
> 
> Signed-off-by: Harsh Jain <h.jain@amd.com>
> ---
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c | 94 ++++++++++++++++----------
>  1 file changed, 60 insertions(+), 34 deletions(-)

The hardware key support should be registered under the name paes
instead of aes.  Grep for paes in drivers/crypto for examples.

> @@ -218,32 +220,42 @@ static int zynqmp_aes_aead_setkey(struct crypto_aead *aead, const u8 *key,
>  				  unsigned int keylen)
>  {
>  	struct crypto_tfm *tfm = crypto_aead_tfm(aead);
> -	struct zynqmp_aead_tfm_ctx *tfm_ctx =
> -			(struct zynqmp_aead_tfm_ctx *)crypto_tfm_ctx(tfm);
> +	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_tfm_ctx(tfm);
> +	struct xilinx_hwkey_info hwkey;
>  	unsigned char keysrc;
> +	int err;
>  
> -	if (keylen == ZYNQMP_KEY_SRC_SEL_KEY_LEN) {
> -		keysrc = *key;
> +	if (keylen == sizeof(struct xilinx_hwkey_info)) {
> +		memcpy(&hwkey, key, sizeof(struct xilinx_hwkey_info));
> +		if (hwkey.magic != XILINX_KEY_MAGIC)
> +			return -EINVAL;
> +		keysrc = hwkey.type;
>  		if (keysrc == ZYNQMP_AES_KUP_KEY ||
>  		    keysrc == ZYNQMP_AES_DEV_KEY ||
>  		    keysrc == ZYNQMP_AES_PUF_KEY) {
> -			tfm_ctx->keysrc = (enum zynqmp_aead_keysrc)keysrc;
> -		} else {
> -			tfm_ctx->keylen = keylen;
> +			tfm_ctx->keysrc = keysrc;
> +			tfm_ctx->keylen = sizeof(struct xilinx_hwkey_info);
> +			return 0;
>  		}
> -	} else {
> +		return -EINVAL;
> +	}
> +
> +	if (keylen == ZYNQMP_AES_KEY_SIZE && tfm_ctx->keysrc == ZYNQMP_AES_KUP_KEY) {
>  		tfm_ctx->keylen = keylen;
> -		if (keylen == ZYNQMP_AES_KEY_SIZE) {
> -			tfm_ctx->keysrc = ZYNQMP_AES_KUP_KEY;
> -			memcpy(tfm_ctx->key, key, keylen);
> -		}
> +		memcpy(tfm_ctx->key, key, keylen);
> +	} else if (tfm_ctx->keysrc != ZYNQMP_AES_KUP_KEY) {
> +		return -EINVAL;
>  	}
>  
>  	tfm_ctx->fbk_cipher->base.crt_flags &= ~CRYPTO_TFM_REQ_MASK;
>  	tfm_ctx->fbk_cipher->base.crt_flags |= (aead->base.crt_flags &
>  					CRYPTO_TFM_REQ_MASK);
>  
> -	return crypto_aead_setkey(tfm_ctx->fbk_cipher, key, keylen);
> +	err = crypto_aead_setkey(tfm_ctx->fbk_cipher, key, keylen);
> +	if (!err)
> +		tfm_ctx->keylen = keylen;

You can't have a fallback when there is a hardware key.  How did
the fallback not return an error here?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

