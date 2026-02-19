Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D016E9A057
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVs7gOidbmt6oOnZ4Xr9TP0l/QbXtRBOYq/AhMjUzI0=; b=vr7dJVLRbReglrJIRAaJuQ35kw
	ZIvgqnLFwh4Q6muuksZ0r+haHIWo3kGYPG4xKmTkWJfSvY2fPmyhvutjqHQsttCU5NK1XgoGML9+E
	pmwiboBuIFIZVaUvntm6hCtciB34j6UoYqZVbnX5VnlbXTVbNFN+bTRS3CNSisIgHEzHMDA7Zzc1k
	2qZLlkEoNmnuV/0JBpMsjsc9ffDAN8uVRbIfiT2i9/4K1g0vQnxhN+N7/kquVAwrZpWRPWwpAlb/q
	u7AFh4xUFuwhWSiYtYCjJAxG7OOadGPx0xg6OQaE5woJP1uUtQZgFfwtalMdlnNXL9nXHl/rg9J/6
	oiGKgspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt87r-0000000BjIe-2g3F;
	Thu, 19 Feb 2026 17:47:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt87q-0000000BjIN-11OW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9C0660054
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 17:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D17C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523261;
	bh=UVs7gOidbmt6oOnZ4Xr9TP0l/QbXtRBOYq/AhMjUzI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nOFI+HPyVHc81f3DhMYJF6XA9Nhb3ljERp0lZB/9OYWiW5aFVDw8u1lpO0zWIIzoz
	 qEOzCsDP3gfIGzVl59zK3W+H/T4OQXaCoD+uz9NCcth0sIkZZC5kECWqNyfN9JbmU0
	 9xcTqDuO5yNMplido0hAAD5yT1a+x7d667Aw/jEpEg8ABa0hv0cL7Z7QrgQ5jaT7x8
	 xglxWJIxonagMZG8aQ0r+VSmCCJ6Le54pQJckq0DJwY1z71W3++3ghS5gPuE/OcAvF
	 7I+hFOI+7FTSVHSf1909hGaTaqYtk4RmHKWUdqrgDng7aB1TiRS7+Mx5Z32Ts7iZ0U
	 1xImcrHVAkiPQ==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-797de0727a4so12269737b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 09:47:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUA8assVr0c4IDwETG+a61XybGs2fIPRkDpa1yXWi0dMcE+FF5v9TX990wXId5oK73L1qVJ1slZSGbVslHNXEgj@lists.infradead.org
X-Gm-Message-State: AOJu0YxBhduR/o05l+yda6KX9UsSagp56asRe5JIYJjThDuINPCqcJaH
	3rpm6m5MyxT2YbPaht91D2O9FQJpHGuYEym+6uqYL18/3kmONbUIectAzFTaqZrDxwtJlMD5Khu
	q50p3HGwocUB7JjqaXPWR5hndQAbKjGc=
X-Received: by 2002:a05:690c:e361:b0:797:ffb6:fd5d with SMTP id
 00721157ae682-797ffb70279mr38827607b3.19.1771523260625; Thu, 19 Feb 2026
 09:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20260214044531.43539-1-ethantidmore06@gmail.com>
In-Reply-To: <20260214044531.43539-1-ethantidmore06@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:47:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLn2HLjzN8MAGYFes=ehExVn8aaCEBspkJv8XE9JeXT-8g@mail.gmail.com>
X-Gm-Features: AaiRm53b71tl-VbDTTw6kFslGZNdEUnkn7Bdin4zAynyZzamGnID2MPN8OzNQeA
Message-ID: <CAD++jLn2HLjzN8MAGYFes=ehExVn8aaCEBspkJv8XE9JeXT-8g@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add missing IS_ERR() check
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
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

On Sat, Feb 14, 2026 at 5:45=E2=80=AFAM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:

> The function gpio_device_get_desc() can return an error pointer and is
> not checked for one. Add check for error pointer.
>
> Fixes: ddeb66d2cb10f ("gpio: nomadik: don't print out global GPIO numbers=
 in debugfs callbacks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Great catch!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

