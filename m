Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4809CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TDTgI6ajCuMM2ET04h05guwpbF+9TqbCtf0yb5X4O4=; b=3+8EhSuPYOkhldBJIPC26tG4Ic
	Y7k/k5mPo2xwNUOyG/KK6nN73k6cxLVTON0MYloHbl6OS2r8fHfBwRe4Mg4W8+BPmdAGXVmxsRD9t
	G0QuUrv8pjmYcjLtZm24xD99yK18tePEa7nTiesDpQrkHHsGC2E8SaEOhS1J7JFrKOrxYABjRq9NK
	WGPBuR+SOuX1F615Y7agsanO/X2awLJgJSum5DtqCTdhIp2U4zEBVoGCZBN2GaW/m8Ox7P9FdyhEl
	KxdnFnuFQesOBnL5V7F1XrGcQtryxwI7LpSu/UrqUG6THMIl2BAOEpAYEW95cuqyTm2CXC+C8qw7M
	sFRyi6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhxJ-00000004Sjs-2VyS;
	Mon, 08 Jun 2026 21:56:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhxI-00000004SjK-116m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 21:56:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9C356001D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 21:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611891F0089A
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780955782;
	bh=0TDTgI6ajCuMM2ET04h05guwpbF+9TqbCtf0yb5X4O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lAIgMewmy2AqrOVitnE3g9ROOWy6QFMGahxL4x3X7AiV48Y1UoVpFJDP2+8f3sQlQ
	 bidlXC38fBDBzNMHM9EpBriCsyujrcWYkwZ7+Pnqu0d74mwIKoABVhELattqYP6hdA
	 wHWVHVyrNBHSNMfy0ZeoBBG5RnH/DGAcfMg+0whFVCW0mFBCVD9NW2VkuZpWdcfGyr
	 eo5ZVAWVl4qWeZTT1SoIG50hnNAbkN4228k1svyNX2pXkIn2kiNiQ44qbVn1MvucV5
	 ECAHPP6gBC/GcVy7AiMWI0QIp99nwBTKQT+4vyN2POXnS+VYzZbmzZGJz3KpNG3lEc
	 HZjcNQmMENbgA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa7a7c9711so5377310e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:56:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8kcvjCK9yeKyxykI7OQqDo6QxhHgurQ7PEFEUlUgbL0xXit0fDno7u2x069X/kB45s44Y+EttdLCsMOyiI49re@lists.infradead.org
X-Gm-Message-State: AOJu0YwNo1YWHkrBmSW05mvhw5Sl/qjKvhur9i84+cEr3jFLoiKsPDQZ
	jLJJ7kawil1XqohJ8E4xC0aJojr6NLh8eYfkPJ8Te306wPOU5mAQ1C+aYcKbJTRzvbE/78zxsKT
	7acIrhRAoKeio7kUnH7EVg1shQbUUQ2Y=
X-Received: by 2002:ac2:51d2:0:b0:5aa:6a11:3a29 with SMTP id
 2adb3069b0e04-5aa8865d774mr3483769e87.3.1780955781186; Mon, 08 Jun 2026
 14:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260531162340.5326-1-l.scorcia@gmail.com>
In-Reply-To: <20260531162340.5326-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 23:56:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+5N53QkGppboN+e4YKa4=proo6PJxrbEUndCtB=zAJg@mail.gmail.com>
X-Gm-Features: AVVi8Cchkr8o6T0GxWTVM7rSwLob_b-bRRivY5EIJqXqcLMh2ZhFlagIXrN1y7M
Message-ID: <CAD++jLn+5N53QkGppboN+e4YKa4=proo6PJxrbEUndCtB=zAJg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8167: Fix Schmitt trigger register
 offset of pins 34-39
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sun, May 31, 2026 at 6:23=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The correct Schmitt trigger register offset for pins 34-39 is 0xA00. Valu=
e
> was verified with SoC data sheet.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Fixes: 82d70627e94a ("pinctrl: mediatek: Add MT8167 Pinctrl driver")

Patch applied.

Yours,
Linus Walleij

