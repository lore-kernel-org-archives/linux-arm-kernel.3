Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D23EE208C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IcXy9Yr1bmgOCBMtWQxIGASEP2Lg6UARZMUEBUBfTQ=; b=Tm4PIZZVNo4BS/tk07lXv9VXMc
	4OQOQsM8FC+LENwjs3Hl5HEo0fcYwY6nMbsuDo0pHaq71DzltbRiAMwdAmZ5g7E6Dv7+1M31CR9x9
	N1v7vEuPOvXRt8sCPBLny1C2rITUeWvf82ZONuVcBi7xyuNAx3692ne01z0JYp1wa5kBbgj/BNr3p
	/0wPpbzb5bibOD+Ks0hd6ZbOt8vywlZEbu9nXXSOHuKbNU5PRYyrp9sjp4BoP4uY8HOWbOulb21s1
	238QisYhgSYJpFpZVjde0BBTYnDgw/UYaS+8P0kzXT3SxreFlZyv/vF+OFXGAaC3EIO/QoPGB/hRj
	LA6z4lhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJhA-0000000BDo6-22qm;
	Fri, 06 Feb 2026 11:08:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJh8-0000000BDnq-21pF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 11:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A21166011F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 11:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE9FC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770376093;
	bh=2IcXy9Yr1bmgOCBMtWQxIGASEP2Lg6UARZMUEBUBfTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VnHj3k04plpmByPMUFVHrZ+eswARscLBM8JXPWDQPbCvXKxR7ymvPCla73CtYD0T7
	 CkCJak+5j/KgjdelQqxhPCg4qQI9mpsjAC8lw/UtFvHwJugB9jI7ulYdBlIXzGQ7dW
	 9BZQgepOF5xctOnSwTekCwQRmLw+QQZV+7X+wOlup3QIU/xFgu7HouYMwBRQw1ays6
	 dHpgvgVRYvr/UuV7dhhwhu38KBwt2pREH24tXomxtY+x50sYJt0phdolYE11N14P6G
	 2dWha7JWEu1bSsgS1u8kNkuPFsDF+Ld5gC0X99ccOXngRD0mabLEjZ0Du+wBRHaTc5
	 9BfqJinrqVGfA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7950afac0ffso26128407b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 03:08:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/NE3vJg16DybRSAqbjxJsryZYeIvvIb/cNZYNWs3GCHo1nHDVoMsnp2WzVvCWyCSNv6ej8zlXJ8sRJPMFR1L1@lists.infradead.org
X-Gm-Message-State: AOJu0YxPXfV0pcCu7tFFxjywJbivtheY0g5SI9Gg2FzL/8eT9rs7mk1r
	PKCMSY8xkvk7tozd+BWxs7ponNJA8FPVsEasodwr6/3e/3dLYt3FFDZ7fa7SYTfaDbHqdFewebW
	RDSgEZ+yCvOx1xwl1n3qezxBhAYhSJ0k=
X-Received: by 2002:a05:690c:6ac3:b0:794:cde8:f486 with SMTP id
 00721157ae682-7952a78c618mr20998827b3.32.1770376092620; Fri, 06 Feb 2026
 03:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20260203-craftsman-battered-3491ff68f462@spud>
In-Reply-To: <20260203-craftsman-battered-3491ff68f462@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 12:08:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLm-ceCdKEjWHqVKzFvbq1J950wZ1Wohk5TnCeCAzY_xQw@mail.gmail.com>
X-Gm-Features: AZwV_QjSGZo1UEVq_Fy4EfL7sUjArnL1OyzgdN-ABSqIc2Y_2O35gXyocgJHDUo
Message-ID: <CAD++jLm-ceCdKEjWHqVKzFvbq1J950wZ1Wohk5TnCeCAzY_xQw@mail.gmail.com>
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to
 amlogic-am4 driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:


> From: Conor Dooley <conor.dooley@microchip.com>
>
> pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> function, and really belongs in the amlogic-am4 driver. There are three
> reasons why.

Patch subject tweaked and applied!

Yours,
Linus Walleij

