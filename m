Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75C7EB3630
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRlJolTcfRvzUSQHPs3dCXFlQx1DAFYYMFjz2DuLSf4=; b=1OGu8XzI45n2c3ovyH1PwcT/aK
	JahBU8M25Iyg/3yuBJpMtbxqn3n9YZ6uBM+TcHPPvQJ7JtR2UUjrcWslB0wPapM7igpPsNQO5TVWg
	i7Hv0kgbNh4qoNo7JATQOUfi8OxeaOEbF6k9F5e3iZgwqIwTp4gCsMm0FhTGlRebraQ469t7LBC5q
	ZyiFXNN3FfAFx25i0CJc4itlOkDyvK/vioRJNIy76+RbPIsNM8oNxzGG7cF7iQMgnDZrn7CwsVGAW
	1hQkDr68Z0Cj52nQGsrF+j4axOCzkR7pR6ecxTeoW0Xgh7gmv8sil5iZcDvm/clIil2ZpOlBYuPJR
	2tBBbygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8QI-0000000DhIX-43lB;
	Mon, 02 Mar 2026 18:55:18 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx8QG-0000000DhHi-1UO6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:55:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48375f1defeso36432215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 10:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772477714; x=1773082514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRlJolTcfRvzUSQHPs3dCXFlQx1DAFYYMFjz2DuLSf4=;
        b=AKt99DUR2FCTTejz9qMMBhQ6OjSyNdwWC6LnaUn6J9sm2kF3EUN/D/el8aiykS/ICL
         mIxPdYdugPvp/yW0FyskV/ScEQ8LdK0e1r0i3etF+6uiQqJxleO5YInInyZow1IUmakg
         pvmyxID4C6wKffvDgnjIOHxtXRXTbyf7o+/pcGXzInjRaOqwF4OiQBEDImr49YevN8Yk
         +xBeq9kwzT849fJQC+pWupEHxtU5IqMdQ5WBX3pLyVPxAwBqSOu+0DG1mp+EqKGM2P7e
         jFP7OWPB4EN7WLWLvzMch/FjnpOIXizAIk9+81GSWJfY5/7YnRrdRXbH2m6q7/rWiwHK
         F3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772477714; x=1773082514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRlJolTcfRvzUSQHPs3dCXFlQx1DAFYYMFjz2DuLSf4=;
        b=BmMhWgJ9RHt4sx9bPlDQtrmGv3XRevEja2zBSxi1L3Q3UWDjBnKX+KaRxFXTJFuFTB
         FurfZ9QokzwYBwnBDwhJrUQ26Hmejir6r3mxOy6jEVvetSsnJI8fuaHNjRYWmTvoRUjT
         +GObvy7+5dp28ToMh5sUqrPEWYX7QnYw+78l9WccFqiooISKe296PDGF36/TEdh1fezv
         mbrdOrir5mDEyiQeZF5Cjb+VJADd+w9dFTMJLJ0sD3nfw+O/TiwCLI1/ImAphzSylgCY
         nO++OPAdxuIaQOen1f/2nyre2IU01fX3nkiStN7tfb7Vs3Udi7/igwwKqqeHP3MjnUvA
         nrLw==
X-Forwarded-Encrypted: i=1; AJvYcCUe3ZBBXRiR5EFHafAr9KUCY5zCfTXOSHywmcSi83p5NGmr3ibuu4nzqO6o4pn7f1dzVZeYja58Agy4lsz8WyKT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1U81DVHecS05h6wCl59ILcZSj/pNS5S8glI47NnmM2YPcUNW5
	Y4KnXXCLBB9ppHB0V5zZk68Jh6P/AtU+ETNyUF2Hw/WJj3V9POf5NaAv
X-Gm-Gg: ATEYQzxdJhbM3a9dNTTBP5Yw4mjoRRzmLr3yiIUIc4a7P5tDTm6wxXeKLImQzN4CG/z
	lpL4YgCF1xQLOtGOgF/y2QgeOinIB5cfwCKgvFtiDh74ba09+V8Ms3wsu2cOzF+IAy8Bg06ppFs
	PQJcndCfAylbiE5YJ1V7ASUOP36ndbOCfkHJ1NKHJF06vXd7SOz1TP/Nm4jaLhea3lMHlRspAPc
	6LM4m2yqwFv+st4a8pnVD6hsWrrTG85DMF2NreodL1AT8gK3Z0mMZOP/mO3klwt7U16bZjnnF/Y
	W5t2V7xY9LSCnivdBLJMCNmTdDSU5+NeCOgW0mczU+w4974jqloZ+0kgje4zeJ58pxEVrBd0YBC
	Ew3xnua53pCX4POW6zI/TgQoWZkwcUawkMDC9bqcqdkye0f+jQLhsZQPWJtu5/gceFpgiFw/kwx
	W/UQhGBZnyQhU7ybsqLg==
X-Received: by 2002:a05:600c:350d:b0:483:a8e9:201b with SMTP id 5b1f17b1804b1-483c9b81265mr267465545e9.0.1772477712531;
        Mon, 02 Mar 2026 10:55:12 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm299471225e9.15.2026.03.02.10.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:55:12 -0800 (PST)
Date: Mon, 2 Mar 2026 18:55:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andre Almeida <andrealmeid@igalia.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens
 <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>, Julia Lawall
 <Julia.Lawall@inria.fr>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix
 <nicolas.palix@imag.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Russell King
 <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, x86@kernel.org, Kees Cook <kees@kernel.org>,
 akpm@linux-foundation.org
Subject: Re: [PATCH v2 1/5] uaccess: Fix scoped_user_read_access() for
 'pointer to const'
Message-ID: <20260302185510.6b49a025@pumpkin>
In-Reply-To: <CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
	<20260302132755.1475451-2-david.laight.linux@gmail.com>
	<e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
	<CAHk-=wjKWi=j_xcMBAi2Hkuut6aNeqXTwOFoMGkHfDA+3WXsgg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_105516_417242_4046EEC6 
X-CRM114-Status: GOOD (  20.94  )
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

On Mon, 2 Mar 2026 09:26:31 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 2 Mar 2026 at 06:59, Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > Can we get this fix merged in 7.0-rc3 so that we can start building 7.1
> > on top of it ?  
> 
> Applied this first patch. I'm not so convinced about the others in the
> series, although people can always try to argue for them..

Patches 2 and 3 seemed a reasonable idea to me.
Removes a lot of code that is only there to make the whole thing work.
The 'with' is a bit of a take on Pascal - but without the 'making the
code completely unreadable' side effect.

I don't do WARN=1 builds, never mind WARN=2 :-)
Although -Wshadow can find real bugs - so I would turn it on and
suffer the annoyances. 

Patch 5 was just what I was experimenting with.
Doing the equivalent change to the non-compat version (IIRC it
uses the (likely) much slower copy_to/from_user() because the
structures match) might even be more sensible.

	David


> 
>               Linus


