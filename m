Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5724CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tljfG2MYEam8t8AtYWWq514QumbdCKZEA9GJU7iOJE=; b=1IqZrfZJilBQS0rPWNyO1ObQwe
	VQRGfHSDCTqzkuyIlmK0ypEKlksFFrXV6piVniNht1LnY2JFYvZcwgQ/m5yYl1v43f/8tYFZLtudx
	+3zC+qTB4RJlIFTNeUJ3r2mPC2VzK5lLd+OwKcmOYTnNU1Ym+CzdCcOC6rnqXk5FYNKC/kYE+VjJj
	7x4yEWuLPzKLp363XtKZVjowOuyMXuPYGxnypVl2mVdHBKEfn5ZJBqq+kEExdoQOHMZLA9efDy4M+
	qR0EyodzXvIt6cOJRyYJsb0YWI+P+BCkc84Jg1OQs8k0z/yD5JM5yJKiKGHqSeT2ru3tYId9turum
	ms1Zw1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesMZ-00000001Ki4-3ypo;
	Wed, 01 Jul 2026 10:40:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesMZ-00000001Khf-01oC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:40:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BC7B6001D
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1434B1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782902414;
	bh=8tljfG2MYEam8t8AtYWWq514QumbdCKZEA9GJU7iOJE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PWAfQ9gfRc2tIqooSGsK+54jXObfq0TUgWaeCNe6oo2MTu5F4UT301EaBVa+LgIRB
	 Yef6HdM70fr5hwqh7cK5YgPHXxVgoUv+yala1AP7S24GLfikZm+Eqxs69Vw88E9fQN
	 a8ZZcM2PQfA2me6daLGBVQ4yeF++2E0D8gCyunDtlNag1XgXSpdM/nAJntVxDyZNDl
	 rmNZG4XJrcVsWW4oD5dC5q1KHiAvyentz5B19PTcd4AUadfmJD3HqqmzFY4GeNqG1y
	 v0xMiJW10bptq33PXzPFUUz/2Xqaml/9bmdEuZsMdfUjo75tE+yZHdWcCeHdrg2Fio
	 QRIWM6T0H8PIA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so404467e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:40:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YwfL6ZIgat0zUNhKT22Rdd7C111DJ4G6ZtPRgEaYUECJnj8sMtI
	IZqRUmk8fuIH7DvoBMbgIJLvyGUhnE/vkE7PVAQb27IrN7n88ZFRZYgFzgYJni4wf3yXWoDb2r5
	iByTdmeugnyAB8V4J5Q+FRxQgD3yLpiU=
X-Received: by 2002:ac2:51c7:0:b0:5ae:c62b:fc45 with SMTP id
 2adb3069b0e04-5aec678e657mr216415e87.9.1782902412908; Wed, 01 Jul 2026
 03:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org>
In-Reply-To: <20260701-arm32-cfi-bug-v2-1-9bf922593e00@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:40:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=G1-2A-h7oXxq3eUhKLLpNQq8D3Sgh9nYK_0Q107wf7w@mail.gmail.com>
X-Gm-Features: AVVi8CfLaDi0Can4D2LJnFOq4Oq48vw-nrn8jVWNhab5RVBKiDNrfMZHd8GfN5E
Message-ID: <CAD++jL=G1-2A-h7oXxq3eUhKLLpNQq8D3Sgh9nYK_0Q107wf7w@mail.gmail.com>
Subject: Re: [PATCH v2] RFC: ARM: breakpoint: CFI breakpoints only on demand
To: Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, slipher <slipher@protonmail.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 1, 2026 at 9:11=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:

> This removes the stub hw_breakpoint_cfi_handler() from ARM, making
> it not steal breakpoint type 0x03 (ARM_ENTRY_CFI_BREAKPOINT) unless
> CFI is actively used in the kernel.

Was meaning to send a non-RFC of this band-aid patch, but missed to
strip off "RFC", mea culpa.

Yours,
Linus Walleij

