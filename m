Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC6FCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETwbRn26H7UqXroidy9rgI+SsdhQGimrEFnPy/6ATxU=; b=E9+IOSZrJzh370EgCVMHHSsgvy
	YlftK6SmHUvj3sSAL1yOCeW9zYjN3oJ1Tf7ciUmPds+2dEdSnYAskbFr2etBh3imUM6kaNV9Z01CE
	gQyW5IlEY8ZClYR1H8vLKp+JcLAxUseQOp143DLHuadwiKpsDLTZBB6QopWzkslMuBoeXA5uMBCcO
	rTKvKVIuh6wX/VqEnAvu0swGLpQLjRTPkYqGjqOZNww0GM47lZPuhyWAobN9pHFHcuKww/bMPwyUq
	IPVLGFWNndOBqfpym2/Cj4ESCKttqkFAg9Uu/52lUtoZLRLT0wmk0WJUH7WqnrNhqHmjAG7plp72R
	F27kK1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBcu-000000084Ee-18g2;
	Thu, 01 Oct 2026 07:54:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBct-000000084EW-3tqb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:54:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A4B9601FE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67A01F0089B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790841286;
	bh=ETwbRn26H7UqXroidy9rgI+SsdhQGimrEFnPy/6ATxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fq+SjKEgQn9P3yHrzs/atgdjR4PcXMgC5vF27cpyXZks1jQNP35sr5v3RgOOM9sec
	 FY2rEoDDVMyDYvK4nt3oXav1J44etrXW5LciseZo01vY3xXmZ/Cy8AgtE5m2h2e9QF
	 NoSJVX9Owbl7Ujq01F47Ovt0xxszViF9DDwxmb9fu2QgBVg4B+jxCAw6vAhUeSah9o
	 MmW7Z9E6IvG6xCljJvaZTT5BjixPYunphoI4k29WgWV/nHPBe08cbR3RIF1cn4zPXZ
	 4Gztwh0Z/Jw6EKD0bbTnCSqTM6SzLnrpssTMgkXQbRZjtDGNUTLl+IrWfJpVPVJDU/
	 1Wd9KXmQFLUxg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a783ec301dso4446481fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:54:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBydvTZkXrDy0Y6pOK8nzGvCjI4GBYo7btkXm3lUS091wj3btGvfCZfgkRlMDud6nVezSnFSDEOIB1OAxXjoJ46i@lists.infradead.org
X-Gm-Message-State: AFq9FYKkj8Nh52IXrE2N/0QBX1Lpu3+kzmOBbj21sH+MtDmQZQzWkq4Z
	i3BMoBSYBQ09YKnvEq7zxrk9rRTIQ9CqALboJ6YEygmR562/73aoBUo34IMG/bg26PMjm4Jt1p4
	hUPoguHRCzD/AUf4G8e0ktxStrYK3AW0=
X-Received: by 2002:a05:651c:418d:b0:3a7:6d4a:1c9f with SMTP id
 38308e7fff4ca-3a779208624mr10196971fa.15.1790841285508; Thu, 01 Oct 2026
 00:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260924160344.109727-1-ag@ffroot.co.za>
In-Reply-To: <20260924160344.109727-1-ag@ffroot.co.za>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:54:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLn75jCXJ=ctAYYp_jUaEmSqWfDrcTTT_wmd+xxQ6ednZA@mail.gmail.com>
X-Gm-Features: AclHuK9F1au3yqxI_3whPEzzbCAt4NHBvQy8QV8gno-5Vu1puBjqF3KkK0x1aHA
Message-ID: <CAD++jLn75jCXJ=ctAYYp_jUaEmSqWfDrcTTT_wmd+xxQ6ednZA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunplus: fix kernel-doc parameter descriptions
 in sppctl.c
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-gpio@vger.kernel.org, wellslutw@gmail.com, dvorkin@tibbo.com, 
	linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
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

On Thu, Sep 24, 2026 at 6:03=E2=80=AFPM Andrew Gaylard <ag@ffroot.co.za> wr=
ote:

> Add missing parameter descriptions to kernel-doc comments for
> sppctl_func_set(), sppctl_gmx_set(), sppctl_first_get(),
> sppctl_master_get(), and sppctl_fully_pinmux_conv(), fixing all
> W=3D1 kernel-doc warnings in this file.
>
> Improve the phrasing of some the other comments in this file, while
> we're at it.
>
> The warnings for sppctl_func_set() (@val) and sppctl_gmx_set() (@pctl)
> were newly introduced by commit 7dcf87d2dbbe ("pinctrl: fix
> PINCTRL_SPPCTL=3Dm"); the rest were pre-existing.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609240204.VHoUp5qw-lkp@i=
ntel.com/
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Patch applied!

Yours,
Linus Walleij

