Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E56C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKMl5Q4rEMPmCxIPeuqakKIQuXk9JJJz0TSzFVQwXWU=; b=gsfAHTQ/qxQrpwD7Lk9zwgtLWp
	ymEI8V7Of9w6V1EL1og00hjDj8oLKhHxvTDnDdrvuxcKOeVOIr+tV+VreitrAiPENvQe2A1VcLGqG
	QU1O74kpg+pof7RcewArJ/yz8syukWX5jUW9OWjf+rlCh/Q1ZRcJE3Pv5qUi0TGl8zdGHaglRlZcZ
	MOqxlRFLl5LFk8qbflMhEPTRFu4gvP7RoF/ceMA9xNCDC23tvnT7+7P4JCdMptHzjGMrCv3sA0w4n
	Xo+EbsWQ4BymacW1JnQBzl/sXIeLQnbYOr0mtctz/WvCef+yIu8rp6GQIe2f7xPCKGxWyOH7AcXvW
	7a1LCrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXaL-00000007chO-3MOf;
	Tue, 17 Jun 2025 14:46:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWvB-00000007TBO-0CQB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:04:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so4441745f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750169055; x=1750773855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKMl5Q4rEMPmCxIPeuqakKIQuXk9JJJz0TSzFVQwXWU=;
        b=UL6sD1cvUaliRu1O3Le95ZHs7TyhjeKA78G3rXjarPeG/WOSTgSRbymBeVbC72psBX
         f8Y9XXG7HVKhaoSgxjfAgMrVvSZLn3uIizoe9bh1zO2QSnwXEq75jCCnNax1gRVGp1GH
         CbZpsqwvBfxwEOdTpKO+hWty9PdZHRCN3x1SpV8DObH8nUfW/rfUFscq7WEOvgaBQ5rh
         bO5xqBMjdRXVaVHfSvwqeXSrGQ8608Q8QK3/xgvJ0DTTuXdwHyQvMU0Tg5E5tg7zStnn
         lh67IbpUmXjaaxaVD7d80XcW+FsTdfIYic6o2tjEUz813RW3YVup8nUtRObhKSdtvgKJ
         cN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169055; x=1750773855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKMl5Q4rEMPmCxIPeuqakKIQuXk9JJJz0TSzFVQwXWU=;
        b=rQSuMV43GVS1LFOptVAf+yKpNyp/R6BkTDQzMx7ZPaktdA7IIGT7EnkcDJvBvPWdiq
         jkKJ2ESjaL/7Rjh+F7CJqabfPDvFxj7suaN0qIslcaZYbR18bOPpX61MBF4S8c2k+bPa
         W6rrDCLb9NJyC/BrewztKINRWVSDIpob0hwpHl01KQBW/sZ5vljbo0LF/jodRYYyatbz
         dr01PArqpCpBELNvIn/3YORSM1oK0zbtz98cmzBJXGSsUrFHUYpUDm1J1tb7HjFQt6iN
         l1vY45ojBsuZTiuBRsFhu8vSoSu0cMk0xzE1Ko+odxUWkP6bmnEoF/+LZiImaSvv+asK
         yslQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Gnf41BLAUad39F2aBledNlHXPlecYiUIzz6FSickJKQCjQELOF38u8rmiBIAjou5U97KgekjNCii/y/09iSN@lists.infradead.org
X-Gm-Message-State: AOJu0YxzL9psNiQOfbS3TDy5CCGNJoxFDYA56ml5EqF7YP/qVjx2acAM
	44RNiu+qtBCtrFoaiRuWTxGam2Cuj40cntptZ4ivdkBfdVcenGbj4cnn6HgpOZsR2Ythi4YfR5x
	ny6EjyABkWqvNkumz4xHp5w9Vs8DN1Cc=
X-Gm-Gg: ASbGncss/3+D/nMFUr79PY1aBIVOYsONvJcAAwraUOifo0n+OhKLt+4Qq9uxXTrCRtd
	JfIIClYw3OzdgOTZzV/cq0Av1huRw/hradXu0GN8PWUdxv/0+LHfL/oiCK28ZLAhjZTAn3pAdHd
	0fvgeQ87u+qmZwC5zTmov3pG6gkYalZksMtglpXLPlTw1Qx/GgL4pH
X-Google-Smtp-Source: AGHT+IG9Pd3zZCpCDabPNRID3/mweW9Pg6ysqzFUrlRGkOmnfcaK7N+ZJqlPWghn7sHnYXCnMj8x0pPDPqWqSZzTk/Y=
X-Received: by 2002:a05:6000:310f:b0:3a4:e231:8632 with SMTP id
 ffacd0b85a97d-3a57239587bmr10636654f8f.12.1750169054933; Tue, 17 Jun 2025
 07:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
In-Reply-To: <CAMuHMdWfsqYvdL16hrbWug3PhK1XrSunaWtduajRzViKBRPeCA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 17 Jun 2025 15:03:47 +0100
X-Gm-Features: AX0GCFvJJnMjoVIyb00wCS8LqVIBgjEn19qTstoiiFay-qVXscEY4QfRsMV1AmY
Message-ID: <CA+V-a8sx9iuUjn3uvSqq3Sd=JeTj_UMyDiLzisrnj1uQw6nbGQ@mail.gmail.com>
Subject: Re: [PATCH v12 7/7] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_070417_086829_BF8A5CE7 
X-CRM114-Status: GOOD (  18.76  )
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

Hi Geert,

On Tue, Jun 17, 2025 at 2:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 17 Jun 2025 at 15:45, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for your patch!
>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
>
> I don't expect GregKH to apply this patch (or better: I expect GregKH
> to not apply this patch ;-) so IMO there is no point in including it
> in this series.
>
Ok, got you.

> Thierry's original version is still in my queue, together with the
> DTS patches, waiting for the RSCI DT bindings to be accepted...
>
I plan to send a new version for RZ/T2H DTS/I which includes fixes
from series [0] squashed and also mainly update the model string from
"Renesas Development EVK based on r9a09g077m44" to "Renesas RZ/T2H EVK
Board based on r9a09g077m44". Is that OK with you?

[0] https://lore.kernel.org/all/20250613135614.154100-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

