Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10789C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEAVGW99jRYpfKK+i5q1QjOfB2bMJtHxW0mUFyR7MIM=; b=mq4c1I0Xl7eg53ejzx/8n7LNnW
	W69bV/2A2woKxKiDCYzTKV38fym/Uq03wU/puYz50eXM5qWa1iT6lN0ByFE3Px6j4+J/QLFQUsHcp
	qLber/DImVSl3rgyj6kzine1DLaOIFL6ls1a7fTy/bJsj7q8s4vSf9bxzqFtcyc0RGuskG6oPFlLZ
	chfbwb2KI64aMF9Iz/dKPheEth69ChIDYhxLFfokc88zSAbPX9lsCx1mMyQIRwFa1F3BvgduET7pi
	cmxXcO7YH3uZRJQzt2UiQem9L3k2Jsni70orcdxUystR01ZC1WCNgQ7YUE3VLPWREDon8Q2RRzDsU
	PpvxB7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jPD-0000000EXtk-3CCS;
	Wed, 02 Sep 2026 11:45:27 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jPB-0000000EXtM-1NCp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:45:26 +0000
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1206597a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349524; x=1788954324;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEAVGW99jRYpfKK+i5q1QjOfB2bMJtHxW0mUFyR7MIM=;
        b=Hh7jh9/w43c9ENMLavzIR6k+nALD75jWaLX0VukVcVhXRC7pS5xiye25LvAXolOVVG
         oZTCbnNFFkaG/8JwHoJbKSkj0SJzbn7kV38fqSCOaHxzZ5BhItFKTdNCfahKebOBQJf0
         mAmW2ToCVB7y3Yvi50Pu2XkFiG4KRYHNXqiSM4P8Y/GujSV1tJgbecF51MYoEoHjoaVO
         RIZ91Tcoxi+05LHFUGfTzMmaO3DjA9rR9e3F5LvCT75ghlrZUus6C1b6IscNqCYRlnxA
         ryaTHIX0eb15GErNgd2nNQjgU53/0KZpjP6dAbRWWXobHArIeqqfv0IfjIBfN3U0ehh8
         V/Lw==
X-Gm-Message-State: AFuF++miO6fcoC5k3ubUDcHZmSkrVsqEQhn+YQN+LJ9KL2zh26zPBOr5
	bKPAqsUJIKPuCGtaEQr+RcDKsK7Lk8ZSFxbQ/6Smo9jemRF8xsBCHtZdiU2242G8
X-Gm-Gg: AYBFou2k2lOQVo6VWYAckM2IQOSibJ4VYiuRL+FyII7oyfc/+LbzZPeeaXJMSzb+chF
	3RunbIv71Zpg0LUittMX0oSf6eVEDIAmOPJco1YSOGR1nxzd6667/lw/AeIJdUL1klMhQOVRR+4
	W6sM93I44zrrs1PmWpBXpKKzVPMXHO3UjXfeRprsfRJ9SXBrS8BYdrZqToto7sz68W9tvwC6t7r
	JBv/fFc+6wAW+HB/n9+6SLxQHCdc2YOASDXWpspyCuK090fwjg725L00c4BTdaGNPmSJnPtA5Gl
	U47eFtGdeIu9qBRiqwjUX1qRlbUUg+EUUYwOqVKw9gGVPlHURr8mto+AHvLrF/z4OwWDsKny1ex
	WyDn1HjSF+BwEemIXGBTm7zC/+tITiHVZM7gK9Dfw5pplmm9gEafE69We/FesJ/7XczLRB8gVCL
	39dBoZtnzKf15rLQcth7LkCHA/oMUqTfoSmP1GXP61KcwnfjbcJpEom/KC3PX5M4Z7WmzvxlnjQ
	1rblcIxEpLjlQ0du5KrYRLT7hvKlQ==
X-Received: by 2002:a17:90b:39ad:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39aee13cbc2mr5377920a91.16.1788349523808;
        Wed, 02 Sep 2026 04:45:23 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f2a321sm5757059a91.7.2026.09.02.04.45.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:45:23 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d7200b2e15so10354285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:45:23 -0700 (PDT)
X-Received: by 2002:a05:6102:faa:b0:785:bfc7:26f5 with SMTP id
 ada2fe7eead31-78a1f33dfd3mr1197143137.12.1788349174855; Wed, 02 Sep 2026
 04:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:39:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
X-Gm-Features: AcwNN1XYp2AmohzI9M0wS5P-4B-ztdbPdhzMYLGxaK77VTrG86b4xj0U-T2WG1g
Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_044525_363823_193816E7 
X-CRM114-Status: GOOD (  22.49  )
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

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

