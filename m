Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023BFC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpPQ24EVyvfhB0gl5C6A7Ib14qQkrWJ9dSg9UQ/L0F0=; b=RO13f0NOedvySJBtAt9+puJDEW
	1FX6ktCYpBvKkVIaexsHI6Qo28yJWsfR3iRNpXdMKyAd0rq7rlJIA3cZBtqzaA9yaNYzT0ppdNNjW
	96CG2thtOzimgBdAQOlLWsOlQZdRDwTDf1ojOt+pI6XGHCMxdt4VAdA3SH2Yb5/VmkCMMc8Zh9tfX
	3t1wDGbDhnbvdIvXfaaONwfXFBj0mfRtpulqQyAibEXEyOchEFcx9wsrNa3Jkx7ZRBSUsXoSX0V2n
	4XrJStMbI9T1lM1ZlWdgDS7wwYVG1L0HWaCXhMre6M3BDO367EQViwKL0x7xy+Bxr9IpeD3BiuP+U
	ylPv+08Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woneu-00000006B3o-2FNR;
	Tue, 28 Jul 2026 19:40:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woner-00000006B3M-1iyG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 19:40:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so249595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785267607; cv=none;
        d=google.com; s=arc-20260327;
        b=lgy7bVBCIg0dV//1oSVCEndVsoxSeM0FIMVftamJ4QAzn/c9bmcikrQAtcL69T4B+A
         jHxAMW67kR4nNY2Clg5gIR11hdW4qN7Cka86n5AM7kxG/0lWZNwf+mshs3h3OvGcV4Qb
         pz+L8+hYnaDc4Ga190Tnm9d+SrONOoqOtU4VIg22l7Yq405Dcean439YLsxV2vLvD55o
         QNUIqXWrAoVvSQLOkMbpql3qh5NydaxQ8CYpiE5YObFY+Kgsl/mjsSwB4bx3puD0Y/Og
         UVLkBwouNICsPU185BOHEkfwgkcHwlSiWpLa1aX4CHoKJ6zCvWNgBG7dpVVbDqm/1TVu
         1jFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpPQ24EVyvfhB0gl5C6A7Ib14qQkrWJ9dSg9UQ/L0F0=;
        fh=x/2n+1TxciQHzNBl+jDnVN/3pAYMrurrLz3mknDi4dU=;
        b=TBn9mRNz/5l01UnBf8V5OjTRKWxToHLzTtgCmLDa9W9mtUFmlujzILZ3uheDwc38Xu
         7zTP7lJq4ORSmTud/cyKqRAaENE1hfMNqC3hyQ1nqqD3hZRw88dqLGbr+S/pi9+fGsDL
         0P/LJ7f52AfnuSkpazQiRfEKSV4FykLnMsPZSwsvKtPRZ2px5p9lq3e21Z0Sg0eMB60c
         jZ5ENpYKlh860YJ/lmST1P9EKQGylZiNaWnYD/87xM46FqxIaSNHIdYGmuU7mEvt9z0Z
         TM+nagrD5Jo2/TlKcPWJDCimkrFufce0BPMd6KAliJ1E1IX9vhOogs8DNwi4LhheWivU
         NlWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785267607; x=1785872407; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpPQ24EVyvfhB0gl5C6A7Ib14qQkrWJ9dSg9UQ/L0F0=;
        b=cDuWaRXOhqeJf57VE5Rh9TBZJjR0T/kNGzjc7AloD5vyzJbnc+0r0R7wM8wKcoAYHg
         TaokJPYnhMn/TOQLcqLCeYQJ+p9jc5x3TbE8HFLdeovVBIfPNl0auL8ej/sgWs8rz1lB
         /khZdE5BTdHVJvNnXsqQA85VKztJrRApGtISLrymsrVf+PEoQwhLn49pONYGtD9dwvdq
         rfTDK0uNZ2nI8NboEBIVTnApWneBBiY5xJnBYfDnoM2BXvsZ1+GQWEWMAJHh4XMQx/s/
         ElH4oA7yCqJ6cAeSDd0wXTaLc+JzqHswFH2lQZAQ1gOr4vmERV1yDWxkBd3q0/TWJ2qL
         j7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267607; x=1785872407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpPQ24EVyvfhB0gl5C6A7Ib14qQkrWJ9dSg9UQ/L0F0=;
        b=IC2kPW6b8rsAs24khN6lviQrliumg1Eco+D2H+Coo2hhAM0cPkP16NVI+mbdgBs1mq
         Zi99ZDkPZYDVDqmO4ew0FH95bLdUO/nlIi2yBD2SKM3xO5zBAGTG/cO7yyczlWBTHEiy
         RCJbvXGtc9vaqoTPdwK2a8bF56/TT3c2+YWT5+KWb2XGxyFYJ17h4NWBACSXRBV1avCk
         QAwVtbA9G+/5f+JO6LKMeEpk/MqBVB0yXemJpOAiqcgJEyZcHQAw6r5D6VqhKfQ3ObWl
         l+nzRINWGbY43tNR+W3QO5HI4S0J4Ne642cE+Xr/lX22LCV4ofQmWRd0I7RA6pXkc/44
         F60A==
X-Forwarded-Encrypted: i=1; AHgh+RqFGffxYf9c/jw0k8VceuARwSRBKHNm/Kof4liyfPz1EckwMD6FZujR4gQJMN8Sd/FGGs9lPXMJxOQrndkEMS2S@lists.infradead.org
X-Gm-Message-State: AOJu0YxpvIel1Jb+dxpzMKNMTVXjNp9aIn0DXx2iVBvER97ZrcNvVKtX
	+YmJ+gL7mb5jlh3gVCM/CYmH8tvfL9r8iO3wQSy1RCLVz5KGr/8oEo8LF0tcsgf9rRQP8Q+HhJT
	6hoXnobn8mz6PQPWhs0X/fBin6Q1zG+U=
X-Gm-Gg: AR+sD13rJL/JrRmIckiTEaImUlzMjqI3NY+Ctl/Q6hydQ2B+KoNhjjDjzRPxzzJange
	TM9iXWuai5jRLPJnlSdKTEUv365zeCevSY0GtooVbbeAMdYZZp1qlVCWBMu1cCq2VhhptiPCcNP
	/vNh6Ebzqy6GNz4lJu3ko+PrpcKZsFS1k7z3OmshNr5q9q82w1gTdBzTuemroEN4I07I6mzYTay
	JXIbITo8FleSzt1kMffHWJbwabEuy9RRaN2N0z9OLmoUNZuFcVdUKdmJb3UzitVdCF+P9VzujeC
	Gantdxu5qlht6K1XwPU4kJsLSyC6cUbDvBQh/NfNu+XO9j7dXvtTmZRZdo5jTeM0ohifYtI0wKp
	+Zo+Okah3pVmTApUaOPzgEOKj2ndQMuoKP2APdR3M5eYx4Xxg8wkkbGOqPnQ1
X-Received: by 2002:a17:903:18d:b0:2c9:d8c6:1db3 with SMTP id
 d9443c01a7336-2d015ca0006mr30230635ad.8.1785267607090; Tue, 28 Jul 2026
 12:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260331190053.482607-1-ojeda@kernel.org> <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
 <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com> <18cf2372-0558-4a90-8faa-bdb2ca1cef61@app.fastmail.com>
In-Reply-To: <18cf2372-0558-4a90-8faa-bdb2ca1cef61@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Jul 2026 21:39:54 +0200
X-Gm-Features: AUfX_mxieED903ZVOSDzaT4nr5jZsRFAL90RWlFLtxi1t75KjzU4CBXoDz2O-m4
Message-ID: <CANiq72nLWbdu1yW_tB1T_=JVhVeD9bnfnDvWYn0Qun0bEVcX-g@mail.gmail.com>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
To: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_124009_478069_3FD5F658 
X-CRM114-Status: UNSURE (   9.07  )
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

On Sat, Jul 25, 2026 at 7:19=E2=80=AFPM Fabian Gr=C3=BCnbichler
<debian@fabian.gruenbichler.email> wrote:
>
> Happy to report (with some delay ;)) that the next stable release of
> Debian Trixie (13.7, planned for 12.09.2026) should contain an update
> of rustc to 1.85.1, which got accepted into the proposed updates
> suite today:
>
> https://tracker.debian.org/news/1778462/accepted-rustc-1851dfsg1-1deb13u1=
-source-into-proposed-updates/

Great :) I see the update also on:

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1135220

which I was tracking in:

  https://github.com/Rust-for-Linux/linux/issues/350

I added your tracker.debian.org link and the planned release you
mentioned there too.

Thanks for the update!

Cheers,
Miguel

