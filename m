Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92646CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx5DadAO67UpdbFbKqO4wfxzyxKs/HiVe57B5TgYgWY=; b=iPm5KIWZ4Ww5yOMi5K4IxXF8Vf
	ra0VnlY8WPn6IWw8dBHTkELw/bBT+r+q0CV3TqG0JV/Kx5DbVkDTxjJiUjINwLB1c3MUOuMM1H15M
	97mpowTo2e6KfSgWVHuC54VMSCO+NIh0hGrK3b+yoX0Jo4p2KuHTJTIKOA/LqNVimOeqnhi6k5Olk
	Q4nYPhWgAD/TWx6ATOSM/HywvfzBcAmVWyNUCbXBwMwPOGHmesKrc8S7HOCh8OkYzSvoboLbmwQmR
	+FMNpD6iFDJth0S2g26CmAYRMiPqK26fjqs6kwLBFxqZ5elVX1RAH5YCgAoaeItbSSAGI735DIbnl
	FaJJTH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWd20-000000045sy-0xhK;
	Mon, 08 Jun 2026 16:40:56 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWd1x-000000045sd-06Gx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:40:54 +0000
Received: by mail-ua1-x943.google.com with SMTP id a1e0cc1a2514c-96387977596so1553352241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936851; cv=none;
        d=google.com; s=arc-20240605;
        b=gXWvjPNN8V+wsQg7HIjIzLrKNYv+fZzwMOZUAR1xGgX5c8W1my2Ezlq4kSFcNofz/+
         ZuMSy9ph+a+xuTwpRkJwS0yb478qUi5BVVu1TnoQXdWoUfXm0MLAn4oQHwcOPRFahKkR
         p7dp+G7kf1yLZ3j7hQhKl0txVwroBHMYbmRIDcdA+MA7dFJQciSGdhv1xaPdHVJl55kt
         ee36Mu7tUcggcnMKtmgYzvL39a+BmDZY+uq4XfNOP9+CqCuYFpCoHHfDudqXHD1wYYry
         wmZVMAVH4vrwChZlvJacUQiQgn0vCbtk4vOb7kHEkL44YR4OUew7VBOwiO+9JugNjZ4v
         39nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rx5DadAO67UpdbFbKqO4wfxzyxKs/HiVe57B5TgYgWY=;
        fh=L38uJg7NxNM4aZqLTXDrRM1EDqF+6gmdUSJqQzxyYLk=;
        b=TNCq0QHKq9Eh42EhKd44MOPRTZDpjFpUUbS8UXgCCiJWi1B7ZOnQ4SP9RowmKY1ouK
         ntZmRPUoUexHKbcLOFL4+Ps9rhWrLIh3cCLKvHww89KTZtFk1GHjaFbVx6m+n/9d4E4D
         5+YOf/VC1rCxN9uga3cYAzFBErb6kR59b+ilKVemhQTH6hXAJ8vtg0buTpBgqMItMSYX
         iWQnrqON/LPcPIpZ3GQVIMFKoGXI6rXJ1Q/ed/MK26RMnmP/yDVMhLB+jRsj9UdG10SP
         GXFSFcLc3ei0LqI8ZGWFcn+yaDpsTVPx3cdP9d7PFb2MrBoUieGkIxTdVzyG8JGqKuDM
         zEtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780936851; x=1781541651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx5DadAO67UpdbFbKqO4wfxzyxKs/HiVe57B5TgYgWY=;
        b=EFdZMy/dE7sIZ9lIXkSpjO5/EuHK7ilA11s2vTmfKt6/iJW+CAv9ecOPcxXYldhFEo
         OwzMmol4C7fq1lDNEsXnPQrjdPP585AIN5Wt45BCs1DhQ+bvO3yXl0qTz8KJ0OcaHCDy
         t+LjKgWL4ACj9AXPxT3ujarYnLWGEmCYHTuqd3/x8TL7o+LlJXR5d2NIMqU062Fn9tuG
         ayAvY5z9m8TLDPTF60WNiQhO/vbAq1y9tAIHTeM5J7gi/5ac/p6Vwilavgv4MqutHnPJ
         WtnBjbXDOWPtel5JTatyf5vgkxH1sdEzs345t07mxFnftiOX2lBEbsrPZ/DaVsPbFTT8
         vQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936851; x=1781541651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rx5DadAO67UpdbFbKqO4wfxzyxKs/HiVe57B5TgYgWY=;
        b=R0uNF0oGvjg3aYf1dwHtwm1EZccrGdKQZe/+ktcNH2hPtETdS4zW7PrGBcOVw5Unpm
         JXaFq3u9TJ8SKw9UbE/02KtlVvZcMQJfxNMLLX+06CvWj0iZkDvna3OYsw73AXl3RZip
         5xfWyd/hs3W7H530JrItqyDshs35kSk0WUO89rhtoPwn+cYrYzr+VuRYeT9C+w1X95YT
         Rb6vq5qUjFmeqDxvxZUO+WN/62wNWbyWPGcSXmQk9DexLrywwO4S3RXETDf0mlptjSn2
         LcxGbNL3XEQy4I0pGhSMmF8+OWf3/Oez77RMiRvCMAVd1bXc47m5PhtV/Vv5VrH7bxgr
         vHBw==
X-Gm-Message-State: AOJu0Yz4y7xaFjJfZ0zzO0+FcBawRlhq9gAeaxzi1jcebHm6E19CeFOm
	ycEcXCLuVeJRQsj5GGkdEEG+zTC2uy1hwzOH8hx85RAqNCos9vnOy220KBTg82RWe8H1v/eG/30
	9/GUdq4a4tt74CRB9uHaQvZDpiujz+13UDBff
X-Gm-Gg: Acq92OH6tSt7bZLn/9qZD3iXxkee4WvHL5f7VvQFc0oSkLGIS0BTFu9FpamIT82jIiq
	t0cO6R1+YHSz5/LYHpuyZBR0vuQ3axlYJB3mmGwYN/QXP52sWX3JVGjmxsCBpEg7xmM25SB+hSm
	AlsUvXNOsSI0ImxXugykq9Gfz5pXf4rhXgXnSTrioLarAYHH8uvG+29mvturD9id9icQ7J5rHnI
	gmf2zhD3+xAAp3JLJYNH67BsfvwcW4qT7eNvue5Gw6XhaVtAscDjjLNEbrWJaIBKB9g3o6OOwra
	GDZzh4E0quncHI8hy8swa/Tr8PdLrm+nDLrjQuf1EkR40BnomC9wJx4o2Vbdrco2GTfCZSYs40Q
	52EI=
X-Received: by 2002:a05:6102:5490:b0:607:4fde:1921 with SMTP id
 ada2fe7eead31-6fefddf2777mr7527961137.24.1780936851466; Mon, 08 Jun 2026
 09:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260510052107.555825-1-enelsonmoore@gmail.com> <CAD++jLmUW4KjxEjwv7_an_dEMTSOtvG=q2MjhqKvnuGrWaaCsQ@mail.gmail.com>
In-Reply-To: <CAD++jLmUW4KjxEjwv7_an_dEMTSOtvG=q2MjhqKvnuGrWaaCsQ@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 8 Jun 2026 09:40:39 -0700
X-Gm-Features: AVVi8CckAHRTjPznUi9TSdmF40ARXCb9sYaYjHsEIjd_pzo-q6SLDDWWJhkDXvc
Message-ID: <CADkSEUirvwVzdmGh0bS++cy8coOiMyuHNYQrC599eyVmWMh_Hw@mail.gmail.com>
Subject: Re: [PATCH] ARM: footbridge: convert to sparse IRQs
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-serial@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Weissschuh <thomas.weissschuh@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_094053_073702_DD5B5930 
X-CRM114-Status: GOOD (  12.38  )
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

Hi, Linus,

On Mon, Jun 8, 2026 at 1:50=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
> Have you tested this on real hardware?
> The commit doesn't really say.

No, I haven't. I can try to test it in GXemul, but I'm not sure if it
can boot Linux. The developer only lists it as capable of booting
NetBSD.

Ethan

