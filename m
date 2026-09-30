Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9B9CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+/OyhH3Msg6tLgpwLBJhE4kGp7BkelrRjhrjnMBWTw=; b=pgK3OTUIcPgqQr
	roH3KdOrG72tj7NTtjuQKvBcWp4BCsQw7ALfaF9AweMipV6nrNg5tmm3xWoRXtdqRg7tTcCD/5VTJ
	sP3mVjv1S49XVH8Sky0dTvN03u2JJBGOsTK5wuIGzvFzmOhTXHRVKb9+GYkxSi+jPY8JUw64E5GpR
	viXBxOnS7xWphlk8l4rn+7/8m+5SPCUqLdbT2i7WyXMfACF+p45PHmvPughBv1qqLFh4Cf+Ej+V+H
	JzIAydp6GzRR+TaPpljjaCADQlVdHWHsCyPu3KRntDnweBR9WskssImIU7shPrP6dvaP89Be/pW89
	pb/0NpHH3NaRa/ymptgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1GN-00000007CKJ-0JIV;
	Wed, 30 Sep 2026 20:50:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1GL-00000007CKA-2gk7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:50:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E6F7403AB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020B41F0089A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790801449;
	bh=M+/OyhH3Msg6tLgpwLBJhE4kGp7BkelrRjhrjnMBWTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EZcQ2S60TURDf6RFzJiWhjm+o8/pmGx8wukMMT1q4m3AHbpqyJ3kMHVS96VN6+gff
	 18fNggtgil4NYvRcbOSQviZraYzceFnV6sl5gLCSmaLuDwBUH/sHemD2dTPF1zRy/I
	 ckHufBDhqtRt/Kt/56GL0AVJC4Yn5Jw6b8b9AsSKVJnqp+ZC/DmVSf4jqfcw57cUE6
	 HWV+l2ZztouEzfqiUzYrvr99snV/FLahPucf1N2LrvLDx8Mfvu+m+Zbb2eGdyv747b
	 OEIvbdF72Qu1SGqLVw21QS+NmoJ4LVHKQiXUxAljHVMUfD7Go99NykZnQgqgenXcmM
	 y86tL3LQlcr3A==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so934533e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:50:48 -0700 (PDT)
X-Gm-Message-State: AFq9FYKkA/nnqjU+SiYEg/ZkYg2OSTmwIyV+oxpTXA4a7K7eEoPwTp+w
	xD30wzK9KxN9SZ6X0DNzL48/LLRUOuvfE6/FTZ+XTHDDsCt9hwIzN003lgoF02A36LGu88ZfVUh
	07644wHy8RlCzZ3wZa0VXReqGlJl6xWI=
X-Received: by 2002:a05:6512:3195:b0:5b8:f494:da93 with SMTP id
 2adb3069b0e04-5ba405d9c1cmr1310761e87.33.1790801447761; Wed, 30 Sep 2026
 13:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-3-will@kernel.org>
In-Reply-To: <20260918161407.2300-3-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 22:50:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLkyS-ZOkpEXeEDzhfe7t4sn8NbzEeNO4a8WKsk_OfRLmQ@mail.gmail.com>
X-Gm-Features: AclHuK9k9Dqon_4_7OCW1CMCtBrEiAX2BH_LGhxILnxAEFTHu__0YdC-t83XsPc
Message-ID: <CAD++jLkyS-ZOkpEXeEDzhfe7t4sn8NbzEeNO4a8WKsk_OfRLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] arm64: entry: Only check for stack overflow on
 exceptions from EL1
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 6:14=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> Checking for kernel stack overflow on entry from EL0 is largely
> pointless and gets in the way of using SPSel to switch to the overflow
> stack. If the kernel stack overflows on entry from userspace, that
> implies that it was unbalanced on the last exception return which means
> we can't sensibly reason about the state of the system given that we
> could've returned to an arbitrary virtual address in an arbitrary mode.
>
> Remove the stack overflow check from the EL0 exception entry path.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

I agree with this reasoning, and it confirms my own understanding
of the futility of checking this at entry from EL0.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

