Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AE2CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=; b=IhYteoVVkYtMlcek6u/fY1DJdK
	+YSqyUTOzS8gK1+IYewJCR9/vunATcSuVYooIV5vvl0f1wzy+pZisUxmPY9W64N1Ab26ocCUsFp1B
	xpkD15ouWU7NWDUR60dqxGEBGp/oxNXgEudIkwYRn+tFcM2qnqAw98zenQcRcOV5LFNwO4Oapzqar
	5RG7/W5A87x6gzsFgq3smIrpvLsziqbKwgByOBy3YJ13aHZ3z3qLf1X7LbLADkDPGHdqgpMfhA82q
	6E0C1Neyb5YdAyEgn53Yff+eN4B+VZoNqynmecTLcljvVWGylWPzlP7bXAak2Tf88XFfcBByzqqvF
	ATqQEibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqhA-00000005YI4-3Lfu;
	Thu, 23 Oct 2025 08:29:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqh8-00000005YGl-2Xq9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:29:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47495477241so3783365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761208153; x=1761812953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=;
        b=lrLblffOugnHMSyPnRaobFLUA0ok0eqaNHangL/WfJ1jyO+nkq+OuAyCRBIvWDSjMb
         +Ux7xHEgVp95oc70ZuYe8zKpgI43T1oIOJXBAKlRAas6+XaczRJZWshjeai+p+wXFRQb
         5wNaUXj8Jgefbo29zDFqcSK8YaEJq0YToS8slPFTIiTAMNQ3DtdGzEVN88vyfNTDfby5
         gDtUSKel9d6BY9CPen9EBoGp/EjdZ9wQ/NUsgFOESJ+y7PzLUhSFwZlemJPfTAh5iOMJ
         R58d/ZatTK88a4eov1oG5KHX69u+QCTwWzTZgBF1HCqpVK3YfMvD+VjEA4fT112wFzlR
         PO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208153; x=1761812953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=;
        b=TULsUPCvBUV9G+lWuAGeY9jenGDI5FtjoLxXpUnzjbfI6ID76kA/sSumf6jJLBTRhN
         wTM0DjezySH93CDP9HMK7rKDjh4yaOD/iUlzlZUKwsmtKhmsC4Mn5BHr6ZXobpVbkt0r
         BpXSBrjK73SYdmTD6Ay5AAUZVVzP3qen3bLOv+E8mttJ1+EeBV3YG36CHZL7i6rxHsXI
         ywQMJWVvHgcpu3Bi4sS1bQ+k1FyU8pogZ/MLSOACPC6bTJ8VevZcaS/Y8VzypDHyItIu
         59iPyAMP3uxODXyT1Wpq0GDswpYXQiW8fEOUbFhdrcEcsIRUU2orfuxEsTg+cViyegXI
         +cMw==
X-Forwarded-Encrypted: i=1; AJvYcCWLUbZupJWs2P7VJPwbPDecsYOLSpIBzti7wvbvvlEsDlQnsNI98qYu1+wKMue5KrFlq6OGxs6I8dS4feDvD1Le@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4CKlk582xEHHJEdivvZfJe7TXDIhlFgaD37lTnLcuTHSqxk0K
	BzVXhYiSV/I0x/u3ucQZhat5cxyFBXUPhitzTxpM0hpKNiD/OyYV+LTq
X-Gm-Gg: ASbGncvNcpK9lZHXwgbDAV3dEd6fhWNrkEtWNZF4IZGG83g0+PrDxYJKV7aqrmI9i27
	KkKXFFh7QwnVGNB+9Po4VOHVeh45/edT5X8pfab1Udc+pGQ5QQqrq+JP3781R2qW1l229Zt1q69
	Oujcwc3u/BoAdh3xeAvA29zNBRHIZiUEtbleFBDDhf2+maJBlNGdEDZ/gsCCo5r9Hl2Hl8IBQml
	5DpJVI3Pitj4pPnX+H/1pswxPD9Zinhs4N/BTXZDFZQ5/ZSrgztyDBKUlBzO6+hSfiML1Ds9nhl
	tCv1AZDgxnrE6ixFQ2D2rwMN7K/VveJq1VUHSUHxoZ8rsZNe7Yk2gpCEDcDW5r8Vc5/YTQ+MNRv
	AtVBoXDo0aGfPtTVd77pbHSFA52ivCqqRviVXVkidpYFUrY/Z+BCNVkzr+sUdsRr4lYV3XUEPVe
	+yUPQhfDAReaZNqziVB7zkr8bBUib0F10elEGOj8ERik8TYuPgZhT3
X-Google-Smtp-Source: AGHT+IHSgtH949jpIYqvryVHE7ahULmbxvweEBq1Xh1WJbPJkG9goEBlMqfaTmrq4Q942DJtzk78Aw==
X-Received: by 2002:a05:600c:8b35:b0:471:1b25:f9ff with SMTP id 5b1f17b1804b1-475cb065415mr10429885e9.39.1761208152472;
        Thu, 23 Oct 2025 01:29:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf4642fsm23356135e9.17.2025.10.23.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:29:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:29:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Christian
 Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti
 <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet
 <edumazet@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
Message-ID: <20251023092910.2ed9cf15@pumpkin>
In-Reply-To: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
References: <20251023000535.2897002-1-kuniyu@google.com>
	<20251023000535.2897002-2-kuniyu@google.com>
	<CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012914_663589_1271DFCC 
X-CRM114-Status: GOOD (  21.03  )
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

On Wed, 22 Oct 2025 19:37:27 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> >
> > unsafe_put_user() can be used to save a stac/clac pair, but
> > masked_user_access_begin() or user_access_begin() introduces
> > an unnecessary address masking or access_ok().
> >
> > Add a low-level helper for such a use case.  
> 
> I really suspect that you cannot actually measure the cost of the
> extra masking, and would be much happier if you just used a regular
> "user_access_begin()" (perhaps the "user_write_access_begin()"
> variant).

Or wait for scoped_user_write_access() to get committed and then use that.

	David

> 
> The masking is very cheap - literally just a couple of ALU
> instructions. And unless you can actually measure some real advantage
> of avoiding it, let's not add another helper to this area.
> 
> We spent a fair amount of time undoing years of "__get_user()" and
> "__put_user()" cases that didn't actually help, and sometimes only
> made it hard to see where the actual user pointer validation was done.
> 
>                Linus
> 


