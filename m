Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F667CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=; b=bdUWsJyOxGRwzUjV4wxfcyk9+5
	VIi9a8G59pCCb+527dXr6jM3kHcYPB24VopOnl09a6KH/2lZadAzTrW5v5mNG3W6e07EqkZHHLMn/
	7dZoQV0OrO1yHTN081KJXz2JZaCZBTAYtrzZEzx4wN0mUQiGRxTRMgDqXIn8I36sVqBpBdN9jO1AU
	pJYrZU++uqXwak10r2PcewdXY1C4gu+g2rISkIO8Ql5X5TiwdPigUDwYHl2pEgigA6pB0b4Z0PJAM
	4YXemzSMibZbyZEWhRC2b2Qgk7y0HmYjd07362mRhp5zB+nPmiShV/s2j0WNOsKmjFzIZBSY0u1nq
	OHYG0vHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfW-00000008M5S-34CS;
	Mon, 25 Aug 2025 14:59:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWp8-000000081yc-0fMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 13:01:23 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce5243f6dso4702511e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 06:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126880; x=1756731680; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
        b=cqDgJys9XtYEfjGy/BJkJ7ZmfRkuMtIncdTJCv2LeGI+LHmIZHNt8iniUJWoVw8qt2
         8iIBCQ46cQXulti8LTWm8xl+8treGA1eRb/IhYO7z4R/oh6miGfFKVZ1qaVfMtKiEmdq
         1ZE2KVh36P5ubUMZHpcYYhzMbpGzOIWLYUF33y+DfVgO6lkD8vJ8J55YFGcdcNY6xHOJ
         /HsjDEQLOLq6LSXp66z4K7iYy7kqDjYxb/5TerGs3unEzM8RRXcuiach3s+lwb2+f5nG
         6MmJi454GbB5OhOvnflxljuLDbwQnoYMcAYoT/ArIma7W8RsBaAF+vCTk+nRmRU2xIzR
         Iang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126880; x=1756731680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
        b=U9hf/oeEb1BPEGY3oEerxQRHpO9Xi+Wn3FYRk9yq5S3IIDngsIE0H+EYb1Sb5u+i50
         YzUZciSmcVFIA+TLH2kHs+MMAYQXFfQ+BCyxOjTkBIkWZ7Wy82CYN+AgF95khaaBgkIB
         J64EKgk37XXEmG7tE34oUCSHpsHOeYfqp8Efd5B9LaATMATwCN9aPs8h5np3uMgkkTki
         UxTjunCIiQE8zNcQ4LAE9+vlawu+v/kemL0DZi3CDl/jBa4K55tAZUvrAGn3L/CLSJsF
         FxHg9Kp6Q3V4KP8ApoDz4Vqu5fp9LjLOJOUdIm+8SBSEbyblCVRSn1eT0EYu39Owpgd/
         v5mg==
X-Forwarded-Encrypted: i=1; AJvYcCXDaNrUX74QmP7l21QqnvcWbD8q0SoiLAczEqFAfxn9BcQd0WVKI+4t6v8Smi0PAMaN1gPG7sy9+TQSxBk/Ea6O@lists.infradead.org
X-Gm-Message-State: AOJu0YwXPdyEnyHJ9cmXYVCv681S2VXrzXN12FJe0M128BFRP493qT+8
	3H8QBFXEobYn+JbWPhBIinpIkD255hCWJQK8o35FxZajxVQ/NFKm80fMHWJEsRM1ShntpjAFWzC
	cPk+j1CnJO3s1EgmUvcx32ICeRXmryi5zf+eJmHFDzQ==
X-Gm-Gg: ASbGncs8u1v8zoFyODhxZqJD/PkESrewV/Sj1NErY2isO9jUmdeg2UHmrs1XAxn2AU5
	jHoDVHpig44ln+oxzVwR3id01XykNIKwyDMU5MCsPWOlutZGjaJ546oQL5kQd1ANW4679KOk0XP
	HaFP+obCDUZ7/9hlo8ETUoFuJf1alnFNFnQyhOPT5UfgtUJ4UuHGJTxpAheHxaK9ulTBGPpyltv
	qEeiJJJCBm38YT5gLD1O7nE6SYYvqcEuetSENP4CUL6D1AMDWbM2+PbWEAf
X-Google-Smtp-Source: AGHT+IH5N5gh1e2Wid0aMR0FMRyM9pyDqp/u65+mskc935zM8TPlDDSTI+H4ckU5CTPXH5byLfWl83YU1oyPWy+p/Uw=
X-Received: by 2002:a05:6512:135a:b0:55e:11ca:1549 with SMTP id
 2adb3069b0e04-55f0c6b5589mr4032238e87.19.1756126880025; Mon, 25 Aug 2025
 06:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
 <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
In-Reply-To: <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 15:01:09 +0200
X-Gm-Features: Ac12FXwiA1VNOuENMZgX8e0TVhBXubdvgS_jWd_PUQ_1hAXM92SKRJ_pWmQYzEg
Message-ID: <CAMRc=Mcsvkt1OJfVmB2peQJPpEKqFJ=6=86m=fd+VOEoMGf8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] soc: fsl: qe: Change GPIO driver to a proper
 platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_060122_194409_253A435C 
X-CRM114-Status: GOOD (  14.75  )
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

On Mon, Aug 25, 2025 at 2:56=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> > In order to be able to add interrupts to the GPIOs, first change the
> > QE GPIO driver to the proper platform driver in order to allow
> > initialisation to be done in the right order, otherwise the GPIOs
> > get added before the interrupts are registered.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hi! I retracted my review tag under v1 because...
>

Ah, sorry for the noise, you did that in a separate patch, please keep my R=
-b.

Bartosz

