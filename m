Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C052DCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=; b=XTMe15KlfD99l3yYk4MTfBoxJj
	4r0awWNEH4UvDptnkIGqu0qSC8sUmmvFUs1PXwiO+Wkf6BqoVia3xeZRPh8jvBZTYav9fp/UdgV4e
	J2BZ9YUPWugZu/zDbR5OCG9VpBnAGybXqn/ih1Mjr3lccCjHIBWIUpl4jwz9UdsXEpMnZYGSSiKW1
	SYeOtRsxyNekWmCbI3paCZiWzNfJDMvGwzJ0FbsC9ahtZfPc+JuZjtP99Xisj2lu6Pcv8JfbCV9Dm
	s+LEQdjR6LiOJLb3bSciTpmkXKxjvcbgNi4dBtU/2G5/+3i7+6lEP3UoXMzxr+pWjxYXgWXMfI3iE
	3S+GxehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNMh-0000000A9Qb-1n41;
	Thu, 01 Oct 2026 20:26:51 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNMd-0000000A9Ov-2mEx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 20:26:49 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso2631801a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790886406; cv=none;
        d=google.com; s=arc-20260327;
        b=MCrpYg1OJ/wmUo3oo4bgDBCUHTg93qfgLsSD24q0gHkbEOxHHTH/DbHE7rvO/rVG1T
         0+VguTwifKXttp9q6daduZesFpul4eVpVFw+LIXAAUaI7VngaWyPAZKLteLVjujVWmTs
         UJjF87jxrlJtqaF0po8I8478GAeEA04wj87T8qgDYm0e7wr5Jv7vJieGakCgZWAkZpme
         zj+fmfbJUZb9GThGYiry2T/px0cLI/DaNsjkX0WuZpFjlAHVqSONnwcHCZbV0j9/W02O
         w+h4DAB1Wk1Ow0z2FwhYBNJIH6tmFTBh5QkUSMsk6EytOSzPgbZAcR4O9NJ/hMq06IzC
         eauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        fh=IEpzYHgnqXbHC8NQCSi5JIdZVJxvElQ44ipZoA3kw7s=;
        b=rJRsxareQGjFsPRynfyJ2+I3U3H8SMjMCSz+iXk6RPlFCpty1gsKnwS6zss2DYO42h
         fSKVvrdlqyqbcTtz7MsTdgU1HgNo6c9doPUHInn5dAPfvzsxsJ9bhtybpZNIrPLS269I
         Jcxjotqet7da3+EJaUlQMvks0RPqwSkbGb3WBPz4WGGWq/VghFn9KftAsCP+OtwpfwAk
         3ewM/1unoDXQUFID7SPM47UjVgZ9b3FLwLhk/3aNFMBjIsGIgtwcpJQW4KkvxwpRLGVb
         8YAZfoOhoedXm/4EVz2uD1/76+C+dxyMTad78lh6w+I4ib3m+5TIfyBvvEpxOeY6PhJm
         xMQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790886406; x=1791491206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=EyjYsfnfAijQPEh9f69pb5pYfdrIEuxEN+JwmLoxSOTFqouCIdonT+UPURHMri0dSF
         yE3mDO6tW6jMVYo/wx3c+uCZ9mY+7QolozWsrVUwe2w3kQD67i1AtJUvIPfYUYyH6dr5
         HrujwNX5tHPyULoVSnqSMN+AUv+ErVhS1h8Az7pAWxvrdAoHBf7Y2kFRQWAfmoHU568D
         yOUll+dVUZ1uZnPyK+cxbA79Jk5lGRUPOfRCnKexK2vsUwJNas0y8ecPCI7hffN3DdXL
         E0+z3o39qQjpJ3DDPYeQutuZ4bTE3u79Biew5Ok6CW1JohCk2QkoMQ4WpPm75QOk1ubC
         YrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886406; x=1791491206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6TVfXTKVxrz9QFCIxsDL9oMH4UbJ/LAus5tXSrEGYs=;
        b=AOGM1Hqt8l3jJdnh9Hj6d4vhKOQ1uOj5hSvu27D47IwMnm5bv5guxY5CnT767L325M
         C4ink0Pnn/+YHh96WHjFjmug9ZEUWdSnt0yEzlGGT0bUuDMGFzslV6EagnROY2SD4GKx
         D9W/lfh6xtKBR7RbxFB6Y0I5yV13u+1Dl6BIfZr4Ln5JOyxosFkABHxFHb7/03ae5RDD
         EnwNZ/z41QExj87nzF/CQD1qUxkXX/vBKzm3ZqxFyns9G6XfjcHq2FmdFQSJWbOQUKAz
         6MFrjITK65pvHa8NLdYF1Dtdo1gf7MpPjlYHB1cKR3kgg7EDzRPGw9RkFZroS2YxnmUz
         2ORw==
X-Forwarded-Encrypted: i=1; AKwUvBx8moMvc8MpMKhfOsDjjKKuogfwrvfXxIduQYpAfb+IRuGJJktqjwP/r6/8y2RLQ/H6SbTq235DbpYs0fPdOy96@lists.infradead.org
X-Gm-Message-State: AFq9FYJTC+SNdqAV4JueD86NiBAKTPfRfGOWxwlDKZqjm2IU4/CYuUtE
	EzVgbspDyX2CzZiHOb66Y7Dt3hIJ7d7MCCj74A3R0NZi1pisWiMj1up6u+SQ0s0u/HDjBawmLli
	/LXPKCiuHbXu7eq5frEpLKng3WXJrBwBCY9XnkIQ=
X-Gm-Gg: AYBFou3BOwUhL+bhq3FqkwNA4rU9xX0+JZFcG1hM1biJTzE+Cmp98ysQvinshEDgBm8
	RfZuhgI8lJA5ZY4Jvsnje/QX7nPgexn7RLf5fHYFJDSG9I1eFQOzRo81fLeehuOi6l1pA8f/5uv
	uITusy9WcI+oxvAP/1BWjc7PqLVobgJDCG5daRX+AWcNTFG7nRGXZ6B/PlQn7a0JPae/5N81bJz
	XL3CPSW5v7EDpDq2QTNP+bxQQZhtscgV2LjcdLlz7m0EOlo5jVPq3awz/z4SSpa6PSsAi2F3yma
	TZvbrDRYkFEc3QLgxIJ/ORdzSCE/Ajn++w9ibdamlSlJoCipTxokgaUBWeelPr78wMP7FqY=
X-Received: by 2002:a17:90b:2f04:b0:39e:6c69:f46f with SMTP id
 98e67ed59e1d1-3a6ceb1b955mr639282a91.46.1790886406217; Thu, 01 Oct 2026
 13:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com>
 <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com> <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
In-Reply-To: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 1 Oct 2026 21:26:01 +0100
X-Gm-Features: AclHuK9su90nDg_1A2BHnYBV31GZYMfhNVL2X1sfHL0TTMmKMafI4E752265Oww
Message-ID: <CAAxh=js3PiveOSst0brWjw7q+pOXTUbKNahOUcwyEuM0oW0gpg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Linus Walleij <linusw@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_132647_708770_6FE87A61 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Andre, Linus,

The B288 only has IRQ banks for PB, PD, PF and PG (banks 0-3). With the
current code it would need a made-up first interrupt; with this patch it
doesn't.

Which way would you prefer for B288?

Thanks,
Pablo

On Thu, Oct 1, 2026 at 8:28=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Thu, Oct 1, 2026 at 2:31=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> > So we could revert the DT patch, and take Pablo's code patch, with a
> > Fixes: tag, but that would create some broken combinations meanwhile.
>
> I see it like this was a bug in the DTS file, so this if fine as-is.
>
> > And in any case we should add a word to the binding document, to pin
> > down what's expected here.
>
> Can we enforce it with YAML constraints or is it too open-ended?
>
> Yours,
> Linus Walleij

