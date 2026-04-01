Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE61DD3515E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JovjSUZC1lNxdv0gpf2LIekR3ONpuaO8xMZDQYnx+qs=; b=NRxRJfUNYYy8CbmF+Yc0+Rw1o8
	o0lDd9RoHj5pKQngkaobryWxk6bZRoMd1cr2M+WHfhn5Mk5ZrBDj2ui3kSsRAb1gvI68aZmlqNEQn
	36/k6y6v+mKOs01qHNdaemSXGvirMAgRbuNREimB6m5guhocaJozha0h3l4AGISj1x/roql4sSJvF
	xRRAjT3k9wGuts8x0DnTHdnFVOpSVxmIasNx4BdfRGtb+ZTBCFJM4LfWeCucHeDtriVNzanRxhD8l
	F+Syhs0EMDl9SDJe5CPUb3DQheNncl5z8nCG2LVEIWY9ZSU0H6Iph3d0eVYaYvFtwftuM0SQiIw4B
	YtdTgNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rMO-0000000ELtl-3VqR;
	Wed, 01 Apr 2026 08:55:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rMM-0000000ELtS-0o6u
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 08:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JovjSUZC1lNxdv0gpf2LIekR3ONpuaO8xMZDQYnx+qs=; b=FESdatQdOsjav9o4ppstR+QGgK
	6rw6lJt71CNwJqNQFR6n7QaCw8pxUbxkI5dw8FAcOhGSCo63VYgchH0OE+oGy1lD779TbAjq1DSDq
	dlpWx+Te/pUZPg5wwG5HhX0BHqxaHXGuqVMl3WEd1W2knNIAvE99QlFgX8229lI78BBi/6pWBDxiY
	lx2y/S4trhHFM5NwgAIFJR8wgaN3T/Kb599QjpZ2hnh+uUOMtyN7VXJRtZnta4HNt//JcvjhzmXVN
	laANi0OKr8+7JDJ0b0bJFX2/UeZH/wDXrmcH1Tj0qcIyqsfHjAuJQ82fuqbtSx2lgKq73j43z/5Qf
	6dcxRwEw==;
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rMJ-0000000HTu5-1Sy4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 08:55:33 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-604dfcc9892so4415301137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 01:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033729; x=1775638529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JovjSUZC1lNxdv0gpf2LIekR3ONpuaO8xMZDQYnx+qs=;
        b=sulIf43pgxyxgww1hfymU1fvSw8z91XuABMjUK8ffP2h7hiHiAXBCj3oPJ5aeifocb
         E7ra0jrx/hZGsBf45+l0BJUSNyup7ykQ2hgmFyl17/QKd3C3A2R3jcFqlFH5cHcBv77w
         LhlCRmdY3H7Db0Ec1Bxs+L9bQpQcvqOjEoZNCTh1OlkQdw82WQHlSwILBLNHmiKVmveW
         jcXG8fRUdq6Uw9KXyJQgyDKrGd0SgNCaHvFwLwUMCpSF56skWzs1KDPNIGM+J/Id85cD
         2aPl2h+mGhw3nPweMZ3jmHI/ov+YqzbluHzEWDCwdx3aaLLI1uupeLK9gTEgTAuE7m6w
         RPTw==
X-Forwarded-Encrypted: i=1; AJvYcCU5PjEhRNMbxik6yv3vu643NI7CFeuiUrJKIUzoKAhHubWmB/GkaGtKh6n8SRBf0uwBmvGtAfujVJbN2TV5H2GY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+VDWcGiQwVOG8lARVyU2jJ6dGJoQYVAVpnHCe6wxF5Nnpm+5T
	cP4n9v786/k0p64A1ZLsSSnYN4jE4/MofKVq4pT7UbPGnbJXQmsd4DS9qOQbV0R4
X-Gm-Gg: ATEYQzzJemUQdAilXMVcnNkO4a1bYZUBNwtuBq70ggNCUVQchu040T1mdFzxKq7zS7k
	d1/5Ckwfh/61GUDshcSJL1KysH2j2TZycy0h+bvXdlvtLB+MMTqzv4FpjBI2od2LfkB3CYh+v+q
	qa3W8LQN7gZuc/GKK8GHFhpzQKhTA5g5CYpgYQMEov7GD7hlQrqR3x6GfQC2h+TzPjDv14qBCzD
	LjMywaAKaX5m6FUqCIC3S2I79CiVwXGzTauWnfS6nUQy7BW0jZe/yVFSNKQ58+G0EpVIzmqHm8n
	aFqRfiJ8ibtajWj+3lqesMUTyhK3wy+JT9KuKscORlskkx0/o2kS7MGl4+gFYJTk2DNCwJ+mrt2
	680unbhdVbH0mYC+efJdZxnNEp/8luIx6X2u2J+gsJoKq0c5/5qn6ZoQr+JcW5Ln8BPX7mwWI5a
	Pl4ctBxPStx9symsdp4s6hK6WHagXwGWmXNEPcOmzyNm/sQgtplt27mg8CUMT+
X-Received: by 2002:a05:6102:510f:b0:605:666a:6698 with SMTP id ada2fe7eead31-6056824dd5bmr1036906137.32.1775033729553;
        Wed, 01 Apr 2026 01:55:29 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605129b8347sm15873454137.3.2026.04.01.01.55.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:55:28 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-951a0e3cdabso3672411241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 01:55:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1rTHYLrGzGak6RTpuPRB+/rUXoEj4j/9gp3RbxX8s3Lff34r57ro4VZ3QcLMP+bGnWqlIwfpwRV7VGcJzzgBS@lists.infradead.org
X-Received: by 2002:a05:6102:14a5:b0:5ff:d434:b507 with SMTP id
 ada2fe7eead31-6056811633cmr1013502137.17.1775033728220; Wed, 01 Apr 2026
 01:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260401083242.214492-1-tzimmermann@suse.de>
In-Reply-To: <20260401083242.214492-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 10:55:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5B6LpZ5ffaOc0Et0PK+G=_c8yD5K8JynRwu5T8rHfsw@mail.gmail.com>
X-Gm-Features: AQROBzAaKXfPphxAx92Ddhxtbq8urMrWt59bUWKyg2D17bALeZWDk-W7fhNxXrk
Message-ID: <CAMuHMdX5B6LpZ5ffaOc0Et0PK+G=_c8yD5K8JynRwu5T8rHfsw@mail.gmail.com>
Subject: Re: [PATCH] arch/sh: Drop CONFIG_FIRMWARE_EDID from defconfig files
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	arnd@arndb.de, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_095531_580103_CE311D2B 
X-CRM114-Status: GOOD (  18.89  )
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

Hi Thomas,

CC arm/mips/ppc, as you sent similar patches for these arches.

On Wed, 1 Apr 2026 at 10:40, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
> true here, so drop the lines from the defconfig files.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

Upon first look, your changes match the (current) dependencies
of FIRMWARE_EDID.  The dependency on X86 was added in commit
7e35fc7ab433683f ("video: Make CONFIG_FIRMWARE_EDID generally
available") in v6.17-rc1.
However, CONFIG_FIRMWARE_EDID also protects fb_firmware_edid(),
which seems to extract the EDID from the PCI ROM, and is thus not
x86-specific?  That function is only ever called by three fbdev drivers
(i810, nv, savagefb), though.

I assume none of these work on SuperH, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

