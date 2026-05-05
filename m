Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F22CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa4FvNdcfKy9+gkU9d/DdDn+rwcZnnR9EEGoAOReuwQ=; b=lj6xFFEaG+h05RMprv3wkb46t4
	sPwNbtpWzaieuWbQ5YUBF8qin91H1itfnJU/jwsb2Zu7BNC0jF9bsE5QvdqtJuWNg/ZI9rceCfnlm
	SkQ/HELkVye5no9WGvbP/aSEhcNXylXTVC9P5/Ua32KNZh/g2NG6ptLGqtJAvnhq3dmL6vzZcbMdp
	xCX/fmMCQDwBCfNebHtC4t9IM2OLmOW/NrgNOh2NVhDIZ1ByA9FsSx85sInJk3x6qYIwo+yuPm75J
	tr2RYP8gMo/k/DhfLAp5dqDh6AeribPn2WkwN4QLcGxubLTY6qqfZacpMuSPsHAa1NHEgSyYA1HID
	eOWVEYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC1K-0000000FekE-2hoQ;
	Tue, 05 May 2026 09:24:50 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC1G-0000000FegD-0tRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=pa4FvNdcfKy9+gkU9d/DdDn+rwcZnnR9EEGoAOReuwQ=; 
	b=rDHkQJlx5WZGzILUr6NQ+0xhJ1pzanh6aAU9u4D3ovZJZDZ2h0Ifd6BZHc9B0aGpr7QLELhGaVA
	V1ZgeIF+OdqwaTRs+8K+44Gw7vGRAvYaspZ0WoeID3F0UhmCwCN9fxjNXXURbVKfdM+e4ivcwXSh8
	Zfkz+VphiaWtIJUBcsGe9Hc8DEBVbjNd1+prK+PBxdMm3HN8TzxwtcqfGsjkFtM3o9fGAvLtXE1V4
	MOAD7uDV74PiROidTopAR1XZCjh7Mw/6tll/vcpJWCO6yXfDyCpCtn+LiXzS6cRvbhO5SKBHAHIYQ
	VjIpDKNxotb35lqeaBWAInaSFIh8ncq9PRPA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKC13-00BNpf-2b;
	Tue, 05 May 2026 17:24:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 17:24:33 +0800
Date: Tue, 5 May 2026 17:24:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jeff Barnes <jeffbarnes@linux.microsoft.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: testmgr - disallow RSA PKCS#1 SHA-1 sig algs
 in FIPS mode
Message-ID: <afm3UY1ddNQowmSc@gondor.apana.org.au>
References: <20260423-disallow_rsa_sha1_signing_in_fips_mode-v2-1-a5fe72dd8a71@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-disallow_rsa_sha1_signing_in_fips_mode-v2-1-a5fe72dd8a71@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_022446_250511_D45D8EFA 
X-CRM114-Status: GOOD (  23.45  )
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

On Thu, Apr 23, 2026 at 11:21:41AM -0400, Jeff Barnes wrote:
> When booted with fips=1, RSA signature generation using SHA-1 must not be
> available.  However, pkcs1pad(rsa,sha1) can currently be instantiated
> because it is not present in alg_test_descs; alg_test() falls through the
> no_test path and succeeds, after which the algorithm appears in
> /proc/crypto as fips-capable.
> 
> Add explicit alg_test_descs entries for pkcs1pad(rsa,sha1) and
> pkcs1(rsa,sha1) without marking them fips_allowed, so they are treated as
> not FIPS-allowed when fips=1 is enabled.
> 
> Include both names to cover kernels where RSA sign/verify is provided via
> the pkcs1(...) signature template, while pkcs1pad(...) remains for the
> traditional wrapper naming and/or RSAES operations.
> 
> Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
> ---
> This series fixes an issue where SHA-1 RSA signature generation remains
> available when booted with fips=1.
> 
> On a FIPS-enabled system, pkcs1pad(rsa,sha1) can be instantiated even
> though SHA-1 must not be available for signature generation. The reason
> is that the algorithm is not listed in crypto/testmgr.c's alg_test_descs,
> so alg_test() falls through the no_test path and succeeds. Once
> instantiated, /proc/crypto reports the algorithm as "fips: yes".
> 
> This patch adds explicit alg_test_descs entries for:
> 
>   - pkcs1pad(rsa,sha1)
>   - pkcs1(rsa,sha1)
> 
> without setting fips=1, so they are treated as not FIPS-allowed in
> FIPS mode.
> 
> Both names are covered to handle kernels where RSA signature operations
> are provided via the pkcs1(...) signature template, while pkcs1pad(...)
> remains for the historical wrapper naming and/or RSAES operations.
> 
> Reproducer / evidence (current behavior):
>   1) Boot with fips=1 (confirm /proc/sys/crypto/fips_enabled == 1)
>   2) Allocate the transform:
>        crypto_alloc_akcipher("pkcs1pad(rsa,sha1)", 0, 0)
>   3) Observe that /proc/crypto now contains:
>        name   : pkcs1pad(rsa,sha1)
>        fips   : yes
>        selftest: passed
>   4) A simple in-kernel demo module can instantiate the transform and reach
>      the signing path in FIPS mode.
> 
> With this change, attempts to instantiate these SHA-1 RSA signing
> templates in FIPS mode are rejected, preventing SHA-1 signature
> generation in approved mode.
> 
> Thanks for taking a look.
> ---
> Changes in v2:
> - Rewrap commit message body to conform to 75-column limit
> - Fix From/Signed-off-by address mismatch
> Link to v1: https://lore.kernel.org/r/20260422-disallow_rsa_sha1_signing_in_fips_mode-v1-1-1359bc7d41be@microsoft.com
> ---
>  crypto/testmgr.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

