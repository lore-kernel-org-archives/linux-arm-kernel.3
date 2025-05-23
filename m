Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C49C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1Qz5wMN6ML0KeGlx/ug7p3qlLH+pob/79G9MOgw/Eo=; b=iy41K5nHTjjd7rbOzN2VqIjvT4
	CQRFkn6+NaEMVieC27bacrHmeko67xYGl9nd5FhC5uYDlYp4TATzQ8y/DKFMcch+vxZVnqOMn0xLe
	0nK82vqwzwEIM6Y02Ur56yTLPESURGhZDtTvxr+85WRTSW3qHXzCoMUuJhgYrvvcNKHjScUgIlAUc
	beTpzpLxC0clPI2qog7NoTinDqC19u3ebPVqTeFr/e8ALtrxiZ+IIxfURwJ2Jw5aiWNmmhVxXNwJD
	55RP85/v2mmYHn8MqxgfRrMVfPeBr5sYKHGNr1rcYqGRWBhqT28j5hHKV24yB3yt3ST/7erMjEEeS
	SwCskY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQrT-00000003k1s-1C5x;
	Fri, 23 May 2025 11:46:51 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQka-00000003jFf-2oYD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 11:39:45 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso596694241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000382; x=1748605182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1Qz5wMN6ML0KeGlx/ug7p3qlLH+pob/79G9MOgw/Eo=;
        b=wfaeaB4nY3/tZ+ferdmevNFuLMpYklYSbZdYVG8WleNLLN9nSXZfVdN9CDZ8SZRRzE
         yuxPNFiFVubffPhllpkNVO6CRsl91TKly5xp5saa/KV5q+x5xoq5WpXKsQ/z0nHOAkwg
         sBDUGAVoQFj1chEHw8454+wwDTAt4b4Tm/9JFnbRNXpxEhz222f1HLnWOFBupsRluL+f
         vlwo8DjTWBJ+3yvjgPSl0QsKnS+NMklxPzTSvmtFv9rQ/ZjUanQPA92qUxoKHfKBf315
         SbQxyJueuF+CBhkqIK1hKUxAkwiHSYAuAYv5Ia78zwOrCoqh4R1mmK5yfs2q/A2TYL5t
         KHQA==
X-Forwarded-Encrypted: i=1; AJvYcCWiaO6M9YIbvmDbNXueSuhAf+R3JCWDochk+gBBDmGn9k5i6R3peOc4YQLj96sxtKhF+PEXJyb9JvP0QR5FDnEU@lists.infradead.org
X-Gm-Message-State: AOJu0YyEquZ6o05zQlBmcLihl2LY4ATgnBjHjpCVrtB4OQrqguBshsu6
	Jssg9RAqfduW8klU2Gz5SFW/+kWE5k2PNmWdkRn8taT2tQn8jXSyva+Q6GIo1Xcj
X-Gm-Gg: ASbGncvkmQGZXLka0vKHjkZK4dS8K3nAA3CgeWNvwbQ+LJvNffUuSgBdhdiuAcHDa5e
	PdgNdKAW12AaSEMPAtcPvGE5FgKyz4PCcYpEcSxIW5ZGRLePj+AJRuG943nlSM9r/FE9DSJ2mZD
	rJMW9WgnsaehrrUaVZ3accqWCk8PsBYwBBHp9695rhAdG4k5Hj3s8aQT3ipw+mdxwgr52WdA4IC
	/KqgWZtbhStGvTQq4oyM+0XMuFJhKbhbObzPbOdqnSbxVnPNBkeI2ZoqDbh8Wk6L+66xPjgcYGO
	hrlOuJo4LTRJEmYFwgsa1P96AzshwY6QPdlNic/uYXLEtcYKbSib19ogVhMsu7nncAwpp3cz8Ie
	sju/ikwUruLrnwg==
X-Google-Smtp-Source: AGHT+IEnvycIweiYrosl3PwF3ZK4TD43XlVHSopowa0T+I7cVTpEmAOG1fh5kij0+Jv2K3DlOoyG0g==
X-Received: by 2002:a05:6122:693:b0:52d:f0c2:6cf9 with SMTP id 71dfb90a1353d-52f1eec4b02mr1716624e0c.4.1748000382114;
        Fri, 23 May 2025 04:39:42 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba944374sm13573390e0c.18.2025.05.23.04.39.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 04:39:41 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso596680241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 04:39:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSrpeMqn+zGKikcKtw5uvSivf+IwuVEl5TlIwe11eVO5d+6cMpVadgLUP/ZvmGVJqrjUwlqtgysc7npa9J1Ndi@lists.infradead.org
X-Received: by 2002:a05:6122:45:b0:52d:d14a:1f0a with SMTP id
 71dfb90a1353d-52f1ef31af0mr1807197e0c.7.1748000381090; Fri, 23 May 2025
 04:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 13:39:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
X-Gm-Features: AX0GCFtlvvYJEHVpBBWRFwPN2rDyTbPs4B63tENo6-GpVBADvIAJpc987Xu3taU
Message-ID: <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_043944_708194_C946A513 
X-CRM114-Status: GOOD (  21.71  )
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

On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> ensure the Ethernet driver is available early in the boot process. This
> is necessary for platforms mounting the root filesystem via NFS, as the
> driver must be available before the root filesystem is accessed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> With this change, the Renesas RZ/V2H EVK board can boot from NFS
> which has the DWMAC IP.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

