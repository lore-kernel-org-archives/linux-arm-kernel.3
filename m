Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0343BE9537C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZmRzw0UO0vo2/+RdTbe3Czfuc5YBOuRbRLbvZUi5Wg=; b=yCjEuLQDjfmqF6XOw/vEy8ihMZ
	f3RO6No8su0iShVOwaE1EoRo2G/5ESjn/LzgPtram+15wrMosdEWOlknpTxbwcO70h2nXRj7I4/Hp
	qByESGlcSKW8e+BC45cvCMkksH23H4GvgsWzdbBrqa8xVuAysF962GBR4W5vCTc/b6wE10qe1HiSM
	lAmqlekQKcHx1qEkkRYGKyH43V7AyA/Trk1j0QNmd5cSxX8I/FDN7HqLylN9XM/lhsfEG1Eek7+6r
	Lh/QBPnHKIpxFgJclgvGVU/Lbs0cHKbl/kHGrLgRfEDQbTpjzCyv74OmO25qX4wRq72W9vaeHSH5v
	ag567DUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnadd-00000008K2e-2lLU;
	Wed, 04 Feb 2026 11:01:37 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnada-00000008K27-1Ut2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 11:01:35 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-948aa4f524dso2131199241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 03:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770202892; x=1770807692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZmRzw0UO0vo2/+RdTbe3Czfuc5YBOuRbRLbvZUi5Wg=;
        b=mx8zcOXgEDtrjLcHTMThHJZJtrXn4gvyJnCoBxNsbsTd1ZHwp/mEd19EMnE7Sip36f
         /22/weAnPXFOukrUyY7nUX/f2h4LcEpd/cAiNMG9DeP7V83mlhgHp4sb1lclj7UoCTW6
         0kPxs6Ko4qvZPU/xtuEc4WhfdbiH3JIbhVcnyW7AXFnpZlhyjvLdZESkfrwDsFGMBXU0
         rf+FDV/H4v5brqaN+G6umjP8Jfo+CwiJjI55j945vHg7ovWGkJz6iAmGmPnc2kyLvbpH
         SBh2gihAdQPQiRLspcuLaFSD5SJPCTJTvZpAbJTXvPEVF11NMM7xGMGcYjdAg8gD8JLm
         G1yw==
X-Forwarded-Encrypted: i=1; AJvYcCW09InEtaiXDgxGC17Vk5OUmE2ubSgCVamRwtgjKXaK0EYdxy6rLD8nsR3FSoQw8MfX7DX5/JpPxQDv5T0NkE4d@lists.infradead.org
X-Gm-Message-State: AOJu0YzRMQzH5vLJG4oGPl/K5+c7EOm5ISbXSzZeUu+GGG62mNai7zcq
	svJXDb59knZDq/8v1v3q1qN3zQacNslMLMtZrzZljLqiIUA+OhHnI6+QJqB3obd4XY4=
X-Gm-Gg: AZuq6aKR9gXjoQGVjvs006y3I/ivsibxnYFDthnD71UZSxkd2izijW+/yTvOn9W/ut4
	PNn8c8FWOlL9Tf9f7CCFyH5aIbOfEkFhXdEJVBZzlomsvqHP/lhz0W+OVif7Dj4Rg+W8V9ZA75+
	66Xzaw0dHAP2D3ScMhz/AMJ3/ciS3gRAUcukJHoB63lGsLEZhkfhpke32sGifFtM+oXzm9VzDKH
	L8KsWgNKMbqCCg2Z864gOV+mn/CjyH5GZHrZ8WkD8duIU4Q8AYLEK0hSjmr7Ae5SOczTF4s9HqH
	9daawNQyZXLucwhe+ncQxo6Ez92q0KLsSryrJPKfYPD5UyPBM4DX2jLbjyFqkU9KksZyCguWh3b
	mmGiNtzOr3kqwvpDjbKKIFN33oPc9HGoiyHqIGxh9wcmzKSERPBIskVnyjOxp4fxSYsnzWmnT89
	/tQdz1kzofUl/YHCES3TkhKXLOgKc6HMJzzMLr9stdMvg3U1kG8KcS
X-Received: by 2002:a05:6102:3ed4:b0:5ef:a8da:8b26 with SMTP id ada2fe7eead31-5f9395a3167mr814226137.27.1770202892181;
        Wed, 04 Feb 2026 03:01:32 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f93aa2ce09sm754233137.11.2026.02.04.03.01.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 03:01:32 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-563610de035so4424022e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 03:01:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXC0jqbE7v+d9A9q/xN76HO/+SRnRpuufAoKPHtyip3lmiLm0mq9bqBPKkKu/Us6NXxFbJTKy74PyTf5374EGb4@lists.infradead.org
X-Received: by 2002:a05:6102:3707:b0:5f5:47fa:d520 with SMTP id
 ada2fe7eead31-5f93949b9c5mr1005127137.11.1770202421943; Wed, 04 Feb 2026
 02:53:41 -0800 (PST)
MIME-Version: 1.0
References: <65d62b60.050a0220.c7b96.614e@mx.google.com> <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com>
 <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk> <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org> <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk>
In-Reply-To: <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Feb 2026 11:53:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
X-Gm-Features: AZwV_QhhJxqrTR_22lOy1yb59hSHrrMaeGG8yCU0hfXcMFH8x-xzifd8o28DJPk
Message-ID: <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Eric DeVolder <eric.devolder@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_030134_425079_1F63708A 
X-CRM114-Status: GOOD (  28.17  )
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

Hi Russell,

On Wed, 4 Feb 2026 at 02:27, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 04, 2026 at 01:36:29AM +0100, Linus Walleij wrote:
> > However, I think it is a thick requirement to put on hobbyist
> > contributors to go and write entite boot loaders from scratch,
> > I think it's a fine requirement to put on Qualcomm or Renesas
> > paid maintainers.
>
> If we're talking about older boards, then why have they only recently
> became a problem, when, presumably, they've been working fine for a
> decade or so?

These boards may have been working fine, given the right "legacy"
kernel config options were used.  However, some of these option make
the resulting kernel limited to that platform or even to a specific
board (e.g. when CONFIG_CMDLINE needs to be used).

The KZM-A9-GT I "need" this for never had upstream U-Boot (I don't
think I ever had any U-Boot sources).  I can boot a shmobile_defconfig
multi-platform kernel[*] fine, iff the first patch is applied.

[*] I mean vmlinux, as the actual image used for booting will still be
    different (uImage/zImage with/without appended DTB).

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

