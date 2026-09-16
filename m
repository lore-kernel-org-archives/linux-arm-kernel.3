Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCF9C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjWLBXziSfbMmjc+Wud8zKSR3wwT3IM7uisQyzdCm2k=; b=ESfHSDx/ClJB1MCEx174Hz7R1N
	JuimNHKTjh/ZQfgd8bWLlPlSOFRBpjBnsPEGsfeYqWRa9/doiUN1pZPKK8AH2ZmuVbWnpfbbeb2J2
	Xyn6eeuJBh/MpongmwhUYqodtH050joCCtDCWBXZIMLsuq8IypGjWrutDpDcLZMKkF/Ki5KTAui+n
	+a7aF9eqZ8+8RHS02KKNgpEMnTXv3nHRpqfQ1+bW3cvHkuPsLiCilAEpgWayNCq7hUbK7VeH7LAer
	C95Q1M/VtxEn9iL9MHVj0pwKo6g2pDnZjx78u9Pkq7v6T3ZgBi8e0Uil5ZdSL93ZFuSZdfm9rg6zM
	V9gYTsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v7M-0000000A188-43r4;
	Wed, 16 Sep 2026 19:16:28 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v7K-0000000A17f-2XUr;
	Wed, 16 Sep 2026 19:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=KjWLBXziSfbMmjc+Wud8zKSR3wwT3IM7uisQyzdCm2k=; t=1789586186;
	x=1790190986; b=PNJKfhKpI5Hq7H0DkkAk9s4vGjBgmV1hzu2WU1Bke7v0lKQxcCfyg3QXAdxx6
	D9ZH3leM1djwTUfx3J4O/5vzrx/kplTye11Ix/QTbd6tBNcEIJcTmc+liM4KviQLPmFnospKRBTBW
	3wDInXHbmvcwJRMhLNnjx+AhzMiZQDHam80/0LxUuxK0L4UqZ0mASnbCgFjymW8j3NUGRyum3vprL
	9Lxl20/fAGkr86WSRJf3ChlDt5sAtR6OdA1GPlUJ3XoI+ULyd5dq8+cANJQcHYfbX5b8bYphvI1ay
	bZ4RKaAVO5M13XWXJycCrJWAJhy/YalfQQgolN8GZvY1MnDUyQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1x6v7B-00000001CYG-2LFT; Wed, 16 Sep 2026 21:16:17 +0200
Received: from p5dc55206.dip0.t-ipconnect.de ([93.197.82.6] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1x6v7B-000000034Qk-19k9; Wed, 16 Sep 2026 21:16:17 +0200
Message-ID: <1835e3f1b7e936479964f5e40583133484510d25.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 5/6] sh: Emulate two-byte cmpxchg
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Bradley Morgan <brads@mainlining.org>, "Paul E. McKenney"
	 <paulmck@kernel.org>
Cc: frederic@kernel.org, neeraj.upadhyay@kernel.org, boqun@kernel.org, 
	joelagnelf@nvidia.com, rcu@vger.kernel.org, Andrew Morton	
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arch@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	linux-snps-arc@lists.infradead.org, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Chris Zankel
 <chris@zankel.net>, Max Filippov	 <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 21:16:16 +0200
In-Reply-To: <20260911192540.20983-6-brads@mainlining.org>
References: <20260911192540.20983-1-brads@mainlining.org>
	 <20260911192540.20983-6-brads@mainlining.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.197.82.6
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_121626_802882_632383DA 
X-CRM114-Status: GOOD (  14.32  )
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

Hi Bradley,

On Fri, 2026-09-11 at 19:25 +0000, Bradley Morgan wrote:
> SH has no byte or halfword atomic memory operations, so the
> __cmpxchg() switch routes case 1 through cmpxchg_emu_u8() and
> lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
> which is declared but never defined, so a two-byte cmpxchg()
> fails at link time. Route case 2 through the new cmpxchg_emu_u16().
>=20
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/sh/include/asm/cmpxchg.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.=
h
> index 1e5dc5ccf7bf..477d3025a441 100644
> --- a/arch/sh/include/asm/cmpxchg.h
> +++ b/arch/sh/include/asm/cmpxchg.h
> @@ -59,6 +59,8 @@ static inline unsigned long __cmpxchg(volatile void * p=
tr, unsigned long old,
>  	switch (size) {
>  	case 1:
>  		return cmpxchg_emu_u8(ptr, old, new);
> +	case 2:
> +		return cmpxchg_emu_u16(ptr, old, new);
>  	case 4:
>  		return __cmpxchg_u32(ptr, old, new);
>  	}

Odd, I thought this series was merged long time ago. Was there anything hol=
ding it back?

Either way:

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

