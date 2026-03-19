Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A321090254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJUbYvJfq+3IC26kd8KWdP3fbF+kMteQj038PWadu5g=; b=3YkN+USHhT6YQE
	WKzlotOPvTMqmfdMw3H0j3Fr9BaNyxr3Xvg/Zk6D3ONagxKsUbB3ohvjsS98vYHuTho5PAtbr6Dll
	63Gw37AnZ7CPaKcwqw9LOgd3XWAble0b1+vfyy63QEe1/8DHLQwGCqcavQ93XOJssbT9luDQmdxyg
	yUjVvrRzbwnKQ23f0L+iVM+UJKpWxM4z/X7T6E80nJ7MrS2r7jw54185AYt7sVUbXgQrOu+Q8KVUY
	OLSgSRWWrKz8iVOcf+RqyDz1ucFJ2x3hr6saE3bSGjgnEAoOD+wjb1gDqbqL70Z45JALJ3PWva+mh
	PK1UfIlqdAunff7b+Pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GNG-0000000B64w-0OyI;
	Thu, 19 Mar 2026 16:37:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GND-0000000B64U-2m1v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1905843EC7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 16:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF83EC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938247;
	bh=HJUbYvJfq+3IC26kd8KWdP3fbF+kMteQj038PWadu5g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Blc4j9ywjSXgM2SgrXqWZjaYgze3W3EgDx6sNFYgE6ODJ19DVrSUyGpifgRF+ISla
	 5Zo3YRUjvJh00wIaTSU/Px0dIEBRbrGGRdN4zUd4uEVU9Cghp0RWwPvl4tyVBXGFVI
	 ni2oKTTgI8hWeWnwgU1dH4f8YpzFYgU5JuYDDfP0L8bVy4F7pNowpJY+uJEDilhxtz
	 FAN6hauamxiVzOu8ws4CYwofw9dcRncoLlp11fSPkMpLS6ye9wdm+uXBot+j5Jdifw
	 ArsVa46Kep7pMdxlD+mQPnmAnTqMXLj8FvqnhIxtqiE04d6cdIzcd2J3t1TbMYG0js
	 46arBIJlPzYbQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38b3ee785a5so9935681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:37:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtDA4o2cEqjaRdWI7fkAIXhzXg+Nz5/97UasW8ltlfaH1+E3teIho6kEOaoN0gNZ0jXR21/hCqJW/dtxynFW9j@lists.infradead.org
X-Gm-Message-State: AOJu0YwuZVu6ccXsMHbKjRIbWBgzSfRBphKVbH11tTCdFp1YD36ngALW
	Saz/Ta76Sho8K2sCp6DR3uNyGbJRKGwzePFI42P5eNfvlF82RSjQyOgr7awNZq1xUqmTzIjVic0
	j0kuNIjpUvn7k+paG7JSpx4vZZz4+CzY=
X-Received: by 2002:a2e:a60a:0:b0:38a:d2d8:ff5d with SMTP id
 38308e7fff4ca-38be5f88870mr9495851fa.16.1773938245262; Thu, 19 Mar 2026
 09:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl> <20260319-rc2-boot-hang-v4-1-4372f47cb6b8@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v4-1-4372f47cb6b8@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 00:37:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64i7TVKr7m9StcPMLTj=zuyn-GnxrPJO=HfGVEhQp5yBQ@mail.gmail.com>
X-Gm-Features: AaiRm523wOClQT2OuM3ghYiz0iYiL8-8Z_HbZWazzqkJObzfX4ME4RRi3z4vRqo
Message-ID: <CAGb2v64i7TVKr7m9StcPMLTj=zuyn-GnxrPJO=HfGVEhQp5yBQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: sunxi: pass down flags to pinctrl routines
To: michal.piekos@mmpsystems.pl
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_093727_745342_1872F8BB 
X-CRM114-Status: GOOD (  16.03  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 12:10=E2=80=AFAM <michal.piekos@mmpsystems.pl> wrot=
e:
>
> From: Andre Przywara <andre.przywara@arm.com>
>
> Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
> which the new SoCs (A523 family) need to use. We now have a comfortable
> "flags" field on the per-SoC setup side, to tag those quirks we need, but
> were translating those flag bits into specific fields for runtime use, in
> the init routine.
> Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
> some of a boolean nature.
> To avoid inventing various new boolean flags for the runtime struct
> sunxi_pinctrl, let's just directly pass on the flags variable used by the
> setup code, so runtime can check for those various quirk bits directly.
>
> Rename the "variant" member to "flags", and directly copy the value from
> the setup code into there. Move the variant masking from the init
> routine to the functions which actually use the "variant" value.
>
> This mostly paves the way for the new A733 IP generation, which needs
> more quirks to be checked at runtime.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

