Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7A11093168
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPfKdW44wibRLb8oNCfuNh010t8RCFkKs8K3Sdc1EX0=; b=BkVoyQVt1b3m+fravysLduggeJ
	8DO3FZHrSsIHO2BbCVmgBo3UaAUi50NQgrA+4QiLHrhPAtQPybno5xXW6c+hyi/JX9kb1nPzv7w9+
	XFyCHmWPVWGU3yCI/AlglxJ7TWIxxebKAaQrzTlSSkU3+zECiUhcFySgTzXXdZwwydt6LSfo1A1ye
	w+U66PBR/kUH3ycDcwo0brUOWy4BtmIF4G6riof9dmNL6rmKPJv5BgtSb75i1NPsqOGqZSD5xse6d
	aYj3IAru4l0rsQuZr7y1uKH5vazAKa0XJVjuviWQZd2542F5Pv3BT/NZFOwtYesS6ruIy5WXli27a
	3LzK972w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P8x-00000003Yyq-303Z;
	Wed, 25 Mar 2026 14:23:35 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P8v-00000003Yxt-3RRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:23:34 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6028bb29cc9so3854046137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448612; x=1775053412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPfKdW44wibRLb8oNCfuNh010t8RCFkKs8K3Sdc1EX0=;
        b=nD89Ln1QudQmleh+Sk6lkixGw/nhA7l8L+mqAutTTPfWoZHSGTuoD8jS/w4TecASSt
         IPhLgqd0Qk5/rJ3r4WomAz2nbsncXt0r/ymwMpmQUOpAw+kc5jK/hfWiEMOpLnUoN4J2
         Jh0dCEtFzay9Of8+4Q9oOBmFuE2GV7aYPPWfomjEzxjPDHH4gWPhrH5m4aoewQxS2Sff
         MV+288O7wR7pWqqJRUtWcIrhsAbtvvd62YORRDxv22eK28dVHnqlN72GSlZXMooMbTIY
         MFTYBQ0hyizyMsfgxPfGCKmeWZ+0HQB5/Y4hQ/BSi85L4b0jG4ZdENwFGPPuUUM1Xom7
         SRrg==
X-Gm-Message-State: AOJu0YwrxqWQhNBsn6zTd2pzzG7MpqQspMJ5tzjperQklvU3qRaRw5Ei
	Q2s2GGAirYFBbAArGP+RAf1axBL0ODHBJ3x1K92eiQBDOZEowMUig0zvw5bylLKcUhs=
X-Gm-Gg: ATEYQzySsSwfRVQg+ewATP0TjSSFfv8F9K+4n5nYXMgSAtfopSzJJMrlcdZhPfXr1s8
	zNyC3eR0XtSd/Elt+0NMwgOpiwyyE0VC1Ya/2HOMv/JLwO9w7qQchiCN4LMcJKSATZN0oCiq5we
	OWPxVKoqqLsVT6+ElHaSGWbyUVPYga4V7edIZCZL8NGRNRosIQUPcoldyxsSVZqrGen8orEcPPb
	A407Co5yUP529OBxEbq4LFAlPRul6zWGeG+8fvcDcaPDM5saCPXyAEgxhKdIsnaconyOsU9t4B4
	I0k9ZDHhKx4Xl2Yqum0bw5nEMxXW3Bc0naYSosyy+hTWb0XGw4HvkMtoSdGp8cwXSTp+tsPLU+k
	EhpzwVMleOQHqLNTVIMsy+E3P5yE3kBjZ4fenZRTNdb0hZHPAZVeZap5aYLst7UXdloxY5yN9My
	XMd3LGLFgUxYactPjq/g8n8OF2BfGMXuBw8KNnvbDFqMLB1E4N4l9u8bnDhPpn
X-Received: by 2002:a05:6102:15a4:b0:5ff:ae5c:c669 with SMTP id ada2fe7eead31-603890e6cb6mr1938423137.37.1774448612294;
        Wed, 25 Mar 2026 07:23:32 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8539b1sm14134949137.1.2026.03.25.07.23.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:23:31 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6028bb29cc9so3854037137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:23:31 -0700 (PDT)
X-Received: by 2002:a05:6102:2c83:b0:602:9977:a4fe with SMTP id
 ada2fe7eead31-6038723803fmr1660070137.19.1774448611693; Wed, 25 Mar 2026
 07:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:23:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtkSWb7nr6R3XEBtzzoXOEOqE3uAAGSfmxXA3eyaUVOw@mail.gmail.com>
X-Gm-Features: AQROBzC97DFZqc_tdbslxD1CrTlsZtSsIxK87YaGhcNdw9L7AipBy4NtEWpck64
Message-ID: <CAMuHMdUtkSWb7nr6R3XEBtzzoXOEOqE3uAAGSfmxXA3eyaUVOw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072333_882198_D69E868C 
X-CRM114-Status: GOOD (  17.02  )
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

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211F PHY schema indicates that compatible string
> "ethernet-phy-id001c.c916" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

