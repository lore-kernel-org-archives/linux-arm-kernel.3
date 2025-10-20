Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7535CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Anov0QvRPQfn4K2J8uUtp5viSlmFSR3/aNvGLqYjUXo=; b=lSywDS9EwcXi4mZp5lWDPCU/mM
	VYZtdAPLKMNovNbYpFlBmbZvUcTfZCqVz+zUBxUzlwdNqSFKaq2dxEeGJzFZXUbEGer/OdTPRVjYY
	nAhOewb4ICCjOh/UwbOUJNkonLzD2t8qzyNi7/h6cofEUIN7mG2+JgA5NfZkJBsFDds1LHDT/mBoJ
	TRCNVJZjf3s9KcalH3UDApOCveCI3sJr2U+HbxOLNlffY7kmKH/IRM5Aec26eGAN2j57eqe7jRBFx
	Bz90go7zu6HFBkMZVzv51m8lxjwTnnnM9IPn2kVH8HPJqnNIVbq2pcoHa2B/Ehko1kGzdjXyhnm2X
	tUGQg0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxDP-0000000F3Z5-2CH8;
	Mon, 20 Oct 2025 21:14:51 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAxDN-0000000F3YW-0VZj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 21:14:50 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-78488cdc20aso29931567b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 14:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760994888; x=1761599688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Anov0QvRPQfn4K2J8uUtp5viSlmFSR3/aNvGLqYjUXo=;
        b=wpEqzuXVqhr9Mf0v2w1GPwYacSEffkeizx2GeFnu8QYwTBbDYuTY1juD7Ci2u2lGpE
         +XsqH7giIw/uIjFvaNOYuF+i/UidEkbnq5H5mMR5gjoP6cXhLzI1+TIKORZNTnIY1V70
         9dn811yk/Muay9vZTAxnfi5zJitYmSP4e7gY2CA6ofhLmGIwA8YPjaD+hlvWno5QfMRc
         DdLF52xnWQyEd60X+7j2BZmMV6g/ev3Kt78K+mPDCDZc61Avr8AGfZcuuURnptIkLmHL
         6d9CJSntej+1/A4eFkPzysKb2Lu4ejbL7YPSGz2cveM33TRyb4uSI6zltOgiorzolmH3
         Qtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760994888; x=1761599688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Anov0QvRPQfn4K2J8uUtp5viSlmFSR3/aNvGLqYjUXo=;
        b=a0mqagfKP/z5Stpo14Bk6/4XUyp/uWpeYn44yKgfUhQWSteQnmq2pY0Mx6TMEV5Ew3
         A+ZOtD0Lr457t70SKM6JzR++gUtL7jRntrspIagK+oNknejZuhrIrFh/vMOZkzj3nYw2
         eWiYvZJQS3WJVacd7AJsIWHCRvzJxhwRDepoGO5NNIqYBPQWqddTtD41D+kQg9kiXH77
         DNI8uqNpchI4dBiBncKyxbBVNsl6/IPwup9cCrVdLsXdsf3gd7gWtnIBEoSf25OHU3Kc
         EF83vwby5SgVqUXHntNpPF8sjw+h2zLACNLNseS/557kB9ooIuYmEUTUB55MQxpgNSDE
         tESA==
X-Gm-Message-State: AOJu0Yz5y2Gpw3ePjskRB0tCVLIoL383HRjKn5vxcXk5aFAHIarjxzbo
	qAU2OC/41CLf8f/vlXm/DhtepBv8ilDUyHpQtb8ka3ya34X1Mho8sXuhwA3FkuWZO3RrNixi0j8
	RVCOWS96QUXc100vqlzqhMJIKFy/s1MNLK2zOn+BvdA==
X-Gm-Gg: ASbGnct8NtW9v/396pwM1l7B8bK0lXu4PH/1fdNdvsLZfzpO9kYThTu3QjT7oRjbUJL
	fyVcZSNApPC3GBFjkcK44yQPtvfpnnqPApQC86g7zLcD8hM1GaidfnbSk/wNgFHnepB3lttnsGp
	CM8m0ERMKWkTyb99Wc/0QvUa3jFVuVSsETmJ+RNTY7j0oLwlKNpgUDRWdRgVgr8mVbZo5Ln3ios
	r2piPe3kg3VbyrDxSnqn6LLRp/FNYOGHlH/8g19rLwT//qvKGDOeKfIScPp
X-Google-Smtp-Source: AGHT+IHhrp7Mn9zG8R+s34GGCarO9Dn8P7XKckYmdVwHQpsn3aJyInOYeKKns+cAzGFVWkgEGpTwoLHL2z6emdmu3u4=
X-Received: by 2002:a05:690e:12cb:b0:63e:2f48:2bcb with SMTP id
 956f58d0204a3-63e2f482c43mr6596645d50.62.1760994887673; Mon, 20 Oct 2025
 14:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251017143302.1776953-1-arnd@kernel.org>
In-Reply-To: <20251017143302.1776953-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:14:33 +0200
X-Gm-Features: AS18NWDHiKNwFnALX7AQT5km93TFZcU8T80jIGuWJpNTNbsxPXZ2-GQ-sa1_jQk
Message-ID: <CACRpkdav6Q8Sv_JC3g86YttdGiPsvmSs+5OBxOX-EL5-S4LJhA@mail.gmail.com>
Subject: Re: [PATCH] soc: officially expand maintainership team
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_141449_167544_30846D92 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, Oct 17, 2025 at 4:33=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Since Olof moved on from the soc tree maintenance, Arnd has mainly taken
> care of the day-to-day activities around the SoC tree by himself, which
> is generally not a good setup.
>
> Krzysztof, Linus and Alexandre have volunteered to become co-maintainers
> of the SoC tree, with the plan of taking turns to do merges and reviews
> to spread the workload. In addition, Drew joins as another reviewer.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

