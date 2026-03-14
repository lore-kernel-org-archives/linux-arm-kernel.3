Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC6B107BCF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qTAXHbi8wFOK4Xven3Jy2oD3hr9BGnd48GuXiXwDkw=; b=BS/Qr3I6nO5AQqvPFEqiKJiq6K
	WHmUonZIP9J1g/jzzQN8Pvn8ZEJWWsgh3zMmH0riK/dRulSyxDuIfme4LvRg4DMsF7FGj97+tyDp7
	t1JD3ROQq3jhx41Qus7xScx436Br3hon+nPq+d8/52X0cHvPk6dsfAVGt4KTzFl54LCdaBEI1FWaB
	8lKE9LoFtdHT+yvCAtNh8gtTbZsduSB+IenbNvigU9lv0EA1x4COAHFYgVrrcHs5UBfSIheLKzaCY
	B67HTFeTXd8VfVxF45k3z9CMM6OCisz2lj1l4sTtWm6DoVuiivFkfRduJqhBMY7NnotiNKeBQefeK
	mWWhFkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HIK-00000001VZl-45rK;
	Sat, 14 Mar 2026 05:12:14 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HI9-00000001VYz-480y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 05:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=/qTAXHbi8wFOK4Xven3Jy2oD3hr9BGnd48GuXiXwDkw=; 
	b=CebeX5XsrXyoZbxNL5JXZtac21WNi/Ii2vit9eIZqq0JkJUp0ENFTW3BDjZH/UfTyQ/0PS6NI/y
	bcQxEEKwC83345K16jO/3Y+G7ZEHufbRabH9UIHWaGKKpDcEfKjxWdBMlY7zDeKAAA8ogq7tvXiu0
	A9Hw31SnXy6BXfXeF/ncsukXYqYrXZwfjv/7hztrmJNmyNnDED4IJ84KTTyQVdVUlKlLgsYbMfkk3
	4vnqRM4NWDhqhqd13Wjayae68QaPQLO2cGR/LyHl6LDqGIo65PIhtIGdtdoz5ly1Ji5Hv1TelwIYl
	3WBntw562CLftSj99zudb6CWCzMDIEY2KTLg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HHy-00EL7k-1c;
	Sat, 14 Mar 2026 13:11:51 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:11:50 +0900
Date: Sat, 14 Mar 2026 14:11:50 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Joachim Vandersmissen <git@jvdsn.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
Message-ID: <abTuFto8Tc3mhRRe@gondor.apana.org.au>
References: <20260303060509.246038-1-git@jvdsn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303060509.246038-1-git@jvdsn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_221209_457824_ECD8D6CC 
X-CRM114-Status: GOOD (  13.72  )
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

On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
> xxhash64 is not a cryptographic hash algorithm, but is offered in the
> same API (shash) as actual cryptographic hash algorithms such as
> SHA-256. The Cryptographic Module Validation Program (CMVP), managing
> FIPS certification, believes that this could cause confusion. xxhash64
> must therefore be blocked in FIPS mode.
> 
> The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
> ("btrfs: switch to library APIs for checksums") recently modified the
> btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
> API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
> mode should now have no impact on btrfs usage.
> 
> Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
> ---
>  crypto/testmgr.c | 1 -
>  1 file changed, 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

