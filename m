Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F91CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQo9GljdLmdbeEeiw6ApyWFF58QpjBFLNSfOrSlcJq4=; b=jS3j19E9c9iGh95n54NTw5SpS6
	XV9xiEE2HuYT8+x5TD+LrU2PhmrSTEkuoMANq6jpbFUwUjXZ71v9veJo+zblnhs6kMWR58hMMs/lj
	kerFjJOIp7uLxN+dAfLOhwqMbtTs+NGffuI53H6O60fCZFyw9shTDLWX6EBVvFFDd15hOmJQ1RG4W
	NLUfeV7d0feXqdJwHtoEpYzKrI6BdzLGqd9OEQXEdv5PUqw0Mij5PWB+BH6bUcM2FJwQPonO8tX8G
	via9HYt7p3DyI3/UvwssTWkDSokF3GWSK46qJyZf9QMHASrhKEGCHgj+9Qet4LxbDyxJgfCUt0fEt
	GQfheiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWMS-0000000BD8F-2Qxd;
	Sun, 19 Oct 2025 16:34:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWMQ-0000000BD7f-0ius
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 16:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88D0A45B92;
	Sun, 19 Oct 2025 16:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332D9C4CEE7;
	Sun, 19 Oct 2025 16:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760891661;
	bh=/NRRdUmhRaH39Ejf4m2sUH6ftZqYfftBYvCOeLeAB+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoZUXiWmUFW10a1JTRZpdih6o4vHlP6bLJG6+06VXJktkSRm5Cd1TCmTxS16rNd3r
	 ALWQjIRSV0xCsBZEgp/pOMiuYIm8CFcgfzYYWFPjb4Nlx9f91YPKQdbnXnZPJ7Awdt
	 GGsuTRrvl8QYJGVpKaOH4muF2nAt0BVsJpCdyay7gdd2r/qC7ct6zdwfMc1HF4ELBU
	 TubNBemLY6OZIWcDwHOLWFmlDg/38Nhg///DHb4PkvMqBn35EwzpwTl2Rti+H5cw6q
	 Ci8iYFVrH1ttyCOQcvjnOEOs9Z3G4rHqYVpkYpsdNg9COpzB/0XFwcT5W6VEGN71Qq
	 EfSnAFK+zQuoA==
Date: Sun, 19 Oct 2025 09:32:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH 07/10] lib/crypto: arm/blake2b: Migrate optimized code
 into library
Message-ID: <20251019163249.GD1604@sol>
References: <20251018043106.375964-1-ebiggers@kernel.org>
 <20251018043106.375964-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018043106.375964-8-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_093422_229599_EDFB8AB5 
X-CRM114-Status: UNSURE (   8.71  )
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

On Fri, Oct 17, 2025 at 09:31:03PM -0700, Eric Biggers wrote:
> diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
> index f863417b16817..5c9a933928188 100644
> --- a/lib/crypto/Makefile
> +++ b/lib/crypto/Makefile
> @@ -34,10 +34,11 @@ obj-$(CONFIG_CRYPTO_LIB_GF128MUL)		+= gf128mul.o
>  obj-$(CONFIG_CRYPTO_LIB_BLAKE2B) += libblake2b.o
>  libblake2b-y := blake2b.o
>  CFLAGS_blake2b.o := -Wframe-larger-than=4096 #  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105930
>  ifeq ($(CONFIG_CRYPTO_LIB_BLAKE2B_ARCH),y)
>  CFLAGS_blake2b.o += -I$(src)/$(SRCARCH)
> +obj-$(CONFIG_ARM) += arm/blake2b-neon-core.o
>  endif # CONFIG_CRYPTO_LIB_BLAKE2B_ARCH

Correction: it should be

    libblake2b-$(CONFIG_ARM) += arm/blake2b-neon-core.o

- Eric

