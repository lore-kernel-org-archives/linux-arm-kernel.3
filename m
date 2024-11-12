Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DABD41D5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 06:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LH71Z4G81qeY7e3yM9xTU/um63mCG2PmsvtyyG8Fv8=; b=gRV+++xtHHsuExe7caYnZ2SQMv
	FPoJjdE8uJCbYb7tgXbKOGEVO5Hz/zn21f6COilA3Aaf+HBPXZjDCG3FnGjErjpp7Pb6R9UCi/R3L
	G9pUCZUc1VZm9oL/RfOe6brGTH26HwYVjbxWyqxF2TAfeDA+nFK5LldBas8lx2owgsodTNYoqKez+
	0b4jWOqi7eMiV5MM6Gw6KBOWBZ75Sbr6fi1ui/2Y2yjsvWa+TLZSSgVD34sEikJsrJZCJJgBFquKa
	wvdzPQ7KZZq7C5iZaW8Sz8ITlLNXtQW2K4JLfr5icqUsSJR6zhnIYpbLteEbc0FgxeNw4vQKId/dX
	eLhJAXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkcm-00000002MGo-2RHz;
	Tue, 12 Nov 2024 06:43:40 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkay-00000002M0h-30WL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 06:41:50 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2DB7A1140074;
	Tue, 12 Nov 2024 01:41:44 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 12 Nov 2024 01:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731393704;
	 x=1731480104; bh=/LH71Z4G81qeY7e3yM9xTU/um63mCG2PmsvtyyG8Fv8=; b=
	MK/02P4xdiycp/e/thJGUWj3FujbbIlH2flqJafEUzwJl/CAM2txKZeVV8nLzL6g
	F285clC4Jt/u5R9rTQoNGOr6HVGKeh79ZRsJIYxi7juFAatFbbMGF9CTV5zh3SZH
	AZ9unIsDv0oxL4Dj9nDLoSVZwt4zn5UZx50EBrwY6CK9xbEq404XK/CLut7SdqXW
	aQhZV2xuGNzpRLg/De/yN/aRa7EfyT7gm10qIHsltSITEQO1bHu0qIg9T9dKCr65
	GrS15S/0wun7l/8tkI2n1MWYNKGF8KKymflJfSXsrH+aX8yjc5+CgzwMoryYGhG3
	26JGaeO8E/CrmB2ByM7B6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731393704; x=
	1731480104; bh=/LH71Z4G81qeY7e3yM9xTU/um63mCG2PmsvtyyG8Fv8=; b=k
	uDaKZQlPfEYtYNecyQZJgZR6Bid42elQVpm2xkDLrN5xQax/ZGRMDcRPVapca+sS
	Z012wMBSj0bRd6byxn+SLcVGYt28I2MFbn9+DzfQLe1sdyNk4UyvBQEH2HU5OrpJ
	mLfk2ctv/lHReMj9UKYm53taEC0IM1rp6JX6iT1lvUju5hGiLjuGbsCDQhqrq1Mb
	TxdenoD49F09pN+Z+XyTt3zCzZanLiQBEfPd8yANEPxqFldr/xdBE1p6c782gMiM
	1AApgnO1fYbcAsoc0ep5zOVuLlEqOTw2S4ZUCvTmYOpoCSKzi4TOYjwNJniZP31U
	zP0r3dj2zxHMg2SuVx67A==
X-ME-Sender: <xms:p_gyZwiiiHTUktXxxoraVmY6yjey6SGBBn8XlbkzXoAaZRKnO9f-6w>
    <xme:p_gyZ5BJFvdHyWTh5tsmsPBV2wYkJZvfaThdsmFIRDkMuObHfMyyDAk8b0YSfnI9Z
    hktVXzPKBoDu--076c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghsse
    grrhhmrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhpvggtihhosehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:p_gyZ4EKteK-_Juguh-381HHtYcfVqnqJhPCLhoOeeTYPgXnNcbBAw>
    <xmx:p_gyZxTLVAC_nJY_pvzsRdzTx6aPgFjsrrjPQl_bmrkxRJ2bzoLJmg>
    <xmx:p_gyZ9wzQh1kdxD3FHSV6ry_OPDczP2HP9mUXcnJfOGys5p8N9x67Q>
    <xmx:p_gyZ_5Yfgd5WGBG0g9frMKugDgvb5uSUt3AdR-8s0LhjqO7m-H3Hw>
    <xmx:qPgyZwqQMrun3yE2El5hnpisMo3eQero0ykaGGHCtcctNmJMZhPrdfoI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 357A32220073; Tue, 12 Nov 2024 01:41:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 12 Nov 2024 07:41:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Linux kernel regressions list" <regressions@lists.linux.dev>,
 "Kees Cook" <kees@kernel.org>
Message-Id: <014edf04-a5ac-4a02-af76-ca2616c3c4ab@app.fastmail.com>
In-Reply-To: <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
References: <20241111233817.2f824c19@foxbook>
 <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_224149_364167_CA4E2D98 
X-CRM114-Status: GOOD (  18.79  )
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

On Tue, Nov 12, 2024, at 02:15, Linus Walleij wrote:
> On Mon, Nov 11, 2024 at 11:38=E2=80=AFPM Micha=C5=82 Pecio <michal.pec=
io@gmail.com> wrote:

>> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
...
>> So I guess it looks like there is a problem with this feature, perhaps
>> a missing "permit user accesss" somewhere?

>
> static inline int
> do_cache_op(unsigned long start, unsigned long end, int flags)
> {
>         if (end < start || flags)
>                 return -EINVAL;
>
>         if (!access_ok((void __user *)start, end - start))
>                 return -EFAULT;
>
>         return __do_cache_op(start, end);
> }

I would guess that the problem is not the access_ok() but
the actual access in v7_coherent_user_range() that does
not appear to call uaccess_save_and_enable() or its assembler
equivalent around the lines

      USER(  mcr     p15, 0, r12, c7, c11, 1 )
...
      USER(  mcr     p15, 0, r12, c7, c5, 1  )

> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 480e307501bb..400650519bd1 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -592,11 +592,14 @@ __do_cache_op(unsigned long start, unsigned long=
 end)
>  static inline int
>  do_cache_op(unsigned long start, unsigned long end, int flags)
>  {
> +       pr_info("%s(%08lx-%08lx)\n", __func__, start, end);
>         if (end < start || flags)
>                 return -EINVAL;
>
> -       if (!access_ok((void __user *)start, end - start))
> +       if (!access_ok((void __user *)start, end - start)) {
> +               pr_err("ACCESS NOT OK\n");
>                 return -EFAULT;
> +       }
>
>         return __do_cache_op(start, end);
>  }

This does not catch -EFAULT being returned from the USER()
trap in __do_cache_op(), so I would expect it to trigger but
also not to flush the caches.

It's unclear to me if this problem is specific to the TTBR0
PAN variant, or if it can also happen on any variant of the
CPU_SW_DOMAIN_PAN. It seems unlikely that CPU_SW_DOMAIN_PAN
has been broken for this long without anyone noticing, but
I also don't see why it doesn't trap in the cache flush
when the TTBR0 version does.

       Arnd

