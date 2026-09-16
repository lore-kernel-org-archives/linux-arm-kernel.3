Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABD7C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvpDqPtcVDHmIGNRN5Cwdl96zxBMwJm//wszUGDWEyE=; b=Pspk9irymObqLU8AUczxKl+Byh
	prmDcsr/hxSWIb66tGUfrOlrfJPRnDbL3TIhFw0mDvGr4wYCEoJNj8H1fyrvZ+QeTX3kTaRGod0aO
	IOx1wyGFUzEnqi8PYpvRuLFJyQMsDQDIcaeUik4QMS/JSnuxI3E6a9b45A4piYuFs1w+ArZnCkD/Y
	NEzEwEUQq0S4M1l6IyxkltERnzjYtiVolQ2kO2DD1fari3y1Ql35YUo55dkaQADZp7HJucFo8V0Xb
	q1lhym62wJWwQhPF9cVCMHvV9+s1SZQLNufUjZB7QkUdFb/MRBLDG1EaROQHd18Kk1kEpehYxfn9G
	A2c8gtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tIV-00000009rCX-2rOH;
	Wed, 16 Sep 2026 17:19:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tIU-00000009rC2-0DWl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:19:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1F4B43D74
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9668E1F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579189;
	bh=GvpDqPtcVDHmIGNRN5Cwdl96zxBMwJm//wszUGDWEyE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UoJeGhwPyLW8ilCTa6I+PhjeWrHSN2Q49sMY1cb2yvVyBm48OIxmEr+3pNizbM9HR
	 KZ2HcdqhA8GwzgeVhykmzvBdvqkCWZlVMhQx8Fk0K6ZYTgpiX7bVpw6c9WxbY2Q4tP
	 vuTO5kH1hYhqq3ycpDvHsjNvnePStrU1wPMe/qPkF8THXf4VZRpAklw/Zs9J2ljoTj
	 muwXBbm33JRjDsM7wjxzvPrffatvwAxi2tNORvSuaQtDvVobNj9FjyFjL8T8dgd6p5
	 OfmTLfC7/u+jTpq5MRqWsNOq9fH2UEOSHVkg1xYClXQtsi4lrUEmKbfbbMU/6yj20e
	 CdNVnepyCtiNA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so1230533e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1XyOAT3fJDCLSs/XJ3zb2pwxnMF5S0KT8jbZMY7FaOqOSU2vgVlswYoq3kk086T15z77PiZ/TOljHDKDIYKcU@lists.infradead.org
X-Gm-Message-State: AFuF++lAXWoBJ8mGxwN8IkB1a8utdi1BxbSkUuvwaTv+MfECVU5jtlgf
	3h23mSl5UMTrsYzML2cCRhkrCkjSBuqE+n8q2k/U6y3HW4JJ9IReKeIkpkA8OwIq9P3DyYouOc8
	guaQZ/s2la3OsAkopISR0b88H0/WkV84=
X-Received: by 2002:a05:6512:2388:b0:5b5:e7a8:9b1d with SMTP id
 2adb3069b0e04-5b8b6625ba5mr1991668e87.13.1789579188303; Wed, 16 Sep 2026
 10:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260913040312.21966-1-mhun512@gmail.com>
In-Reply-To: <20260913040312.21966-1-mhun512@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:19:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLn=6K7EZLuXnP7vcNe2s1TpNF+gVCnGqh2e0AnPeB=r+A@mail.gmail.com>
X-Gm-Features: AcwNN1VsVf0Ab2PJqc6NKhxiLm0epWqyyaiftJvVfZNznCffNKfZ2aSXL8uXvug
Message-ID: <CAD++jLn=6K7EZLuXnP7vcNe2s1TpNF+gVCnGqh2e0AnPeB=r+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: free the IRQ on domain creation failure
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
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

On Sun, Sep 13, 2026 at 6:03=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> w=
rote:

> pcs_irq_init_chained_handler() requests a shared IRQ on affected SoCs, bu=
t
> its domain creation failure path only removes a chained handler. That doe=
s
> not release the action installed by request_irq(). The probe can continue
> without interrupt support while leaving the shared IRQ action registered.
>
> Use pcs_irq_free() to undo the appropriate type of handler registration.
> At this point pcs->domain is NULL, so the helper only releases the parent
> IRQ handler. Then mark the IRQ invalid, as the other initialization error
> paths already do, to prevent another release from a later probe unwind or
> remove.
>
> This issue was identified during our ongoing static-analysis research whi=
le
> reviewing kernel code.
>
> Fixes: 3e6cee1786a1 ("pinctrl: single: Add support for wake-up interrupts=
")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:GPT-5.6
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij

