Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A2BCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 05:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=; b=UnO0pSTX0DH94hGSpCzG4utJ/g
	5Lj16XA9t9UNk04qJuKhnoJYzM3BxbaByyt4RmsgGS16YaJpVEtAGtKWotDQFuuk383QRD5yh5fWJ
	gKGJUxHDiN7UcQitO/DwC3cYz/154yna0vS8j3+I6ts4OXUEmmAPsaJtKwRLjZOlLi86vvaSPOZAJ
	FYH7p71qBq8EEX4gYTlfXa37O3qeq/ohaAzXRul7kIC/w+7kCIidzTADLiDzx7NdxMUTM/GkB9Nti
	1PCldV7W+MkltbP4N9YlnKx11FlQf1PMBQFZfe/R/bEh1HP2oSPJ95bTZKcBXg9avHxpRFX1Byw6y
	MZbgqPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAP6-00000008HEx-3EID;
	Fri, 24 Oct 2025 05:31:56 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAP4-00000008HEE-0mvh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 05:31:55 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b550a522a49so1298737a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761283913; x=1761888713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=;
        b=fXrpt+ZKmnOC5/IUBiJYYjbHoNCMr3j5RSHsOTKMD3h5nFT4L1KuICPn+5YHokx4qq
         2uSBTyi+ZP5czJ6TH1qJPNoJ0uWcFnB1QUMyFA70Orqu141AcJtmn/Es7tCn5JtlIYak
         5HsVO9KepxiqzI8eNRxOClcUA2MyG4SK17uBFNijo4wiE4o9/jR7uu6kIkygdNnoN5lm
         RM9cVnUQ50whiD7kl+aR1T9ChIZuT8YTqZBawyTip0Z9vLStoudFgfa5gfOuBpeYFlHr
         X6Of1bXop12+ggFGNrlp0o1I4rzfRfwRFgrL3Hvt4RJE2bzmcHw7T3ftASHTLkvYRyvz
         ph0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283913; x=1761888713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=;
        b=orhnQXUz7EllqNnDahOd2ywOprTmvhROtIlDEXoPwT8Ng1PDy7lyhURNR6ek4TVXHA
         QrYv37GDarQ2yjHYGQTq/26OmO79+BaRiE/pay2CEOucyEPsIXEOUqHIxBWTCEfvuVmc
         9+BO7bWMs0qTW9f2EHF2ENVlvqAS+eTqkHx2iQXqCfLDo/RiVyeVy8i7sgn4Htb0UIFn
         0lFpbEVagX905vJ5qCjrh/AfS5o9mSCDp1Omxuj+oIYuRd8n8UQP1m83mhOGM1rzvBNZ
         FRPY5enN/2Y4VqN5aJ28Yq7OeCaVohsXO/5KxGNsfMvIkD6Ldt/qLFzij8lTMjHvGRcz
         awog==
X-Forwarded-Encrypted: i=1; AJvYcCW5p1+ZYJs9Cg5ttkgD07i9l517uu2wzdav551puSgsPJKsG8wKqKN3rQqpwzZ6i94LTeR4Nd44DCUbLngNtHyE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Mjy+a57jEEJNi9xQxpKemDF7Vxli7v4zzYKOUqSpB2+qdXAR
	uFMBTIP4p45Lin8gnF3ZjKVQH/xPhMBQNhC5g9MjqC3+bB1P9FKY/7/xAZpK4Fl+5Rr1EH1FIHw
	hDwP1jr05j08lvT4BB5Uaxlig0LRsX2qA4EWX6enr
X-Gm-Gg: ASbGncvUT3LRwhLLUEg26jYrAzLsWF+gSGNe3G9b9dSTLSzf5Lo3FHpVvR+nOYfVxCb
	+Fm7yQgJSvL8VQxyBwolJfnqXE7ZaDQ595Pse4OdU6VouRfUSSPtQ+PtOhlMiS96BiUDNoG9CS6
	UZPtnj885wNZB1kYfE+2+UyfdLmpjZupQ6T6+j/BfYNmYWk9LqA4BNlVBFN92ppI0QZE21xeKmW
	I0gg/eT21xN2aGlKwkxYvpfsWqLCWm+vJh1NcY3OR8H//zIgzEt71yu6Y2w/Ty+CGAq8Xmfj86t
	nq0qsPodRTfUaApLgiAgQF2q9g==
X-Google-Smtp-Source: AGHT+IF/VvU9VCEldtU8TlKdOOJKqinHd6plYVfP7jz1N/U0hWCfgU1KoVW9GCuTIIpcsB4YHkE/z7uj+DsUXzYb81k=
X-Received: by 2002:a17:902:f542:b0:24f:dbe7:73a2 with SMTP id
 d9443c01a7336-290ca121a7bmr368072235ad.31.1761283912454; Thu, 23 Oct 2025
 22:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com> <20251023000535.2897002-2-kuniyu@google.com>
 <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com> <20251023092910.2ed9cf15@pumpkin>
In-Reply-To: <20251023092910.2ed9cf15@pumpkin>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 23 Oct 2025 22:31:41 -0700
X-Gm-Features: AS18NWAlIGQJ_wV8neCVFWBA2cf-w_Bdy_0uat0cNCw22R5tVWCPnuP-0EplywA
Message-ID: <CAAVpQUC=KH8iFOdMZfnuXdEMuCYuEgFxNvU93zgFNiGSU_tMLQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_223154_217912_7F653804 
X-CRM114-Status: GOOD (  24.58  )
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

On Thu, Oct 23, 2025 at 1:29=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 22 Oct 2025 19:37:27 -1000
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wro=
te:
> > >
> > > unsafe_put_user() can be used to save a stac/clac pair, but
> > > masked_user_access_begin() or user_access_begin() introduces
> > > an unnecessary address masking or access_ok().
> > >
> > > Add a low-level helper for such a use case.
> >
> > I really suspect that you cannot actually measure the cost of the
> > extra masking, and would be much happier if you just used a regular
> > "user_access_begin()" (perhaps the "user_write_access_begin()"
> > variant).
>
> Or wait for scoped_user_write_access() to get committed and then use that=
.

IIUC, scoped_user_write_access() is simply inlined to
masked_user_access_begin() or user_access_begin(), and this
is the case where I saw no improvement or even worse performance.

>
>         David
>
> >
> > The masking is very cheap - literally just a couple of ALU
> > instructions. And unless you can actually measure some real advantage
> > of avoiding it, let's not add another helper to this area.

Yes, it's only 3 instructions on x86_64, but by saving them
I saw better performance constantly.  Please see the numbers here.
https://lore.kernel.org/lkml/20251024051653.66329-1-kuniyu@google.com/


> >
> > We spent a fair amount of time undoing years of "__get_user()" and
> > "__put_user()" cases that didn't actually help, and sometimes only
> > made it hard to see where the actual user pointer validation was done.
> >
> >                Linus
> >
>

