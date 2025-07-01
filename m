Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D62C8303B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV/QvZy0Nb0wuzQr0ypBrH0VBcR+Ic5t7RZaWoR81tc=; b=FKnGpTQvvc6mc6lL9/S6PJBUnW
	lJ1NUPIacQNQc3WlzLzmOEM7fuA92n1CPkBOGZc3RsjpjVLkWBwdcdQ6Xmd48pICIu9sdgWX0Sxtn
	BsbdSNUhZblFpz8U6RL7AIdPJ/IXJwqxtnGkx18ajuDnVSLqziECX2UJCTx552Ax5le4N6A3MTVgM
	JXkMdyw+ZkfyUyHGWGFypASzKaLozgEtltSV7OXWUn3I/yWOf/9E5sNbtRI1igJw4yNYsm/AGcf9F
	pO0PUtJvIlGFBtitfqczujBZJQZZFSyLJ+oJwAg/IZgxYltm/2F53dxXpC3aoxU06IFjtcwDUdU/N
	bC7IzU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcYQ-00000005paE-2DFn;
	Tue, 01 Jul 2025 15:05:50 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWb5G-00000005WX9-14Vh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:31:39 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88173565536so4508181241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 06:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376695; x=1751981495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV/QvZy0Nb0wuzQr0ypBrH0VBcR+Ic5t7RZaWoR81tc=;
        b=N3SH6llAa3Yl/NxrAWTlj4p2KhnWbHodfxvokDLjR1AjlKab4dHhXgDK4Ja81uXiRH
         /6kSJgrUDqC6S2lfBvWAnLrcvkLu5amJWBMMgYd+i7+maxgH0OxjrS9aNEfM55QlgFPJ
         gOM2KFT9de9I1ivjG1uhxn0qugdQT/7a88B4XjlewJL6L40NndxrPbnWHhqthlu9LgOI
         FWANpnUhmfx5yuy8XKAjHbyFRKJwb5fWQCJS+dU6+zuRH3FlMX/roSbDlicHyU+bLk8Z
         m/EX0wpiVeUTZDs3soct0pJRscSSQbWrQHBhKv8w4cJtN4lOKlek7VK7eQX1xXBn/T0m
         Vdqw==
X-Forwarded-Encrypted: i=1; AJvYcCU62agrmnJecvX1+bnITwj3qFA0GtygaaCFmsIy0fc8/YcyAgV2d4YFNedEsaBk40T1aug65RjVM1VCTmYctBNV@lists.infradead.org
X-Gm-Message-State: AOJu0YwBmSNB+sR/CYVDjc14IffSVECVXRnFxQR3HQhqlRoZE+EDT1CQ
	oydl63cdr6O+g1VtAwU2LdORE5jfqsR9cDFf3TqNAau7fyjZnLUUHi5+AHmgE0qg
X-Gm-Gg: ASbGnctFwaHEVY+kjMMKK5ApHmFr1Xk9TB9N0/F4TC2qZEyd05O/+PvjYp0dVV95WNZ
	sSaYhr6H/JEdJVteiBBYkyyjqRPOSA5uaEwqKT3OsfihPuNF6yO/jGFQ658GzaPlMgiSh7oOJc1
	ydHbRb4Uv1ibK9B5J3bfIXSZQwNEvF1KXrtvOkm92zfdtzsV5jx62rvY+ig8iRA/nUpPXeizy1r
	SC53ctpHfW/r1Ndn+gbQzrc1mf6dKslthmj/V8ANs6OJNyqVEMw2C6fnAlGYcYpuHlgPXl1HhPX
	2WIjj3+N3glZ9aZqM1DHDUO1DFBO/hs0PMXhm3k0nFro8Q1/SDtlhVNRNgMr0s+q39fnIl+iS/9
	3jtn+LZYUb5Keu+aljjf5qcPhgBmrD3FtowA=
X-Google-Smtp-Source: AGHT+IGCNt5aWPs+0zmPzMBbH+IY9OmrLEqtmJnZ0Unu1xvpNABv4CncM8+US6NTE9YBW4y+mEVoAA==
X-Received: by 2002:a05:6122:278f:b0:524:2fe0:61bc with SMTP id 71dfb90a1353d-5341c8fc187mr2502566e0c.5.1751376695190;
        Tue, 01 Jul 2025 06:31:35 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53309075b60sm1732057e0c.5.2025.07.01.06.31.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:31:35 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87ecdf5f326so3575231241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 06:31:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXVgzbxDAAzG/gf2tzm21MQly+HN+KQe/3ZXqxMSqDjUuUiAXXMVV2kIws6X/5ABYXRDgJ1nSdXj8nbm0o1BJf@lists.infradead.org
X-Received: by 2002:a05:6122:311c:b0:52d:cc6f:81a2 with SMTP id
 71dfb90a1353d-534256115admr2267428e0c.6.1751376692001; Tue, 01 Jul 2025
 06:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com> <20250624192304.338979-6-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250624192304.338979-6-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 15:31:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmQTbXYvZXi+1MGxfgEL1=JKVCehm37OYPVAo=dnJgoQ@mail.gmail.com>
X-Gm-Features: Ac12FXxg0c3Tvb5Xd7h_l51_d8L50Cpq3cEZgNBKA60f6RhP9PcpNZoeo04WdGQ
Message-ID: <CAMuHMdXmQTbXYvZXi+1MGxfgEL1=JKVCehm37OYPVAo=dnJgoQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: defconfig: Enable the RZ/V2H(P) RSPI driver
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_063138_289876_0D3DDAE7 
X-CRM114-Status: GOOD (  17.63  )
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

On Tue, 24 Jun 2025 at 21:23, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Enable the Renesas RZ/V2H(P) RSPI driver for the benefit of
> RZ/V2H(P) based platforms.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17, pending acceptance of
the driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

