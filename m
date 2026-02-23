Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7333EE98E14
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=; b=HZAkvIOTvT236H6jgCMsekLESj
	CzS0v+UmYj24x+u6j1MyEoktmLltvedwqQBEXXkU1kprIK6X6IutXDqLYwg1AQvi5uUsahz0S3hQn
	+6U9T8aOmfmov/zBpp2dQhgmbm20UaL+LL0U38pbTYkX+FUZ0+5a7Y36rnNMdIB51h1hG/rPNPJuu
	SKm2tBO9FLTHhnzofRLDG0+9YzevGbSyNK3m+byeAuvSzFJ/xys+rq2f5TgqnqeWP8RYi7wmRbZnc
	V+S6hwqrmc6xeYf9rXUpwcKuEH1lz7hheQv9kXnue48sefoh0ltG5VWgayHs+MATJwrZj/yqFUsg7
	S7F0v/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT4a-000000002pE-2dJJ;
	Mon, 23 Feb 2026 10:21:52 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT4X-000000002o3-189F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:21:52 +0000
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824a9348603so1651041b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 02:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771842107; x=1772446907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=;
        b=gFKNPYat2uUXTgiXQVEw41JDYKNH9hmuSHHqTYbGCC9o+0VRfDso2kfq9pJAYzIrkn
         Q5vLI9nC0RpNWTc1OOivT/H/Sg1qdTeZwbt4s5FrnzymaFulbGdBN5gutaeMT02jSwuO
         oyF9TzhHUsSmvjnEyYlEsxwtqNpRVZTWqvsOgmUXb9Yj+9F3RUIcqgVuiLyOaN1v4qVY
         xkIqFLFbv5SmoazpKfX60vMUGLDLM44i8ZpkeAyaGrA9mufwObOWL4HkXW52ACAqeCs8
         XDsMChWpJAR94JPCBUy4E+eN1/lyx41VzMDjYAoFflNuxrcsBWxCjGj59qnCt4fOod/9
         B9dw==
X-Forwarded-Encrypted: i=1; AJvYcCX2uZMndV2DoJ1ZWXET1bP2T6+yMTW9pRwy2RwkJwjpCV0I2WUp69JelXNfQkdzGvuN6mb5UKlwP9IXE5e8PtOM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw37MkBqhTUmOOpGK3IHhxmtMAzPX5O/BkOGMe0kmsqeLz9U+IW
	m1Yx7cPHeErSm16jVgDSDGMnaRrj2i9hARyMgrRZZm8XI9K5m5husSEMC2m0xrO9
X-Gm-Gg: AZuq6aJmGcyDZoY8OoBtdWQQzusjeTYv2ow6T6gHkQyyJIH+h/g5dkV0zKNWUW0Kue3
	bFuNSeCK59afh7G3VQCuLcXBa7dgz16khjwKTqalZgEkGHa+hWnbV83YVAlDWW42KarpziYFXN6
	B5JIEhIRn0CFGLMCBFNpnX9GgnHEuIVrauiw6iBwtUUcNbmtp8A2A9NmCG+yRybhaQkPzZ9eUIk
	JfD2J+onk/7U13lIR5QE0P5y3KflqrclAYf6lkTRai1hO0lH4tZ4gNLUNCniisV1D3JsNHhMs53
	TVeAh4C2/UY7PkRjkrz3MlaClAxClu8EbRbeteLBiMVAEw2PWlI96FqXdLb/lkvqo6/gZwbB9v2
	UPX7sPSmp+VfRZ+u2oHhoiWdHDoxqCQfMgbi0YX5IcliPiTRkegMjJ7LvRk7RaxzEdMVwWKGdep
	7zl9jMSeuynEUc8bAGDY6gD2qoax5xltN1EFvBQi4N1h1CxFltcVNqJWFQI2er8v2GR2rYsA==
X-Received: by 2002:aa7:9313:0:b0:7e8:4398:b36c with SMTP id d2e1a72fcca58-826daa86722mr6533153b3a.63.1771842107338;
        Mon, 23 Feb 2026 02:21:47 -0800 (PST)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com. [74.125.82.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd68998bsm7978593b3a.16.2026.02.23.02.21.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:21:47 -0800 (PST)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9694so5357681c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 02:21:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmZVn5SDsTH8m9JUv6HczJkPySzACQl2/XAHszjFThIPZFmxOVxQCwxhjJnpEZ/q+lwRguUHGZCoPjKA9z3JbM@lists.infradead.org
X-Received: by 2002:a05:6102:38d3:b0:5fd:8175:2eb7 with SMTP id
 ada2fe7eead31-5feb30db471mr4509289137.34.1771841684922; Mon, 23 Feb 2026
 02:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20260217212707.2450423-11-cassel@kernel.org> <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810> <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
In-Reply-To: <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 11:14:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
X-Gm-Features: AaiRm52HvurLndDwor1bgpbfCcI9wH1Ckd1tYC4oQp0RsW6za3e41CkVlZ_fe6s
Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den <den@valinux.co.jp>, 
	Damien Le Moal <dlemoal@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022149_334668_9F14DEB8 
X-CRM114-Status: GOOD (  22.50  )
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

Hi Manikanta,

On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
<mmaddireddy@nvidia.com> wrote:
> On 18/02/26 3:27 am, Frank Li wrote:
>
> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
> BAR_64BIT_UPPER from BAR_RESERVED.
>
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
>
> No functional changes.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>

[...]

Please do not send HTML emails to the list, as they are rejected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

