Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCC1CF64AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXwxGDz+sQhLdMTJCzGWdGoPN68wRb9kpJwdQDocY0Y=; b=T3LNlusv47pr81gOKJAn/gkl6g
	f6qjywkYVQJT5h8yP0Yrpl2z5JuXMjLTmZmspYP86dIbc7y0CtDVxn0KFXktzuZAgq9B7uvkGj5wX
	rtH+T3TNoOHkBtYLsCv4ZHct6ibNgFcfv90kmfk14tO8dCy1YoluCzdUyaaSGEKRKdTEXjZeNQ/Q8
	3JervHflozWjOohIieHLxtLMZ/pdiC72zMc+z4kFsZ23u/ppbgxUwGmJuW1Yvfaka48gjxyFEDNUf
	RVTKsrw0A4nVbwSAmrktmT22su4nALIVid8Ulj4J6b1BRWgnZdwBCzj3V0Hzved4gs9r2RkN8GOtk
	abxjMigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM12V-00000006QW2-3Npd;
	Thu, 20 Nov 2025 09:33:19 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM12S-00000006QVd-2k6p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:33:18 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3ec46e3c65bso485752fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 01:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631195; x=1764235995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXwxGDz+sQhLdMTJCzGWdGoPN68wRb9kpJwdQDocY0Y=;
        b=nA64PBGRzzjYcGIth+ZF5V+qZHMECYaMprRxk8L0n/PRZ8podyOf/yHAtDzOoY4QD3
         0cZ5tpFVykNBQb6GcsaAAjnjUIsxaul2WLXpWIh166DhA44z5+91TnkBp54o12lDK54c
         tdF1WmUzuXpBtd9155Csk+Gh85/9dFUpVtYbQt/EZOD2nuw+vsAlDGkkzBGqOEH1LWwz
         1i7pZDlaIyYQNyk9METfmdu7dfnoyGQhKZD7sA5OyDG7I9dKyi79YKEUlG07FdSWMtov
         kRcpZ54f590uMT3v9EUHv3uH+QQyi229lLDpwzWCbhl+bgHrsg3fCTjzIsha+mNIrFM6
         m/1A==
X-Forwarded-Encrypted: i=1; AJvYcCXbkcWwWUQmrMl/KiSHpFJ3sbsn0Q3WxEXdfeeTWS0qIGMcw/288fBDkz2HFoad3UdLuCU52WnYq9yQeGELCoaA@lists.infradead.org
X-Gm-Message-State: AOJu0YxiOrq64CJP2WgOl8pzM3miGGGedKQqWomny2VCfbUEKjfV+me6
	+KTZ+CKWPe6uWS892UDpOVBZXu3ybi1OC/davBN8EnqqzIoGsy/37VVBeYohJJVO
X-Gm-Gg: ASbGnctQcsDhomlOTPNbAWI8HpH8p13yB2g/sHQraO9aaYwOJBWZiCwTIEOMmq8WcAX
	nQ1xAgqbMEXqpCE80cSBCieorbSXA/dzgwtwhaJ90kf9ku0CElwi5CaIVq7lhdmCw2QF/O5oz0o
	OEIKVB13WAk9hVEcnIePX2PSecP1bAmaK2WS3MJsRIOSdbZXaqwl9sjtjduD8eKwx6fEBoesqGr
	toi08PaSn0fkirBjpPbfK1RzWTd2EgV3iH9dteQmYQqsJDj3rRD824XJyNJX/MsZvLKxvrGxx6K
	kJp5+8jwFWyUs0QYoqxJoEiNyxpAHPSu9sFni6hA6sWf++1flIwgzBIg9IGxIAplSpuAnf4cadO
	6dEdQ2c7jHHXU0iFZmH5ISukovlRLeLNZioTNTuUtguA8IHw82mfMpyviJ00XN0MfXrGr72MgRD
	NUYAMw2Ff0vrqbwFMxx5v1cxUqDYPSNdDPnvhw9oPuwUzNeGKD9moGMaFW3WWuy/g=
X-Google-Smtp-Source: AGHT+IGquumvC0Lz/bf5oMq8FBKYjiYQapfmYIk8kBwTYC+t6ujFRSaZO+TaBJrSRP1TWM1eM4h6Aw==
X-Received: by 2002:a05:6871:a20a:b0:3d1:e006:e3e5 with SMTP id 586e51a60fabf-3ec9a410e73mr1197335fac.16.1763631194832;
        Thu, 20 Nov 2025 01:33:14 -0800 (PST)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com. [209.85.160.47])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ec9dce7853sm902292fac.20.2025.11.20.01.33.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:33:14 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3ec46e3c65bso485740fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 01:33:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUk4GOBOIdOFSHDv3Q+EpvKgfGLLZw/H9+rXROH70mPk+rMyn2QzFykarwqy/bnq3ceKUwW+M32PBRpDJTyTH/s@lists.infradead.org
X-Received: by 2002:a05:6102:3f44:b0:5db:3b75:a2aa with SMTP id
 ada2fe7eead31-5e1bbc97c48mr726927137.18.1763630694004; Thu, 20 Nov 2025
 01:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
 <20250916150255.4231-10-biju.das.jz@bp.renesas.com> <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUVrxtMoR7nxrVwuDuZRNpG1a41OfRJm521vo=S5EOY8A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Nov 2025 10:24:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNzAWsBKb7q+dhfx+egqL_GebzKPGG7q+8D6-qj-PoHg@mail.gmail.com>
X-Gm-Features: AWmQ_bmUAKQHJxMC6DmZamUNe0bL9hIoM0XydP660aQR-BfX03am7fjSko9ID4A
Message-ID: <CAMuHMdUNzAWsBKb7q+dhfx+egqL_GebzKPGG7q+8D6-qj-PoHg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
To: Biju <biju.das.au@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nishanth Menon <nm@ti.com>, Eric Biggers <ebiggers@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Taniya Das <quic_tdas@quicinc.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_013316_724844_0FD9B611 
X-CRM114-Status: GOOD (  18.68  )
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

On Wed, 24 Sept 2025 at 14:28, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, 16 Sept 2025 at 17:03, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

