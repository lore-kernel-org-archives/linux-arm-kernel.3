Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3A3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=; b=pNsOYaLy1z5RPrm0AdFVKhlIvj
	o5zkJy/rAruIVBjyb+JMY3da6QZRexETeWki/bc0AIBD4xZdxHU/vWn+TdTB9QOC/lg60kvCHRC7E
	3h5I3InUUvB0TxkMYEp+kD3+bHiJ45el097PUN3DAtU1WVMERYiVeXcYhX6EDX+ytGY18/sqWNB36
	8SahkIykMGx1C/mHUJ44fp20Vdv7NdK6P/G9oz9VnifBZyy5pPIuf+U6sj98OcyD/JnfNL4FT1TsZ
	Rgs3aEyoWVnGG47Ef54gpvO8PNjOgO36Ju+hcFt67mbXQh2cTytKAkxlE/fbFdx/vp9QGENIf3CDX
	CD4HVRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Lo-00000006tDl-3WoH;
	Mon, 17 Aug 2026 21:58:36 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5Lm-00000006tD0-1Boi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:58:35 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so526327a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 14:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787003912; cv=none;
        d=google.com; s=arc-20260327;
        b=rEBc+Hj/kQJoVAq9ODsJaNy6ooc0CFuYONilg+cpR1DNG+QYZj+v0BhKDk79EWmPKx
         +r9RrbL9ngOhm1wxbkm6D6wAjENWgPxwgQGNWFNKb3L5hF8t/z5iIaINYySjEnJFZoBU
         sAowQRjfJcIuc6Ggy+xWuj8VsmW/EHIR+FG8CqQwSoBkD4ItvWvz8/P3cLme0hhWoLRW
         fYYMF20a+Z4bXOutCf/MGfZmtRU7jDjme0Ttbvg99d1+t4DQ4WpBHU5997RBN5OPlwMH
         Ek+hSYj/zqcmrAmGYm4CO8QmNc+ULQaTEFiGeDz6jaFrs86KHe2qa/pVR45On/XNTgOI
         GNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        fh=vnmP6SaTrHAoCKF/TTzZCN/ahwjPG451PYY2oYwb1/g=;
        b=G7cWPuW9Em9Bvc1o67ONodSioNS0FEU7MFPFA5v77okMLdPRDRKT+ey2pIWPzURfNV
         KmNyJgLO6jMd+9YWBbDd3OoshKMN5Yo4OeRIvvRMTCfe6wll76xhkWytWqVisMR16MPb
         rE85hnuaMT6yX8oJOjHKqC5l72PG7rNvg3pM+/CY8tZ+EODBM3/tc30ng1dP/+jSBQ/Y
         mJ7c5j3xxbMs/qpKhKlACO5m98bDd06ZZLbwv2fVrqcvhvKnEgmcqbsut/cbRd9v7VU+
         3qpnDa9ThtZozpk3ikvPGnVt1ZRIESAGBEoN6KepmkHHiC49fXflN2xXMi99bzHe7R4N
         QVzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787003912; x=1787608712; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        b=kPAL0xHL+7KkKT2+57pkQ3KC1Fd2w2nUhn4u13IDlh0dBPwu5O2ZonGwfgnDno0yY6
         ohtUF9C5Ia0kH+JEpCgrPO8nNE0nF8Sh88h2gP/PaIhp7tayVX2tnaRbZZ+ivyRb0xDu
         b7dGGLLdJxwjMotzqze2qF9ib/VHxeu5Yy4NFtZnqzFWEW7IJ/CfyHi3RrPIOoDIe2xS
         QI+JkWQ/iHAewL4U7MQzAOJ6rZlNyQZLuLR4x4EtaDHjymx/a1bAzayU8r45XEj5yaBL
         MeJhaB/Y4yzJ7+A0HRyiJ6RkNEc8EB9j3Rd6kGiaGm6QH7WuUd4y61OmzyL3um1N6gs8
         4QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003912; x=1787608712;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okaAU3zYOn1hyhzNcOWFnCkDHyrXnj6mHvmxdNYRJ3k=;
        b=SaEhqfpqm5W58FouyRmuliAAx2KT5zrqa1iOjAepxnx8XSmd1vJApvfOOyDbHMG3uT
         +83Ajyfu3SSUk0/dFarGoEf0DZ4dZqwDjqZw7ofyJhanY96XSsb0te42G3Rc22QyniUB
         w5VZ21288jIZaeUSuSYiPpYGkZNiwA14gt9tLTOHaE1yzky1j+PMmQlfsIKCQODCVhg3
         qk5TZE0Lp59fEEqbouLjWmqxJkYnyn/cHMQ8ljrsA5sqCOUUhaX278cZn2aeH2GdFAef
         DJkUe2rVw/wQNru0xHXbDdmCiR0qvjX7BerMXgDm/ZwnTqUDcc12RFUuQPq1lwqoZmVX
         rDpg==
X-Forwarded-Encrypted: i=1; AHgh+RrifZ4mrYOoVyPBUIhFxhDvsohmDJj7zt8DafL9opKgPoRfd33DG6FopYRiWJZsMEMuL4uFhgZtb0LVPXUpD6jL@lists.infradead.org
X-Gm-Message-State: AOJu0YwDh9EaN/cejKG71HJL2BxfJek4fDm8aspI1H5V0anmDwGUVYKI
	E7syKIADGwNBsZCAq06/jbP+gsgNAB+oQMBQlU2rPCY0H77u4Ofctm7b1qpldcvkpFk3IN1L5iC
	14KjaiQJXoHYoTbQ0SS3+JWc3tA0AqUMUy/+NxB1g
X-Gm-Gg: AR+sD1056av3IWHomX7OlD6tHZH0bFdW7lq8g9tW9d25Y08QQDgUCZqdID6KZoaia5M
	bzpE/hsRQhVmqQSXg1FVB4LAkXLrfktmdJpuCFNYM6xSvvYJZ2WggAqbOCWp/v+daLVYYbiBgNU
	YYyjEzalO50lO/rJ/ZcEcKo7gSv3B07k7HhnRw00He7kAGtesG+6YwDVp0gkQmpRXurtY3gm1ph
	nrXL+pDgEcTYmlbii9d1M9wNdtobMA1PY3UuuSfLYJTPLlg1ZqWyBJpZPSPhwxo3f5vWhz8v8QE
	C2QCMSnEIBjdUSflLClRFUhlTFzng0Vzesh9dKTRvhUvk9gJWPb72ShPe+AzdVJ2J0siQqquIwj
	aoC4D6CCIIpRXeLNxv+jRrPHvUgNndfHrsMI1rmPv094p4GdIfYtaDry2
X-Received: by 2002:a17:907:9446:b0:c0d:7c31:26a9 with SMTP id
 a640c23a62f3a-c218d9ba953mr40425566b.2.1787003911741; Mon, 17 Aug 2026
 14:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com> <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
 <12a46993-82a5-4109-87fa-61b8fcf764aa@yoavmoshe.com> <CABCJKufoQ0fX797M01t7CkTgMEwNCELY1=ptZsxr=jWOR-KAyA@mail.gmail.com>
 <CAKwvOdnaOy-nyZ=8oLw4N-_hA9JZVdP2BhR8cweCAOhsy4VG6w@mail.gmail.com> <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
In-Reply-To: <91cb0f21-e78a-4931-b123-937c6a01592c@yoavmoshe.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 14:58:19 -0700
X-Gm-Features: AcwNN1VNo3n6QqxpiSk3WE0KBl-3YmOc0Qs-sAl-zs64L7Q39Eb5f5vg2HrwQ5Q
Message-ID: <CAKwvOdk-JmqjhZWBiLjXTxKhEV+T3BAB6An+3Ara8oybmhAMpA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_145834_348370_9B11FBB6 
X-CRM114-Status: GOOD (  17.46  )
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

On Sun, Jul 26, 2026 at 8:37=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-24 10:49 PM, Nick Desaulniers wrote:
> > Yeah, Yo'av did you test further modifications that explicitly copy
> > the hash prefix? I assumed Nathan's change _plus some additional tweak
> > to copy not just imx6_suspend to OCRAM which I assume the code already
> > does, but I would imagine you need another change to copy
> > __kcfi_typeid_imx6_suspend into OCRAM just before the function.  Was
> > that tested?
> Yes, I tried that as well and it unfortunately didn't work.
>
> I tested Nathan's change along with explicitly copying the 4-byte
> prefix from before imx6_suspend into OCRAM right before calling fncpy().

Can you share that diff? I would have expected that to work. Perhaps a
minor mistake in your implementation?

> However, when checking the compiled binary, "&imx6_suspend - 4" just
> contained padding rather than the hash, so the copied 4-byte value
> didn't match what the call site expected.

How did you verify this? Can you share the command line invocations and out=
put?

>
> Yo'av



--=20
Thanks,
~Nick Desaulniers

