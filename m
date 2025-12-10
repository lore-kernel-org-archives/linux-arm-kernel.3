Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599C5D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrKso70wVVWjue/CQR9RwpubBwZmBxzK04Di9VZ8ctw=; b=pd92YRtEpRT/eu3QdJtx7qfmFz
	BqxmYpePvqKOZ6VbzYTvBfHqLxk3C++mcVvSZ3b+HEcDEJa0cHisRUA9huNRdlxTBko8466Sf9w6H
	qYI9wL8XBKpDT6yN5nJwxLCAuZSAuQoVyf2izON5LfXP/OA9vdbMAudLawUABAxaRERdGE6NmIcq6
	QJ7b9zpnk/J4/Wzx5SHeDA/lY44XD8TBpJeAsfwZKLppTkezVGTYbwKsJBjpQTc1od9ok4wOODDRU
	wnHzi4KkKf+G96xus5eHwIdKZJyly6hy9kqcPdm4LtxqvxXH3GkCo+QlAZde7IpSNPBCQyE+ePjoM
	5bPyuNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGYC-0000000FHk5-2t6z;
	Wed, 10 Dec 2025 09:32:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGY9-0000000FHjd-2xqH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 09:31:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D99D40B51
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 09:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E080C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 09:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765359116;
	bh=PVlMWh9gYQN3TI3V9YA8XnqbZc6K7zFyFj/h07fH4qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ViyC+VLG3ybMm5t75PamWhZn6T90Hy3kpGzQPLWOyfZC3lNQFIVfePwS8g1chGU4Z
	 A0DRMD5ofASs8Ty+U3YJ6I5383kNSKUuLzSq6rElrREe8kR18wzYx/DYuaM5/cfeva
	 4ag6izFEVpVKtFgVF2AgzE/VHqlUZn5jg57lmAvSOCz+fRBtTlBVqVGWMJomcYkzlT
	 PR1rvkzMnAADN8tjzv7proHx217bQXNpDeLIin6JwltB2/X2BWkTVgi79W3zgzx347
	 a6YXe5lHEa5aP7sZX68U5Vxcf0KfdgjMQN0q35j98b7bftrruKjPDyXydNq710VRxT
	 6kXBOe8tW+Pbw==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so4551685a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 01:31:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUD+uDRL6g22ehx85DnCZ/ccj36/rtn6DvJeibM+szTeHyyVv7bXdIJzf/egnhdwK6y+swr0ijIQI2SuU9KNfxg@lists.infradead.org
X-Gm-Message-State: AOJu0YyH8FTEpBvevjWU07BrW53LdgxVZNnJEYEbFV/Z5I8GHMdbkC4F
	lLdH1uGvoO1LfhvnnFXg+WlxldtlShFExKZkhuF5SCW7kar2zV2IbZtqltTvpHyOg8fWWGiOFJ8
	m+LPyOM2UUdkQYyxydoXPTVzsYtUEcYs=
X-Google-Smtp-Source: AGHT+IFbUzutDYOyNafJhVUQCfe03Kk/KJCoOpuuukf7EzJ8t34omxbEQyu4UCtUp95JppOxVQPmT2fqF4QZ7caNNLU=
X-Received: by 2002:a17:90b:5748:b0:341:124f:4746 with SMTP id
 98e67ed59e1d1-34a7288bf9bmr1452104a91.31.1765359115916; Wed, 10 Dec 2025
 01:31:55 -0800 (PST)
MIME-Version: 1.0
References: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com> <20251209223417.112294-1-ebiggers@kernel.org>
 <DEUFDH7FJURL.3J0FN5I19VV8F@cknow-tech.com>
In-Reply-To: <DEUFDH7FJURL.3J0FN5I19VV8F@cknow-tech.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 10 Dec 2025 18:31:44 +0900
X-Gmail-Original-Message-ID: <CAMj1kXEQkB9MWB+PAi4XE_MuBt0ScitxTsKMDo1-7Cp-=xXOpw@mail.gmail.com>
X-Gm-Features: AQt7F2q0ooNszjnIOtFVUY88MsdG5GCslssi1O_Ntmt3L6KAaaMJKGXC5X9ZZHA
Message-ID: <CAMj1kXEQkB9MWB+PAi4XE_MuBt0ScitxTsKMDo1-7Cp-=xXOpw@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm64/ghash - Fix incorrect output from ghash-neon
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_013157_787430_553B114C 
X-CRM114-Status: GOOD (  20.99  )
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

On Wed, 10 Dec 2025 at 18:22, Diederik de Haas <diederik@cknow-tech.com> wrote:
>
> On Tue Dec 9, 2025 at 11:34 PM CET, Eric Biggers wrote:
> > Commit 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block
> > handling") made ghash_finup() pass the wrong buffer to
> > ghash_do_simd_update().  As a result, ghash-neon now produces incorrect
> > outputs when the message length isn't divisible by 16 bytes.  Fix this.
>
> I was hoping to not have to do a 'git bisect', but this is much better
> :-D I can confirm that this patch fixes the error I was seeing, so
>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
>
> > (I didn't notice this earlier because this code is reached only on CPUs
> > that support NEON but not PMULL.  I haven't yet found a way to get
> > qemu-system-aarch64 to emulate that configuration.)
>
> https://www.qemu.org/docs/master/system/arm/raspi.html indicates it can
> emulate various Raspberry Pi models. I've only tested it with RPi 3B+
> (bc of its wifi+bt chip), but I wouldn't be surprised if all RPi models
> would have this problem? Dunno if QEMU emulates that though.
>

All 64-bit RPi models except the RPi5 are affected by this, as those
do not implement the crypto extensions. So I would expect QEMU to do
the same.

It would be nice, though, if we could emulate this on the mach-virt
machine model too. It should be fairly trivial to do, so if there is
demand for this I can look into it.

